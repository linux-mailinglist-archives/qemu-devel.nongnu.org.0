Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE76A176D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSft-0006YC-W8; Fri, 24 Feb 2023 02:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfp-0006XI-94
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:21 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfn-0006pl-DX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:21 -0500
Received: by mail-wr1-x42e.google.com with SMTP id p8so13084542wrt.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEhfImWzx09NEJBcXw8tReL+2FfS3ZaQ631ZC4GD570=;
 b=Pk6PXgSa+iqoLCQxj/X8jZme2ana5q2pCuqROPaeb5SsBsgu6ozC4lLKf4idqRHFx8
 JRxZE6OIWruNQ6d4Kfij8pzC7V9t9r8gE1et1KDEWGjsE+0EDBzvDJBMCubDJMBCojsL
 YDXVUI05GwlQPakP86qM18KpKjQXnobOgOlyCRzXcC05wbUMXUfZSX7IKJoFwmoldheY
 8+sYc2oWQMDUZNK6bDAM2bhjvHaw9XO6IspJLjqv3L1FLpxx2Hcwks9xgw/zO4rzekiT
 1FeRZBy3XxmVon++jM+L1Dr9QW68W1UmWVOTvAcMBy0TsXEXeLsZ0IfqxKsbdyt0M0+a
 dNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEhfImWzx09NEJBcXw8tReL+2FfS3ZaQ631ZC4GD570=;
 b=u2Lc0gfMhwonyOaHx4o/VK2nuVapaOhwj1qZSaAgNsdw5n6J04S4xBdom5znW+9fBs
 mMDfVgB5047FtUh/frk/q9cm9O0heKOYV/KTMlprxb0AtLdFhn96dDh+8QkUSnMEqviv
 jmbasyexzoBGsOUqaORKmsRWytK6o+sRufP8+40k26tcHs0J79Ya9i+yGW0LsLqNfOtD
 3MuTIQeE0bAQubOKmRvNCII3ln0oolYwk5hoM7L5fX6HLy5ry5hLiJzyiPCd4lwjkhNq
 Gnhd3o9WKgWG9YDT6+9QKDk/eeLudBMPpVzRC85/5hZ1CtS+wgoeU6FFA+Beq/Af1Xxv
 tCAQ==
X-Gm-Message-State: AO0yUKV/SiDtFfcb8bRsUQFkr/8Ncv0ElpLs6734ITQb26V6wwKq4PTz
 qY6GvTQNJNLbqh8TrvZ0XlOuhyR6pm1xfvNY
X-Google-Smtp-Source: AK7set8pLVxGWxS0y7k6GZtBEzCO+2oR0QhXYz+NDAbtJO53L1F9rXOrUwDR8V9Ii/ING6xCWNsntA==
X-Received: by 2002:a5d:62c9:0:b0:2c7:1dd5:7918 with SMTP id
 o9-20020a5d62c9000000b002c71dd57918mr1039772wrv.28.1677224356991; 
 Thu, 23 Feb 2023 23:39:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b002c5526234d2sm11800632wru.8.2023.02.23.23.39.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 23:39:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 5/5] dump: Add create_win_dump() stub for non-x86 targets
Date: Fri, 24 Feb 2023 08:38:50 +0100
Message-Id: <20230224073850.84913-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224073850.84913-1-philmd@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the non-x86 create_win_dump(). We can remove
the last TARGET_X86_64 #ifdef'ry in dump.c, which thus
becomes target-independent. Update meson accordingly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c      | 2 --
 dump/meson.build | 2 +-
 dump/win_dump.c  | 5 +++++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0c96c6e735..7260558852 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2020,9 +2020,7 @@ static void dump_process(DumpState *s, Error **errp)
     DumpQueryResult *result = NULL;
 
     if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-#ifdef TARGET_X86_64
         create_win_dump(s, errp);
-#endif
     } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
         create_kdump_vmcore(s, errp);
     } else {
diff --git a/dump/meson.build b/dump/meson.build
index f13b29a849..7b116f1bd7 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,4 @@
 softmmu_ss.add(files('dump-hmp-cmds.c'))
 
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
+softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
diff --git a/dump/win_dump.c b/dump/win_dump.c
index ff9c5bd339..0152f7330a 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -487,4 +487,9 @@ bool win_dump_available(Error **errp)
     return false;
 }
 
+void create_win_dump(DumpState *s, Error **errp)
+{
+    win_dump_available(errp);
+}
+
 #endif
-- 
2.38.1


