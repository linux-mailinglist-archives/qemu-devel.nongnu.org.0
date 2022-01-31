Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D754A49FA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:14:24 +0100 (CET)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYNq-00077S-T3
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nEYIR-0002hv-DW; Mon, 31 Jan 2022 10:08:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36094
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nEYIM-0002Rf-TT; Mon, 31 Jan 2022 10:08:46 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VD6hUR012004; 
 Mon, 31 Jan 2022 15:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gjT7BhEhBzzO7qjehHAnFqHlURcU2+AvxXk54e8XcIY=;
 b=USRWx+uWEMNjFXDt97XZizOAEyz/O8EwY0Ps49c9fv48dZQcfPNb1guT2REYCFoTAu89
 Gf6/4gX4bIL0+hOU8eIhZwGzQ3yVNf3I6MO0ytO3R9gE/W2VwRjURdxfpUPO2qpk/hfN
 SwGaLTl03SnW9C9U38IcWfZR3lg4qLJ4y3sEaCnwHOTZ27RTbEebwLWi0e6t9uDux7pb
 foumgbQfRamsLs83PnFL1osbtaAaEbJCNOZIMNxi2xZQs2+AY7HjI9K2c/WXotfMNemO
 rHseSGkE+2Hj/9lyzt7svzfvhw+Dl9O8h4kaX/VJnDJpoCNEYL2oPbUoID/mNwc+iLMG BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dwv2y56qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:08:32 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VEGb2O023527;
 Mon, 31 Jan 2022 15:08:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dwv2y56pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:08:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VEqQS2009717;
 Mon, 31 Jan 2022 15:08:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3dvw79cqph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:08:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VF8NXd44237110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 15:08:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5102EAE045;
 Mon, 31 Jan 2022 15:08:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EB3BAE057;
 Mon, 31 Jan 2022 15:08:22 +0000 (GMT)
Received: from [9.171.84.74] (unknown [9.171.84.74])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 15:08:22 +0000 (GMT)
Message-ID: <48b4014f-9a8b-be96-4abf-c9b7d8975386@linux.ibm.com>
Date: Mon, 31 Jan 2022 16:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 6/9] s390x/pci: enable adapter event notification for
 interpreted devices
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <20220114203849.243657-7-mjrosato@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20220114203849.243657-7-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vvS1flrU63ypEM2PtBJwCfPRhIkgMhD4
X-Proofpoint-ORIG-GUID: LLR8QOf9AzGpnMpf9J7jPSthcWee1Exq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_06,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201310099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/14/22 21:38, Matthew Rosato wrote:
> Use the associated vfio feature ioctl to enable adapter event notification
> and forwarding for devices when requested.  This feature will be set up
> with or without firmware assist based upon the 'intassist' setting.

It is a personal opinion but I do not like the term 'intassist'.
Why not using 'gisa' ?
I would find it more relevant.
If something for the profane admin then interrupt_assist or irq_assist 
or even int_assist.

Or is it forwarding_assist ?

> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c          | 24 ++++++++--
>   hw/s390x/s390-pci-inst.c         | 54 +++++++++++++++++++++-
>   hw/s390x/s390-pci-vfio.c         | 79 ++++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-bus.h  |  1 +
>   include/hw/s390x/s390-pci-vfio.h | 20 ++++++++
>   5 files changed, 173 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 66649af6e0..6ee70446ca 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -189,7 +189,10 @@ void s390_pci_sclp_deconfigure(SCCB *sccb)
>           rc = SCLP_RC_NO_ACTION_REQUIRED;
>           break;
>       default:
> -        if (pbdev->summary_ind) {
> +        if (pbdev->interp) {
> +            /* Interpreted devices were using interrupt forwarding */
> +            s390_pci_set_aif(pbdev, NULL, false, pbdev->intassist);
> +        } else if (pbdev->summary_ind) {
>               pci_dereg_irqs(pbdev);
>           }
>           if (pbdev->iommu->enabled) {
> @@ -981,6 +984,11 @@ static int s390_pci_interp_plug(S390pciState *s, S390PCIBusDevice *pbdev)
>           return rc;
>       }
>   
> +    rc = s390_pci_probe_aif(pbdev);
> +    if (rc) {
> +        return rc;
> +    }
> +
>       rc = s390_pci_update_passthrough_fh(pbdev);
>       if (rc) {
>           return rc;
> @@ -1076,6 +1084,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>               if (pbdev->interp && !s390_has_feat(S390_FEAT_ZPCI_INTERP)) {
>                       DPRINTF("zPCI interpretation facilities missing.\n");
>                       pbdev->interp = false;
> +                    pbdev->intassist = false;
>                   }
>               if (pbdev->interp) {
>                   rc = s390_pci_interp_plug(s, pbdev);
> @@ -1090,11 +1099,13 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>               if (!pbdev->interp) {
>                   /* Do vfio passthrough but intercept for I/O */
>                   pbdev->fh |= FH_SHM_VFIO;
> +                pbdev->intassist = false;
>               }
>           } else {
>               pbdev->fh |= FH_SHM_EMUL;
>               /* Always intercept emulated devices */
>               pbdev->interp = false;
> +            pbdev->intassist = false;
>           }
>   
>           if (s390_pci_msix_init(pbdev) && !pbdev->interp) {
> @@ -1244,7 +1255,10 @@ static void s390_pcihost_reset(DeviceState *dev)
>       /* Process all pending unplug requests */
>       QTAILQ_FOREACH_SAFE(pbdev, &s->zpci_devs, link, next) {
>           if (pbdev->unplug_requested) {
> -            if (pbdev->summary_ind) {
> +            if (pbdev->interp) {
> +                /* Interpreted devices were using interrupt forwarding */
> +                s390_pci_set_aif(pbdev, NULL, false, pbdev->intassist);
> +            } else if (pbdev->summary_ind) {
>                   pci_dereg_irqs(pbdev);
>               }
>               if (pbdev->iommu->enabled) {
> @@ -1382,7 +1396,10 @@ static void s390_pci_device_reset(DeviceState *dev)
>           break;
>       }
>   
> -    if (pbdev->summary_ind) {
> +    if (pbdev->interp) {
> +        /* Interpreted devices were using interrupt forwarding */
> +        s390_pci_set_aif(pbdev, NULL, false, pbdev->intassist);
> +    } else if (pbdev->summary_ind) {
>           pci_dereg_irqs(pbdev);
>       }
>       if (pbdev->iommu->enabled) {
> @@ -1428,6 +1445,7 @@ static Property s390_pci_device_properties[] = {
>       DEFINE_PROP_S390_PCI_FID("fid", S390PCIBusDevice, fid),
>       DEFINE_PROP_STRING("target", S390PCIBusDevice, target),
>       DEFINE_PROP_BOOL("interp", S390PCIBusDevice, interp, true),
> +    DEFINE_PROP_BOOL("intassist", S390PCIBusDevice, intassist, true),

We allow to disable IRQ forwarding only for test or debug purpose don't we?
Then shouldn't we make it explicit ?

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index e9a0dc12e4..121e07cc41 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -1111,6 +1111,46 @@ static void fmb_update(void *opaque)
>       timer_mod(pbdev->fmb_timer, t + pbdev->pci_group->zpci_group.mui);
>   }
>   
> +static int mpcifc_reg_int_interp(S390PCIBusDevice *pbdev, ZpciFib *fib)
> +{
> +    int rc;
> +
> +    /* Interpreted devices must also use interrupt forwarding */
> +    rc = s390_pci_get_aif(pbdev, false, pbdev->intassist);
> +    if (rc) {
> +        DPRINTF("Bad interrupt forwarding state\n");
> +        return rc;
> +    }
> +
> +    rc = s390_pci_set_aif(pbdev, fib, true, pbdev->intassist);
> +    if (rc) {
> +        DPRINTF("Failed to enable interrupt forwarding\n");
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +static int mpcifc_dereg_int_interp(S390PCIBusDevice *pbdev, ZpciFib *fib)
> +{
> +    int rc;
> +
> +    /* Interpreted devices were using interrupt forwarding */
> +    rc = s390_pci_get_aif(pbdev, true, pbdev->intassist);
> +    if (rc) {
> +        DPRINTF("Bad interrupt forwarding state\n");
> +        return rc;
> +    }
> +
> +    rc = s390_pci_set_aif(pbdev, fib, false, pbdev->intassist);
> +    if (rc) {
> +        DPRINTF("Failed to disable interrupt forwarding\n");
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
>   int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>                           uintptr_t ra)
>   {
> @@ -1165,7 +1205,12 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>   
>       switch (oc) {
>       case ZPCI_MOD_FC_REG_INT:
> -        if (pbdev->summary_ind) {
> +        if (pbdev->interp) {
> +            if (mpcifc_reg_int_interp(pbdev, &fib)) {
> +                cc = ZPCI_PCI_LS_ERR;
> +                s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
> +            }
> +        } else if (pbdev->summary_ind) {
>               cc = ZPCI_PCI_LS_ERR;
>               s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
>           } else if (reg_irqs(env, pbdev, fib)) {
> @@ -1174,7 +1219,12 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>           }
>           break;
>       case ZPCI_MOD_FC_DEREG_INT:
> -        if (!pbdev->summary_ind) {
> +        if (pbdev->interp) {
> +            if (mpcifc_dereg_int_interp(pbdev, &fib)) {
> +                cc = ZPCI_PCI_LS_ERR;
> +                s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
> +            }
> +        } else if (!pbdev->summary_ind) {
>               cc = ZPCI_PCI_LS_ERR;
>               s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
>           } else {
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 2cab3a9e89..73f3b3ed19 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -149,6 +149,85 @@ int s390_pci_update_passthrough_fh(S390PCIBusDevice *pbdev)
>       return 0;
>   }
>   
> +int s390_pci_probe_aif(S390PCIBusDevice *pbdev)
> +{
> +    VFIOPCIDevice *vdev = VFIO_PCI(pbdev->pdev);
> +    struct vfio_device_feature feat = {
> +        .argsz = sizeof(struct vfio_device_feature),
> +        .flags = VFIO_DEVICE_FEATURE_PROBE + VFIO_DEVICE_FEATURE_ZPCI_AIF
> +    };
> +
> +    return ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, &feat);
> +}
> +
> +int s390_pci_set_aif(S390PCIBusDevice *pbdev, ZpciFib *fib, bool enable,
> +                     bool assist)
> +{
> +    VFIOPCIDevice *vdev = VFIO_PCI(pbdev->pdev);
> +    struct vfio_device_zpci_aif *data;
> +    int size = sizeof(struct vfio_device_feature) + sizeof(*data);
> +    g_autofree struct vfio_device_feature *feat = g_malloc0(size);
> +
> +    feat->argsz = size;
> +    feat->flags = VFIO_DEVICE_FEATURE_SET + VFIO_DEVICE_FEATURE_ZPCI_AIF;
> +
> +    data = (struct vfio_device_zpci_aif *)&feat->data;
> +    if (enable) {
> +        data->flags = VFIO_DEVICE_ZPCI_FLAG_AIF_FLOAT;
> +        if (!pbdev->intassist) {
> +            data->flags |= VFIO_DEVICE_ZPCI_FLAG_AIF_HOST;
> +        }
> +        /* Fill in the guest fib info */
> +        data->ibv = fib->aibv;
> +        data->sb = fib->aisb;
> +        data->noi = FIB_DATA_NOI(fib->data);
> +        data->isc = FIB_DATA_ISC(fib->data);
> +        data->sbo = FIB_DATA_AISBO(fib->data);
> +    } else {
> +        data->flags = 0;
> +    }
> +
> +    return ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, feat);
> +}
> +
> +int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable, bool assist)
> +{
> +    VFIOPCIDevice *vdev = VFIO_PCI(pbdev->pdev);
> +    struct vfio_device_zpci_aif *data;
> +    int size = sizeof(struct vfio_device_feature) + sizeof(*data);
> +    g_autofree struct vfio_device_feature *feat = g_malloc0(size);
> +    int rc;
> +
> +    feat->argsz = size;
> +    feat->flags = VFIO_DEVICE_FEATURE_GET + VFIO_DEVICE_FEATURE_ZPCI_AIF;
> +
> +    rc = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, feat);
> +    if (rc) {
> +        return rc;
> +    }
> +
> +    /* Determine if current interrupt settings match the host */
> +    data = (struct vfio_device_zpci_aif *)&feat->data;
> +    if (enable && (!(data->flags & VFIO_DEVICE_ZPCI_FLAG_AIF_FLOAT))) {
> +        rc = -EINVAL;
> +    } else if (!enable && (data->flags & VFIO_DEVICE_ZPCI_FLAG_AIF_FLOAT)) {
> +        rc = -EINVAL;
> +    }
> +
> +    /*
> +     * When enabled for interrupts, the assist and forced host-delivery are
> +     * mututally exclusive
> +     */

assist is unclear for me int_assist , forwarding_assist ?

> +    if (enable && assist && (data->flags & VFIO_DEVICE_ZPCI_FLAG_AIF_HOST)) {
> +        rc = -EINVAL;
> +    } else if (enable && (!assist) && (!(data->flags &
> +                                         VFIO_DEVICE_ZPCI_FLAG_AIF_HOST))) {
> +        rc = -EINVAL;
> +    }
> +
> +    return rc;
> +}
> +
>   static void s390_pci_read_base(S390PCIBusDevice *pbdev,
>                                  struct vfio_device_info *info)
>   {
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
> index a9843dfe97..9941ca0084 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -351,6 +351,7 @@ struct S390PCIBusDevice {
>       bool pci_unplug_request_processed;
>       bool unplug_requested;
>       bool interp;
> +    bool intassist;
>       QTAILQ_ENTRY(S390PCIBusDevice) link;
>   };
>   
> diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
> index 42533e38f7..6cec38a863 100644
> --- a/include/hw/s390x/s390-pci-vfio.h
> +++ b/include/hw/s390x/s390-pci-vfio.h
> @@ -13,6 +13,7 @@
>   #define HW_S390_PCI_VFIO_H
>   
>   #include "hw/s390x/s390-pci-bus.h"
> +#include "hw/s390x/s390-pci-inst.h"
>   #include CONFIG_DEVICES
>   
>   #ifdef CONFIG_VFIO
> @@ -23,6 +24,11 @@ void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
>   int s390_pci_probe_interp(S390PCIBusDevice *pbdev);
>   int s390_pci_set_interp(S390PCIBusDevice *pbdev, bool enable);
>   int s390_pci_update_passthrough_fh(S390PCIBusDevice *pbdev);
> +int s390_pci_probe_aif(S390PCIBusDevice *pbdev);
> +int s390_pci_set_aif(S390PCIBusDevice *pbdev, ZpciFib *fib, bool enable,
> +                     bool assist);
> +int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable, bool assist);
> +
>   void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
>   #else
>   static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
> @@ -48,6 +54,20 @@ static inline int s390_pci_update_passthrough_fh(S390PCIBusDevice *pbdev)
>   {
>       return -EINVAL;
>   }
> +static inline int s390_pci_probe_aif(S390PCIBusDevice *pbdev)
> +{
> +    return -EINVAL;
> +}
> +static inline int s390_pci_set_aif(S390PCIBusDevice *pbdev, ZpciFib *fib,
> +                                   bool enable, bool assist)
> +{
> +    return -EINVAL;
> +}
> +static inline int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable,
> +                                   bool assist)
> +{
> +    return -EINVAL;
> +}
>   static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
>   #endif
>   
> 


apart of the naming (which may be a personal taste) LGTM



-- 
Pierre Morel
IBM Lab Boeblingen

