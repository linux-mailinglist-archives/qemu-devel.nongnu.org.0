Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9C64DC2B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:22:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5npy-0008F7-Pa; Thu, 15 Dec 2022 07:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5npw-0008Ax-GA
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:59:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5npu-0008MB-GB
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671109181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8bTWo2xOi26SSErnPVRp7T0G1wqKMj8KYiPQGN80cM=;
 b=Pkny/rwct1W5VZp+N8QErdgYPofGP6Q5j7HAWVOp1GrzOJSeHL+XZ0QQBIgj4/3eXoPaJO
 e/COxFLlTi9phW841kWx/q8DkOPMDZslsoNliYsXGvUp/6xwXwWba7B239b4eGdEpftWFX
 RJoPwcaH/5xtLQ+3fW7yV0mowKlhkKs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-csMvjosoN1K8xnIDneijQQ-1; Thu, 15 Dec 2022 07:59:40 -0500
X-MC-Unique: csMvjosoN1K8xnIDneijQQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d4-20020adfa404000000b002421ca8cb07so623287wra.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8bTWo2xOi26SSErnPVRp7T0G1wqKMj8KYiPQGN80cM=;
 b=FALxORVBnXEWh8Pi4a3oBmibZA+iZte8hTZL272HLu2oZyTQyZTeHCumvy4RuZDiNg
 Ki7cZyiMNXUKEDypSAijaSgkbYEeZk1aJl2342m35zI+pSzau3JRX0AvAnhYG1+BixUw
 H34dtTW09y381FGbP0Zm93h3W/hTBnodepORAmr5PQ74r50IRQ6WMQC8Agt52f3cEJ7l
 Rl4ir+Qhm7gmLc0pGUsdV+cQ1Lg6qPvC3oURhe+Fo3W4ZRSNMv5aXqsG2Npzw2MfsBXo
 Nr1oeT6RxdHt/RmfjSpnp2gWn/YObVginbqVaqiWk8QBF07ts1hvdIXJiBq9+0jpkg/J
 GUEw==
X-Gm-Message-State: ANoB5pkH1bk13EM74pYEE3QEDpUS0aGmOGLrSovYUZoK3EwESD+GUay1
 iMrnB7EcfYMyt/06Npqd5yRNIiDwcTeboy5+7i7ym9DveMou42+u/+rblXn1JW1tcHlZswwqR+S
 s470e41rJgR1s50k=
X-Received: by 2002:a05:600c:4f08:b0:3d1:d746:d95b with SMTP id
 l8-20020a05600c4f0800b003d1d746d95bmr21585036wmq.41.1671109179206; 
 Thu, 15 Dec 2022 04:59:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4TeT9XTWq1rcll3hj5nWdl2rdLLymhXUrq/BhN0ImE4m6u6DdR0zPOP1NShFP1SWFMXL2B9w==
X-Received: by 2002:a05:600c:4f08:b0:3d1:d746:d95b with SMTP id
 l8-20020a05600c4f0800b003d1d746d95bmr21585027wmq.41.1671109178961; 
 Thu, 15 Dec 2022 04:59:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c1d1300b003cf75213bb9sm7396589wms.8.2022.12.15.04.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:59:38 -0800 (PST)
Message-ID: <3744c12e-547a-c837-8548-6d7e5ee72698@redhat.com>
Date: Thu, 15 Dec 2022 13:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 24/24] vfio-user: add trace points
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <a91ec93b532f7951e7dd1c1e66aa9c304774584f.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <a91ec93b532f7951e7dd1c1e66aa9c304774584f.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/9/22 00:13, John Johnson wrote:
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/trace-events | 15 +++++++++++++++
>   hw/vfio/user.c       | 26 ++++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)


I would introduce the traces progressively in the patchset with the
routine being traced.

Thanks,

C.

> 
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 73dffe9..c27cec7 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -166,3 +166,18 @@ vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t dat
>   vfio_load_cleanup(const char *name) " (%s)"
>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> +
> +# user.c
> +vfio_user_recv_hdr(const char *name, uint16_t id, uint16_t cmd, uint32_t size, uint32_t flags) " (%s) id 0x%x cmd 0x%x size 0x%x flags 0x%x"
> +vfio_user_recv_read(uint16_t id, int read) " id 0x%x read 0x%x"
> +vfio_user_recv_request(uint16_t cmd) " command 0x%x"
> +vfio_user_send_write(uint16_t id, int wrote) " id 0x%x wrote 0x%x"
> +vfio_user_version(uint16_t major, uint16_t minor, const char *caps) " major %d minor %d caps: %s"
> +vfio_user_dma_map(uint64_t iova, uint64_t size, uint64_t off, uint32_t flags, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" off 0x%"PRIx64" flags 0x%x will_commit %d"
> +vfio_user_dma_unmap(uint64_t iova, uint64_t size, uint32_t flags, bool dirty, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" flags 0x%x dirty %d will_commit %d"
> +vfio_user_get_info(uint32_t nregions, uint32_t nirqs) " #regions %d #irqs %d"
> +vfio_user_get_region_info(uint32_t index, uint32_t flags, uint64_t size) " index %d flags 0x%x size 0x%"PRIx64
> +vfio_user_get_irq_info(uint32_t index, uint32_t flags, uint32_t count) " index %d flags 0x%x count %d"
> +vfio_user_set_irqs(uint32_t index, uint32_t start, uint32_t count, uint32_t flags) " index %d start %d count %d flags 0x%x"
> +vfio_user_region_rw(uint32_t region, uint64_t off, uint32_t count) " region %d offset 0x%"PRIx64" count %d"
> +vfio_user_wrmulti(const char *s, uint64_t wr_cnt) " %s count 0x%"PRIx64
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 4ed305b..74e1714 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -30,6 +30,8 @@
>   #include "qapi/qmp/qnum.h"
>   #include "qapi/qmp/qbool.h"
>   #include "user.h"
> +#include "trace.h"
> +
>   
>   
>   /*
> @@ -108,6 +110,8 @@ static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg)
>           vfio_user_shutdown(proxy);
>           error_report_err(local_err);
>       }
> +    trace_vfio_user_send_write(msg->hdr->id, ret);
> +
>       return ret;
>   }
>   
> @@ -225,6 +229,7 @@ static int vfio_user_complete(VFIOProxy *proxy, Error **errp)
>               }
>               return ret;
>           }
> +        trace_vfio_user_recv_read(msg->hdr->id, ret);
>   
>           msgleft -= ret;
>           data += ret;
> @@ -332,6 +337,8 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
>           error_setg(&local_err, "unknown message type");
>           goto fatal;
>       }
> +    trace_vfio_user_recv_hdr(proxy->sockname, hdr.id, hdr.command, hdr.size,
> +                             hdr.flags);
>   
>       /*
>        * For replies, find the matching pending request.
> @@ -408,6 +415,7 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
>           if (ret <= 0) {
>               goto fatal;
>           }
> +        trace_vfio_user_recv_read(hdr.id, ret);
>   
>           msgleft -= ret;
>           data += ret;
> @@ -546,6 +554,7 @@ static void vfio_user_request(void *opaque)
>       QTAILQ_INIT(&free);
>       QTAILQ_FOREACH_SAFE(msg, &new, next, m1) {
>           QTAILQ_REMOVE(&new, msg, next);
> +        trace_vfio_user_recv_request(msg->hdr->command);
>           proxy->request(proxy->req_arg, msg);
>           QTAILQ_INSERT_HEAD(&free, msg, next);
>       }
> @@ -1265,6 +1274,7 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
>       msgp->minor = VFIO_USER_MINOR_VER;
>       memcpy(&msgp->capabilities, caps->str, caplen);
>       g_string_free(caps, true);
> +    trace_vfio_user_version(msgp->major, msgp->minor, msgp->capabilities);
>   
>       vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
>       if (msgp->hdr.flags & VFIO_USER_ERROR) {
> @@ -1288,6 +1298,7 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
>           return -1;
>       }
>   
> +    trace_vfio_user_version(msgp->major, msgp->minor, msgp->capabilities);
>       return 0;
>   }
>   
> @@ -1305,6 +1316,8 @@ static int vfio_user_dma_map(VFIOProxy *proxy,
>       msgp->offset = map->vaddr;
>       msgp->iova = map->iova;
>       msgp->size = map->size;
> +    trace_vfio_user_dma_map(msgp->iova, msgp->size, msgp->offset, msgp->flags,
> +                        will_commit);
>   
>       /*
>        * The will_commit case sends without blocking or dropping BQL.
> @@ -1371,6 +1384,8 @@ static int vfio_user_dma_unmap(VFIOProxy *proxy,
>       msgp->msg.flags = unmap->flags;
>       msgp->msg.iova = unmap->iova;
>       msgp->msg.size = unmap->size;
> +    trace_vfio_user_dma_unmap(msgp->msg.iova, msgp->msg.size, msgp->msg.flags,
> +                         bitmap != NULL, will_commit);
>   
>       if (blocking) {
>           vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
> @@ -1400,6 +1415,7 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
>       if (msg.hdr.flags & VFIO_USER_ERROR) {
>           return -msg.hdr.error_reply;
>       }
> +    trace_vfio_user_get_info(msg.num_regions, msg.num_irqs);
>   
>       memcpy(info, &msg.argsz, sizeof(*info));
>       return 0;
> @@ -1434,6 +1450,7 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
>       if (msgp->hdr.flags & VFIO_USER_ERROR) {
>           return -msgp->hdr.error_reply;
>       }
> +    trace_vfio_user_get_region_info(msgp->index, msgp->flags, msgp->size);
>   
>       memcpy(info, &msgp->argsz, info->argsz);
>       return 0;
> @@ -1454,6 +1471,7 @@ static int vfio_user_get_irq_info(VFIOProxy *proxy,
>       if (msg.hdr.flags & VFIO_USER_ERROR) {
>           return -msg.hdr.error_reply;
>       }
> +    trace_vfio_user_get_irq_info(msg.index, msg.flags, msg.count);
>   
>       memcpy(info, &msg.argsz, sizeof(*info));
>       return 0;
> @@ -1499,6 +1517,8 @@ static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
>           msgp->index = irq->index;
>           msgp->start = irq->start;
>           msgp->count = irq->count;
> +        trace_vfio_user_set_irqs(msgp->index, msgp->start, msgp->count,
> +                                 msgp->flags);
>   
>           vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
>           if (msgp->hdr.flags & VFIO_USER_ERROR) {
> @@ -1535,6 +1555,8 @@ static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
>           msgp->index = irq->index;
>           msgp->start = irq->start + sent_fds;
>           msgp->count = send_fds;
> +        trace_vfio_user_set_irqs(msgp->index, msgp->start, msgp->count,
> +                                 msgp->flags);
>   
>           loop_fds.send_fds = send_fds;
>           loop_fds.recv_fds = 0;
> @@ -1565,6 +1587,7 @@ static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
>       msgp->offset = offset;
>       msgp->region = index;
>       msgp->count = count;
> +    trace_vfio_user_region_rw(msgp->region, msgp->offset, msgp->count);
>   
>       vfio_user_send_wait(proxy, &msgp->hdr, NULL, size, false);
>       if (msgp->hdr.flags & VFIO_USER_ERROR) {
> @@ -1593,6 +1616,7 @@ static void vfio_user_flush_multi(VFIOProxy *proxy)
>       msg->id = wm->hdr.id;
>       msg->rsize = 0;
>       msg->type = VFIO_MSG_ASYNC;
> +    trace_vfio_user_wrmulti("flush", wm->wr_cnt);
>   
>       ret = vfio_user_send_queued(proxy, msg);
>       if (ret < 0) {
> @@ -1622,6 +1646,7 @@ static void vfio_user_add_multi(VFIOProxy *proxy, uint8_t index, off_t offset,
>       memcpy(&w1->data, data, count);
>   
>       wm->wr_cnt++;
> +    trace_vfio_user_wrmulti("add", wm->wr_cnt);
>       if (wm->wr_cnt == VFIO_USER_MULTI_MAX ||
>           proxy->num_outgoing < VFIO_USER_OUT_LOW) {
>           vfio_user_flush_multi(proxy);
> @@ -1689,6 +1714,7 @@ static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
>       msgp->region = index;
>       msgp->count = count;
>       memcpy(&msgp->data, data, count);
> +    trace_vfio_user_region_rw(msgp->region, msgp->offset, msgp->count);
>   
>       /* async send will free msg after it's sent */
>       if (post) {


