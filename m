Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC543275A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:14:44 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY5q-0003CS-Q4
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtV-0008Gx-FW
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:57 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtT-0001nJ-HW
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:57 -0400
Received: by mail-il1-x135.google.com with SMTP id j8so15935413ila.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJYc+d0t5Q+xLUHUW/ZgWS+rpFy2RSrgUaVL6ybl14c=;
 b=7D2OA1QOLLNvtaKRmytGEV2eNTARWOsPhKcqWF+ETH9pwwFigRGv6byF8HVX+zjkXY
 R3rWlqvV8EGdl3tJBSX7yUWSvIR76YD0jFSSHlWvfrUYOZW9skCcRg4qz/BOuHRLyVtZ
 GX3BWWiyIIYWV7/KdNIQgEqXTc/NTa6RfzSIJeGsBiJ9grfLcqBAXBGtc0frRElrkvHT
 GwmblB+sc9dv9bxskrs+VL0Hqbi0O5Q6CN4llc4LfBko89OxSVovRNbvvEsWSC8oNF4M
 x5ZEowgBYJjgIpQIJbtE9URaDEYsQop1R4S4MsByRsA+TnL7qVrV/T4mr+mYbkjHtuDs
 ZQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJYc+d0t5Q+xLUHUW/ZgWS+rpFy2RSrgUaVL6ybl14c=;
 b=dNTGgrQMGRFOa7PeJdmJVSlzDgR/9ddyygkqecAHwmet3tBkFIGcG47qNf11rIvOoR
 WpprCoc5LEk37s6DaTT9AxEq8Jw50UTK50ZmNksKDHCSGfoUmhaxMGcWE7wzDtr0ZlB3
 9SEZdbfKWi8KpDotQy4aQ4LSqt3CVNzrAL1Ke2DcCM67JmV9FSbutIAv5wlRWKpO+zIi
 BzaFQE+Ls1e2+WJy3/62PvWpMajPrfZc2kwcFXOT59WeKbtjNKEGT2pDyGjRz1jlaZ+K
 MEMDKTnUqp3B1OoiSeo1cwytI5Fw7tcol2N9VJWEpdTzkyK1zYI/BF9bsQnlzZmcskHB
 ly4Q==
X-Gm-Message-State: AOAM532bwv0aqQVv8AxyVx2FDBLoU2yTudfIsJ8aA+bUq94CWaJvQYCT
 YHBvXIvwrnhWwsNDsuNECkdpSCfkw0zEdw==
X-Google-Smtp-Source: ABdhPJy1zuxEL4kHS/Y8Xjrave3PZkXgPsANYdCZrvGE0DSBUwhpNt8sDR7/H0spKv/MCPnGS6u4pA==
X-Received: by 2002:a92:cf50:: with SMTP id c16mr8309640ilr.145.1634583714061; 
 Mon, 18 Oct 2021 12:01:54 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:52 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/23] bsd-user: export get_errno and is_error from syscall.c
Date: Mon, 18 Oct 2021 13:01:06 -0600
Message-Id: <20211018190115.5365-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make get_errno and is_error global so files other than syscall.c can use
them.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/qemu.h    |  4 ++++
 bsd-user/syscall.c | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 522d6c4031..3b8475394c 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
+/* syscall.c */
+abi_long get_errno(abi_long ret);
+bool is_error(abi_long ret);
+
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 372836d44d..2fd2ba8330 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -33,18 +33,18 @@
 static abi_ulong target_brk;
 static abi_ulong target_original_brk;
 
-static inline abi_long get_errno(abi_long ret)
+abi_long get_errno(abi_long ret)
 {
-    if (ret == -1)
+    if (ret == -1) {
         /* XXX need to translate host -> target errnos here */
         return -(errno);
-    else
-        return ret;
+    }
+    return ret;
 }
 
 #define target_to_host_bitmask(x, tbl) (x)
 
-static inline int is_error(abi_long ret)
+bool is_error(abi_long ret)
 {
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
-- 
2.32.0


