Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BD2EB131
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:18:16 +0100 (CET)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpyI-0006Ye-VT
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwptA-00087c-Oo
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:12:56 -0500
Received: from mga04.intel.com ([192.55.52.120]:64044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpt7-0005B8-Sq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:12:55 -0500
IronPort-SDR: 2z4p+bBezwGwQy6fhu4rmlUFkG8osrMmsz7BQ23iJtOd4JjoTKjjw6f5IW1ZY1KfV4IdfT4FP8
 UvobVLoAmhvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="174568027"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="174568027"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 09:12:51 -0800
IronPort-SDR: qW1WkZxQ7PJVT7ZvvQWnyCO6Xc6WYCG3lx4f94UHeRl0bMbSb3UHnEqZ0ejrmLitQxeNC2WJtd
 uKx4MrPQmk1A==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="397895002"
Received: from dmayx-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.142.146])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 09:12:50 -0800
Date: Tue, 5 Jan 2021 09:12:48 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 11/32] hw/cxl/device: Timestamp implementation
 (8.2.9.3)
Message-ID: <20210105171248.nqebaxx7kzmivcxc@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-12-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105165323.783725-12-ben.widawsky@intel.com>
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=ben.widawsky@intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Chris Browy <cbrowy@avery-design.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-05 08:53:02, Ben Widawsky wrote:
> Per spec, timestamp appears to be a free-running counter from a value
> set by the host via the Set Timestamp command (0301h). There are
> references to the epoch, which seem like a red herring. Therefore, the
> implementation implements the timestamp as freerunning counter from the
> last value that was issued by the Set Timestamp command.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 52 +++++++++++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_device.h |  6 +++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 890e486ea1..8b956d9e94 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -43,6 +43,9 @@ enum {
>          #define CLEAR_RECORDS   0x1
>          #define GET_INTERRUPT_POLICY   0x2
>          #define SET_INTERRUPT_POLICY   0x3
> +    TIMESTAMP   = 0x03,
> +        #define GET           0x0
> +        #define SET           0x1
>  };
>  
>  /* 8.2.8.4.5.1 Command Return Codes */
> @@ -117,8 +120,11 @@ define_mailbox_handler_zeroed(EVENTS_GET_RECORDS, 0x20);
>  define_mailbox_handler_nop(EVENTS_CLEAR_RECORDS);
>  define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
>  define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
> +declare_mailbox_handler(TIMESTAMP_GET);
> +declare_mailbox_handler(TIMESTAMP_SET);
>  
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> +#define IMMEDIATE_POLICY_CHANGE (1 << 3)
>  #define IMMEDIATE_LOG_CHANGE (1 << 4)
>  
>  #define CXL_CMD(s, c, in, cel_effect) \
> @@ -129,10 +135,56 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
>      CXL_CMD(EVENTS, CLEAR_RECORDS, ~0, IMMEDIATE_LOG_CHANGE),
>      CXL_CMD(EVENTS, GET_INTERRUPT_POLICY, 0, 0),
>      CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
> +    CXL_CMD(TIMESTAMP, GET, 0, 0),
> +    CXL_CMD(TIMESTAMP, SET, 8, IMMEDIATE_POLICY_CHANGE),
>  };
>  
>  #undef CXL_CMD
>  
> +/*
> + * 8.2.9.3.1
> + */
> +define_mailbox_handler(TIMESTAMP_GET)
> +{
> +    struct timespec ts;
> +
> +    clock_gettime(CLOCK_REALTIME, &ts);
> +
> +    cxl_dstate->timestamp.set = true;
> +    cxl_dstate->timestamp.last_set =
> +        ts.tv_sec * NANOSECONDS_PER_SECOND + ts.tv_nsec;
> +    cxl_dstate->timestamp.host_set = *(uint64_t *)cmd->payload;
> +
> +    *len = 8;
> +    return CXL_MBOX_SUCCESS;
> +}
> +
> +/*
> + * 8.2.9.3.2
> + */
> +define_mailbox_handler(TIMESTAMP_SET)
> +{
> +    struct timespec ts;
> +    uint64_t delta;
> +
> +    if (!cxl_dstate->timestamp.set) {
> +        *(uint64_t *)cmd->payload = 0;
> +        goto done;
> +    }
> +
> +    /* First find the delta from the last time the host set the time. */
> +    clock_gettime(CLOCK_REALTIME, &ts);
> +    delta = (ts.tv_sec * NANOSECONDS_PER_SECOND + ts.tv_nsec) -
> +            cxl_dstate->timestamp.host_set;
> +
> +    /* Then adjust the actual time */
> +    *(uint64_t *)cmd->payload = cxl_dstate->timestamp.host_set + delta;
> +
> +done:
> +    *len = 8;
> +    return CXL_MBOX_SUCCESS;
> +}
> +

Set/get are reversed here. I missed the fixup before sending.

>  QemuUUID cel_uuid;
>  
>  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index dd3f4572aa..25974b2416 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -100,6 +100,12 @@ typedef struct cxl_device_state {
>          size_t cel_size;
>      };
>  
> +    struct {
> +        bool set;
> +        uint64_t last_set;
> +        uint64_t host_set;
> +    } timestamp;
> +
>      MemoryRegion *pmem;
>      MemoryRegion *vmem;
>  } CXLDeviceState;
> -- 
> 2.30.0
> 

