Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD247B4E5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:01 +0100 (CET)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ0m-0003Ye-DN
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:16:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqk-0000EG-KS
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:38 -0500
Received: from [2607:f8b0:4864:20::534] (port=36584
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqj-0005tb-85
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:38 -0500
Received: by mail-pg1-x534.google.com with SMTP id 200so10435689pgg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrjGaJbIPN4t2pKJl7K0EquK8iWYAYK0CsxpksEWHF8=;
 b=BaN7kxllirHjRAIImX8BX7DOy+y3K9dompu3UjOjSa6s85p6d+yh8UZBXyw5y6X62j
 gctHQKgfqY3wyKm8Izu5tPWYGi6AjD42DY9yio+viYYja03rrdAay4Np8QMGEwbOMLka
 CeizCDEredXjimd7RlspfBJ3+rftiE42WFroVT2pBiRHKNFmbxoWcPipLvq4boipW5wo
 NifSUJ61xy4KnxJJB3tvpBo8JNX8cYnuJp3OtZtSO6mOdv/4kFo6ZkJTPnlZU/yiEmzE
 jMDeCS8Mwj4OtWjHXneNhMZZeq6tNvfnaRn9A8mCXp0vqgS93uR9Jp6hx9rIEIRVGPwX
 r6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrjGaJbIPN4t2pKJl7K0EquK8iWYAYK0CsxpksEWHF8=;
 b=6+n2IcTlVybpMUmuylECtIemoDyMktItsy14Wg9pov0orbaLAv6b5wFkMC/ffKiXz+
 3vp1s592kd36FjKILx04Ch26ttZQeuxNQs1ATBL/uR894NXGeaTTU5q7xge4E6+40Bqr
 vuNAke8qo23AJISio8jHtm1Fu9p36vtM2wgGDBzxUuLxZJZTizS8JdDXZsgv4QOPj5UL
 WIqzHuCB0LIsjbRysA5T6QLhwPc+F9Mp+Ew36kf/C0Fu+7NYaXCc/6ICwenqr2R+7wmV
 cM5iBHcberXjZnTygF0gFGxLxvIpQShc51IU3SVKnl02mmi7emv9VIAFx52Zeys8OXXK
 zrow==
X-Gm-Message-State: AOAM532zwiXo/V3Zi9v6v7D50isOKO2C4wsWJQLMoL+JGXrja5XVO2Xu
 IIJQzRDIQdk0KfxtaJy3TDkyLAxugywZlQ==
X-Google-Smtp-Source: ABdhPJwc4WSL1z4ui9k0wH+9jMV9qMN48cLRELJy6WcKAbwmfIhAWVeApKewbPg2x+KjUUwzEQxxEg==
X-Received: by 2002:aa7:9438:0:b0:4a2:c941:9ac4 with SMTP id
 y24-20020aa79438000000b004a2c9419ac4mr1287291pfo.12.1640034336081; 
 Mon, 20 Dec 2021 13:05:36 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/24] linux-user: Remove TARGET_NSIGFPE
Date: Mon, 20 Dec 2021 13:05:11 -0800
Message-Id: <20211220210529.150423-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This define is unused, and we have no similar define for
the other signal sub-codes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index bc18a4f248..a738bdcecf 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,7 +688,6 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
-#define TARGET_NSIGFPE         15
 
 /*
  * SIGSEGV si_codes
-- 
2.25.1


