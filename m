Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A659AC416A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 21:57:36 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOH9-0004Lh-1W
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 15:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO7l-0004YC-I1
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO7k-0007pD-97
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO7a-0007gP-Mv; Tue, 01 Oct 2019 15:47:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1E3230860BD;
 Tue,  1 Oct 2019 19:47:36 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3555C1D4;
 Tue,  1 Oct 2019 19:47:36 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 08/67] iotests.py: Add filter_json_filename()
Date: Tue,  1 Oct 2019 21:46:16 +0200
Message-Id: <20191001194715.2796-9-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 01 Oct 2019 19:47:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index fb0a49372d..9737dd881b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -378,6 +378,9 @@ def filter_qmp_testfiles(qmsg):
 def filter_generated_node_ids(msg):
     return re.sub("#block[0-9]+", "NODE_NAME", msg)
=20
+def filter_json_filename(msg):
+    return re.sub('json:{.*}', 'json:{ /* filtered */ }', msg)
+
 def filter_img_info(output, filename):
     lines =3D []
     user_data_file =3D any('data_file' in opt for opt in imgopts)
--=20
2.21.0


