Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1123BEBC4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:04:01 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1A1o-0003hq-50
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m19vH-0007RH-J8; Wed, 07 Jul 2021 11:57:15 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:53018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m19vF-0003yY-Kl; Wed, 07 Jul 2021 11:57:15 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9E00200C0;
 Wed,  7 Jul 2021 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625673431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBw2tSCHPpAoplVY4u+T/27RhecmXldttr0W5a20pwI=;
 b=wm2nurFsFso6gUamufCOo1GOezPxrLCkz0XAA0TGb/+ACBArjSzc0ApxmPOtO1Mp77q3y1
 6Q5tQ5sJTW35kcIDw8Fee5AamGXY7dUIwqT2ZghVnfVybqZ9y8sXRM17wPg1N3JpN77bWS
 imkzvDa+hnS+/Wz/2/zm4Tx9f+Yua34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625673431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBw2tSCHPpAoplVY4u+T/27RhecmXldttr0W5a20pwI=;
 b=4PtniBQZ63gEEtVNVTXVs4RIw1m2JN/ohV/KO7whcuVS2mEakXJBU1NvYZtXxIgXQredrF
 1okX+TKzRb4oG3Cg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9F01613418;
 Wed,  7 Jul 2021 15:57:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id czcuJdfO5WAvQwAAGKfGzw
 (envelope-from <hare@suse.de>); Wed, 07 Jul 2021 15:57:11 +0000
Subject: Re: [PATCH v2 4/4] hw/nvme: fix controller hot unplugging
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210707154936.200166-1-its@irrelevant.dk>
 <20210707154936.200166-5-its@irrelevant.dk>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <375ea826-589f-2a18-ea0b-e3ec672a9916@suse.de>
Date: Wed, 7 Jul 2021 17:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707154936.200166-5-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 5:49 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Prior to this patch the nvme-ns devices are always children of the
> NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
> unrealized when the parent device is removed. However, when subsystems
> are involved, this is not what we want since the namespaces may be
> attached to other controllers as well.
> 
> This patch adds an additional NvmeBus on the subsystem device. When
> nvme-ns devices are realized, if the parent controller device is linked
> to a subsystem, the parent bus is set to the subsystem one instead. This
> makes sure that namespaces are kept alive and not unrealized.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/nvme.h   | 15 ++++++++-------
>   hw/nvme/ctrl.c   | 14 ++++++--------
>   hw/nvme/ns.c     | 18 ++++++++++++++++++
>   hw/nvme/subsys.c |  3 +++
>   4 files changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index c4065467d877..83ffabade4cf 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -33,12 +33,20 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
>   typedef struct NvmeCtrl NvmeCtrl;
>   typedef struct NvmeNamespace NvmeNamespace;
>   
> +#define TYPE_NVME_BUS "nvme-bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
> +
> +typedef struct NvmeBus {
> +    BusState parent_bus;
> +} NvmeBus;
> +
>   #define TYPE_NVME_SUBSYS "nvme-subsys"
>   #define NVME_SUBSYS(obj) \
>       OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
>   
>   typedef struct NvmeSubsystem {
>       DeviceState parent_obj;
> +    NvmeBus     bus;
>       uint8_t     subnqn[256];
>   
>       NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
> @@ -365,13 +373,6 @@ typedef struct NvmeCQueue {
>       QTAILQ_HEAD(, NvmeRequest) req_list;
>   } NvmeCQueue;
>   
> -#define TYPE_NVME_BUS "nvme-bus"
> -#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
> -
> -typedef struct NvmeBus {
> -    BusState parent_bus;
> -} NvmeBus;
> -
>   #define TYPE_NVME "nvme"
>   #define NVME(obj) \
>           OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 90e3ee2b70ee..9a3b3a27c293 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6514,16 +6514,14 @@ static void nvme_exit(PCIDevice *pci_dev)
>   
>       nvme_ctrl_reset(n);
>   
> -    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
> -        ns = nvme_ns(n, i);
> -        if (!ns) {
> -            continue;
> +    if (n->subsys) {
> +        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
> +            ns = nvme_ns(n, i);
> +            if (ns) {
> +                ns->attached--;
> +            }
>           }
>   
> -        nvme_ns_cleanup(ns);

So who is removing the namespaces, then?
I would have expected some cleanup action from the subsystem, seeing 
that we reparent to that ...

> -    }
> -
> -    if (n->subsys) {
>           nvme_subsys_unregister_ctrl(n->subsys, n);
>       }
>   
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 3c4f5b8c714a..b7cf1494e75b 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -441,6 +441,15 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>       }
>   }
>   
> +static void nvme_ns_unrealize(DeviceState *dev)
> +{
> +    NvmeNamespace *ns = NVME_NS(dev);
> +
> +    nvme_ns_drain(ns);
> +    nvme_ns_shutdown(ns);
> +    nvme_ns_cleanup(ns);
> +}
> +
>   static void nvme_ns_realize(DeviceState *dev, Error **errp)
>   {
>       NvmeNamespace *ns = NVME_NS(dev);
> @@ -462,6 +471,14 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>                          "linked to an nvme-subsys device");
>               return;
>           }
> +    } else {
> +        /*
> +         * If this namespace belongs to a subsystem (through a link on the
> +         * controller device), reparent the device.
> +         */
> +        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
> +            return;
> +        }

What happens if that fails?
Will we abort? Not create the namespace?

>       }
>   
>       if (nvme_ns_setup(ns, errp)) {
> @@ -552,6 +569,7 @@ static void nvme_ns_class_init(ObjectClass *oc, void *data)
>   
>       dc->bus_type = TYPE_NVME_BUS;
>       dc->realize = nvme_ns_realize;
> +    dc->unrealize = nvme_ns_unrealize;
>       device_class_set_props(dc, nvme_ns_props);
>       dc->desc = "Virtual NVMe namespace";
>   }
> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> index 92caa604a280..93c35950d69d 100644
> --- a/hw/nvme/subsys.c
> +++ b/hw/nvme/subsys.c
> @@ -50,6 +50,9 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
>   {
>       NvmeSubsystem *subsys = NVME_SUBSYS(dev);
>   
> +    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
> +                        dev->id);
> +
>       nvme_subsys_setup(subsys);
>   }
>   
> 
Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

