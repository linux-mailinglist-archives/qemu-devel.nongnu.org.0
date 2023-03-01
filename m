Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAF96A6CFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:26:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMSt-0007Yx-0D; Wed, 01 Mar 2023 08:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pXMSj-0007UZ-21; Wed, 01 Mar 2023 08:25:41 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pXMSe-0003Is-OP; Wed, 01 Mar 2023 08:25:40 -0500
Date: Wed, 01 Mar 2023 13:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=pzfvfrgqmza3zl4mxnq4aidbsq.protonmail; t=1677677131; x=1677936331;
 bh=8MwXJkfk6R5ZoA5/D3o0HfrWIbImK4qC9pJ6Dtdakh0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=VjuxFno+V1QanuUYxwS52BAelLBCIsmNlpXk0xOnoMZqB/mTjrwoxwtg1e8yIFQ+z
 RowsRmcgKDcG2OV72Ed0dIe0M6l+3N6MHJswr/X7s2WWdhyUErkenVta2l8r9TB9Nw
 IcfzPVYM732LixEUlzKquw9lKd7IH1ZE1jF/yfRWnkKioQXLWWaYtiD3vov4dxavz4
 aBBi1Lvw+U2Q00wRq+G9iq869Mp981l5bZcy0ABbZJQRGhoEQhBrrqSm1NpuIWxpTR
 +30zeclt5n6lTd/OUFgmYutg9wjktKoXnnw0mi1r2HieAf6lQo5awB8/YQMdiRFEFg
 DTX9nWhJ2ZQuw==
To: Francisco Iglesias <frasse.iglesias@gmail.com>
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [RFC] hw/block/m25p80: implement Octal SPI commands
Message-ID: <Y/9SDzIHXQyZHjIg@localhost.localdomain>
In-Reply-To: <20220817102307.GB4571@fralle-msi>
References: <20220813115821.1990751-1-anton.kochkov@proton.me>
 <20220817102307.GB4571@fralle-msi>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.131;
 envelope-from=anton.kochkov@proton.me; helo=mail-40131.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Francisco,
Sorry for the late reply and rework of the patch, I had been busy with unre=
lated
things and hadn't chance to send an updated version. I have sent RFCv2 to t=
he mailing list.

On Wed, Aug 17, 2022 at 12:23:08PM +0200, Francisco Iglesias wrote:
> Hi Anton,
>
> On [2022 Aug 13] Sat 12:00:03, Anton Kochkov wrote:
> > * Implement Octal SPI commands based on Micron MT35X series
> > * Fix Micron 0x2C-based ID handling (incompatible with Numonyx)
> > * Fix Micron configuration registers handling
>
> Would it be ok for you to split the patch up into 3 patches? (It will hel=
p out
> when reviewing) A couple of initial comments below.
>

As I reduced and cleaned up the patch, it is significantly smaller than bef=
ore.
I am not sure on what criteria then to split it, please let me know if this=
 is still necessary.

> >
> > Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1148
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1149
> > ---
> >  hw/block/m25p80.c | 173 +++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 141 insertions(+), 32 deletions(-)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index a8d2519141..9342a3fe69 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -127,6 +127,7 @@ typedef struct FlashPartInfo {
> >      .die_cnt =3D _die_cnt
> >
> >  #define JEDEC_NUMONYX 0x20
> > +#define JEDEC_MICRON 0x2C
> >  #define JEDEC_WINBOND 0xEF
> >  #define JEDEC_SPANSION 0x01
> >
> > @@ -149,6 +150,9 @@ typedef struct FlashPartInfo {
> >  #define NVCFG_4BYTE_ADDR_MASK (1 << 0)
> >  #define NVCFG_LOWER_SEGMENT_MASK (1 << 1)
> >
> > +/* Micron configuration register macros */
> > +#define NVCFG_OCTAL_IO_MASK (1 << 5)
> > +
> >  /* Numonyx (Micron) Flag Status Register macros */
> >  #define FSR_4BYTE_ADDR_MODE_ENABLED 0x1
> >  #define FSR_FLASH_READY (1 << 7)
> > @@ -360,6 +364,9 @@ typedef enum {
> >      READ4 =3D 0x13,
> >      FAST_READ =3D 0x0b,
> >      FAST_READ4 =3D 0x0c,
> > +    O_FAST_READ =3D 0x9d,
> > +    O_FAST_READ4 =3D 0xfc,
> > +    OIOR_DDR =3D 0xfd,
> >      DOR =3D 0x3b,
> >      DOR4 =3D 0x3c,
> >      QOR =3D 0x6b,
> > @@ -368,6 +375,11 @@ typedef enum {
> >      DIOR4 =3D 0xbc,
> >      QIOR =3D 0xeb,
> >      QIOR4 =3D 0xec,
> > +    OOR =3D 0x8b,
> > +    OOR4 =3D 0x8c,
> > +    OOR4_MT35X =3D 0x7c, /* according mt35x datasheet */
> > +    OIOR =3D 0xcb,
> > +    OIOR4 =3D 0xcc,
> >
> >      PP =3D 0x02,
> >      PP4 =3D 0x12,
> > @@ -378,6 +390,8 @@ typedef enum {
> >      RDID_90 =3D 0x90,
> >      RDID_AB =3D 0xab,
> >      AAI_WP =3D 0xad,
> > +    OPP =3D 0x82,
> > +    OPP4 =3D 0x84,
> >
> >      ERASE_4K =3D 0x20,
> >      ERASE4_4K =3D 0x21,
> > @@ -427,6 +441,7 @@ typedef enum {
> >      MAN_SPANSION,
> >      MAN_MACRONIX,
> >      MAN_NUMONYX,
> > +    MAN_MICRON,
> >      MAN_WINBOND,
> >      MAN_SST,
> >      MAN_ISSI,
> > @@ -462,6 +477,9 @@ struct Flash {
> >      /* Configuration register for Macronix */
> >      uint32_t volatile_cfg;
> >      uint32_t enh_volatile_cfg;
> > +    /* Configuration register arrays for Micron */
> > +    uint32_t micron_volatile_cfg[8];
> > +    uint32_t micron_nonvolatile_cfg[8];
> >      /* Spansion cfg registers. */
> >      uint8_t spansion_cr1nv;
> >      uint8_t spansion_cr2nv;
> > @@ -476,6 +494,7 @@ struct Flash {
> >      bool four_bytes_address_mode;
> >      bool reset_enable;
> >      bool quad_enable;
> > +    bool octal_enable;
> >      bool aai_enable;
> >      bool block_protect0;
> >      bool block_protect1;
> > @@ -504,6 +523,8 @@ static inline Manufacturer get_man(Flash *s)
> >      switch (s->pi->id[0]) {
> >      case 0x20:
> >          return MAN_NUMONYX;
> > +    case 0x2C:
> > +        return MAN_MICRON;
> >      case 0xEF:
> >          return MAN_WINBOND;
> >      case 0x01:
> > @@ -684,12 +705,17 @@ static inline int get_addr_length(Flash *s)
> >     case QPP_4:
> >     case READ4:
> >     case QIOR4:
> > +   case OIOR4:
> >     case ERASE4_4K:
> >     case ERASE4_32K:
> >     case ERASE4_SECTOR:
> >     case FAST_READ4:
> > +   case O_FAST_READ4:
> > +   case OIOR_DDR:
> >     case DOR4:
> >     case QOR4:
> > +   case OOR4:
> > +   case OOR4_MT35X:
> >     case DIOR4:
> >         return 4;
> >     default:
> > @@ -719,9 +745,10 @@ static void complete_collecting_data(Flash *s)
> >      case DPP:
> >      case QPP:
> >      case QPP_4:
> > +    case OPP:
> >      case PP:
> > +    case OPP4:
> >      case PP4:
> > -    case PP4_4:
> >          s->state =3D STATE_PAGE_PROGRAM;
> >          break;
> >      case AAI_WP:
> > @@ -732,15 +759,23 @@ static void complete_collecting_data(Flash *s)
> >      case READ:
> >      case READ4:
> >      case FAST_READ:
> > -    case FAST_READ4:
> > +    case O_FAST_READ:
> >      case DOR:
> > -    case DOR4:
> >      case QOR:
> > -    case QOR4:
> > +    case OOR:
> >      case DIOR:
> > -    case DIOR4:
> >      case QIOR:
> > +    case OIOR:
> > +    case FAST_READ4:
> > +    case O_FAST_READ4:
> > +    case OIOR_DDR:
> > +    case DOR4:
> > +    case QOR4:
> > +    case OOR4:
> > +    case OOR4_MT35X:
> > +    case DIOR4:
> >      case QIOR4:
> > +    case OIOR4:
> >          s->state =3D STATE_READ;
> >          break;
> >      case ERASE_4K:
> > @@ -785,15 +820,40 @@ static void complete_collecting_data(Flash *s)
> >              s->write_enable =3D false;
> >          }
> >          break;
> > -    case BRWR:
> >      case EXTEND_ADDR_WRITE:
> >          s->ear =3D s->data[0];
> >          break;
> > +    case RNVCR:
> > +        g_assert(get_man(s) =3D=3D MAN_MICRON);
> > +        s->data[0] =3D s->micron_volatile_cfg[s->cur_addr & 0xFF];
> > +        s->pos =3D 0;
> > +        s->len =3D 1;
> > +        s->state =3D STATE_READING_DATA;
> > +        s->data_read_loop =3D true;
> > +        break;
> > +    case RVCR:
> > +        g_assert(get_man(s) =3D=3D MAN_MICRON);
> > +        s->data[0] =3D s->micron_nonvolatile_cfg[s->cur_addr & 0xFF];
> > +        s->pos =3D 0;
> > +        s->len =3D 1;
> > +        s->state =3D STATE_READING_DATA;
> > +        s->data_read_loop =3D true;
> > +        break;
> >      case WNVCR:
> > -        s->nonvolatile_cfg =3D s->data[0] | (s->data[1] << 8);
> > +        if (get_man(s) =3D=3D MAN_MICRON) {
> > +            s->micron_nonvolatile_cfg[s->cur_addr & 0xFF] =3D s->data[=
0];
> > +            s->octal_enable =3D !extract32(s->data[0], 5, 1);
> > +        } else {
> > +            s->nonvolatile_cfg =3D s->data[0] | (s->data[1] << 8);
> > +        }
> >          break;
> >      case WVCR:
> > -        s->volatile_cfg =3D s->data[0];
> > +        if (get_man(s) =3D=3D MAN_MICRON) {
> > +            s->micron_nonvolatile_cfg[s->cur_addr & 0xFF] =3D s->data[=
0];
> > +            s->octal_enable =3D !extract32(s->data[0], 5, 1);
> > +        } else {
> > +            s->volatile_cfg =3D s->data[0];
> > +        }
> >          break;
> >      case WEVCR:
> >          s->enh_volatile_cfg =3D s->data[0];
> > @@ -841,6 +901,7 @@ static void reset_memory(Flash *s)
> >      s->write_enable =3D false;
> >      s->reset_enable =3D false;
> >      s->quad_enable =3D false;
> > +    s->octal_enable =3D false;
> >      s->aai_enable =3D false;
> >
> >      switch (get_man(s)) {
> > @@ -877,6 +938,13 @@ static void reset_memory(Flash *s)
> >              s->ear =3D s->size / MAX_3BYTES_SIZE - 1;
> >          }
> >          break;
> > +    case MAN_MICRON:
> > +        s->micron_nonvolatile_cfg[0] =3D 0xe7;
> > +        s->micron_nonvolatile_cfg[1] =3D 0x1f;
> > +        if (!(s->micron_nonvolatile_cfg[0] & NVCFG_OCTAL_IO_MASK)) {
> > +            s->octal_enable =3D true;
> > +        }
> > +        break;
> >      case MAN_MACRONIX:
> >          s->volatile_cfg =3D 0x7;
> >          break;
> > @@ -950,6 +1018,9 @@ static void decode_fast_read_cmd(Flash *s)
> >      case MAN_NUMONYX:
> >          s->needed_bytes +=3D numonyx_extract_cfg_num_dummies(s);
> >          break;
> > +    case MAN_MICRON:
> > +        s->needed_bytes +=3D s->micron_volatile_cfg[1];
> > +        break;
> >      case MAN_MACRONIX:
> >          if (extract32(s->volatile_cfg, 6, 2) =3D=3D 1) {
> >              s->needed_bytes +=3D 6;
> > @@ -1079,6 +1150,7 @@ static void decode_qio_read_cmd(Flash *s)
> >          s->needed_bytes +=3D 3;
> >          break;
> >      default:
> > +        s->needed_bytes +=3D 5;
> >          break;
> >      }
> >      s->pos =3D 0;
> > @@ -1107,28 +1179,42 @@ static void decode_new_cmd(Flash *s, uint32_t v=
alue)
> >                        "M25P80: Invalid cmd within AAI programming sequ=
ence");
> >      }
> >
> > +    s->needed_bytes =3D 0;
> > +
> >      switch (value) {
> >
> > +    case ERASE4_SECTOR:
> > +        if (s->four_bytes_address_mode =3D=3D false) {
> > +            s->needed_bytes +=3D 1;
> > +        }
> > +        /* fall-through */
> >      case ERASE_4K:
> > -    case ERASE4_4K:
> >      case ERASE_32K:
> > -    case ERASE4_32K:
> >      case ERASE_SECTOR:
> > -    case ERASE4_SECTOR:
> > +    case OPP:
> >      case PP:
> > -    case PP4:
> > +    case QOR:
> > +    case OOR:
>
> A suggestion is to try to add the octal commands similary as what is curr=
ently
> done for the QOR/QOR4, DIOR/DIOR4 and QIOR/QIOR4 (and making a call to fu=
nction
> for obtaining required needed_bytes for the commands, it could be that it
> simplifies).
>

Done, added a separate function to handle them.

> > +    case FAST_READ:
> > +    case O_FAST_READ:
> > +    case OIOR_DDR:
> > +    case DOR:
> >      case DIE_ERASE:
> >      case RDID_90:
> >      case RDID_AB:
> > -        s->needed_bytes =3D get_addr_length(s);
> > +        s->needed_bytes +=3D get_addr_length(s);
> >          s->pos =3D 0;
> >          s->len =3D 0;
> >          s->state =3D STATE_COLLECTING_DATA;
> >          break;
> > -    case READ:
> >      case READ4:
> > +        if (s->four_bytes_address_mode =3D=3D false) {
> > +            s->needed_bytes +=3D 1;
> > +        }
> > +        /* fall-through */
> > +    case READ:
> >          if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) =3D=3D MODE=
_STD) {
> > -            s->needed_bytes =3D get_addr_length(s);
> > +            s->needed_bytes +=3D get_addr_length(s);
> >              s->pos =3D 0;
> >              s->len =3D 0;
> >              s->state =3D STATE_COLLECTING_DATA;
> > @@ -1139,7 +1225,7 @@ static void decode_new_cmd(Flash *s, uint32_t val=
ue)
> >          break;
> >      case DPP:
> >          if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) !=3D MODE_Q=
IO) {
> > -            s->needed_bytes =3D get_addr_length(s);
> > +            s->needed_bytes +=3D get_addr_length(s);
> >              s->pos =3D 0;
> >              s->len =3D 0;
> >              s->state =3D STATE_COLLECTING_DATA;
> > @@ -1151,8 +1237,11 @@ static void decode_new_cmd(Flash *s, uint32_t va=
lue)
> >      case QPP:
> >      case QPP_4:
> >      case PP4_4:
> > +        if (s->four_bytes_address_mode =3D=3D false) {
> > +            s->needed_bytes +=3D 1;
> > +        }
> >          if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) !=3D MODE_D=
IO) {
> > -            s->needed_bytes =3D get_addr_length(s);
> > +            s->needed_bytes +=3D get_addr_length(s);
> >              s->pos =3D 0;
> >              s->len =3D 0;
> >              s->state =3D STATE_COLLECTING_DATA;
> > @@ -1162,11 +1251,9 @@ static void decode_new_cmd(Flash *s, uint32_t va=
lue)
> >          }
> >          break;
> >
> > -    case FAST_READ:
> >      case FAST_READ4:
> >          decode_fast_read_cmd(s);
> >          break;
> > -    case DOR:
> >      case DOR4:
> >          if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) !=3D MODE_Q=
IO) {
> >              decode_fast_read_cmd(s);
> > @@ -1175,14 +1262,13 @@ static void decode_new_cmd(Flash *s, uint32_t v=
alue)
> >                            "QIO mode\n", s->cmd_in_progress);
> >          }
> >          break;
> > -    case QOR:
> >      case QOR4:
> > -        if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) !=3D MODE_D=
IO) {
> > -            decode_fast_read_cmd(s);
> > -        } else {
> > -            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd=
 %x in "
> > -                          "DIO mode\n", s->cmd_in_progress);
> > -        }
> > +    case OOR4:
> > +    case OOR4_MT35X:
> > +        s->needed_bytes +=3D 4;
> > +        s->pos =3D 0;
> > +        s->len =3D 0;
> > +        s->state =3D STATE_COLLECTING_DATA;
> >          break;
> >
> >      case DIOR:
> > @@ -1329,6 +1415,8 @@ static void decode_new_cmd(Flash *s, uint32_t val=
ue)
> >          s->four_bytes_address_mode =3D false;
> >          break;
> >      case BRRD:
> > +        s->data_read_loop =3D false;
> > +        /* fall-through */
> >      case EXTEND_ADDR_READ:
> >          s->data[0] =3D s->ear;
> >          s->pos =3D 0;
> > @@ -1345,22 +1433,39 @@ static void decode_new_cmd(Flash *s, uint32_t v=
alue)
> >          }
> >          break;
> >      case RNVCR:
> > -        s->data[0] =3D s->nonvolatile_cfg & 0xFF;
> > -        s->data[1] =3D (s->nonvolatile_cfg >> 8) & 0xFF;
> > +        if (get_man(s) =3D=3D MAN_MICRON) {
> > +            s->needed_bytes =3D get_addr_length(s);
> > +            s->state =3D STATE_COLLECTING_DATA;
> > +            s->len =3D 0;
> > +        } else {
> > +            s->data[0] =3D s->nonvolatile_cfg & 0xFF;
> > +            s->data[1] =3D (s->nonvolatile_cfg >> 8) & 0xFF;
> > +            s->len =3D 2;
> > +        }
> >          s->pos =3D 0;
> > -        s->len =3D 2;
> >          s->state =3D STATE_READING_DATA;
> >          break;
> >      case WNVCR:
> > -        if (s->write_enable && get_man(s) =3D=3D MAN_NUMONYX) {
> > -            s->needed_bytes =3D 2;
> > +        if (s->write_enable) {
> > +            if (get_man(s) =3D=3D MAN_NUMONYX) {
> > +                s->needed_bytes =3D 2;
> > +            } else if (get_man(s) =3D=3D MAN_MICRON) {
> > +                s->needed_bytes +=3D get_addr_length(s);
> > +            } else {
> > +                break;
> > +            }
> >              s->pos =3D 0;
> >              s->len =3D 0;
> >              s->state =3D STATE_COLLECTING_DATA;
> >          }
> >          break;
> >      case RVCR:
> > -        s->data[0] =3D s->volatile_cfg & 0xFF;
> > +        if (get_man(s) =3D=3D MAN_MICRON) {
> > +            s->data[0] =3D s->micron_nonvolatile_cfg[s->cur_addr & 0xF=
F];
> > +        } else {
> > +            s->data[0] =3D s->volatile_cfg & 0xFF;
> > +        }
> > +        s->len =3D 1;
> >          s->pos =3D 0;
> >          s->len =3D 1;
> >          s->state =3D STATE_READING_DATA;
> > @@ -1368,6 +1473,9 @@ static void decode_new_cmd(Flash *s, uint32_t val=
ue)
> >      case WVCR:
> >          if (s->write_enable) {
> >              s->needed_bytes =3D 1;
> > +            if (get_man(s) =3D=3D MAN_MICRON) {
> > +                s->needed_bytes +=3D get_addr_length(s);
> > +            }
> >              s->pos =3D 0;
> >              s->len =3D 0;
> >              s->state =3D STATE_COLLECTING_DATA;
> > @@ -1737,6 +1845,7 @@ static const VMStateDescription vmstate_m25p80 =
=3D {
> >          VMSTATE_UINT32(volatile_cfg, Flash),
> >          VMSTATE_UINT32(enh_volatile_cfg, Flash),
> >          VMSTATE_BOOL(quad_enable, Flash),
> > +        VMSTATE_BOOL(octal_enable, Flash),
>
> We will need to add above through a subsection (similarly as has been don=
e in
> this commit: 2113a1289 and documentation about this is found in
> docs/devel/migration.rst). We'll also need to add the volatile and nonvol=
atile
> cfgs into the subsection in a similar fashion.
>

Done as well.

> Thanks for this!
> Best regards,
> Francisco Iglesias
>
> >          VMSTATE_UINT8(spansion_cr1nv, Flash),
> >          VMSTATE_UINT8(spansion_cr2nv, Flash),
> >          VMSTATE_UINT8(spansion_cr3nv, Flash),
> > --
> > 2.37.1
> >
> >
> >


