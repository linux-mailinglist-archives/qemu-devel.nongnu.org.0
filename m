Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BF538D52
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:59:56 +0200 (CEST)
Received: from localhost ([::1]:50992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxjG-0007wk-Tq
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvxYR-0004yr-I7
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:48:43 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:45357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvxYM-0001Vo-Cp
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:48:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0E1A8105C2670;
 Tue, 31 May 2022 10:48:34 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 10:48:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00187880d5f-ec8e-4281-a76e-b0f01c4d423a,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <18636363-203b-3016-06c5-faaf7d4fb64b@kaod.org>
Date: Tue, 31 May 2022 10:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 22/25] hw/sd: Add sd_emmc_cmd_SEND_EXT_CSD() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-block@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <20220530193816.45841-23-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220530193816.45841-23-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9feb33ac-a6f8-41c3-bfff-fd649e6a7df5
X-Ovh-Tracer-Id: 15447628198225152873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 21:38, Philippe Mathieu-Daudé wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> The parameters mimick a real 4GB eMMC, but it can be set to various
> sizes. Initially from Vincent Palatin <vpalatin@chromium.org>
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> [PMD: Remove CMD8 (SEND_EXT_CSD) case in sd_read_byte()]

AFAICT and from the tests, this is still needed.

C.


> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/sd/sd.c             | 101 ++++++++++++++++++++++++++++++++++++++++-
>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++++++++++++++++++++++
>   include/hw/sd/sd.h     |   1 +
>   3 files changed, 198 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 907d4f5760..6722003cda 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -142,6 +142,7 @@ struct SDState {
>       uint64_t data_start;
>       uint32_t data_offset;
>       uint8_t data[512];
> +    uint8_t ext_csd[512];
>       qemu_irq readonly_cb;
>       qemu_irq inserted_cb;
>       QEMUTimer *ocr_power_timer;
> @@ -408,8 +409,85 @@ static const uint8_t sd_csd_rw_mask[16] = {
>       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
>   };
>   
> +static void mmc_set_ext_csd(SDState *sd, uint64_t size)
> +{
> +    uint32_t sectcount = size >> HWBLOCK_SHIFT;
> +
> +    memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
> +
> +    sd->ext_csd[EXT_CSD_S_CMD_SET] = 0x1; /* supported command sets */
> +    sd->ext_csd[EXT_CSD_HPI_FEATURES] = 0x3; /* HPI features  */
> +    sd->ext_csd[EXT_CSD_BKOPS_SUPPORT] = 0x1; /* Background operations */
> +    sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
> +    sd->ext_csd[EXT_CSD_TRIM_MULT] = 0x1; /* Trim multiplier */
> +    sd->ext_csd[EXT_CSD_SEC_FEATURE_SUPPORT] = 0x15; /* Secure feature */
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
> +    sd->ext_csd[EXT_CSD_PART_SWITCH_TIME] = 0x1;
> +    sd->ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] = 0x1;
> +    sd->ext_csd[EXT_CSD_CARD_TYPE] = 0x7;
> +    sd->ext_csd[EXT_CSD_STRUCTURE] = 0x2;
> +    sd->ext_csd[EXT_CSD_REV] = 0x5;
> +    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */
> +    sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3;
> +    sd->ext_csd[159] = 0x00; /* Max enhanced area size */
> +    sd->ext_csd[158] = 0x00; /* ... */
> +    sd->ext_csd[157] = 0xEC; /* ... */
> +}
> +
> +static void sd_emmc_set_csd(SDState *sd, uint64_t size)
> +{
> +    sd->csd[0] = 0xd0;
> +    sd->csd[1] = 0x0f;
> +    sd->csd[2] = 0x00;
> +    sd->csd[3] = 0x32;
> +    sd->csd[4] = 0x0f;
> +    if (size <= 2 * GiB) {
> +        /* use 1k blocks */
> +        uint32_t csize1k = (size >> (CMULT_SHIFT + 10)) - 1;
> +        sd->csd[5] = 0x5a;
> +        sd->csd[6] = 0x80 | ((csize1k >> 10) & 0xf);
> +        sd->csd[7] = (csize1k >> 2) & 0xff;
> +    } else { /* >= 2GB : size stored in ext CSD, block addressing */
> +        sd->csd[5] = 0x59;
> +        sd->csd[6] = 0x8f;
> +        sd->csd[7] = 0xff;
> +        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
> +    }
> +    sd->csd[8] = 0xff;
> +    sd->csd[9] = 0xff;
> +    sd->csd[10] = 0xf7;
> +    sd->csd[11] = 0xfe;
> +    sd->csd[12] = 0x49;
> +    sd->csd[13] = 0x10;
> +    sd->csd[14] = 0x00;
> +    sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
> +    mmc_set_ext_csd(sd, size);
> +}
> +
>   static void sd_set_csd(SDState *sd, uint64_t size)
>   {
> +    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
>       int hwblock_shift = HWBLOCK_SHIFT;
>       uint32_t csize;
>       uint32_t sectsize = (1 << (SECTOR_SHIFT + 1)) - 1;
> @@ -421,7 +499,9 @@ static void sd_set_csd(SDState *sd, uint64_t size)
>       }
>       csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
>   
> -    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
> +    if (sc->set_csd) {
> +        sc->set_csd(sd, size);
> +    } else if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
>           sd->csd[0] = 0x00;	/* CSD structure */
>           sd->csd[1] = 0x26;	/* Data read access-time-1 */
>           sd->csd[2] = 0x00;	/* Data read access-time-2 */
> @@ -2279,6 +2359,23 @@ static sd_rsp_type_t sd_emmc_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
>       return sd_r2_i;
>   }
>   
> +static sd_rsp_type_t sd_emmc_cmd_SEND_EXT_CSD(SDState *sd, SDRequest req)
> +{
> +    uint64_t addr = (sd->ocr & (1 << 30)) ? (uint64_t) req.arg << 9 : req.arg;
> +
> +    switch (sd->state) {
> +    case sd_transfer_state:
> +        /* MMC : Sends the EXT_CSD register as a Block of data */
> +        sd->state = sd_sendingdata_state;
> +        memcpy(sd->data, sd->ext_csd, sizeof(sd->ext_csd));
> +        sd->data_start = addr;
> +        sd->data_offset = 0;
> +        return sd_r1;
> +    default:
> +        return sd_invalid_state_for_cmd(sd, req);
> +    }
> +}
> +
>   static sd_rsp_type_t sd_emmc_cmd_APP_CMD(SDState *sd, SDRequest req)
>   {
>       return sd_r0;
> @@ -2317,6 +2414,7 @@ static const SDProto sd_proto_emmc = {
>           [3]         = sd_emmc_cmd_SEND_RELATIVE_ADDR,
>           [5]         = sd_cmd_illegal,
>           [6]         = sd_emmc_cmd_SWITCH_FUNCTION,
> +        [8]         = sd_emmc_cmd_SEND_EXT_CSD,
>           [19]        = sd_cmd_SEND_TUNING_BLOCK,
>           [21]        = sd_emmc_cmd_SEND_TUNING_BLOCK,
>           [41]        = sd_cmd_illegal,
> @@ -2465,6 +2563,7 @@ static void emmc_class_init(ObjectClass *klass, void *data)
>       dc->desc = "eMMC";
>       dc->realize = emmc_realize;
>       sc->proto = &sd_proto_emmc;
> +    sc->set_csd = sd_emmc_set_csd;
>   }
>   
>   static const TypeInfo emmc_info = {
> diff --git a/hw/sd/sdmmc-internal.h b/hw/sd/sdmmc-internal.h
> index d8bf17d204..2b98f117cd 100644
> --- a/hw/sd/sdmmc-internal.h
> +++ b/hw/sd/sdmmc-internal.h
> @@ -37,4 +37,101 @@ const char *sd_cmd_name(uint8_t cmd);
>    */
>   const char *sd_acmd_name(uint8_t cmd);
>   
> +/*
> + * EXT_CSD fields
> + */
> +
> +#define EXT_CSD_CMDQ_MODE_EN            15      /* R/W */
> +#define EXT_CSD_FLUSH_CACHE             32      /* W */
> +#define EXT_CSD_CACHE_CTRL              33      /* R/W */
> +#define EXT_CSD_POWER_OFF_NOTIFICATION  34      /* R/W */
> +#define EXT_CSD_PACKED_FAILURE_INDEX    35      /* RO */
> +#define EXT_CSD_PACKED_CMD_STATUS       36      /* RO */
> +#define EXT_CSD_EXP_EVENTS_STATUS       54      /* RO, 2 bytes */
> +#define EXT_CSD_EXP_EVENTS_CTRL         56      /* R/W, 2 bytes */
> +#define EXT_CSD_DATA_SECTOR_SIZE        61      /* R */
> +#define EXT_CSD_GP_SIZE_MULT            143     /* R/W */
> +#define EXT_CSD_PARTITION_SETTING_COMPLETED 155 /* R/W */
> +#define EXT_CSD_PARTITION_ATTRIBUTE     156     /* R/W */
> +#define EXT_CSD_PARTITION_SUPPORT       160     /* RO */
> +#define EXT_CSD_HPI_MGMT                161     /* R/W */
> +#define EXT_CSD_RST_N_FUNCTION          162     /* R/W */
> +#define EXT_CSD_BKOPS_EN                163     /* R/W */
> +#define EXT_CSD_BKOPS_START             164     /* W */
> +#define EXT_CSD_SANITIZE_START          165     /* W */
> +#define EXT_CSD_WR_REL_PARAM            166     /* RO */
> +#define EXT_CSD_RPMB_MULT               168     /* RO */
> +#define EXT_CSD_FW_CONFIG               169     /* R/W */
> +#define EXT_CSD_BOOT_WP                 173     /* R/W */
> +#define EXT_CSD_ERASE_GROUP_DEF         175     /* R/W */
> +#define EXT_CSD_PART_CONFIG             179     /* R/W */
> +#define EXT_CSD_ERASED_MEM_CONT         181     /* RO */
> +#define EXT_CSD_BUS_WIDTH               183     /* R/W */
> +#define EXT_CSD_STROBE_SUPPORT          184     /* RO */
> +#define EXT_CSD_HS_TIMING               185     /* R/W */
> +#define EXT_CSD_POWER_CLASS             187     /* R/W */
> +#define EXT_CSD_REV                     192     /* RO */
> +#define EXT_CSD_STRUCTURE               194     /* RO */
> +#define EXT_CSD_CARD_TYPE               196     /* RO */
> +#define EXT_CSD_DRIVER_STRENGTH         197     /* RO */
> +#define EXT_CSD_OUT_OF_INTERRUPT_TIME   198     /* RO */
> +#define EXT_CSD_PART_SWITCH_TIME        199     /* RO */
> +#define EXT_CSD_PWR_CL_52_195           200     /* RO */
> +#define EXT_CSD_PWR_CL_26_195           201     /* RO */
> +#define EXT_CSD_PWR_CL_52_360           202     /* RO */
> +#define EXT_CSD_PWR_CL_26_360           203     /* RO */
> +#define EXT_CSD_SEC_CNT                 212     /* RO, 4 bytes */
> +#define EXT_CSD_S_A_TIMEOUT             217     /* RO */
> +#define EXT_CSD_S_C_VCCQ                219     /* RO */
> +#define EXT_CSD_S_C_VCC                 220     /* RO */
> +#define EXT_CSD_REL_WR_SEC_C            222     /* RO */
> +#define EXT_CSD_HC_WP_GRP_SIZE          221     /* RO */
> +#define EXT_CSD_ERASE_TIMEOUT_MULT      223     /* RO */
> +#define EXT_CSD_HC_ERASE_GRP_SIZE       224     /* RO */
> +#define EXT_CSD_ACC_SIZE                225     /* RO */
> +#define EXT_CSD_BOOT_MULT               226     /* RO */
> +#define EXT_CSD_BOOT_INFO               228     /* RO */
> +#define EXT_CSD_SEC_TRIM_MULT           229     /* RO */
> +#define EXT_CSD_SEC_ERASE_MULT          230     /* RO */
> +#define EXT_CSD_SEC_FEATURE_SUPPORT     231     /* RO */
> +#define EXT_CSD_TRIM_MULT               232     /* RO */
> +#define EXT_CSD_PWR_CL_200_195          236     /* RO */
> +#define EXT_CSD_PWR_CL_200_360          237     /* RO */
> +#define EXT_CSD_PWR_CL_DDR_52_195       238     /* RO */
> +#define EXT_CSD_PWR_CL_DDR_52_360       239     /* RO */
> +#define EXT_CSD_BKOPS_STATUS            246     /* RO */
> +#define EXT_CSD_POWER_OFF_LONG_TIME     247     /* RO */
> +#define EXT_CSD_GENERIC_CMD6_TIME       248     /* RO */
> +#define EXT_CSD_CACHE_SIZE              249     /* RO, 4 bytes */
> +#define EXT_CSD_PWR_CL_DDR_200_360      253     /* RO */
> +#define EXT_CSD_FIRMWARE_VERSION        254     /* RO, 8 bytes */
> +#define EXT_CSD_PRE_EOL_INFO            267     /* RO */
> +#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A      268     /* RO */
> +#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B      269     /* RO */
> +#define EXT_CSD_CMDQ_DEPTH              307     /* RO */
> +#define EXT_CSD_CMDQ_SUPPORT            308     /* RO */
> +#define EXT_CSD_SUPPORTED_MODE          493     /* RO */
> +#define EXT_CSD_TAG_UNIT_SIZE           498     /* RO */
> +#define EXT_CSD_DATA_TAG_SUPPORT        499     /* RO */
> +#define EXT_CSD_MAX_PACKED_WRITES       500     /* RO */
> +#define EXT_CSD_MAX_PACKED_READS        501     /* RO */
> +#define EXT_CSD_BKOPS_SUPPORT           502     /* RO */
> +#define EXT_CSD_HPI_FEATURES            503     /* RO */
> +#define EXT_CSD_S_CMD_SET               504     /* RO */
> +
> +/*
> + * EXT_CSD field definitions
> + */
> +
> +#define EXT_CSD_WR_REL_PARAM_EN         (1 << 2)
> +#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR     (1 << 4)
> +
> +#define EXT_CSD_PART_CONFIG_ACC_MASK    (0x7)
> +#define EXT_CSD_PART_CONFIG_ACC_DEFAULT (0x0)
> +#define EXT_CSD_PART_CONFIG_ACC_BOOT0   (0x1)
> +
> +#define EXT_CSD_PART_CONFIG_EN_MASK     (0x7 << 3)
> +#define EXT_CSD_PART_CONFIG_EN_BOOT0    (0x1 << 3)
> +#define EXT_CSD_PART_CONFIG_EN_USER     (0x7 << 3)
> +
>   #endif
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index e52436b7a5..8a0f2e75da 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -129,6 +129,7 @@ struct SDCardClass {
>       bool (*get_readonly)(SDState *sd);
>   
>       const struct SDProto *proto;
> +    void (*set_csd)(SDState *sd, uint64_t size);
>   };
>   
>   #define TYPE_SD_BUS "sd-bus"


