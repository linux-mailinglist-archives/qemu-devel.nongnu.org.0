Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B594A7913
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:58:14 +0100 (CET)
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLld-0006Dd-Qv
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1nFK6f-0006t6-Pd; Wed, 02 Feb 2022 13:11:50 -0500
Received: from mout.gmx.net ([212.227.17.21]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1nFK6b-0007CI-Ni; Wed, 02 Feb 2022 13:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643825502;
 bh=wWXuDkRScInuclDhq6OmOZoNhGxGL6K/53L0kOYts5Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U/FR6d3UAp6M14cG1P9bf0SbrFCEwfnHcjP7jR87hjVEoUtxhzY0cgsxRiIuYX1Cx
 OSbupiV7xH4Wpw0a5oeBR6li1ue3E5RUVBI78XIjhFrZeBjRYN1ACKRPbyeICleVb2
 FBc0JijzXYiPfG3lZWuo0UdxFzIW7LKOOY1bdSag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1mQMIX0TgR-00pdJC; Wed, 02
 Feb 2022 19:11:42 +0100
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 4/6] hw/display/artist: rewrite vram access mode handling
Date: Wed,  2 Feb 2022 19:11:37 +0100
Message-Id: <20220202181139.124485-5-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202181139.124485-1-deller@gmx.de>
References: <20220202181139.124485-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2xZFWWZuf8khtuFOYW7E+ajVLk3xUb6Hrb/sMsELph29BuyRpj4
 8Wd6BV+Pz5jVkafgGRge7L77tV1bFGC/2CsLmh20y4AZYFaIrBJSq6/+Br5McLOGOcRGnq3
 +tM6qWwqb2HkwODwwfYja5qJ+Qp88oiDXtD+nqx/u/OCRbf0XOyTEKfi6FrLtZNsgC8ntGc
 QARl4dWl3VEkZL4hcWi+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0hNvRNYHrjA=:yjsK1U3kWAt+u3NByJD8sj
 oNw0TtwlpmJN2H4yGq1blrHm2UTmBWXUVitPWcVRBR+gC1JiKbnit8MXtON+3aquHkUBPr0Vo
 M+UGHpZqHRJuSLHt4BG5puxSxd9W54w6lupeFG9Nky7bobFsvsF3g4zhIw9CEUSRzHirgmOOZ
 veZS7PqyW+lM2Y76Te8uompEfF3PP54JgZxrzDtgyUpTMn+9g6gk/NpbQHKv7r0sTFMychmgm
 rLdtYjqwW6F+Fuzny+dVPOSUl4CnezP2C5FxdqQIPdmHh7/et1/s+1rn4+/P9801/tlBpw5Gs
 6IRxpnk+77hfoaWT4TzFrNQYkPzAJQ7RDH8LxJEcXlluLCwWPAjJUdqujDpyrhhpcGffeOTtZ
 8P8i+c8CiG9qcYtt8wFGXmMyvb3bvLwDwgSPCJ+XzlE5btKvNY8G6OIE5b5oRsvQi1iuEV7nd
 qPxmcmWb62YRFnmivb5RV06BnJfI2I2PsJ06ViT0AUarxsC5Wwh2G7evSR+DuO68YH1BPuNT4
 jYDNootIE1i3GPYH0TywP8Qstn03PZp9ZGsbI7M6KLl0jckZEHJVPwIZB9JlPqLVlWHtWi4Lg
 y0RYrymT7h5O1JyC1+ueNYC71Kh4ssp+gBLMsGJ4/gL65UUzaP9HTkmg/DHXjQIF4uyXjVo7g
 ZYKKYkFChrwndCxZbOtgwxJ6+Fj5zYQEz+PmKRcuyBG+wcfScOa73DYYskl2jI+BXkJhwabXR
 /m7zh35oD9II4QhdpJO2MoZG5rpvrFeoKt4aI0q5nLAoimR/amnECUnPstSsrB+Lab/mIkvif
 PagHmimrf4+sB0yFoufIc3HO4/u5hl9axoqTOlSoru6Dw203R6NhnZeR6evQMpxidWICTR2Vt
 93EfZrRrf3oMbWIwo99BIigse2iPkuzD5tq6w9jgswLgyAEs+Z3KL2RkfdH899T7ncTQUhYt1
 dKCdKPUQ/Lum1H7vxfsYmdqjp7cpg6FTJyGj3EuB9xbONBP+we027pzsJU5p0h00E4Y1Dx/HN
 0vLBOW0d2NvwTvVyzoO7ENvDz99huPufs+8ywCpsdITNPNz+97E2nLrwLCLQxdk2IAbFGhTtw
 8O1Qj8DFuaMMYM=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sven Schnelle <svens@stackframe.org>

When writing this code it was assumed that register 0x118000 is the
buffer access mode for color map accesses. It turned out that this
is wrong. Instead register 0x118000 sets both src and dst buffer
access mode at the same time.

This required a larger rewrite of the code. The good thing is that
both the linear framebuffer and the register based vram access can
now be combined into one function.

This makes the linux 'stifb' framebuffer work, and both HP-UX 10.20
and HP-UX 11.11 are still working.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: qemu-stable@nongnu.org
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c     | 416 ++++++++++++++++------------------------
 hw/display/trace-events |   8 +-
 2 files changed, 166 insertions(+), 258 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 21b7fd1b44..442bdbc130 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -91,7 +91,6 @@ struct ARTISTState {
     uint32_t reg_300208;
     uint32_t reg_300218;

-    uint32_t cmap_bm_access;
     uint32_t dst_bm_access;
     uint32_t src_bm_access;
     uint32_t control_plane;
@@ -134,7 +133,7 @@ typedef enum {
     PATTERN_LINE_START =3D 0x100ecc,
     LINE_SIZE =3D 0x100e04,
     LINE_END =3D 0x100e44,
-    CMAP_BM_ACCESS =3D 0x118000,
+    DST_SRC_BM_ACCESS =3D 0x118000,
     DST_BM_ACCESS =3D 0x118004,
     SRC_BM_ACCESS =3D 0x118008,
     CONTROL_PLANE =3D 0x11800c,
@@ -176,7 +175,7 @@ static const char *artist_reg_name(uint64_t addr)
     REG_NAME(TRANSFER_DATA);
     REG_NAME(CONTROL_PLANE);
     REG_NAME(IMAGE_BITMAP_OP);
-    REG_NAME(CMAP_BM_ACCESS);
+    REG_NAME(DST_SRC_BM_ACCESS);
     REG_NAME(DST_BM_ACCESS);
     REG_NAME(SRC_BM_ACCESS);
     REG_NAME(CURSOR_POS);
@@ -222,40 +221,14 @@ static void artist_invalidate_lines(struct vram_buff=
er *buf,
     }
 }

-static int vram_write_pix_per_transfer(ARTISTState *s)
-{
-    if (s->cmap_bm_access) {
-        return 1 << ((s->cmap_bm_access >> 27) & 0x0f);
-    } else {
-        return 1 << ((s->dst_bm_access >> 27) & 0x0f);
-    }
-}
-
-static int vram_pixel_length(ARTISTState *s)
-{
-    if (s->cmap_bm_access) {
-        return (s->cmap_bm_access >> 24) & 0x07;
-    } else {
-        return (s->dst_bm_access >> 24) & 0x07;
-    }
-}
-
 static int vram_write_bufidx(ARTISTState *s)
 {
-    if (s->cmap_bm_access) {
-        return (s->cmap_bm_access >> 12) & 0x0f;
-    } else {
-        return (s->dst_bm_access >> 12) & 0x0f;
-    }
+    return (s->dst_bm_access >> 12) & 0x0f;
 }

 static int vram_read_bufidx(ARTISTState *s)
 {
-    if (s->cmap_bm_access) {
-        return (s->cmap_bm_access >> 12) & 0x0f;
-    } else {
-        return (s->src_bm_access >> 12) & 0x0f;
-    }
+    return (s->src_bm_access >> 12) & 0x0f;
 }

 static struct vram_buffer *vram_read_buffer(ARTISTState *s)
@@ -352,130 +325,6 @@ static void artist_invalidate_cursor(ARTISTState *s)
                             y, s->cursor_height);
 }

-static void vram_bit_write(ARTISTState *s, int posy, bool incr_x,
-                           int size, uint32_t data)
-{
-    struct vram_buffer *buf;
-    uint32_t vram_bitmask =3D s->vram_bitmask;
-    int mask, i, pix_count, pix_length;
-    unsigned int posx, offset, width;
-    uint8_t *data8, *p;
-
-    pix_count =3D vram_write_pix_per_transfer(s);
-    pix_length =3D vram_pixel_length(s);
-
-    buf =3D vram_write_buffer(s);
-    width =3D buf->width;
-
-    if (s->cmap_bm_access) {
-        offset =3D s->vram_pos;
-    } else {
-        posx =3D ADDR_TO_X(s->vram_pos >> 2);
-        posy +=3D ADDR_TO_Y(s->vram_pos >> 2);
-        offset =3D posy * width + posx;
-    }
-
-    if (!buf->size || offset >=3D buf->size) {
-        return;
-    }
-
-    p =3D buf->data;
-
-    if (pix_count > size * 8) {
-        pix_count =3D size * 8;
-    }
-
-    switch (pix_length) {
-    case 0:
-        if (s->image_bitmap_op & 0x20000000) {
-            data &=3D vram_bitmask;
-        }
-
-        for (i =3D 0; i < pix_count; i++) {
-            uint32_t off =3D offset + pix_count - 1 - i;
-            if (off < buf->size) {
-                artist_rop8(s, buf, off,
-                            (data & 1) ? (s->plane_mask >> 24) : 0);
-            }
-            data >>=3D 1;
-        }
-        memory_region_set_dirty(&buf->mr, offset, pix_count);
-        break;
-
-    case 3:
-        if (s->cmap_bm_access) {
-            if (offset + 3 < buf->size) {
-                *(uint32_t *)(p + offset) =3D data;
-            }
-            break;
-        }
-        data8 =3D (uint8_t *)&data;
-
-        for (i =3D 3; i >=3D 0; i--) {
-            if (!(s->image_bitmap_op & 0x20000000) ||
-                s->vram_bitmask & (1 << (28 + i))) {
-                uint32_t off =3D offset + 3 - i;
-                if (off < buf->size) {
-                    artist_rop8(s, buf, off, data8[ROP8OFF(i)]);
-                }
-            }
-        }
-        memory_region_set_dirty(&buf->mr, offset, 3);
-        break;
-
-    case 6:
-        switch (size) {
-        default:
-        case 4:
-            vram_bitmask =3D s->vram_bitmask;
-            break;
-
-        case 2:
-            vram_bitmask =3D s->vram_bitmask >> 16;
-            break;
-
-        case 1:
-            vram_bitmask =3D s->vram_bitmask >> 24;
-            break;
-        }
-
-        for (i =3D 0; i < pix_count && offset + i < buf->size; i++) {
-            mask =3D 1 << (pix_count - 1 - i);
-
-            if (!(s->image_bitmap_op & 0x20000000) ||
-                (vram_bitmask & mask)) {
-                if (data & mask) {
-                    artist_rop8(s, buf, offset + i, s->fg_color);
-                } else {
-                    if (!(s->image_bitmap_op & 0x10000002)) {
-                        artist_rop8(s, buf, offset + i, s->bg_color);
-                    }
-                }
-            }
-        }
-        memory_region_set_dirty(&buf->mr, offset, pix_count);
-        break;
-
-    default:
-        qemu_log_mask(LOG_UNIMP, "%s: unknown pixel length %d\n",
-                      __func__, pix_length);
-        break;
-    }
-
-    if (incr_x) {
-        if (s->cmap_bm_access) {
-            s->vram_pos +=3D 4;
-        } else {
-            s->vram_pos +=3D pix_count << 2;
-        }
-    }
-
-    if (vram_write_bufidx(s) =3D=3D ARTIST_BUFFER_CURSOR1 ||
-        vram_write_bufidx(s) =3D=3D ARTIST_BUFFER_CURSOR2) {
-        artist_invalidate_cursor(s);
-    }
-}
-
 static void block_move(ARTISTState *s,
                        unsigned int source_x, unsigned int source_y,
                        unsigned int dest_x,   unsigned int dest_y,
@@ -860,6 +709,151 @@ static void combine_write_reg(hwaddr addr, uint64_t =
val, int size, void *out)
     }
 }

+static void artist_vram_write4(ARTISTState *s, struct vram_buffer *buf,
+                               uint32_t offset, uint32_t data)
+{
+    int i;
+    int mask =3D s->vram_bitmask >> 28;
+
+    for (i =3D 0; i < 4; i++) {
+        if (!(s->image_bitmap_op & 0x20000000) || (mask & 8)) {
+            artist_rop8(s, buf, offset + i, data >> 24);
+            data <<=3D 8;
+            mask <<=3D 1;
+        }
+    }
+    memory_region_set_dirty(&buf->mr, offset, 3);
+}
+
+static void artist_vram_write32(ARTISTState *s, struct vram_buffer *buf,
+                                uint32_t offset, int size, uint32_t data,
+                                int fg, int bg)
+{
+    uint32_t mask, vram_bitmask =3D s->vram_bitmask >> ((4 - size) * 8);
+    int i, pix_count =3D size * 8;
+
+    for (i =3D 0; i < pix_count && offset + i < buf->size; i++) {
+        mask =3D 1 << (pix_count - 1 - i);
+
+        if (!(s->image_bitmap_op & 0x20000000) || (vram_bitmask & mask)) =
{
+            if (data & mask) {
+                artist_rop8(s, buf, offset + i, fg);
+            } else {
+                if (!(s->image_bitmap_op & 0x10000002)) {
+                    artist_rop8(s, buf, offset + i, bg);
+                }
+            }
+        }
+    }
+    memory_region_set_dirty(&buf->mr, offset, pix_count);
+}
+
+static int get_vram_offset(ARTISTState *s, struct vram_buffer *buf,
+                           int pos, int posy)
+{
+    unsigned int posx, width;
+
+    width =3D buf->width;
+    posx =3D ADDR_TO_X(pos);
+    posy +=3D ADDR_TO_Y(pos);
+    return posy * width + posx;
+}
+
+static int vram_bit_write(ARTISTState *s, uint32_t pos, int posy,
+                          uint32_t data, int size)
+{
+    struct vram_buffer *buf =3D vram_write_buffer(s);
+
+    switch (s->dst_bm_access >> 16) {
+    case 0x3ba0:
+    case 0xbbe0:
+        artist_vram_write4(s, buf, pos, bswap32(data));
+        pos +=3D 4;
+        break;
+
+    case 0x1360: /* linux */
+        artist_vram_write4(s, buf, get_vram_offset(s, buf, pos, posy), da=
ta);
+        pos +=3D 4;
+        break;
+
+    case 0x13a0:
+        artist_vram_write4(s, buf, get_vram_offset(s, buf, pos >> 2, posy=
),
+                           data);
+        pos +=3D 16;
+        break;
+
+    case 0x2ea0:
+        artist_vram_write32(s, buf, get_vram_offset(s, buf, pos >> 2, pos=
y),
+                            size, data, s->fg_color, s->bg_color);
+        pos +=3D 4;
+        break;
+
+    case 0x28a0:
+        artist_vram_write32(s, buf, get_vram_offset(s, buf, pos >> 2, pos=
y),
+                            size, data, 1, 0);
+        pos +=3D 4;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unknown dst bm access %08x\n",
+                      __func__, s->dst_bm_access);
+        break;
+    }
+
+    if (vram_write_bufidx(s) =3D=3D ARTIST_BUFFER_CURSOR1 ||
+        vram_write_bufidx(s) =3D=3D ARTIST_BUFFER_CURSOR2) {
+        artist_invalidate_cursor(s);
+    }
+    return pos;
+}
+
+static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
+                              unsigned size)
+{
+    ARTISTState *s =3D opaque;
+    s->vram_char_y =3D 0;
+    trace_artist_vram_write(size, addr, val);
+    vram_bit_write(opaque, addr, 0, val, size);
+}
+
+static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size=
)
+{
+    ARTISTState *s =3D opaque;
+    struct vram_buffer *buf;
+    unsigned int offset;
+    uint64_t val;
+
+    buf =3D vram_read_buffer(s);
+    if (!buf->size) {
+        return 0;
+    }
+
+    offset =3D get_vram_offset(s, buf, addr >> 2, 0);
+
+    if (offset > buf->size) {
+        return 0;
+    }
+
+    switch (s->src_bm_access >> 16) {
+    case 0x3ba0:
+        val =3D *(uint32_t *)(buf->data + offset);
+        break;
+
+    case 0x13a0:
+    case 0x2ea0:
+        val =3D bswap32(*(uint32_t *)(buf->data + offset));
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unknown src bm access %08x\n",
+                      __func__, s->dst_bm_access);
+        val =3D -1ULL;
+        break;
+    }
+    trace_artist_vram_read(size, addr, val);
+    return val;
+}
+
 static void artist_reg_write(void *opaque, hwaddr addr, uint64_t val,
                              unsigned size)
 {
@@ -886,12 +880,12 @@ static void artist_reg_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         break;

     case VRAM_WRITE_INCR_Y:
-        vram_bit_write(s, s->vram_char_y++, false, size, val);
+        vram_bit_write(s, s->vram_pos, s->vram_char_y++, val, size);
         break;

     case VRAM_WRITE_INCR_X:
     case VRAM_WRITE_INCR_X2:
-        vram_bit_write(s, s->vram_char_y, true, size, val);
+        s->vram_pos =3D vram_bit_write(s, s->vram_pos, s->vram_char_y, va=
l, size);
         break;

     case VRAM_IDX:
@@ -993,18 +987,17 @@ static void artist_reg_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         combine_write_reg(addr, val, size, &s->plane_mask);
         break;

-    case CMAP_BM_ACCESS:
-        combine_write_reg(addr, val, size, &s->cmap_bm_access);
+    case DST_SRC_BM_ACCESS:
+        combine_write_reg(addr, val, size, &s->dst_bm_access);
+        combine_write_reg(addr, val, size, &s->src_bm_access);
         break;

     case DST_BM_ACCESS:
         combine_write_reg(addr, val, size, &s->dst_bm_access);
-        s->cmap_bm_access =3D 0;
         break;

     case SRC_BM_ACCESS:
         combine_write_reg(addr, val, size, &s->src_bm_access);
-        s->cmap_bm_access =3D 0;
         break;

     case CONTROL_PLANE:
@@ -1152,98 +1145,6 @@ static uint64_t artist_reg_read(void *opaque, hwadd=
r addr, unsigned size)
     return val;
 }

-static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
-                              unsigned size)
-{
-    ARTISTState *s =3D opaque;
-    struct vram_buffer *buf;
-    unsigned int posy, posx;
-    unsigned int offset;
-    trace_artist_vram_write(size, addr, val);
-
-    if (s->cmap_bm_access) {
-        buf =3D &s->vram_buffer[ARTIST_BUFFER_CMAP];
-        if (addr + 3 < buf->size) {
-            *(uint32_t *)(buf->data + addr) =3D val;
-        }
-        return;
-    }
-
-    buf =3D vram_write_buffer(s);
-    posy =3D ADDR_TO_Y(addr >> 2);
-    posx =3D ADDR_TO_X(addr >> 2);
-
-    if (!buf->size) {
-        return;
-    }
-
-    if (posy > buf->height || posx > buf->width) {
-        return;
-    }
-
-    offset =3D posy * buf->width + posx;
-    if (offset >=3D buf->size) {
-        return;
-    }
-
-    switch (size) {
-    case 4:
-        if (offset + 3 < buf->size) {
-            *(uint32_t *)(buf->data + offset) =3D be32_to_cpu(val);
-            memory_region_set_dirty(&buf->mr, offset, 4);
-        }
-        break;
-    case 2:
-        if (offset + 1 < buf->size) {
-            *(uint16_t *)(buf->data + offset) =3D be16_to_cpu(val);
-            memory_region_set_dirty(&buf->mr, offset, 2);
-        }
-        break;
-    case 1:
-        if (offset < buf->size) {
-            *(uint8_t *)(buf->data + offset) =3D val;
-            memory_region_set_dirty(&buf->mr, offset, 1);
-        }
-        break;
-    default:
-        break;
-    }
-}
-
-static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size=
)
-{
-    ARTISTState *s =3D opaque;
-    struct vram_buffer *buf;
-    uint64_t val;
-    unsigned int posy, posx;
-
-    if (s->cmap_bm_access) {
-        buf =3D &s->vram_buffer[ARTIST_BUFFER_CMAP];
-        val =3D 0;
-        if (addr < buf->size && addr + 3 < buf->size) {
-            val =3D *(uint32_t *)(buf->data + addr);
-        }
-        trace_artist_vram_read(size, addr, 0, 0, val);
-        return val;
-    }
-
-    buf =3D vram_read_buffer(s);
-    if (!buf->size) {
-        return 0;
-    }
-
-    posy =3D ADDR_TO_Y(addr >> 2);
-    posx =3D ADDR_TO_X(addr >> 2);
-
-    if (posy > buf->height || posx > buf->width) {
-        return 0;
-    }
-
-    val =3D cpu_to_be32(*(uint32_t *)(buf->data + posy * buf->width + pos=
x));
-    trace_artist_vram_read(size, addr, posx, posy, val);
-    return val;
-}
-
 static const MemoryRegionOps artist_reg_ops =3D {
     .read =3D artist_reg_read,
     .write =3D artist_reg_write,
@@ -1410,6 +1311,14 @@ static void artist_realizefn(DeviceState *dev, Erro=
r **errp)
     s->cursor_height =3D 32;
     s->cursor_width =3D 32;

+    /*
+     * These two registers are not initialized by seabios's STI implement=
ation.
+     * Initialize them here to sane values so artist also works with olde=
r
+     * (not-fixed) seabios versions.
+     */
+    s->image_bitmap_op =3D 0x23000300;
+    s->plane_mask =3D 0xff;
+
     s->con =3D graphic_console_init(dev, 0, &artist_ops, s);
     qemu_console_resize(s->con, s->width, s->height);
 }
@@ -1450,7 +1359,6 @@ static const VMStateDescription vmstate_artist =3D {
         VMSTATE_UINT32(reg_300200, ARTISTState),
         VMSTATE_UINT32(reg_300208, ARTISTState),
         VMSTATE_UINT32(reg_300218, ARTISTState),
-        VMSTATE_UINT32(cmap_bm_access, ARTISTState),
         VMSTATE_UINT32(dst_bm_access, ARTISTState),
         VMSTATE_UINT32(src_bm_access, ARTISTState),
         VMSTATE_UINT32(control_plane, ARTISTState),
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 3a7a2c957f..4a687d1b8e 100644
=2D-- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -140,10 +140,10 @@ ati_mm_read(unsigned int size, uint64_t addr, const =
char *name, uint64_t val) "%
 ati_mm_write(unsigned int size, uint64_t addr, const char *name, uint64_t=
 val) "%u 0x%"PRIx64 " %s <- 0x%"PRIx64

 # artist.c
-artist_reg_read(unsigned int size, uint64_t addr, const char *name, uint6=
4_t val) "%u 0x%"PRIx64 "%s -> 0x%"PRIx64
-artist_reg_write(unsigned int size, uint64_t addr, const char *name, uint=
64_t val) "%u 0x%"PRIx64 "%s <- 0x%"PRIx64
-artist_vram_read(unsigned int size, uint64_t addr, int posx, int posy, ui=
nt64_t val) "%u 0x%"PRIx64 " %ux%u-> 0x%"PRIx64
-artist_vram_write(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%=
"PRIx64 " <- 0x%"PRIx64
+artist_reg_read(unsigned int size, uint64_t addr, const char *name, uint6=
4_t val) "%u 0x%"PRIx64 "%s -> 0x%08"PRIx64
+artist_reg_write(unsigned int size, uint64_t addr, const char *name, uint=
64_t val) "%u 0x%"PRIx64 "%s <- 0x%08"PRIx64
+artist_vram_read(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%0=
8"PRIx64 " -> 0x%08"PRIx64
+artist_vram_write(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%=
08"PRIx64 " <- 0x%08"PRIx64
 artist_fill_window(unsigned int start_x, unsigned int start_y, unsigned i=
nt width, unsigned int height, uint32_t op, uint32_t ctlpln) "start=3D%ux%=
u length=3D%ux%u op=3D0x%08x ctlpln=3D0x%08x"
 artist_block_move(unsigned int start_x, unsigned int start_y, unsigned in=
t dest_x, unsigned int dest_y, unsigned int width, unsigned int height) "s=
ource %ux%u -> dest %ux%u size %ux%u"
 artist_draw_line(unsigned int start_x, unsigned int start_y, unsigned int=
 end_x, unsigned int end_y) "%ux%u %ux%u"
=2D-
2.34.1


