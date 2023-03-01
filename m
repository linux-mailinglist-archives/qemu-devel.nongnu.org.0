Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB6D6A6CF4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:20:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMMa-00044w-Bw; Wed, 01 Mar 2023 08:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pXMM5-00043K-Ur; Wed, 01 Mar 2023 08:18:51 -0500
Received: from mail-4316.protonmail.ch ([185.70.43.16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pXMM0-0001d1-Ja; Wed, 01 Mar 2023 08:18:49 -0500
Date: Wed, 01 Mar 2023 13:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=r3xtx5yykndebjubfvbwoqazve.protonmail; t=1677676715; x=1677935915;
 bh=wN0xf2amT7bsV4rOeXMpXy4Ntf7pW7END4aPB+9jkXI=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=H3Imska/aK82y1UHcPPvl0IEHph3SdMn8Rh5KQHpLYXdr5y1cgx2sbS3ofiFErqkI
 NnKBDq0BqZec2PNYNWYAPvY9rN6H+SA9QBOYpEaccxWTKIQeQH+jCRk1JJueKxpG6W
 988Sy0m83YR/A8Tq44CGno77Q91Z+X3gIVjlTFdhm4Z/NV5Hh66RVgaik1ZXx9Jsrd
 EG5Pxt3l0xovGvkXDj7XxW1MqshMGqm7hxVxLJ16t417AXH58yE0CGaSBdwzva/9eV
 ZIYOH+w8OKIVEgGS24Ci7QXbIFj3wm0ZF16qxzggCmaTXIdna0+T5SUdJUzpgu8OFg
 XpG0QnliYvxVQ==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Subject: [RFC v2] m25p80: Implement Octal SPI commands
Message-ID: <20230301131704.375557-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.16;
 envelope-from=anton.kochkov@proton.me; helo=mail-4316.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1148
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1149
---
 hw/block/m25p80.c | 194 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 184 insertions(+), 10 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 02adc87527..79ab090ed9 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -129,6 +129,7 @@ typedef struct FlashPartInfo {
     .die_cnt =3D _die_cnt

 #define JEDEC_NUMONYX 0x20
+#define JEDEC_MICRON 0x2C
 #define JEDEC_WINBOND 0xEF
 #define JEDEC_SPANSION 0x01

@@ -151,6 +152,9 @@ typedef struct FlashPartInfo {
 #define NVCFG_4BYTE_ADDR_MASK (1 << 0)
 #define NVCFG_LOWER_SEGMENT_MASK (1 << 1)

+/* Micron configuration register macros */
+#define NVCFG_OCTAL_IO_MASK (1 << 5)
+
 /* Numonyx (Micron) Flag Status Register macros */
 #define FSR_4BYTE_ADDR_MODE_ENABLED 0x1
 #define FSR_FLASH_READY (1 << 7)
@@ -372,6 +376,8 @@ typedef enum {
     READ4 =3D 0x13,
     FAST_READ =3D 0x0b,
     FAST_READ4 =3D 0x0c,
+    O_FAST_READ =3D 0x9d,
+    O_FAST_READ4 =3D 0xfd,
     DOR =3D 0x3b,
     DOR4 =3D 0x3c,
     QOR =3D 0x6b,
@@ -380,6 +386,11 @@ typedef enum {
     DIOR4 =3D 0xbc,
     QIOR =3D 0xeb,
     QIOR4 =3D 0xec,
+    OOR =3D 0x8b,
+    OOR4 =3D 0x8c,
+    OOR4_MT35X =3D 0x7c, /* according mt35x datasheet */
+    OIOR =3D 0xcb,
+    OIOR4 =3D 0xcc,

     PP =3D 0x02,
     PP4 =3D 0x12,
@@ -388,8 +399,11 @@ typedef enum {
     QPP =3D 0x32,
     QPP_4 =3D 0x34,
     RDID_90 =3D 0x90,
+    RDID_9E =3D 0x9E,
     RDID_AB =3D 0xab,
     AAI_WP =3D 0xad,
+    OPP =3D 0x82,
+    OPP4 =3D 0x84,

     ERASE_4K =3D 0x20,
     ERASE4_4K =3D 0x21,
@@ -440,6 +454,7 @@ typedef enum {
     MAN_SPANSION,
     MAN_MACRONIX,
     MAN_NUMONYX,
+    MAN_MICRON,
     MAN_WINBOND,
     MAN_SST,
     MAN_ISSI,
@@ -475,6 +490,9 @@ struct Flash {
     /* Configuration register for Macronix */
     uint32_t volatile_cfg;
     uint32_t enh_volatile_cfg;
+    /* Configuration register arrays for Micron */
+    uint8_t micron_volatile_cfg[8];
+    uint8_t micron_nonvolatile_cfg[8];
     /* Spansion cfg registers. */
     uint8_t spansion_cr1nv;
     uint8_t spansion_cr2nv;
@@ -489,6 +507,7 @@ struct Flash {
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
+    bool octal_enable;
     bool aai_enable;
     bool block_protect0;
     bool block_protect1;
@@ -517,6 +536,8 @@ static inline Manufacturer get_man(Flash *s)
     switch (s->pi->id[0]) {
     case 0x20:
         return MAN_NUMONYX;
+    case 0x2C:
+        return MAN_MICRON;
     case 0xEF:
         return MAN_WINBOND;
     case 0x01:
@@ -697,14 +718,19 @@ static inline int get_addr_length(Flash *s)
    case PP4:
    case PP4_4:
    case QPP_4:
+   case OPP4:
    case READ4:
    case QIOR4:
+   case OIOR4:
    case ERASE4_4K:
    case ERASE4_32K:
    case ERASE4_SECTOR:
    case FAST_READ4:
+   case O_FAST_READ4:
    case DOR4:
    case QOR4:
+   case OOR4:
+   case OOR4_MT35X:
    case DIOR4:
        return 4;
    default:
@@ -734,7 +760,9 @@ static void complete_collecting_data(Flash *s)
     case DPP:
     case QPP:
     case QPP_4:
+    case OPP:
     case PP:
+    case OPP4:
     case PP4:
     case PP4_4:
         s->state =3D STATE_PAGE_PROGRAM;
@@ -748,6 +776,7 @@ static void complete_collecting_data(Flash *s)
     case READ4:
     case FAST_READ:
     case FAST_READ4:
+    case O_FAST_READ:
     case DOR:
     case DOR4:
     case QOR:
@@ -756,6 +785,12 @@ static void complete_collecting_data(Flash *s)
     case DIOR4:
     case QIOR:
     case QIOR4:
+    case OOR:
+    case OOR4:
+    case OOR4_MT35X:
+    case O_FAST_READ4:
+    case OIOR:
+    case OIOR4:
         s->state =3D STATE_READ;
         break;
     case ERASE_4K:
@@ -804,11 +839,43 @@ static void complete_collecting_data(Flash *s)
     case EXTEND_ADDR_WRITE:
         s->ear =3D s->data[0];
         break;
+    case RNVCR:
+        g_assert(get_man(s) =3D=3D MAN_MICRON);
+        s->data[0] =3D s->micron_nonvolatile_cfg[s->cur_addr & 0xFF];
+        s->pos =3D 0;
+        s->len =3D 1;
+        s->state =3D STATE_READING_DATA;
+        s->data_read_loop =3D true;
+        break;
+    case RVCR:
+        g_assert(get_man(s) =3D=3D MAN_MICRON);
+        s->data[0] =3D s->micron_volatile_cfg[s->cur_addr & 0xFF];
+        s->pos =3D 0;
+        s->len =3D 1;
+        s->state =3D STATE_READING_DATA;
+        s->data_read_loop =3D true;
+        break;
     case WNVCR:
-        s->nonvolatile_cfg =3D s->data[0] | (s->data[1] << 8);
+        if (get_man(s) =3D=3D MAN_MICRON) {
+            if (s->cur_addr <=3D 7) {
+                s->micron_nonvolatile_cfg[s->cur_addr] =3D
+                                      s->data[get_addr_length(s)];
+            }
+            s->octal_enable =3D !(s->micron_nonvolatile_cfg[0] & NVCFG_OCT=
AL_IO_MASK);
+        } else {
+            s->nonvolatile_cfg =3D s->data[0] | (s->data[1] << 8);
+        }
         break;
     case WVCR:
-        s->volatile_cfg =3D s->data[0];
+        if (get_man(s) =3D=3D MAN_MICRON) {
+            if (s->cur_addr <=3D 7) {
+                s->micron_volatile_cfg[s->cur_addr] =3D
+                                      s->data[get_addr_length(s)];
+            }
+            s->octal_enable =3D !(s->micron_volatile_cfg[0] & NVCFG_OCTAL_=
IO_MASK);
+        } else {
+            s->volatile_cfg =3D s->data[0];
+        }
         break;
     case WEVCR:
         s->enh_volatile_cfg =3D s->data[0];
@@ -861,6 +928,7 @@ static void reset_memory(Flash *s)
     s->write_enable =3D false;
     s->reset_enable =3D false;
     s->quad_enable =3D false;
+    s->octal_enable =3D false;
     s->aai_enable =3D false;

     switch (get_man(s)) {
@@ -897,6 +965,13 @@ static void reset_memory(Flash *s)
             s->ear =3D s->size / MAX_3BYTES_SIZE - 1;
         }
         break;
+    case MAN_MICRON:
+        s->micron_nonvolatile_cfg[0] =3D 0xe7;
+        s->micron_nonvolatile_cfg[1] =3D 0x1f;
+        if (!(s->micron_nonvolatile_cfg[0] & NVCFG_OCTAL_IO_MASK)) {
+            s->octal_enable =3D true;
+        }
+        break;
     case MAN_MACRONIX:
         s->volatile_cfg =3D 0x7;
         break;
@@ -956,6 +1031,32 @@ static uint8_t numonyx_extract_cfg_num_dummies(Flash =
*s)
     return num_dummies;
 }

+static uint8_t micron_extract_cfg_num_dummies(Flash *s)
+{
+    uint8_t num_dummies;
+    uint8_t mode;
+    assert(get_man(s) =3D=3D MAN_MICRON);
+
+    mode =3D numonyx_mode(s);
+    num_dummies =3D s->micron_volatile_cfg[1];
+
+    if (num_dummies =3D=3D 0x0 || num_dummies =3D=3D 0xf) {
+        switch (s->cmd_in_progress) {
+        case OIOR:
+        case OIOR4:
+        case QIOR:
+        case QIOR4:
+            num_dummies =3D 10;
+            break;
+        default:
+            num_dummies =3D (mode =3D=3D MODE_QIO) ? 10 : 8;
+            break;
+        }
+    }
+
+    return num_dummies;
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes =3D get_addr_length(s);
@@ -970,6 +1071,9 @@ static void decode_fast_read_cmd(Flash *s)
     case MAN_NUMONYX:
         s->needed_bytes +=3D numonyx_extract_cfg_num_dummies(s);
         break;
+    case MAN_MICRON:
+        s->needed_bytes +=3D micron_extract_cfg_num_dummies(s);
+        break;
     case MAN_MACRONIX:
         if (extract32(s->volatile_cfg, 6, 2) =3D=3D 1) {
             s->needed_bytes +=3D 6;
@@ -1099,6 +1203,7 @@ static void decode_qio_read_cmd(Flash *s)
         s->needed_bytes +=3D 3;
         break;
     default:
+        s->needed_bytes +=3D 5;
         break;
     }
     s->pos =3D 0;
@@ -1106,6 +1211,14 @@ static void decode_qio_read_cmd(Flash *s)
     s->state =3D STATE_COLLECTING_DATA;
 }

+static void decode_oio_read_cmd(Flash *s)
+{
+    s->needed_bytes =3D get_addr_length(s);
+    s->pos =3D 0;
+    s->len =3D 0;
+    s->state =3D STATE_COLLECTING_DATA;
+}
+
 static bool is_valid_aai_cmd(uint32_t cmd)
 {
     return cmd =3D=3D AAI_WP || cmd =3D=3D WRDI || cmd =3D=3D RDSR;
@@ -1127,6 +1240,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
                       "M25P80: Invalid cmd within AAI programming sequence=
");
     }

+    s->needed_bytes =3D 0;
+
     switch (value) {

     case ERASE_4K:
@@ -1215,6 +1330,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         }
         break;

+    case OIOR4:
+        s->needed_bytes +=3D 1;
+        /* fall through */
     case QIOR:
     case QIOR4:
         if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) !=3D MODE_DIO) =
{
@@ -1225,6 +1343,20 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         }
         break;

+    case OOR:
+    case OOR4:
+    case OOR4_MT35X:
+    case O_FAST_READ:
+    case OPP:
+    case OPP4:
+        if (get_man(s) =3D=3D MAN_MICRON) {
+            decode_oio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x =
in "
+                          "OIO mode\n", s->cmd_in_progress);
+        }
+        break;
+
     case WRSR:
         /*
          * If WP# is low and status_register_write_disabled is high,
@@ -1303,6 +1435,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->state =3D STATE_READING_DATA;
         break;

+    case RDID_9E:
     case JEDEC_READ:
         if (get_man(s) !=3D MAN_NUMONYX || numonyx_mode(s) =3D=3D MODE_STD=
) {
             trace_m25p80_populated_jedec(s);
@@ -1365,29 +1498,51 @@ static void decode_new_cmd(Flash *s, uint32_t value=
)
         }
         break;
     case RNVCR:
-        s->data[0] =3D s->nonvolatile_cfg & 0xFF;
-        s->data[1] =3D (s->nonvolatile_cfg >> 8) & 0xFF;
+        if (get_man(s) =3D=3D MAN_MICRON) {
+            s->needed_bytes =3D get_addr_length(s);
+            s->state =3D STATE_COLLECTING_DATA;
+            s->len =3D 0;
+        } else {
+            s->data[0] =3D s->nonvolatile_cfg & 0xFF;
+            s->data[1] =3D (s->nonvolatile_cfg >> 8) & 0xFF;
+            s->len =3D 2;
+        }
         s->pos =3D 0;
-        s->len =3D 2;
         s->state =3D STATE_READING_DATA;
         break;
     case WNVCR:
-        if (s->write_enable && get_man(s) =3D=3D MAN_NUMONYX) {
-            s->needed_bytes =3D 2;
+        if (s->write_enable) {
+            if (get_man(s) =3D=3D MAN_NUMONYX) {
+                s->needed_bytes =3D 2;
+            } else if (get_man(s) =3D=3D MAN_MICRON) {
+                s->needed_bytes =3D 1;
+                s->needed_bytes +=3D get_addr_length(s);
+            } else {
+                break;
+            }
             s->pos =3D 0;
             s->len =3D 0;
             s->state =3D STATE_COLLECTING_DATA;
         }
         break;
     case RVCR:
-        s->data[0] =3D s->volatile_cfg & 0xFF;
+        if (get_man(s) =3D=3D MAN_MICRON) {
+            s->needed_bytes =3D get_addr_length(s);
+            s->state =3D STATE_COLLECTING_DATA;
+            s->len =3D 0;
+        } else {
+            s->data[0] =3D s->volatile_cfg & 0xFF;
+            s->state =3D STATE_READING_DATA;
+            s->len =3D 1;
+        }
         s->pos =3D 0;
-        s->len =3D 1;
-        s->state =3D STATE_READING_DATA;
         break;
     case WVCR:
         if (s->write_enable) {
             s->needed_bytes =3D 1;
+            if (get_man(s) =3D=3D MAN_MICRON) {
+                s->needed_bytes +=3D get_addr_length(s);
+            }
             s->pos =3D 0;
             s->len =3D 0;
             s->state =3D STATE_COLLECTING_DATA;
@@ -1751,6 +1906,24 @@ static const VMStateDescription vmstate_m25p80_block=
_protect =3D {
     }
 };

+static bool m25p80_octal_enable_needed(void *opaque)
+{
+    Flash *s =3D (Flash *)opaque;
+
+    return s->octal_enable;
+}
+
+static const VMStateDescription vmstate_m25p80_octal =3D {
+    .name =3D "m25p80/octal",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D m25p80_octal_enable_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_BOOL(octal_enable, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 =3D {
     .name =3D "m25p80",
     .version_id =3D 0,
@@ -1784,6 +1957,7 @@ static const VMStateDescription vmstate_m25p80 =3D {
         &vmstate_m25p80_aai_enable,
         &vmstate_m25p80_write_protect,
         &vmstate_m25p80_block_protect,
+        &vmstate_m25p80_octal,
         NULL
     }
 };
--
2.39.2



