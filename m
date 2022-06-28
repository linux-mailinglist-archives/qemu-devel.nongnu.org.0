Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295955BF0F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:26:35 +0200 (CEST)
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65cI-00017n-HO
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K1-0002d8-DA
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:34 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jy-0000aZ-Ao
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i64so10937492pfc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXyEX5EGojRk37xSHJRE+V8ZZ/aXpEnXqpHF/pSGdMc=;
 b=gdLADNrLoo7dmxZmlwTxA45p/kmRYTM55HrZ0SCH8WeRTaXMpaQbAuFlLqF++8N3EL
 cB5uu5IIlTXEg/WvsD91KrKd9hRR/FJaEVgz/lbnw6UF1wCV98QDKgrufnZPjM36vzyU
 PSLOf1HgGIlnaYIz4B1RBHA50DGofcl0QSO8mOspcQECdXVOKekwS1Ipq+gAwPRGQUI1
 QpunC8GclRBXPn4SBTUr+pw7IZ4biLBDaFRjc6LTRLEkWhCuI72c0fW6p/evNR2wb4Q5
 9DecmN2AucdQzSEwohvUSBub3rpcr/s8KrgttzBhg/2IUgF/QEHSV587oVbTTGD5z+dd
 fSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TXyEX5EGojRk37xSHJRE+V8ZZ/aXpEnXqpHF/pSGdMc=;
 b=1+wK7G4IGJc7FNKWAy3IQxEYvKj0p7ovqHx3JrRdxzn2ryXJDNvD9tZFdgXIx6cApP
 uNoM0zSZAgSU1Lx+t/FQgsocnozLJzt0Kbnp0DD0VF4aSrlgXHd+sMHSRpoPFejhSa7I
 BcjKKvd+MXdPiRpf3ZMX47qkvPWyu2oTC6XqK+g9dkDm2B8P7zo7XishBV1c/be6z2uA
 gVbf0VB1BheQFJ+NaOKeUtpRpb3yjQPFyC+I5uuiYrkAzjP1ywxIjKwrXgINm4nhmhO2
 BlIdRzooAkYpEG4z46pXGvw9trb3hoM6eRjIgk9juHSeSZcRizMxD+4x/CfLn0oXEpZK
 Kscw==
X-Gm-Message-State: AJIora+nFWAVNW0VAmTYIOeO1vxfWdFgrOblBoRtg7t0jb729MGZPaqe
 R5RrTEJ3iRJhHVqXpj0BS31qEF/0BYXiqg==
X-Google-Smtp-Source: AGRyM1t4H4GHNmrEFaalkqHcsxADZTt5UYDrHWAJQPZgbmMRF20mvmd+g2hnCo3OlxdwGPapZRCzEg==
X-Received: by 2002:a63:1824:0:b0:408:a22b:df0c with SMTP id
 y36-20020a631824000000b00408a22bdf0cmr16318367pgl.119.1656392369048; 
 Mon, 27 Jun 2022 21:59:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 57/60] target/mips: Add UHI errno values
Date: Tue, 28 Jun 2022 10:24:00 +0530
Message-Id: <20220628045403.508716-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

From the Unified Hosting Interface, MD01069 Reference Manual,
version 1.1.6, 06 July 2015.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ac12c802a3..2a039baf4c 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -74,6 +74,46 @@ enum UHIOpenFlags {
     UHIOpen_EXCL   = 0x800
 };
 
+enum UHIErrno {
+    UHI_EACCESS         = 13,
+    UHI_EAGAIN          = 11,
+    UHI_EBADF           = 9,
+    UHI_EBADMSG         = 77,
+    UHI_EBUSY           = 16,
+    UHI_ECONNRESET      = 104,
+    UHI_EEXIST          = 17,
+    UHI_EFBIG           = 27,
+    UHI_EINTR           = 4,
+    UHI_EINVAL          = 22,
+    UHI_EIO             = 5,
+    UHI_EISDIR          = 21,
+    UHI_ELOOP           = 92,
+    UHI_EMFILE          = 24,
+    UHI_EMLINK          = 31,
+    UHI_ENAMETOOLONG    = 91,
+    UHI_ENETDOWN        = 115,
+    UHI_ENETUNREACH     = 114,
+    UHI_ENFILE          = 23,
+    UHI_ENOBUFS         = 105,
+    UHI_ENOENT          = 2,
+    UHI_ENOMEM          = 12,
+    UHI_ENOSPC          = 28,
+    UHI_ENOSR           = 63,
+    UHI_ENOTCONN        = 128,
+    UHI_ENOTDIR         = 20,
+    UHI_ENXIO           = 6,
+    UHI_EOVERFLOW       = 139,
+    UHI_EPERM           = 1,
+    UHI_EPIPE           = 32,
+    UHI_ERANGE          = 34,
+    UHI_EROFS           = 30,
+    UHI_ESPIPE          = 29,
+    UHI_ETIMEDOUT       = 116,
+    UHI_ETXTBSY         = 26,
+    UHI_EWOULDBLOCK     = 11,
+    UHI_EXDEV           = 18,
+};
+
 static int errno_mips(int host_errno)
 {
     /* Errno values taken from asm-mips/errno.h */
-- 
2.34.1


