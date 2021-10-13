Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B057342BB73
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:25:04 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaVT-0003B0-LJ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEl-0002Fc-HP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEh-0005jH-SK
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:47 -0400
Received: by mail-ed1-x532.google.com with SMTP id p13so7488978edw.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qG5T9h7NO2czZMv3uDDpamlGY0rnV9Cus9fxgzYsPQs=;
 b=jCKg/9bJ+gMEyD8h5a6KcJznN+99sPBns1Rbe5OpWipq30atvxgxNiArKkvDsmLout
 B2kyj5lN9HEmzBUGoGimnYbbgC9L//Rs4uogN77pKSeGLDc5rvYv1RIvtZMaRBhfidVn
 s/EDvZUVMW06nmjyFxoP9GmEuOBA0vwulkm6vsxmhhVOtCXUQJQp9mE1zTeJiFzsk4Kr
 35IDBQvot/6K9fj8bSrvA9CdDEDJes1sZgK6bl3TGPuUYOKacG8gVrQEhKkC7Ojh/VYL
 jApQpI0DBM/GWxjxvSwXw2vWDKGrJSNIVy0fPvdU67vahUpOfsvSYX+5DP6Pt1spgZPx
 l6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qG5T9h7NO2czZMv3uDDpamlGY0rnV9Cus9fxgzYsPQs=;
 b=gaIoki2lUgBJA+THDBh+5UwlW9wtYAattdSPgtGx4n1KNoTLPmv2g3w+S3cLaY7X0W
 B911lm+8Ed9EmlJBuf3d7O8ebWfB4BZOcJ0ypVCWL5k8zZiBnXSBX5g92NbkWULcwAoX
 7BDo17IYx+01R3wbE0qKOb4i0HwpHgFKBKFsGiSn5vnwsBKw3PgK1QZcUr359VhMcs3v
 QbazS1262jIXWtl5CU3OTOAtQ/whjo8KZ2gFw56Oq7jOaRasJOSrJOgMQUw2NuYfAc76
 Kf3BS4VucSolWaU1reFsC5o0gKObPM7DgGmH584F0ro/lJIgPIeWcBCUO9YZ+pjrY/Ov
 /7Dg==
X-Gm-Message-State: AOAM532VxlM8zUrqvfxqkE6S+KzTE+FG19jvosrGh86sJESdea5PcNEO
 FUrrAOh/5bNUYw3Q00lrChHiIeSy+Ok=
X-Google-Smtp-Source: ABdhPJwQD41O3BL1ZfZL+R6E9g54fvLxs9W0VSZxpD0zFvaF3woDi98IQrbZsXGfQbW2hEkUGepNMg==
X-Received: by 2002:a17:906:2599:: with SMTP id
 m25mr39540449ejb.302.1634116059691; 
 Wed, 13 Oct 2021 02:07:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/40] target/i386/sev: Remove sev_get_me_mask()
Date: Wed, 13 Oct 2021 11:07:02 +0200
Message-Id: <20211013090728.309365-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Unused dead code makes review harder, so remove it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-10-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev-stub.c | 5 -----
 target/i386/sev.c      | 9 ---------
 target/i386/sev_i386.h | 1 -
 3 files changed, 15 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 408441768d..20b1e18ec1 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -25,11 +25,6 @@ bool sev_enabled(void)
     return false;
 }
 
-uint64_t sev_get_me_mask(void)
-{
-    return ~0;
-}
-
 uint32_t sev_get_cbit_position(void)
 {
     return 0;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4f1952cd32..9e3f2ec8dd 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -65,7 +65,6 @@ struct SevGuestState {
     uint8_t api_major;
     uint8_t api_minor;
     uint8_t build_id;
-    uint64_t me_mask;
     int sev_fd;
     SevState state;
     gchar *measurement;
@@ -389,12 +388,6 @@ sev_es_enabled(void)
     return sev_enabled() && (sev_guest->policy & SEV_POLICY_ES);
 }
 
-uint64_t
-sev_get_me_mask(void)
-{
-    return sev_guest ? sev_guest->me_mask : ~0;
-}
-
 uint32_t
 sev_get_cbit_position(void)
 {
@@ -833,8 +826,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         goto err;
     }
 
-    sev->me_mask = ~(1UL << sev->cbitpos);
-
     devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
     sev->sev_fd = open(devname, O_RDWR);
     if (sev->sev_fd < 0) {
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 9bf6cd1878..d83428fa26 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -36,7 +36,6 @@ typedef struct SevKernelLoaderContext {
 } SevKernelLoaderContext;
 
 extern bool sev_es_enabled(void);
-extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
-- 
2.31.1



