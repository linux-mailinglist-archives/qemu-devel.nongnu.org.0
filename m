Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989D3FD94B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:14:50 +0200 (CEST)
Received: from localhost ([::1]:59348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP8j-0002qi-Am
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLOtU-0005ir-FV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:59:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLOtS-0007H7-Pa
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630497541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=g2+hQG48LnDciF0OwAYCO5GZ1qqtKbE7QWGLX6GqLg8=;
 b=g5SOx4WA1uG31EqJjfk5DfVJESZyXlBr7ijQmG88LPXMcEaMqWHd/HgUuuVnv1pRKhVmiO
 eJMTkdYpMZY08C81w6qLVWx/TJd/eBaRbmxePpFBCU3UluyOOY4s67F5/itpotR/SrECsi
 y1E/Y1Rox5Rd6ooK7mOMGeWryDH/rQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-xJ18YXO5ObW8K7FN10Ng4A-1; Wed, 01 Sep 2021 07:59:00 -0400
X-MC-Unique: xJ18YXO5ObW8K7FN10Ng4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB731868335;
 Wed,  1 Sep 2021 11:58:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB48272C8;
 Wed,  1 Sep 2021 11:58:53 +0000 (UTC)
Date: Wed, 1 Sep 2021 12:58:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
Message-ID: <YS9q+yXJzcslU92I@redhat.com>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
 <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
 <CAFEAcA_kdx5a6_UP+FYONrk_LQC75YhwaO82GVj-pC6581LGwA@mail.gmail.com>
 <f4d09c95-42ae-b4bf-5c61-4b5384a94e21@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <f4d09c95-42ae-b4bf-5c61-4b5384a94e21@msgid.tls.msk.ru>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 02:45:55PM +0300, Michael Tokarev wrote:
> On 01.09.2021 12:52, Peter Maydell wrote:
> > On Wed, 1 Sept 2021 at 09:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
> ...
> > > We have sizeof(sockaddr_storage) space there. If the kernel returned
> > > salen greather than that, this means we received only partial address
> > > and can't rely on it. It is like snprintf() returning more bytes than
> > > available in the buffer - it says how much bytes NEEDED.
> > 
> > I think that if we need to check that we should be checking that
> > at the point where we make the accept() or whatever other call
> > filled in the sockaddr. That is the point at which the code
> > either (a) knows that the buffer is guaranteed big enough and
> > can assert that if it likes or (b) may have some reasonable way
> > to deal with the failure, eg allocate a bigger buffer and retry,
> > and (c) it is also the point where the code knows how big the actual
> > buffer it passed to the kernel is and so can validly determine if
> > it was truncated.
> 
> I don't care where it is done, as long as what is done does not
> break in real-life scenario.
> 
> Originally I asked another question: WHY we ask for the socket name
> in the first place, why do we need it, where do we use it?

We report the address information in the monitor in several places.
We also use the address information when running SASL auth in VNC.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


