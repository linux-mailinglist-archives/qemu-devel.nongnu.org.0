Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F92D17E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:53:07 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKh8-0005cQ-Bb
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmKda-0002ta-Pr
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmKdY-0002Ky-IG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607363363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Adb3p+ijb/V8jVQUMIB0SE35Dp3zHyjN1xl9vV9Dhis=;
 b=TDH49eDGZ+pQB55NkTD7a5Pk31658v/IbSU8TGsN0ByiUxXU361etFULvg6CmFLEPJ+n0+
 AjoBA11OcQvOVr/9ICnz+xiJBIUB74B/VExBdumnyAkjaXY1QgzDPtsoKS7c8OBIRGjBP3
 mPGVHFRGjtPYlOwG9FqOPR6boe34Rrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-j6ADO0hBNXC0N6Pp_NLXVg-1; Mon, 07 Dec 2020 12:49:19 -0500
X-MC-Unique: j6ADO0hBNXC0N6Pp_NLXVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28FE1C287;
 Mon,  7 Dec 2020 17:49:18 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E449910013C1;
 Mon,  7 Dec 2020 17:49:17 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:49:16 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Message-ID: <20201207174916.GD1289986@habkost.net>
References: <20201207084042.7690-1-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201207084042.7690-1-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 09:40:42AM +0100, Claudio Fontana wrote:
> cc->do_interrupt is a TCG callback used in accel/tcg only,
> call instead directly the arm_cpu_do_interrupt for the
> injection of exeptions from KVM, so that
> 
> do_interrupt can be exported to TCG-only operations in the CPUClass.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/helper.c | 4 ++++
>  target/arm/kvm64.c  | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 38cd35c049..bebaabf525 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9895,6 +9895,10 @@ static void handle_semihosting(CPUState *cs)
>   * Do any appropriate logging, handle PSCI calls, and then hand off
>   * to the AArch64-entry or AArch32-entry function depending on the
>   * target exception level's register width.
> + *
> + * Note: this is used for both TCG (as the do_interrupt tcg op),
> + *       and KVM to re-inject guest debug exceptions, and to
> + *       inject a Synchronous-External-Abort.
>   */
>  void arm_cpu_do_interrupt(CPUState *cs)
>  {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index f74bac2457..2b17e4203d 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -960,7 +960,7 @@ static void kvm_inject_arm_sea(CPUState *c)
>  
>      env->exception.syndrome = esr;
>  
> -    cc->do_interrupt(c);
> +    arm_cpu_do_interrupt(c);

How can we be sure cc->do_interrupt always points to
arm_cpu_do_interrupt today?

arm_v7m_class_init() (used by cortex-* CPU models) overrides it.
Those CPU models as "TCG CPUs" in the code, but I don't see what
makes them TCG-specific.  What exactly is the expected behavior
if using, e.g., "-cpu cortex-m33 -accel kvm"?


>  }
>  
>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
> @@ -1545,7 +1545,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
>      env->exception.vaddress = debug_exit->far;
>      env->exception.target_el = 1;
>      qemu_mutex_lock_iothread();
> -    cc->do_interrupt(cs);
> +    arm_cpu_do_interrupt(cs);
>      qemu_mutex_unlock_iothread();
>  
>      return false;
> -- 
> 2.26.2
> 

-- 
Eduardo


