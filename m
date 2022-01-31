Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E14A47E4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:17:19 +0100 (CET)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEWYW-0007bK-EA
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1nEWBp-0001Yr-1H
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:53:49 -0500
Received: from ciao.gmane.io ([116.202.254.214]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1nEWBn-0004nh-2e
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:53:48 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1nEWBb-0004Bw-Ie
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:53:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
Date: Mon, 31 Jan 2022 12:53:31 +0000
Message-ID: <cun8ruwrrqs.fsf@oracle.com>
References: <20220129094644.385841-1-leobras@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Cancel-Lock: sha1:XcFyhS4kY/QowaRiNMLyTadqOxs=
Received-SPF: pass client-ip=116.202.254.214;
 envelope-from=gceq-qemu-devel2@m.gmane-mx.org; helo=ciao.gmane.io
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Saturday, 2022-01-29 at 06:46:45 -03, Leonardo Bras wrote:

> The following steps describe a migration bug:
> 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
> 2 - Migrate to a host with EPYC-Naples cpu
>
> The guest kernel crashes shortly after the migration.
>
> The crash happens due to a fault caused by XRSTOR:
> A set bit in XSTATE_BV is not set in XCR0.
> The faulting bit is FEATURE_PKRU (enabled in Milan, but not in Naples)

I'm trying to understand how this happens.

If we boot on EPYC-Milan with "-cpu EPYC", the PKRU feature should not
be exposed to the VM (it is not available in the EPYC CPU).

Given this, how would bit 0x200 (representing PKRU) end up set in
xstate_bv?

> To avoid this kind of bug:
> In kvm_get_xsave, mask-out from xstate_bv any bits that are not set in
> current vcpu's features.
>
> This keeps cpu->env->xstate_bv with feature bits compatible with any
> host machine capable of running the vcpu model.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  target/i386/xsave_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
> index ac61a96344..0628226234 100644
> --- a/target/i386/xsave_helper.c
> +++ b/target/i386/xsave_helper.c
> @@ -167,7 +167,7 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
>          env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
>      }
>
> -    env->xstate_bv = header->xstate_bv;
> +    env->xstate_bv = header->xstate_bv & env->features[FEAT_XSAVE_COMP_LO];
>
>      e = &x86_ext_save_areas[XSTATE_YMM_BIT];
>      if (e->size && e->offset) {

dme.
-- 
You have underestimated my power, as you shortly will discover.


