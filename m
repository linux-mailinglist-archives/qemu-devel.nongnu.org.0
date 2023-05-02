Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A406F43A8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:21:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovJ-00048x-0l; Tue, 02 May 2023 08:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oN-Q5
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouX-0003D7-8C
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so263865f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029711; x=1685621711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f3fVAF1UdAFc4znqT/Tff10yQrjlMGSE2fDzmp0Zjyc=;
 b=ID3zbTcr0kDs30t64tKXWWnZS+Pjrvp/ALRkqtahdICFEE5tPQSqF0u5PLEsP+x84c
 QnKuWbobEQfxWZVuSe+wbyHl4nPgqU/fyqdqCmwsBh3GsOKtDHqfF4qFe8xPVj092dnN
 79QpMyZcF9EFaVsBnw+leyEinWhGrPNIBZuhgxaWxvCLu0pNEWdhvzhwGaEGrwX4+oZ0
 wcKcwMHdwgc0RhsSKZ8RTtTbkNo9Jy+spFTiI9+MVo3082J4vbfS0P5IT6493WithCP+
 b6B/+B4qBN9i9iqGtcA7A8tka7byAN63q6lmmVXnzdwlfsrE6QpTevno6jV6V9mjPpNW
 59DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029711; x=1685621711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3fVAF1UdAFc4znqT/Tff10yQrjlMGSE2fDzmp0Zjyc=;
 b=g4w6dS1WZBdikd2/cSk2D0Pvfd66a5q+jYBqGnBHTPDtVYZBOLvtgk+K5h7jtfG8JJ
 Fdg8iTesp25OHsi1hQYLXoj2FkSfhNOXmKXJX9V51zZdYIXAXgmRfYUc0AombFnKfVUd
 bIunfKJYgzAzfqtdMfr/f/GdJAjApmyNgPHNxua4c1dOHPI/zJMDhv6GajF81n6Wriz+
 FfZ7MnUvHAOd1s39DeZ31qkPV5g40VA34e1v6m5BZ3BZzbKH2lsZ/ngI5P1aRnBNM2Ri
 SaTmHx8dXJzA+2xKJzwmVaJH02zHPtI8z9eJWroTOqX05oEkCsUdUD9e/ZX2K4tmmp/Q
 Yw1Q==
X-Gm-Message-State: AC+VfDxYoDVlnYMy7p2RUfVF02PAHeVkAEX2kz/5F1NcYWNKycDbI4BZ
 yefqkCXweADmLN55/BKwz3vQpwz/6s8TN6XJwhE=
X-Google-Smtp-Source: ACHHUZ5w9KY9tN4MVqa6qzrLps2v0sy7ElLE5pND+CJJjLcwVXZ4oXkhtyvDNnyy5mRvnUbro18JNA==
X-Received: by 2002:adf:e892:0:b0:304:a274:e17d with SMTP id
 d18-20020adfe892000000b00304a274e17dmr11755401wrm.63.1683029710727; 
 Tue, 02 May 2023 05:15:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/35] Document that -singlestep command line option is
 deprecated
Date: Tue,  2 May 2023 13:14:45 +0100
Message-Id: <20230502121459.2422303-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Document that the -singlestep command line option is now
deprecated, as it is replaced by either the TCG accelerator
property 'one-insn-per-tb' for system emulation or the new
'-one-insn-per-tb' option for usermode emulation, and remove
the only use of the deprecated syntax from a README.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-7-peter.maydell@linaro.org
---
 docs/about/deprecated.rst | 16 ++++++++++++++++
 qemu-options.hx           |  5 +++--
 tcg/tci/README            |  2 +-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d61..3c62671dac1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -111,6 +111,22 @@ Use ``-machine acpi=off`` instead.
 The HAXM project has been retired (see https://github.com/intel/haxm#status).
 Use "whpx" (on Windows) or "hvf" (on macOS) instead.
 
+``-singlestep`` (since 8.1)
+'''''''''''''''''''''''''''
+
+The ``-singlestep`` option has been turned into an accelerator property,
+and given a name that better reflects what it actually does.
+Use ``-accel tcg,one-insn-per-tb=on`` instead.
+
+User-mode emulator command line arguments
+-----------------------------------------
+
+``-singlestep`` (since 8.1)
+'''''''''''''''''''''''''''
+
+The ``-singlestep`` option has been given a name that better reflects
+what it actually does. For both linux-user and bsd-user, use the
+new ``-one-insn-per-tb`` option instead.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index b8bc94f370c..af9e85157d6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4192,10 +4192,11 @@ SRST
 ERST
 
 DEF("singlestep", 0, QEMU_OPTION_singlestep, \
-    "-singlestep     always run in singlestep mode\n", QEMU_ARCH_ALL)
+    "-singlestep     deprecated synonym for -accel tcg,one-insn-per-tb=on\n", QEMU_ARCH_ALL)
 SRST
 ``-singlestep``
-    Run the emulation in single step mode.
+    This is a deprecated synonym for the TCG accelerator property
+    ``one-insn-per-tb``.
 ERST
 
 DEF("preconfig", 0, QEMU_OPTION_preconfig, \
diff --git a/tcg/tci/README b/tcg/tci/README
index f72a40a395a..4a8b5b54018 100644
--- a/tcg/tci/README
+++ b/tcg/tci/README
@@ -49,7 +49,7 @@ The only difference from running QEMU with TCI to running without TCI
 should be speed. Especially during development of TCI, it was very
 useful to compare runs with and without TCI. Create /tmp/qemu.log by
 
-        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -singlestep
+        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -accel tcg,one-insn-per-tb=on
 
 once with interpreter and once without interpreter and compare the resulting
 qemu.log files. This is also useful to see the effects of additional
-- 
2.34.1


