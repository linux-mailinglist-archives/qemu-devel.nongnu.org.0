Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C736B432781
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:22:13 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYD6-0003jg-K0
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXth-0008T5-Mm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:10 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtf-00020K-FQ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:09 -0400
Received: by mail-il1-x129.google.com with SMTP id g2so15998677ild.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkxdthMQGPp9kZB9oWq7ZCkR2L8kWX3z9UnL4TGn9bM=;
 b=ec1Wj0MyN58Zbz/9bzaK5NaZR44hFM1orKD/Trc4v7WqOIPEoO1MyadPM/R2/DmEc7
 zIQ70PbLo6yEWl6Of4+telQTM9Q+hF+fiMVcZpawSeRVt9+Cbssejn2qyXwdhdpNZeQn
 tcDvuxrdY/3s3a1dsKs/heG5ptsUHk7dHRPBOGA/LL/+MQmmrpnU4sMc8MaOP4+twNCb
 GwAObmBsrAOpkLgIlKipRkahnj5AVBLmzoIWO3R9e0NRqzfmTC5/D2sVKOj+lJstBZgB
 GA6YqpkhBSC+lTbRfxuaVYt9ZQLyc8wWx0vYUI68iDwH4slSjmRVo31V2DosAPgBq5R+
 MHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkxdthMQGPp9kZB9oWq7ZCkR2L8kWX3z9UnL4TGn9bM=;
 b=lLtkCY4HbCF67wslnjNAeWVxJuhA1MKGGTAOLqudlEySTWymEldrhWVgMcPyIEPI/2
 JT0bCnKYBj1JWAQvOuSlbXhChigNZTcU+oMVMVwR0L/TLqnxPDLW3XV8ctvAoUw1Vato
 lOpsTp3LV9MEbjBmXiPhZK5LJUFJw91idRFW0Hf1T32ylh0YwB+G62rjjH5czBcjpOeg
 vOqj7UaSm/tgaM1++MOQnFMA4sLdtJYWQ/2T6JOrA5H3Dh1xkfJyNCUgUESentFIbxcI
 Ti3AQanzWUb2fcT/8QiraYnSQD+f/RuhJFAh4T0g7Oouho4dZrX3eCWUtGm1umxp68qd
 oIxA==
X-Gm-Message-State: AOAM532wMDv614WS31r+AZ4pwWExzHGUdac6ZG6bRYKEfLhRcJhOsSfi
 u6AYlB0Bb65cJjr17i/gttyK35M9qCwM6Q==
X-Google-Smtp-Source: ABdhPJxmG7AyVf0NLM0ZKLoQKdc5JxvGGaxzGPD0mED0Wh4xcCVB0XIMj0y28cEDAp6SB7O4IRulCg==
X-Received: by 2002:a92:c545:: with SMTP id a5mr15666585ilj.172.1634583726212; 
 Mon, 18 Oct 2021 12:02:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:02:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/23] bsd-user: Rename sigqueue to qemu_sigqueue
Date: Mon, 18 Oct 2021 13:01:14 -0600
Message-Id: <20211018190115.5365-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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


