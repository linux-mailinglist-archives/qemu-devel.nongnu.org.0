Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A563C1CAB9E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:45:33 +0200 (CEST)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2Ng-0005HZ-KQ
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KB-0008QR-Hm
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:41:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27897
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KA-0007x5-5I
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MU6HaJvPAeIgA5vvgF4Trxs9Ip2DhXproq2i7WRbhc=;
 b=QySs6Qh5bZnBWP5353AeM8HWKG1SwMF6SdQT/L/zBIOtVXgH0044pkyeGLtKqoMZqAVrMn
 RB9Itv9GEdd84orBkmOYaYK8OGemawGTAO0u+RPVQA8yiAyUUMGiLgTaHdXk7wDdVc+3xi
 GwCSs6NQ8jiH821TDt5tH4XyC/R0Bl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-qHi1JxQvNBKHYPkW9tSt8Q-1; Fri, 08 May 2020 08:41:51 -0400
X-MC-Unique: qHi1JxQvNBKHYPkW9tSt8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E085107ACF3;
 Fri,  8 May 2020 12:41:50 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E1B019167;
 Fri,  8 May 2020 12:41:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/30] iotests/055: skip vmdk target tests if vmdk is not
 whitelisted
Date: Fri,  8 May 2020 14:41:11 +0200
Message-Id: <20200508124135.252565-7-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200430124713.3067-7-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/055 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/055 b/tests/qemu-iotests/055
index d9e8985167..e250f798f9 100755
--- a/tests/qemu-iotests/055
+++ b/tests/qemu-iotests/055
@@ -566,6 +566,10 @@ class TestCompressedToQcow2(iotests.QMPTestCase):
 class TestCompressedToVmdk(TestCompressedToQcow2):
     target_fmt =3D {'type': 'vmdk', 'args': ('-o', 'subformat=3DstreamOpti=
mized')}
=20
+    @iotests.skip_if_unsupported(['vmdk'])
+    def setUp(self):
+        pass
+
=20
 if __name__ =3D=3D '__main__':
     iotests.main(supported_fmts=3D['raw', 'qcow2'],
--=20
2.25.3


