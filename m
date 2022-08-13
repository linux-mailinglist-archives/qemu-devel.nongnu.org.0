Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5001959192C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 09:15:24 +0200 (CEST)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMlMg-0003Xi-RE
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 03:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oMlK5-0002A0-Li
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 03:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oMlK1-0000PQ-97
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 03:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660374756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0kexh3lUIoW0ZkK94UhuMM0KlxIbuM0ErBXzbH4frLg=;
 b=hxsnfk2V3tMl7afLWr5bpVrkXU2Hx+U/GFxZfVh1Y7lUU6DvYfO5V+V1yE7t/FZ15YGOzp
 6bUC+bOWh6lbR1Y8BekdW/rZTxXo4WtAEDhpOf+12RWYV85ZwFKQGGGvgTvRgaCWn+N8PJ
 3iPbOW7CkLIEaeWUUmix4WmBjbCmXms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-ZkZaW27bO4uL4IndtMraOQ-1; Sat, 13 Aug 2022 03:12:34 -0400
X-MC-Unique: ZkZaW27bO4uL4IndtMraOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25A41185A7A4;
 Sat, 13 Aug 2022 07:12:34 +0000 (UTC)
Received: from localhost (unknown [10.40.192.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1BA01415133;
 Sat, 13 Aug 2022 07:12:33 +0000 (UTC)
Date: Sat, 13 Aug 2022 09:12:32 +0200
From: Victor Toso <victortoso@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] usbredir: avoid queuing hello packet on snapshot
 restore
Message-ID: <20220813071232.yp5amiwukfirz5bv@tapioca>
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-4-j@getutm.app>
 <20220813052956.vnnvukb5xt7f4p6i@tapioca>
 <CA+E+eSAzY6ZVJ-1qqTRs9a-Z5OaxGyhs1R8Jj0H21d2jyo5JPQ@mail.gmail.com>
 <20220813055033.tzdummia7c3igzgm@tapioca>
 <CA+E+eSBYcDPncJsqZp+U735qM+hEKb9PjhnqLiquDjJfw425eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+E+eSBYcDPncJsqZp+U735qM+hEKb9PjhnqLiquDjJfw425eA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

On Fri, Aug 12, 2022 at 10:57:08PM -0700, Joelle van Dyne wrote:
> On Fri, Aug 12, 2022 at 10:50 PM Victor Toso <victortoso@redhat.com> wrote:
> >
> > Hi,
> >
> > On Fri, Aug 12, 2022 at 10:33:54PM -0700, Joelle van Dyne wrote:
> > > On Fri, Aug 12, 2022 at 10:30 PM Victor Toso <victortoso@redhat.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Fri, Aug 12, 2022 at 06:10:31PM -0700, Joelle van Dyne wrote:
> > > > > When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
> > > > > setting up the hello packet (just as with "-incoming". On the latest version
> > > > > of libusbredir, usbredirparser_unserialize() will return error if the parser
> > > > > is not "pristine."
> > > >
> > > > That was wrong in the usbredir side. The fix [0] was merged and
> > > > included in the latest 0.13.0 release
> > >
> > > This is good to know. Should the entire runstate_check in
> > > usbredir_create_parser be removed?
> >
> > From my POV your patch looks correct and would avoid migration
> > issues such as [1] with usbredir 0.12.0 that was not patched
> >
> > [1] https://bugzilla.redhat.com/show_bug.cgi?id=2096008
> >
> > So, I'd keep the check and the patch :)
>
> I have to admit I'm not too familiar with the inner workings of
> libusbredir. But is it desirable to skip the HELLO packet on
> "loadvm"?

The hello package is to used for capabilities negotiation and
then stablish a new connection.

> I wrote this on the assumption that it's correct because
> libusbredir enforces it, but if that's wrong, then I'm
> wondering if maybe we need the HELLO to re-establish
> communication (that was the issue I triaged with "-S", when USB
> devices did not work due to the HELLO packet not being sent).

> In a migration, it makes sense that a SPICE client has not
> reset the USB device. However, when re-starting QEMU with
> "-loadvm", it's possible the USB device has been disconnected
> and reconnected.

Yes, or it could be holding the device to reestablish the
connection with the VM. Depends a bit on the backend? I'm not
100% sure.

If user was using a TCP backend and connecting to usbredirserver
(or usbredirect running as a TCP server with --as) then I assume
that QEMU would try to reconnect and keep going like migration.

> Ideally, we report that to the guest and let it handle the
> reset. Would "usbredirparser_fl_no_hello" prevent that?

usbredirparser_fl_no_hello is mainly meant for unserialization
but it can also be used for the application to send/handle its
own hello package too (used for emulated usb devices in
spice-gtk [2]).

All in all, if the device is no longer available on loadvm(), at
the point the VM is restarted, the guest should be notified
similarly to when the device is being unplugged.

[2] https://gitlab.freedesktop.org/spice/spice-gtk/-/commit/78c5a2e93383bd21a121

> > > > [0] https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/61
> > > >
> > > > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > > > > ---
> > > > >  hw/usb/redirect.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> > > > > index fd7df599bc..47fac3895a 100644
> > > > > --- a/hw/usb/redirect.c
> > > > > +++ b/hw/usb/redirect.c
> > > > > @@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
> > > > >      }
> > > > >  #endif
> > > > >
> > > > > -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> > > > > +    if (runstate_check(RUN_STATE_INMIGRATE) ||
> > > > > +        runstate_check(RUN_STATE_RESTORE_VM)) {
> > > > >          flags |= usbredirparser_fl_no_hello;
> > > > >      }
> > > > >      usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
> > > > > --
> > > > > 2.28.0
> > > > >

Cheers,
Victor


