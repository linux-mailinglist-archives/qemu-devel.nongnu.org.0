Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A06A28A6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:50:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrBE-0008Iu-3o; Sat, 25 Feb 2023 04:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBC-0008Id-F1
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:22 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBA-0000N7-TJ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id 6so1536685wrb.11
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CfMvlZ8pAKruenJ/ugwQdJE7H5ZPrvj71nw3+8tK1yc=;
 b=CDqLZRel53fBCuqBD5TvO1kIRRfT06GYX4K5bGYyc3XhsQfsqTVMwAgfNztGX2CqEE
 x0N4+Shg2G/iLa4fHC5G2G/aqXXWtxCwVuUU6EgdxvcjDqCkX77lrccQIVFKl0U38ubH
 aOpJpKKUeZNNe0FHEbhQtghC29hPnVEr38anju5uSqApRmALeHwlD2HplUv6zcwTjss9
 iroL/OpLabskX72v8fKku1+UygyJS6+rfGqNRU/3YyqBiM9/4dyYDzK/pNtTm+tHT6av
 vIJEBirumoP0Ueb611abK+UBLjtdEBm2q0QkdaVSvQTpuFttE8VBlWXRxQSihICU8LeW
 t0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CfMvlZ8pAKruenJ/ugwQdJE7H5ZPrvj71nw3+8tK1yc=;
 b=D/Vp+U/Y+n4aatQAcngs+aS3AI9kae3sXH/WdsK9tjWprZzaTUm48Zyv0soHN7wC9a
 dqdZF72rZNZXyhcYcBC1BtOLRXkYBjPoq4SXVaxS5NbRCWyQ/c7oEozqAteMdNVUvkmQ
 DT/CPyygAP4xyurk8T3BA2uh3YSNFoGjbZthfj24KFjHj0E9l5e6vbAsI/UcgfgmLAPb
 XkQRv7eH/G6ULfP5GPsh1wg4PdA7TecKOK1Zaon1rrMDUx7BET4nX9rOzYz+1pwvblb9
 MlZiSB4QJ9lZAi1LSS1PQSLZXvN4U8THPB9MDeSwKwwN6J1+HnZ5pRQJcgqgoi0Lfjn/
 V6Rg==
X-Gm-Message-State: AO0yUKUN2WibpLuP96X06MReFtqA69TtP9e4B/wtuK6famzaraqGZrez
 WBccqjsxNQILBzloBq6+W9Cl0g7dPvWIUFmNs1M=
X-Google-Smtp-Source: AK7set+qRXHa9LmeGBinGYsrNsXILyHFJknGjr1sOFaxPfqmopeTqEu/1kn48ZBX3rhJkLk78RPl/w==
X-Received: by 2002:adf:e64d:0:b0:2c5:6cfe:aabf with SMTP id
 b13-20020adfe64d000000b002c56cfeaabfmr16522143wrn.9.1677318559382; 
 Sat, 25 Feb 2023 01:49:19 -0800 (PST)
Received: from localhost.localdomain (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 k18-20020a056000005200b002c54c7153f0sm1344425wrx.1.2023.02.25.01.49.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Feb 2023 01:49:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 2/5] dump: Replace TARGET_PAGE_SIZE ->
 qemu_target_page_size()
Date: Sat, 25 Feb 2023 10:49:00 +0100
Message-Id: <20230225094903.53167-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230225094903.53167-1-philmd@linaro.org>
References: <20230225094903.53167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

TARGET_PAGE_SIZE is target specific. In preparation of
making dump.c target-agnostic, replace the compile-time
TARGET_PAGE_SIZE definition by runtime qemu_target_page_size().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 dump/dump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0ab229e5e9..4d68a74ffa 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -15,6 +15,7 @@
 #include "qemu/cutils.h"
 #include "elf.h"
 #include "exec/hwaddr.h"
+#include "exec/target_page.h"
 #include "monitor/monitor.h"
 #include "sysemu/kvm.h"
 #include "sysemu/dump.h"
@@ -1860,7 +1861,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (!s->dump_info.page_size) {
-        s->dump_info.page_size = TARGET_PAGE_SIZE;
+        s->dump_info.page_size = qemu_target_page_size();
     }
 
     s->note_size = cpu_get_note_size(s->dump_info.d_class,
-- 
2.38.1


