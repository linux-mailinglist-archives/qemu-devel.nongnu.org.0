Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C42D948
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 11:42:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVv6I-0004rT-1j
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 05:42:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1hVv2p-0002mH-8B
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:38:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1hVv2o-0002od-Ec
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:38:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hVv2o-0002js-91
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:38:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28ADAA3B60;
	Wed, 29 May 2019 09:38:34 +0000 (UTC)
Received: from kaapi (unknown [10.35.206.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 899FA600C4;
	Wed, 29 May 2019 09:38:22 +0000 (UTC)
Date: Wed, 29 May 2019 15:08:16 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
In-Reply-To: <CAJ+F1CLH1qN-jVVaMacMB41PWfZ5Xd9A8ycowaNxwgvQhPEvMQ@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1905291448250.16122@xnncv>
References: <20190519084815.7410-1-ppandit@redhat.com>
	<CAJ+F1CLXdw4gE45vVEpStKrKsu-OYy1+5caC9wUduEtQRhjrpA@mail.gmail.com>
	<nycvar.YSQ.7.76.1905231257400.23354@xnncv>
	<CAJ+F1CLH1qN-jVVaMacMB41PWfZ5Xd9A8ycowaNxwgvQhPEvMQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 29 May 2019 09:38:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2] qga: check length of command-line &
 environment variables
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?ISO-8859-15?Q?Ferm=EDn_J=2E_Serna?= <fjserna@gmail.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Marc,

+-- On Thu, 23 May 2019, Marc-Andr=C3=A9 Lureau wrote --+
| I don't see how you could exploit this today.
|=20
| QMP parser has MAX_TOKEN_COUNT (2ULL << 20).

I see, didn't realise that. I tried to reproduce it and

   {"error": {"class": "GenericError", "desc": "JSON token count limit ex=
ceeded"}}

got above error around ~1048570 tokens; Much earlier than 0x200000(=3D209=
7152) =20
as defined by MAX_TOKEN_COUNT. I guess multiple packets are being merged =
to=20
form the incoming command and there is a glitch in there.

| We could have "assert(count < MAX_TOKEN_COUNT)" in the loop, if it help=
s.

No, assert() doesn't seem good.

I think same limit will apply to commands coming via QAPIs as well?


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
