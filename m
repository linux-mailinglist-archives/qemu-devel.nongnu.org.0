Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6684B1B0E30
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 16:21:01 +0200 (CEST)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQXIB-0003IC-Uq
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 10:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jQXH5-0002mW-BW
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:19:51 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jQXH4-0008HG-EV
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:19:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50810
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jQXH3-0008Co-Rb
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587392388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7USdtUoz3kSSU0UZKyTCfogB5EO4ouDL7SXvdREnsg=;
 b=ZQNPMsYItNrOf9qFxW+N/6LJn9xkC4bM8qw07/yr5H2aDekcGCs4X8IHUIHl2W268PqAcy
 V5AcWQe3E6tg2HfTJ3M85VdNeLWNmmH4qR2G1wiogqUWbcsEZyKGsChShlmwyCDepHxz1k
 F6QlBOI89x5ATQ6XYYuumijgdqMAozc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-I_BBzPMNOwiHR-TE6moM9g-1; Mon, 20 Apr 2020 10:19:44 -0400
X-MC-Unique: I_BBzPMNOwiHR-TE6moM9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BCF8026BF;
 Mon, 20 Apr 2020 14:19:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFC241001B09;
 Mon, 20 Apr 2020 14:19:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 758F717532; Mon, 20 Apr 2020 16:19:40 +0200 (CEST)
Date: Mon, 20 Apr 2020 16:19:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hou Qiming <hqm03ster@gmail.com>
Subject: Re: [edk2-discuss] Load Option passing. Either bugs or my confusion.
Message-ID: <20200420141940.tpkhv6zqjkv25h5i@sirius.home.kraxel.org>
References: <623b1855-285c-cce3-c806-c17e5fd217ea@redhat.com>
 <5211.1586899245384995995@groups.io>
 <a972450d-8834-ae87-e4e3-5263a41d1735@redhat.com>
 <CABSdmr=u9QeNA6jy29e2pkiqnGH=xw1n+Hkkrd=AH1RRvj92Ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABSdmr=u9QeNA6jy29e2pkiqnGH=xw1n+Hkkrd=AH1RRvj92Ng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 04:32:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Laszlo Ersek <lersek@redhat.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 qemu devel list <qemu-devel@nongnu.org>, discuss@edk2.groups.io,
 valerij zaporogeci <vlrzprgts@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The proper way to enable ramfb resolution change again is adding sanity
> checks for ramfb resolution / pointer / etc. on the QEMU side.

Pointer *is* checked.  ramfb creates a mapping, and if that fails due to
the pointer not being valid it bails out.

Sanity-checking the resolution is the job of the UI code.

cheers,
  Gerd


