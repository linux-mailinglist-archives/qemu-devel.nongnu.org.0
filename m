Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C680C702F4E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:11:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYtJ-0003j4-0g; Mon, 15 May 2023 10:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyYtG-0003iB-M6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:09:30 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyYtB-0000Jy-Se
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:09:30 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QKh2t73htz6J72P;
 Mon, 15 May 2023 22:05:10 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 15:09:18 +0100
Date: Mon, 15 May 2023 15:09:17 +0100
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
Subject: Re: [RFC 4/7] hw/mem/cxl_type3: Add DC extent representative to cxl
 type3 device
Message-ID: <20230515150917.000038ef@Huawei.com>
In-Reply-To: <20230511175609.2091136-5-fan.ni@samsung.com>
References: <20230511175609.2091136-1-fan.ni@samsung.com>
 <CGME20230511175641uscas1p2b70d27b1f20dc2dd54a0530170117530@uscas1p2.samsung.com>
 <20230511175609.2091136-5-fan.ni@samsung.com>
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
> Add dynamic capacity extent information to the definition of
> CXLType3Dev and add get DC extent list mailbox command based on
> CXL.spec.3.0:.8.2.9.8.9.2.
> 
> With this command, we can create dc regions as below:
> 
> region=$(cat /sys/bus/cxl/devices/decoder0.0/create_dc_region)
> echo $region> /sys/bus/cxl/devices/decoder0.0/create_dc_region
> echo 256 > /sys/bus/cxl/devices/$region/interleave_granularity
> echo 1 > /sys/bus/cxl/devices/$region/interleave_ways
> 
> echo "dc" >/sys/bus/cxl/devices/decoder2.0/mode
> echo 0x30000000 >/sys/bus/cxl/devices/decoder2.0/dpa_size
> 
> echo 0x30000000 > /sys/bus/cxl/devices/$region/size
> echo  "decoder2.0" > /sys/bus/cxl/devices/$region/target0
> echo 1 > /sys/bus/cxl/devices/$region/commit
> echo $region > /sys/bus/cxl/drivers/cxl_region/bind
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
Hi Fan,

A few comments inline,

Thanks,

Jonathan

> ---
>  hw/cxl/cxl-mailbox-utils.c  | 73 ++++++++++++++++++++++++++++++++++++-
>  hw/mem/cxl_type3.c          |  1 +
>  include/hw/cxl/cxl_device.h | 23 ++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 61c77e52d8..ed2ac154cb 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -83,6 +83,7 @@ enum {
>          #define CLEAR_POISON           0x2
>  	DCD_CONFIG = 0x48, /*8.2.9.8.9*/
>  		#define GET_DC_REGION_CONFIG   0x0
> +		#define GET_DYN_CAP_EXT_LIST   0x1
>      PHYSICAL_SWITCH = 0x51
>          #define IDENTIFY_SWITCH_DEVICE      0x0
>  };
> @@ -938,7 +939,7 @@ static CXLRetCode cmd_media_clear_poison(struct cxl_cmd *cmd,
>  }
>  
>  /*
> - * cxl spec 3.0: 8.2.9.8.9.2
> + * cxl spec 3.0: 8.2.9.8.9.1

Push that back to earlier patch.

>   * Get Dynamic Capacity Configuration
>   **/
>  static CXLRetCode cmd_dcd_get_dyn_cap_config(struct cxl_cmd *cmd,
> @@ -1001,6 +1002,73 @@ static CXLRetCode cmd_dcd_get_dyn_cap_config(struct cxl_cmd *cmd,
>  	return CXL_MBOX_SUCCESS;
>  }
>  
> +/*
> + * cxl spec 3.0: 8.2.9.8.9.2
> + * Get Dynamic Capacity Extent List (Opcode 4810h)
> + **/
> +static CXLRetCode cmd_dcd_get_dyn_cap_ext_list(struct cxl_cmd *cmd,
> +		CXLDeviceState *cxl_dstate,
> +		uint16_t *len)
> +{
> +	struct get_dyn_cap_ext_list_in_pl {
> +		uint32_t extent_cnt;
> +		uint32_t start_extent_id;
> +	} QEMU_PACKED;
> +
> +	struct get_dyn_cap_ext_list_out_pl {
> +		uint32_t count;
> +		uint32_t total_extents;
> +		uint32_t generation_num;
> +		uint8_t rsvd[4];
> +		struct {
> +			uint64_t start_dpa;
> +			uint64_t len;
> +			uint8_t tag[0x10];
> +			uint16_t shared_seq;
> +			uint8_t rsvd[6];
> +		} QEMU_PACKED records[];
> +	} QEMU_PACKED;
> +
> +	struct get_dyn_cap_ext_list_in_pl *in = (void *)cmd->payload;
> +	struct get_dyn_cap_ext_list_out_pl *out = (void *)cmd->payload;
> +	struct CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> +	uint16_t record_count = 0, i = 0, record_done = 0;
> +	CXLDCDExtentList *extent_list = &ct3d->dc.extents;
> +	CXLDCD_Extent *ent;
> +	uint16_t out_pl_len;
> +
> +	if (in->start_extent_id > ct3d->dc.total_extent_count)
> +		return CXL_MBOX_INVALID_INPUT;
> +
> +	if (ct3d->dc.total_extent_count - in->start_extent_id < in->extent_cnt)
> +		record_count = ct3d->dc.total_extent_count - in->start_extent_id;
> +	else
> +		record_count = in->extent_cnt;
> +
> +	out_pl_len = sizeof(*out) + record_count * sizeof(out->records[0]);
> +	assert(out_pl_len <= CXL_MAILBOX_MAX_PAYLOAD_SIZE);
> +
> +	memset(out, 0, out_pl_len);
> +	stl_le_p(&out->count, record_count);
> +	stl_le_p(&out->total_extents, ct3d->dc.total_extent_count);
> +	stl_le_p(&out->generation_num, ct3d->dc.ext_list_gen_seq);
> +
> +	QTAILQ_FOREACH(ent, extent_list, node) {
> +		if (i++ < in->start_extent_id)
> +			continue;
> +		stq_le_p(&out->records[i].start_dpa, ent->start_dpa);

I has been incrementing for the records skipped.  By now it may be well off
the end of records.  You need a separate index for the ones you are filling
that is incremented only when you write one.
record_done for example.
	out->records[record_done].len etc


> +		stq_le_p(&out->records[i].len, ent->len);
> +		memcpy(&out->records[i].tag, ent->tag, 0x10);
> +		stw_le_p(&out->records[i].shared_seq, ent->shared_seq);
> +		record_done++;
> +		if (record_done == record_count)
> +			break;
> +	}
> +
> +	*len = out_pl_len;
> +	return CXL_MBOX_SUCCESS;
> +}
> +
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
>  #define IMMEDIATE_DATA_CHANGE (1 << 2)
>  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
> @@ -1041,6 +1109,9 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
>          cmd_media_clear_poison, 72, 0 },
>  	[DCD_CONFIG][GET_DC_REGION_CONFIG] = { "DCD_GET_DC_REGION_CONFIG",
>  		cmd_dcd_get_dyn_cap_config, 2, 0 },
> +	[DCD_CONFIG][GET_DYN_CAP_EXT_LIST] = {
> +		"DCD_GET_DYNAMIC_CAPACITY_EXTENT_LIST", cmd_dcd_get_dyn_cap_ext_list,
> +		8, 0 },
>  };
>  
>  static struct cxl_cmd cxl_cmd_set_sw[256][256] = {
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index b9c375d9b4..23954711b5 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -708,6 +708,7 @@ static int cxl_create_toy_regions(CXLType3Dev *ct3d)
>  
>  		region_base += region->len;
>  	}
> +	QTAILQ_INIT(&ct3d->dc.extents);
>  
>  	return 0;
>  }
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 8a04e53e90..20ad5e7411 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -385,6 +385,25 @@ typedef QLIST_HEAD(, CXLPoison) CXLPoisonList;
>  
>  #define DCD_MAX_REGION_NUM 8
>  
> +typedef struct CXLDCD_Extent_raw {
> +	uint64_t start_dpa;
> +	uint64_t len;
> +	uint8_t tag[0x10];
> +	uint16_t shared_seq;
> +	uint8_t rsvd[0x6];
> +} QEMU_PACKED CXLDCExtent_raw;

What's this for?

> +
> +typedef struct CXLDCD_Extent {
> +	uint64_t start_dpa;
> +	uint64_t len;
> +	uint8_t tag[0x10];
> +	uint16_t shared_seq;
> +	uint8_t rsvd[0x6];
> +
> +	QTAILQ_ENTRY(CXLDCD_Extent) node;
> +} CXLDCD_Extent;
> +typedef QTAILQ_HEAD(, CXLDCD_Extent) CXLDCDExtentList;
> +
>  typedef struct CXLDCD_Region {
>  	uint64_t base;
>  	uint64_t decode_len; /* in multiples of 256MB */
> @@ -429,6 +448,10 @@ struct CXLType3Dev {
>  	struct dynamic_capacity {
>  		uint8_t num_regions; // 1-8
>  		struct CXLDCD_Region regions[DCD_MAX_REGION_NUM];
> +		CXLDCDExtentList extents;
> +
> +		uint32_t total_extent_count;
> +		uint32_t ext_list_gen_seq;
>  	} dc;
>  };
>  


