Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6466484BDE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 01:48:14 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4uTN-00086k-CX
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 19:48:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMP-0005Cv-Nn
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:02 -0500
Received: from [2607:f8b0:4864:20::629] (port=33649
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uML-0005ez-UW
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:00 -0500
Received: by mail-pl1-x629.google.com with SMTP id i6so22144134pla.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 16:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jM9WH4tZn+WozYyxodUMJ3vMf971E4f0f2uwJh5rJpw=;
 b=HRHc4Wzo89vBt/A8Gkis1iMXeE7IqYzDzZBBsSC7Fsnojr7vLv6Zn/dNseocyy+Rjd
 hkfemKB08AXe/3HF1MWnGM/2e6qwYLklWtEQlJvhV3Ri4ukCyhqlXx1Mt+Z+yICtr3Ud
 1Eup4cVgJaokud6g51p3JvQm25+zapUqDdJpSdWwT2zFDnpsYS1KaRCcYoh0948XYxQ9
 DSbNbcTCP8hwdseI7pZhMXZhnYIC1QxbUKMgyo2lv7QAJmj49M9YNY+fOMBl3vAH47cC
 GLtEBLwKom1BIdelE6Qqyp4LToaTvhugrCBBcobYvhrqqlkkLsL+DP75SrFFggS5OQRN
 ivgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jM9WH4tZn+WozYyxodUMJ3vMf971E4f0f2uwJh5rJpw=;
 b=kEkztIJVcoWpm7+Xa27WOqVD1bLHMwXTdPLfSU3AypHAUM70Je3clPrTtaiWUaox32
 W56Hsl+VmQuDC4AHDuIvjIQLcMMP9hdAtHxi0UmibklwGeuuO+K41nsYuw3U+zn88Zs6
 oVMyGcodVgIW7iEd8fUE8oUtnuqfuMb6c0rNDKIOx8Qc0FGiaGGwrF/HrKFGc8gzdOGx
 OlKwKOFgP5wxla2BKZp16aOLcbkUrtZhO/qRSbADbTDuzsRDT8P6OTvi3rQ12k/MHFgB
 Fs1Jq7RPbwdl9PBRJz8pGzKDsGiGlq9VuvkUcdv2CVloopSs5wqBLk+yD4b0qip+bXQR
 EKBA==
X-Gm-Message-State: AOAM530aljfAFqSMRgI0xKyKB8tUYzRMsoqKYV1qv/SuQnflovK+U8Ft
 u/9Ml6phJPXqpM28MB1Bbpyd6AoCJucqjw==
X-Google-Smtp-Source: ABdhPJwhjjvZR9uzNm4otbcTm2A+I+p2F0mZm/dO++0ICdLpV/Z6nwxmgX+3eBu7v8UqMN1fLvb9fQ==
X-Received: by 2002:a17:90b:20e:: with SMTP id fy14mr12859pjb.22.1641343256756; 
 Tue, 04 Jan 2022 16:40:56 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k3sm35312356pgq.54.2022.01.04.16.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 16:40:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] linux-user: Fix trivial build error on loongarch64 hosts
Date: Tue,  4 Jan 2022 16:40:52 -0800
Message-Id: <20220105004054.587588-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105004054.587588-1-richard.henderson@linaro.org>
References: <20220105004054.587588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:

  In file included from ../linux-user/signal.c:33:
  ../linux-user/host/loongarch64/host-signal.h: In function ‘host_signal_write’:
  ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
         uint32_t sel = (insn >> 15) & 0b11111111111;
         ^~~~~~~~

We don't use the 'sel' variable more than once, so drop it.

Meson output for the record:

  Host machine cpu family: loongarch64
  Host machine cpu: loongarch64
  C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.lnd.vec.27) 8.3.0")
  C linker for the host machine: cc ld.bfd 2.31.1-system

Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler for loongarch64 hosts")
Reported-by: Song Gao <gaosong@loongson.cn>
Suggested-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220104215027.2180972-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/loongarch64/host-signal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/loongarch64/host-signal.h
index 05e2c82371..7effa24251 100644
--- a/linux-user/host/loongarch64/host-signal.h
+++ b/linux-user/host/loongarch64/host-signal.h
@@ -54,9 +54,7 @@ static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
         }
         break;
     case 0b001110: /* indexed, atomic, bounds-checking memory operations */
-        uint32_t sel = (insn >> 15) & 0b11111111111;
-
-        switch (sel) {
+        switch ((insn >> 15) & 0b11111111111) {
         case 0b00000100000: /* stx.b */
         case 0b00000101000: /* stx.h */
         case 0b00000110000: /* stx.w */
-- 
2.25.1


