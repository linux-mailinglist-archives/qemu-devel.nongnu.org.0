Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651313B667A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:13:43 +0200 (CEST)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxttG-0007Cj-4x
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpP-0000YM-2c
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpN-0001y2-6j
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TD8DXvgsYWHHJcVzYutELY0M+7fBmJca4T5Y2PtlOCw=;
 b=hXDIMTW+wlqsoj77EveTEc1v10GeR2Zgx3jYFLYbEL6HE4YE2quPJY4OTh5tM2Amjof5KG
 tG0Q0T2y6ZMwEOMMUI5i0TBTzH1J8PN+kPxgE92c0namcZts7tsjD9Ls4ltDjgrhJ8oV5v
 yOHMoyDUmncizcvJK2+v53UXTlTLD1M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-UdrsGseiObiE-fxZYHZDZg-1; Mon, 28 Jun 2021 12:09:39 -0400
X-MC-Unique: UdrsGseiObiE-fxZYHZDZg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l6-20020a0560000226b029011a80413b4fso4779631wrz.23
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TD8DXvgsYWHHJcVzYutELY0M+7fBmJca4T5Y2PtlOCw=;
 b=r+KEI8Q0FBwsNgRkqrlL+UwmI8+w9q4s9ZzhP3m0gr/iPI0p/pvlydqkFBGIEsMT3E
 Xc0NPCgkSZLD1NQHpqCib7/RfQBibKJWnqBS4vEzcGNzKX8iPxf0owIEI9AFf9NiuFU4
 QKjt7vN12T0O5H1alB2gO5xcK5cOP51GGDgSK8Ci8GSj+CC+4eY2GpCV5An+WmoFD+y9
 3GPxtoHs2/wLO+D2Ka2Xcr8Tc9UQA8UNNACXOvtFKvOCE+QDIyrQ0oQ9YJWA0VyWdFZL
 gjr7QMMtmBKurGhSZuo2LFoqKqqlZ8P9EL3AuFy10v6h/1UalPdsU9yOmMtU6b5pD1gP
 OKHw==
X-Gm-Message-State: AOAM532XEhdFqifPnSj4sbGZvx2Udtea9a/mVDIY7otWXIQS6wnIiCdr
 NSjTyPDVBcgjaG0N+/ODbFr20eFnXlwdcSR8TwI/T+CDc+V5dOev7VGGVf4ztO65L6XnBxt4Jtp
 tGsvM8cGODUyvtDXUa/lfE4ccLKT4A0RXzUSOKEjHE+ywLH8y3TGPDKO+NhbnDN3A
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr5556214wmi.18.1624896577967; 
 Mon, 28 Jun 2021 09:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypc3fmtal7SMGzFkjDJxNHml8cOxCAVRvW7WysYppdS4UPTDdJlhkl0TQtARgOisEjwJqzYg==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr5556196wmi.18.1624896577840; 
 Mon, 28 Jun 2021 09:09:37 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c16sm6794852wmr.2.2021.06.28.09.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/7] migration/tls: Use qcrypto_tls_creds_check_endpoint()
Date: Mon, 28 Jun 2021 18:09:12 +0200
Message-Id: <20210628160914.2461906-6-philmd@redhat.com>
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


