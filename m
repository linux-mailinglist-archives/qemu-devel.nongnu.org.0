Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756773A86DA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:49:37 +0200 (CEST)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCFs-0007E2-Gf
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEb-0004WK-6L
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEY-0003SN-Je
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BqsQDz0Sfnly4OiZgv7jL0lDpFa+oyKa2e4dBvkrA4=;
 b=DpJZO7EhyNGE3yCz56clD5NXI4bJ+V7NLL095EDbuwUZ2baCxVO9pOfr4BKFkTA4+TGYFX
 5QuEWLKgj7t60esrCFa80MZ+3YhZCrmj7dsdVrIkBdwRqyFuymnWmC9Fe4WOoq0VlLooTO
 6ElIYc6e1ZYY4MYuN/nM7eF2xgaTbRg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-5DPgoFuAMPCNyhglD3ogIg-1; Tue, 15 Jun 2021 12:48:11 -0400
X-MC-Unique: 5DPgoFuAMPCNyhglD3ogIg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z19-20020a7bc1530000b02901ab5fafdcb4so3297264wmi.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BqsQDz0Sfnly4OiZgv7jL0lDpFa+oyKa2e4dBvkrA4=;
 b=L+tS1aLJMYruwMjw2oqCvBDFJaQjhs+CuiwlNToiGKC6Ci7OUPlTwx8MGwMbt9FRa+
 qv8aYH8SF7h465FP7fslv0bfs8iSJ0Cr+u1qVhPtw5H9JQNNgwdBvRWy7hy048yqR+dh
 arOsXEljbl3GiE5srisVwlJ4XhAPdePFBuuNgp1uwnizCdqaG2rb3BAkIWeZMtC8VuUc
 iDq9gD5CoTjM0Oq4K+OmfeTy2tEkVGGHxa36bD3iDFtc7oUI/c2QkXBPyDKUQDt+Ng4o
 anCfnWOXg/q8LjIBb9sVDhjR349R/4d7ih70vlxNRj5nImxPUA9Fmb00aB6F1QICZLyG
 sBVA==
X-Gm-Message-State: AOAM531n49eAORiEHyXK3zv/XBXpeiJJzPr0GhgkI5gSa4YpQ/O8xXvi
 QYIwnNq7fOWxEddhjj4Qlitr7pSuLu4VbkmUopK0ZWuAOQ7izsrVGbivcwuMiX4WJyj6JK3zyuV
 sma+Libul7hmb1ShXrNyU/mBOxKvJF89urA0rbbQSa/RaZoXzS9OXWWnYSUz4Feyq
X-Received: by 2002:a1c:9dcd:: with SMTP id g196mr6338958wme.135.1623775689856; 
 Tue, 15 Jun 2021 09:48:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys79T78NUEFB1tqsmG2GoczJQb0FsKxtCJ4pxWC3AkhosUPN2HkNHIJfNiuXQ7WoSb2qQ12Q==
X-Received: by 2002:a1c:9dcd:: with SMTP id g196mr6338931wme.135.1623775689682; 
 Tue, 15 Jun 2021 09:48:09 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm24459430wrh.72.2021.06.15.09.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:48:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] migration/tls: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 15 Jun 2021 18:47:48 +0200
Message-Id: <20210615164751.2192807-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615164751.2192807-1-philmd@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 migration/tls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/tls.c b/migration/tls.c
index abb149d8325..ee49ecba484 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -49,7 +49,7 @@ migration_tls_get_creds(MigrationState *s,
                    s->parameters.tls_creds);
         return NULL;
     }
-    if (ret->endpoint != endpoint) {
+    if (!qcrypto_tls_creds_check_endpoint(ret, endpoint)) {
         error_setg(errp,
                    "Expected TLS credentials for a %s endpoint",
                    endpoint == QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT ?
-- 
2.31.1


