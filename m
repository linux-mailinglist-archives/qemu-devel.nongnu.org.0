Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C13B6674
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:11:44 +0200 (CEST)
Received: from localhost ([::1]:47188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtrL-0003XF-JR
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpL-0000MG-41
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpJ-0001uf-4l
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkLBHkfXJxaMXYLk4+jG0GG7cEqqzru53ecaYrh3wFE=;
 b=LGiVfcyDhXrdF7RHGyXf0OsZqFL/CrerNk6wFYr1ZB8AD/puT7qbXOVPddB2DxlPmJtZdw
 R/9pkYKlkBD7J0bEeYxnSvPh9bCQXvkZpZ8qN+Ol4PsegiSqCa4ux1g5UmOM0ZOD+2UN3A
 3aUr2zt4WwNGb6dZEK9JJ7L9YDhSkHE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-GT9ytfxlOq2KC_ItpYCB2A-1; Mon, 28 Jun 2021 12:09:35 -0400
X-MC-Unique: GT9ytfxlOq2KC_ItpYCB2A-1
Received: by mail-wr1-f69.google.com with SMTP id
 k1-20020adfe8c10000b0290124c5f1d4dbso1937618wrn.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkLBHkfXJxaMXYLk4+jG0GG7cEqqzru53ecaYrh3wFE=;
 b=n47ShaqirfexeTBH2lf6sDNpVpzl/H1qSi18AeqRslnNIeMUaPDTpEYNQc9jegGBV+
 hmQfiDJkvdbgOd5NIhHR8Yd+91nvZeUKnmdsdRIW31CvsnLt5RZbzC7h2BxyBapU87hD
 YV81zwOn+jBJUdQGaaBd3qaHSBsnd+BPVQ+cnIOZqwBec5pvkbX2Q6JNksvQeacKwJDj
 SMNPQ6bB83ZdzBkJO8A1epPC2Ugp5t641764mowZb6JiZ2cbGOCa1J+ukeQn8Tg32YjB
 HDirodf/Y4wbVG5IT/FYh5c44N0MT0jfQnaY1/iJbkeo2pxLOhpFhHypOeYuWQEvgq38
 W2rw==
X-Gm-Message-State: AOAM532LAoS/Sgvkmt/tLVsOdi7jEQZxCk3dmyiTDIinSvVM9ONcGNDn
 doAC21tVm5MXWNQtJMX40BHg5YEmYn7lbCmQvP0IJH2Y6SWyTRuaDw2d7HR8XY51oDPRPPMLQOw
 4FglTQ7qB8t88YXz7wh2SIQ4g03bw4kEz9MZmYmx7CCT8qdXxGvPkZf43etsak5oJ
X-Received: by 2002:adf:ea45:: with SMTP id j5mr9030487wrn.230.1624896573733; 
 Mon, 28 Jun 2021 09:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze9c+nkYgCiUOvyNIiKvjttKE1+g7r/It7diSrKxB+4+qpY/jW6MRfRnzHmGzEqQbxNUU/YA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr9030467wrn.230.1624896573601; 
 Mon, 28 Jun 2021 09:09:33 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b15sm17739862wrr.27.2021.06.28.09.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/7] chardev/socket: Use qcrypto_tls_creds_check_endpoint()
Date: Mon, 28 Jun 2021 18:09:11 +0200
Message-Id: <20210628160914.2461906-5-philmd@redhat.com>
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


