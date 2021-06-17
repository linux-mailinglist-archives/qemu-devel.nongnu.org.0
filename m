Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D023AB3FF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:48:48 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrRv-0008Do-CB
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyw-0005ff-Bu
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyu-00089T-6M
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623932327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkLBHkfXJxaMXYLk4+jG0GG7cEqqzru53ecaYrh3wFE=;
 b=KzHpLeNnjh6ELsqrnZ47q0O0Dm/gybPo71LNFBd9AxfJBeLvRN9OkHjiiwCQiai+BtICwR
 gSv2kCr/QcE/vK3iGyvgRFd2DSBwNol7cpZKJ0C46QHyyoAMvkAqxQLItFCFzQhHycFzA+
 U/Ce3HeWZ/nv6yK9JyPKmqBqGfsBTYU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-iTN-5WfoOz6qaaKT9q13xg-1; Thu, 17 Jun 2021 08:18:46 -0400
X-MC-Unique: iTN-5WfoOz6qaaKT9q13xg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso2850696wrn.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkLBHkfXJxaMXYLk4+jG0GG7cEqqzru53ecaYrh3wFE=;
 b=tTqALZkLEvra/w2sRvEfAtlUhdjrYr4acFJYTo4O4czHfsHn8KWU4B//a44vBDYuCK
 F+bZxbZyZ7Hq1wXHqhlJsj+bVZS6EcJZ9+cjjOMTN6A5QJRcoE61H4mnBcSMgslYnzG1
 vv/8qfAGPKAgIj7pQ9JZOuc0DzkopZRU2pZFZAvhL+XtjQEE1ACyAZt3kG+jt3wZ9y4A
 8DnJoxkOLzbN18zIzdMgnCJ7i7KODSnWU9ga4d/9grUBbNO/kjWQB0862PHvK04Cc1UR
 h52RuE8Xtk+TEu2Zk+BH7DxXWO+kIowTEAzuPBHmsEzac/6n2TkCCw2uWKr+9o5QQrVR
 EpLw==
X-Gm-Message-State: AOAM531z9ssH0X/TFDzuXphSM5mdh8XWEKoZtsMrhHe6xIv5bUhJuevB
 lkbFMLel9Zyhf7ULQOdfFM0ZliDQTtAgpw+I8C3rhnqRIgszI72HayEHeQ3aam3oeP0C48gFlBk
 bM5vyZJSymkX64C1Vj37HelhB45y9roPK0h2ZGkyvLwo9oBv0idaG+m6k5VgF+uDY
X-Received: by 2002:a1c:770b:: with SMTP id t11mr4786483wmi.79.1623932325176; 
 Thu, 17 Jun 2021 05:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc2+JpOlLSCoO05wiBJmcQKnPmsj4Ah3lWnaZDOe8m/Kj2YhXBWG+wcIiWplGOUiU3aEfe9g==
X-Received: by 2002:a1c:770b:: with SMTP id t11mr4786456wmi.79.1623932324961; 
 Thu, 17 Jun 2021 05:18:44 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y16sm1819986wrp.51.2021.06.17.05.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:18:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] chardev/socket: Use qcrypto_tls_creds_check_endpoint()
Date: Thu, 17 Jun 2021 14:18:27 +0200
Message-Id: <20210617121830.2776182-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617121830.2776182-1-philmd@redhat.com>
References: <20210617121830.2776182-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 chardev/char-socket.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index daa89fe5d1d..d0fb5459638 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1402,18 +1402,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
         object_ref(OBJECT(s->tls_creds));
-        if (is_listen) {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-                error_setg(errp, "%s",
-                           "Expected TLS credentials for server endpoint");
-                return;
-            }
-        } else {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-                error_setg(errp, "%s",
-                           "Expected TLS credentials for client endpoint");
-                return;
-            }
+        if (!qcrypto_tls_creds_check_endpoint(s->tls_creds,
+                                          is_listen
+                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_SERVER
+                                          : QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
+            return;
         }
     }
     s->tls_authz = g_strdup(sock->tls_authz);
-- 
2.31.1


