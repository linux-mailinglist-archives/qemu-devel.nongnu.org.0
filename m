Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A0533D05D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:12:27 +0100 (CET)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5kY-0007Gg-OV
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lM5jj-0006jG-I8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lM5jf-0000Zn-Gf
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615885890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2felV3ASRIQ4vl9jYFVNQ1nY5IVH5ae8mpW6gLYN15c=;
 b=FoXIojvokeECqu8pOURT0Y/ayEl5AfrzjhDZ51dIwFCbmhu+/Q7f79JVKDioHky4lLIcHu
 WzCrNS+T7567PoWAfRZ1Qyg2wl5rxKaRPS/djG3vsM/x/mHJyvqCY8H8gAVGvJDYxu7DGj
 iq5J9ifR5BWYB9rvpKFX95XSF/1APnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-Wumm6JAyPWuQeecUlRLi9w-1; Tue, 16 Mar 2021 05:11:28 -0400
X-MC-Unique: Wumm6JAyPWuQeecUlRLi9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9B3D1017DC6;
 Tue, 16 Mar 2021 09:11:27 +0000 (UTC)
Received: from work-vm (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 133AA102AE7E;
 Tue, 16 Mar 2021 09:11:20 +0000 (UTC)
Date: Tue, 16 Mar 2021 09:11:18 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] hw/i8254: fix vmstate load
Message-ID: <YFB2NpVXD9+sb+Xv@work-vm>
References: <161537170060.6654.9430112746749476215.stgit@pasha-ThinkPad-X280>
 <YE+//ZRlFBwNjb0b@work-vm>
 <ecfc942c-09c5-37b8-56f5-b38069b96664@ispras.ru>
MIME-Version: 1.0
In-Reply-To: <ecfc942c-09c5-37b8-56f5-b38069b96664@ispras.ru>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Pavel Dovgalyuk (pavel.dovgalyuk@ispras.ru) wrote:
> On 15.03.2021 23:13, Dr. David Alan Gilbert wrote:
> > * Pavel Dovgalyuk (pavel.dovgalyuk@ispras.ru) wrote:
> > > QEMU timer of channel 0 in i8254 is used to raise irq
> > > at the specified moment of time. This irq can be disabled
> > > with irq_disabled flag. But when vmstate of the pit is
> > > loaded, timer may be rearmed despite the disabled interrupts.
> > > This patch adds irq_disabled flag check to fix that.
> > > 
> > > Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> > 
> > Hi Pavel,
> >    I'm curious, did you see this cause a problem on a particular guest
> > OS?
> 
> That was Windows 7 on i386.
> I found this when tested reverse debugging.

Thanks; I like to know of migration fixes for when someone comes asking
why something obscure breaks under migration :-)

Dave

> > 
> > Dave
> > 
> > > ---
> > >   hw/timer/i8254.c |    2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
> > > index c01ee2c72a..c8388ea432 100644
> > > --- a/hw/timer/i8254.c
> > > +++ b/hw/timer/i8254.c
> > > @@ -324,7 +324,7 @@ static void pit_post_load(PITCommonState *s)
> > >   {
> > >       PITChannelState *sc = &s->channels[0];
> > > -    if (sc->next_transition_time != -1) {
> > > +    if (sc->next_transition_time != -1 && !sc->irq_disabled) {
> > >           timer_mod(sc->irq_timer, sc->next_transition_time);
> > >       } else {
> > >           timer_del(sc->irq_timer);
> > > 
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


