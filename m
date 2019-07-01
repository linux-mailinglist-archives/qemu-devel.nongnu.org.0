Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C896033390
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXovn-0005nw-V2
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:31:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoWP-0001rM-0a
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoWO-0002K8-1W
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:05:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoWL-00028e-Nj; Mon, 03 Jun 2019 11:05:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B01D83082231;
	Mon,  3 Jun 2019 15:04:56 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9698961B6A;
	Mon,  3 Jun 2019 15:04:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:33 +0200
Message-Id: <20190603150233.6614-29-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 15:05:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 28/28] iotests: Fix duplicated diff output on
 failure
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 70ff5b07 wanted to move the diff between actual and reference
output to the end after printing the test result line. It really only
copied it, though, so the diff is now displayed twice. Remove the old
one.

Fixes: 70ff5b07fcdd378180ad2d5cc0b0d5e67e7ef325
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/check | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 95162c6cf9..44ebf24080 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -876,7 +876,6 @@ do
                     fi
                 else
                     mv $tmp.out $seq.out.bad
-                    $diff -w "$reference" "$PWD"/$seq.out.bad
                     status=3D"fail"
                     results=3D"output mismatch (see $seq.out.bad)"
                     printdiff=3Dtrue
--=20
2.20.1


