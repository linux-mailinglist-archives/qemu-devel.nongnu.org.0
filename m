Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18E2226AD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 17:17:23 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw5dS-0007wD-In
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jw5c8-0007Lh-G3
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 11:16:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44128
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jw5c6-0000lZ-VY
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 11:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594912558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WjY7NOu99wbZfIistdwo/+2Oj1lqFS/sV+H/SnbV2jU=;
 b=aloKnxdSi4liCehqjhUjHWeZ6ieJMKAIsI4XaVWYRJ2agUzrhp+MT0Mn2qtv75MY3tNaBt
 V8PgPrf/2SHYYPSOba0Do5V1cZ1bF2V8pkI47bISvoub8gCiBnJlUYAxWlink8eHyJPcc+
 O8Vn22LxYG6An7VtSOEOimrwcuhyEqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-GbA_8CwUPEu-PA8sP131DA-1; Thu, 16 Jul 2020 11:15:56 -0400
X-MC-Unique: GbA_8CwUPEu-PA8sP131DA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 686F2100AA34;
 Thu, 16 Jul 2020 15:15:55 +0000 (UTC)
Received: from localhost (ovpn-119-232.rdu2.redhat.com [10.10.119.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2769717D04;
 Thu, 16 Jul 2020 15:15:54 +0000 (UTC)
Date: Thu, 16 Jul 2020 11:15:54 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH 1/2] i386/cpu: Clear FEAT_XSAVE_COMP_{LO,HI} when XSAVE
 is not available
Message-ID: <20200716151554.GL1274972@habkost.net>
References: <20200716082019.215316-1-xiaoyao.li@intel.com>
 <20200716082019.215316-2-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200716082019.215316-2-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 09:29:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 16, 2020 at 04:20:18PM +0800, Xiaoyao Li wrote:
> Per Intel SDM vol 1, 13.2, if CPUID.1:ECX.XSAVE[bit 26] is 0, the
> processor provides no further enumeration through CPUID function 0DH.

Can you explain what's the bug you are trying to fix?
env->features[FEAT_XSAVE_COMP_*] is already initialized as zero.

> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 1e5123251d74..f5f11603e805 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6261,6 +6261,8 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>      uint64_t mask;
>  
>      if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
> +        env->features[FEAT_XSAVE_COMP_LO] = 0;
> +        env->features[FEAT_XSAVE_COMP_HI] = 0;
>          return;
>      }
>  
> -- 
> 2.18.4
> 

-- 
Eduardo


