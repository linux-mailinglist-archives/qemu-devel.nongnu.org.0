Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AC4D479A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:03:25 +0100 (CET)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIRw-0004Fl-MC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:03:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9t-0006vb-5O; Thu, 10 Mar 2022 07:44:45 -0500
Received: from [2a00:1450:4864:20::32b] (port=33830
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9r-0005Ee-Lb; Thu, 10 Mar 2022 07:44:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso4092248wms.1; 
 Thu, 10 Mar 2022 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Ijv45d7frV8RtMMOtg6s/7AI2S2ZexSVTc9afgZNFg=;
 b=qZjGYBp+IgwE83TsDq/liN0yL4g7Pe3hYtefAY7JslSiOC+AVkL0Xr6ZeX2CeRfund
 5XPN6XSCVkFI+6Lnj72S3gQ4YlWDB4ZLoMklxr/dTyukXxOAwFpdQ/jOZyu3Z6GpJdjj
 hMJdQ2RPZnMFEA3Lh8IHqoSg6/ab/B/Z5Z4Y9lMpfSz39AwVY2AKswOjgkRUFFWktazp
 Mc+4kKD8gz6Z5WgdF2RNg9Qtek4jo42iUomrcfAFoyYHgpeP6l+s837rRE7+f6aWljlD
 SsNutnCWj4tUWm8lh6KL+lXQsrw1eflQcAytnvnAn/+3RFUSZVYgSP8Qad9lkBZAp82b
 a05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8Ijv45d7frV8RtMMOtg6s/7AI2S2ZexSVTc9afgZNFg=;
 b=KkjT8Ez+c5Bgqgbl0aQw5WptPLKzlNGXIL80qr3CXh1mGLMGF9V2wOPtRmsSEVMXOf
 BPomcOoExy8XxjMlXKyevTGdwGd5SYw2PIdP+qbvT6m1DiNhJWWYHZSQOgyRLG45GCOq
 21MePtghhqFoY6tmsvIj38XlhWUfhH8uWykZ2iXZg49bNxA8U5E/ZFue1aOqKPL9ac5O
 AoRteBFE2ybE6avDmptyQd/ko4bSGC5+ENDibySs6O3ggitq+kNdVZ8alTjbeN0WKXfB
 KMPv3cm6zH28S8tRSw0e3uh+M2F5A4+tmV/ZtTq08j18s0n3C6IYoeBFYCMLDOCB83JK
 GIqQ==
X-Gm-Message-State: AOAM532t+wCNqKlNNa9v+Lf+Okiau59WhHYSk1ZRJEFjdaARofAEScgx
 5KnK5gNab6kifs7d/faAHLkJvwp6khg=
X-Google-Smtp-Source: ABdhPJzpKekIhRMWUg4RutngiEvxOuhh6Kq97EXmrEyWU0N/7IrYY7ROBGx7aeHLRgo/+0VKktoiTw==
X-Received: by 2002:a05:600c:2c49:b0:384:7202:358e with SMTP id
 r9-20020a05600c2c4900b003847202358emr11661443wmg.108.1646916281975; 
 Thu, 10 Mar 2022 04:44:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/35] /perf/yield
Date: Thu, 10 Mar 2022 13:43:59 +0100
Message-Id: <20220310124413.1102441-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
 tests/unit/test-coroutine.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 75d54e5d29..0b7b4d6ef8 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -639,19 +639,33 @@ static void perf_nesting(void)
         maxcycles, maxnesting, duration);
 }
 
-#if 0
 /*
  * Yield benchmark
  */
 
-static void coroutine_fn yield_loop(void *opaque)
+CO_DECLARE_FRAME(yield_loop, void *opaque);
+static CoroutineAction co__yield_loop(void *_frame)
 {
+    struct FRAME__yield_loop *_f = _frame;
+    CO_ARG(opaque);
     unsigned int *counter = opaque;
 
+switch(_f->_step) {
+case 0:
     while ((*counter) > 0) {
         (*counter)--;
-        qemu_coroutine_yield();
+_f->_step = 1;
+        return qemu_coroutine_yield();
+case 1:
     }
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction yield_loop(void *opaque)
+{
+    return CO_INIT_FRAME(yield_loop, opaque);
 }
 
 static void perf_yield(void)
@@ -672,6 +686,7 @@ static void perf_yield(void)
     g_test_message("Yield %u iterations: %f s", maxcycles, duration);
 }
 
+#if 0
 static __attribute__((noinline)) void dummy(unsigned *i)
 {
     (*i)--;
@@ -755,8 +770,8 @@ int main(int argc, char **argv)
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/lifecycle/noalloc", perf_lifecycle_noalloc);
         g_test_add_func("/perf/nesting", perf_nesting);
-#if 0
         g_test_add_func("/perf/yield", perf_yield);
+#if 0
         g_test_add_func("/perf/function-call", perf_baseline);
         g_test_add_func("/perf/cost", perf_cost);
 #endif
-- 
2.35.1



