Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1E3B6692
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:19:05 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtyS-0008PT-Sb
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpJ-0000Iw-SL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpF-0001sB-LM
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di8G8OpPyGBM2GZmS2rZ5uEzqieWECN7S7sUT+1jWLQ=;
 b=CIJbezAaZuTZnQdo4XCc2AtnWzWB0FoHWjwrX5iTFxQmqlTP+SCvDNTwNKrie/S0DVXLY0
 SCFncSlFIrcNlSNM/x9cnopbg75VOeKEglzBylblzUtFqEyhbkeLdVq7UsY+KUQ6ACMjIl
 1vMhvitGLmItxLtrNSdYDQD8XpNbL+E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-U_hn4fbXNmqW2-7hWP61Kw-1; Mon, 28 Jun 2021 12:09:26 -0400
X-MC-Unique: U_hn4fbXNmqW2-7hWP61Kw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v9-20020a5d4a490000b029011a86baa40cso4787945wrs.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=di8G8OpPyGBM2GZmS2rZ5uEzqieWECN7S7sUT+1jWLQ=;
 b=Hi3UcsBJEsb69OoZzutDNw9j2V9ly2yRS1HECiCj+YSdR0/q6Y9mjJr1RZNpTFhNgw
 FFOCerhPWSC68Qa883lcK6zAxNKeyTxg45mROPMnp8GT8N5YVvCpDlI2DRdiOVXJc9+Q
 D+vx5YZMdMonyqTkWBk0Ixix9C+skSZ38wvoJLRmMs/kOtV6hTwr3ePrNQ6im5WZGoO8
 yPTP8Nrx0CwtwykgkkwpdRo4qJxMW9Z4sx8/OXvlNWNSTmrAUND4DfpKLpMw6RuQfJP3
 h2hNxFopoSg8AwVJ085nXNBBIEEXqCn4IMr05EYTOw13NmwRlIDjj4FBspGHbP+tgihq
 iPtQ==
X-Gm-Message-State: AOAM533KrYin+mogIMOWmMD15dZnvXl3KHNDqvH1i0I8P3C4wv4Xr/LQ
 Qt4lTXw2gC18iuNdA+JrYKrFeMae5Qlw4BnY0vhMJ6GklM/vB7bGKcTSPCejx9j+901mfLWCo9w
 EJgwNqBsFP/0kZECKP06+bBVLB4VOHX5uOXuvDVLuuXYUSj3e14qEaTMTc9kITm7P
X-Received: by 2002:adf:f482:: with SMTP id l2mr10079385wro.276.1624896565305; 
 Mon, 28 Jun 2021 09:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFGicw1aHLPUm2i2suLI2SuHsTTGZnFGePNbqn9GKWEuGpv9I6lI85byuTgX1qirvfP/D+SQ==
X-Received: by 2002:adf:f482:: with SMTP id l2mr10079364wro.276.1624896565104; 
 Mon, 28 Jun 2021 09:09:25 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n7sm19219759wmq.37.2021.06.28.09.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Mon, 28 Jun 2021 18:09:09 +0200
Message-Id: <20210628160914.2461906-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628160914.2461906-1-philmd@redhat.com>
References: <20210628160914.2461906-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nbd.c    | 6 +++---
 blockdev-nbd.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3cbee762de8..601fccc5bac 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1839,9 +1839,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a client endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b264620b98d..bdfa7ed3a5a 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -108,9 +108,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a server endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
-- 
2.31.1


