Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B331ABE9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:38:25 +0100 (CET)
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAv7w-0004ko-6W
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lAuoN-0004PJ-8O; Sat, 13 Feb 2021 08:18:14 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:58454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lAuoF-00037E-6c; Sat, 13 Feb 2021 08:18:07 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AE1DB21C38;
 Sat, 13 Feb 2021 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1613222279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmkfW1bx8FRyG6cWSzw3vW8gCUcfecrTPfhbMug3tPY=;
 b=gQzIST5w6S0bZvCjrpHjqKidOqEzjZsFGkcEJfLwtjeBQqwP2M4jyj4kSls5y6TOgFQiwB
 y3QNp5bFVJwfBUqzioHJ5qi4KE4L/1E+0YdVvqJ7dUqpG9b/H1Sy3Gl7trLQxrzp0DKJhh
 zoosk8aCnoWSU+FQ8OGXXWiiytmOTxU=
Subject: Re: [RFC PATCH 02/15] sd: add eMMC support
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-3-git-send-email-sai.pavan.boddu@xilinx.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <128563ea-4e33-e5d0-f381-1b41d695588d@greensocs.com>
Date: Sat, 13 Feb 2021 14:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613031446-22154-3-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/11/21 9:17 AM, Sai Pavan Boddu wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
> 
> The parameters mimick a real 4GB eMMC, but it can be set to various
> sizes.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> [SPB: Rebased the patch over qemu 5.1,
>        Mark eMMC to support all timing modes]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

I find this commit hard to review in its current state. Maybe by 
splitting it into smaller commits with a small description in the commit 
message would make things easier. Eg. one patch to set the ext_csd 
fields, one for the csd, and one per command you modify.

I also noted one small thing bellow.

> ---
>   hw/sd/sd.c             | 143 +++++++++++++++++++++++++++++++++++++++++--------
>   hw/sd/sdmmc-internal.c |   2 +-
>   2 files changed, 122 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 8517dbc..a75fa1c 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c

[snip]

> @@ -371,6 +374,51 @@ static const uint8_t sd_csd_rw_mask[16] = {
>       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
>   };
>   
> +static void mmc_set_ext_csd(SDState *sd, uint64_t size)
> +{
> +    uint32_t sectcount = size >> HWBLOCK_SHIFT;
> +
> +    memset(sd->ext_csd, 0, 512);
memset(sd->ext_csd, 0, sizeof(sd->ext_csd));

-- 
Luc

> +    sd->ext_csd[504] = 0x1; /* supported command sets */
> +    sd->ext_csd[503] = 0x1; /* HPI features  */
> +    sd->ext_csd[502] = 0x1; /* Background operations support */
> +    sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
> +    sd->ext_csd[232] = 0x1; /* Trim multiplier */
> +    sd->ext_csd[231] = 0x15; /* Secure feature support */
> +    sd->ext_csd[230] = 0x96; /* Secure erase support */
> +    sd->ext_csd[229] = 0x96; /* Secure TRIM multiplier */
> +    sd->ext_csd[228] = 0x7; /* Boot information */
> +    sd->ext_csd[226] = 0x8; /* Boot partition size */
> +    sd->ext_csd[225] = 0x6; /* Access size */
> +    sd->ext_csd[224] = 0x4; /* HC Erase unit size */
> +    sd->ext_csd[223] = 0x1; /* HC erase timeout */
> +    sd->ext_csd[222] = 0x1; /* Reliable write sector count */
> +    sd->ext_csd[221] = 0x4; /* HC write protect group size */
> +    sd->ext_csd[220] = 0x8; /* Sleep current VCC  */
> +    sd->ext_csd[219] = 0x7; /* Sleep current VCCQ */
> +    sd->ext_csd[217] = 0x11; /* Sleep/Awake timeout */
> +    sd->ext_csd[215] = (sectcount >> 24) & 0xff; /* Sector count */
> +    sd->ext_csd[214] = (sectcount >> 16) & 0xff; /* ... */
> +    sd->ext_csd[213] = (sectcount >> 8) & 0xff;  /* ... */
> +    sd->ext_csd[212] = (sectcount & 0xff);       /* ... */
> +    sd->ext_csd[210] = 0xa; /* Min write perf for 8bit@52Mhz */
> +    sd->ext_csd[209] = 0xa; /* Min read perf for 8bit@52Mhz  */
> +    sd->ext_csd[208] = 0xa; /* Min write perf for 4bit@52Mhz */
> +    sd->ext_csd[207] = 0xa; /* Min read perf for 4bit@52Mhz */
> +    sd->ext_csd[206] = 0xa; /* Min write perf for 4bit@26Mhz */
> +    sd->ext_csd[205] = 0xa; /* Min read perf for 4bit@26Mhz */
> +    sd->ext_csd[199] = 0x1; /* Partition switching timing */
> +    sd->ext_csd[198] = 0x1; /* Out-of-interrupt busy timing */
> +    sd->ext_csd[196] = 0xFF; /* Card type */
> +    sd->ext_csd[194] = 0x2; /* CSD Structure version */
> +    sd->ext_csd[192] = 0x5; /* Extended CSD revision */
> +    sd->ext_csd[168] = 0x1; /* RPMB size */
> +    sd->ext_csd[160] = 0x3; /* Partinioning support */
> +    sd->ext_csd[159] = 0x00; /* Max enhanced area size */
> +    sd->ext_csd[158] = 0x00; /* ... */
> +    sd->ext_csd[157] = 0xEC; /* ... */
> +}
> +
>   static void sd_set_csd(SDState *sd, uint64_t size)
>   {
>       int hwblock_shift = HWBLOCK_SHIFT;
> @@ -384,7 +432,34 @@ static void sd_set_csd(SDState *sd, uint64_t size)
>       }
>       csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
>   
> -    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
> +    if (sd->emmc) { /* eMMC */
> +        sd->csd[0] = 0xd0;
> +        sd->csd[1] = 0x0f;
> +        sd->csd[2] = 0x00;
> +        sd->csd[3] = 0x32;
> +        sd->csd[4] = 0x0f;
> +        if (size <= 0x80000000ULL) {
> +            /* use 1k blocks */
> +            uint32_t csize1k = (size >> (CMULT_SHIFT + 10)) - 1;
> +            sd->csd[5] = 0x5a;
> +            sd->csd[6] = 0x80 | ((csize1k >> 10) & 0xf);
> +            sd->csd[7] = (csize1k >> 2) & 0xff;
> +        } else { /* >= 2GB : size stored in ext CSD, block addressing */
> +            sd->csd[5] = 0x59;
> +            sd->csd[6] = 0x8f;
> +            sd->csd[7] = 0xff;
> +            sd->ocr |= 1 << 30;
> +        }
> +        sd->csd[8] = 0xff;
> +        sd->csd[9] = 0xff;
> +        sd->csd[10] = 0xf7;
> +        sd->csd[11] = 0xfe;
> +        sd->csd[12] = 0x49;
> +        sd->csd[13] = 0x10;
> +        sd->csd[14] = 0x00;
> +        sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
> +        mmc_set_ext_csd(sd, size);
> +    } else if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
>           sd->csd[0] = 0x00;	/* CSD structure */
>           sd->csd[1] = 0x26;	/* Data read access-time-1 */
>           sd->csd[2] = 0x00;	/* Data read access-time-2 */
> @@ -431,9 +506,13 @@ static void sd_set_csd(SDState *sd, uint64_t size)
>       sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
>   }
>   
> -static void sd_set_rca(SDState *sd)
> +static void sd_set_rca(SDState *sd, uint16_t value)
>   {
> -    sd->rca += 0x4567;
> +    if (sd->emmc) {
> +        sd->rca = value;
> +    } else {
> +        sd->rca += 0x4567;
> +    }
>   }
>   
>   FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
> @@ -979,8 +1058,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>           case sd_identification_state:
>           case sd_standby_state:
>               sd->state = sd_standby_state;
> -            sd_set_rca(sd);
> -            return sd_r6;
> +            sd_set_rca(sd, req.arg >> 16);
> +            return sd->emmc ? sd_r1 : sd_r6;
>   
>           default:
>               break;
> @@ -1054,24 +1133,37 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>           }
>           break;
>   
> -    case 8:	/* CMD8:   SEND_IF_COND */
> -        if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
> -            break;
> -        }
> -        if (sd->state != sd_idle_state) {
> -            break;
> -        }
> -        sd->vhs = 0;
> -
> -        /* No response if not exactly one VHS bit is set.  */
> -        if (!(req.arg >> 8) || (req.arg >> (ctz32(req.arg & ~0xff) + 1))) {
> -            return sd->spi ? sd_r7 : sd_r0;
> -        }
> +    case 8:    /* CMD8:   SEND_IF_COND / SEND_EXT_CSD */
> +        if (sd->emmc) {
> +            switch (sd->state) {
> +            case sd_transfer_state:
> +                /* MMC : Sends the EXT_CSD register as a Block of data */
> +                sd->state = sd_sendingdata_state;
> +                memcpy(sd->data, sd->ext_csd, 512);
> +                sd->data_start = addr;
> +                sd->data_offset = 0;
> +                return sd_r1;
> +            default:
> +                break;
> +            }
> +        } else {
> +            if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
> +                break;
> +            }
> +            if (sd->state != sd_idle_state) {
> +                break;
> +            }
> +            sd->vhs = 0;
>   
> -        /* Accept.  */
> -        sd->vhs = req.arg;
> -        return sd_r7;
> +            /* No response if not exactly one VHS bit is set.  */
> +            if (!(req.arg >> 8) || (req.arg >> (ctz32(req.arg & ~0xff) + 1))) {
> +                return sd->spi ? sd_r7 : sd_r0;
> +            }
>   
> +            /* Accept.  */
> +            sd->vhs = req.arg;
> +            return sd_r7;
> +        }
>       case 9:	/* CMD9:   SEND_CSD */
>           switch (sd->state) {
>           case sd_standby_state:
> @@ -1993,7 +2085,13 @@ uint8_t sd_read_byte(SDState *sd)
>           if (sd->data_offset >= 64)
>               sd->state = sd_transfer_state;
>           break;
> +    case 8:     /* CMD8: SEND_EXT_CSD on MMC */
> +        ret = sd->data[sd->data_offset++];
>   
> +        if (sd->data_offset >= 512) {
> +            sd->state = sd_transfer_state;
> +        }
> +        break;
>       case 9:	/* CMD9:   SEND_CSD */
>       case 10:	/* CMD10:  SEND_CID */
>           ret = sd->data[sd->data_offset ++];
> @@ -2176,6 +2274,7 @@ static Property sd_properties[] = {
>        * board to ensure that ssi transfers only occur when the chip select
>        * is asserted.  */
>       DEFINE_PROP_BOOL("spi", SDState, spi, false),
> +    DEFINE_PROP_BOOL("emmc", SDState, emmc, false),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   
> diff --git a/hw/sd/sdmmc-internal.c b/hw/sd/sdmmc-internal.c
> index 2053def..8648a78 100644
> --- a/hw/sd/sdmmc-internal.c
> +++ b/hw/sd/sdmmc-internal.c
> @@ -14,7 +14,7 @@
>   const char *sd_cmd_name(uint8_t cmd)
>   {
>       static const char *cmd_abbrev[SDMMC_CMD_MAX] = {
> -         [0]    = "GO_IDLE_STATE",
> +         [0]    = "GO_IDLE_STATE",           [1]    = "SEND_OP_CMD",
>            [2]    = "ALL_SEND_CID",            [3]    = "SEND_RELATIVE_ADDR",
>            [4]    = "SET_DSR",                 [5]    = "IO_SEND_OP_COND",
>            [6]    = "SWITCH_FUNC",             [7]    = "SELECT/DESELECT_CARD",
> 

