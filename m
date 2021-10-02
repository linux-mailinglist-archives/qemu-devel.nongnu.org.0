Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772341FC2B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:17:30 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWetN-0001EP-MU
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXA-0001yh-Pw
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeX8-0000vT-IU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFPED/lWL7McgnfaLMNLaFFcTGfU944hsrHyvaxNr8c=;
 b=elrNA/5n3qpS8hFD1pJVQ+uCmaTrTB1sWENsYLHh3ooEekyrgXwUtyDOX+4UOr+lvGzt/w
 Zsxc3/QEkjP/RxLlCqJkrT86R+TjM/+eW4KokvT/rtbCrCE9HnoC4MIEn2AGmQY8suzAvo
 r9kiaZXBd5JYFtSjZ7gIupvoNFAWI2I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-tnPiqOHpO_iPvYhsOQ9Dug-1; Sat, 02 Oct 2021 08:54:29 -0400
X-MC-Unique: tnPiqOHpO_iPvYhsOQ9Dug-1
Received: by mail-wm1-f69.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so3791524wms.7
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFPED/lWL7McgnfaLMNLaFFcTGfU944hsrHyvaxNr8c=;
 b=DjM1qPA0xsxa/kisxudAdMNC6mCMZ+Cs5zb+NxC5cmoTp4bFjyfD09cZgpp/4slnVx
 XzU2C6blQ9Zjv8zLU4AEhDbqdE2kf8lVikpYtfOA6fNtDEJw/7Gxa2F1eWFZgZAoSR3m
 mSljk3Kd7ys8fe6eLAeqp7oL9bkus2ZZvNmQHeohrBWOvn11/Rq1X0oEy76HFrsBFsng
 bNap5geURKl41MEFZERv2uUvyQXEY/DNhDUZbY788zXJ6cWJQMQHeFH4Ixhwh6eX1Qol
 3DNvQUzbIH6CZtC6y0CdYEjv8owBxpFDrqHOPzI/KjBxCvxJ018dm7zVxWj+eulAaYdV
 g0rw==
X-Gm-Message-State: AOAM532Vkk+nj7NSi50ngDx3BEUa3Ej42OR6B58aGPrbjOlK7hasMglW
 WFrVVd5SqO1p9Ba872zmkMbxx0n34gKkJ5qz0sZu0x46puXNJIAXBd3WvH41V8Yfs4dNypwf6h4
 TNjHGce8+EPin+nv2h+HPWXwSuem+pP/Suncbs7g8/gdWbFqT6USeT/pIC8rG1EkU
X-Received: by 2002:a5d:608e:: with SMTP id w14mr3315480wrt.119.1633179267235; 
 Sat, 02 Oct 2021 05:54:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1NL6M/YsdfSGb125vbKkdnK0ovBHXMOfTrj0Zv4qPiwD4uvPRl8NF6jMFLf6uS8Tsr9ze6A==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr3315454wrt.119.1633179266991; 
 Sat, 02 Oct 2021 05:54:26 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j7sm9971641wrr.27.2021.10.02.05.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/22] target/i386/sev: Move qmp_sev_inject_launch_secret()
 to sev.c
Date: Sat,  2 Oct 2021 14:53:10 +0200
Message-Id: <20211002125317.3418648-16-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_sev_inject_launch_secret() from monitor.c to sev.c
and make sev_inject_launch_secret() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c         | 31 -------------------------------
 target/i386/sev-sysemu-stub.c |  6 +++---
 target/i386/sev.c             | 31 +++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index c05d70252a2..188203da6f2 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -733,37 +733,6 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
     return sev_get_capabilities(errp);
 }
 
-#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
-struct sev_secret_area {
-    uint32_t base;
-    uint32_t size;
-};
-
-void qmp_sev_inject_launch_secret(const char *packet_hdr,
-                                  const char *secret,
-                                  bool has_gpa, uint64_t gpa,
-                                  Error **errp)
-{
-    if (!sev_enabled()) {
-        error_setg(errp, QERR_UNSUPPORTED);
-        return;
-    }
-    if (!has_gpa) {
-        uint8_t *data;
-        struct sev_secret_area *area;
-
-        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
-            error_setg(errp, "SEV: no secret area found in OVMF,"
-                       " gpa must be specified.");
-            return;
-        }
-        area = (struct sev_secret_area *)data;
-        gpa = area->base;
-    }
-
-    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 813b9a6a03b..66b69540aa5 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -33,10 +33,10 @@ SevCapability *sev_get_capabilities(Error **errp)
     return NULL;
 }
 
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp)
+void qmp_sev_inject_launch_secret(const char *packet_header, const char *secret,
+                                  bool has_gpa, uint64_t gpa, Error **errp)
 {
-    return 1;
+    error_setg(errp, QERR_UNSUPPORTED);
 }
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 91a217bbb85..2198d550be2 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -949,6 +949,37 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
     return 0;
 }
 
+#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
+struct sev_secret_area {
+    uint32_t base;
+    uint32_t size;
+};
+
+void qmp_sev_inject_launch_secret(const char *packet_hdr,
+                                  const char *secret,
+                                  bool has_gpa, uint64_t gpa,
+                                  Error **errp)
+{
+    if (!sev_enabled()) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return;
+    }
+    if (!has_gpa) {
+        uint8_t *data;
+        struct sev_secret_area *area;
+
+        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
+            error_setg(errp, "SEV: no secret area found in OVMF,"
+                       " gpa must be specified.");
+            return;
+        }
+        area = (struct sev_secret_area *)data;
+        gpa = area->base;
+    }
+
+    sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
+}
+
 static int
 sev_es_parse_reset_block(SevInfoBlock *info, uint32_t *addr)
 {
-- 
2.31.1


