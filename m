Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0A3D9A9E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:54:28 +0200 (CEST)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uJf-0004Zf-7S
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCR-0003wc-J2
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:59 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCP-0002P8-L5
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id t21so4819864plr.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3ANcRcOSWVyZj+OH8b/VNlWjGyFgq+4rYmN7YEUZx0=;
 b=PpaTYVY7b0MmXzV35uTkcCx6jdmiM+jBUI3bj/+HAcxaBCB6HZe5NIcdC3uZU+Pz9o
 SL5Mft/dtzxoa5iKpfPaP1iyWqXxNqvGZ3SuwEuuaAo1IJHt9KSFMUN6kmYBrcMO69e7
 CnIOhBbQIq5HACW2wIpxuxliUoa2jUJxnjT5GDhf71aDOF1kFBkh9GFBjKch1OQr7k2S
 pQ5DxVIIekj7w2sOpvomB9TZVGM0FMld9ObtI9UVMFACTrJEwQUo2uxhwgVQ83P47mPX
 Nqtw43YC2Jz+/xsya44Qfb2g0Tvl3/L6nXuohJH5uTr0ZaLJ/nJqiPtbh1W9JY8EZ4Cw
 n9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3ANcRcOSWVyZj+OH8b/VNlWjGyFgq+4rYmN7YEUZx0=;
 b=U0KA8t6QP3iJuzHh5zlm11OoCmz9OqJNIuyiMFPV+6Fl6cV/lZ3EMoMLLtCsB2b+8z
 WCrTFuZeNRU2Y0xCVEuGVn25lhq/DYnhtBlYS43X0sWJndkCMgUGd+dVMLhMBv7dYoQr
 9hla9IjakcsPqAEZW0Vc9KJSDKFu/Qe/HBWwgoaElvive2xRGVy/l+jP4kr7KEIxlg5c
 vpFNzXfTfFIQvB6bzeg44wY5PsUF7fDVpR8YkjmRDPgaW2WNewTDFeuW40OetpCNQIVe
 1sHNsUQK6xAVPCr2/RTcIOqmla+PHNod75KCOZY6pV08jUTMF+Uak9lK50itMbLxJUDf
 jlRQ==
X-Gm-Message-State: AOAM531qZfuP0/1bz7s595bGi8M0h36ON+wBYy8ZU/f2RUZag0kCxWrh
 Uo76Iz4xUnZMJgJUeAXbDIf57S7+Xc0/2g==
X-Google-Smtp-Source: ABdhPJzCxUlT1C1ZaQQqDWlZMTM35BqzzQtvPod+hOqEK21ek+yslhE/3dYxDf2ZfQNd+H5kh2bdXA==
X-Received: by 2002:aa7:8602:0:b029:32d:3e9b:27de with SMTP id
 p2-20020aa786020000b029032d3e9b27demr2436502pfn.39.1627519616139; 
 Wed, 28 Jul 2021 17:46:56 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/43] target/microblaze: Implement
 do_unaligned_access for user-only
Date: Wed, 28 Jul 2021 14:46:09 -1000
Message-Id: <20210729004647.282017-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 72d8f2a0da..cbec062ed7 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -367,11 +367,11 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .tlb_fill = mb_cpu_tlb_fill,
+    .do_unaligned_access = mb_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
-    .do_unaligned_access = mb_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.25.1


