Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7355FB296
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:43:00 +0200 (CEST)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEb5-0002pW-3G
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiCgI-0003F9-Gb
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:40:19 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiCgD-0007HP-Kj
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:40:12 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mmsfk6r6Zz67ljv;
 Tue, 11 Oct 2022 18:37:18 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 12:40:05 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 11:40:05 +0100
Date: Tue, 11 Oct 2022 11:40:04 +0100
To: <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [RFC PATCH 6/6] hw/cxl/mailbox: Wire up Get/Set Event Interrupt
 policy
Message-ID: <20221011114004.00006ac1@huawei.com>
In-Reply-To: <20221010222944.3923556-7-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-7-ira.weiny@intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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

On Mon, 10 Oct 2022 15:29:44 -0700
ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> Replace the stubbed out CXL Get/Set Event interrupt policy mailbox
> commands.  Enable those commands to control interrupts for each of the
> event log types.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
A few trivial comments inline.

Thanks,

Jonathan

> ---
>  hw/cxl/cxl-mailbox-utils.c  | 129 ++++++++++++++++++++++++++++++------
>  include/hw/cxl/cxl_events.h |  21 ++++++
>  2 files changed, 129 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index df345f23a30c..52e8804c24ed 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -101,25 +101,6 @@ struct cxl_cmd {
>      uint8_t *payload;
>  };
>  
> -#define DEFINE_MAILBOX_HANDLER_ZEROED(name, size)                         \
> -    uint16_t __zero##name = size;                                         \
> -    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
> -                               CXLDeviceState *cxl_dstate, uint16_t *len) \
> -    {                                                                     \
> -        *len = __zero##name;                                              \
> -        memset(cmd->payload, 0, *len);                                    \
> -        return CXL_MBOX_SUCCESS;                                          \
> -    }
> -#define DEFINE_MAILBOX_HANDLER_NOP(name)                                  \
> -    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
> -                               CXLDeviceState *cxl_dstate, uint16_t *len) \
> -    {                                                                     \
> -        return CXL_MBOX_SUCCESS;                                          \
> -    }
> -
> -DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
> -DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
> -
>  static ret_code cmd_events_get_records(struct cxl_cmd *cmd,
>                                         CXLDeviceState *cxlds,
>                                         uint16_t *len)
> @@ -218,6 +199,110 @@ static ret_code cmd_events_clear_records(struct cxl_cmd *cmd,
>      return CXL_MBOX_SUCCESS;
>  }
>  
> +static ret_code cmd_events_get_interrupt_policy(struct cxl_cmd *cmd,
> +                                                CXLDeviceState *cxl_dstate,
> +                                                uint16_t *len)
> +{
> +    struct cxl_event_interrupt_policy *policy;
> +    struct cxl_event_log *log;
> +
> +    policy = (struct cxl_event_interrupt_policy *)cmd->payload;
> +    memset(policy, 0, sizeof(*policy));
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_INFO);

Less obvious than below case, but again, perhaps a little utility function
to cut down on duplication.

> +    if (log->irq_enabled) {
> +        policy->info_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_WARN);
> +    if (log->irq_enabled) {
> +        policy->warn_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FAIL);
> +    if (log->irq_enabled) {
> +        policy->failure_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FATAL);
> +    if (log->irq_enabled) {
> +        policy->fatal_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_DYNAMIC_CAP);
> +    if (log->irq_enabled) {
> +        /* Dynamic Capacity borrows the same vector as info */
> +        policy->dyn_cap_settings = CXL_INT_MSI_MSIX;
> +    }
> +
> +    *len = sizeof(*policy);
> +    return CXL_MBOX_SUCCESS;
> +}
> +
> +static ret_code cmd_events_set_interrupt_policy(struct cxl_cmd *cmd,
> +                                                CXLDeviceState *cxl_dstate,
> +                                                uint16_t *len)
> +{
> +    struct cxl_event_interrupt_policy *policy;
> +    struct cxl_event_log *log;
> +
> +    policy = (struct cxl_event_interrupt_policy *)cmd->payload;
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_INFO);
Maybe a utility function?

	set_int_policy(cxl_dstate, CXL_EVENT_TYPE_INFO,
		       policy->info_settings);
	set_int_policy(cxl_dstate, CXL_EVENT_TYPE_WARN,
		       policy->warn_settings);
etc


> +    if ((policy->info_settings & CXL_EVENT_INT_MODE_MASK) ==
> +                                                    CXL_INT_MSI_MSIX) {
> +        log->irq_enabled = true;
> +        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_INFO];
> +    } else {
> +        log->irq_enabled = false;
> +        log->irq_vec = 0;
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_WARN);
> +    if ((policy->warn_settings & CXL_EVENT_INT_MODE_MASK) ==
> +                                                    CXL_INT_MSI_MSIX) {
> +        log->irq_enabled = true;
> +        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_WARN];
> +    } else {
> +        log->irq_enabled = false;
> +        log->irq_vec = 0;
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FAIL);
> +    if ((policy->failure_settings & CXL_EVENT_INT_MODE_MASK) ==
> +                                                    CXL_INT_MSI_MSIX) {
> +        log->irq_enabled = true;
> +        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_FAIL];
> +    } else {
> +        log->irq_enabled = false;
> +        log->irq_vec = 0;
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FATAL);
> +    if ((policy->fatal_settings & CXL_EVENT_INT_MODE_MASK) ==
> +                                                    CXL_INT_MSI_MSIX) {
> +        log->irq_enabled = true;
> +        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_FATAL];
> +    } else {
> +        log->irq_enabled = false;
> +        log->irq_vec = 0;
> +    }
> +
> +    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_DYNAMIC_CAP);
> +    if ((policy->dyn_cap_settings & CXL_EVENT_INT_MODE_MASK) ==
> +                                                    CXL_INT_MSI_MSIX) {
> +        log->irq_enabled = true;
> +        /* Dynamic Capacity borrows the same vector as info */
> +        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_INFO];
> +    } else {
> +        log->irq_enabled = false;
> +        log->irq_vec = 0;
> +    }
> +
> +    *len = sizeof(*policy);
> +    return CXL_MBOX_SUCCESS;
> +}
> +

...

> diff --git a/include/hw/cxl/cxl_events.h b/include/hw/cxl/cxl_events.h
> index 255111f3dcfb..c121e504a6db 100644
> --- a/include/hw/cxl/cxl_events.h
> +++ b/include/hw/cxl/cxl_events.h
> @@ -170,4 +170,25 @@ struct cxl_event_mem_module {
>      uint8_t reserved[CXL_EVENT_MEM_MOD_RES_SIZE];
>  } QEMU_PACKED;
>  
> +/**
> + * Event Interrupt Policy
> + *
> + * CXL rev 3.0 section 8.2.9.2.4; Table 8-52
> + */
> +enum cxl_event_int_mode {
> +    CXL_INT_NONE     = 0x00,
> +    CXL_INT_MSI_MSIX = 0x01,
> +    CXL_INT_FW       = 0x02,

I guess at somepoint we'll probably want to wire up the INT_FW path.
Job for another day though!

> +    CXL_INT_RES      = 0x03,

Why define the reserved value here?  By definition we won't use it.

> +};
> +#define CXL_EVENT_INT_MODE_MASK 0x3
> +#define CXL_EVENT_INT_SETTING(vector) ((((uint8_t)vector & 0xf) << 4) | CXL_INT_MSI_MSIX)

I probably haven't had enough caffeine yet today, but why the cast given
you are masking to a smaller range?

> +struct cxl_event_interrupt_policy {
> +    uint8_t info_settings;

Can we shorten these to just info, warn, failure, fatal, dyn_cap?
No real loss I think and will help with some of the long lines above.

> +    uint8_t warn_settings;
> +    uint8_t failure_settings;
> +    uint8_t fatal_settings;
> +    uint8_t dyn_cap_settings;
> +} QEMU_PACKED;
> +
>  #endif /* CXL_EVENTS_H */


