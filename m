Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239456F4619
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:27:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqxp-0008Lc-Qq; Tue, 02 May 2023 10:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptqxo-0008LT-RI
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:26:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptqxn-0001ym-BU
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:26:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315712406so171883355e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683037601; x=1685629601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4rpDjVqJxE6EndUGNQbAZShG0UQGteV/P1OOcKBuE0=;
 b=mUO6VGk9iXeCiXd4T2//sP4r8jTrYzvcSnlrxcykw5iJ4yVO/LV194LXn4cszIbpz8
 5HN/mZT1U/ptq1V+CRncuzmZBs5+x9O2/l99iVniF3GQM4U/ljgVIC3K0buhyWA62gor
 TlvwPHEqoQFPGh3FM2VEtKoLG39XKfXgm2L+8/IJWdcs0LYcgkTqDxLqASCb25DNbje7
 k5jIySqe23dk6gNyifjcw3QsLWDX9iAkwmq+mcugxo2USXaxtzZC6g0sbYuEghjO/UsX
 zc9o8FsKZqX9MHeNq3J2cCxwHZ831T29Wf1uSDyviWkHMKoXMHu1VxS3qJhjvE81fN87
 bDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683037601; x=1685629601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4rpDjVqJxE6EndUGNQbAZShG0UQGteV/P1OOcKBuE0=;
 b=Ys9jZzxDv18Y5TvZ4DhhzXQydN3iOX/OLwMXAlLAfy3m8/SwPoKFDTJWgjm1ZcLCMI
 aDZnP3t3GHBAu5nO57ts32YP8fCaCxy9i3GR01gRz3c7WmWB3OcXazFQqa5IkMVG/rEu
 jJzntUinTgDQpw6u12eyLEURwV2eyV2ua3QGJ2GzJ91TFhNp6ZPLEEnKySdtXwukXJHg
 79dneuwsU2OAyPjBlY03sIdGsSSY+o2vFcvj9Ml91MeGCTXFdIh8Yn+KNx40x2pHRHpv
 WSGF0P6OgJDVu21YtqZGKimRug8QfcTr/8kIw7l5gUk11bOccaleVudnTPnwuFyaPCpg
 xJ6g==
X-Gm-Message-State: AC+VfDzw3yIEtRZM9FdYcsy24stBcC+sP/xDlWGYdT1HffI01RRRZMIe
 SaQQbTcobpqLoFUhmDjaTgZK9Q==
X-Google-Smtp-Source: ACHHUZ6I4LIvbGrBfyYCF0git2PuzhghqLfbL9R1zOL4zu1MDTlQ+veSXZLa70NeDpSLP0OABV2lGQ==
X-Received: by 2002:a05:600c:4706:b0:3f3:284d:8cec with SMTP id
 v6-20020a05600c470600b003f3284d8cecmr10949027wmo.2.1683037601503; 
 Tue, 02 May 2023 07:26:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 ip29-20020a05600ca69d00b003f1712b1402sm38991411wmb.30.2023.05.02.07.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:26:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93E5C1FFBA;
 Tue,  2 May 2023 15:26:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] docs: document breakpoint and watchpoint support
Date: Tue,  2 May 2023 15:26:14 +0100
Message-Id: <20230502142614.1075131-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

This varies by accelerator. Also mention the modern bear-trap that is
ASLR.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/gdb.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 453eb73f6c..7d3718deef 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -46,6 +46,28 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
+Breakpoint and Watchpoint support
+=================================
+
+While GDB can always fall back to inserting breakpoints into memory
+(if writable) other features are very much dependent on support of the
+accelerator. For TCG system emulation we advertise an infinite number
+of hardware assisted breakpoints and watchpoints. For other
+accelerators it will depend on if support has been added (see
+supports_guest_debug and related hooks in AccelOpsClass).
+
+As TCG cannot track all memory accesses in user-mode there is no
+support for watchpoints.
+
+Relocating code
+---------------
+
+On modern kernels confusion can be caused by code being relocated by
+features such as address space layout randomisation. To avoid
+confusion when debugging such things you either need to update gdb's
+view of where things are in memory or perhaps more trivially disable
+ASLR when booting the system.
+
 Debugging multicore machines
 ============================
 
-- 
2.39.2


