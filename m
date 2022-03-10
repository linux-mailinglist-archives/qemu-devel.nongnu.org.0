Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4A44D475B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:54:30 +0100 (CET)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIJJ-0001lv-KS
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:54:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9i-0006jF-5b; Thu, 10 Mar 2022 07:44:35 -0500
Received: from [2a00:1450:4864:20::32a] (port=53065
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9g-0005CW-Jy; Thu, 10 Mar 2022 07:44:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id r65so3176159wma.2;
 Thu, 10 Mar 2022 04:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kYPdnwd+qK4GoFiw8vkRkI9044PfsGfCMHgYYSi6n+s=;
 b=Asl0ewbfMM/ukbbWMQbuxiZ4CmtB6grkbCF0bE1wc/DDROVXwtciEPwh/YshY7E8R5
 2w1wMOPTK+I8eZbAswwSyJjW6kWRTPucFKe9LiSBfz51jITrhaD5cz3XCgUi4iiJsmmY
 WehpaQ/Llmemi+XBDmvfCJC6U4vxp7WDVBjSJ1HCyBGrO0gT0nCkizvvUJyts3Tvmc2F
 7H1BClk1OCH8L/tDieSxI4xpP2pXW4ZRIuXlXd7gBMuUKdl7asHyMUlPJ5fdTHLwvcYI
 FwCHlnmJhxYxr1LVQmqvEN+Y7PoKrcxWEDFZBsdR/z/Sr9orU4fU7NAkEq7Lks62V53l
 xndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kYPdnwd+qK4GoFiw8vkRkI9044PfsGfCMHgYYSi6n+s=;
 b=PWPap2MUvSYxlHDIU0+E6PtXRGdHWDJhYwBMiHrsOIXZ/mekLeGPcMqTcDvv8x1NHh
 atyRQaA/C1nlhncF8qssn77Sx9PqUZcCVZgqMbfKwQPBIQWUihj7r03jT54oIzUqjvqK
 OrbwblmI2P4+PeyOnVAqkjs9I5TVh2rEyGKQJpv561g2Pqt1iOcFa0oSJPd1o+yLSy28
 3BLNVFauWoAbxv1sLpaMCyHHfaInVM5RwnIbF/rwkjZCPvNEODf6LrX7ZrwSKalMsIsq
 NmTi9tSsuN4g5o4C4mSQIcRVwLUcfY/nDrwYNmtqNrQicY07VmoVNpMIQilMt6ofrufl
 2dxw==
X-Gm-Message-State: AOAM531STM1AVuPs4Oo3196+N+nIFBRcCvJduh67pG6uFAt+yNZ1wLjc
 lpXWVelnx1GR5oW2O4/pPGV2K+XCB+8=
X-Google-Smtp-Source: ABdhPJz0BRZe04EGV6byPUns9Gb4AQ4WOgNMXzkT2bMr5qtAAxcea2CHbqZk99mQG/5kchrfFBuzcw==
X-Received: by 2002:a1c:e90a:0:b0:381:504e:b57d with SMTP id
 q10-20020a1ce90a000000b00381504eb57dmr11536979wmc.177.1646916270938; 
 Thu, 10 Mar 2022 04:44:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/35] define magic macros for stackless coroutines
Date: Thu, 10 Mar 2022 13:43:50 +0100
Message-Id: <20220310124413.1102441-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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

Because conversion to stackless coroutines is incredibly repetitive,
define some magic variable-argument macros that simplify the task:

- CO_DECLARE_FRAME() declares a frame structure, with a couple common fields
  and the extras coming from variable arguments

- CO_INIT_FRAME() allocates the frame structure, builds it using any arguments
  provided by the user, and continues with the second part of the
  awaitable function that takes the frame as its only argument

- CO_ARG() declare variables and load them from the frame structure.  It
  uses typeof() to avoid repetition of the type of the variable (it is needed
  only twice, in CO_DECLARE_FRAME() and in the declaration of the user-visible
  awaitable function)

- CO_DECLARE() also declares variables using typeof, but it's for locals that
  are not prepared by CO_INIT_FRAME()

- CO_SAVE() and CO_LOAD() copy to and from the frame structure

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 2f2be6abfe..df148ff80e 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -361,4 +361,45 @@ void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
 void *coroutine_only_fn stack_alloc(CoroutineImpl *func, size_t bytes);
 CoroutineAction coroutine_only_fn stack_free(CoroutineFrame *f);
 
+
+#define CO_DO(MACRO, ...) CO_DO_(MACRO, __VA_ARGS__, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+#define CO_DO_(MACRO, a0, a1, a2, a3, a4, a5, a6, a7, a8 , a9, n, ...) CO_DO##n(MACRO, a0, a1, a2, a3, a4, a5, a6, a7, a8 , a9)
+#define CO_DO0(MACRO, a0, ...)
+#define CO_DO1(MACRO, a0, ...) MACRO(a0)
+#define CO_DO2(MACRO, a0, ...) MACRO(a0); CO_DO1(MACRO, __VA_ARGS__)
+#define CO_DO3(MACRO, a0, ...) MACRO(a0); CO_DO2(MACRO, __VA_ARGS__)
+#define CO_DO4(MACRO, a0, ...) MACRO(a0); CO_DO3(MACRO, __VA_ARGS__)
+#define CO_DO5(MACRO, a0, ...) MACRO(a0); CO_DO4(MACRO, __VA_ARGS__)
+#define CO_DO6(MACRO, a0, ...) MACRO(a0); CO_DO5(MACRO, __VA_ARGS__)
+#define CO_DO7(MACRO, a0, ...) MACRO(a0); CO_DO6(MACRO, __VA_ARGS__)
+#define CO_DO8(MACRO, a0, ...) MACRO(a0); CO_DO7(MACRO, __VA_ARGS__)
+#define CO_DO9(MACRO, a0, ...) MACRO(a0); CO_DO8(MACRO, __VA_ARGS__)
+
+#define CO_FRAME1(decl) decl
+#define CO_SAVE1(var) _f->var = var
+#define CO_LOAD1(var) var = _f->var
+#define CO_DECLARE1(var) typeof(_f->var) var
+#define CO_ARG1(var) typeof(_f->var) var = _f->var
+
+#define CO_SAVE(...) CO_DO(CO_SAVE1, __VA_ARGS__)
+#define CO_LOAD(...) CO_DO(CO_LOAD1, __VA_ARGS__)
+#define CO_DECLARE(...) CO_DO(CO_DECLARE1, __VA_ARGS__)
+#define CO_ARG(...) CO_DO(CO_ARG1, __VA_ARGS__)
+
+#define CO_DECLARE_FRAME(func, ...) \
+    struct FRAME__##func { \
+        CoroutineFrame common; \
+        uint32_t _step; \
+        CO_DO(CO_FRAME1, __VA_ARGS__); \
+    }
+
+#define CO_INIT_FRAME(func, ...) \
+    co__##func(({ \
+        struct FRAME__##func *_f; \
+        _f = stack_alloc(co__##func, sizeof(*_f)); \
+        __VA_OPT__(CO_SAVE(__VA_ARGS__);) \
+        _f->_step = 0; \
+        _f; \
+    }))
+
 #endif /* QEMU_COROUTINE_H */
-- 
2.35.1



