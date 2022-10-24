Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D160BE81
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:25:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6oJ-0007eo-Rm; Mon, 24 Oct 2022 19:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oI-0007XV-J4
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:46 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oH-0000DG-0N
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:46 -0400
Received: by mail-pf1-x434.google.com with SMTP id i3so10246515pfc.11
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+GpEWM3LySgqJhgOZJqGlQkMf1hRDDzweYduhNP71iI=;
 b=DW2qvZUvdPN7M870Ke26svL/iB6HUMxw0a8Wm6cE4NracKGo7qDWWNlgtsokZL8Zc0
 MxOjfv2VhSrn2ir6vlxEhqYP9Yyczt3f1QKjeYDQKw+KMnANsymajDRigacw6d4R3sIG
 mopyypehe6ysvN8GLAH7FIE0fSh1VH6q7pU1bIMCsJMEOanMQFrMAfiuoEQLAAlxj3va
 qRalfrpO2VEmPIVgMn5rDm6RaV3LUfVzl3hLHz2Q89QKCYRfxPQ7s0S+IocEvBl+cYKj
 fLOAPKXaRKdvQBWNfAMOJw6ovJIGuwSX23zdFGZhj1whnOMm/i0W2obSUP80FdKGghWC
 vaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GpEWM3LySgqJhgOZJqGlQkMf1hRDDzweYduhNP71iI=;
 b=qB8GLTVzfkYf6svfwaeVhNeqVTmZaDZGWEkwJMX+Na4Zpcq2HKmmif65ZAc7xaKcif
 Y0ekJd3JAq144Bif9Wwu3Jgm0lktmGNKS+xy4HeLYBH+mRvSf88OhXhIGfQ7Rtt0xYPO
 2AyzsMAgFO6mOoPDAzoPKIk6KwRB8Mz4oOB6/LegSZgKK2YVfQQUfBWUXh8GNLKQ5YHO
 Jpf8dN93a5zCUP4/3VDn4SB6UZOC8Gm3vmbJzwb0mEDNm+3j5Fjkc4qvbRpjZHyBK0CE
 UFhHIc8t7KM6/FgWJtYz8/0J1fU1iTIIvT+hdxo4y/59cB3TqASoKWYh49s8C2As5W16
 ztnA==
X-Gm-Message-State: ACrzQf39Lw0C+uqZPyoYSuiqPg+0mZrFziWxziJF6wcRaqv03MC46p0y
 sOwk0BQXtErII8MazsvuFHuIogklj2plKw==
X-Google-Smtp-Source: AMsMyM53I2DSaO/iXHdoFwS5V/I1LRxcTDYWgelbHtDWKrH81a2r95jDp5nOxEpxxggt3t4nJD0JAw==
X-Received: by 2002:a62:19cd:0:b0:56b:6a55:ffba with SMTP id
 196-20020a6219cd000000b0056b6a55ffbamr17266097pfz.85.1666653883393; 
 Mon, 24 Oct 2022 16:24:43 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b0056bfa2cf517sm324788pfh.3.2022.10.24.16.24.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:24:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] include/qemu/osdep: Add qemu_build_assert
Date: Tue, 25 Oct 2022 09:24:32 +1000
Message-Id: <20221024232435.3334600-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024232435.3334600-1-richard.henderson@linaro.org>
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This differs from assert, in that with optimization enabled it
triggers at build-time.  It differs from QEMU_BUILD_BUG_ON,
aka _Static_assert, in that it is sensitive to control flow
and is subject to dead-code elimination.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..2276094729 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -186,6 +186,14 @@ void QEMU_ERROR("code path is reachable")
 #define qemu_build_not_reached()  g_assert_not_reached()
 #endif
 
+/**
+ * qemu_build_assert()
+ *
+ * The compiler, during optimization, is expected to prove that the
+ * assertion is true.
+ */
+#define qemu_build_assert(test)  while (!(test)) qemu_build_not_reached()
+
 /*
  * According to waitpid man page:
  * WCOREDUMP
-- 
2.34.1


