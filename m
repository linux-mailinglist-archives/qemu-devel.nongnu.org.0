Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD64E3AE6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:43:21 +0100 (CET)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa6q-0002GT-4m
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:43:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWa3g-0007GS-7H
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWa3e-0004ZK-KD
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647938402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rbpRbLUCXBZnW/BilEmudFdxpT5qDJEHoM1zEVABc4=;
 b=J1Imv/GDiuhGiUexxfKrUvuLU7CsNmSR9fT+m+uEomqxsas7AS1STkmYZKS6Z0+vr1ijoE
 Ncu1Seg0nWQidc511+Vk6dJKZQJTRhIpYrVBpL4ua9kFg4+A4AuMMZRR8S/DirSrXxkD2k
 NiJyL9QGwIdHrZVLoUVNRHfejC0T4jg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-M3l5rjTIN4iJ0Ml_fktVfQ-1; Tue, 22 Mar 2022 04:40:01 -0400
X-MC-Unique: M3l5rjTIN4iJ0Ml_fktVfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so714695wmh.9
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4rbpRbLUCXBZnW/BilEmudFdxpT5qDJEHoM1zEVABc4=;
 b=e9rp0e08yl3OPmJ5FnD1gMlR41mRf2bbY58rat8Kwpr74s/V3QkRo7ymUAR9dPwnfa
 /uuHT1hOwRvMW5UHoO5FaPl+3E7+ZPFYonZ1MCarXVVwoIiNlMLby/MjU3FXq5CuvhiX
 wjT1ocYH8Kzo2PmRam1CZ6BO2Kb3Iwc83HK5MTcVxQpKy+6JcvL/cGRjcxG4wA5O+tYK
 jXMCobAWlOsqvClTd+AzLgPT8A0KnzI2++/G86R6pLeL8CZOORyW0YyAH+50SmX0qDxa
 YarpcMSf8UOOW2XISIFjjQygPr3iPHWkzIMg7REbIWzoVNnAttdtCWIefEdGG+X/G0We
 g2Gg==
X-Gm-Message-State: AOAM533f2xheyldz4FVaoZ1rO5ouHcAyz+P9C68WHHnu7mL7LUjtpp36
 ZCN2onppx8DcRaIc5x+6l9Z0UQT1Z4mJpaegJ2tfvh7rdhN9AddM3cdre9vbI/uNNAv73IJt/pW
 v8ShHaSXqB+YUdhM=
X-Received: by 2002:a5d:6041:0:b0:204:1c96:c04d with SMTP id
 j1-20020a5d6041000000b002041c96c04dmr4721620wrt.541.1647938399983; 
 Tue, 22 Mar 2022 01:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJHFMc3Fa0wAhtYA/Yf7a3GdnQnnNaPYV+dwn5UoLtjnwVgxhyDJxqCBoMTmQKA7vWUo493A==
X-Received: by 2002:a5d:6041:0:b0:204:1c96:c04d with SMTP id
 j1-20020a5d6041000000b002041c96c04dmr4721602wrt.541.1647938399689; 
 Tue, 22 Mar 2022 01:39:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 o27-20020a05600c511b00b0038c8fba0bb3sm1332318wms.15.2022.03.22.01.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:39:59 -0700 (PDT)
Message-ID: <bbc6d9e7-4271-d812-23e1-f8947a5eddd1@redhat.com>
Date: Tue, 22 Mar 2022 09:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 11/11] target/s390x: Fix writeback to v1 in helper_vstl
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-12-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220322000441.26495-12-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 01:04, David Miller wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 

Please add the Fixes line as well:

Fixes: 0e0a5b49ad58 ("s390x/tcg: Implement VECTOR STORE WITH LENGTH")


> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Miller <dmiller423@gmail.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/tcg/vec_helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
> index ededf13cf0..48d86722b2 100644
> --- a/target/s390x/tcg/vec_helper.c
> +++ b/target/s390x/tcg/vec_helper.c
> @@ -200,7 +200,6 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
>          addr = wrap_address(env, addr + 8);
>          cpu_stq_data_ra(env, addr, s390_vec_read_element64(v1, 1), GETPC());
>      } else {
> -        S390Vector tmp = {};
>          int i;
>  
>          for (i = 0; i < bytes; i++) {
> @@ -209,6 +208,5 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
>              cpu_stb_data_ra(env, addr, byte, GETPC());
>              addr = wrap_address(env, addr + 1);
>          }
> -        *(S390Vector *)v1 = tmp;
>      }
>  }


-- 
Thanks,

David / dhildenb


