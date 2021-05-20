Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E7438B7EB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:59:05 +0200 (CEST)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljooy-0004zD-Ca
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljokR-0007sC-1C
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljokL-00028U-Gq
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kzMtkR6uv7VLUNg1WRMtbfgBr95OnRa4xJUGiwWDpYc=;
 b=RHBMmNfsAhmVHJaQaBiVs05jQxXtDqcDFKKffoAyrV9/o7hT1oEZlIgHXKN1ZucYQqhIlt
 qUsWAAk68xyRtdCbfnvOpQZwvQv6ICXsfDdA9UMUzAkFG30jywjMJelsywXBkXz1ZpVD8p
 VF3MShVgZEzgd4JV+pPJGbEFTHcsPcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-IYVV3_MaOnaCaiuP8oY45w-1; Thu, 20 May 2021 15:54:15 -0400
X-MC-Unique: IYVV3_MaOnaCaiuP8oY45w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5287F188352A
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 19:54:14 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CDEB10013C1;
 Thu, 20 May 2021 19:54:14 +0000 (UTC)
Date: Thu, 20 May 2021 15:53:20 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 05/19] i386: introduce hyperv_feature_supported()
Message-ID: <20210520195320.dtamvdimo45jpwu7@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-6-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-6-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

On Thu, Apr 22, 2021 at 06:11:16PM +0200, Vitaly Kuznetsov wrote:
> Clean up hv_cpuid_check_and_set() by separating hyperv_feature_supported()
> off it. No functional change intended.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 49 ++++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f791baa29acf..ba093dba4d23 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1107,13 +1107,33 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
>      return 0;
>  }
>  
> +static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
> +{
> +    uint32_t r, fw, bits;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
> +        fw = kvm_hyperv_properties[feature].flags[i].fw;
> +        bits = kvm_hyperv_properties[feature].flags[i].bits;
> +
> +        if (!fw) {
> +            continue;
> +        }
> +
> +        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
>  static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
>                                    int feature)
>  {
>      X86CPU *cpu = X86_CPU(cs);
> -    uint32_t r, fw, bits;
>      uint64_t deps;
> -    int i, dep_feat;
> +    int dep_feat;
>  
>      if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
>          return 0;
> @@ -1132,23 +1152,14 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
>          deps &= ~(1ull << dep_feat);
>      }
>  
> -    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
> -        fw = kvm_hyperv_properties[feature].flags[i].fw;
> -        bits = kvm_hyperv_properties[feature].flags[i].bits;
> -
> -        if (!fw) {
> -            continue;
> -        }
> -
> -        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
> -            if (hyperv_feat_enabled(cpu, feature)) {
> -                fprintf(stderr,
> -                        "Hyper-V %s is not supported by kernel\n",
> -                        kvm_hyperv_properties[feature].desc);
> -                return 1;
> -            } else {
> -                return 0;
> -            }
> +    if (!hyperv_feature_supported(cpuid, feature)) {
> +        if (hyperv_feat_enabled(cpu, feature)) {
> +            fprintf(stderr,
> +                    "Hyper-V %s is not supported by kernel\n",
> +                    kvm_hyperv_properties[feature].desc);
> +            return 1;
> +        } else {
> +            return 0;

The reason for returning prematurely here when
!hyperv_feat_enabled() is not clear to me, but you are keeping
the existing behavior, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

>          }
>      }
>  
> -- 
> 2.30.2
> 

-- 
Eduardo


