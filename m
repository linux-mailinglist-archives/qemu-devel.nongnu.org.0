Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85D49A217
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:42:23 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAqk-0002Ti-Um
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAen-0001r3-Hx
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:01 -0500
Received: from [2607:f8b0:4864:20::d32] (port=43957
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAel-0001LA-Ur
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:01 -0500
Received: by mail-io1-xd32.google.com with SMTP id z199so7381829iof.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isDrZY482S3xfWT+5+PbxzFl8WVxw/V/ZKa7flzM0e0=;
 b=PKxlAmj2ihfQaeajGExa3WrJCJuKYJkmU2CcOktnQQJm+u3jp8WyJmmS24oU3W78WC
 324f4oneDSpjF3Us5nG+3RweveeScX9fsIZgTZ36CZPv1gic6qc3qm0kNgCr8s+cN8KG
 7vkQJSEht43QZFd1KqbXRF8jO6gOuuBrhoyHMQG1kdrOzIUqvaS9dl7XgAOmwtwpvUgq
 Sr/v43FY8NCly8zVxROwbIX6fEx15339WIi2POp7HETPz6brd2C+cnyAaPbrIeWMKoQR
 xb/Er6Pd98Go/HAUXZtcCNBfs42GLZB/KJ4DJ4PuTavas+mnAoQHuf0on/rLzNNsBeUE
 fB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isDrZY482S3xfWT+5+PbxzFl8WVxw/V/ZKa7flzM0e0=;
 b=PEO6vdnHMF+RRpq5r8M3Bh997ZakyielABzDmdKnsr88NhxiKXflRiwDf3ngninx3e
 sDUXrwJKOCZVL3C5IYRkTETKi4QiflYi6LoCu0ZonyLP9nR8RT1TYNLIUJhsqGgeCGpH
 +ShrTzQxJAFRRpPncU0dpF4MZ+TlYxEe/zbX32Jr8mv8Fn7XFXE4tUcy0+aMA17LCEqW
 y83Rla8HrvN+9BMuWFltS+HpKdlPafaAu/sWc1fzNvEa2n9nnUJCKgH26CEg3DeYqY6g
 VWYdDb41M+o+H6glRkk5Q0rin1w7YcZ60LiXVLjVU7XAWJosZrWfNGc7P9eyHLPoWHON
 fa3w==
X-Gm-Message-State: AOAM530afjnnRWbpdROYMnlKmy7f94T4pedYaWgniHIy0kYbFziH940x
 V2xOsplF1U+TaCd57FBTMlvUC5UXW6PY5w==
X-Google-Smtp-Source: ABdhPJzNdWACEfoYyAQ4kAaQlJUMl8jPWPk8NOSmHf/fxjlpRySFv9x16/z7fX66pHcQ+L3XGHxYmQ==
X-Received: by 2002:a5d:8b82:: with SMTP id p2mr9436168iol.214.1643074198745; 
 Mon, 24 Jan 2022 17:29:58 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:58 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/40] bsd-user: Bring in docs from linux-user for
 signal_pending
Date: Mon, 24 Jan 2022 18:29:13 -0700
Message-Id: <20220125012947.14974-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is currently unused, so no code adjustments are needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4dd209e402d..671b26f00cc 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -86,7 +86,14 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    int signal_pending; /* non zero if a signal may be pending */
+    /*
+     * Nonzero if process_pending_signals() needs to do something (either
+     * handle a pending signal or unblock signals).
+     * This flag is written from a signal handler so should be accessed via
+     * the qatomic_read() and qatomic_set() functions. (It is not accessed
+     * from multiple threads.)
+     */
+    int signal_pending;
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
-- 
2.33.1


