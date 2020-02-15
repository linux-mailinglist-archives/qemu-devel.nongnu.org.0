Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47415FDC9
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Feb 2020 10:16:56 +0100 (CET)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2tZH-0003LX-2D
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 04:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1j2tUm-0004rc-1W
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 04:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1j2tUk-0008BU-Pv
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 04:12:15 -0500
Received: from propper.duncanthrax.net ([91.207.61.48]:53408
 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1j2tUk-0008Aj-Hh
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 04:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sHvhCwT0StAVImD/hs2Z2QmgVtLilf4odC2Npk5QXus=; b=AevnyzmWDu9qClqqIRj9tDl5Wk
 QkJ/Q8VoRdgxmHJEM7kyyYCrVEQORVYJrQ62HYTq+/JvTG1PQ9NwXlLh4knIRiKDgssYSpJPpw21a
 BrcFPpu+0a/q8vye1PnAeWvwzoOBtlmZxlNi9A8m+Q0hlu8CFHlJdmWqBksm9gCuTHX0=;
Received: from [134.3.47.90] (helo=t470p.stackframe.org)
 by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>)
 id 1j2tUh-0003qK-JZ; Sat, 15 Feb 2020 10:12:11 +0100
Date: Sat, 15 Feb 2020 10:12:11 +0100
From: Sven Schnelle <svens@stackframe.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] hw/display/artist: Delay some variables initialization
Message-ID: <20200215091211.GB18657@t470p.stackframe.org>
References: <20200214001303.12873-1-f4bug@amsat.org>
 <20200214001303.12873-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200214001303.12873-4-f4bug@amsat.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.207.61.48
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
Cc: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 14, 2020 at 01:13:00AM +0100, Philippe Mathieu-Daud� wrote:
> We want to have an early exit path. Delay some initializations
> before the variables are used.
> 
> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>
> ---
>  hw/display/artist.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 47f0e9f0bc..97c811b35e 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -557,90 +557,90 @@ static void fill_window(ARTISTState *s, int startx, int starty,
>  static void draw_line(ARTISTState *s, int x1, int y1, int x2, int y2,
>                        bool update_start, int skip_pix, int max_pix)
>  {
>      struct vram_buffer *buf;
> -    uint8_t color = artist_get_color(s);
> +    uint8_t color;
>      int dx, dy, t, e, x, y, incy, diago, horiz;
>      bool c1;
>      uint8_t *p;
>  
>      trace_artist_draw_line(x1, y1, x2, y2);
>  
>      if (update_start) {
>          s->vram_start = (x2 << 16) | y2;
>      }
>  
> -    buf = &s->vram_buffer[ARTIST_BUFFER_AP];
> -
> -    c1 = false;
> -
>      if (x2 > x1) {
>          dx = x2 - x1;
>      } else {
>          dx = x1 - x2;
>      }
>      if (y2 > y1) {
>          dy = y2 - y1;
>      } else {
>          dy = y1 - y2;
>      }
> +
> +    c1 = false;
>      if (dy > dx) {
>          t = y2;
>          y2 = x2;
>          x2 = t;
>  
>          t = y1;
>          y1 = x1;
>          x1 = t;
>  
>          t = dx;
>          dx = dy;
>          dy = t;
>  
>          c1 = true;
>      }
>  
>      if (x1 > x2) {
>          t = y2;
>          y2 = y1;
>          y1 = t;
>  
>          t = x1;
>          x1 = x2;
>          x2 = t;
>      }
>  
>      horiz = dy << 1;
>      diago = (dy - dx) << 1;
>      e = (dy << 1) - dx;
>  
>      if (y1 <= y2) {
>          incy = 1;
>      } else {
>          incy = -1;
>      }
>      x = x1;
>      y = y1;
> +    color = artist_get_color(s);
> +    buf = &s->vram_buffer[ARTIST_BUFFER_AP];
>  
>      do {
>          if (c1) {
>              p = buf->data + x * s->width + y;
>          } else {
>              p = buf->data + y * s->width + x;
>          }
>  
>          if (skip_pix > 0) {
>              skip_pix--;
>          } else {
>              artist_rop8(s, p, color);
>          }
>  
>          if (e > 0) {
>              artist_invalidate_lines(buf, y, 1);
>              y  += incy;
>              e  += diago;
>          } else {
>              e += horiz;
>          }
>          x++;
>      } while (x <= x2 && (max_pix == -1 || --max_pix > 0));
>  }
> -- 
> 2.21.1
> 

Acked-by: Sven Schnelle <svens@stackframe.org>

