Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBB589934
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:21:04 +0200 (CEST)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJW6I-00023i-Bu
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVxM-0001qh-BG
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:11:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVxK-0001n2-Lj
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jwAtQQTyhxcns3yK04pGb52N57k2XgUAgZ7OCqdZ1A0=; b=fNYnxNevJeNsmg/ab54Lrpvwfg
 2yypK5F+cYhxHsIOj6Ho5LQ9lPeBhibBBC3wiG2eRThY0EpgRvldyyVn3K3H4uU9IJIH06tAMXEak
 RKu+rqjCj5BfYsuhHw1w5ySODYGU29SRHnP/Erm12ieGEh7K9Olo7n5/rp4KXOxPwzifu7W9Wsg1G
 8sB71a6U5wrbVPW4q8RCD+EBn/wonKbV/7C7CYFLlCM+eZyv3LePlxvLUxhHPgaDaevoyblu/KM7t
 5ViShXNTvZbXPZxHdJf8Tlv/G6GngToFiKXcQeXCF4iPKJrVoZe+hTWjdwFKt4LSkZwFVHqtuK5I+
 IkeIYReAE26hf/ssmcS1Vuouf88/YnuiELd55onWFM8Lfks9P2cTDaEGgn1NQtmI/O7/vPhtxejkk
 j9Jq1u1V8vT0oyveI4ugY5Q3CqoYZSjuez4hC20o0Nvp4Rsz+ZyXJJEH9GsQ5qxBjZGLH3anJ/rZV
 5tOxbeYVZ6VVHY9lekZxmyyzgreWnQXts+Fq9vzDKjNf1Z69GycZHP+fyel0EfTnO5vv8+41b/PUw
 Pn0IPN5k4zZsihemlHyWdQ7dil0vSXgCeILiquYe91agTXW9vuGxCBbEvqCh0/vXejWDc9GKWt8MJ
 jB2v5pGR/1LdYtE2dbK6O8HPzBG+Aqe3XENu4UYEA=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVvs-0006d8-Jk; Thu, 04 Aug 2022 09:10:20 +0100
Message-ID: <ac00cbb9-e225-a7fa-ec43-d763fb985060@ilande.co.uk>
Date: Thu, 4 Aug 2022 09:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: kraxel@redhat.com
References: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
 <291cacc9-ac68-4a3e-edc0-fb226bdceaf3@ilande.co.uk>
In-Reply-To: <291cacc9-ac68-4a3e-edc0-fb226bdceaf3@ilande.co.uk>
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

On 25/07/2022 17:35, Mark Cave-Ayland wrote:

> On 25/07/2022 12:58, marcandre.lureau@redhat.com wrote:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> The display may be corrupted when changing screen colour depth in
>> qemu-system-ppc/MacOS since 7.0.
> 
> Is it worth being more specific here? Whilst MacOS with its NDRV driver exhibits the 
> issue, it's really only because MacOS has separate selections for depth and 
> resolution which allows one to be set without updating the other. I did a quick play 
> with the Forth reproducer, and even with current git master the issue goes away if 
> you also change the width/height at the same time as the depth.
> 
>> Do not short-cut qemu_console_resize() if the surface is backed by vga
>> vram. When the scanout isn't set, or it is already allocated, or opengl,
>> and the size is fitting, we still avoid the reallocation & replace path.
>>
>> Fixes: commit cb8962c1 ("ui: do not create a surface when resizing a GL scanout")
>>
>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   ui/console.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/ui/console.c b/ui/console.c
>> index e139f7115e1f..765892f84f1c 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -2575,11 +2575,13 @@ static void vc_chr_open(Chardev *chr,
>>   void qemu_console_resize(QemuConsole *s, int width, int height)
>>   {
>> -    DisplaySurface *surface;
>> +    DisplaySurface *surface = qemu_console_surface(s);
>>       assert(s->console_type == GRAPHIC_CONSOLE);
>> -    if (qemu_console_get_width(s, -1) == width &&
>> +    if ((s->scanout.kind != SCANOUT_SURFACE ||
>> +         (surface && surface->flags & QEMU_ALLOCATED_FLAG)) &&
>> +        qemu_console_get_width(s, -1) == width &&
>>           qemu_console_get_height(s, -1) == height) {
>>           return;
>>       }
> 
> The criteria listed for the short-cut in the commit message are quite handy, so is it 
> worth adding a comment along the same lines as a reminder? Or is this logic touched 
> so rarely that it isn't worthwhile?
> 
> Regardless of the above, thanks for coming up with the patch and I can confirm that 
> it fixes both the Forth reproducer and the changing of the Monitor colour depth in 
> MacOS itself:
> 
> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Hi Marc-André,

Are you planning to submit this as a fix for 7.1? I think it would certainly qualify 
as a bug fix, and would likely affect users other than just qemu-system-ppc/MacOS.


ATB,

Mark.

