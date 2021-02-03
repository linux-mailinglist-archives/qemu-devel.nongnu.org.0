Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC8630D67E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 10:42:29 +0100 (CET)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Eg7-0007l1-Lh
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 04:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7Een-0007Kq-QT
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7Eek-0003Ra-4A
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612345260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PZoVGupou/0McUGq20s+SegjO+QFKSXKMWq9fG9qBBY=;
 b=Fv1WL6fkpl3OwNsoNx4M2KeEgN6CVCUa1M1fx2wRhcTizC9tQT8EJ+y1k21W//RWRzvc9b
 exTEq4NFFzm0En7pjMLEwN5IHrLVaPG9ZnX1bGMWjDZfR1NLmgCtj/pp3YJdvwBbStqq7c
 K9Bv6wyvCmg70m8g+1oWAk2oQRp3ieo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Bb0W0E0qNP2BzLbJGEGvlQ-1; Wed, 03 Feb 2021 04:40:58 -0500
X-MC-Unique: Bb0W0E0qNP2BzLbJGEGvlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A349107ACF8;
 Wed,  3 Feb 2021 09:40:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46BB9100AE2C;
 Wed,  3 Feb 2021 09:40:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AFFD9180063E; Wed,  3 Feb 2021 10:40:51 +0100 (CET)
Date: Wed, 3 Feb 2021 10:40:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210203094051.tje6ef47hqzqxhha@sirius.home.kraxel.org>
References: <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
 <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
 <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
 <20210202123829.GF4168502@redhat.com>
 <20210202133534.u364ubxxvr5xyieb@sirius.home.kraxel.org>
 <20210202163656.hpg4nbfvqbqnjsdm@sirius.home.kraxel.org>
 <CAJ+F1CK_AmHD75oYNABBzMs1rkHD7zvj42TOKwnKf=NtvfpEsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CK_AmHD75oYNABBzMs1rkHD7zvj42TOKwnKf=NtvfpEsA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Christophe de Dinechin <cdupontd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Well, spice isn't that much better.  Has a short, fixed list too:
> >
> > VD_AGENT_CLIPBOARD_UTF8_TEXT

> There has been some attempts to support generic mime types in Spice clipboard:
> https://lists.freedesktop.org/archives/spice-devel/2018-May/043782.html
> 
> (If I am not mistaken, I think it was inspired on some earlier attempt
> I worked on I lost trace)
> 
> In any case, it seems there is just not enough interest for other
> things beside the existing Spice clipboard types.

I guess "text/plain; charset=utf-8" covers 95% of the use cases.

Personally I *very* rarely cut+paste anything beside plan text,
and in case it is formated text it typically is something like
markdown ;)

> Interoperability
> between OSes quickly becomes problematic for more advanced types, I am
> afraid. (and various OS-specific clipboard & dnd details may raise)

That too.

I'll guess I start with text only, but of course keep the door open to
add more later on.  So I need some way to specify the type(s).  Obvious
choices are fixed list (like vnc/spice) or mime.  The later is more
flexible and future-proof of course, but I'm not sure we'll actually
need that in practice ...

take care,
  Gerd


