Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F031428FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 12:13:23 +0100 (CET)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUzi-0006Z7-Jc
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 06:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itUjQ-0000gC-D1
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:56:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itUjM-0003iH-CF
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:56:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56560
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itUjM-0003i4-8g
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579517787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m73R1jMVelIN2XsUzNTigkK2g3l1F2ken0vt5QJoKOo=;
 b=iLPpLp+KeZJadKgsF0tewmAx/esf8g/o0Dlgcou311gCbp/Lio8A5n4gamBIzSMIbRIvW7
 aSQ7fO/VaAEl/gJf/ph663/xABbeh+JSYAHnNudZbEeRCmwTo7GflYR5btl7i7RCtzngGp
 5u6s85BNIY59732HkPrPz4WwOmtIHI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-htHAf5PvP3GBb9RM3Eaziw-1; Mon, 20 Jan 2020 05:56:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3619800EBF
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 10:56:24 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 887F589E73;
 Mon, 20 Jan 2020 10:56:18 +0000 (UTC)
Date: Mon, 20 Jan 2020 10:56:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 072/104] virtiofsd: passthrough_ll: fix refcounting on
 remove/rename
Message-ID: <20200120105616.GI2827@work-vm>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-73-dgilbert@redhat.com>
 <875zh68m9l.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <875zh68m9l.fsf@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: htHAf5PvP3GBb9RM3Eaziw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sergio Lopez (slp@redhat.com) wrote:
>=20
> Dr. David Alan Gilbert (git) <dgilbert@redhat.com> writes:
>=20
> > From: Miklos Szeredi <mszeredi@redhat.com>
> >
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 50 +++++++++++++++++++++++++++++++-
> >  1 file changed, 49 insertions(+), 1 deletion(-)
>=20
> This one is missing a commit message, and I think the patch isn't
> trivial enough to give it a pass without it.

Yep, see discussion:
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg03296.html

> Sergio.


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


