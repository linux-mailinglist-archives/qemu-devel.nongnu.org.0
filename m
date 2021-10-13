Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B342BBC6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:37:33 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maahY-0002MX-MB
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEt-0002UP-Np
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:55 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEl-0005on-8I
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:55 -0400
Received: by mail-ed1-x52b.google.com with SMTP id p13so7490082edw.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YY9bEngcjRBkEwp4l9kuLkL7/5wHfYYc6U7fQJYjvcU=;
 b=UbGZjIMIc2C4Un1LJDGDB78blunrq718EZKPs9rNvifWv7X7uTDILAj0BEHNuUoc3b
 l77wesSpIweZ3+fB6ag9fcFpdV7R9LB6oTKg+e6tZW1vL4TRtreq5uEbaJPUT4HzQVN9
 GHW4Z2nv9wzH/4Tn1wQYTKFHA78xlkp/nKz7/g6JwStwunlJekVEKYkaJFV8MjHl3Su+
 TiutjPwUC/bjXhKw6d0G7WDALiv0EUtxoav8K5Bh26c5BXV5bmGnC7XvVmmFzyuNP4aD
 JDCuVlLn2FfX8ZKh+Ob8g8z9s61RY36Jz2Fe0HvEEY9n10tlrxxxWQdgfHHkEpPuPhd2
 9zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YY9bEngcjRBkEwp4l9kuLkL7/5wHfYYc6U7fQJYjvcU=;
 b=rpQ+Sa6thOkfbPznld53BieCEPGo7tq+6IhYr988R3roOaLvCv15tHPwKTvlanU9wX
 BQHlng5VKS7CIYDyzLhSm2i6rwSjW8mfbGI9KwwaD8aqLV+YRTRYZDoEgUy8geKEz5Q8
 YXGO2iQTgDKEv+9APsvhyJYOVaJl4+clLN7Cnf24GuFGqHLiug+3c8wr2kn9cm/RfZ8P
 Q/14uXOXgtk7B+T+RegD/hiRBIQpRim6F1WgpzGC/9J+1meXaRv1YVZjSV69HbirWvCT
 lOsxwsf6KNGBTFrDF3P6ffi8R1eHwO26LRCciG+W7uLE/eFnNKYgx9ek2l3f0O8tqQxz
 Lv2Q==
X-Gm-Message-State: AOAM533DnrfPjNMbINNF6RKPBHrfi0A1R1ypyczNcCqjUVIiuMjobqTs
 BVjFYly0J8nhaRlzucaie5RtQiXUOVk=
X-Google-Smtp-Source: ABdhPJzlKJMS+5ci5g8gXVcTb245F5bgek2Ff+ixS5EjGPNaYOPS38fKgD2PJ7hkQAKOb8AxlC0/IA==
X-Received: by 2002:a17:906:998d:: with SMTP id
 af13mr36071996ejc.568.1634116065889; 
 Wed, 13 Oct 2021 02:07:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/40] target/i386/sev: Move qmp_sev_inject_launch_secret() to
 sev.c
Date: Wed, 13 Oct 2021 11:07:11 +0200
Message-Id: <20211013090728.309365-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move qmp_sev_inject_launch_secret() from monitor.c to sev.c
and make sev_inject_launch_secret() static. We don't need the
stub anymore, remove it.

Previously with binaries built without SEV, management layer
was getting an empty response:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "return": {
      }
  }

Now the response is explicit, mentioning the feature is disabled:

  { "execute": "sev-inject-launch-secret",
          "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "error": {
          "class": "GenericError",
          "desc": "this feature or command is not currently supported"
      }
  }

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-19-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c         | 31 -------------------------------
 target/i386/sev-sysemu-stub.c |  6 +++---
 target/i386/sev.c             | 31 +++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index cf4a8a61a0..22883ef2eb 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -732,37 +732,6 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
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
-        error_setg(errp, "SEV not enabled for guest");
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
index d5ec6b32e0..82c5ebb92f 100644
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
+    error_setg(errp, "SEV is not available in this QEMU");
 }
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 038fa56058..072bb6f0fd 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -973,6 +973,37 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
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
+        error_setg(errp, "SEV not enabled for guest");
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



