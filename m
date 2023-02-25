Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD136A28A8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:50:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrBd-0000cG-CO; Sat, 25 Feb 2023 04:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBV-0000TU-VB
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBU-0000Pf-CF
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so983948wmi.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHwEoMi3MEImb9Gq1/MR47PuMg0pIyHWlD7SUPk6AuQ=;
 b=h95h92uLFlFw1V3bNCihM9QJHeANSD6LhfNBL9C3rB/Z2+ZKR3hoOJ0PNgslW4bDjq
 QeSFw8AxHHTaRu7xo72I0YUmZ6iekZkxPovUExWkUJtihouM6R14d7EBOM/qZYiY+2tr
 4l8dPVPws6P8lRHYZiOgsFJD68fykHbkdAQYhgUcF9GS2hKPpSOns7jOS2/chRFHLnhL
 GootXhh/HODPMpdLPXUmq5X8FfTMRfPUlx8lI2sRM3Gyl//eZvrZiWWNEWhLpRrSwtQO
 2bv3+QDwKN5dfTY08yOJxYaSHhuJkB1j8nqDDUkK8aojhtPNoYX91ND9LJvMbKIiWAQo
 88Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHwEoMi3MEImb9Gq1/MR47PuMg0pIyHWlD7SUPk6AuQ=;
 b=eU1kaIYYqAoiOdE6X2I/2psHBVVURpPNKBtyVFhGQDpC9SVzDF9LJYeKnmrqbkMvRp
 iOODc+SGIX/B1i6/tURKGKeZhhjjno9U55hKIYQ9ZrrHhOxhegjId2zr5mOoHDZyFo++
 ZDxxcwIUvH4bmlG6Oev/I5y9MVSY1w0NAW8LkAElkWDRYuuYcLCKIfpY4TZzscglu9ZX
 W6/lZFUu8m6/uxFAGc829TB4XaTB/FCTrqCW3CVipzyvPla/Vc9g0+Q8DLbLmJnzuYvw
 rapEDGZTuXSW/SN6vhlstlmgVjKD/Xcn1uh8bvyJWceYQxO6o7nl3T1hxQd9/JfxVJ5C
 wJjA==
X-Gm-Message-State: AO0yUKWNfdbSjJdZVPSwv4FLyTvj93jtaN9vfPiG2Lfg0PgdWylj/Ypr
 HKxiPZe1HyT8BDitiAGkQPbgRqeYxTv5rHZB5Wc=
X-Google-Smtp-Source: AK7set+5/hhkY949mmCID/ycird+TD6bBQk8q4TT9/YIOhirgTQ3axh2WGPqKRCJjgNQnryKuFSAPg==
X-Received: by 2002:a05:600c:a698:b0:3e2:1e31:36bc with SMTP id
 ip24-20020a05600ca69800b003e21e3136bcmr13408091wmb.12.1677318579469; 
 Sat, 25 Feb 2023 01:49:39 -0800 (PST)
Received: from localhost.localdomain (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003daf672a616sm1976931wmi.22.2023.02.25.01.49.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Feb 2023 01:49:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 5/5] dump: Add create_win_dump() stub for non-x86 targets
Date: Sat, 25 Feb 2023 10:49:03 +0100
Message-Id: <20230225094903.53167-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230225094903.53167-1-philmd@linaro.org>
References: <20230225094903.53167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
 dump/meson.build | 4 +---
 dump/win_dump.c  | 5 +++++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index fa650980d8..544d5bce3a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2018,9 +2018,7 @@ static void dump_process(DumpState *s, Error **errp)
     DumpQueryResult *result = NULL;
 
     if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-#ifdef TARGET_X86_64
         create_win_dump(s, errp);
-#endif
     } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
         create_kdump_vmcore(s, errp);
     } else {
diff --git a/dump/meson.build b/dump/meson.build
index f13b29a849..df52ee4268 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,2 @@
-softmmu_ss.add(files('dump-hmp-cmds.c'))
-
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
+softmmu_ss.add([files('dump.c', 'dump-hmp-cmds.c'), snappy, lzo])
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


