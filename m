Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1CC4323CB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:26:11 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVSk-0005B1-4y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV96-0007kv-5i
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:55 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8v-00088B-GP
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:51 -0400
Received: by mail-io1-xd2b.google.com with SMTP id n7so16966711iod.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkxdthMQGPp9kZB9oWq7ZCkR2L8kWX3z9UnL4TGn9bM=;
 b=CI5KBPq5zOER23DtLBjNvD51J13CbeFXpn9unuHyaznDpg8/UmpecSUTayfx1OCQb4
 sHk+Qk1nd7snAWjfSS2PMXS67aeH3n49W+Tsbgt2zKhbtji0rkejDHpJmkbZyNh+u70Q
 IEgDdllRNFMMJNpB1aUsldnlgzKWPn9H3rr5v6KC7M3L8/GcvlpInjrIRzzUObkruBKG
 9XpxFcNDjf/Xs5VP8Q5RGSUyc+HeGTM1F01tSQMTKKWkrkTiN9iaNGmDeKjYCguskUl0
 Om3KS/THg64NuHllcW2TCZ4+hq7KK+pnEbYvVK81D7ExGszeD15S8czi8bKEH9JR6Uin
 +Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkxdthMQGPp9kZB9oWq7ZCkR2L8kWX3z9UnL4TGn9bM=;
 b=vR/kTxi9svWCKQCSPo1VzUdAFKk8XGz2/R/LmCoGvw04va03raEMIvgkEAEJeqa43V
 M9ePzuPD6rozQTlCup2TWhKatF8TKuCltilNRy79LA1NkUtKE5tRCy6bGN7zDJ+ShTai
 /DR17GYhtJ2uZ3NllBDV/o34n35m9cjJYSzZaepFRg7b6Gqg7+UeTeUpMJIjy0W8sckM
 6rpwJTAhD5XZI5BY6FPY32Gk0yBk8KU7Gan3Fub6fNKl1SqPs+eQhDsvydXgby7AhJf3
 8N+7C24je7kafOKdyUjzWNpUFXS1Emaz7Pxvvl7xTTDo52riCCSvrMz5x+aPeAZwS3mn
 ohtA==
X-Gm-Message-State: AOAM531oj6Jlxro8snNa92Bx9eoYw6RTq0mygQtkEZmMHoBW6KbAaQo5
 JN69IKq/5UmvZiX4iMvj5+V3IYKK2mVm/Q==
X-Google-Smtp-Source: ABdhPJwYqpmpHTrnA4dRYzmC4RMvIjsxykp0dYeSkNxeIixF5xiHdol+IdFUEewsJU089c/tAI46ag==
X-Received: by 2002:a6b:7a01:: with SMTP id h1mr14770033iom.55.1634573136394; 
 Mon, 18 Oct 2021 09:05:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] bsd-user: Rename sigqueue to qemu_sigqueue
Date: Mon, 18 Oct 2021 10:04:57 -0600
Message-Id: <20211018160458.1976-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid a name clash with FreeBSD's sigqueue data structure in
signalvar.h, rename sigqueue to qemu_sigqueue. This structure
is currently defined, but unused.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/qemu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e65e41d53d..ba15b1b56f 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -73,15 +73,15 @@ struct image_info {
 
 #define MAX_SIGQUEUE_SIZE 1024
 
-struct sigqueue {
-    struct sigqueue *next;
+struct qemu_sigqueue {
+    struct qemu_sigqueue *next;
+    target_siginfo_t info;
 };
 
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
-    struct sigqueue *first;
-    /* in order to always have memory for the first signal, we put it here */
-    struct sigqueue info;
+    struct qemu_sigqueue *first;
+    struct qemu_sigqueue info;  /* Put first signal info here */
 };
 
 /*
@@ -95,8 +95,8 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    struct sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
-    struct sigqueue *first_free; /* first free siginfo queue entry */
+    struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
+    struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
     int signal_pending; /* non zero if a signal may be pending */
 
     uint8_t stack[];
-- 
2.32.0


