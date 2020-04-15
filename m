Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4F1AB25B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 22:15:42 +0200 (CEST)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOoRh-0003rI-Pw
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 16:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex-krasikov@yandex-team.ru>) id 1jOoPw-0002ms-FK
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 16:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex-krasikov@yandex-team.ru>) id 1jOoPt-00029K-HP
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 16:13:50 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:38612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex-krasikov@yandex-team.ru>)
 id 1jOoPt-00027c-0F
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 16:13:49 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 210672E153F;
 Wed, 15 Apr 2020 23:13:45 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
 (myt4-18a966dbd9be.qloud-c.yandex.net [2a02:6b8:c00:12ad:0:640:18a9:66db])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 m1uKeaoX5j-DioaJmgY; Wed, 15 Apr 2020 23:13:45 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1586981625; bh=xFEgqaRt4OqmMhZ3aKg8fvqzTuQRplZHQsffheL7kZQ=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=JYwFp0001syQx1jRw5QoE4uOG/w9moLinviGElDW07rH/fB99Q1nab+ARQk3HqJ1u
 NM0Z/g4Pu67yJr3hksJCTqmDhuU8gqzOFFftsF1yLHPwNgmn+va9FNwHb/UM+Szb6b
 hM/T05nrzhxE1evVp5MO7VV8rEv91aRU+FzWFNa8=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from unknown (unknown [2a02:6b8:b080:6410::1:e])
 by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 trkOwaUcU7-DiW4FT0Z; Wed, 15 Apr 2020 23:13:44 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Krasikov <alex-krasikov@yandex-team.ru>
To: berrange@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] crypto/secret: fix return logic of
 crypto_secret_prop_get_loaded()
Date: Wed, 15 Apr 2020 23:13:36 +0300
Message-Id: <20200415201336.24195-2-alex-krasikov@yandex-team.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415201336.24195-1-alex-krasikov@yandex-team.ru>
References: <20200415201336.24195-1-alex-krasikov@yandex-team.ru>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1619::183
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

* Get function returned value of properties 'data' insteed of returning
  value of raw data internal field. This error did not affect anyone,
  because no one called the get function.

Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
---
 crypto/secret.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/secret.c b/crypto/secret.c
index 546b965afe..79b9b4ce0c 100644
--- a/crypto/secret.c
+++ b/crypto/secret.c
@@ -231,7 +231,7 @@ qcrypto_secret_prop_get_loaded(Object *obj,
                                Error **errp G_GNUC_UNUSED)
 {
     QCryptoSecret *secret = QCRYPTO_SECRET(obj);
-    return secret->data != NULL;
+    return secret->rawdata != NULL;
 }
 
 
-- 
2.17.1


