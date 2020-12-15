Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615572DA900
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:10:18 +0100 (CET)
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5PV-0005Jv-EV
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5Mj-0003ee-KA
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5Mh-0000GY-Oh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608019643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GM4W1mldIq4VxTTps8aXNChG3rHRZ95TZjVyfTIawLo=;
 b=IfDBUdt6tXXgqaW5xOtzVgRad2vWbmCGoo+kF/3+bysbYFus513x6RsQCAe50r4ijtV4P5
 TODBT2YPya5Cl76ZbCCEY1kMP9VwZhf17V5/5xk+9NwT+hB4dHdLdC6si9rp4mHstinXaX
 NCPi0VMw2tHpgkwu6cbY3YEWUcL0q/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-kX6HCkDONfaZRbzkiYLjLg-1; Tue, 15 Dec 2020 03:07:21 -0500
X-MC-Unique: kX6HCkDONfaZRbzkiYLjLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67DA315720;
 Tue, 15 Dec 2020 08:07:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DCFB100239A;
 Tue, 15 Dec 2020 08:07:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1FCD411AB8; Tue, 15 Dec 2020 09:07:19 +0100 (CET)
Date: Tue, 15 Dec 2020 09:07:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dann frazier <dann.frazier@canonical.com>
Subject: Re: [PATCH 1/2] audio: remove qemu_spice_audio_init()
Message-ID: <20201215080719.qnr2lgoi3l5iaogq@sirius.home.kraxel.org>
References: <20200916084117.21828-1-kraxel@redhat.com>
 <20200916084117.21828-2-kraxel@redhat.com>
 <CALdTtnsBpZ1fyB=dJMdO7Oq=swHw5AsmZxVru_tf6iZZouC=5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALdTtnsBpZ1fyB=dJMdO7Oq=swHw5AsmZxVru_tf6iZZouC=5g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +    if (using_spice) {
> > +        /*
> > +         * When using spice allow the spice audio driver being picked
> > +         * as default.
> > +         *
> > +         * Temporary hack.  Using audio devices without explicit
> > +         * audiodev= property is already deprecated.  Same goes for
> > +         * the -soundhw switch.  Once this support gets finally
> > +         * removed we can also drop the concept of a default audio
> > +         * backend and this can go away.
> > +         */
> > +        driver = audio_driver_lookup("spice");
> > +        driver->can_be_default = 1;
> 
> fyi, one of my libvirt/QEMU guests now segfaults here.
> See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977301

Hmm, surely doesn't hurt to add a "if (driver)" check here.

I'm wondering though how you end up with spice being enabled
but spiceaudio driver not being available.  There is no separate
config switch so you should have both spice + spiceaudio or
none of them ...

take care,
  Gerd


