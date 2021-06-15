Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE23A8781
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:29:19 +0200 (CEST)
Received: from localhost ([::1]:36240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCsI-0006yz-5Z
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCr4-0004MJ-91
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCr1-0003lM-Ni
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUQdFiF4I9usEoqcWuw9jovz2j6QkV4ypfDpy+yQNBk=;
 b=iqG6hE6k6aIbnT+xB1knx/5imPu3RyRDX/34GPgzQsqKOmpp+dgQJgEzJVwNvyjGPWzzr8
 ZVCAQKb+TT2QClIxoWnblo0AefX5YGKGOEtPQsraCp/bmaTjvjqP8p6hpk+o1QDd5kycEP
 rM7wYktURh+1l/AM3zQgMODsDOcWku0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-Ack1We8-NNmzJtlPRgFPNA-1; Tue, 15 Jun 2021 13:27:57 -0400
X-MC-Unique: Ack1We8-NNmzJtlPRgFPNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso8929281wrz.21
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUQdFiF4I9usEoqcWuw9jovz2j6QkV4ypfDpy+yQNBk=;
 b=hzgD0x3b/i+9Jvm8qcGqYwaxi6R8GprOZawkydb+tZPdGyqphP522sRd9r+rX8eFlH
 Rd/FVibIM1GpWlPG04YL6S96yRXAEhPWiajAR9kXihJ1H829S+1EgcwyRMebs/aYC6pk
 JSIjcqfABu94IXnrQLPLAFNh5qDJcgh99VdE5tM3akAvza/raqLtkdBlg3vxySH0hcCE
 1f8UIVVtouPqUYegFV9G0g5jyqbk9GrE0R4JJVT8WG7lE0rJT+QNUCexaZoJ8qb+X9lV
 bOChI0CVdp24ooPTA90n+YBzkFCAJwvTEufYweCAAqd/+MZ+/gQbZSw3f3GYbZYn9UMJ
 FXuw==
X-Gm-Message-State: AOAM530UryWhGZBGl5ll9OSGDYY0gCkc+e9ldbd+p+RjFuelChrvqFHC
 MHvi3WYrfe4+rfA/X4HuIWGvtRqt2H1z8TX7B3YE9mrDFQjBsic3/EXDpKGCS7HEnViwVzKJlGs
 F9Qg8d8fkLzL8Cv5CtW7tnOzByFfP/TGxKOX8AEiJE5bgPCgouZsPjueBH79CY1uv
X-Received: by 2002:adf:f98a:: with SMTP id f10mr206645wrr.143.1623778076519; 
 Tue, 15 Jun 2021 10:27:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD25luI6BaUq5O8xs92TydzlNAefUIpxoQMfdTIII8D2KVHpx/IPA8Cua+hFqqcyFwCS6wWA==
X-Received: by 2002:adf:f98a:: with SMTP id f10mr206622wrr.143.1623778076323; 
 Tue, 15 Jun 2021 10:27:56 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q11sm19148396wrx.80.2021.06.15.10.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:27:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 15 Jun 2021 19:27:41 +0200
Message-Id: <20210615172746.2212998-3-philmd@redhat.com>
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
 block/nbd.c    | 6 +++---
 blockdev-nbd.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 616f9ae6c4d..b13a33c3d21 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2159,9 +2159,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
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


