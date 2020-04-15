Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34BA1AB25D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 22:17:34 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOoTV-0005yr-P0
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 16:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex-krasikov@yandex-team.ru>) id 1jOoPw-0002mt-Ff
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 16:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex-krasikov@yandex-team.ru>) id 1jOoPt-00029F-H8
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 16:13:50 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:40176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex-krasikov@yandex-team.ru>)
 id 1jOoPt-00027S-09
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 16:13:49 -0400
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B3D642E1566;
 Wed, 15 Apr 2020 23:13:44 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
 (myt4-18a966dbd9be.qloud-c.yandex.net [2a02:6b8:c00:12ad:0:640:18a9:66db])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RmHf9PHlSa-DiMO4SB8; Wed, 15 Apr 2020 23:13:44 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1586981624; bh=sbjVUcvaK53FMsSghhGVEcWs7eQXtomn7upWO7roQmA=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=yh/zpLzdQXIPbz5588YNePjlOfmaTyP0Th6GLGeNMHWcvJ7Y4lWh/hy+35FaQ0MFo
 vIzotEn0SUXupgVIS/FTUghpJ2JzfkSuHf0lTtawKnVEQ4Cz9sLffdXUJe/N/rqftj
 oMeu+vL5cvnd77AVD7jF0SEtCOQQgb5NBlEko4ik=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from unknown (unknown [2a02:6b8:b080:6410::1:e])
 by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 trkOwaUcU7-DiW4Tw11; Wed, 15 Apr 2020 23:13:44 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Krasikov <alex-krasikov@yandex-team.ru>
To: berrange@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] crypto/secret: fix inconsequential errors.
Date: Wed, 15 Apr 2020 23:13:35 +0300
Message-Id: <20200415201336.24195-1-alex-krasikov@yandex-team.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 77.88.29.217
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* change condition from QCRYPTO_SECRET_FORMAT_RAW
  to QCRYPTO_SECRET_FORMAT_BASE64 in if-operator, because
  this is potencial error if you add another format value.

Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
---
 crypto/secret.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/secret.c b/crypto/secret.c
index 1cf0ad0ce8..546b965afe 100644
--- a/crypto/secret.c
+++ b/crypto/secret.c
@@ -204,7 +204,7 @@ qcrypto_secret_prop_set_loaded(Object *obj,
             input = output;
             inputlen = outputlen;
         } else {
-            if (secret->format != QCRYPTO_SECRET_FORMAT_RAW) {
+            if (secret->format == QCRYPTO_SECRET_FORMAT_BASE64) {
                 qcrypto_secret_decode(input, inputlen,
                                       &output, &outputlen, &local_err);
                 g_free(input);
-- 
2.17.1


