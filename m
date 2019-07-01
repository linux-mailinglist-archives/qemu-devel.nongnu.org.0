Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C92195F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 15:51:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRdGF-0001BU-Ks
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 09:50:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hRdDS-0008Sd-D0
	for qemu-devel@nongnu.org; Fri, 17 May 2019 09:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hRdDQ-0003WG-Ca
	for qemu-devel@nongnu.org; Fri, 17 May 2019 09:48:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hRdDP-0003Qq-Vm
	for qemu-devel@nongnu.org; Fri, 17 May 2019 09:48:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29466307EA98
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 13:47:57 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-83.ams2.redhat.com
	[10.36.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 235DD7A4A8;
	Fri, 17 May 2019 13:47:54 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 15:47:44 +0200
Message-Id: <20190517134748.340381-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 17 May 2019 13:47:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/4] Clean ups in net/net.c
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
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series contains some clean ups in net/net.c

The patch 1 solves an assertion failure when ipv6-prefixlen is not a numb=
er,

Following the Markus' advice, I modified the parsing of IPv6 prefix
(patch 2) and IPv4 host:port (patch 3). Then I removed the get_str_sep()
function (patch 4) because it is no longer used.

v3:
 - Patch 2:
   - fix indentation [Markus]
   - move substrings at the function level, and call g_strfreev(substring=
s)
     at the end of the function [Markus]
 - add Markus' R-b

v2: https://www.mail-archive.com/qemu-devel@nongnu.org/msg615866.html
v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg614561.html

Stefano Garzarella (4):
  net: fix assertion failure when ipv6-prefixlen is not a number
  net: avoid using variable length array in net_client_init()
  net: use g_strsplit() for parsing host address and port
  net: remove unused get_str_sep() function

 net/net.c | 99 +++++++++++++++++++++++++++----------------------------
 1 file changed, 49 insertions(+), 50 deletions(-)

--=20
2.20.1


