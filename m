Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDC45AA3C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:42:17 +0100 (CET)
Received: from localhost ([::1]:41402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZo8-000430-Tp
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkH-0004FW-Vy
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:18 -0500
Received: from [2a00:1450:4864:20::42d] (port=33772
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkG-00050a-FH
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d24so40360166wra.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFNb/strBQB9hLaOeOMEOLWgIeKVijWjHGUQ12nJnAw=;
 b=OGA2+Qf0QlY3J8KsHQepxJh+BCNJwpr5wQSM2Gow4GU5sXB4HJB7iczF7G9FtLjsCc
 7tnFvZQKrIlt2URVjbGgZuq/V9KE8tbRTOH1hYQuFcvkvFewTABhTPprFgLWEPk2+ehe
 g+mdGnO93sjwvlLzptDVNCbGVOOtfmsOyGcUur2L86uGUaKfHVV2yPMErNB2p0aMDfRs
 apeQyj3lULodIjK9RK/74Uq0MGOoVQYqpfhOMEIMgRIJph2ktCNejfotzW1Yde95CAnL
 lv3lJ7O78nH0xO+1L12Fp+Sks6qQmZUjoFULf1ukbYZRz8INUepvpZXmaV7QItw6G/Yn
 PxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFNb/strBQB9hLaOeOMEOLWgIeKVijWjHGUQ12nJnAw=;
 b=pfnI/p4NPQrzuwcgitrd8n8ybfBFhomaGP82BmklXKDXuv9DO0NSqvSLJbUuXZnS72
 ONil5x9cHa2TmAPoBpatB6x6eE0g2z6pWVcQR4eHrICfZJcSMdRXs3yvo/hJkL2L6dgn
 zr9aXDx7BzAhyvKltvbs7r6ARzpqoWTGfs2Vcxhxwh4mkod3p8CzoS5Z0ohOX5RE/QQ2
 EvqtbkM+r/x8c3PdREImXdjZH1c7pHNUCrHGQjcgqdHE9+0tvFeCdSzAO23rwXkvDVkK
 FaciNEeQtblGxCPyOKR5Ocyyeqkqq9gflHfnQA0NJlRQ8rJhuroNw4yVOVjV1PCJGe+p
 nArg==
X-Gm-Message-State: AOAM532E/5As0+cLsFFdfc9bpTV3RldBqiwezY62anZ2aqjHXBAYwPlT
 2ZH+vNg6lJq1MQ2CyoDRYapJ6Nv13BjskIElHSc=
X-Google-Smtp-Source: ABdhPJxeBUadp97mujm4O4FjxYDx4sxscf/7qJlAqteWlbKyJQQCI6CosT7dSUAIcQwLUBpRSXufhQ==
X-Received: by 2002:adf:f90a:: with SMTP id b10mr9689970wrr.255.1637689095137; 
 Tue, 23 Nov 2021 09:38:15 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/16] bsd-user: Rename TARGET_ERESTARTSYS to
 QEMU_ERESTARTSYS
Date: Tue, 23 Nov 2021 18:37:51 +0100
Message-Id: <20211123173759.1383510-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is fully internal to qemu, and so is not a TARGET define.
We use this as an extra marker for both host and target errno.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 832671354f..141e08456c 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,6 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
+#define QEMU_ERESTARTSYS        TARGET_ERESTART
 
 #endif /* !  _ERRNO_DEFS_H_ */
-- 
2.25.1


