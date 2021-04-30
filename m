Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043283703F2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 01:11:09 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lccHs-00024t-3e
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 19:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lccGH-0001Mq-Ft
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 19:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lccGE-0006hy-8o
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 19:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619824164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gsBe6XAlxa46yjZ2yN3X0goRHeQMWpHArUnuTuLMM/E=;
 b=dwFxUMKFuDfY0QGycgZ3iCcVdQP048KN/yxrJ4Tj1BR4K8r5vv0KP+2LMpYtL8rGcl/LiG
 6sEnmzvC5dfXykmIjUgSW06IS/+2so15x3NRWpLmTdNG+FEDM48Bi8+ZiG3LtV0xTTPPBh
 CVEuKPD8wpF9kc0nj373/JR/CGH0r7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-__F-LbwxNrKrLXIlzGDucQ-1; Fri, 30 Apr 2021 19:09:22 -0400
X-MC-Unique: __F-LbwxNrKrLXIlzGDucQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A95496D582
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 23:09:21 +0000 (UTC)
Received: from localhost (ovpn-115-66.phx2.redhat.com [10.3.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FADC76E31;
 Fri, 30 Apr 2021 23:09:21 +0000 (UTC)
Date: Fri, 30 Apr 2021 19:09:20 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 02/19] i386: invert hyperv_spinlock_attempts setting
 logic with hv_passthrough
Message-ID: <20210430230920.l5o2czln2yb6cbvf@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-3-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-3-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:13PM +0200, Vitaly Kuznetsov wrote:
> There is no need to have this special case: like all other Hyper-V
> enlightenments we can just use kernel's supplied value in hv_passthrough
> mode.

Worth documenting this behaviour at docs/hyperv.txt?  I was
expecting all properties set explicitly to override
hv-passthrough.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ab073a5e9c44..afd173514da1 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1256,11 +1256,7 @@ static int hyperv_handle_properties(CPUState *cs,
>          c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
>          if (c) {
>              env->features[FEAT_HV_RECOMM_EAX] = c->eax;
> -
> -            /* hv-spinlocks may have been overriden */
> -            if (cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_NOTIFY) {
> -                c->ebx = cpu->hyperv_spinlock_attempts;
> -            }
> +            cpu->hyperv_spinlock_attempts = c->ebx;
>          }
>          c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
>          if (c) {
> -- 
> 2.30.2
> 

-- 
Eduardo


