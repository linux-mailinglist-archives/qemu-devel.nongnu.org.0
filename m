Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395E1C89EE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 14:01:31 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWfDV-0007k9-Qe
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 08:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWfAR-0006JL-Kf
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:58:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32310
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWfAP-0000cY-SA
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588852695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nLqvqmsH2jSFRw0F/MDyjhHtwg5oBKOYdRo16G5ILM=;
 b=MEq4YYQ/Ah/t8rup+k2iMiNDWwgSuAg3UCHeznmyUcHBCjeXYWiZBDOMWSwAJE5WMhj6y2
 pnfXZNhhLLLnZyyCOZ5EnCXp+rM1T4V3VoBLmMPHn7k5vzKDG1mC//Y1neE+B/ugBZn8B3
 zD+4GtueYySwmairDb1ceHONEpa5UZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-jTxt9743OKKhvnBQrVmzaQ-1; Thu, 07 May 2020 07:58:10 -0400
X-MC-Unique: jTxt9743OKKhvnBQrVmzaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39445107ACCA;
 Thu,  7 May 2020 11:58:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0774A62A50;
 Thu,  7 May 2020 11:58:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] crypto: fix getter of a QCryptoSecret's property
Date: Thu,  7 May 2020 12:57:59 +0100
Message-Id: <20200507115803.1122661-2-berrange@redhat.com>
In-Reply-To: <20200507115803.1122661-1-berrange@redhat.com>
References: <20200507115803.1122661-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tong Ho <tong.ho@xilinx.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tong Ho <tong.ho@xilinx.com>

This fixes the condition-check done by the "loaded" property
getter, such that the property returns true even when the
secret is loaded by the 'file' option.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/secret.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/crypto/secret.c b/crypto/secret.c
index 1cf0ad0ce8..5fb6bbe59c 100644
--- a/crypto/secret.c
+++ b/crypto/secret.c
@@ -221,6 +221,7 @@ qcrypto_secret_prop_set_loaded(Object *obj,
         secret->rawlen =3D inputlen;
     } else {
         g_free(secret->rawdata);
+        secret->rawdata =3D NULL;
         secret->rawlen =3D 0;
     }
 }
@@ -231,7 +232,7 @@ qcrypto_secret_prop_get_loaded(Object *obj,
                                Error **errp G_GNUC_UNUSED)
 {
     QCryptoSecret *secret =3D QCRYPTO_SECRET(obj);
-    return secret->data !=3D NULL;
+    return secret->rawdata !=3D NULL;
 }
=20
=20
--=20
2.26.2


