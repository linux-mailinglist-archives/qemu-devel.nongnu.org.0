Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72155C09E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:20:22 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69GX-0007Cc-5v
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dm-000462-G3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dk-0003CI-VT
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id k9so2489430pfg.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BjePRvLodXee3nOF4Bnatx6neJkMsm/wRrhgMqaqYcE=;
 b=qGiCAaYqmZlhGL+pdWEsGGrcRsBHK3DkSTiieoMvCuwPSeKIbSidxXL4s1LrUgQIDA
 P9Xui4o+oC7YwCe3rftARGubLgtZ70N7aWdMtj9BD8xDgq4msHwF/Wc2jUrPaSM9Fagf
 OH7pNbbcAguFaP96yddMe4gTxsJyFeiNKXdSct4TgFwTaRgyhbsV96iAeWfL18dkKhVn
 0c9z/NiVNppNLpih03UNHu7Z125QITsFe6R2tp82ZMvuJv2RZmPA6wL1tW2HfX+aHy+M
 vnkgsaIP90gr/8D+ftnSsoAcq6wLb8zd662+mQDKHC0pjBrZ48WNJMlTbpzrdh/WWN6M
 fPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjePRvLodXee3nOF4Bnatx6neJkMsm/wRrhgMqaqYcE=;
 b=1NHWkdc6T2ejfTYn7lhkCpKD5yR9kUBEPLG5EOV7+yotrbWZGzKCOJy41c4OLvb1xI
 r6Cq4cX06nQCDkFgy4/TBCYdZD+nZ6livO8CZlnUI7uBCTjP2NeKRUgZO0XuqqTXE1+e
 cohxVfVAa0Hrg85bAAzX/hSsGuiO+sxTC1HnBdlu3ogMG96iNXrwZkslWt2MzgVhetpg
 Jt1B6Bi4+3macyUaCofZeDCYSapq3CzT7FbHnq/xip18xr0M2fg3tqEM0/XAbURfHe9y
 lMybcE1ot4Ju9VnLgQlDes9T7IeO01k1dgMZvMKbACH1tQiQrH4vO5K61GRpipLBya3w
 oQ7w==
X-Gm-Message-State: AJIora8BVkCl53RR51aerlNK0mILH9DKowAGZBFaTCQZ3E8hQUf3UK3Q
 xbK/Y6Sevi7pR0kA2t6TXQM/B+etXUFEow==
X-Google-Smtp-Source: AGRyM1u8OIx4dt3FL1YGc7PP+xpzsgdHRJhwa1Cl81yfwL9qHBoQZKZAOgSDjfDoDWMisCtWIdYasg==
X-Received: by 2002:a63:9752:0:b0:3c6:5a7a:5bd6 with SMTP id
 d18-20020a639752000000b003c65a7a5bd6mr17377371pgo.390.1656415047635; 
 Tue, 28 Jun 2022 04:17:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 6/8] semihosting: Remove qemu_semihosting_log_out
Date: Tue, 28 Jun 2022 16:46:59 +0530
Message-Id: <20220628111701.677216-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is no longer used.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 13 -------------
 semihosting/console.c         |  9 ---------
 2 files changed, 22 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 61b0cb3a94..bd78e5f03f 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -40,19 +40,6 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
  */
 int qemu_semihosting_console_write(void *buf, int len);
 
-/**
- * qemu_semihosting_log_out:
- * @s: pointer to string
- * @len: length of string
- *
- * Send a string to the debug output. Unlike console_out these strings
- * can't be sent to a remote gdb instance as they don't exist in guest
- * memory.
- *
- * Returns: number of bytes written
- */
-int qemu_semihosting_log_out(const char *s, int len);
-
 /*
  * qemu_semihosting_console_block_until_ready:
  * @cs: CPUState
diff --git a/semihosting/console.c b/semihosting/console.c
index cda7cf1905..5b1ec0a1c3 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -38,15 +38,6 @@ typedef struct SemihostingConsole {
 
 static SemihostingConsole console;
 
-int qemu_semihosting_log_out(const char *s, int len)
-{
-    if (console.chr) {
-        return qemu_chr_write_all(console.chr, (uint8_t *) s, len);
-    } else {
-        return write(STDERR_FILENO, s, len);
-    }
-}
-
 #define FIFO_SIZE   1024
 
 static int console_can_read(void *opaque)
-- 
2.34.1


