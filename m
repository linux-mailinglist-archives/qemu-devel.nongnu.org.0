Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC84967DA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 23:27:47 +0100 (CET)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB2Nl-0006fj-Gy
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 17:27:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2D8-0000T7-RV
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:49 -0500
Received: from outbound5h.eu.mailhop.org ([18.156.94.234]:56452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2D1-0005vA-Oi
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:43 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1642803398; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=iDHVPkylTWLC6laT6lbQYsjHVlK5jt++czUOtEC8QCR9ba/flAHSQFIGri2GkTqfJwJRWcVbVsyG6
 qE1c/XPHn+BZU5tSXr4L3MY23IcPowf3pdWC/cCsp4GE/ZYOj7mGFEdhS111WIfFeGTATuaPZG6a6B
 Cs2t9drOhKQ7g+XaWHYE1vBFyN5SsbhzAMjXTVfnMMuq/S9Mg0r+DItw15zAzpRNIxBFNxOZ657FUH
 8UOdf3kLRTkZJ5VEfP+NMLLAXzGFxrh3BCtPuUuVBx4+mqqsxpVjADI2hxVjlr+iW4Vl7ikwGVXP5o
 neDIWGZSM21/A//DWibeSgEHftzZgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:dkim-signature:dkim-signature:from;
 bh=Nhv1OU19mhatG5YETsEw/wjxTv8IvE1SUYuKl3VTyTM=;
 b=sqCnCFkgB77ZQn0ely9IY1+jHZFNNRxrhUNSxKm/aXavqI3sxj/tVD6UZt3TSzVa7/ifvuzl5IOUC
 RQzWHEWYSHqeZPtCsWIzKI0Do9uBMxqaMzzSMGMntKRiTFkee56FjOe7TJ/NgyVqwyf+2MsYhXn86W
 2rRg5nIEdT0BSX72/SWUMLCO8p3zUSLDgXTXhAloJ5a17L4Rr2S2CByLzU0N4Z3JZnMh3/hc+Tl8/H
 zRKS4PbX5Kg2zZxFoZA3j5I7n3NiRkZfxCAV6dQwHq4p161jR7DsisQiCzegpXfpMMnPZC7l0L/emz
 +lJTi7uzAyQReidbAwMkFkBMkCAUmiw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=Nhv1OU19mhatG5YETsEw/wjxTv8IvE1SUYuKl3VTyTM=;
 b=h5VNJPHS7+LlwuYKkqAx+a3W72zsxLTLZhvGVJ+xi943QusFiBHFxPNTlrEnkuxTZAS+FmJSxZ9m/
 e8TI/0NyH7uFo07q9rGXKGGhPLKwF7LIwK/LNxIp8yhxmsFZJbo3CoiQIk9kYJdO0acwHrSJjPAE4M
 Pimm4quR5/2laPuo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=Nhv1OU19mhatG5YETsEw/wjxTv8IvE1SUYuKl3VTyTM=;
 b=tQ7VY7GXQBmSilsj/PrAd5jSeRNXFwcVsKCuKfhQMSOOrk8TtUoLm6dp89IBMpCbEPnGdcc8YP/JD
 YIsRptGKmvYLUqP8iStxLcU72fUtXwsMiQBRjXuSaXGqhBsZLmvf6CwXkOlJkr/3LsqxCQhK7mlrzE
 iUwqh+C8f7+8Bi4FDmcP5woS5EpjnqvHb2M9ScETZqb+S4khgMHU3uO0cj+cCvKjQhaK0tL14ncAEH
 +/8BF7ySsnF/ICTcgiTkvUPsLBVtEtnQ/yOrZqknJdkgw8bkgZa+YbP/swsZyz5wP7Ye53jZU81Jl9
 vA1Ah453LIDnPtI+VnQw8PrICwNt54A==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: caa22d2d-7b07-11ec-a077-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id caa22d2d-7b07-11ec-a077-973b52397bcb;
 Fri, 21 Jan 2022 22:16:34 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org)
 by mail.duncanthrax.net with esmtpa (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nB2Cu-005WLL-Uf; Sat, 22 Jan 2022 00:16:33 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 3/3] hw/display/artist: rewrite vram access mode handling
Date: Fri, 21 Jan 2022 23:16:19 +0100
Message-Id: <20220121221619.1069447-4-svens@stackframe.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121221619.1069447-1-svens@stackframe.org>
References: <20220121221619.1069447-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.156.94.234; envelope-from=svens@stackframe.org;
 helo=outbound5h.eu.mailhop.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/display/artist.c     | 416 ++++++++++++++++------------------------
 hw/display/trace-events |   8 +-
 2 files changed, 166 insertions(+), 258 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index cfae92d3e8..04db74d240 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -92,7 +92,6 @@ struct ARTISTState {
     uint32_t reg_300208;
     uint32_t reg_300218;
 
-    uint32_t cmap_bm_access;
     uint32_t dst_bm_access;
     uint32_t src_bm_access;
     uint32_t control_plane;
@@ -135,7 +134,7 @@ typedef enum {
     PATTERN_LINE_START = 0x100ecc,
     LINE_SIZE = 0x100e04,
     LINE_END = 0x100e44,
-    CMAP_BM_ACCESS = 0x118000,
+    DST_SRC_BM_ACCESS = 0x118000,
     DST_BM_ACCESS = 0x118004,
     SRC_BM_ACCESS = 0x118008,
     CONTROL_PLANE = 0x11800c,
@@ -177,7 +176,7 @@ static const char *artist_reg_name(uint64_t addr)
     REG_NAME(TRANSFER_DATA);
     REG_NAME(CONTROL_PLANE);
     REG_NAME(IMAGE_BITMAP_OP);
-    REG_NAME(CMAP_BM_ACCESS);
+    REG_NAME(DST_SRC_BM_ACCESS);
     REG_NAME(DST_BM_ACCESS);
     REG_NAME(SRC_BM_ACCESS);
     REG_NAME(CURSOR_POS);
@@ -223,40 +222,14 @@ static void artist_invalidate_lines(struct vram_buffer *buf,
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
@@ -346,130 +319,6 @@ static void artist_invalidate_cursor(ARTISTState *s)
                             y, s->cursor_height);
 }
 
-static void vram_bit_write(ARTISTState *s, int posy, bool incr_x,
-                           int size, uint32_t data)
-{
-    struct vram_buffer *buf;
-    uint32_t vram_bitmask = s->vram_bitmask;
-    int mask, i, pix_count, pix_length;
-    unsigned int posx, offset, width;
-    uint8_t *data8, *p;
-
-    pix_count = vram_write_pix_per_transfer(s);
-    pix_length = vram_pixel_length(s);
-
-    buf = vram_write_buffer(s);
-    width = buf->width;
-
-    if (s->cmap_bm_access) {
-        offset = s->vram_pos;
-    } else {
-        posx = ADDR_TO_X(s->vram_pos >> 2);
-        posy += ADDR_TO_Y(s->vram_pos >> 2);
-        offset = posy * width + posx;
-    }
-
-    if (!buf->size || offset >= buf->size) {
-        return;
-    }
-
-    p = buf->data;
-
-    if (pix_count > size * 8) {
-        pix_count = size * 8;
-    }
-
-    switch (pix_length) {
-    case 0:
-        if (s->image_bitmap_op & 0x20000000) {
-            data &= vram_bitmask;
-        }
-
-        for (i = 0; i < pix_count; i++) {
-            uint32_t off = offset + pix_count - 1 - i;
-            if (off < buf->size) {
-                artist_rop8(s, buf, off,
-                            (data & 1) ? (s->plane_mask >> 24) : 0);
-            }
-            data >>= 1;
-        }
-        memory_region_set_dirty(&buf->mr, offset, pix_count);
-        break;
-
-    case 3:
-        if (s->cmap_bm_access) {
-            if (offset + 3 < buf->size) {
-                *(uint32_t *)(p + offset) = data;
-            }
-            break;
-        }
-        data8 = (uint8_t *)&data;
-
-        for (i = 3; i >= 0; i--) {
-            if (!(s->image_bitmap_op & 0x20000000) ||
-                s->vram_bitmask & (1 << (28 + i))) {
-                uint32_t off = offset + 3 - i;
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
-            vram_bitmask = s->vram_bitmask;
-            break;
-
-        case 2:
-            vram_bitmask = s->vram_bitmask >> 16;
-            break;
-
-        case 1:
-            vram_bitmask = s->vram_bitmask >> 24;
-            break;
-        }
-
-        for (i = 0; i < pix_count && offset + i < buf->size; i++) {
-            mask = 1 << (pix_count - 1 - i);
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
-            s->vram_pos += 4;
-        } else {
-            s->vram_pos += pix_count << 2;
-        }
-    }
-
-    if (vram_write_bufidx(s) == ARTIST_BUFFER_CURSOR1 ||
-        vram_write_bufidx(s) == ARTIST_BUFFER_CURSOR2) {
-        artist_invalidate_cursor(s);
-    }
-}
-
 static void block_move(ARTISTState *s,
                        unsigned int source_x, unsigned int source_y,
                        unsigned int dest_x,   unsigned int dest_y,
@@ -854,6 +703,151 @@ static void combine_write_reg(hwaddr addr, uint64_t val, int size, void *out)
     }
 }
 
+static void artist_vram_write4(ARTISTState *s, struct vram_buffer *buf,
+                               uint32_t offset, uint32_t data)
+{
+    int i;
+    int mask = s->vram_bitmask >> 28;
+
+    for (i = 0; i < 4; i++) {
+        if (!(s->image_bitmap_op & 0x20000000) || (mask & 8)) {
+            artist_rop8(s, buf, offset + i, data >> 24);
+            data <<= 8;
+            mask <<= 1;
+        }
+    }
+    memory_region_set_dirty(&buf->mr, offset, 3);
+}
+
+static void artist_vram_write32(ARTISTState *s, struct vram_buffer *buf,
+                                uint32_t offset, int size, uint32_t data,
+                                int fg, int bg)
+{
+    uint32_t mask, vram_bitmask = s->vram_bitmask >> ((4 - size) * 8);
+    int i, pix_count = size * 8;
+
+    for (i = 0; i < pix_count && offset + i < buf->size; i++) {
+        mask = 1 << (pix_count - 1 - i);
+
+        if (!(s->image_bitmap_op & 0x20000000) || (vram_bitmask & mask)) {
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
+    width = buf->width;
+    posx = ADDR_TO_X(pos);
+    posy += ADDR_TO_Y(pos);
+    return posy * width + posx;
+}
+
+static int vram_bit_write(ARTISTState *s, uint32_t pos, int posy,
+                          uint32_t data, int size)
+{
+    struct vram_buffer *buf = vram_write_buffer(s);
+
+    switch (s->dst_bm_access >> 16) {
+    case 0x3ba0:
+    case 0xbbe0:
+        artist_vram_write4(s, buf, pos, bswap32(data));
+        pos += 4;
+        break;
+
+    case 0x1360: /* linux */
+        artist_vram_write4(s, buf, get_vram_offset(s, buf, pos, posy), data);
+        pos += 4;
+        break;
+
+    case 0x13a0:
+        artist_vram_write4(s, buf, get_vram_offset(s, buf, pos >> 2, posy),
+                           data);
+        pos += 16;
+        break;
+
+    case 0x2ea0:
+        artist_vram_write32(s, buf, get_vram_offset(s, buf, pos >> 2, posy),
+                            size, data, s->fg_color, s->bg_color);
+        pos += 4;
+        break;
+
+    case 0x28a0:
+        artist_vram_write32(s, buf, get_vram_offset(s, buf, pos >> 2, posy),
+                            size, data, 1, 0);
+        pos += 4;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unknown dst bm access %08x\n",
+                      __func__, s->dst_bm_access);
+        break;
+    }
+
+    if (vram_write_bufidx(s) == ARTIST_BUFFER_CURSOR1 ||
+        vram_write_bufidx(s) == ARTIST_BUFFER_CURSOR2) {
+        artist_invalidate_cursor(s);
+    }
+    return pos;
+}
+
+static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
+                              unsigned size)
+{
+    ARTISTState *s = opaque;
+    s->vram_char_y = 0;
+    trace_artist_vram_write(size, addr, val);
+    vram_bit_write(opaque, addr, 0, val, size);
+}
+
+static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ARTISTState *s = opaque;
+    struct vram_buffer *buf;
+    unsigned int offset;
+    uint64_t val;
+
+    buf = vram_read_buffer(s);
+    if (!buf->size) {
+        return 0;
+    }
+
+    offset = get_vram_offset(s, buf, addr >> 2, 0);
+
+    if (offset > buf->size) {
+        return 0;
+    }
+
+    switch (s->src_bm_access >> 16) {
+    case 0x3ba0:
+        val = *(uint32_t *)(buf->data + offset);
+        break;
+
+    case 0x13a0:
+    case 0x2ea0:
+        val = bswap32(*(uint32_t *)(buf->data + offset));
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unknown src bm access %08x\n",
+                      __func__, s->dst_bm_access);
+        val = -1ULL;
+        break;
+    }
+    trace_artist_vram_read(size, addr, val);
+    return val;
+}
+
 static void artist_reg_write(void *opaque, hwaddr addr, uint64_t val,
                              unsigned size)
 {
@@ -880,12 +874,12 @@ static void artist_reg_write(void *opaque, hwaddr addr, uint64_t val,
         break;
 
     case VRAM_WRITE_INCR_Y:
-        vram_bit_write(s, s->vram_char_y++, false, size, val);
+        vram_bit_write(s, s->vram_pos, s->vram_char_y++, val, size);
         break;
 
     case VRAM_WRITE_INCR_X:
     case VRAM_WRITE_INCR_X2:
-        vram_bit_write(s, s->vram_char_y, true, size, val);
+        s->vram_pos = vram_bit_write(s, s->vram_pos, s->vram_char_y, val, size);
         break;
 
     case VRAM_IDX:
@@ -987,18 +981,17 @@ static void artist_reg_write(void *opaque, hwaddr addr, uint64_t val,
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
-        s->cmap_bm_access = 0;
         break;
 
     case SRC_BM_ACCESS:
         combine_write_reg(addr, val, size, &s->src_bm_access);
-        s->cmap_bm_access = 0;
         break;
 
     case CONTROL_PLANE:
@@ -1152,98 +1145,6 @@ static uint64_t artist_reg_read(void *opaque, hwaddr addr, unsigned size)
     return val;
 }
 
-static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
-                              unsigned size)
-{
-    ARTISTState *s = opaque;
-    struct vram_buffer *buf;
-    unsigned int posy, posx;
-    unsigned int offset;
-    trace_artist_vram_write(size, addr, val);
-
-    if (s->cmap_bm_access) {
-        buf = &s->vram_buffer[ARTIST_BUFFER_CMAP];
-        if (addr + 3 < buf->size) {
-            *(uint32_t *)(buf->data + addr) = val;
-        }
-        return;
-    }
-
-    buf = vram_write_buffer(s);
-    posy = ADDR_TO_Y(addr >> 2);
-    posx = ADDR_TO_X(addr >> 2);
-
-    if (!buf->size) {
-        return;
-    }
-
-    if (posy > buf->height || posx > buf->width) {
-        return;
-    }
-
-    offset = posy * buf->width + posx;
-    if (offset >= buf->size) {
-        return;
-    }
-
-    switch (size) {
-    case 4:
-        if (offset + 3 < buf->size) {
-            *(uint32_t *)(buf->data + offset) = be32_to_cpu(val);
-            memory_region_set_dirty(&buf->mr, offset, 4);
-        }
-        break;
-    case 2:
-        if (offset + 1 < buf->size) {
-            *(uint16_t *)(buf->data + offset) = be16_to_cpu(val);
-            memory_region_set_dirty(&buf->mr, offset, 2);
-        }
-        break;
-    case 1:
-        if (offset < buf->size) {
-            *(uint8_t *)(buf->data + offset) = val;
-            memory_region_set_dirty(&buf->mr, offset, 1);
-        }
-        break;
-    default:
-        break;
-    }
-}
-
-static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
-{
-    ARTISTState *s = opaque;
-    struct vram_buffer *buf;
-    uint64_t val;
-    unsigned int posy, posx;
-
-    if (s->cmap_bm_access) {
-        buf = &s->vram_buffer[ARTIST_BUFFER_CMAP];
-        val = 0;
-        if (addr < buf->size && addr + 3 < buf->size) {
-            val = *(uint32_t *)(buf->data + addr);
-        }
-        trace_artist_vram_read(size, addr, 0, 0, val);
-        return val;
-    }
-
-    buf = vram_read_buffer(s);
-    if (!buf->size) {
-        return 0;
-    }
-
-    posy = ADDR_TO_Y(addr >> 2);
-    posx = ADDR_TO_X(addr >> 2);
-
-    if (posy > buf->height || posx > buf->width) {
-        return 0;
-    }
-
-    val = cpu_to_be32(*(uint32_t *)(buf->data + posy * buf->width + posx));
-    trace_artist_vram_read(size, addr, posx, posy, val);
-    return val;
-}
-
 static const MemoryRegionOps artist_reg_ops = {
     .read = artist_reg_read,
     .write = artist_reg_write,
@@ -1412,6 +1313,14 @@ static void artist_realizefn(DeviceState *dev, Error **errp)
     s->cursor_height = 32;
     s->cursor_width = 32;
 
+    /*
+     * These two registers are not initialized by seabios's STI implementation.
+     * Initialize them here to sane values so artist also works with older
+     * (not-fixed) seabios versions.
+     */
+    s->image_bitmap_op = 0x23000300;
+    s->plane_mask = 0xff;
+
     s->con = graphic_console_init(dev, 0, &artist_ops, s);
     qemu_console_resize(s->con, s->width, s->height);
 }
@@ -1453,7 +1362,6 @@ static const VMStateDescription vmstate_artist = {
         VMSTATE_UINT32(reg_300200, ARTISTState),
         VMSTATE_UINT32(reg_300208, ARTISTState),
         VMSTATE_UINT32(reg_300218, ARTISTState),
-        VMSTATE_UINT32(cmap_bm_access, ARTISTState),
         VMSTATE_UINT32(dst_bm_access, ARTISTState),
         VMSTATE_UINT32(src_bm_access, ARTISTState),
         VMSTATE_UINT32(control_plane, ARTISTState),
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 3a7a2c957f..4a687d1b8e 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -140,10 +140,10 @@ ati_mm_read(unsigned int size, uint64_t addr, const char *name, uint64_t val) "%
 ati_mm_write(unsigned int size, uint64_t addr, const char *name, uint64_t val) "%u 0x%"PRIx64 " %s <- 0x%"PRIx64
 
 # artist.c
-artist_reg_read(unsigned int size, uint64_t addr, const char *name, uint64_t val) "%u 0x%"PRIx64 "%s -> 0x%"PRIx64
-artist_reg_write(unsigned int size, uint64_t addr, const char *name, uint64_t val) "%u 0x%"PRIx64 "%s <- 0x%"PRIx64
-artist_vram_read(unsigned int size, uint64_t addr, int posx, int posy, uint64_t val) "%u 0x%"PRIx64 " %ux%u-> 0x%"PRIx64
-artist_vram_write(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%"PRIx64 " <- 0x%"PRIx64
+artist_reg_read(unsigned int size, uint64_t addr, const char *name, uint64_t val) "%u 0x%"PRIx64 "%s -> 0x%08"PRIx64
+artist_reg_write(unsigned int size, uint64_t addr, const char *name, uint64_t val) "%u 0x%"PRIx64 "%s <- 0x%08"PRIx64
+artist_vram_read(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%08"PRIx64 " -> 0x%08"PRIx64
+artist_vram_write(unsigned int size, uint64_t addr, uint64_t val) "%u 0x%08"PRIx64 " <- 0x%08"PRIx64
 artist_fill_window(unsigned int start_x, unsigned int start_y, unsigned int width, unsigned int height, uint32_t op, uint32_t ctlpln) "start=%ux%u length=%ux%u op=0x%08x ctlpln=0x%08x"
 artist_block_move(unsigned int start_x, unsigned int start_y, unsigned int dest_x, unsigned int dest_y, unsigned int width, unsigned int height) "source %ux%u -> dest %ux%u size %ux%u"
 artist_draw_line(unsigned int start_x, unsigned int start_y, unsigned int end_x, unsigned int end_y) "%ux%u %ux%u"
-- 
2.34.1


