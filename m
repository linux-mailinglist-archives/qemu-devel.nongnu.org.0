Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED967CA34
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:43:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0dV-0006hw-56; Thu, 26 Jan 2023 06:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pL0dS-0006hL-NC
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:41:42 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pL0dP-0002Iy-Bk
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:41:42 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P2f0Y4W2sz67JwR;
 Thu, 26 Jan 2023 19:40:45 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Jan
 2023 11:41:31 +0000
Date: Thu, 26 Jan 2023 11:41:30 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH 1/2] hw/cxl: Fix event log time stamp fields
Message-ID: <20230126114130.00000b98@huawei.com>
In-Reply-To: <20230125-ira-cxl-events-fixups-2023-01-11-v1-1-1931378515f5@intel.com>
References: <20230125-ira-cxl-events-fixups-2023-01-11-v1-0-1931378515f5@intel.com>
 <20230125-ira-cxl-events-fixups-2023-01-11-v1-1-1931378515f5@intel.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 25 Jan 2023 21:37:27 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> CXL 3.0 8.2.9.4.2 Set Timestamp and 8.2.9.4.1 Get Timestamp define the
> way for software to set and get the time stamp of a device.  Events
> should use a time stamp consistent with the Get Timestamp mailbox
> command.
> 
> In addition avoid setting the time stamp twice.
> 
> Fixes: fb64c5661d5f ("hw/cxl/events: Wire up get/clear event mailbox commands")
> Reported-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Hi Ira,

I'm going to split this patch as I am carrying a very similar
utility function for an updated version of the poison list code
and I'm not sure what order everything will go upstream in.

So I'll split this into:
1) Patch that adds cxl_device_get_timestamp() - adding the
use of this in the GET_TIMESTAMP mailbox command.

2) Changes pushed down into the patch you mention above.

Given all the code is yours, just split up, I'll keep the SOB.
Shout if you mind me doing that.

Thanks,

Jonathan

> ---
>  hw/cxl/cxl-device-utils.c   | 15 +++++++++++++++
>  hw/cxl/cxl-events.c         |  4 +++-
>  hw/cxl/cxl-mailbox-utils.c  | 11 +----------
>  hw/mem/cxl_type3.c          |  1 -
>  include/hw/cxl/cxl_device.h |  2 ++
>  5 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index 7f29d40be04a..5876a3703e85 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -325,3 +325,18 @@ void cxl_device_register_init_swcci(CXLDeviceState *cxl_dstate)
>  
>      cxl_initialize_mailbox(cxl_dstate, true);
>  }
> +
> +uint64_t cxl_device_get_timestamp(CXLDeviceState *cxl_dstate)
> +{
> +    uint64_t time, delta;
> +    uint64_t final_time = 0;
> +
> +    if (cxl_dstate->timestamp.set) {
> +        /* First find the delta from the last time the host set the time. */
> +        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        delta = time - cxl_dstate->timestamp.last_set;
> +        final_time = cxl_dstate->timestamp.host_set + delta;
> +    }
> +
> +    return final_time;
> +}
> diff --git a/hw/cxl/cxl-events.c b/hw/cxl/cxl-events.c
> index 08fd52b66188..2536aafc55fb 100644
> --- a/hw/cxl/cxl-events.c
> +++ b/hw/cxl/cxl-events.c
> @@ -100,7 +100,7 @@ bool cxl_event_insert(CXLDeviceState *cxlds,
>                        enum cxl_event_log_type log_type,
>                        struct cxl_event_record_raw *event)
>  {
> -    uint64_t time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    uint64_t time;
>      struct cxl_event_log *log;
>      CXLEvent *entry;
>  
> @@ -108,6 +108,8 @@ bool cxl_event_insert(CXLDeviceState *cxlds,
>          return false;
>      }
>  
> +    time = cxl_device_get_timestamp(cxlds);
> +
>      log = &cxlds->event_logs[log_type];
>  
>      QEMU_LOCK_GUARD(&log->lock);
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 75703023434b..0e64873c2395 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -394,17 +394,8 @@ static CXLRetCode cmd_timestamp_get(struct cxl_cmd *cmd,
>                                      CXLDeviceState *cxl_dstate,
>                                      uint16_t *len)
>  {
> -    uint64_t time, delta;
> -    uint64_t final_time = 0;
> -
> -    if (cxl_dstate->timestamp.set) {
> -        /* First find the delta from the last time the host set the time. */
> -        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -        delta = time - cxl_dstate->timestamp.last_set;
> -        final_time = cxl_dstate->timestamp.host_set + delta;
> -    }
> +    uint64_t final_time = cxl_device_get_timestamp(cxl_dstate);
>  
> -    /* Then adjust the actual time */
>      stq_le_p(cmd->payload, final_time);
>      *len = 8;
>  
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index a7b587780af2..42e291dd9f76 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -1291,7 +1291,6 @@ static void cxl_assign_event_header(struct cxl_event_record_hdr *hdr,
>      hdr->flags[0] = flags;
>      hdr->length = length;
>      memcpy(&hdr->id, uuid, sizeof(hdr->id));
> -    hdr->timestamp = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  }
>  
>  static const QemuUUID gen_media_uuid = {
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index cbb37c541c44..31579af342f1 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -426,4 +426,6 @@ CXLRetCode cxl_event_clear_records(CXLDeviceState *cxlds,
>  
>  void cxl_event_irq_assert(CXLType3Dev *ct3d);
>  
> +uint64_t cxl_device_get_timestamp(CXLDeviceState *cxlds);
> +
>  #endif
> 


