Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BF3A8782
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:29:28 +0200 (CEST)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCsR-0007Yi-9Q
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrE-0004rZ-Jm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrC-0003rv-TQ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xExdDe4N+GemsTc4t2mEkAP+Zb7Tj4gyC4bIiLrVVZE=;
 b=hg4TkYzp2JS3gi3FiM4W1RHazjVQjo7nRjRsHTdqTY4zIj7zvujAk4A1JIyU4cwf/myW3L
 E7lBmDPEkJRbUUnIDV7THCHE821rSA1djKMHtrLLK5Vf2RCK+Hs6lO6UYu/4tMoRCWMelZ
 wB5ZWphjNI0tnSTWysy8THbHBvbZY5k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-ZlBlq2esPjaWnT34uFZ4mQ-1; Tue, 15 Jun 2021 13:28:06 -0400
X-MC-Unique: ZlBlq2esPjaWnT34uFZ4mQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so8944848wrc.16
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xExdDe4N+GemsTc4t2mEkAP+Zb7Tj4gyC4bIiLrVVZE=;
 b=D93XvYGQ6Y+kUGbezr/s5EQ82fNA3m8SloWyxlK21ZUo+bcUS4SyeXmP6YFT8ynub8
 WbGQ0lcCyRfEYeeNOK825fpP3m1Cpp78q+iGwbW3bQ+Z8mcsUZW+AmmjZwPU94WzJgh5
 db8cvHLEbQdHTxhRtx7O6oI4otCSMWw9bvPBzK9XYslyuDs2G0BnIlQD4cYEPWSZLhGg
 aFWX5jWSSL74kuzLQfG/X3F/WyPSdxarc9v6ouy8o+L65JCZ7dOSrCvMPlnVhhhwyGWA
 juSV+f30NyxmSTGWgCGc6Vopwwp6024RmygUbQ+2CFpaqrQ6syAzYZMYOoa40UwhGvG4
 ynFA==
X-Gm-Message-State: AOAM531AlIt0huhwJzxA0SX6fWG6ynjJdxqxpwxpj/W0z0/p64Ho+DfM
 mLfhx0NsdoHWavkvXXT/zz6ZedtduVht5hemcqz609uwk/rf932ItIGULvgYFYQ5A0tPCwkQy4U
 Yg0pO+LuvOzf4GdPsdwrkglzv9jgUkbdprAkir/Ldr0aJlKweJw5co8LQ4UJ9nEc/
X-Received: by 2002:a7b:cd0f:: with SMTP id f15mr4969533wmj.177.1623778084988; 
 Tue, 15 Jun 2021 10:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnJRJjJQbQOJLvD7kJ7YHhj7k+uyYgO74TNSkMeSILLIblRZBmFHpk6fdZXHKz8lUbeVjQ6g==
X-Received: by 2002:a7b:cd0f:: with SMTP id f15mr4969506wmj.177.1623778084738; 
 Tue, 15 Jun 2021 10:28:04 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u16sm20706326wru.56.2021.06.15.10.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:28:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] migration/tls: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 15 Jun 2021 19:27:43 +0200
Message-Id: <20210615172746.2212998-5-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 migration/tls.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/tls.c b/migration/tls.c
index abb149d8325..ca1ea3bbdd4 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -49,11 +49,7 @@ migration_tls_get_creds(MigrationState *s,
                    s->parameters.tls_creds);
         return NULL;
     }
-    if (ret->endpoint != endpoint) {
-        error_setg(errp,
-                   "Expected TLS credentials for a %s endpoint",
-                   endpoint == QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT ?
-                   "client" : "server");
+    if (!qcrypto_tls_creds_check_endpoint(ret, endpoint, errp)) {
         return NULL;
     }
 
-- 
2.31.1


