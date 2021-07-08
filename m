Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB043C183A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:34:56 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XvL-0005Yo-GY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTM-0005cH-Ec
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTL-0007t9-38
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k4so2120092wrc.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06fODHnOvzWlfm3lWDa9KOUtGX7KBCUbsCfg/kBJZ3Q=;
 b=Sp9bjfCKSMGJOYc+Jfzg3kyE+Yl3FeM6rIxpPwzWgcMuHTziW2SqEHGWVNfYo8wGEX
 weinmwioKU5cM/Z7qAApvAuzYs489DcWS2gnOSE+EolzQSD7iFOdEZiYKMaLeESROakq
 PNUZceV08CqPwGoYjmB6yMDBMtc2fY4/K42rS9Rlik6RQCjFPR0OSSpNGzHTfKyn6VNb
 z/B6GqUO5UzQfTLvlXopYAmPbzrI/TxKffi2jh5rBmE4qN1rlDxv5+YAb3efkCMiilC3
 OgxaVy62MShtRrDUSKEQcNl78qPGwowBohjQbt2HybCtULVnS7jtsDFXsLdYN1ltk0yP
 mYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=06fODHnOvzWlfm3lWDa9KOUtGX7KBCUbsCfg/kBJZ3Q=;
 b=p6Q9qxLwyIab6J8/lTuWzzoo9YyDF+Z6pw5aYf/DeHWjUPR7TVsH8jWegYtHrAfzQT
 mOf9mdi+ekGspBypQSHWn4VWsTzE9GKzgtxEhGz3qnvIvEUPiRFFkuI5KnN4O1gMSfju
 YRx/dH6tF17oFLghP0ty+1iqCIrBvGDhj7ZFtsOJ0eHjz5LQeybbHtLknoqYOTkkfYk6
 iDP9haszjH4Wm2naFfOEbPyDvaWS11ckzlFp7lN/hwkW00KDEbb+VBdPtouf8XPSYHGq
 5s0YXmlqiqNlaY8CiS5TXbxR1wmnACACIQvPr+INQPMwVDdN/XhWvROjBrs0aWGewfWA
 QbYg==
X-Gm-Message-State: AOAM530OH2KjwJoNZDiQyGGHCi948qhIQDQLjTWZsqWBf1kkK6CRVjpZ
 mH8zV5rCCSsxEFUh6+owJFdcY0PhKtg=
X-Google-Smtp-Source: ABdhPJwQAyTUNfuim1ptFUpXk7hbKKEPKYx8kd7hLR0HWR/nuiwS0YQiX4YrG768txas9VqDJMBh/w==
X-Received: by 2002:adf:e607:: with SMTP id p7mr35653146wrm.80.1625763957566; 
 Thu, 08 Jul 2021 10:05:57 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p7sm2747390wrr.21.2021.07.08.10.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:05:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)
Date: Thu,  8 Jul 2021 19:05:43 +0200
Message-Id: <20210708170550.1846343-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
References: <20210708170550.1846343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Affected targets: alpha, hppa, mips/64, sparc

Fixes: fe8ed7d5794 ("linux-user: Handle ERFKILL and EHWPOISON")
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e826206d22..4842a1987b7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -629,7 +629,7 @@ static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
 #ifdef ENOMSG
     [ENOMSG]            = TARGET_ENOMSG,
 #endif
-#ifdef ERKFILL
+#ifdef ERFKILL
     [ERFKILL]           = TARGET_ERFKILL,
 #endif
 #ifdef EHWPOISON
-- 
2.31.1


