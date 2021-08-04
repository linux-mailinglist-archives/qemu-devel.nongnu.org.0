Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52113E073A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:09:20 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLKQ-000651-T4
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBJis-0005cs-SZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBJin-0003pF-12
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628094380;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2hTr+fr4TI/yT45SObCfdEKVD2+jP4ZLKW41O1pwUo=;
 b=JSIymyUYqCayjccsK/hfLWSggZrqaePSbv8CJJcaHE7vkwfxGs+gFyrxgPNf9q0mGRnfOB
 Ljwc0iamHVYJAHSBrtC8wnEwvhXQpKg59BMMmHK/jvRHl2JI4mAo79XTwpBd48EDs9qUll
 Vi70rRv26r/YVBknJk+Rp9ZcYCC2Lkk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-6ruPlP2MObKvOZtmE0OWzw-1; Wed, 04 Aug 2021 12:26:18 -0400
X-MC-Unique: 6ruPlP2MObKvOZtmE0OWzw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so436311wmj.8
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 09:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=k2hTr+fr4TI/yT45SObCfdEKVD2+jP4ZLKW41O1pwUo=;
 b=hXAnGrSTUB31EHV/v6VMRQUe+OLo/hXnsSJ69SEW/rGTwzmVBXArBcI6fE8s6OcKXE
 9VZizV8DFcAg4MNqCrPxv6YvpUDuC72Axw1naiSbu1Wf+GgjY7TNvbSQdQ3WwK4pi8DA
 eD1ArVBqjPvoeA0OmGsxVPFEGuL0GFdcUeVXamWZCID5kcVoLY4OAdfakgbyLFxQGPgi
 qAXEDBhZWdKpmrvvr4kBHma83eZ8x+NvDQqvwRj80lWfxm1b+n6ZmSXKV3FC1HeZNX25
 q7g5Qbp9azwiWJJZ9fwhxWAfJ9r0gLjZhJLOQT5l768LdIw5lPnqQZIiGB2gZlX6nY9H
 ip7w==
X-Gm-Message-State: AOAM532CfUMxGDBl7CcQPZ2EJ5m/THP4f1YTUwDam0ePZMm4mxmdqm2p
 Xit8yhvzGyparV6OUyWcciX908dutzhYt+iyTlMxno27Cmkut4cqFcJ2vX1dy0nMAnNqNcv6TdI
 qiDssO4Ox34c89zg=
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr241379wrx.110.1628094377419; 
 Wed, 04 Aug 2021 09:26:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycs+HcKT66CWq9eWdto/pIotno2KLJ0AMVQR2YCmOTZiVhPqpKLY+1oChM2oDYa9zNijwQuw==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr241347wrx.110.1628094377029; 
 Wed, 04 Aug 2021 09:26:17 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id v12sm3091837wrq.59.2021.08.04.09.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 09:26:16 -0700 (PDT)
Subject: Re: [RESEND RFC] hw/arm/smmuv3: add device properties to disable
 cached iotlb
To: chenxiang <chenxiang66@hisilicon.com>
References: <1628066969-29945-1-git-send-email-chenxiang66@hisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <5fc0cd6c-1e1d-3cb3-51e5-f20c10736643@redhat.com>
Date: Wed, 4 Aug 2021 18:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1628066969-29945-1-git-send-email-chenxiang66@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, linuxarm@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chenxiang,

On 8/4/21 10:49 AM, chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
>
> It splits invalidations into ^2 range invalidations in the patch
> 6d9cd115b(" hw/arm/smmuv3: Enforce invalidation on a power of two range").
> So for some scenarios such as the size of invalidation is not ^2 range
> invalidation, it costs more time to invalidate.
this ^² split is not only necessary for internal TLB management but also
for IOMMU MR notifier calls (which use a mask), ie. IOTLB unmap
notifications used for both vhost and vfio integrations.
So you can disable the internal IOTLB but we can't simply remove the pow
of 2 split. See below.

internal TLB could be disabled through a property but I would rather set
it as an "x-" experimental property for debug purpose. Until recently
this was indeed helpful to debug bugs related to internal IOTLB
management (RIL support) ;-) I hope this period is over though ;-)
> Currently smmuv3_translate is rarely used (i only see it is used when
> binding msi), so i think maybe we can disable cached iotlb to promote
> efficiency of invalidation. So add device property disable_cached_iotlb
> to disable cached iotlb, and then we can send non-^2 range invalidation
> directly.
> Use tool dma_map_benchmark to have a test on the latency of unmap,
> and we can see it promotes much on unmap when the size of invalidation
> is not ^2 range invalidation (such as g = 7/15/31/511):
>
> t = 1(thread = 1)
> 			before opt(us)   after opt(us)
> g=1(4K size)	0.2/7.6		0.2/7.5
> g=4(8K size)	0.4/7.9		0.4/7.9
> g=7(28K size)	0.6/10.2		0.6/8.2
> g=8(32K size)	0.6/8.3		0.6/8.3
> g=15(60K size)	1.1/12.1		1.1/9.1
> g=16(64K size)	1.1/9.2		1.1/9.1
> g=31(124K size)	2.0/14.8		2.0/10.7
> g=32(128K size)	2.1/14.8		2.1/10.7
> g=511(2044K size)	30.9/65.1		31.1/55.9
> g=512(2048K size) 0.3/32.1		0.3/32.1
> t = 10(thread = 10)
> 			before opt(us)   after opt(us)
> g=1(4K size)	0.2/39.9		0.2/39.1
> g=4(8K size)	0.5/42.6		0.5/42.4
> g=7(28K size)	0.6/66.4		0.6/45.3
> g=8(32K size)	0.7/45.8		0.7/46.1
> g=15(60K size)	1.1/80.5		1.1/49.6
> g=16(64K size)	1.1/49.8		1.1/50.2
> g=31(124K size)	2.0/98.3		2.1/58.0
> g=32(128K size)	2.1/57.7		2.1/58.2
> g=511(2044K size)	35.2/322.2		35.3/236.7
> g=512(2048K size) 0.8/238.2		0.9/240.3
>
> Note: i test it based on VSMMU enabled with the patchset
> ("vSMMUv3/pSMMUv3 2 stage VFIO integration").
>
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  hw/arm/smmuv3.c         | 77 ++++++++++++++++++++++++++++++++-----------------
>  include/hw/arm/smmuv3.h |  1 +
>  2 files changed, 52 insertions(+), 26 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60be..7ae668f 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -19,6 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/bitops.h"
>  #include "hw/irq.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/qdev-core.h"
> @@ -682,19 +683,21 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      page_mask = (1ULL << (tt->granule_sz)) - 1;
>      aligned_addr = addr & ~page_mask;
>  
> -    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
> -    if (cached_entry) {
> -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> -            status = SMMU_TRANS_ERROR;
> -            if (event.record_trans_faults) {
> -                event.type = SMMU_EVT_F_PERMISSION;
> -                event.u.f_permission.addr = addr;
> -                event.u.f_permission.rnw = flag & 0x1;
> +    if (s->disable_cached_iotlb) {
> +        cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
> +        if (cached_entry) {
> +            if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> +                status = SMMU_TRANS_ERROR;
> +                if (event.record_trans_faults) {
> +                    event.type = SMMU_EVT_F_PERMISSION;
> +                    event.u.f_permission.addr = addr;
> +                    event.u.f_permission.rnw = flag & 0x1;
> +                }
> +            } else {
> +                status = SMMU_TRANS_SUCCESS;
>              }
> -        } else {
> -            status = SMMU_TRANS_SUCCESS;
> +            goto epilogue;
>          }
> -        goto epilogue;
>      }
>  
>      cached_entry = g_new0(SMMUTLBEntry, 1);
> @@ -742,7 +745,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          }
>          status = SMMU_TRANS_ERROR;
>      } else {
> -        smmu_iotlb_insert(bs, cfg, cached_entry);
> +        if (s->disable_cached_iotlb) {
> +            smmu_iotlb_insert(bs, cfg, cached_entry);
> +        }
>          status = SMMU_TRANS_SUCCESS;
>      }
>  
> @@ -855,8 +860,9 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>      }
>  }
>  
> -static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
> +static void smmuv3_s1_range_inval(SMMUv3State *s, Cmd *cmd)
>  {
> +    SMMUState *bs = ARM_SMMU(s);
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
>      uint16_t vmid = CMD_VMID(cmd);
> @@ -876,7 +882,9 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      if (!tg) {
>          trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
> +        if (s->disable_cached_iotlb) {
> +            smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
> +        }
>          return;
>      }
>  
> @@ -885,17 +893,23 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      num_pages = (num + 1) * BIT_ULL(scale);
>      granule = tg * 2 + 10;
>  
> -    /* Split invalidations into ^2 range invalidations */
> -    end = addr + (num_pages << granule) - 1;
> -
> -    while (addr != end + 1) {
> -        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
> -
> -        num_pages = (mask + 1) >> granule;
> +    if (s->disable_cached_iotlb) {
>          trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>          smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);

smmuv3_inv_notifiers_iova() 
also needs to be called with power of 2 ranges
as it eventually calls memory_region_notify_iommu_one() which sets 
event.entry.addr_mask = num_pages * (1 << granule) - 1;

> -        addr += mask + 1;
> +    } else {
> +        /* Split invalidations into ^2 range invalidations */
> +        end = addr + (num_pages << granule) - 1;
> +
> +        while (addr != end + 1) {
> +            uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
> +
> +            num_pages = (mask + 1) >> granule;
> +            trace_smmuv3_s1_range_inval(vmid, asid, addr,
> +                                        tg, num_pages, ttl, leaf);
> +            smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> +            smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> +            addr += mask + 1;
> +        }
>      }
>  }
>  
> @@ -1028,18 +1042,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>  
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>              smmu_inv_notifiers_all(&s->smmu_state);
> -            smmu_iotlb_inv_asid(bs, asid);
> +            if (s->disable_cached_iotlb) {
> +                smmu_iotlb_inv_asid(bs, asid);
> +            }
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ALL:
>          case SMMU_CMD_TLBI_NSNH_ALL:
>              trace_smmuv3_cmdq_tlbi_nh();
>              smmu_inv_notifiers_all(&s->smmu_state);
> -            smmu_iotlb_inv_all(bs);
> +            if (s->disable_cached_iotlb) {
> +                smmu_iotlb_inv_all(bs);
> +            }
>              break;
>          case SMMU_CMD_TLBI_NH_VAA:
>          case SMMU_CMD_TLBI_NH_VA:
> -            smmuv3_s1_range_inval(bs, &cmd);
> +            smmuv3_s1_range_inval(s, &cmd);
>              break;
>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
> @@ -1506,6 +1524,12 @@ static void smmuv3_instance_init(Object *obj)
>      /* Nothing much to do here as of now */
>  }
>  
> +static Property smmuv3_properties[] = {
> +    DEFINE_PROP_BOOL("disable_cached_iotlb", SMMUv3State,
> +                     disable_cached_iotlb, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void smmuv3_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -1515,6 +1539,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>      device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
> +    device_class_set_props(dc, smmuv3_properties);
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index c641e60..c94ab7e 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -62,6 +62,7 @@ struct SMMUv3State {
>  
>      qemu_irq     irq[4];
>      QemuMutex mutex;
> +    bool disable_cached_iotlb; /* Whether disable/enable cached iotlb */
>  };
>  
>  typedef enum {
Thanks

Eric


