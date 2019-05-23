Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF52806A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:00:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpDE-0007ft-HY
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:00:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hTpBR-0006nj-H3
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hTpBQ-00032C-JD
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:59:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hTpBQ-0002tI-Dl
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:59:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E896330BF4D5
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 14:58:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-235.ams2.redhat.com
	[10.36.117.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4737C5AB;
	Thu, 23 May 2019 14:58:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com, eblake@redhat.com,
	armbru@redhat.com, laine@redhat.com
Date: Thu, 23 May 2019 15:58:38 +0100
Message-Id: <20190523145840.11774-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 23 May 2019 14:58:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] network announce; interface selection
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

Note since we've still only got one timer, if you start one announce
on an interface and then you start a second announce on another
interface, the first one gets cancelled even if it's part way through.
[That's the other feature Laine would like, but I need to think about
that a bit more.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Dr. David Alan Gilbert (2):
  net/announce: Allow optional list of interfaces
  net/announce: Add HMP optional interface list

 hmp-commands.hx        |  6 ++++--
 hmp.c                  | 38 +++++++++++++++++++++++++++++++++++++-
 include/net/announce.h |  2 +-
 net/announce.c         | 39 ++++++++++++++++++++++++++++++++-------
 net/trace-events       |  2 +-
 qapi/net.json          |  8 +++++---
 6 files changed, 80 insertions(+), 15 deletions(-)

--=20
2.21.0


