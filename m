Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6C42BB86
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:28:12 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaYV-0000cE-RJ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEr-0002OA-6b
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEl-0005pV-Ok
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:52 -0400
Received: by mail-ed1-x530.google.com with SMTP id p13so7490160edw.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUxbOVVYQMI1tYDBR9aoEQ+5fJqal+gmG6XqDBCXmTg=;
 b=cNLseVSwZUP3NQypSJ0gDDt20RjFW/FO0l5vsaMWQQwXUvag5kuqbKeEjo5cs436DE
 gOpJJ+5vWzt2GUl1E9R6hKPPawKBKCxcwQkeMcGUeOL+7jsacFZFnuHv7UZTMCz139nh
 nDMumZCHkHqrdDduLy5N2tJVHcFSHjXf8tB/JFuRn+cwg3cRFKOImtCZG/Dq//2lzAwE
 l1eDK/UIDxd/92HQyrLP6SmGv0karTrIs1znhY05v0hEfQSEeLnlVzi1TklGLIyeAh37
 6WlIpgygpuCaNJWSWpqWm6l0QuX3+dIQeLWWc/hfto9/9IQLG2MBb11RnbpDs9oC4hUf
 9dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KUxbOVVYQMI1tYDBR9aoEQ+5fJqal+gmG6XqDBCXmTg=;
 b=wP+urLw1SuQt+P+cPYaVmYbBYbQ1NEGBko6BhwG4Q7Ug8qq7HR2qYtl5JdS6xUVnvi
 7XVJet/r0Nw2wQzGFbNfr3YD7831kHicRBf3go/zZRohZ9XJO/eMeGlL8SzzJ4E8iXkn
 M9SzwzOuEeFkox6J6HEUD+BfdYE47ZPSiPtwdn/t36XfwIMMvtY4utLZRVobdhfWJM5+
 52l+wLZxry8WKUT7fvtauDeHGfCRdHfhfrltkxkiotPdccABnELrs4ebk6XitrNj/b8A
 FjV3/SD/QOhoeiqnwlLPFaDA3sI1E//1fcGPKimNIY2ZTHaYgaTCwbYxIK42mePr5mty
 7PNg==
X-Gm-Message-State: AOAM532tAASLg3WnckmM3SnOCTV6F/JgBshRzhDbZIN0fps0ouQ7ZkR6
 uZgYA+IFf6+LKw7u0v+a2muNtNGDID0=
X-Google-Smtp-Source: ABdhPJyS3k+736woks4OQA0L0+QRwPLXNtKZ6d/NoFt0b8sM1exQV/YIqA97bNeXZOfneN8OBN7HQg==
X-Received: by 2002:a05:6402:1910:: with SMTP id
 e16mr8032460edz.176.1634116066532; 
 Wed, 13 Oct 2021 02:07:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/40] target/i386/sev: Move qmp_query_sev_capabilities() to
 sev.c
Date: Wed, 13 Oct 2021 11:07:12 +0200
Message-Id: <20211013090728.309365-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

Move qmp_query_sev_capabilities() from monitor.c to sev.c
and make sev_get_capabilities() static. We don't need the
stub anymore, remove it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-20-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c         | 5 -----
 target/i386/sev-sysemu-stub.c | 2 +-
 target/i386/sev.c             | 8 ++++++--
 target/i386/sev.h             | 1 -
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 22883ef2eb..4c017b59b3 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -727,11 +727,6 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
     return info;
 }
 
-SevCapability *qmp_query_sev_capabilities(Error **errp)
-{
-    return sev_get_capabilities(errp);
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 82c5ebb92f..3e8cab4c14 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -27,7 +27,7 @@ char *sev_get_launch_measurement(void)
     return NULL;
 }
 
-SevCapability *sev_get_capabilities(Error **errp)
+SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 072bb6f0fd..56e9e03acc 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -466,8 +466,7 @@ e_free:
     return 1;
 }
 
-SevCapability *
-sev_get_capabilities(Error **errp)
+static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
@@ -517,6 +516,11 @@ out:
     return cap;
 }
 
+SevCapability *qmp_query_sev_capabilities(Error **errp)
+{
+    return sev_get_capabilities(errp);
+}
+
 static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
                                                         Error **errp)
 {
diff --git a/target/i386/sev.h b/target/i386/sev.h
index 529a54acb8..35e702e57b 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -51,7 +51,6 @@ extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
-extern SevCapability *sev_get_capabilities(Error **errp);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
-- 
2.31.1



