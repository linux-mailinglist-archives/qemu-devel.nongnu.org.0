Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658233077FF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:29:16 +0100 (CET)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58IN-0007If-4W
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l58Fr-0006EX-PP
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l58Fo-0001zv-Sy
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611843993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VJaUGgnXHpHms7hWOcxk210uXQEW13WNjg5xZQHlkI=;
 b=Q/XDqqblGLkdY4Ftw3CnXqy3/5kXEeJKL231vQgTT+bb+c5L/qic8WVNWEaRTw9n74xEzG
 9z9AZ6r0a37wDAOVDoHs9bv7ooJQN0iFH5RfLg1VDSnXjWy9/ZENRCsgQfcwa0dLHbci6n
 BQLtL6WHd9vIn40Y2RbuPGTSd6w6R/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-x-T5mllbOl6i6tipe3qh2w-1; Thu, 28 Jan 2021 09:26:31 -0500
X-MC-Unique: x-T5mllbOl6i6tipe3qh2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5086580A5C1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:26:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25BEF60C13;
 Thu, 28 Jan 2021 14:26:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6336318000B1; Thu, 28 Jan 2021 15:26:25 +0100 (CET)
Date: Thu, 28 Jan 2021 15:26:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
Message-ID: <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
 <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 04:00:20PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Jan 28, 2021 at 3:57 PM Marc-André Lureau <
> marcandre.lureau@redhat.com> wrote:
> 
> > Hi
> >
> > On Thu, Jan 28, 2021 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >>   Hi,
> >>
> >> > diff --git a/ui/spice-display.c b/ui/spice-display.c
> >> > index 0178d5766d..3d3e3bcb22 100644
> >> > --- a/ui/spice-display.c
> >> > +++ b/ui/spice-display.c
> >> > @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
> >> >          }
> >> >          qemu_spice_display_init_one(con);
> >> >      }
> >>
> >>        if (runstate_is_running()) {
> >>             qemu_spice_display_start();
> >>        }
> >>
> >> Isn't that enough?
> >>
> >
> > That should be fine too, I'll update the patch. thanks
> >
> 
> Actually no, we still need to prevent the initial
> qemu_spice_display_start(), and do a single call when everything is ready
> (since spice server doesn't handle adding interfaces dynamically when
> running).

I still think that moving these three lines to the correct place is
enough.  Maybe even just qemu_spice_display_start() as it keeps track
of the state and you can safely call this twice.

take care,
  Gerd


