Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E115A931
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 13:30:47 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1rAE-0003w7-OM
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 07:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j1r9Q-0003TG-4B
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:29:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j1r9P-0008Kg-3g
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:29:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50058
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j1r9P-0008K9-0A
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581510594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0gg9Q8cEWE2zTQR2uCQ2wIgeoY6ZmiBWA9lNvbD23I=;
 b=Ac8t/0a2cNYsvq9dShgmY288WDhIpsBKpQP4f5Hfi1xMWDa8eeFzKg82UF2QsXl71e7+xk
 9PKbq2T5uu77eLCMAu1me6/LdAGQgA2/zAWQgkhjwmKIMPbKjPUc4PcQ3VNaVeW8+EW5UF
 6oBAcg/tnrbF/X2c87ei/lSttDozP4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-Xs9EBA8nNGGPkz-UZwmwqQ-1; Wed, 12 Feb 2020 07:29:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B107107ACC7
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 12:29:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55E66388;
 Wed, 12 Feb 2020 12:29:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 852799D6B; Wed, 12 Feb 2020 13:29:45 +0100 (CET)
Date: Wed, 12 Feb 2020 13:29:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] console: make QMP screendump use coroutine
Message-ID: <20200212122945.uaq4cbeyhbssr4cs@sirius.home.kraxel.org>
References: <20200113144848.2168018-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200113144848.2168018-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Xs9EBA8nNGGPkz-UZwmwqQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Thanks to the QMP coroutine support, the screendump handler can
> trigger a graphic_hw_update(), yield and let the main loop run until
> update is done. Then the handler is resumed, and the ppm_save() will
> write the screen image to disk in the coroutine context (thus
> non-blocking).
>=20
> For now, HMP doesn't have coroutine support, so it remains potentially
> outdated or glitched.
>=20
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1230527
>=20
> Based-on: <20200109183545.27452-2-kwolf@redhat.com>

What is the status here?  Tried to apply (worked) and build (failed),
seems Kevins patches are not merged yet?

thanks,
  Gerd


