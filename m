Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7A3BC8F0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:02:13 +0200 (CEST)
Received: from localhost ([::1]:49002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hu8-0007kD-Ac
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hro-000508-Kt
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrh-0000yD-Nj
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MZY9JS1Pu+7mjMKLLrNsbFztuWSYlvCXNl6v8KUS6c=;
 b=bn44kFTs9c16shl2kG4CrGOsIZl5CP1S3pBzjkYzg1oj4I1cDFDHn+K1QsWvuNpQC9GHeg
 40HRNG6kO0DeJQY+loWRwUoyFcPF6bdPGWWXdCQPUD7B32IOXuyLluB+7vhjUb+4h0GpqI
 iokYP0wpf+i9UZ+r5K+u+NHK5iXKBWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-aXL0f7MIN3OTZbtRWF7DCQ-1; Tue, 06 Jul 2021 05:59:39 -0400
X-MC-Unique: aXL0f7MIN3OTZbtRWF7DCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37AF2106B7DC
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:38 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E4B5D6A1;
 Tue,  6 Jul 2021 09:59:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/18] crypto: remove conditional around 3DES crypto test cases
Date: Tue,  6 Jul 2021 10:59:07 +0100
Message-Id: <20210706095924.764117-2-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main method checks whether the cipher choice is supported
at runtime, so there is no need for compile time conditions.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-cipher.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/unit/test-crypto-cipher.c b/tests/unit/test-crypto-cipher.c
index 280319a223..fd0a8de34c 100644
--- a/tests/unit/test-crypto-cipher.c
+++ b/tests/unit/test-crypto-cipher.c
@@ -165,7 +165,6 @@ static QCryptoCipherTestData test_data[] = {
             "ffd29f1bb5596ad94ea2d8e6196b7f09"
             "30d8ed0bf2773af36dd82a6280c20926",
     },
-#if defined(CONFIG_NETTLE) || defined(CONFIG_GCRYPT)
     {
         /* Borrowed from linux-kernel crypto/testmgr.h */
         .path = "/crypto/cipher/3des-cbc",
@@ -283,7 +282,6 @@ static QCryptoCipherTestData test_data[] = {
             "407772c2ea0e3a7846b991b6e73d5142"
             "fd51b0c62c6313785ceefccfc4700034",
     },
-#endif
     {
         /* RFC 2144, Appendix B.1 */
         .path = "/crypto/cipher/cast5-128",
-- 
2.31.1


