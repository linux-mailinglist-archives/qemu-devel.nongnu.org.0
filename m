Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17619327CE3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:11:17 +0100 (CET)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgSK-00086S-4C
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGgPp-0006Vu-8H; Mon, 01 Mar 2021 06:08:41 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:51495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGgPl-0005HG-Pv; Mon, 01 Mar 2021 06:08:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 9A6B892B4B3F;
 Mon,  1 Mar 2021 12:08:34 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 12:08:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0022ed4a254-d789-4e5c-89cd-73a53b8f3e80,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 05/21] sd: emmc: Add support for EXT_CSD & CSD for eMMC
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-6-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <09bd4c35-183c-41f6-0ec9-dcd87996bff8@kaod.org>
Date: Mon, 1 Mar 2021 12:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-6-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7bd66f7a-23f5-4314-b274-d370f7a77fc7
X-Ovh-Tracer-Id: 14641765340785576717
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 8:33 PM, Sai Pavan Boddu wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
> 
> eMMC CSD is similar to SD with an option to refer EXT_CSD for larger
> devices.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> [clg: Add user friendly macros for EXT_CSD register]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> [spb: updated commit message]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/sd/sdmmc-internal.h | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/sd/sd.c             | 61 +++++++++++++++++++++++++++++--
>  2 files changed, 156 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sdmmc-internal.h b/hw/sd/sdmmc-internal.h
> index d8bf17d..7ab7b4d 100644
> --- a/hw/sd/sdmmc-internal.h
> +++ b/hw/sd/sdmmc-internal.h
> @@ -37,4 +37,101 @@ const char *sd_cmd_name(uint8_t cmd);
>   */
>  const char *sd_acmd_name(uint8_t cmd);
>  
> +/*
> + * EXT_CSD fields
> + */
> +
> +#define EXT_CSD_CMDQ_MODE_EN    15  /* R/W */
> +#define EXT_CSD_FLUSH_CACHE   32      /* W */
> +#define EXT_CSD_CACHE_CTRL    33      /* R/W */
> +#define EXT_CSD_POWER_OFF_NOTIFICATION  34  /* R/W */
> +#define EXT_CSD_PACKED_FAILURE_INDEX  35  /* RO */
> +#define EXT_CSD_PACKED_CMD_STATUS 36  /* RO */
> +#define EXT_CSD_EXP_EVENTS_STATUS 54  /* RO, 2 bytes */
> +#define EXT_CSD_EXP_EVENTS_CTRL   56  /* R/W, 2 bytes */
> +#define EXT_CSD_DATA_SECTOR_SIZE  61  /* R */
> +#define EXT_CSD_GP_SIZE_MULT    143 /* R/W */
> +#define EXT_CSD_PARTITION_SETTING_COMPLETED 155 /* R/W */
> +#define EXT_CSD_PARTITION_ATTRIBUTE 156 /* R/W */
> +#define EXT_CSD_PARTITION_SUPPORT 160 /* RO */
> +#define EXT_CSD_HPI_MGMT    161 /* R/W */
> +#define EXT_CSD_RST_N_FUNCTION    162 /* R/W */
> +#define EXT_CSD_BKOPS_EN    163 /* R/W */
> +#define EXT_CSD_BKOPS_START   164 /* W */
> +#define EXT_CSD_SANITIZE_START    165     /* W */
> +#define EXT_CSD_WR_REL_PARAM    166 /* RO */
> +#define EXT_CSD_RPMB_MULT   168 /* RO */
> +#define EXT_CSD_FW_CONFIG   169 /* R/W */
> +#define EXT_CSD_BOOT_WP     173 /* R/W */
> +#define EXT_CSD_ERASE_GROUP_DEF   175 /* R/W */
> +#define EXT_CSD_PART_CONFIG   179 /* R/W */
> +#define EXT_CSD_ERASED_MEM_CONT   181 /* RO */
> +#define EXT_CSD_BUS_WIDTH   183 /* R/W */
> +#define EXT_CSD_STROBE_SUPPORT    184 /* RO */
> +#define EXT_CSD_HS_TIMING   185 /* R/W */
> +#define EXT_CSD_POWER_CLASS   187 /* R/W */
> +#define EXT_CSD_REV     192 /* RO */
> +#define EXT_CSD_STRUCTURE   194 /* RO */
> +#define EXT_CSD_CARD_TYPE   196 /* RO */
> +#define EXT_CSD_DRIVER_STRENGTH   197 /* RO */
> +#define EXT_CSD_OUT_OF_INTERRUPT_TIME 198 /* RO */
> +#define EXT_CSD_PART_SWITCH_TIME        199     /* RO */
> +#define EXT_CSD_PWR_CL_52_195   200 /* RO */
> +#define EXT_CSD_PWR_CL_26_195   201 /* RO */
> +#define EXT_CSD_PWR_CL_52_360   202 /* RO */
> +#define EXT_CSD_PWR_CL_26_360   203 /* RO */
> +#define EXT_CSD_SEC_CNT     212 /* RO, 4 bytes */
> +#define EXT_CSD_S_A_TIMEOUT   217 /* RO */
> +#define EXT_CSD_S_C_VCCQ          219     /* RO */
> +#define EXT_CSD_S_C_VCC                 220     /* RO */
> +#define EXT_CSD_REL_WR_SEC_C    222 /* RO */
> +#define EXT_CSD_HC_WP_GRP_SIZE    221 /* RO */
> +#define EXT_CSD_ERASE_TIMEOUT_MULT  223 /* RO */
> +#define EXT_CSD_HC_ERASE_GRP_SIZE 224 /* RO */
> +#define EXT_CSD_ACC_SIZE    225 /* RO */
> +#define EXT_CSD_BOOT_MULT   226 /* RO */
> +#define EXT_CSD_BOOT_INFO   228 /* RO */
> +#define EXT_CSD_SEC_TRIM_MULT   229 /* RO */
> +#define EXT_CSD_SEC_ERASE_MULT    230 /* RO */
> +#define EXT_CSD_SEC_FEATURE_SUPPORT 231 /* RO */
> +#define EXT_CSD_TRIM_MULT   232 /* RO */
> +#define EXT_CSD_PWR_CL_200_195    236 /* RO */
> +#define EXT_CSD_PWR_CL_200_360    237 /* RO */
> +#define EXT_CSD_PWR_CL_DDR_52_195 238 /* RO */
> +#define EXT_CSD_PWR_CL_DDR_52_360 239 /* RO */
> +#define EXT_CSD_BKOPS_STATUS    246 /* RO */
> +#define EXT_CSD_POWER_OFF_LONG_TIME 247 /* RO */
> +#define EXT_CSD_GENERIC_CMD6_TIME 248 /* RO */
> +#define EXT_CSD_CACHE_SIZE    249 /* RO, 4 bytes */
> +#define EXT_CSD_PWR_CL_DDR_200_360  253 /* RO */
> +#define EXT_CSD_FIRMWARE_VERSION  254 /* RO, 8 bytes */
> +#define EXT_CSD_PRE_EOL_INFO    267 /* RO */
> +#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A  268 /* RO */
> +#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B  269 /* RO */
> +#define EXT_CSD_CMDQ_DEPTH    307 /* RO */
> +#define EXT_CSD_CMDQ_SUPPORT    308 /* RO */
> +#define EXT_CSD_SUPPORTED_MODE    493 /* RO */
> +#define EXT_CSD_TAG_UNIT_SIZE   498 /* RO */
> +#define EXT_CSD_DATA_TAG_SUPPORT  499 /* RO */
> +#define EXT_CSD_MAX_PACKED_WRITES 500 /* RO */
> +#define EXT_CSD_MAX_PACKED_READS  501 /* RO */
> +#define EXT_CSD_BKOPS_SUPPORT   502 /* RO */
> +#define EXT_CSD_HPI_FEATURES    503 /* RO */
> +#define EXT_CSD_S_CMD_SET   504 /* RO */
> +
> +/*
> + * EXT_CSD field definitions
> + */
> +
> +#define EXT_CSD_WR_REL_PARAM_EN   (1 << 2)
> +#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR (1 << 4)
> +
> +#define EXT_CSD_PART_CONFIG_ACC_MASK  (0x7)
> +#define EXT_CSD_PART_CONFIG_ACC_DEFAULT (0x0)
> +#define EXT_CSD_PART_CONFIG_ACC_BOOT0 (0x1)
> +
> +#define EXT_CSD_PART_CONFIG_EN_MASK (0x7 << 3)
> +#define EXT_CSD_PART_CONFIG_EN_BOOT0  (0x1 << 3)
> +#define EXT_CSD_PART_CONFIG_EN_USER (0x7 << 3)
> +
>  #endif
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index bc9d913..a26695b 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -135,6 +135,7 @@ struct SDState {
>      uint64_t data_start;
>      uint32_t data_offset;
>      uint8_t data[512];
> +    uint8_t ext_csd[512];

This is eMMC specific and one could argue that we need a EMMCState
structure but if this is the only extra field it seems over kill to
complexify the model for it.

>      qemu_irq readonly_cb;
>      qemu_irq inserted_cb;
>      QEMUTimer *ocr_power_timer;
> @@ -393,6 +394,55 @@ static const uint8_t sd_csd_rw_mask[16] = {
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
>  };
>  
> +static void mmc_set_ext_csd(SDState *sd, uint64_t size)

However, I think mmc_set_ext_csd() should be a SDCardClass handler.

C.


> +{
> +    uint32_t sectcount = size >> HWBLOCK_SHIFT;
> +
> +    memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
> +    sd->ext_csd[EXT_CSD_S_CMD_SET] = 0x1; /* supported command sets */
> +    sd->ext_csd[EXT_CSD_HPI_FEATURES] = 0x3; /* HPI features  */
> +    sd->ext_csd[EXT_CSD_BKOPS_SUPPORT] = 0x1; /* Background operations
> +                                                 support */
> +    sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
> +    sd->ext_csd[EXT_CSD_TRIM_MULT] = 0x1; /* Trim multiplier */
> +    sd->ext_csd[EXT_CSD_SEC_FEATURE_SUPPORT] = 0x15; /* Secure feature
> +                                                        support */
> +    sd->ext_csd[EXT_CSD_SEC_ERASE_MULT] = 0x96; /* Secure erase support */
> +    sd->ext_csd[EXT_CSD_SEC_TRIM_MULT] = 0x96; /* Secure TRIM multiplier */
> +    sd->ext_csd[EXT_CSD_BOOT_INFO] = 0x7; /* Boot information */
> +    sd->ext_csd[EXT_CSD_BOOT_MULT] = 0x8; /* Boot partition size. 128KB unit */
> +    sd->ext_csd[EXT_CSD_ACC_SIZE] = 0x6; /* Access size */
> +    sd->ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE] = 0x4; /* HC Erase unit size */
> +    sd->ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT] = 0x1; /* HC erase timeout */
> +    sd->ext_csd[EXT_CSD_REL_WR_SEC_C] = 0x1; /* Reliable write sector count */
> +    sd->ext_csd[EXT_CSD_HC_WP_GRP_SIZE] = 0x4; /* HC write protect group size */
> +    sd->ext_csd[EXT_CSD_S_C_VCC] = 0x8; /* Sleep current VCC  */
> +    sd->ext_csd[EXT_CSD_S_C_VCCQ] = 0x7; /* Sleep current VCCQ */
> +    sd->ext_csd[EXT_CSD_S_A_TIMEOUT] = 0x11; /* Sleep/Awake timeout */
> +    sd->ext_csd[215] = (sectcount >> 24) & 0xff; /* Sector count */
> +    sd->ext_csd[214] = (sectcount >> 16) & 0xff; /* ... */
> +    sd->ext_csd[213] = (sectcount >> 8) & 0xff;  /* ... */
> +    sd->ext_csd[EXT_CSD_SEC_CNT] = (sectcount & 0xff);       /* ... */
> +    sd->ext_csd[210] = 0xa; /* Min write perf for 8bit@52Mhz */
> +    sd->ext_csd[209] = 0xa; /* Min read perf for 8bit@52Mhz  */
> +    sd->ext_csd[208] = 0xa; /* Min write perf for 4bit@52Mhz */
> +    sd->ext_csd[207] = 0xa; /* Min read perf for 4bit@52Mhz */
> +    sd->ext_csd[206] = 0xa; /* Min write perf for 4bit@26Mhz */
> +    sd->ext_csd[205] = 0xa; /* Min read perf for 4bit@26Mhz */
> +    sd->ext_csd[EXT_CSD_PART_SWITCH_TIME] = 0x1; /* Partition switching
> +                                                    timing */
> +    sd->ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] = 0x1; /* Out-of-interrupt busy
> +                                                         timing */
> +    sd->ext_csd[EXT_CSD_CARD_TYPE] = 0xFF; /* Card type */
> +    sd->ext_csd[EXT_CSD_STRUCTURE] = 0x2; /* CSD Structure version */
> +    sd->ext_csd[EXT_CSD_REV] = 0x5; /* Extended CSD revision */
> +    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */
> +    sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3; /* Partinioning support */
> +    sd->ext_csd[159] = 0x00; /* Max enhanced area size */
> +    sd->ext_csd[158] = 0x00; /* ... */
> +    sd->ext_csd[157] = 0xEC; /* ... */
> +}
> +
>  static void sd_set_csd(SDState *sd, uint64_t size)
>  {
>      int hwblock_shift = HWBLOCK_SHIFT;
> @@ -406,8 +456,11 @@ static void sd_set_csd(SDState *sd, uint64_t size)
>      }
>      csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
>  
> -    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
> -        sd->csd[0] = 0x00;  /* CSD structure */
> +    if (size <= SDSC_MAX_CAPACITY || sd->emmc) { /* Standard Capacity SD */
> +        if (sd->emmc && size >= SDSC_MAX_CAPACITY) {
> +            csize = 0xfff;
> +        }
> +        sd->csd[0] = sd->emmc ? 0xd0 : 0x00;  /* CSD structure */
>          sd->csd[1] = 0x26;  /* Data read access-time-1 */
>          sd->csd[2] = 0x00;  /* Data read access-time-2 */
>          sd->csd[3] = 0x32;      /* Max. data transfer rate: 25 MHz */
> @@ -451,6 +504,10 @@ static void sd_set_csd(SDState *sd, uint64_t size)
>          sd->csd[14] = 0x00;
>      }
>      sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
> +
> +    if (sd->emmc) {
> +        mmc_set_ext_csd(sd, size);
> +    }
>  }
>  
>  static void sd_set_rca(SDState *sd, uint16_t value)
> 


