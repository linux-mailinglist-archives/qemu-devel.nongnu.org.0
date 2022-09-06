Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBBD5AE48D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:42:28 +0200 (CEST)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVV69-0002OV-Vb
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9j-0006rb-3n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9h-0006O1-G2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UlpG9IBCv+CALsSy0zAeb9/G7YEXk8K2sbT+FFi4DQ=;
 b=NZo2pdZRMO8hk21kgQwVcuOnZIp9wULX7JaigToVEpD92Ttv673H/uKGCT2dWN7UxZSWgb
 piAtqF32bZdGnLXBgXzJE7D3YOgIyYuMBq+Fs4Ohh+ns9dRgdg4J5HTzKVWCR2iIprVzQb
 owOGlwD4dmCkuA17a254n66LNlFnbYo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-iSjlJO_UPdKT7JdnWvJRPA-1; Tue, 06 Sep 2022 04:41:59 -0400
X-MC-Unique: iSjlJO_UPdKT7JdnWvJRPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231633801F52
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78963C15BB3;
 Tue,  6 Sep 2022 08:41:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 10/11] crypto: ensure LUKS tests run with GNUTLS crypto
 provider
Date: Tue,  6 Sep 2022 09:41:46 +0100
Message-Id: <20220906084147.1423045-11-berrange@redhat.com>
In-Reply-To: <20220906084147.1423045-1-berrange@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GNUTLS is supported as a crypto provider since

  commit cc4c7c738297958b3d1d16269f57d71d22f5a9ff
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Jun 30 17:20:02 2021 +0100

    crypto: introduce build system for gnutls crypto backend

So enable the LUKS tests in this config.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-block.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-crypto-block.c b/tests/unit/test-crypto-block.c
index 3417b67be5..2a044a14cc 100644
--- a/tests/unit/test-crypto-block.c
+++ b/tests/unit/test-crypto-block.c
@@ -30,7 +30,8 @@
 #endif
 
 #if (defined(_WIN32) || defined RUSAGE_THREAD) && \
-    (defined(CONFIG_NETTLE) || defined(CONFIG_GCRYPT))
+    (defined(CONFIG_NETTLE) || defined(CONFIG_GCRYPT) ||
+     defined(CONFIG_GNUTLS_CRYPTO))
 #define TEST_LUKS
 #else
 #undef TEST_LUKS
-- 
2.37.2


