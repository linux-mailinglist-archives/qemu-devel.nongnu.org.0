Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA991CACAE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:56:34 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2YL-0000KH-HJ
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KS-0000BJ-Ud
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KN-000867-IP
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UHsSlojS8mwctU3JfYaLI5kEwWp0vAEOKonzZ8yJjk=;
 b=Rlb3HcnjvncuZKXct55wBYtp0ovTb9py4aAD3DDc7yuKL69+I6SBvDp/miuMwCTW4sn83H
 3N+vEVBLl+LERlcyU05J7EqT36rEJqLZacCh0wNch97OFFva9OKDpBvYhWYkvulBW3vHzK
 aIeYI+E+A+q4sxP4KTPCRS4gGK3NcVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-IQoJay-7MpyBm18HfmMH-Q-1; Fri, 08 May 2020 08:42:03 -0400
X-MC-Unique: IQoJay-7MpyBm18HfmMH-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A2A7107ACCD;
 Fri,  8 May 2020 12:42:02 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0527919167;
 Fri,  8 May 2020 12:42:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/30] iotests: vmdk: Enable zeroed_grained=on by default
Date: Fri,  8 May 2020 14:41:20 +0200
Message-Id: <20200508124135.252565-16-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 08:00:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to avoid bitrot in the zero cluster code in VMDK, enable
zeroed_grain=3Don by default for the tests.

059 now unsets the default options because zeroed_grain=3Don works only
with some subformats and the test case tests many different subformats,
including those for which it doesn't work.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200430133007.170335-7-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/059   | 6 +++---
 tests/qemu-iotests/check | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/059 b/tests/qemu-iotests/059
index 5438025285..4c90fc0363 100755
--- a/tests/qemu-iotests/059
+++ b/tests/qemu-iotests/059
@@ -41,9 +41,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt vmdk
 _supported_proto file
 _supported_os Linux
-_unsupported_imgopts "subformat=3DmonolithicFlat" \
-                     "subformat=3DtwoGbMaxExtentFlat" \
-                     "subformat=3DtwoGbMaxExtentSparse"
+
+# We test all kinds of VMDK options here, so ignore user-specified options
+IMGOPTS=3D""
=20
 capacity_offset=3D16
 granularity_offset=3D20
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index f7a2d3d6c3..9c461cf76d 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -546,6 +546,9 @@ fi
 if [ "$IMGFMT" =3D=3D "luks" ] && ! (echo "$IMGOPTS" | grep "iter-time=3D"=
 > /dev/null); then
     IMGOPTS=3D$(_optstr_add "$IMGOPTS" "iter-time=3D10")
 fi
+if [ "$IMGFMT" =3D=3D "vmdk" ] && ! (echo "$IMGOPTS" | grep "zeroed_grain=
=3D" > /dev/null); then
+    IMGOPTS=3D$(_optstr_add "$IMGOPTS" "zeroed_grain=3Don")
+fi
=20
 if [ -z "$SAMPLE_IMG_DIR" ]; then
         SAMPLE_IMG_DIR=3D"$source_iotests/sample_images"
--=20
2.25.3


