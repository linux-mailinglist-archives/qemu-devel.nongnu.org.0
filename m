Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0885A36594A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:53:56 +0200 (CEST)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpt5-0000Vc-2e
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYprU-0007a7-UU
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYprR-0007DQ-A6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYeq+TMGy+NPGepti79Kpxo6RUPmeA/T7Pnd4pE1X3c=;
 b=Mb0/OmrkSrIwVC3E4i5xw3c0iwvxsB3qEs+dXIJPmtzzAFQ+ExRUxqvdRHo/1RwA/SwaJx
 sOoQ36yEuUmHizVYcr3vnWJbpmLouEsd2eaU20PoBxdY6AuTY1xPI8lgj+eQG3/LvBsbsG
 WpjP1OIgtAZ4Ls7/hIKgiMWYUZ+XiAg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-mvmE4sGsNHSVcDdYY09Mdw-1; Tue, 20 Apr 2021 08:52:10 -0400
X-MC-Unique: mvmE4sGsNHSVcDdYY09Mdw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so8227553wrb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZYeq+TMGy+NPGepti79Kpxo6RUPmeA/T7Pnd4pE1X3c=;
 b=BMu5maFpNGLKtfuOarWoE/wXkUfi9PmO4ft4EnVDn/GaJfL1wlaWpYMtRX6OKuUhGv
 wczE0iCkwdBP7Hc8+cxvriZK55RnQ3UMUXOKPz5u1c1l3ltSPtbExQNqJD8Nhb0fXF7T
 IMh7oyQb0LojdU2SD1B9FfGR+r4nY9a4DJML3xRJFd4UPa4m60hcNYhDWPAMhNdAF7gq
 MdJEtLtuN8xUczJkJSQy9UXthpX63eqahk18DlpftzgM1gl/GpyEvz90RVVfAbkH7tLt
 9xL1M1J9kwwxmenCIGr2ZyLmfs3LRBMLkMagUvGWH0/B7Rtdlf9kplvA/PFmvP7pNcK3
 84tA==
X-Gm-Message-State: AOAM5334EPZsxT6cguypdEzZM65jWl2phSCavB1Mi7/dpTZXXN+kxqSB
 M7MEKiDcmzsY/PKGx7T0f6SjUBFwuvM7dz34UKLRk5pddf9XVDWboRvhGepkFdgS/t4rlj4Hxyu
 sGaYet81hT80J2p4=
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr4403129wmb.2.1618923129609; 
 Tue, 20 Apr 2021 05:52:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVEi/rERHcaVhX7onPP4vJ5+EAhm75IkKLVg7f9ZBBGVTV/lAQBaPjM+ug1jIBlPpH344syQ==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr4403107wmb.2.1618923129412; 
 Tue, 20 Apr 2021 05:52:09 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 c2sm3271805wmr.22.2021.04.20.05.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:52:09 -0700 (PDT)
Subject: Re: [RFC v2 03/13] hw/s390x: tod: make explicit checks for
 accelerators when initializing
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-4-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <472bb6ed-a48e-08eb-0fe7-b549aec3c0eb@redhat.com>
Date: Tue, 20 Apr 2021 14:52:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420103616.32731-4-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:36, Claudio Fontana wrote:
> replace general "else" with specific checks for each possible accelerator.
> > Handle qtest as a NOP,

^ weird line break


Reviewed-by: David Hildenbrand <david@redhat.com>

> and error out for an unknown accelerator used in combination with tod.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   hw/s390x/tod.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
> index 3c2979175e..fd5a36bf24 100644
> --- a/hw/s390x/tod.c
> +++ b/hw/s390x/tod.c
> @@ -14,6 +14,8 @@
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
> +#include "sysemu/qtest.h"
>   #include "migration/qemu-file-types.h"
>   #include "migration/register.h"
>   
> @@ -23,8 +25,13 @@ void s390_init_tod(void)
>   
>       if (kvm_enabled()) {
>           obj = object_new(TYPE_KVM_S390_TOD);
> -    } else {
> +    } else if (tcg_enabled()) {
>           obj = object_new(TYPE_QEMU_S390_TOD);
> +    } else if (qtest_enabled()) {
> +        return;
> +    } else {
> +        error_report("current accelerator not handled in s390_init_tod!");
> +        abort();
>       }
>       object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
>       object_unref(obj);
> 


-- 
Thanks,

David / dhildenb


