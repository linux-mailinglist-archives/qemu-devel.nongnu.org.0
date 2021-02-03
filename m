Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E930DC7F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:19:31 +0100 (CET)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J0D-0007XW-TU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7IxU-0006As-K3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7IxS-0004fZ-96
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612361796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=akD5jhX6c+BYReRJEeR9BMyQvfPpd4Nbs85a++xswTc=;
 b=ZmhVwWRI6gtoAfyOYb9PYxoYzHfAwyQ1q6VqtV22IVLip+84SXzOpfEdR3F4ylS0hoYyEZ
 QLgx13hNF9VZQBHuBhqRen4jyom7VVWBq1F3t9zEEiphrxH5z/HHvONBLSq9pbTv4uz/V4
 1jlQmdGt3XrQ7XbkXnq2IhVZ+S+ddww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-rWWpJY2rOOuMKGHJZoNdAQ-1; Wed, 03 Feb 2021 09:16:34 -0500
X-MC-Unique: rWWpJY2rOOuMKGHJZoNdAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1B9F1936B61;
 Wed,  3 Feb 2021 14:16:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F68C50DD3;
 Wed,  3 Feb 2021 14:16:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9380F1800853; Wed,  3 Feb 2021 15:16:31 +0100 (CET)
Date: Wed, 3 Feb 2021 15:16:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 20/20] RFC: tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
Message-ID: <20210203141631.sacrgywaw636m2fs@sirius.home.kraxel.org>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-21-marcandre.lureau@redhat.com>
 <20210203113840.5d5hwphdyicomel2@sirius.home.kraxel.org>
 <CAJ+F1C+TJ1f4-=83s4tj0b6-D8y2s0ADry=10GuSj372eFfDXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+TJ1f4-=83s4tj0b6-D8y2s0ADry=10GuSj372eFfDXw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: QEMU <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > [ queued whole series + some other pending ui/vga bits, kicked CI, lets
> >   see how it is going.  I suspect I'll have to drop this patch though. ]
> >
> 
> Yes, Cleber was going to take a look, and perhaps send another avocado
> series I could take some inspiration from.

Doesn't look too bad, gitlab passed, cirrus still running.

So include it?  Or do you want send an improved non-rfc version anyway?

take care,
  Gerd


