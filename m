Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581B652303
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:47:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dpI-0000oX-K3; Tue, 20 Dec 2022 09:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dpF-0000nr-1G
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:37 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dpC-00024b-UP
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id o5so11959545wrm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21i+uKYRqisONemNjzePTCowH1RWWMbrnew9/U3Xawo=;
 b=REDw6qCpkEhmAb0ihany76rUBCOJwAE1ow/0C6kEvD8ok/0pU5stIcbpO7TBgx0+H0
 isht/21oIp53akDgN8W7BZM5Mg2JNzrEnOEQU8SFLt6IrVC/Yqno22s9FMpB7yvEn6B4
 nT0p9tF1H0OzuaOsTbZg3nU7n7E/BanHA4clm3aNy+ezPFjOkUY+tfaofgVI8fK2Zedw
 +0ptiyHI1oseystPh+PRLubkFSKkrzdwvY5Gsj8Z753DZ4UGcZBKfC3ax/1rjiZ0ajRn
 +dWZItgJ2uBI/Ka3UzZDbJcVRwJnBe6alVtZshEdMEqqYDdYstVyQPwpqF0te5SjrwX8
 QlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21i+uKYRqisONemNjzePTCowH1RWWMbrnew9/U3Xawo=;
 b=H9gghd7VAb1vpvkP0Kv1xQWqyZjqL6mMJO/1YO6y1u/7ulCd8pBmw5S29NYsu8sECj
 LSyDMIxgBXWaAHx3LyS0z/qPgvq9Wxs17uv5fn4LMxm2Lb250w+NVgYo166+f79krWz4
 XAw6pI8hmRzo/8ToQg+lTCZAx0zufpZU5kZIj75aFp9PRxeOvHA9gZggBLen17FlJs5Y
 L2Ym2Z+d42Ry186IRHJUNXCtgz+BSY8HOba+HO5Sv5fjjekW/IPBTRseUNUC6pnxhOSA
 /0fESgGIfexkj21UpPGU48S16YkdDdfuCRxZOizfMAXRfbri5+ipK9GLtqBLvuFVJXH4
 NVrQ==
X-Gm-Message-State: AFqh2kok5ncQ+RTRaKxJUErxG1EHndWliumDWuEgkG8Q3VBG6klscF1G
 W1QMkQMZZFp0IjfIMb6NwZXj2JwU8RPlqZWUuiE=
X-Google-Smtp-Source: AMrXdXslA1/4vUObmAB2mKn4gfzTWUr8B/aq+oeac0i+hN5QKq5x8o4bWLfYfY4SHkpDCqB0vy/mag==
X-Received: by 2002:a5d:5b1a:0:b0:249:3f48:6040 with SMTP id
 bx26-20020a5d5b1a000000b002493f486040mr1602458wrb.21.1671547352567; 
 Tue, 20 Dec 2022 06:42:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bs29-20020a056000071d00b002420d51e581sm7346803wrb.67.2022.12.20.06.42.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:42:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] linux-user/signal: Silent -Winitializer-overrides warnings
Date: Tue, 20 Dec 2022 15:42:19 +0100
Message-Id: <20221220144219.25254-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220144219.25254-1-philmd@linaro.org>
References: <20221220144219.25254-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The target SIGIOT signal is sometimes aliased with SIGABRT,
producing the following warning when compiling with -Wextra:

  ../linux-user/signal.c:57:9: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
          MAKE_SIGNAL_LIST
          ^~~~~~~~~~~~~~~~
  ../linux-user/signal-common.h:165:9: note: expanded from macro 'MAKE_SIGNAL_LIST'
          MAKE_SIG_ENTRY_SIGIOT
          ^~~~~~~~~~~~~~~~~~~~~
  ../linux-user/signal-common.h:128:41: note: expanded from macro 'MAKE_SIG_ENTRY_SIGIOT'
  #define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
                                          ^~~~~~~~~~~~~~~~~~~~~~
  ../linux-user/signal.c:56:41: note: expanded from macro 'MAKE_SIG_ENTRY'
  #define MAKE_SIG_ENTRY(sig)     [sig] = TARGET_##sig,
                                          ^~~~~~~~~~~~
  <scratch space>:81:1: note: expanded from here
  TARGET_SIGIOT
  ^~~~~~~~~~~~~
  ../linux-user/sh4/../generic/signal.h:26:34: note: expanded from macro 'TARGET_SIGIOT'
  #define TARGET_SIGIOT            6
                                   ^
  <scratch space>:55:1: note: expanded from here
  TARGET_SIGABRT
  ^~~~~~~~~~~~~~
  ../linux-user/sh4/../generic/signal.h:25:34: note: expanded from macro 'TARGET_SIGABRT'
  #define TARGET_SIGABRT           6
                                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/signal-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 3e2dc604c2..a168ea4851 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -124,7 +124,7 @@ static inline void finish_sigsuspend_mask(int ret)
 #define MAKE_SIG_ENTRY_SIGSTKFLT
 #endif
 
-#if defined(SIGIOT) && defined(TARGET_SIGIOT)
+#if defined(SIGIOT) && defined(TARGET_SIGIOT) && TARGET_SIGABRT != TARGET_SIGIOT
 #define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
 #else
 #define MAKE_SIG_ENTRY_SIGIOT
-- 
2.38.1


