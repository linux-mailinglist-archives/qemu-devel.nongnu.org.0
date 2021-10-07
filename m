Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CB94257D3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:22:52 +0200 (CEST)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWAV-0003Nw-P0
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6Y-0005ux-1i
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6W-0005XJ-41
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRE3NNVTx8SI9X33FPifPWmCEg7suN8YDk0KQOEofaw=;
 b=GsZ8Az/59ZZaDLydHoDSus0pDAlHpBQsotHKEGnSJRDyIO3Vf5okgEMhnFLyAV71zVTBSh
 C06BMZzMpERv4FkIfduneQpt8SBatxcImuyItwzkjRqaoNK/0mru0vPdZxjBUzqpzo0Znc
 e1rEKKQycPB8R8bqiSyIl6tjZzkwikY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-QFPLu4qhNW-f70gGQwk-8w-1; Thu, 07 Oct 2021 12:18:42 -0400
X-MC-Unique: QFPLu4qhNW-f70gGQwk-8w-1
Received: by mail-wr1-f72.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso5147721wru.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRE3NNVTx8SI9X33FPifPWmCEg7suN8YDk0KQOEofaw=;
 b=mZjFjViFDcQdctAitlEuVNRIiBlDryQtuArlndDpFgHbn6ZrL+Yi03YcKCUmM8xHyN
 6u7RudAIW2qQf5a9m39b31OKZ9jh3DZVgPZ7yeYgehxhzupR2wvCAGWr1vTDmTzF4M2m
 Nx45odGPQp2M9b/CVMosPyNLblH7pBZZXfGXE58G1vPkcqDzV7o45whPTXleYglUnmEm
 eREooXzfGy/wHkVU/GI7Q7/5MMSj4U9I92lEeTqTZ9jy916SoN/F/nGjH/ZwwmA+WBDn
 DXnHUvNRzdBuIZPk0mPhWp+ndNgQ2LvyO7PPFhjXqcxIIM3Ohwi+GUcvbMGhPohjTG0V
 pnfw==
X-Gm-Message-State: AOAM533nL2pez3wotu+ASQWeFy+D3/MA14u+tWGo8E12Cup7dZbEGaB4
 TCtJAC9G/nTn1FjXwJDJdt4bj44RaefgPkxsAnsh4q4pSZ0El9OfMg9t+ocEeHIzAWxo6JgYwBE
 jg36Za8J+TW9tdxE4tsRQ2ITf3HWl02WMlawYPjAaeVFzcxqb8foIdlelHw3n/Ykh
X-Received: by 2002:a05:6000:18aa:: with SMTP id
 b10mr6550229wri.270.1633623520817; 
 Thu, 07 Oct 2021 09:18:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeSWibl7b2NVZJa7Vkddhan4RmMUK+An6BeboL1TOS5wajjOas8bdfopDiRz2IE0A5yVSojA==
X-Received: by 2002:a05:6000:18aa:: with SMTP id
 b10mr6550171wri.270.1633623520408; 
 Thu, 07 Oct 2021 09:18:40 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c5sm9182174wml.9.2021.10.07.09.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/23] target/i386/sev: Move qmp_sev_inject_launch_secret()
 to sev.c
Date: Thu,  7 Oct 2021 18:17:11 +0200
Message-Id: <20211007161716.453984-19-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 target/i386/monitor.c         | 31 -------------------------------
 target/i386/sev-sysemu-stub.c |  6 +++---
 target/i386/sev.c             | 31 +++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index cf4a8a61a02..22883ef2ebb 100644
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
index d5ec6b32e0a..82c5ebb92fa 100644
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
index 038fa560588..072bb6f0fd7 100644
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


