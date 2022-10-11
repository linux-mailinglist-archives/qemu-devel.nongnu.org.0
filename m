Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C75FB084
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:34:12 +0200 (CEST)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCaO-0006oL-CA
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiCT1-000160-1b
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:26:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiCSy-00042V-Bt
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:26:30 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MmsNM3L3Zz688g6;
 Tue, 11 Oct 2022 18:24:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 12:26:13 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 11:26:12 +0100
Date: Tue, 11 Oct 2022 11:26:11 +0100
To: <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [RFC PATCH 4/6] hw/cxl/mailbox: Wire up get/clear event mailbox
 commands
Message-ID: <20221011112611.000076f4@huawei.com>
In-Reply-To: <20221010222944.3923556-5-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-5-ira.weiny@intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 10 Oct 2022 15:29:42 -0700
ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> Replace the stubbed out CXL Get/Clear Event mailbox commands with
> commands which return the mock event information.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  hw/cxl/cxl-device-utils.c  |   1 +
>  hw/cxl/cxl-mailbox-utils.c | 103 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 101 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index 687759b3017b..4bb41101882e 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -262,4 +262,5 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
>      memdev_reg_init_common(cxl_dstate);
>  
>      assert(cxl_initialize_mailbox(cxl_dstate) == 0);
> +    cxl_mock_add_event_logs(cxl_dstate);

Given you add support for injection later, why start with some records?
If we do want to do this for testing detection of events before driver
is loaded, then add a parameter to the command line to turn this on.

>  }
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index bb66c765a538..df345f23a30c 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -9,6 +9,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/cxl/cxl.h"
> +#include "hw/cxl/cxl_events.h"
>  #include "hw/pci/pci.h"
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
> @@ -116,11 +117,107 @@ struct cxl_cmd {
>          return CXL_MBOX_SUCCESS;                                          \
>      }
>  
> -DEFINE_MAILBOX_HANDLER_ZEROED(events_get_records, 0x20);
> -DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
>  DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
>  DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
>  
> +static ret_code cmd_events_get_records(struct cxl_cmd *cmd,
> +                                       CXLDeviceState *cxlds,
> +                                       uint16_t *len)
> +{
> +    struct cxl_get_event_payload *pl;
> +    struct cxl_event_log *log;
> +    uint8_t log_type;
> +    uint16_t nr_overflow;
> +
> +    if (cmd->in < sizeof(log_type)) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    log_type = *((uint8_t *)cmd->payload);
> +    if (log_type >= CXL_EVENT_TYPE_MAX) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    pl = (struct cxl_get_event_payload *)cmd->payload;
> +
> +    log = find_event_log(cxlds, log_type);
> +    if (!log || log_empty(log)) {
> +        goto no_data;
> +    }
> +
> +    memset(pl, 0, sizeof(*pl));
> +    pl->record_count = const_le16(1);
> +
> +    if (log_rec_left(log) > 1) {

As below we need to handle a request that can take more than
one record, otherwise we aren't complaint with the spec.

> +        pl->flags |= CXL_GET_EVENT_FLAG_MORE_RECORDS;
> +    }
> +
> +    nr_overflow = log_overflow(log);
> +    if (nr_overflow) {
> +        struct timespec ts;
> +        uint64_t ns;
> +
> +        clock_gettime(CLOCK_REALTIME, &ts);
> +
> +        ns = ((uint64_t)ts.tv_sec * 1000000000) + (uint64_t)ts.tv_nsec;
> +
> +        pl->flags |= CXL_GET_EVENT_FLAG_OVERFLOW;
> +        pl->overflow_err_count = cpu_to_le16(nr_overflow);
> +        ns -= 5000000000; /* 5s ago */
> +        pl->first_overflow_timestamp = cpu_to_le64(ns);
> +        ns -= 1000000000; /* 1s ago */
> +        pl->last_overflow_timestamp = cpu_to_le64(ns);
> +    }
> +
> +    memcpy(&pl->record, get_cur_event(log), sizeof(pl->record));
> +    pl->record.hdr.handle = get_cur_event_handle(log);
> +    *len = sizeof(pl->record);
> +    return CXL_MBOX_SUCCESS;
> +
> +no_data:
> +    *len = sizeof(*pl) - sizeof(pl->record);
> +    memset(pl, 0, *len);
> +    return CXL_MBOX_SUCCESS;
> +}
> +
> +static ret_code cmd_events_clear_records(struct cxl_cmd *cmd,
> +                                         CXLDeviceState *cxlds,
> +                                         uint16_t *len)
> +{
> +    struct cxl_mbox_clear_event_payload *pl;
> +    struct cxl_event_log *log;
> +    uint8_t log_type;
> +
> +    pl = (struct cxl_mbox_clear_event_payload *)cmd->payload;
> +    log_type = pl->event_log;
> +
> +    /* Don't handle more than 1 record at a time */
> +    if (pl->nr_recs != 1) {

I think we need to fix this so it will handle multiple clears + hack just
enough in on kernel side to verify it.

I don't recall seeing that invalid input is something we can return if
we simply don't support as many clear entries as the command provides.

> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    if (log_type >= CXL_EVENT_TYPE_MAX) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    log = find_event_log(cxlds, log_type);
> +    if (!log) {
> +        return CXL_MBOX_SUCCESS;
> +    }
> +
> +    /*
> +     * The current code clears events as they are read.  Test that behavior
> +     * only; don't support clearning from the middle of the log

This comment had me worried that we were looking at needing
to request an errata.
Thankfully there is a statement in the r3.0 spec under 8.2.9.2.3
"Events shall be cleared in temporal order.  The device shall
verify the event record handles specified in the input payload are
in temporal order.  If the device detects an older event record
that will not be cleared when Clear Event Records is executed,
the device shall return Invalid Handle return code and shall not
clear any of the specified event codes"

Hence, wrong return value and the comment needs updating to reflect
that such a mid log clear isn't allowed by the spec.


> +     */
> +    if (log->cur_event != le16_to_cpu(pl->handle)) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    log->cur_event++;
> +    *len = 0;
> +    return CXL_MBOX_SUCCESS;
> +}
> +
>  /* 8.2.9.2.1 */
>  static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
>                                               CXLDeviceState *cxl_dstate,
> @@ -391,7 +488,7 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
>      [EVENTS][GET_RECORDS] = { "EVENTS_GET_RECORDS",
>          cmd_events_get_records, 1, 0 },
>      [EVENTS][CLEAR_RECORDS] = { "EVENTS_CLEAR_RECORDS",
> -        cmd_events_clear_records, ~0, IMMEDIATE_LOG_CHANGE },
> +        cmd_events_clear_records, 8, IMMEDIATE_LOG_CHANGE },

>      [EVENTS][GET_INTERRUPT_POLICY] = { "EVENTS_GET_INTERRUPT_POLICY",
>          cmd_events_get_interrupt_policy, 0, 0 },
>      [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",


