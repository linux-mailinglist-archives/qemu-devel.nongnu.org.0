Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16412E02FF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 13:35:43 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMsRy-0007yK-4s
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 07:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iMsPo-0006Qg-FW
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iMsPm-0005hq-Pj
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:33:27 -0400
Received: from [2001:470:70c5:1111::170] (port=55983 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iMsPm-0005fx-8f
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=nm3JUGikEuGOk5GXmsAUJH5pvHlOmZ4g2QL+zC8LKJg=; b=Fq3mdn1GGkjLzYUxAWcyOMaotJ
 yLto1JHfJfH7vqlHvx8nWpgKpTA/X5Q725D8tPvT3JrDb7eodVesFHI7yPwJwLawWy0k4ZLb7ZT29
 AkhNpvAg3zC0V6Avn7QkamiD8+CuN9SX1xBw1Bp8FRYxuT+bxfOXVvq6nQICXvz2Z6ag=;
Received: from [2a01:4f8:121:41fa::170] (helo=stackframe.org)
 by smtp.eurescom.eu with esmtpa (Exim 4.86_2)
 (envelope-from <svens@stackframe.org>)
 id 1iMsPc-0002rq-Ow; Tue, 22 Oct 2019 13:33:16 +0200
Date: Tue, 22 Oct 2019 13:33:16 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 3/6] ps2: accept 'Set Key Make and Break' commands
Message-ID: <20191022113316.GA8194@stackframe.org>
References: <20191022055415.18122-1-svens@stackframe.org>
 <20191022055415.18122-4-svens@stackframe.org>
 <666cd652-ffb3-8615-1cf0-1310967a9e56@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <666cd652-ffb3-8615-1cf0-1310967a9e56@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Tue, Oct 22, 2019 at 11:50:14AM +0200, Philippe Mathieu-Daudé wrote:
> On 10/22/19 7:54 AM, Sven Schnelle wrote:
> > HP-UX sends both the 'Set key make and break (0xfc) and
> > 'Set all key typematic make and break' (0xfa). QEMU response
> > with 'Resend' as it doesn't handle these commands. HP-UX than
> > reports an PS/2 max retransmission exceeded error. Add these
> > commands and just reply with ACK.
> > 
> > Signed-off-by: Sven Schnelle <svens@stackframe.org>
> > ---
> >   hw/input/ps2.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> > index 67f92f6112..6c2c7066a6 100644
> > --- a/hw/input/ps2.c
> > +++ b/hw/input/ps2.c
> > @@ -49,6 +49,8 @@
> >   #define KBD_CMD_RESET_DISABLE	0xF5	/* reset and disable scanning */
> >   #define KBD_CMD_RESET_ENABLE   	0xF6    /* reset and enable scanning */
> >   #define KBD_CMD_RESET		0xFF	/* Reset */
> > +#define KBD_CMD_SET_MAKE_BREAK  0xFC    /* Set Make and Break mode */
> > +#define KBD_CMD_SET_TYPEMATIC   0xFA    /* Set Typematic Make and Break mode */
> >   /* Keyboard Replies */
> >   #define KBD_REPLY_POR		0xAA	/* Power on reset */
> > @@ -592,6 +594,10 @@ void ps2_write_keyboard(void *opaque, int val)
> >                   KBD_REPLY_ACK,
> >                   KBD_REPLY_POR);
> >               break;
> > +        case KBD_CMD_SET_TYPEMATIC:
> > +        case KBD_CMD_SET_MAKE_BREAK:
> 
> Shouldn't we reset the write state machine too? I'm not sure.
> 
>                s->common.write_cmd = -1;

Looking at this again i think the KBD_CMD_SET_TYPEMATIC case needs to
assign common.write_cmd to properly handle the addtional data byte. For
KBD_CMD_SET_MAKE_BREAK i think that's not neccessary. I'll fix that up.
> 
> > +            ps2_queue(&s->common, KBD_REPLY_ACK);
> > +            break;
> >           default:
> >               ps2_queue(&s->common, KBD_REPLY_RESEND);
> >               break;
> > 
> 

Thanks
Sven

