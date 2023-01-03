Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42E65C3E9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 17:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCkBG-0001U7-6a; Tue, 03 Jan 2023 11:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pCkBA-0001Tj-34
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:30:20 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pCkB7-0003HR-4J
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:30:19 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NmdPj4qgcz6HJgg;
 Wed,  4 Jan 2023 00:25:29 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:30:09 +0000
Date: Tue, 3 Jan 2023 16:30:08 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/8] hw/cxl/mailbox: Use new UUID network order
 define for cel_uuid
Message-ID: <20230103163008.00002547@huawei.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-3-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
 <20221221-ira-cxl-events-2022-11-17-v2-3-2ce2ecc06219@intel.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 21 Dec 2022 20:24:33 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> The cel_uuid was programatically generated previously because there was
> no static initializer for network order UUIDs.
> 
> Use the new network order initializer for cel_uuid.  Adjust
> cxl_initialize_mailbox() because it can't fail now.
> 
> Update specification reference.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

I clearly need a 'pending' branch or tag with just the sane / nearly
ready to send upstream stuff on it.  The switch-cci stuff definitely
isn't in that category yet and made this more complex than it needs
to be.

Anyhow, I'll rebase the series to a sensible point in my tree and
push out a new branch for you to sanity check.

This patch and the two before it make sense even without the rest of
the series so I might pull them forwards into a cleanup series I intend
to send out later this week - we'll see how things go.

Assuming any changes to the rest of this series are minor, my thoughts
are we do the following this cycle (and see how far we get)

1) Cleanup series.
2) RAS event series - AER etc.
3) This series
4) Poison series
5) Volatile memory series from Gregory

Might slot the CPMU and ARM64 support in there somewhere, but after this series.

> 
> ---
> Changes from RFC:
> 	New patch.
> ---
>  hw/cxl/cxl-device-utils.c   |  4 ++--
>  hw/cxl/cxl-mailbox-utils.c  | 14 +++++++-------
>  include/hw/cxl/cxl_device.h |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index 21845dbfd050..34697064714e 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -267,7 +267,7 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
>      cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
>      memdev_reg_init_common(cxl_dstate);
>  
> -    assert(cxl_initialize_mailbox(cxl_dstate, false) == 0);
> +    cxl_initialize_mailbox(cxl_dstate, false);
>  }
>  
>  void cxl_device_register_init_swcci(CXLDeviceState *cxl_dstate)
> @@ -289,5 +289,5 @@ void cxl_device_register_init_swcci(CXLDeviceState *cxl_dstate)
>      cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
>      memdev_reg_init_common(cxl_dstate);
>  
> -    assert(cxl_initialize_mailbox(cxl_dstate, true) == 0);
> +    cxl_initialize_mailbox(cxl_dstate, true);
>  }
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index c1183614b9a4..157c01255ee3 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -321,7 +321,11 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
>      return CXL_MBOX_SUCCESS;
>  }
>  
> -static QemuUUID cel_uuid;
> +/* CXL 3.0 8.2.9.5.2.1 Command Effects Log (CEL) */
> +static QemuUUID cel_uuid = {
> +        .data = UUID(0x0da9c0b5, 0xbf41, 0x4b78, 0x8f, 0x79,
> +                     0x96, 0xb1, 0x62, 0x3b, 0x3f, 0x17)
> +};
>  
>  /* 8.2.9.4.1 */
>  static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
> @@ -684,16 +688,14 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
>                       DOORBELL, 0);
>  }
>  
> -int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci)
> +void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci)
>  {
> -    /* CXL 2.0: Table 169 Get Supported Logs Log Entry */
> -    const char *cel_uuidstr = "0da9c0b5-bf41-4b78-8f79-96b1623b3f17";
> -
>      if (!switch_cci) {
>          cxl_dstate->cxl_cmd_set = cxl_cmd_set;
>      } else {
>          cxl_dstate->cxl_cmd_set = cxl_cmd_set_sw;
>      }
> +
Trivial but this white space change doesn't belong in a patch doing other stuff.
It became irrelevant anyway when I rebased, but I like to moan.


>      for (int set = 0; set < 256; set++) {
>          for (int cmd = 0; cmd < 256; cmd++) {
>              if (cxl_dstate->cxl_cmd_set[set][cmd].handler) {
> @@ -707,6 +709,4 @@ int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci)
>              }
>          }
>      }
> -
> -    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
>  }
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 1b366b739c62..3be2e37b3e4c 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -238,7 +238,7 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
>                                        CXL_DEVICE_CAP_HDR1_OFFSET +
>                                            CXL_DEVICE_CAP_REG_SIZE * 2)
>  
> -int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci);
> +void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci);
>  void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
>  
>  #define cxl_device_cap_init(dstate, reg, cap_id)                           \
> 


