Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47F150499
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 11:53:49 +0100 (CET)
Received: from localhost ([::1]:37816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyZMS-0004NV-RP
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 05:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1iyZLQ-0003A4-CR
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:52:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1iyZLP-0008FU-Dl
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:52:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1iyZLP-0008EN-A3
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580727162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KtO6qgb2V7cjvOhMhAy77Qcv7ZyluZl94Ob4VWklibc=;
 b=f+Cozk0tE2vcDXBI7BR0RLrJmt+bO2RdcT8GHPXQ1t9Et2ZHqUTo7TMyxrmFdhQQZl/fkB
 Ioex2WRrSgDPG6JGLeCvwd/LErqCw0S89ORrrOp/tc+21MAxjmJWw58AwV5ABbWnC7oquB
 tDuS4QPDGD6l/1Ta7lmguITAxJn93pk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-9EfHR_6COJ6wJo_YZwSTBw-1; Mon, 03 Feb 2020 05:52:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CF4800D41
 for <qemu-devel@nongnu.org>; Mon,  3 Feb 2020 10:52:40 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-116-185.ams2.redhat.com [10.36.116.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F99E10013A7;
 Mon,  3 Feb 2020 10:52:34 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Acceptance test: provides to use different transport
 for migration
Date: Mon,  3 Feb 2020 12:52:31 +0200
Message-Id: <20200203105233.15692-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9EfHR_6COJ6wJo_YZwSTBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: philmd@redhat.com, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series makes refactoring to migration test and adds new tests with
EXEC and UNIX protocols

---
v2:
  - Removes unnecessary symbols and unused method

v3:
 - Makes refactoring and split into 2 patches
 - Provides TCP and EXEC migration

Oksana Vohchana (2):
  Acceptance test: provides to use different transport for migration
  Acceptance test: provides to use different transport for  migration

 tests/acceptance/migration.py | 52 +++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 15 deletions(-)

--=20
2.21.1


