Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF7997573
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:56:32 +0200 (CEST)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0MPu-00062e-RD
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0MOI-0004ou-Tk
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0MOI-00040N-08
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:54:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0MOH-000404-Rb
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:54:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24855A2F6B3;
 Wed, 21 Aug 2019 08:54:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEE415D6B0;
 Wed, 21 Aug 2019 08:54:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 388FC16E1A; Wed, 21 Aug 2019 10:54:41 +0200 (CEST)
Date: Wed, 21 Aug 2019 10:54:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20190821085441.5ovhnw2zvyv4ydgb@sirius.home.kraxel.org>
References: <1564508710-22909-1-git-send-email-linux@roeck-us.net>
 <160cda6c-63b3-4d52-018e-d282514be2a3@redhat.com>
 <20190802141149.dj7zv5p5wscftvnr@sirius.home.kraxel.org>
 <14dfe5ce-d74c-dccd-a62b-753b2efa924b@roeck-us.net>
 <20190813114203.z62dgyyneqcp3mru@sirius.home.kraxel.org>
 <ffd106b7-2310-ac52-bc33-d03c6a387c39@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffd106b7-2310-ac52-bc33-d03c6a387c39@roeck-us.net>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 21 Aug 2019 08:54:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] ehci: Ensure that device is not NULL
 before calling usb_ep_get
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Yep, as long as the queue is not active this is completely harmless.
> > So we need to check a bit later.  In execute() looks a bit too late
> > though, we don't have a good backup plan then.
> > 
> > Does the patch below solve the problem without bad side effects?

> That seems to be working as intended. I have not seen a crash
> since I applied it. I tested it on top of v4.0 and v4.1.

Thanks.  Send as formal patch now.

cheers,
  Gerd


