Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEC42BB75
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:25:05 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaVU-0003F6-H2
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEr-0002OB-IG
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEn-0005qU-5q
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id w14so7163704edv.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1UVpIl3wisL15Hw6RRnp1TioghQoJ5kaNvVSiU34d+8=;
 b=D5/jgpFsGM3FsoMLegbB2ktkTS7CDcEOYaGLJaBdG3DaIHm9QAtRRQoINTE/oNuntu
 vNzcyEvDgOBWmZQ9ULwoScsBj+acyZwSdD5J9PO5BeTvRhbQcHl+RDgBSMudmlnb553J
 3BZH4p492YzFAiGkeBrLAG9avbP107Du+vmcVCtVyLaUaC6dnBcdTHcYRHllQy+fQTNu
 BCu4hFeSSiQgRVolW0odpPd6n4HlqGN8xI9ehQkCHcu6b7tbcGYhHSHK+xkNkDiifIHK
 0jmh+tDKDje49O+5PWm8HgSaLw64jU8QEgpxQNj8LX3rFNSXt4fRvLSwvwNlv4v5vRab
 obUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1UVpIl3wisL15Hw6RRnp1TioghQoJ5kaNvVSiU34d+8=;
 b=jlv1AFBZNe+rE1qgc+cIgaJ0eBzTiSsxbCSs0PxlnkeL1ocVIeQndAYP6Rfhg1oZAi
 aQ51PqeK4OWnGakO2gcAqty3OjQkVrRWz6GR4Fwkxx2uUeR34v7ejiU/wiCBbADuwcsa
 ZpQTd8IhY9OEix3yRTBBzbiFd6/qdmSnD4ddJZT+9ph2cw8eNkvPGS5rgAXCwamOJhHm
 XXHstmtrDSU0Y5eu8t086uyF4PyJaael+LOM9EYOhdGozUs1PKQfDRzdjOWDAcYAcsAO
 ujvNUux88AgjoXN4lv3hq6YWF+n8NoJABpK0Wk2Pslxth6YgP51Qp2/k0hPzKcDqEw89
 MGVA==
X-Gm-Message-State: AOAM531M5CmsehzRc+J6LJo17Sgsw/AMvxUmicxtW/E0YxJvpoxRpkWY
 2E/g9TZlIXjn0Warw+npAK05oqgG5uc=
X-Google-Smtp-Source: ABdhPJyLExi+ipzxj2P0wFuSxeFdAd4B1+FWGQ3/Gg6TBVqBJ8SDVZAY6xqQ6aok6ycPuAZLmNtTtg==
X-Received: by 2002:a17:906:c302:: with SMTP id
 s2mr37828439ejz.499.1634116067181; 
 Wed, 13 Oct 2021 02:07:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/40] target/i386/sev: Move qmp_query_sev_launch_measure() to
 sev.c
Date: Wed, 13 Oct 2021 11:07:13 +0200
Message-Id: <20211013090728.309365-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Move qmp_query_sev_launch_measure() from monitor.c to sev.c
and make sev_get_launch_measurement() static. We don't need the
stub anymore, remove it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-21-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c         | 17 -----------------
 target/i386/sev-sysemu-stub.c |  3 ++-
 target/i386/sev.c             | 20 ++++++++++++++++++--
 target/i386/sev.h             |  1 -
 4 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 4c017b59b3..bd24d0d473 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -710,23 +710,6 @@ void hmp_info_sev(Monitor *mon, const QDict *qdict)
     qapi_free_SevInfo(info);
 }
 
-SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
-{
-    char *data;
-    SevLaunchMeasureInfo *info;
-
-    data = sev_get_launch_measurement();
-    if (!data) {
-        error_setg(errp, "SEV launch measurement is not available");
-        return NULL;
-    }
-
-    info = g_malloc0(sizeof(*info));
-    info->data = data;
-
-    return info;
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 3e8cab4c14..8d97d7c7e1 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -22,8 +22,9 @@ SevInfo *sev_get_info(void)
     return NULL;
 }
 
-char *sev_get_launch_measurement(void)
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 {
+    error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 56e9e03acc..ec874b3df8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -742,8 +742,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     trace_kvm_sev_launch_measurement(sev->measurement);
 }
 
-char *
-sev_get_launch_measurement(void)
+static char *sev_get_launch_measurement(void)
 {
     if (sev_guest &&
         sev_guest->state >= SEV_STATE_LAUNCH_SECRET) {
@@ -753,6 +752,23 @@ sev_get_launch_measurement(void)
     return NULL;
 }
 
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
+{
+    char *data;
+    SevLaunchMeasureInfo *info;
+
+    data = sev_get_launch_measurement();
+    if (!data) {
+        error_setg(errp, "SEV launch measurement is not available");
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->data = data;
+
+    return info;
+}
+
 static Notifier sev_machine_done_notify = {
     .notify = sev_launch_get_measure,
 };
diff --git a/target/i386/sev.h b/target/i386/sev.h
index 35e702e57b..9ee1429395 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -50,7 +50,6 @@ bool sev_es_enabled(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
-extern char *sev_get_launch_measurement(void);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
-- 
2.31.1



