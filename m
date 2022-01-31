Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327284A503B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:36:37 +0100 (CET)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdPe-0005KH-Sz
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:36:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnh-0004zD-4e
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: from [2607:f8b0:4864:20::d29] (port=42999
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eD-I1
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:20 -0500
Received: by mail-io1-xd29.google.com with SMTP id r144so18376178iod.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcZ/fxJZTdiXxs5uHcd2Nm1OFR/CKnoGxaFeU6jvAsI=;
 b=rG2dXs9bVpvmqNM+p56Q0Kee7kTT/kV4FeICxqh8kBNIg08ssvU5HkP/wb8XGar21q
 NOI8UTt2pgl3GTP47dDtjQaB3XUngpcpO+CB0GSQQVO4dsz0Q8EZqVIHyv3M20bDgDWz
 7+ZquRIC+PlhK8+Pt6aEVZauo3hvDUt6hlOaPWkThJXXK6UVtHysHnCaZesYXyX1yxgI
 jNTOpt5kNGLq55EFUN3KM/Q7v5Sei6TBe9j/dvCYuMTOKDVJ+D8poyeteC9DLRUH4uUz
 Nk28QP00OIR/lrQfA4CFVYpVXi5nKqoi2DxwCvl5f6nR9M1LU1S6ETnNQeHCVsBLLeS/
 HTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcZ/fxJZTdiXxs5uHcd2Nm1OFR/CKnoGxaFeU6jvAsI=;
 b=ReXjrOzEJktDoMUA3XpTLpyqxOzCuL7Mbib6xa3mrG/orAFkr7QQ0sXg6L9u0QwFVQ
 +BR6O4lkgsh2KPrvaIBjU9ZjVk98QO9sD/KfR/dVrPL3ybXImZCJXJ4fYuvRNmn5E2n5
 DwUXuTyZROpjXFYNOCTcR1wyRq/cMwCydh9KNk1kzcg9L6lTq8jwnKhSAv/Y5DKXL9ma
 2v33ZPhaYRYPUYiSXlLoz7PClK5ybBXh5q8jge/ic7a9Qa+NgIm3CFdqlmBZTObFhGqa
 lwlnLYt35H+0M6JclG+Ppk85dmPRG00FAb4ZREeuzu1UAnWBIKYR1Li0v1F8eSIwvSDJ
 CfZQ==
X-Gm-Message-State: AOAM5305c3F5e2LDSWUVBd/xd4ZWKQKLPM1jeIojgh6jr9k2Cizx8Faz
 cPUYnRSYwIuSG780/7UHlphwWIwtsrouCg==
X-Google-Smtp-Source: ABdhPJxlWhpGTn0JchWNe9jJMbOHvj8A8cgqof28pR0IG7T74cBj5t+Xfzb85id197ZWM2H2f1dsWg==
X-Received: by 2002:a05:6638:10e6:: with SMTP id
 g6mr11260764jae.135.1643659006076; 
 Mon, 31 Jan 2022 11:56:46 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:45 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/40] bsd-user/signal.c: implement abstract target / host
 signal translation
Date: Mon, 31 Jan 2022 12:56:12 -0700
Message-Id: <20220131195636.31991-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_to_target_signal and target_to_host_signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal-common.h |  2 ++
 bsd-user/signal.c        | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index f9a9d1e01aa..efed23d9efb 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -13,8 +13,10 @@ long do_rt_sigreturn(CPUArchState *env);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
+int host_to_target_signal(int sig);
 void process_pending_signals(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 void signal_init(void);
+int target_to_host_signal(int sig);
 
 #endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 844dfa19095..1313baec96a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -2,6 +2,7 @@
  *  Emulation of BSD signals
  *
  *  Copyright (c) 2003 - 2008 Fabrice Bellard
+ *  Copyright (c) 2013 Stacey Son
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -27,6 +28,21 @@
  * fork.
  */
 
+/*
+ * The BSD ABIs use the same singal numbers across all the CPU architectures, so
+ * (unlike Linux) these functions are just the identity mapping. This might not
+ * be true for XyzBSD running on AbcBSD, which doesn't currently work.
+ */
+int host_to_target_signal(int sig)
+{
+    return sig;
+}
+
+int target_to_host_signal(int sig)
+{
+    return sig;
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1


