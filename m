Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3142BB6D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:22:32 +0200 (CEST)
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaT1-0007B7-C8
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEk-0002ET-F5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEd-0005g3-FV
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:45 -0400
Received: by mail-ed1-x533.google.com with SMTP id d9so7272168edh.5
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5YvbBsVLcxi9ut0yB4oLJ5mEfeOCgloSDAO20Piz2Bo=;
 b=feTcIDOI+cxoafy3hfR6ic8i1IVLM/BW0c5XbAB1CbZgZHA4RBEbdRYqK3gpx3AWgn
 jIWv0ZLnoT4gxglD0AZ5SHnsDcCzn6BOA0l4TYtDcv4fZihN6v0Js9Kww/SnOLlI+6tv
 4/BgTQNtupV8X3YIH5+rgtXiB9Dv8NtoEnx6998CELyQjsza44vyXgJRAvY/+uuubRwk
 ZdWCzWusYi1Se6tFtsS8I00j0MB2gSRF5uTab2RlKKILN6Yvtr175cjHK4UEdbPXlIJJ
 mQe/79WCOgLOfpO+BuPOcvb/xx8XYyrttnLmKiFAh/7TubfPYEpnCeqFaQvNIjJIW97r
 9zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5YvbBsVLcxi9ut0yB4oLJ5mEfeOCgloSDAO20Piz2Bo=;
 b=wR5EBPXv2UH8UjZvR9pS6beR897vOv7dgRK7cTq0dmqyEGFvtjwLlNCvXl0Wtp2psn
 Ek28jTS+Q9/5/VaF8uxjQesLb9LOFd3EB0T/Vxtk5JrI8yRh1qyuYGeHxzF4ED6W6Ibc
 PAWhh8eJ3CcaHN1MLhhfSSeWPvzLblPBx5rtXOqjHk/XH/78s1WAgQ+GypyTRx6GstHk
 7DpuS85AtG6hlI66TPtUAw4PGBmLBsUjs2RXCInszjibN5iYUuCZX4TAa5W8JkzJz4fs
 Kbi2Vvln4mq+k4tXpAKvx6+U23FQdpqDBXZBpVno4/Ui4Dl0dGVQhlfcktdLtw+aOKQn
 xR2Q==
X-Gm-Message-State: AOAM532aOcLKsn2KNxy0JFOhrXaCeE+cP6Rd9bUuF0LFiMkMecNI56jU
 n7iZdxu7FW1OxEX3NhCWQng7kr5uaWw=
X-Google-Smtp-Source: ABdhPJxKUduj+tTRbUC6CL+s9cJWQO4eCwbyXSA/8Wq+eNPzTQlFqETRQzXazcsC3e+vyAYU9lHGCQ==
X-Received: by 2002:a17:906:ce2c:: with SMTP id
 sd12mr39683803ejb.488.1634116056910; 
 Wed, 13 Oct 2021 02:07:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/40] target/i386/sev: Prefix QMP errors with 'SEV'
Date: Wed, 13 Oct 2021 11:06:58 +0200
Message-Id: <20211013090728.309365-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Multiple errors might be reported to the monitor,
better to prefix the SEV ones so we can distinct them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20211007161716.453984-6-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c |  2 +-
 target/i386/sev.c     | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 196c1c9e77..eabbeb9be9 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -717,7 +717,7 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 
     data = sev_get_launch_measurement();
     if (!data) {
-        error_setg(errp, "Measurement is not available");
+        error_setg(errp, "SEV launch measurement is not available");
         return NULL;
     }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index bcd9260fa4..4f1952cd32 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -440,7 +440,8 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
     r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
     if (r < 0) {
         if (err != SEV_RET_INVALID_LEN) {
-            error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
+            error_setg(errp, "SEV: Failed to export PDH cert"
+                             " ret=%d fw_err=%d (%s)",
                        r, err, fw_error_to_str(err));
             return 1;
         }
@@ -453,7 +454,7 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
 
     r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
     if (r < 0) {
-        error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
+        error_setg(errp, "SEV: Failed to export PDH cert ret=%d fw_err=%d (%s)",
                    r, err, fw_error_to_str(err));
         goto e_free;
     }
@@ -491,7 +492,7 @@ sev_get_capabilities(Error **errp)
 
     fd = open(DEFAULT_SEV_DEVICE, O_RDWR);
     if (fd < 0) {
-        error_setg_errno(errp, errno, "Failed to open %s",
+        error_setg_errno(errp, errno, "SEV: Failed to open %s",
                          DEFAULT_SEV_DEVICE);
         return NULL;
     }
@@ -557,8 +558,9 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
             &input, &err);
     if (ret < 0) {
         if (err != SEV_RET_INVALID_LEN) {
-            error_setg(errp, "failed to query the attestation report length "
-                    "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
+            error_setg(errp, "SEV: Failed to query the attestation report"
+                             " length ret=%d fw_err=%d (%s)",
+                       ret, err, fw_error_to_str(err));
             g_free(buf);
             return NULL;
         }
@@ -572,7 +574,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
             &input, &err);
     if (ret) {
-        error_setg_errno(errp, errno, "Failed to get attestation report"
+        error_setg_errno(errp, errno, "SEV: Failed to get attestation report"
                 " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
         goto e_free_data;
     }
@@ -596,7 +598,7 @@ sev_read_file_base64(const char *filename, guchar **data, gsize *len)
     GError *error = NULL;
 
     if (!g_file_get_contents(filename, &base64, &sz, &error)) {
-        error_report("failed to read '%s' (%s)", filename, error->message);
+        error_report("SEV: Failed to read '%s' (%s)", filename, error->message);
         g_error_free(error);
         return -1;
     }
@@ -911,7 +913,7 @@ sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
     if (sev_check_state(sev_guest, SEV_STATE_LAUNCH_UPDATE)) {
         int ret = sev_launch_update_data(sev_guest, ptr, len);
         if (ret < 0) {
-            error_setg(errp, "failed to encrypt pflash rom");
+            error_setg(errp, "SEV: Failed to encrypt pflash rom");
             return ret;
         }
     }
@@ -930,7 +932,7 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
     MemoryRegion *mr = NULL;
 
     if (!sev_guest) {
-        error_setg(errp, "SEV: SEV not enabled.");
+        error_setg(errp, "SEV not enabled for guest");
         return 1;
     }
 
-- 
2.31.1



