Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DC25B2A3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 19:05:18 +0200 (CEST)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDWCD-0006tr-Qe
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 13:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kDW8V-0000Ri-VR
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 13:01:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kDW8S-0000IY-SL
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 13:01:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id 17so3167908pfw.9
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7amQF5+q+U5pyEjmTJks994NcpROaetfXoezQ8sulo=;
 b=Bp3QDYZkDWAFIC5efp20wcNZ+OgfGQ8P6EY3Hoz+xXikKTAMZO2J7LziiCEVW6BQy1
 QABQXpmxofN0ykvY0yQo5mvklix0N0jZGpibP6I4I/UqikUtWGLCnPIPEoyR7QA2CT3G
 FbaEoTjRBSs2wdnaFq90i8ugkeUMKwX73KYhuuKNhRYFufEzk30s5R5rOwfQZHDHHPvx
 iJTQWgaDJn04pZvR3JaRGcULBbA/IA3etfDFTp5A59l1O2+uYgmYFhOf0M/RhljOaRBR
 qlmc7d6eroHTeNCIOpx9ys8oUc4khV6giEeE51XNVW1xyuvy1lDA7R5Lrf9zzaLslNbd
 TYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7amQF5+q+U5pyEjmTJks994NcpROaetfXoezQ8sulo=;
 b=APl3rSNKUcEJrD99Ko10QEIDAXMyo28S0xETVUvMUaatVZD0iKTuQ52zp1RfQT/D4I
 Z1GLSNcdgurbpkleb5v7h5q7Z18Ob9Xs2EljwX/KEvwM71onHlcOfJcSS+yq1mKKYI8k
 3tswgCS/SAsocsiMYrZFEEv/H/poIe5rOt1IUPNteILE7mkTS2wjSHHh+VIyOsE5YfSl
 75g1LBVxxT06+TMEkqyW71rEUMHxRsb+2YlZ9nCqCMfrjxCFPpX8sZVvLIxcC3g9pFq9
 aRyqEQEm0Ytl5A8b8O4Yer65dphRTcT4s2GVjiau5lAxAbbYe103BIcE5IQJttKDkOHK
 g9oA==
X-Gm-Message-State: AOAM533rl9sMh9BcZcNfz9yZwwEpSfbQZXDVVew1cnq0iyJzLU93HUC2
 NLyEgf+sFuHmgJeg1YPatXmzpJ0FE/E=
X-Google-Smtp-Source: ABdhPJxDw9pl3N5Wby6b52DGngWNm9jBMjySuqs/jE0KWAavhEBacW6L0LsxEeFbbuYH6u4Sgn2+Qg==
X-Received: by 2002:a65:4689:: with SMTP id h9mr2566983pgr.50.1599066082825;
 Wed, 02 Sep 2020 10:01:22 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id x4sm40527pfm.86.2020.09.02.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 10:01:22 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] tests: handling signal on win32 properly
Date: Thu,  3 Sep 2020 01:00:53 +0800
Message-Id: <20200902170054.810-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200902170054.810-1-luoyonggang@gmail.com>
References: <20200902170054.810-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SIGABRT should use signal(SIGABRT, sigabrt_handler) to handle on win32

The error:
E:/CI-Cor-Ready/xemu/qemu.org/tests/test-replication.c:559:33: error: invalid use of undefined type 'struct sigaction'
  559 |     sigact = (struct sigaction) {
      |                                 ^

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tests/test-replication.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/test-replication.c b/tests/test-replication.c
index e0b03dafc2..9ab3666a90 100644
--- a/tests/test-replication.c
+++ b/tests/test-replication.c
@@ -554,6 +554,9 @@ static void sigabrt_handler(int signo)
 
 static void setup_sigabrt_handler(void)
 {
+#ifdef _WIN32
+    signal(SIGABRT, sigabrt_handler);
+#else
     struct sigaction sigact;
 
     sigact = (struct sigaction) {
@@ -562,6 +565,7 @@ static void setup_sigabrt_handler(void)
     };
     sigemptyset(&sigact.sa_mask);
     sigaction(SIGABRT, &sigact, NULL);
+#endif
 }
 
 int main(int argc, char **argv)
-- 
2.27.0.windows.1


