Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C264D486D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:54:14 +0100 (CET)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJF7-0005vv-GL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9w-00070W-4v; Thu, 10 Mar 2022 07:44:48 -0500
Received: from [2a00:1450:4864:20::42e] (port=43708
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9u-0005Fm-Kj; Thu, 10 Mar 2022 07:44:47 -0500
Received: by mail-wr1-x42e.google.com with SMTP id e24so7741802wrc.10;
 Thu, 10 Mar 2022 04:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGeLsc1tiwY5zvvykmKyG+fpxXYhOiE3qnbOz5EEzZU=;
 b=lS51fVdlamqPf8gCxarVVLNw/JJw4Tv21egUAtQRxHBRumlwkP3CnZQMeUuAu5np3C
 QlCuaeCKLfO88WDhKfg1ANz6BVSzvaKHFHtITsWeFKNZX9NY2xzAvY/I1vr6zBuPOoA3
 oeqZ1XUvSr5aYkA1sYDXVEnaJD4qZNvFXsuTaYBXE7jwwLbux4U8fdf0WBU2ghftnC8g
 NERZeM53vXwaDjQldittxGhePIry3aPKopb/OgKMt0zZPU1P2FDc7IOO0cg+ieVnZhlS
 l7Q+egiE5gZEcjBaIUO3SswhNJ0/JCt21npOj//a5+y9R94wcaWR0wdSUUFxkORlgSkz
 MEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gGeLsc1tiwY5zvvykmKyG+fpxXYhOiE3qnbOz5EEzZU=;
 b=2MbwnoBCd+wnzggv6Cj3jYpvdTd1Apd6/awbY0/ryvFQb9xis1wxS6jcYwch8GcPpG
 zrCbY36SJUma6j9f7eXcZxbLgyzsp5BcbnWZR2phrs+wxMKdi61xqrz27r4Ukt/vyry4
 GYMnbM80zCX6VNRYIXThtibEMXjxIqXrwmHSzP/q2OXxUFcqilBEhfzZVPJyZj1OhmDg
 5odNE75VpCi5QSN+47IgNwt5FSeYgGEchDsdVbo7eNA0sXMtPNJFQxrmD58Kjc1s9RhZ
 qBhlYyHAirDrZkVk/hBwodFPRCBplOtyqy3Eg+a/LWPQn4kgecjDbnLZBCMAxPO98eqn
 Be5Q==
X-Gm-Message-State: AOAM532VnRTH63Af9q5MPOkLh/EnY0hQGBOB/xh5NO5+mKS6Vwsi+lWc
 O5bPww1r8FxGJlQk+LPaMyYqGcSVn8U=
X-Google-Smtp-Source: ABdhPJz326tMO7tWs8jU4G/ZCps+GNyKSz0k89un2m0kRXiTaonc/UnsyDFxrKYT6+XJdSrq4/XZ+A==
X-Received: by 2002:a05:6000:1786:b0:1f0:36a5:e573 with SMTP id
 e6-20020a056000178600b001f036a5e573mr3440820wrg.428.1646916285089; 
 Thu, 10 Mar 2022 04:44:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/35] /perf/cost
Date: Thu, 10 Mar 2022 13:44:01 +0100
Message-Id: <20220310124413.1102441-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index c44287bcb0..080ee76dde 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -708,10 +708,25 @@ static void perf_baseline(void)
     g_test_message("Function call %u iterations: %f s", maxcycles, duration);
 }
 
-#if 0
-static __attribute__((noinline)) void perf_cost_func(void *opaque)
+CO_DECLARE_FRAME(perf_cost_func);
+static CoroutineAction co__perf_cost_func(void *_frame)
 {
-    qemu_coroutine_yield();
+    struct FRAME__verify_entered_step_2 *_f = _frame;
+
+switch(_f->_step)
+{
+case 0:
+    _f->_step = 1;
+    return qemu_coroutine_yield();
+case 1:
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction perf_cost_func(void *opaque)
+{
+    return CO_INIT_FRAME(perf_cost_func);
 }
 
 static void perf_cost(void)
@@ -737,7 +752,6 @@ static void perf_cost(void)
                    duration, ops,
                    (unsigned long)(1000000000.0 * duration / maxcycles));
 }
-#endif
 
 int main(int argc, char **argv)
 {
@@ -772,9 +786,7 @@ int main(int argc, char **argv)
         g_test_add_func("/perf/nesting", perf_nesting);
         g_test_add_func("/perf/yield", perf_yield);
         g_test_add_func("/perf/function-call", perf_baseline);
-#if 0
         g_test_add_func("/perf/cost", perf_cost);
-#endif
     }
     return g_test_run();
 }
-- 
2.35.1



