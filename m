Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8E599376
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:33:12 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOskx-0004Ky-5M
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseP-0001Xg-EW
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseN-0002jh-Qx
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:25 -0400
Received: by mail-pl1-x629.google.com with SMTP id u22so3084602plq.12
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mJbPfVNUzEC2twD2g02EAHj57nKEYqjpuPLLVGphZY4=;
 b=c973d6XruNtYWVB5ucoYu3DG4Detp9DtbvaiGadt3iX6dbC2aWAA143pmJw2LV7Qiq
 BEqHG4j7zyr+4YChBty1XJnQyyX1ZPg2yb5JsrvB7KjYXnfbaGMaBi6mjCS2gatL9pw5
 wIzTfZUkTj1oO9AlZH7VwXwnXo1i0wfvT6cay5ZEkd8KhpktHRV3VUa0seexU/Tn7PNM
 XHjhe81Arz7/gnimk4ye7W+qWptc1ezVYKhmFA8wNHk/LmeRluRN4QIR0y9uQunHlHAJ
 3PdYsPclGIIjUrNx7VqpK1miU5lSxeHmnXJtjS1t4LYyVUy568A6v7D1E7Z2C6BQY0dQ
 7hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mJbPfVNUzEC2twD2g02EAHj57nKEYqjpuPLLVGphZY4=;
 b=Jf1QbTTnjEFcx1p0DXkdEZqlVZpbRQuXQWRi/Kr2MAyNbMXIR0rjIhhEvupfe/fEIU
 OTql10tZrQdtyh34zaMtwtAPzycKk6xd/xjz9uq2vqrEe6PwUMldPo/NIwXcSuAUymOh
 wWOxBgKjXqq8rPq1Oxt07EPy+TJjo9u/TXL4dvlhbAoasIVT6sDG4xgSp3RMGQU75wTb
 T914QiP91VjSYXAdGcImC3XAtp88HgikihkVCRsC5qIs9RWXcSAH5SFcMsRZIIt1mY8m
 OXXn7JNNZV5aPJt8UmAhs1tGxFc6beY7NzTzhuqj9LHtfs/QzGhQRskGmcS38JUz+i80
 fnAw==
X-Gm-Message-State: ACgBeo2pH54fPim56qzjj1ZzNvzaw6f0vw1RV2fL8ny+ILd42IBNfNKG
 Nv7A0JCk1/UOokN0KsXc2l8PJxKatTdiZw==
X-Google-Smtp-Source: AA6agR4fTPtkXmpE2FvOZJz4Ug+3+hDb6knXZkFsynKVYW4QD2gwkazk/y1S2U4e+KfPcAY1YFAAzw==
X-Received: by 2002:a17:902:c94c:b0:16e:ce7d:1fe with SMTP id
 i12-20020a170902c94c00b0016ece7d01femr5445567pla.168.1660879582545; 
 Thu, 18 Aug 2022 20:26:22 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 05/21] linux-user: Clear translations and tb_jmp_cache on
 mprotect()
Date: Thu, 18 Aug 2022 20:25:59 -0700
Message-Id: <20220819032615.884847-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently it's possible to execute pages that do not have PAGE_EXEC
if there is an existing translation block. Fix by clearing tb_jmp_cache
and invalidating TBs, which forces recheck of permission bits.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220817150506.592862-2-iii@linux.ibm.com>
[rth: Invalidate is required -- e.g. riscv fallthrough cross test]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

fixup mprotect
---
 linux-user/mmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..e9dc8848be 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -115,6 +115,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
 {
     abi_ulong end, host_start, host_end, addr;
     int prot1, ret, page_flags, host_prot;
+    CPUState *cpu;
 
     trace_target_mprotect(start, len, target_prot);
 
@@ -177,7 +178,14 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
             goto error;
         }
     }
+
     page_set_flags(start, start + len, page_flags);
+    tb_invalidate_phys_range(start, start + len);
+
+    CPU_FOREACH(cpu) {
+        cpu_tb_jmp_cache_clear(cpu);
+    }
+
     mmap_unlock();
     return 0;
 error:
-- 
2.34.1


