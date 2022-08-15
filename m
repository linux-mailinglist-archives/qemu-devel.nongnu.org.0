Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF659281C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 05:31:07 +0200 (CEST)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNQok-0005er-JD
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 23:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNQmq-00048K-QH; Sun, 14 Aug 2022 23:29:08 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNQmo-0000dt-37; Sun, 14 Aug 2022 23:29:08 -0400
Received: by mail-pf1-x429.google.com with SMTP id z187so5714379pfb.12;
 Sun, 14 Aug 2022 20:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ULS8m+StZMt1/hF2Cvp6dgwEjRZ5NV43jj3H5M3nSTU=;
 b=H0r9DB6fBblamJZ0icV79Bja2hslUeMq+9P/CUrNTR5PruTZQL16V0UtgINwS/hQty
 41kBt9voP8tkM95daMbBmBop+VJ19gk7o3ByNbMLa/uV5Kpjx/n+Ro7cgOmAvGqsiInB
 pzCwo9VOCzyklCtAgxbVzILt5LA7LXz9qNEdryMK+tU1+Y0uauzdOBoAzImuCTzyzu8J
 ydQHrF5Vzd3nOHs4lynKMLKwpeGFqhspTjB/suUnVMFMEyieG/rOTXunP7NlNDNVAkPu
 L+6bsU+4RQGO8RhbZHXknPETQQLQrtjwhaOVQ4SkcdImxepGexjkbCUyvzxZ7uQhHtq2
 XDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ULS8m+StZMt1/hF2Cvp6dgwEjRZ5NV43jj3H5M3nSTU=;
 b=Wg1/QNhLE8gMNSlTPW8W6OJbfe79Aff/AO8WumG3OukM/Ptiq7GlY58AesheG9jQJv
 OJ9jYF5HDR+2R+cdBM5I+ysWI4L5ZtDXGRzxw5O2xP5mYEAckitS7az2VfnezvIzihuV
 YxGGgPNGAjIm4f+Jwh7TlijssdSqyrm6FIX2DePNT07W044CdUKzckZtelAW+l5CvToc
 /2V27FQH0pWfIih+ex7f4KVgQ9B2GUK269qVK4D32H9fbFzcqJupF+aeGDMXDxydkSX7
 K/hZ9pGjFQUHd5QvMmpk3lUm2EkMZkK632/g6njRribYia4tHpbvZd4hsU5DTfWPJ1Ww
 0kIA==
X-Gm-Message-State: ACgBeo13lguBPYP1PkqZlOys5atFVA4y6Fdee9ZZ1Edfl3S/X1GtWg2q
 9Ru2m/1B5G54/V6k9DKcHxHxmr3I1xDq87LUREI=
X-Google-Smtp-Source: AA6agR4V5n9t/p5hGZSPoSBtbxPSbpj2YLbjO1Bg7LdJiu6BeibyH2r2fW9iAo2z0zMm0oVJNAEchRLzMDMa2Gv0hRo=
X-Received: by 2002:a63:1e10:0:b0:41d:f6f6:49cc with SMTP id
 e16-20020a631e10000000b0041df6f649ccmr11929562pge.223.1660534143967; Sun, 14
 Aug 2022 20:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220813115821.1990751-1-anton.kochkov@proton.me>
In-Reply-To: <20220813115821.1990751-1-anton.kochkov@proton.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 13:28:37 +1000
Message-ID: <CAKmqyKMyrL+G9yh0F1=_YwHCLxri7i0-YHLr_c2u=zp4VpdL-A@mail.gmail.com>
Subject: Re: [RFC] hw/block/m25p80: implement Octal SPI commands
To: Anton Kochkov <anton.kochkov@proton.me>, 
 Francisco Iglesias <francisco.iglesias@xilinx.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Aug 13, 2022 at 10:01 PM Anton Kochkov <anton.kochkov@proton.me> wrote:
>
> * Implement Octal SPI commands based on Micron MT35X series
> * Fix Micron 0x2C-based ID handling (incompatible with Numonyx)
> * Fix Micron configuration registers handling
>
> Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1148
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1149

+Edgar and Francisco, who are some of the Xilinx QEMU developers

Alistair

> ---
>  hw/block/m25p80.c | 173 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 141 insertions(+), 32 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index a8d2519141..9342a3fe69 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -127,6 +127,7 @@ typedef struct FlashPartInfo {
>      .die_cnt = _die_cnt
>
>  #define JEDEC_NUMONYX 0x20
> +#define JEDEC_MICRON 0x2C
>  #define JEDEC_WINBOND 0xEF
>  #define JEDEC_SPANSION 0x01
>
> @@ -149,6 +150,9 @@ typedef struct FlashPartInfo {
>  #define NVCFG_4BYTE_ADDR_MASK (1 << 0)
>  #define NVCFG_LOWER_SEGMENT_MASK (1 << 1)
>
> +/* Micron configuration register macros */
> +#define NVCFG_OCTAL_IO_MASK (1 << 5)
> +
>  /* Numonyx (Micron) Flag Status Register macros */
>  #define FSR_4BYTE_ADDR_MODE_ENABLED 0x1
>  #define FSR_FLASH_READY (1 << 7)
> @@ -360,6 +364,9 @@ typedef enum {
>      READ4 = 0x13,
>      FAST_READ = 0x0b,
>      FAST_READ4 = 0x0c,
> +    O_FAST_READ = 0x9d,
> +    O_FAST_READ4 = 0xfc,
> +    OIOR_DDR = 0xfd,
>      DOR = 0x3b,
>      DOR4 = 0x3c,
>      QOR = 0x6b,
> @@ -368,6 +375,11 @@ typedef enum {
>      DIOR4 = 0xbc,
>      QIOR = 0xeb,
>      QIOR4 = 0xec,
> +    OOR = 0x8b,
> +    OOR4 = 0x8c,
> +    OOR4_MT35X = 0x7c, /* according mt35x datasheet */
> +    OIOR = 0xcb,
> +    OIOR4 = 0xcc,
>
>      PP = 0x02,
>      PP4 = 0x12,
> @@ -378,6 +390,8 @@ typedef enum {
>      RDID_90 = 0x90,
>      RDID_AB = 0xab,
>      AAI_WP = 0xad,
> +    OPP = 0x82,
> +    OPP4 = 0x84,
>
>      ERASE_4K = 0x20,
>      ERASE4_4K = 0x21,
> @@ -427,6 +441,7 @@ typedef enum {
>      MAN_SPANSION,
>      MAN_MACRONIX,
>      MAN_NUMONYX,
> +    MAN_MICRON,
>      MAN_WINBOND,
>      MAN_SST,
>      MAN_ISSI,
> @@ -462,6 +477,9 @@ struct Flash {
>      /* Configuration register for Macronix */
>      uint32_t volatile_cfg;
>      uint32_t enh_volatile_cfg;
> +    /* Configuration register arrays for Micron */
> +    uint32_t micron_volatile_cfg[8];
> +    uint32_t micron_nonvolatile_cfg[8];
>      /* Spansion cfg registers. */
>      uint8_t spansion_cr1nv;
>      uint8_t spansion_cr2nv;
> @@ -476,6 +494,7 @@ struct Flash {
>      bool four_bytes_address_mode;
>      bool reset_enable;
>      bool quad_enable;
> +    bool octal_enable;
>      bool aai_enable;
>      bool block_protect0;
>      bool block_protect1;
> @@ -504,6 +523,8 @@ static inline Manufacturer get_man(Flash *s)
>      switch (s->pi->id[0]) {
>      case 0x20:
>          return MAN_NUMONYX;
> +    case 0x2C:
> +        return MAN_MICRON;
>      case 0xEF:
>          return MAN_WINBOND;
>      case 0x01:
> @@ -684,12 +705,17 @@ static inline int get_addr_length(Flash *s)
>     case QPP_4:
>     case READ4:
>     case QIOR4:
> +   case OIOR4:
>     case ERASE4_4K:
>     case ERASE4_32K:
>     case ERASE4_SECTOR:
>     case FAST_READ4:
> +   case O_FAST_READ4:
> +   case OIOR_DDR:
>     case DOR4:
>     case QOR4:
> +   case OOR4:
> +   case OOR4_MT35X:
>     case DIOR4:
>         return 4;
>     default:
> @@ -719,9 +745,10 @@ static void complete_collecting_data(Flash *s)
>      case DPP:
>      case QPP:
>      case QPP_4:
> +    case OPP:
>      case PP:
> +    case OPP4:
>      case PP4:
> -    case PP4_4:
>          s->state = STATE_PAGE_PROGRAM;
>          break;
>      case AAI_WP:
> @@ -732,15 +759,23 @@ static void complete_collecting_data(Flash *s)
>      case READ:
>      case READ4:
>      case FAST_READ:
> -    case FAST_READ4:
> +    case O_FAST_READ:
>      case DOR:
> -    case DOR4:
>      case QOR:
> -    case QOR4:
> +    case OOR:
>      case DIOR:
> -    case DIOR4:
>      case QIOR:
> +    case OIOR:
> +    case FAST_READ4:
> +    case O_FAST_READ4:
> +    case OIOR_DDR:
> +    case DOR4:
> +    case QOR4:
> +    case OOR4:
> +    case OOR4_MT35X:
> +    case DIOR4:
>      case QIOR4:
> +    case OIOR4:
>          s->state = STATE_READ;
>          break;
>      case ERASE_4K:
> @@ -785,15 +820,40 @@ static void complete_collecting_data(Flash *s)
>              s->write_enable = false;
>          }
>          break;
> -    case BRWR:
>      case EXTEND_ADDR_WRITE:
>          s->ear = s->data[0];
>          break;
> +    case RNVCR:
> +        g_assert(get_man(s) == MAN_MICRON);
> +        s->data[0] = s->micron_volatile_cfg[s->cur_addr & 0xFF];
> +        s->pos = 0;
> +        s->len = 1;
> +        s->state = STATE_READING_DATA;
> +        s->data_read_loop = true;
> +        break;
> +    case RVCR:
> +        g_assert(get_man(s) == MAN_MICRON);
> +        s->data[0] = s->micron_nonvolatile_cfg[s->cur_addr & 0xFF];
> +        s->pos = 0;
> +        s->len = 1;
> +        s->state = STATE_READING_DATA;
> +        s->data_read_loop = true;
> +        break;
>      case WNVCR:
> -        s->nonvolatile_cfg = s->data[0] | (s->data[1] << 8);
> +        if (get_man(s) == MAN_MICRON) {
> +            s->micron_nonvolatile_cfg[s->cur_addr & 0xFF] = s->data[0];
> +            s->octal_enable = !extract32(s->data[0], 5, 1);
> +        } else {
> +            s->nonvolatile_cfg = s->data[0] | (s->data[1] << 8);
> +        }
>          break;
>      case WVCR:
> -        s->volatile_cfg = s->data[0];
> +        if (get_man(s) == MAN_MICRON) {
> +            s->micron_nonvolatile_cfg[s->cur_addr & 0xFF] = s->data[0];
> +            s->octal_enable = !extract32(s->data[0], 5, 1);
> +        } else {
> +            s->volatile_cfg = s->data[0];
> +        }
>          break;
>      case WEVCR:
>          s->enh_volatile_cfg = s->data[0];
> @@ -841,6 +901,7 @@ static void reset_memory(Flash *s)
>      s->write_enable = false;
>      s->reset_enable = false;
>      s->quad_enable = false;
> +    s->octal_enable = false;
>      s->aai_enable = false;
>
>      switch (get_man(s)) {
> @@ -877,6 +938,13 @@ static void reset_memory(Flash *s)
>              s->ear = s->size / MAX_3BYTES_SIZE - 1;
>          }
>          break;
> +    case MAN_MICRON:
> +        s->micron_nonvolatile_cfg[0] = 0xe7;
> +        s->micron_nonvolatile_cfg[1] = 0x1f;
> +        if (!(s->micron_nonvolatile_cfg[0] & NVCFG_OCTAL_IO_MASK)) {
> +            s->octal_enable = true;
> +        }
> +        break;
>      case MAN_MACRONIX:
>          s->volatile_cfg = 0x7;
>          break;
> @@ -950,6 +1018,9 @@ static void decode_fast_read_cmd(Flash *s)
>      case MAN_NUMONYX:
>          s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>          break;
> +    case MAN_MICRON:
> +        s->needed_bytes += s->micron_volatile_cfg[1];
> +        break;
>      case MAN_MACRONIX:
>          if (extract32(s->volatile_cfg, 6, 2) == 1) {
>              s->needed_bytes += 6;
> @@ -1079,6 +1150,7 @@ static void decode_qio_read_cmd(Flash *s)
>          s->needed_bytes += 3;
>          break;
>      default:
> +        s->needed_bytes += 5;
>          break;
>      }
>      s->pos = 0;
> @@ -1107,28 +1179,42 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>                        "M25P80: Invalid cmd within AAI programming sequence");
>      }
>
> +    s->needed_bytes = 0;
> +
>      switch (value) {
>
> +    case ERASE4_SECTOR:
> +        if (s->four_bytes_address_mode == false) {
> +            s->needed_bytes += 1;
> +        }
> +        /* fall-through */
>      case ERASE_4K:
> -    case ERASE4_4K:
>      case ERASE_32K:
> -    case ERASE4_32K:
>      case ERASE_SECTOR:
> -    case ERASE4_SECTOR:
> +    case OPP:
>      case PP:
> -    case PP4:
> +    case QOR:
> +    case OOR:
> +    case FAST_READ:
> +    case O_FAST_READ:
> +    case OIOR_DDR:
> +    case DOR:
>      case DIE_ERASE:
>      case RDID_90:
>      case RDID_AB:
> -        s->needed_bytes = get_addr_length(s);
> +        s->needed_bytes += get_addr_length(s);
>          s->pos = 0;
>          s->len = 0;
>          s->state = STATE_COLLECTING_DATA;
>          break;
> -    case READ:
>      case READ4:
> +        if (s->four_bytes_address_mode == false) {
> +            s->needed_bytes += 1;
> +        }
> +        /* fall-through */
> +    case READ:
>          if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
> -            s->needed_bytes = get_addr_length(s);
> +            s->needed_bytes += get_addr_length(s);
>              s->pos = 0;
>              s->len = 0;
>              s->state = STATE_COLLECTING_DATA;
> @@ -1139,7 +1225,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          break;
>      case DPP:
>          if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
> -            s->needed_bytes = get_addr_length(s);
> +            s->needed_bytes += get_addr_length(s);
>              s->pos = 0;
>              s->len = 0;
>              s->state = STATE_COLLECTING_DATA;
> @@ -1151,8 +1237,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case QPP:
>      case QPP_4:
>      case PP4_4:
> +        if (s->four_bytes_address_mode == false) {
> +            s->needed_bytes += 1;
> +        }
>          if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
> -            s->needed_bytes = get_addr_length(s);
> +            s->needed_bytes += get_addr_length(s);
>              s->pos = 0;
>              s->len = 0;
>              s->state = STATE_COLLECTING_DATA;
> @@ -1162,11 +1251,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          }
>          break;
>
> -    case FAST_READ:
>      case FAST_READ4:
>          decode_fast_read_cmd(s);
>          break;
> -    case DOR:
>      case DOR4:
>          if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
>              decode_fast_read_cmd(s);
> @@ -1175,14 +1262,13 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>                            "QIO mode\n", s->cmd_in_progress);
>          }
>          break;
> -    case QOR:
>      case QOR4:
> -        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
> -            decode_fast_read_cmd(s);
> -        } else {
> -            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> -                          "DIO mode\n", s->cmd_in_progress);
> -        }
> +    case OOR4:
> +    case OOR4_MT35X:
> +        s->needed_bytes += 4;
> +        s->pos = 0;
> +        s->len = 0;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>
>      case DIOR:
> @@ -1329,6 +1415,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          s->four_bytes_address_mode = false;
>          break;
>      case BRRD:
> +        s->data_read_loop = false;
> +        /* fall-through */
>      case EXTEND_ADDR_READ:
>          s->data[0] = s->ear;
>          s->pos = 0;
> @@ -1345,22 +1433,39 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          }
>          break;
>      case RNVCR:
> -        s->data[0] = s->nonvolatile_cfg & 0xFF;
> -        s->data[1] = (s->nonvolatile_cfg >> 8) & 0xFF;
> +        if (get_man(s) == MAN_MICRON) {
> +            s->needed_bytes = get_addr_length(s);
> +            s->state = STATE_COLLECTING_DATA;
> +            s->len = 0;
> +        } else {
> +            s->data[0] = s->nonvolatile_cfg & 0xFF;
> +            s->data[1] = (s->nonvolatile_cfg >> 8) & 0xFF;
> +            s->len = 2;
> +        }
>          s->pos = 0;
> -        s->len = 2;
>          s->state = STATE_READING_DATA;
>          break;
>      case WNVCR:
> -        if (s->write_enable && get_man(s) == MAN_NUMONYX) {
> -            s->needed_bytes = 2;
> +        if (s->write_enable) {
> +            if (get_man(s) == MAN_NUMONYX) {
> +                s->needed_bytes = 2;
> +            } else if (get_man(s) == MAN_MICRON) {
> +                s->needed_bytes += get_addr_length(s);
> +            } else {
> +                break;
> +            }
>              s->pos = 0;
>              s->len = 0;
>              s->state = STATE_COLLECTING_DATA;
>          }
>          break;
>      case RVCR:
> -        s->data[0] = s->volatile_cfg & 0xFF;
> +        if (get_man(s) == MAN_MICRON) {
> +            s->data[0] = s->micron_nonvolatile_cfg[s->cur_addr & 0xFF];
> +        } else {
> +            s->data[0] = s->volatile_cfg & 0xFF;
> +        }
> +        s->len = 1;
>          s->pos = 0;
>          s->len = 1;
>          s->state = STATE_READING_DATA;
> @@ -1368,6 +1473,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case WVCR:
>          if (s->write_enable) {
>              s->needed_bytes = 1;
> +            if (get_man(s) == MAN_MICRON) {
> +                s->needed_bytes += get_addr_length(s);
> +            }
>              s->pos = 0;
>              s->len = 0;
>              s->state = STATE_COLLECTING_DATA;
> @@ -1737,6 +1845,7 @@ static const VMStateDescription vmstate_m25p80 = {
>          VMSTATE_UINT32(volatile_cfg, Flash),
>          VMSTATE_UINT32(enh_volatile_cfg, Flash),
>          VMSTATE_BOOL(quad_enable, Flash),
> +        VMSTATE_BOOL(octal_enable, Flash),
>          VMSTATE_UINT8(spansion_cr1nv, Flash),
>          VMSTATE_UINT8(spansion_cr2nv, Flash),
>          VMSTATE_UINT8(spansion_cr3nv, Flash),
> --
> 2.37.1
>
>
>

