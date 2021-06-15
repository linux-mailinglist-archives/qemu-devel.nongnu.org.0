Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D173A8790
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:31:15 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCuA-0003cx-A3
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrY-00064z-Ea
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrW-00043q-Ji
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9Lp1hpOHTUDUkB6RWqmF0u0II8iRadKEZCA3yeM8Ts=;
 b=flWaRXcN0RQYCN0Uwj6itVyqDqpXZ0YB44xwaJnMADnU+TA7xN+SjCWXAMJbRBp/zCcZNZ
 cIQdba23/1UMopRup3cpS50nFIpjUOrP1BM950eheD65CtelG2xXGeYSLBh5w/ctkZmaxz
 a9LaM4Wo2W3UxV4dBLNv6TqK/TX9a5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-0YbPlAS1N1SYiZKJ1CzGww-1; Tue, 15 Jun 2021 13:28:02 -0400
X-MC-Unique: 0YbPlAS1N1SYiZKJ1CzGww-1
Received: by mail-wr1-f69.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so8890660wrm.17
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9Lp1hpOHTUDUkB6RWqmF0u0II8iRadKEZCA3yeM8Ts=;
 b=U8S09hTB+VN+h5qw+7vfClKHr/Jp2KarWQlRUEyiWcqquYjp6bMYAai+Jw6mXBrsDh
 ZsnfOuWQnK3PVfyQ4xDype8rJp4celuX+ircMvrqF9WAD5nbqsoq8Q///hU955c+mR58
 0h2/lRJJhOzMiJEJwqvJ4bWzTDu9eyWQ+mhkQWnFA2sHbPfstcsam6LCE7KM5DkA5v32
 I7bygvRv4eZhi2U40xKnld5c079Ugwn0FxrDLkbROwV0T3NiFaPpfuhrMGSAuSYgCWwW
 n+8Z+fW5NS2pDCaU1xo2LA7c1/WbA4SYbYV2/87T4yP/P4zVa/a/YIOyJQIwvoua7eAS
 HZAA==
X-Gm-Message-State: AOAM532m6IL5blsoLlRwMPSOrUf9AthSnloUFWgf5MlNrn8PLRPJyRDm
 XVOavHAdmnFXsjQH8XdycqR8/HLWkAbPs2cHmkgDpbnYhUbOMq3OeqDVngy9LJvOPGKOabydAJB
 l3mqrHRQccv5Q+GHTRwN1DBRLNr86aEB++FD0gbiYJGep5nsMGeV0qWZCA+oZZ8um
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr197796wrb.255.1623778080700;
 Tue, 15 Jun 2021 10:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZWQpD2c4Cjvl4abx8Z2UJvFh/aEs2JH5oZD/NBzXEh45zCkOPf5rYgZ65z24h/MhU43rUpA==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr197775wrb.255.1623778080553;
 Tue, 15 Jun 2021 10:28:00 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m37sm14967725wms.46.2021.06.15.10.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:28:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] chardev/socket: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 15 Jun 2021 19:27:42 +0200
Message-Id: <20210615172746.2212998-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615172746.2212998-1-philmd@redhat.com>
References: <20210615172746.2212998-1-philmd@redhat.com>
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

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


