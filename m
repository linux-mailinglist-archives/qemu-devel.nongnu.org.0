Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E9694C88
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbbT-0000Vh-7P; Mon, 13 Feb 2023 11:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRbbP-0000Re-Cy
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRbbN-0008Hv-Gx
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676305368;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hGiCD0ViewYamTmD/veg8Esu+9d8OzIfLb0/JHUxF4=;
 b=dZVF7CMFh39ujn3SrI77gx4L72yuF9zpblUYAzAlPq5fEmkV6d5aKTPDyBQG4Sx7noJYkV
 hgGA4bHitB1060jUwQTQtBiNe/+jv0aPeiRTg+Broo5XMMQrjSnBNkXlqgAuYOTubhdzHQ
 dvPDQJcZyAKE9lToLkbDFyKq8k748Bk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-kiRVZzQ9NqCkRodxz3y-ig-1; Mon, 13 Feb 2023 11:22:45 -0500
X-MC-Unique: kiRVZzQ9NqCkRodxz3y-ig-1
Received: by mail-qt1-f199.google.com with SMTP id
 hf20-20020a05622a609400b003abcad051d2so7621805qtb.12
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hGiCD0ViewYamTmD/veg8Esu+9d8OzIfLb0/JHUxF4=;
 b=mQGP8TnYqUbX0z7OO3zHE01ZhdVGPHJjCYBdkl773MpRbifxUaMIeg3OgyMJV7MfCM
 crBisOHsQElXNj4m1TR1+g7aD601jJjIzU7Ujte88EdOLLGY2j7De4Iffj69zkHVlKXj
 f21mKJak1hi0xJt+of0fMlCF+3RwrjVxxb1jPQX9Da0aEdz5uzKnpOvxb4fnGm5eaGZV
 476UIb+ASqwhY+wYFYhT9NJlqnWWI38Z60omxBvXpYM5HHxeZtQ/ppUmUOPaTevF+lAe
 L274/RYJ4LRpkSj8i/TFLOk3Tkj+n6RJJWyDsgDsDvIRUUZn9heF4Sh+dv8578+hBrlt
 d9jQ==
X-Gm-Message-State: AO0yUKUJoE7qQwlbnusKNZr7a/IujdfRJ1mCTasWGTHtYwkhgSGg+lPh
 qvGzBbRqbnZHfyYPH5poqcSyfHn6gh5B/5AmkXhseXfpb0VqeB1bzwpoMwYtrE7x2JAr1haIo+P
 XQrswxeFLLBjdXts=
X-Received: by 2002:a05:622a:112:b0:3b9:bd05:bdf1 with SMTP id
 u18-20020a05622a011200b003b9bd05bdf1mr46039332qtw.14.1676305365162; 
 Mon, 13 Feb 2023 08:22:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+3KyZuvrcTxxl+VKuqL754d4eVf1+FeWy+VGUIF1Qt5tVaBsN0qjcJLwM8tr41XLCEeCDrhA==
X-Received: by 2002:a05:622a:112:b0:3b9:bd05:bdf1 with SMTP id
 u18-20020a05622a011200b003b9bd05bdf1mr46039294qtw.14.1676305364818; 
 Mon, 13 Feb 2023 08:22:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a21-20020ac84355000000b003bb764fe4ffsm9677032qtn.3.2023.02.13.08.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:22:44 -0800 (PST)
Message-ID: <6b4712cb-e084-b0a6-7c07-db24e2068427@redhat.com>
Date: Mon, 13 Feb 2023 17:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] hw/arm/smmu-common: Support 64-bit addresses
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230210163731.970130-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jean,
On 2/10/23 17:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set. Ensure the IOMMU region covers all 64 bits.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/smmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 733c964778..2b8c67b9a1 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -439,7 +439,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>  
>          memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
>                                   s->mrtypename,
> -                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
> +                                 OBJECT(s), name, UINT64_MAX);
as SMMU_MAX_VA_BITS is not used anymore, please remove it.
>          address_space_init(&sdev->as,
>                             MEMORY_REGION(&sdev->iommu), name);
>          trace_smmu_add_mr(name);
Thanks

Eric


