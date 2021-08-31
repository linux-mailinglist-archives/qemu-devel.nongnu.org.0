Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A383FC9B4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:26:40 +0200 (CEST)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4il-0001z1-MH
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4Kl-0005Bc-Su
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4Kh-0003x5-6P
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630418505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noUBStaK8/M34XqCVj6sM5my/wyghfQ0BFep4Gh9s2g=;
 b=eFpBhA+5L+C5yk2x/aJsEYSM0d28OwBTlLcn5NYnhu6MMBQoURDMFovub82tr9c1+PS+S9
 gifatLxvElpq0r3uonyC76ycb/U9xJ1ovtciXkshddSrst6QAGVgH9Kn/a4VRxldQMLYRb
 rsJICHQGvu3GVVXCtk1Szil39Iajrzc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-UhkZYp6NOOGWa02tkACMJw-1; Tue, 31 Aug 2021 10:01:43 -0400
X-MC-Unique: UhkZYp6NOOGWa02tkACMJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso1363942wml.7
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 07:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=noUBStaK8/M34XqCVj6sM5my/wyghfQ0BFep4Gh9s2g=;
 b=rajXIClq5puSZOLytxC7hbdmMQUM+UZ9p9sRiX/ZHcPJZcu00RxugOFVik6/dUgKdD
 3ea+8BaTlBfyUd5VWFh+GElN2PxsRG8yxbNk+e24Ur5XyHY29KYuwjCzjVMhxQ8dKP/q
 PwE/sZ5qR/N79UBCOhCG/h4aKfVKm4XxfCHl9paYKfR/PO6m3Lj+oJ0UiSwGMEGvPMJp
 Dpq8hPhcogE5/iGtFfzxkmuQILfS0FnvlLm5vBrrlFxIAxXuRxA+IqjkM2NPj9pOZTPP
 6+LX1cLF7O1DbpSchg4k3c/UT7UnkwoM+XkEUzOu2B7MZcAYJe2emgFHjxEIMthWthI7
 LXyA==
X-Gm-Message-State: AOAM533butBZkmFwHythgVsMucS/hTL8E4vhHypoirlueqzgn5hoN2Vt
 epqGPZ9Xv5XsdEE6Of6yF4mjbFECZdHx3LEOsOTdELbEpMIMF4+NT4bOqg5hG+xhFRA2v0LpmQT
 DEUUkxAhio945gS4=
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr33566490wrx.244.1630418502160; 
 Tue, 31 Aug 2021 07:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHGR7CoO6ENBilgE51bQpVvCL+KVZCjTkwDxwMR5cCV0xMvBFDb1VwSfDxcq4sA9FJ1O4ejg==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr33566456wrx.244.1630418501959; 
 Tue, 31 Aug 2021 07:01:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p9sm2248741wrg.14.2021.08.31.07.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:01:41 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
To: chunming <chunming_li1234@163.com>, peter.maydell@linaro.org
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-3-git-send-email-chunming_li1234@163.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7089ce3e-2b15-7cf3-86d9-231c69794138@redhat.com>
Date: Tue, 31 Aug 2021 16:01:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1629878922-173270-3-git-send-email-chunming_li1234@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chunming

On 8/25/21 10:08 AM, chunming wrote:
> From: chunming <chunming.li@verisilicon.com>
>
> Replace "smmuv3_flush_config" with "g_hash_table_foreach_remove".
this replacement may have a potential negative impact on the performance
for PCIe support, which is the main use case: a unique
g_hash_table_remove() is replaced by an iteration over all the config
hash keys.

I wonder if you couldn't just adapt smmu_iommu_mr() and it case this
latter returns NULL for the current PCIe search, look up in the platform
device list:

peri_sdev_list?

Thanks

Eric



> "smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe devices.
>
> Signed-off-by: chunming <chunming.li@verisilicon.com>
> ---
>  hw/arm/smmuv3.c              | 35 ++++++++++-------------------------
>  include/hw/arm/smmu-common.h |  5 ++++-
>  2 files changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 11d7fe8423..9f3f13fb8e 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -613,14 +613,6 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>      return cfg;
>  }
>  
> -static void smmuv3_flush_config(SMMUDevice *sdev)
> -{
> -    SMMUv3State *s = sdev->smmu;
> -    SMMUState *bc = &s->smmu_state;
> -
> -    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
> -    g_hash_table_remove(bc->configs, sdev);
> -}
>  
>  static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                                        IOMMUAccessFlags flag, int iommu_idx)
> @@ -964,22 +956,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_CFGI_STE:
>          {
>              uint32_t sid = CMD_SID(&cmd);
> -            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
> -            SMMUDevice *sdev;
> +            SMMUSIDRange sid_range;
>  
>              if (CMD_SSEC(&cmd)) {
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
>  
> -            if (!mr) {
> -                break;
> -            }
> -
> +            sid_range.start = sid;
> +            sid_range.end = sid;
>              trace_smmuv3_cmdq_cfgi_ste(sid);
> -            sdev = container_of(mr, SMMUDevice, iommu);
> -            smmuv3_flush_config(sdev);
> -
> +            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
> +                                        &sid_range);
>              break;
>          }
>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
> @@ -1006,21 +994,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_CFGI_CD_ALL:
>          {
>              uint32_t sid = CMD_SID(&cmd);
> -            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
> -            SMMUDevice *sdev;
> +            SMMUSIDRange sid_range;
>  
>              if (CMD_SSEC(&cmd)) {
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
>  
> -            if (!mr) {
> -                break;
> -            }
> -
> +            sid_range.start = sid;
> +            sid_range.end = sid;
>              trace_smmuv3_cmdq_cfgi_cd(sid);
> -            sdev = container_of(mr, SMMUDevice, iommu);
> -            smmuv3_flush_config(sdev);
> +            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
> +                                        &sid_range);
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ASID:
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 95cd12a4b5..d016455d80 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -159,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>   */
>  SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
>  
> -/* Return the iommu mr associated to @sid, or NULL if none */
> +/**
> + * Return the iommu mr associated to @sid, or NULL if none
> + * Only for PCI device, check smmu_find_peri_sdev for non PCI/PCIe device
> + */
>  IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>  
>  #define SMMU_IOTLB_MAX_SIZE 256


