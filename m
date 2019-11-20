Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59688103CEF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 15:05:43 +0100 (CET)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXQc2-0007wc-AB
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 09:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iXQaH-0006Oi-Hl
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:03:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iXQaG-0000tM-Cy
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:03:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32129
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iXQaG-0000t8-7b
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574258631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzUY8MBww2k8ALhMSX8MM670TCCi9p8BmXeyT8wFin8=;
 b=eGBn9tO2tguYlM181gjc/CYElp5OwwEqQ7vKEcKxZLfKUBBLjYhzUsn4gDdmIa+sxc7lCi
 4a7RkPGPk6P+Up+sToBQuFUIrcyPWUgNEZd0IpttnbMjM6hMQEAAQBvFDx/WlK4S2BXQEl
 /ix38rWG2PMVHuLrSgPN0B+NL84AMpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-h2y2v_tLN5-ZootHc9gLdw-1; Wed, 20 Nov 2019 09:03:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 600B41083E81;
 Wed, 20 Nov 2019 14:03:49 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5160C60BB8;
 Wed, 20 Nov 2019 14:03:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/6] iotests: Add qemu_io_log()
Date: Wed, 20 Nov 2019 15:03:16 +0100
Message-Id: <20191120140319.1505-4-kwolf@redhat.com>
In-Reply-To: <20191120140319.1505-1-kwolf@redhat.com>
References: <20191120140319.1505-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: h2y2v_tLN5-ZootHc9gLdw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that runs qemu-io and logs the output with the
appropriate filters applied.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6a248472b9..330681ad02 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -157,6 +157,11 @@ def qemu_io(*args):
         sys.stderr.write('qemu-io received signal %i: %s\n' % (-exitcode, =
' '.join(args)))
     return subp.communicate()[0]
=20
+def qemu_io_log(*args):
+    result =3D qemu_io(*args)
+    log(result, filters=3D[filter_testfiles, filter_qemu_io])
+    return result
+
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
     args =3D qemu_io_args + list(args)
--=20
2.20.1


