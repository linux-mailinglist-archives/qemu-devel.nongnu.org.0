Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9523AB42D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:59:54 +0200 (CEST)
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrcf-0008UQ-EC
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqz0-0005tx-3e
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyy-0008CM-9s
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623932331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TD8DXvgsYWHHJcVzYutELY0M+7fBmJca4T5Y2PtlOCw=;
 b=gKBSTHYcxsCaeEw0acsw2rQZBSipBUzqtKuZNqwbfu4eLuRtvFQCGa74XWogFas7kZysfG
 vIdraaxYf6D4oYitdj9PajU1OmfFyxrCw5UN+imEJS/ciOiqbFcHTuYMLx5NOSa+4AA6Fg
 e6n6jVCHAjI9X7LFGCmVzbh0sg1qyqU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-gXKcXld6Nzy3LujHfb6arw-1; Thu, 17 Jun 2021 08:18:50 -0400
X-MC-Unique: gXKcXld6Nzy3LujHfb6arw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so2857266wrq.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TD8DXvgsYWHHJcVzYutELY0M+7fBmJca4T5Y2PtlOCw=;
 b=ptRVWVYN9e+z0FzNGujB5GJi1WoJwWULuecgzJBSEJorj8QqR2GeRvwUxZRn4CTn7i
 z33KQcFnRtpg1WNhPKAxqzS06LKswo7iQYntNwadun7ga9tmyDUg0ErXcu6lmgdGq6mY
 CE1eh606+kvBdYzj3AaQXTeGyTJdP4ynE3kEJphj22t42/j6yX7fPH1nBPgLtcdrmTLg
 lQ0men0T8iHZeZSTiPthOrCQjjHQRP9p8nQBoWni4rGDvck4sM/ENtTj02wNQkIDf6PW
 AD/fYxnv14svHEbp5O7o27/5tF2yQNY8LQXwjMefxAhgZp4j2pvfRXNoEuwVYpl5y3q5
 IPnQ==
X-Gm-Message-State: AOAM532S/SWHE36h6XMw7es0guSkgIoQkxmzMBtVxBMRJ8DUlXVDCu9E
 Y0XsGcwt/YkbwwY7hTM62s9OtgSNL7t+QdwZJaWa6+cjd7EDANCfKP0Y+v0POuQsireiBwIh4b4
 OKRACOdubb7RQAnjA9Osjh1CYCkhv7926IFdUl6zQG4SZX9uzTPD4LZNSsu+1yGMJ
X-Received: by 2002:a5d:414e:: with SMTP id c14mr5230787wrq.81.1623932329320; 
 Thu, 17 Jun 2021 05:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdMv7ynk6ZaXehHFDJKxanXP6W7zmu7S79z8FQx8V6JiTJrB3ZjCP9Wzn7h+D97bUmthJSTg==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr5230765wrq.81.1623932329135; 
 Thu, 17 Jun 2021 05:18:49 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c13sm5444582wrb.5.2021.06.17.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:18:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] migration/tls: Use qcrypto_tls_creds_check_endpoint()
Date: Thu, 17 Jun 2021 14:18:28 +0200
Message-Id: <20210617121830.2776182-5-philmd@redhat.com>
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


