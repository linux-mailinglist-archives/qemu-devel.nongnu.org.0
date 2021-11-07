Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1BB4472E6
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 13:53:34 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjhfx-00027P-An
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 07:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbO-00033x-Qc
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:50 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbM-00026I-Ru
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:50 -0500
Received: by mail-qt1-x82a.google.com with SMTP id h17so9113622qtx.9
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGSHLpNAu9g6Np9tb4uVWnbjp2oiYs6nIhg97qpdgNI=;
 b=oqyb73dj9QP7WWMkTJy6D5uMXQo+bkqh2hU0NeyaMQ15+S3FzK6Jz30OJjcpaLZ/6V
 i+n3erSM1cN2JuCHCHY1fkos5p8vRSKSl1uIwXopMktvya9QJaVMBKu2yxrhYeXxa7K1
 X6uoXDzmJ4L92Fp1Pcd0YcY5cRTe3ES+dOt2f6mPCBWa40jcnc+rcAl/ZXDYsGzjweRF
 jm8PyiNJLmF8aqF4MNdtIdaDdnq6pnONZDPzd5tJ6w/9GVsqovtuw9B87HqDdrXx5g0E
 6LsUGIbRWc9sB8diAqMki3G0qpN9gEfPR7dqNyByerBHXSpZSxqd7cMhA9mqk3nubOMp
 Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGSHLpNAu9g6Np9tb4uVWnbjp2oiYs6nIhg97qpdgNI=;
 b=Q0ELmwnXPcFpqQJl5j2LqubOsMbBUZ2VlhaUAMd5v7UdhTGDy6JcdyTfAiUzafjQTE
 8NsrNwaoaefJ+pMc+uUExrg2DK/7MSv71KIfVVSXDL0f6ps5jSCTcEIEE298ve72O6KL
 LBK7APTknUD+JYD7bI1CGPfPcsjCaJKtrRdY2r8DqImWUAiUEOLqBW6H3tpUvaYNvz69
 urB6/s2gQqI5GifiJCBwh5GULfGHL9bRVZAcMOtt2GVJGrzIMebUQI7YMjJ19PMuva28
 9vGegDe6aXmGZejt+/LBTQGfRhpsaCd8CPs4mUIZxDRFjYEjXvjG4i+F04mMWZqNjQrV
 02fA==
X-Gm-Message-State: AOAM5335VLc6x64LRr0lIMCOOjf2N5wjnmzXOjgPS3Yjn8HszojL0CYq
 7EDZ6iK4QWHR/rErwU3FdfYE+DMN79iMng==
X-Google-Smtp-Source: ABdhPJz3fox5iykds3n8eX3Cjb1m2f+v35BdR0bG/eIz6+dXD+gh043w67gOxLrW3eYm4nHQogcN4g==
X-Received: by 2002:ac8:4547:: with SMTP id z7mr38555940qtn.50.1636289328016; 
 Sun, 07 Nov 2021 04:48:48 -0800 (PST)
Received: from localhost.localdomain ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w19sm6917qkw.49.2021.11.07.04.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 04:48:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] linux-user: Fix member types of target_dirent64
Date: Sun,  7 Nov 2021 07:48:44 -0500
Message-Id: <20211107124845.1174791-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107124845.1174791-1-richard.henderson@linaro.org>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: f4bug@amsat.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The host uint64_t (etc) does not have the correct
alignment constraint as the guest: use abi_* types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 98b09ee6d6..41aaafbac1 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -437,9 +437,9 @@ struct target_dirent {
 };
 
 struct target_dirent64 {
-	uint64_t	d_ino;
-	int64_t		d_off;
-	unsigned short	d_reclen;
+	abi_ullong      d_ino;
+	abi_llong       d_off;
+	abi_ushort      d_reclen;
 	unsigned char	d_type;
 	char		d_name[];
 };
-- 
2.25.1


