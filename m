Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88D35BC51
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:38:36 +0200 (CEST)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVs5a-0007bi-HJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVs2A-0006Ff-Hh
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVs28-0006KO-TL
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618216500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEdSEraRB7r3EpYZHabVcSuyjjfJUCkbuzJt9RAFRhI=;
 b=FFesr6DKukCb7G47Y/YeGRsMyVIWYZ+zF9HFvrwQrj0MuT29dYwqTcwuolhl7wXxL94+No
 PSmfR94fIrO9TdRjkDD/EX2bGgEKesCYeazkWARIzBrmwCYGobafvMSX8YdOpvJMsmxinY
 HjYUgjc+E62n1Vsit2xtcPZ7qsEfhX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-NWacPtahMLe1FM5gFpWusw-1; Mon, 12 Apr 2021 04:34:55 -0400
X-MC-Unique: NWacPtahMLe1FM5gFpWusw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 481146D241;
 Mon, 12 Apr 2021 08:34:54 +0000 (UTC)
Received: from [10.36.113.253] (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 939BC5D9F0;
 Mon, 12 Apr 2021 08:34:47 +0000 (UTC)
Subject: Re: [RFC PATCH 3/3] hw/arm/smmuv3: Post-load stage 1 configurations
 to the host
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <20210219094230.231-4-jiangkunkun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <dcfa967a-056f-b15c-6a39-0638e6a52a88@redhat.com>
Date: Mon, 12 Apr 2021 10:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210219094230.231-4-jiangkunkun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,
On 2/19/21 10:42 AM, Kunkun Jiang wrote:
> In nested mode, we call the set_pasid_table() callback on each STE
> update to pass the guest stage 1 configuration to the host and
> apply it at physical level.
> 
> In the case of live migration, we need to manual call the
s/manual/manually
> set_pasid_table() to load the guest stage 1 configurations to the
> host. If this operation is fail, the migration is fail.
s/If this operation is fail, the migration is fail/If this operation
fails, the migration fails.
> 
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events |  1 +
>  2 files changed, 61 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 6c6ed84e78..94ca15375c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1473,6 +1473,65 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      smmu_init_irq(s, dev);
>  }
>  
> +static int smmuv3_manual_set_pci_device_pasid_table(SMMUDevice *sdev)
Can't you retrieve the associated sid and then call
smmuv3_notify_config_change()
> +{
> +#ifdef __linux__
> +    IOMMUMemoryRegion *mr = &(sdev->iommu);
> +    int sid = smmu_get_sid(sdev);
> +    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid,
> +                           .inval_ste_allowed = true};
> +    IOMMUConfig iommu_config = {};
> +    SMMUTransCfg *cfg;
> +    int ret = -1;
> +
> +    cfg = smmuv3_get_config(sdev, &event);
> +    if (!cfg) {
> +        return ret;
> +    }
> +
> +    iommu_config.pasid_cfg.argsz = sizeof(struct iommu_pasid_table_config);
> +    iommu_config.pasid_cfg.version = PASID_TABLE_CFG_VERSION_1;
> +    iommu_config.pasid_cfg.format = IOMMU_PASID_FORMAT_SMMUV3;
> +    iommu_config.pasid_cfg.base_ptr = cfg->s1ctxptr;
> +    iommu_config.pasid_cfg.pasid_bits = 0;
> +    iommu_config.pasid_cfg.vendor_data.smmuv3.version = PASID_TABLE_SMMUV3_CFG_VERSION_1;
> +
> +    if (cfg->disabled || cfg->bypassed) {
> +        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_BYPASS;
> +    } else if (cfg->aborted) {
> +        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_ABORT;
> +    } else {
> +        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_TRANSLATE;
> +    }
> +
> +    ret = pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config);
> +    if (ret) {
> +        error_report("Failed to pass PASID table to host for iommu mr %s (%m)",
> +                     mr->parent_obj.name);
> +    }
> +
> +    return ret;
> +#endif
> +}
> +
> +static int smmuv3_post_load(void *opaque, int version_id)
> +{
> +    SMMUv3State *s3 = opaque;
> +    SMMUState *s = &(s3->smmu_state);
> +    SMMUDevice *sdev;
> +    int ret = 0;
> +
> +    QLIST_FOREACH(sdev, &s->devices_with_notifiers, next) {
> +        trace_smmuv3_post_load_sdev(sdev->devfn, sdev->iommu.parent_obj.name);
> +        ret = smmuv3_manual_set_pci_device_pasid_table(sdev);
> +        if (ret) {
> +            break;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>  static const VMStateDescription vmstate_smmuv3_queue = {
>      .name = "smmuv3_queue",
>      .version_id = 1,
> @@ -1491,6 +1550,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .priority = MIG_PRI_IOMMU,
> +    .post_load = smmuv3_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(features, SMMUv3State),
>          VMSTATE_UINT8(sid_size, SMMUv3State),
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 35e562ab74..caa864dd72 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -53,4 +53,5 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
>  smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s1ctxptr) "iommu mr=%s config=%d s1ctxptr=0x%"PRIx64
> +smmuv3_post_load_sdev(int devfn, const char *name) "sdev devfn=%d iommu mr=%s"PRIx64
>  
> 
Thanks

Eric


