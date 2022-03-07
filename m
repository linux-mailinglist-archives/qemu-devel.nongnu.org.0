Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF74D0779
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:18:58 +0100 (CET)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIsk-0001Vu-03
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq2-0006WQ-73; Mon, 07 Mar 2022 14:16:11 -0500
Received: from [2607:f8b0:4864:20::c2f] (port=36361
 helo=mail-oo1-xc2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq0-0005vq-1R; Mon, 07 Mar 2022 14:16:09 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso19015179ooi.3; 
 Mon, 07 Mar 2022 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DkWCadGq3jWunLQWL70TerHXhNjwuuhn9DOc5h+GCHo=;
 b=MIqPuC+I39sCBhp5ZM3tmg3O9heypKiE7YBVHZT/JYI5e5SmGuTDtZR7fTgAQ3c35O
 NApCLguuuwM+RgctUsRCLFUOtyEAziAmjXOLXP0J08TttvS9b9wCExREs1f4JDM2Z+Rm
 tU9ZW+5DNnRdsX22PSLWBHIOjRghZd1zdI5ZVOGR6I98gP7sQCZ0HQ3TFb649Or1k46w
 dlPId/43lLH0OJt5KwoB2abCwq4Tmv+N0wUhr623b8TqSQ508uz/wKNIvKwK5LFQBSmU
 7ulBpkQFU4f2HdjicxzLS052d2YPxjuZb6WhcJw/CM0CA0Eo7BRRDvX7kP54uBxuTTmO
 feYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DkWCadGq3jWunLQWL70TerHXhNjwuuhn9DOc5h+GCHo=;
 b=MUEkRuD1ws6bjGWxIhWxCrVO5M+Z3hdyaQEfkKAZw5QiVtPGFELJe7n1GARdLdHCMf
 JDtNpjp/bDJxVagBnpzG0zf8bqKxMpZNkfBWznhGFWtMnTTBYMp9W9iPeNXRVgLLhH/r
 NYLe1p4G8JUjbvV09ow+wGVai7/lNPXH6KYbbXx8ZVskMnmzycgZQz+F+k7UJX/6uft9
 THwk5QI8OKz/GWcIZl5prHHO64faKT5OyGPdV4hM+PAQH4VkUOxkVAK288nRlUTB18Ix
 h/kIWo1MZ83ASOBMyvYM4d7JvBWOD6V91lzfBSki6XjK/PX9UYpP1x5DXfrlc6fTcUCV
 9bMg==
X-Gm-Message-State: AOAM533/xOk/aokWupFw0C8W5iJ76StdOsERUdTh5nOC7kGQ0I9eE6t0
 mqTPOBRzP5Xe3ZeOeM1G/Iq5LjTJdcI=
X-Google-Smtp-Source: ABdhPJyeMgr1OqpyhFJLL97FKIB3ZHeaopybZj38a6OKL3zhSKs94aMh1xUGvYUPO/PcGp8KvAmFGQ==
X-Received: by 2002:a05:6870:a986:b0:da:b3f:3279 with SMTP id
 ep6-20020a056870a98600b000da0b3f3279mr240587oab.297.1646680565587; 
 Mon, 07 Mar 2022 11:16:05 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] util/log.c: add LOG_UNSUPP type
Date: Mon,  7 Mar 2022 16:15:45 -0300
Message-Id: <20220307191553.429236-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing log type 'LOG_UNIMP' is being used as a way to indicate
that a certain feature is not implemented, and to indicate that a
feature is unsupported. Most of the time both cases are similar, until
you want to debug a guest that is running a not so common OS (e.g. AIX
guest in a pseries machine).

The result is that you can be overwhelmed with lots of '-d unimp'
messages of hypercalls and have to do code searches to verify  whether a
specific hypercall is something we never considered adding versus
something that we decided to not support. Note that while the first case
is eligible for further investigation the second is already settled. It
would be helpful to able to distinguish between both.

This patch adds a new log type called LOG_UNSUPP to represent this
subset of features that we are aware of and we decided to not support.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/qemu/log.h | 3 ++-
 util/log.c         | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 9b80660207..884a81495b 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -14,7 +14,7 @@ typedef struct QemuLogFile {
 extern QemuLogFile *qemu_logfile;
 
 
-/* 
+/*
  * The new API:
  *
  */
@@ -64,6 +64,7 @@ static inline bool qemu_log_separate(void)
 #define CPU_LOG_PLUGIN     (1 << 18)
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
+#define LOG_UNSUPP         (1 << 20)
 
 /* Lock output for a series of related logs.  Since this is not needed
  * for a single qemu_log / qemu_log_mask / qemu_log_mask_and_addr, we
diff --git a/util/log.c b/util/log.c
index 2ee1500bee..3e19859ab3 100644
--- a/util/log.c
+++ b/util/log.c
@@ -334,6 +334,8 @@ const QEMULogItem qemu_log_items[] = {
 #endif
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
+    { LOG_UNSUPP, "unsupp",
+      "log unsupported functionality" },
     { 0, NULL, NULL },
 };
 
-- 
2.35.1


