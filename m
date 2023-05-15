Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC937702EDB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:55:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYfS-0003RO-LH; Mon, 15 May 2023 09:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyYfN-0003Qz-Iv
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:55:09 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyYfH-0005eg-3P
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:55:09 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QKgp24gj9z67mZc;
 Mon, 15 May 2023 21:54:02 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 14:54:59 +0100
Date: Mon, 15 May 2023 14:54:58 +0100
To: Fan Ni <fan.ni@samsung.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, 
 Adam Manzanares <a.manzanares@samsung.com>, "dave@stgolabs.net"
 <dave@stgolabs.net>, "nmtadam.samsung@gmail.com" <nmtadam.samsung@gmail.com>, 
 "nifan@outlook.com" <nifan@outlook.com>
Subject: Re: [RFC 2/7] hw/cxl/cxl-mailbox-utils: Add dynamic capacity region
 representative and mailbox command support
Message-ID: <20230515145458.0000725b@Huawei.com>
In-Reply-To: <20230511175609.2091136-3-fan.ni@samsung.com>
References: <20230511175609.2091136-1-fan.ni@samsung.com>
 <CGME20230511175641uscas1p165a19a1416facf6603bf1a417121f0dc@uscas1p1.samsung.com>
 <20230511175609.2091136-3-fan.ni@samsung.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 11 May 2023 17:56:40 +0000
Fan Ni <fan.ni@samsung.com> wrote:

> From: Fan Ni <nifan@outlook.com>
> 
> Per cxl spec 3.0, add dynamic capacity region representative based on
> Table 8-126 and extend the cxl type3 device definition to include dc region
> information. Also, based on info in 8.2.9.8.9.1, add 'Get Dynamic Capacity
> Configuration' mailbox support.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 68 +++++++++++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_device.h | 16 +++++++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 7ff4fbdf22..61c77e52d8 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -81,6 +81,8 @@ enum {
>          #define GET_POISON_LIST        0x0
>          #define INJECT_POISON          0x1
>          #define CLEAR_POISON           0x2
> +	DCD_CONFIG = 0x48, /*8.2.9.8.9*/

Always include which spec version in references.  Stuff keeps moving.

> +		#define GET_DC_REGION_CONFIG   0x0

Called simply Dynamic Capacity Configuration in spec.  Sure it's
all regions today, but who knows in future so we should match
naming.  GET_DC_CONFIG should do.

>      PHYSICAL_SWITCH = 0x51
>          #define IDENTIFY_SWITCH_DEVICE      0x0
>  };
> @@ -935,6 +937,70 @@ static CXLRetCode cmd_media_clear_poison(struct cxl_cmd *cmd,
>      return CXL_MBOX_SUCCESS;
>  }
>  
> +/*
> + * cxl spec 3.0: 8.2.9.8.9.2
> + * Get Dynamic Capacity Configuration
> + **/
> +static CXLRetCode cmd_dcd_get_dyn_cap_config(struct cxl_cmd *cmd,
> +		CXLDeviceState *cxl_dstate,
> +		uint16_t *len)
> +{
> +	struct get_dyn_cap_config_in_pl {
> +		uint8_t region_cnt;
> +		uint8_t start_region_id;
> +	} QEMU_PACKED;
> +
> +    struct get_dyn_cap_config_out_pl {
> +		uint8_t num_regions;
> +		uint8_t rsvd1[7];
> +		struct {
> +			uint64_t base;
> +			uint64_t decode_len;
> +			uint64_t region_len;
> +			uint64_t block_size;
> +			uint32_t dsmadhandle;
> +			uint8_t flags;
> +			uint8_t rsvd2[3];
> +		} QEMU_PACKED records[];
> +	} QEMU_PACKED;
> +
> +	struct get_dyn_cap_config_in_pl *in = (void *)cmd->payload;
> +	struct get_dyn_cap_config_out_pl *out = (void *)cmd->payload;
> +	struct CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> +	uint16_t record_count = 0, i = 0;
> +	uint16_t out_pl_len;
> +
> +	if (in->start_region_id >= ct3d->dc.num_regions)
> +		record_count = 0;

Probably an error return rather than 0 records. Invalid input seems most appropriate.
My expectation, though the text doesn't call it out is that first issued command is
for 0 records to just get the Number of Available Regions, then rest of entries
will be right size.    A similar case for Get Supported Features calls out
"The device shall return Invalid Input if Starting Feature Index is greater than the
Device Supported Features value"

> +	else if (ct3d->dc.num_regions - in->start_region_id < in->region_cnt)
> +		record_count = ct3d->dc.num_regions - in->start_region_id;
> +	else
> +		record_count = in->region_cnt;

Do the last two conditions with min() ?

> +
> +	out_pl_len = sizeof(*out) + record_count * sizeof(out->records[0]);
> +	assert(out_pl_len <= CXL_MAILBOX_MAX_PAYLOAD_SIZE);
> +
> +	memset(out, 0, out_pl_len);
> +	out->num_regions = record_count;
> +	for (; i < record_count; i++) {

i = 0 here makes more sense to me.

> +		stq_le_p(&out->records[i].base,
> +			ct3d->dc.regions[in->start_region_id+i].base);

Spaces around +

> +		stq_le_p(&out->records[i].decode_len,
> +			ct3d->dc.regions[in->start_region_id+i].decode_len);
> +		stq_le_p(&out->records[i].region_len,
> +			ct3d->dc.regions[in->start_region_id+i].len);
> +		stq_le_p(&out->records[i].block_size,
> +			ct3d->dc.regions[in->start_region_id+i].block_size);
> +		stl_le_p(&out->records[i].dsmadhandle,
> +			ct3d->dc.regions[in->start_region_id+i].dsmadhandle);
> +		out->records[i].flags
> +			= ct3d->dc.regions[in->start_region_id+i].flags;
> +	}
> +
> +	*len = out_pl_len;
> +	return CXL_MBOX_SUCCESS;
> +}
> +
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
>  #define IMMEDIATE_DATA_CHANGE (1 << 2)
>  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
> @@ -973,6 +1039,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
>          cmd_media_inject_poison, 8, 0 },
>      [MEDIA_AND_POISON][CLEAR_POISON] = { "MEDIA_AND_POISON_CLEAR_POISON",
>          cmd_media_clear_poison, 72, 0 },
> +	[DCD_CONFIG][GET_DC_REGION_CONFIG] = { "DCD_GET_DC_REGION_CONFIG",
> +		cmd_dcd_get_dyn_cap_config, 2, 0 },
>  };
>  
>  static struct cxl_cmd cxl_cmd_set_sw[256][256] = {
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index e285369693..8a04e53e90 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -383,6 +383,17 @@ typedef struct CXLPoison {
>  typedef QLIST_HEAD(, CXLPoison) CXLPoisonList;
>  #define CXL_POISON_LIST_LIMIT 256
>  
> +#define DCD_MAX_REGION_NUM 8
> +
> +typedef struct CXLDCD_Region {
> +	uint64_t base;
> +	uint64_t decode_len; /* in multiples of 256MB */
> +	uint64_t len;
> +	uint64_t block_size;
> +	uint32_t dsmadhandle;
> +	uint8_t flags;
> +} CXLDCD_Region;
> +
>  struct CXLType3Dev {
>      /* Private */
>      PCIDevice parent_obj;
> @@ -414,6 +425,11 @@ struct CXLType3Dev {
>      unsigned int poison_list_cnt;
>      bool poison_list_overflowed;
>      uint64_t poison_list_overflow_ts;
> +
> +	struct dynamic_capacity {
> +		uint8_t num_regions; // 1-8
Or none if it's not present :)

> +		struct CXLDCD_Region regions[DCD_MAX_REGION_NUM];
> +	} dc;
>  };
>  
>  #define TYPE_CXL_TYPE3 "cxl-type3"


