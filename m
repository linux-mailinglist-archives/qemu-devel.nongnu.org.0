Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1322DA41
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 12:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVvgm-0006lG-53
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 06:20:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVves-0005up-U6
	for qemu-devel@nongnu.org; Wed, 29 May 2019 06:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVves-0001ZY-1k
	for qemu-devel@nongnu.org; Wed, 29 May 2019 06:18:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hVver-0001ZB-Sy
	for qemu-devel@nongnu.org; Wed, 29 May 2019 06:18:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D02285538
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 10:18:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45837694A5;
	Wed, 29 May 2019 10:17:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com, eblake@redhat.com,
	armbru@redhat.com, laine@redhat.com
Date: Wed, 29 May 2019 11:17:54 +0100
Message-Id: <20190529101756.22557-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 29 May 2019 10:18:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] network announce; interface selection
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Laine asked for some extra features on the network announce support;
this is the first one of them.
It allows you to send an announce on a subset of the interfaces.
=20
Note since we've still only got one timer, if you start one announce
on an interface and then you start a second announce on another
interface, the first one gets cancelled even if it's part way through.
[That's the other feature Laine would like, but I need to think about
that a bit more.
=20
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

v2
  Document new parameter [Eric]
  Unabbreviate the parameter name [Markus]

Dr. David Alan Gilbert (2):
  net/announce: Allow optional list of interfaces
  net/announce: Add HMP optional interface list

 hmp-commands.hx        |  6 ++++--
 hmp.c                  | 38 +++++++++++++++++++++++++++++++++++++-
 include/net/announce.h |  2 +-
 net/announce.c         | 39 ++++++++++++++++++++++++++++++++-------
 net/trace-events       |  2 +-
 qapi/net.json          | 11 ++++++++---
 6 files changed, 83 insertions(+), 15 deletions(-)

--=20
2.21.0


