Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C975923C1C7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 00:03:25 +0200 (CEST)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k351o-0001fz-8U
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 18:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1k3510-0001HL-14
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 18:02:34 -0400
Received: from relay64.bu.edu ([128.197.228.104]:41083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1k350x-0007g2-LN
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 18:02:33 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 074M1jAY016450
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 4 Aug 2020 18:01:48 -0400
Date: Tue, 4 Aug 2020 18:01:45 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 7/8] hw/display/artist: Refactor artist_rop8() to
 avoid buffer over-run
Message-ID: <20200804220145.yjq265pk363466hx@mozz.bu.edu>
References: <20200804140056.7690-1-deller@gmx.de>
 <20200804140056.7690-8-deller@gmx.de>
 <20200804163954.4dzistybjwby7pzx@mozz.bu.edu>
 <20200804212019.GA876@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804212019.GA876@ls3530.fritz.box>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 18:02:29
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200804 2320, Helge Deller wrote:
> Hi Alexander,
> 
> * Alexander Bulekov <alxndr@bu.edu>:
> > I applied this series and it fixes most of the problems I saw before.
> > I still see a few crashes - I made issues for them on launchpad:
> > https://bugs.launchpad.net/qemu/+bug/1890310
> > https://bugs.launchpad.net/qemu/+bug/1890311

> > https://bugs.launchpad.net/qemu/+bug/1890312
Hi Helge, I can still reproduce this one  ^^^
I'll fuzz it some more, but so far I am not finding anything else.
Thanks!
-Alex

> 
> Thanks for testing!
> Below is the updated patch which fixes all of the issues you reported so
> far. Can you please test again?
> If you like you can pull all changes from
> https://github.com/hdeller/qemu-hppa/commits/target-hppa
> 
> Thanks!
> Helge
> 
> ---------------
> 
> From ee31d3aa9dd91cde3a4df8fce97239a0ff26f7cc Mon Sep 17 00:00:00 2001
> From: Helge Deller <deller@gmx.de>
> Date: Tue, 4 Aug 2020 15:35:38 +0200
> Subject: [PATCH] hw/display/artist: Prevent out of VRAM buffer accesses
> 
> Simplify bounds checks by changing some parameters like row or column
> numbers to become unsigned instead of signed.
> With that we can check if the calculated offset is bigger than the size
> of the VRAM region and bail out if not.
> 
> Reported-by: LLVM libFuzzer
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1880326
> Buglink: https://bugs.launchpad.net/qemu/+bug/1890310
> Buglink: https://bugs.launchpad.net/qemu/+bug/1890311
> Buglink: https://bugs.launchpad.net/qemu/+bug/1890312
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 47de17b9e9..66a230bbd5 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -35,9 +35,9 @@
>  struct vram_buffer {
>      MemoryRegion mr;
>      uint8_t *data;
> -    int size;
> -    int width;
> -    int height;
> +    unsigned int size;
> +    unsigned int width;
> +    unsigned int height;
>  };
> 
>  typedef struct ARTISTState {
> @@ -203,14 +203,18 @@ static int16_t artist_get_y(uint32_t reg)
>  }
> 
>  static void artist_invalidate_lines(struct vram_buffer *buf,
> -                                    int starty, int height)
> +                                    unsigned int starty, unsigned int height)
>  {
> -    int start = starty * buf->width;
> -    int size = height * buf->width;
> +    unsigned int start, size;
> 
> -    if (start + size <= buf->size) {
> -        memory_region_set_dirty(&buf->mr, start, size);
> +    if (starty >= buf->height) {
> +        return;
>      }
> +
> +    start = starty * buf->width;
> +    size = MIN(height * buf->width, buf->size - start);
> +
> +    memory_region_set_dirty(&buf->mr, start, size);
>  }
> 
>  static int vram_write_pix_per_transfer(ARTISTState *s)
> @@ -274,15 +278,15 @@ static artist_rop_t artist_get_op(ARTISTState *s)
>  }
> 
>  static void artist_rop8(ARTISTState *s, struct vram_buffer *buf,
> -                        int offset, uint8_t val)
> +                        unsigned int offset, uint8_t val)
>  {
>      const artist_rop_t op = artist_get_op(s);
>      uint8_t plane_mask;
>      uint8_t *dst;
> 
> -    if (offset < 0 || offset >= buf->size) {
> +    if (offset >= buf->size) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "rop8 offset:%d bufsize:%u\n", offset, buf->size);
> +                      "rop8 offset:%u bufsize:%u\n", offset, buf->size);
>          return;
>      }
>      dst = buf->data + offset;
> @@ -294,8 +298,7 @@ static void artist_rop8(ARTISTState *s, struct vram_buffer *buf,
>          break;
> 
>      case ARTIST_ROP_COPY:
> -        *dst &= ~plane_mask;
> -        *dst |= val & plane_mask;
> +        *dst = (*dst & ~plane_mask) | (val & plane_mask);
>          break;
> 
>      case ARTIST_ROP_XOR:
> @@ -349,7 +352,8 @@ static void vram_bit_write(ARTISTState *s, int posx, int posy, bool incr_x,
>  {
>      struct vram_buffer *buf;
>      uint32_t vram_bitmask = s->vram_bitmask;
> -    int mask, i, pix_count, pix_length, offset, width;
> +    int mask, i, pix_count, pix_length;
> +    unsigned int offset, width;
>      uint8_t *data8, *p;
> 
>      pix_count = vram_write_pix_per_transfer(s);
> @@ -394,7 +398,9 @@ static void vram_bit_write(ARTISTState *s, int posx, int posy, bool incr_x,
> 
>      case 3:
>          if (s->cmap_bm_access) {
> -            *(uint32_t *)(p + offset) = data;
> +            if (offset + 3 < buf->size) {
> +                *(uint32_t *)(p + offset) = data;
> +            }
>              break;
>          }
>          data8 = (uint8_t *)&data;
> @@ -464,12 +470,14 @@ static void vram_bit_write(ARTISTState *s, int posx, int posy, bool incr_x,
>      }
>  }
> 
> -static void block_move(ARTISTState *s, int source_x, int source_y, int dest_x,
> -                       int dest_y, int width, int height)
> +static void block_move(ARTISTState *s,
> +                       unsigned int source_x, unsigned int source_y,
> +                       unsigned int dest_x,   unsigned int dest_y,
> +                       unsigned int width,    unsigned int height)
>  {
>      struct vram_buffer *buf;
>      int line, endline, lineincr, startcolumn, endcolumn, columnincr, column;
> -    uint32_t dst, src;
> +    unsigned int dst, src;
> 
>      trace_artist_block_move(source_x, source_y, dest_x, dest_y, width, height);
> 
> @@ -481,6 +489,12 @@ static void block_move(ARTISTState *s, int source_x, int source_y, int dest_x,
>      }
> 
>      buf = &s->vram_buffer[ARTIST_BUFFER_AP];
> +    if (height > buf->height) {
> +        height = buf->height;
> +    }
> +    if (width > buf->width) {
> +        width = buf->width;
> +    }
> 
>      if (dest_y > source_y) {
>          /* move down */
> @@ -507,24 +521,27 @@ static void block_move(ARTISTState *s, int source_x, int source_y, int dest_x,
>      }
> 
>      for ( ; line != endline; line += lineincr) {
> -        src = source_x + ((line + source_y) * buf->width);
> -        dst = dest_x + ((line + dest_y) * buf->width);
> +        src = source_x + ((line + source_y) * buf->width) + startcolumn;
> +        dst = dest_x + ((line + dest_y) * buf->width) + startcolumn;
> 
>          for (column = startcolumn; column != endcolumn; column += columnincr) {
> -            if (dst + column > buf->size || src + column > buf->size) {
> +            if (dst >= buf->size || src >= buf->size) {
>                  continue;
>              }
> -            artist_rop8(s, buf, dst + column, buf->data[src + column]);
> +            artist_rop8(s, buf, dst, buf->data[src]);
> +            src += columnincr;
> +            dst += columnincr;
>          }
>      }
> 
>      artist_invalidate_lines(buf, dest_y, height);
>  }
> 
> -static void fill_window(ARTISTState *s, int startx, int starty,
> -                        int width, int height)
> +static void fill_window(ARTISTState *s,
> +                        unsigned int startx, unsigned int starty,
> +                        unsigned int width,  unsigned int height)
>  {
> -    uint32_t offset;
> +    unsigned int offset;
>      uint8_t color = artist_get_color(s);
>      struct vram_buffer *buf;
>      int x, y;
> @@ -561,7 +578,9 @@ static void fill_window(ARTISTState *s, int startx, int starty,
>      artist_invalidate_lines(buf, starty, height);
>  }
> 
> -static void draw_line(ARTISTState *s, int x1, int y1, int x2, int y2,
> +static void draw_line(ARTISTState *s,
> +                      unsigned int x1, unsigned int y1,
> +                      unsigned int x2, unsigned int y2,
>                        bool update_start, int skip_pix, int max_pix)
>  {
>      struct vram_buffer *buf = &s->vram_buffer[ARTIST_BUFFER_AP];
> @@ -636,7 +655,7 @@ static void draw_line(ARTISTState *s, int x1, int y1, int x2, int y2,
>      color = artist_get_color(s);
> 
>      do {
> -        int ofs;
> +        unsigned int ofs;
> 
>          if (c1) {
>              ofs = x * s->width + y;
> @@ -768,13 +787,13 @@ static void font_write16(ARTISTState *s, uint16_t val)
>      uint16_t mask;
>      int i;
> 
> -    int startx = artist_get_x(s->vram_start);
> -    int starty = artist_get_y(s->vram_start) + s->font_write_pos_y;
> -    int offset = starty * s->width + startx;
> +    unsigned int startx = artist_get_x(s->vram_start);
> +    unsigned int starty = artist_get_y(s->vram_start) + s->font_write_pos_y;
> +    unsigned int offset = starty * s->width + startx;
> 
>      buf = &s->vram_buffer[ARTIST_BUFFER_AP];
> 
> -    if (offset + 16 > buf->size) {
> +    if (offset + 16 >= buf->size) {
>          return;
>      }
> 
> @@ -1138,7 +1157,7 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
>      struct vram_buffer *buf;
>      int posy = (addr >> 11) & 0x3ff;
>      int posx = addr & 0x7ff;
> -    uint32_t offset;
> +    unsigned int offset;
>      trace_artist_vram_write(size, addr, val);
> 
>      if (s->cmap_bm_access) {
> @@ -1161,16 +1180,22 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
>      offset = posy * buf->width + posx;
>      switch (size) {
>      case 4:
> -        *(uint32_t *)(buf->data + offset) = be32_to_cpu(val);
> -        memory_region_set_dirty(&buf->mr, offset, 4);
> +        if (offset + 3 < buf->size) {
> +            *(uint32_t *)(buf->data + offset) = be32_to_cpu(val);
> +            memory_region_set_dirty(&buf->mr, offset, 4);
> +        }
>          break;
>      case 2:
> -        *(uint16_t *)(buf->data + offset) = be16_to_cpu(val);
> -        memory_region_set_dirty(&buf->mr, offset, 2);
> +        if (offset + 1 < buf->size) {
> +            *(uint16_t *)(buf->data + offset) = be16_to_cpu(val);
> +            memory_region_set_dirty(&buf->mr, offset, 2);
> +        }
>          break;
>      case 1:
> -        *(uint8_t *)(buf->data + offset) = val;
> -        memory_region_set_dirty(&buf->mr, offset, 1);
> +        if (offset < buf->size) {
> +            *(uint8_t *)(buf->data + offset) = val;
> +            memory_region_set_dirty(&buf->mr, offset, 1);
> +        }
>          break;
>      default:
>          break;

