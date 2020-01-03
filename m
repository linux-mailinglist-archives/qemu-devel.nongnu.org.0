Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC612F8AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 14:12:08 +0100 (CET)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inMkJ-0001tC-4L
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 08:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1inMj4-0000zF-J9
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1inMj2-0006sW-Cw
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:10:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42350
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1inMj1-0006lA-PL
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578057046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBC9+Rgj40vmrriNZcaUgus8MQIQ9ig7sfzY033ApOw=;
 b=FzyEFdtol0a4SKHNPMAplWbblfHameVgvhC/yKcvVjQh+plR3nwskNh8+xNRZJjGpHdsbc
 zZWMhES6dEHXAJ2uqTF2fgL0pwjaFE1k73/jggzMTqPBKyh+vlKFrpoieY87w+Lvv/BM/m
 0qWLEojwqfgzjh+j6jvSdojdQkeg7NM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-6d-Se5KzMmu_0w_u4Ih8vg-1; Fri, 03 Jan 2020 08:10:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9779800D4E;
 Fri,  3 Jan 2020 13:10:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 677497942E;
 Fri,  3 Jan 2020 13:10:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 444B69DA3; Fri,  3 Jan 2020 14:10:42 +0100 (CET)
Date: Fri, 3 Jan 2020 14:10:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 2/5] hda-codec: fix recording rate control
Message-ID: <20200103131042.qjqftjls2yhf5hd2@sirius.home.kraxel.org>
References: <fe427705-ef37-d48e-526c-7dc8025425b6@t-online.de>
 <08ea1c13-aa53-31f4-4495-ff4e455ae3ad@t-online.de>
MIME-Version: 1.0
In-Reply-To: <08ea1c13-aa53-31f4-4495-ff4e455ae3ad@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6d-Se5KzMmu_0w_u4Ih8vg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 19, 2019 at 09:04:16PM +0100, Volker R=FCmelin wrote:
> Apply previous commit to hda_audio_input_cb for the same
> reasons.

This mail is multipart text+html and "git am" can't process it (the
others are text only).  Can you please resend the patches, preferably
with "git send-email" to avoid them being sent as multipart?  They all
look good to me (this series and the 6th patch sent as separate mail).

thanks,
  Gerd


