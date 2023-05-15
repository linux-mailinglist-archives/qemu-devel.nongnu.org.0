Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B370276A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:40:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyThv-0006u4-Vy; Mon, 15 May 2023 04:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyTht-0006tJ-Ps
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyThs-0003Qb-5G
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684139843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TL5RD00+oseaDO47QgQQF7P5uXBXi/1eOtLLBP24d2Q=;
 b=WdptVRJ28grD3hRXA8St4GeDsGieeXWo7ySQdY3s15+J2ipiCldINQRw1C8o/iPJ7/U9ym
 QB76GOPposs0RwflCiaX5XPqWzLzVUd8ABfgoLmmwLJ5rnt1ZaKrUzIe3bq+MRhWoi2fyO
 qXYrn9AzB6QiFUOvy6oD5cOOc2PcTHU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-9cpyaHVGNeW6ZopyaSA1Nw-1; Mon, 15 May 2023 04:37:22 -0400
X-MC-Unique: 9cpyaHVGNeW6ZopyaSA1Nw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3063287f1c9so4821513f8f.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684139841; x=1686731841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TL5RD00+oseaDO47QgQQF7P5uXBXi/1eOtLLBP24d2Q=;
 b=hGsWbX26l6taU9zneGRWnmRAu22ijkf/Enq3NJLo6zDJoaqUjLgisyAaLKWCiESJRC
 aifk3T5lvF1MGrGVhvb0tnZNPDKlKXgVtRfDypfTaO8r03clri0w3c92Tdy5s2tAYTzA
 AFGkXgJo7tP+Hwo6fozhlfTMmteUAAozWxPobJzDunM0PiCUeZ2wkv0LDCjGtOPM59li
 /G7dKSHAjRwGeiV9E7ZR4ra2uWSCANqJ1y+CkUGWkr6WnjvN5QY409WnsfDrY2+1j/tr
 TjFUI25WqL5vqh1U42fVeTICYZGdjVXJ0DELrcI7lpWNtIMu+btSxODUomTSoJD0cg6W
 EUnw==
X-Gm-Message-State: AC+VfDxSQQwGvn7QjOFT5OVxqPBmYtikOt/fs4i1sfqRxRlFnkm29gQ7
 DSa6wnAgIKlINguvIBYPx4CSASU/EAflbNgGF7X2KipIB8n4s1lTBTVRnkSqCmZyEaazAk4TCw1
 EP6x1j9XSzv6zPZA=
X-Received: by 2002:a5d:594c:0:b0:307:979f:7373 with SMTP id
 e12-20020a5d594c000000b00307979f7373mr17818841wri.24.1684139841154; 
 Mon, 15 May 2023 01:37:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6gXKhuR7pRgD+ShAd+qrlXX0FL1sn2wJjQ5AjFX4k7CS0HI8GcnK32LHaK8i1wlP9erOPKNA==
X-Received: by 2002:a5d:594c:0:b0:307:979f:7373 with SMTP id
 e12-20020a5d594c000000b00307979f7373mr17818828wri.24.1684139840808; 
 Mon, 15 May 2023 01:37:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a5d6186000000b003090cb7a9e6sm6994817wru.31.2023.05.15.01.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 01:37:20 -0700 (PDT)
Message-ID: <7d08b3da-b2b1-1a54-8aed-aa3aa9df4b34@redhat.com>
Date: Mon, 15 May 2023 10:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 02/10] hw/arm/smmuv3: Update translation config to
 hold stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-3-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401104953.1325983-3-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mostafa,
On 4/1/23 12:49, Mostafa Saleh wrote:
> In preparation for adding stage-2 support, add a S2 config
> struct(SMMUS2Cfg), composed of the following fields and embedded in
> the main SMMUTransCfg:
>  -tsz: Size of IPA input region (S2T0SZ)
>  -sl0: Start level of translation (S2SL0)
>  -affd: AF Fault Disable (S2AFFD)
>  -record_faults: Record fault events (S2R)
>  -granule_sz: Granule page shift (based on S2TG)
>  -vmid: Virtual Machine ID (S2VMID)
>  -vttb: Address of translation table base (S2TTB)
>  -eff_ps: Effective PA output range (based on S2PS)
>
> They will be used in the next patches in stage-2 address translation.
>
> The fields in SMMUS2Cfg, are reordered to make the shared and stage-1
> fields next to each other, this reordering didn't change the struct
> size (104 bytes before and after).
>
> Stage-1 only fields: aa64, asid, tt, ttb, tbi, record_faults, oas.
> oas is stage-1 output address size. However, it is used to check
> input address in case stage-1 is unimplemented or bypassed according
> to SMMUv3 manual IHI0070.E "3.4. Address sizes"
>
> Shared fields: stage, disabled, bypassed, aborted, iotlb_*.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v3:
> -Add record_faults for stage-2
> -Reorder and document fields in SMMUTransCfg based on stage
> -Rename oas in SMMUS2Cfg to eff_ps
> -Improve comments in SMMUS2Cfg
> Changes in v2:
> -Add oas
> ---
>  include/hw/arm/smmu-common.h | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 9fcff26357..9cf3f37929 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -58,25 +58,41 @@ typedef struct SMMUTLBEntry {
>      uint8_t granule;
>  } SMMUTLBEntry;
>  
> +/* Stage-2 configuration. */
> +typedef struct SMMUS2Cfg {
> +    uint8_t tsz;            /* Size of IPA input region (S2T0SZ) */
> +    uint8_t sl0;            /* Start level of translation (S2SL0) */
> +    bool affd;              /* AF Fault Disable (S2AFFD) */
> +    bool record_faults;     /* Record fault events (S2R) */
> +    uint8_t granule_sz;     /* Granule page shift (based on S2TG) */
> +    uint8_t eff_ps;         /* Effective PA output range (based on S2PS) */
> +    uint16_t vmid;          /* Virtual Machine ID (S2VMID) */
> +    uint64_t vttb;          /* Address of translation table base (S2TTB) */
> +} SMMUS2Cfg;
> +
>  /*
>   * Generic structure populated by derived SMMU devices
>   * after decoding the configuration information and used as
>   * input to the page table walk
>   */
>  typedef struct SMMUTransCfg {
> +    /* Shared fields between stage-1 and stage-2. */
>      int stage;                 /* translation stage */
> -    bool aa64;                 /* arch64 or aarch32 translation table */
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
> +    uint32_t iotlb_hits;       /* counts IOTLB hits */
> +    uint32_t iotlb_misses;     /* counts IOTLB misses*/
> +    /* Used by stage-1 only. */
> +    bool aa64;                 /* arch64 or aarch32 translation table */
>      bool record_faults;        /* record fault events */
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
>      uint16_t asid;
>      SMMUTransTableInfo tt[2];
> -    uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
> -    uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
> +    /* Used by stage-2 only. */
> +    struct SMMUS2Cfg s2cfg;
>  } SMMUTransCfg;
>  
>  typedef struct SMMUDevice {
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


