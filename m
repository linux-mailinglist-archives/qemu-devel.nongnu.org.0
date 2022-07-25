Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81F55802E7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 18:40:02 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG17g-0003kw-TK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 12:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oG13x-0001Zt-CC
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:36:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oG13v-0007uJ-4j
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4zO3wKD/4JuH0Zkv/SYpeqBfOU1MVLuMO/p+fP3sVZE=; b=dRXYmitFNCM3Wq0w/veU/7MsBS
 aLZX41TJ01sU2HXqQdE7qVQst2j2qAYm8DzgTzJqo9lzYwEZ6a2rcaQz78mrqRzBdi9d99i8YOg69
 0Mem0fv2bjxKqCEw3e/BZAy0rHUj4mOUlqusBjCFyP64Rt1F0zUSjlgUv1rvTzxj9mbnnYLgatDT4
 CUkpeG3ZlOuJf0Cdc9RkIsjGYaw35Bpa8Ui6tJ8JkEhMHoD/ZWVmQHfaQe1YRLpmCfMY3cWXieqyi
 3DljkkUKa71FkrKTMxWpktq6uphGZpwFYua489oxdgFQWyuLYxKetL1Lm1zL1xdmRSw2Ace3T6KER
 rmDs/gkpqwHosraH8DOQTg/PRLJ4Y+6PfqSVl9gmWMkFgOup2aHq0pcoxeKBTniAKN7BoOLUUZ89Z
 dLNthI8o+vVP7MjxepdKy1tCkP5jwxfG8hXym1M49K9sxVzkvneJbL9dy5/Gti9spW7MrCi7pV1dl
 8F34yRgSr8r9U9zkJ7gqMjyr86JlW13DYz5Ep2aMpD3t/R+D9iyRhQGKLz9NLETzYVxA0u5jAMKxg
 YkmO4yYpvpd0Jff1iUj9hPjwze3vitLWqL1fNSzrKouFvjb6t8opFFvJDAWVTThxLECnwmlW/Ofiw
 DC8VfctCGWjHkeKElsn4G4t5XQgYtFzHhnSdw+XXU=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oG12U-0008bq-F0; Mon, 25 Jul 2022 17:34:42 +0100
Message-ID: <291cacc9-ac68-4a3e-edc0-fb226bdceaf3@ilande.co.uk>
Date: Mon, 25 Jul 2022 17:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: kraxel@redhat.com
References: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] ui/console: fix qemu_console_resize() regression
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 25/07/2022 12:58, marcandre.lureau@redhat.com wrote:

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The display may be corrupted when changing screen colour depth in
> qemu-system-ppc/MacOS since 7.0.

Is it worth being more specific here? Whilst MacOS with its NDRV driver exhibits the 
issue, it's really only because MacOS has separate selections for depth and 
resolution which allows one to be set without updating the other. I did a quick play 
with the Forth reproducer, and even with current git master the issue goes away if 
you also change the width/height at the same time as the depth.

> Do not short-cut qemu_console_resize() if the surface is backed by vga
> vram. When the scanout isn't set, or it is already allocated, or opengl,
> and the size is fitting, we still avoid the reallocation & replace path.
> 
> Fixes: commit cb8962c1 ("ui: do not create a surface when resizing a GL scanout")
> 
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index e139f7115e1f..765892f84f1c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -2575,11 +2575,13 @@ static void vc_chr_open(Chardev *chr,
>   
>   void qemu_console_resize(QemuConsole *s, int width, int height)
>   {
> -    DisplaySurface *surface;
> +    DisplaySurface *surface = qemu_console_surface(s);
>   
>       assert(s->console_type == GRAPHIC_CONSOLE);
>   
> -    if (qemu_console_get_width(s, -1) == width &&
> +    if ((s->scanout.kind != SCANOUT_SURFACE ||
> +         (surface && surface->flags & QEMU_ALLOCATED_FLAG)) &&
> +        qemu_console_get_width(s, -1) == width &&
>           qemu_console_get_height(s, -1) == height) {
>           return;
>       }

The criteria listed for the short-cut in the commit message are quite handy, so is it 
worth adding a comment along the same lines as a reminder? Or is this logic touched 
so rarely that it isn't worthwhile?

Regardless of the above, thanks for coming up with the patch and I can confirm that 
it fixes both the Forth reproducer and the changing of the Monitor colour depth in 
MacOS itself:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

