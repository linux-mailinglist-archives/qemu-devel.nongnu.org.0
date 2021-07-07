Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87F3BE3F0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:51:08 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12Kp-00078M-6F
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m12Je-0006LB-DT; Wed, 07 Jul 2021 03:49:54 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m12Jc-0001sp-Gb; Wed, 07 Jul 2021 03:49:54 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 261DA1FD5A;
 Wed,  7 Jul 2021 07:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625644191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFoiARKM4qFpTTr0YcDoA3uqkxkhAZ5DCtNomhMh9UE=;
 b=WUX1t+m7aaYm2dZGJlRxyobbYb3uzAAJIt/pU0wTj8MLvcQTx02fv1TnytzXFl7vHuoG3E
 0fq5x3ctAiRG43okO1+lhc+0wTinEWME4UUE3pXmEg2wlkOtCP39D9sHN7+i9vGPHt9e+i
 TrirQoVlfygxPeiLiNjd3JIExpW/QIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625644191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFoiARKM4qFpTTr0YcDoA3uqkxkhAZ5DCtNomhMh9UE=;
 b=OnxkaGi4cczyWX/YzKcTi3MAj4hPgrofH+M0OfEtae3YsT1KshHvFfGIo+AExdE6AcsG3X
 Xa7PJh4I/QuIS2DA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EC69E1372D;
 Wed,  7 Jul 2021 07:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PwFTNp5c5WCpHgAAGKfGzw
 (envelope-from <hare@suse.de>); Wed, 07 Jul 2021 07:49:50 +0000
Subject: Re: [PATCH 4/4] hw/nvme: fix controller hot unplugging
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-5-its@irrelevant.dk>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f468bbdc-fa33-a7e6-a392-394a736a06be@suse.de>
Date: Wed, 7 Jul 2021 09:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706093358.1036387-5-its@irrelevant.dk>
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

On 7/6/21 11:33 AM, Klaus Jensen wrote:
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
>   hw/nvme/nvme.h   | 18 ++++++++++--------
>   hw/nvme/ctrl.c   |  8 +++++---
>   hw/nvme/ns.c     | 32 +++++++++++++++++++++++++-------
>   hw/nvme/subsys.c |  4 ++++
>   4 files changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index c4065467d877..9401e212f9f7 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
>   typedef struct NvmeCtrl NvmeCtrl;
>   typedef struct NvmeNamespace NvmeNamespace;
>   
> +#define TYPE_NVME_BUS "nvme-bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
> +
> +typedef struct NvmeBus {
> +    BusState parent_bus;
> +    bool     is_subsys;
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
> @@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
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
> @@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
>   
>   static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
>   {
> -    if (!nsid || nsid > NVME_MAX_NAMESPACES) {
> +    if (!n || !nsid || nsid > NVME_MAX_NAMESPACES) {
>           return NULL;
>       }
>   
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 90e3ee2b70ee..7c8fca36d9a5 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
>   
>       for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
>           ns = nvme_ns(n, i);
> -        if (!ns) {
> -            continue;
> +        if (ns) {
> +            ns->attached--;
>           }
> +    }
>   
> -        nvme_ns_cleanup(ns);
> +    if (n->subsys) {
> +        nvme_subsys_unregister_ctrl(n->subsys, n);
>       }
>   
>       if (n->subsys) {
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 3c4f5b8c714a..612a2786d75d 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>   static void nvme_ns_realize(DeviceState *dev, Error **errp)
>   {
>       NvmeNamespace *ns = NVME_NS(dev);
> -    BusState *s = qdev_get_parent_bus(dev);
> -    NvmeCtrl *n = NVME(s->parent);
> -    NvmeSubsystem *subsys = n->subsys;
> +    BusState *qbus = qdev_get_parent_bus(dev);
> +    NvmeBus *bus = NVME_BUS(qbus);
> +    NvmeCtrl *n = NULL;
> +    NvmeSubsystem *subsys = NULL;
>       uint32_t nsid = ns->params.nsid;
>       int i;
>   
> -    if (!n->subsys) {
> +    if (bus->is_subsys) {
> +        subsys = NVME_SUBSYS(qbus->parent);
> +    } else {
> +        n = NVME(qbus->parent);
> +        subsys = n->subsys;
> +    }
> +
> +    if (subsys) {
> +        /*
> +         * If this namespace belongs to a subsystem (through a link on the
> +         * controller device), reparent the device.
> +         */
> +        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
> +            return;
> +        }
> +    } else {
>           if (ns->params.detached) {
>               error_setg(errp, "detached requires that the nvme device is "
>                          "linked to an nvme-subsys device");
> @@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>   
>       if (!nsid) {
>           for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
> -            if (nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
> +            if (nvme_subsys_ns(subsys, i) || nvme_ns(n, i)) {
>                   continue;
>               }
>   
> @@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>       } else {
> -        if (nvme_ns(n, nsid) || nvme_subsys_ns(subsys, nsid)) {
> +        if (nvme_subsys_ns(subsys, nsid) || nvme_ns(n, nsid)) {
>               error_setg(errp, "namespace id '%d' already allocated", nsid);
>               return;
>           }
> @@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> -    nvme_attach_ns(n, ns);
> +    if (n) {
> +        nvme_attach_ns(n, ns);
> +    }
>   }
>   
>   static Property nvme_ns_props[] = {
> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> index 92caa604a280..fb7c3a7c55fc 100644
> --- a/hw/nvme/subsys.c
> +++ b/hw/nvme/subsys.c
> @@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
>   {
>       NvmeSubsystem *subsys = NVME_SUBSYS(dev);
>   
> +    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
> +                        dev->id);
> +    subsys->bus.is_subsys = true;
> +
>       nvme_subsys_setup(subsys);
>   }
>   
> 
Why not always create a subsystem, and distinguish between 'shared' and 
'non-shared' subsystems instead of the ->subsys pointer?
That way all namespaces can be children of the subsystem, we won't need 
any reparenting, and the whole thing will be more in-line with qdev, no?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

