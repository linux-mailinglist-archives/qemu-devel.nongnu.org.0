Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D756BE26
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:28:56 +0200 (CEST)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qqd-00035e-3k
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCP-0004Is-JR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCO-0002Mw-1W
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:21 -0400
Received: by mail-pl1-x632.google.com with SMTP id m14so16675721plg.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opEz47JE2jF71CZWR53DtauRYpdQpOBqzfW1h3P7OCY=;
 b=uzmrF8gVa/Q/F0vYfgs0h1pR8CtiCJAtSDfJEFH9PcSvREy69QAgJycgleaiZUzlmn
 7tvhoPKKVRA7LxK/BtnhlUyPcfRougztvfCgRNV/wVaYAYVxS4j4ybQlQDE4V1fdlLs6
 M5okr4wH0dJv8g15Zv0GQtIbTL91AcguCF51he06vNRVIS6jkJPHZLQnlJqQXhR3gukz
 J/hKH267tbhqnNeoHNzq4YhPGxVkch0Vyxh+2lQ4gEAZTVReVsiTCQ77Keyu6yc1KS5r
 lTKb9ic3dea3UO6WHYQcz7MviMKbsRVd3o+4VHyXCsp8c0bUmzJJtT9cTIftuYzOK/mA
 lmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opEz47JE2jF71CZWR53DtauRYpdQpOBqzfW1h3P7OCY=;
 b=FYU3J6TkgMsQdZKZTO+AIxOsoWc/8lZeyGDgHDgoEOFYfet5TdhckqUCsdWDnVlIXD
 wbDFTgYrxykG7ZVqcw9QEpEHCQXOoBpoZkPT1gMq2fdoWS3vw6xNOdJK4EpL5buOuw/Y
 Ux4Q06SjzFpYPefqze+CcuJBPy4tDk8ztWIbk17zebm9oS5ldb2K8bX5fUOOy71saJRj
 SFu8XsRo9n5FVmiGCXPokDZfOxIE1agKebyzFeaQcFag5JSfHOeh2n+hSC1YIfx13CZo
 CC8U1NtTYRTD20DvIrY+E8EUx/ScfcycXNWCiPMvWultddBj4mbfwPI9hiP0JX5GoDky
 dYHg==
X-Gm-Message-State: AJIora8JLkuCsY5+C4HJZZVoHugityQeXTF73ogdk9A/3rBDro8zcY9o
 gDFxs7WEzdP7YOXBuCHqDLmzZ6MacWYE9SPa
X-Google-Smtp-Source: AGRyM1vV9H43Wc+MsbTyEjIUDQ0dGoUzCl2Us9KOYlegG+fc641Y0A76lgFrF4PhvYMT0stkbL/Luw==
X-Received: by 2002:a17:902:ea09:b0:16b:a264:381f with SMTP id
 s9-20020a170902ea0900b0016ba264381fmr4256745plg.150.1657295239294; 
 Fri, 08 Jul 2022 08:47:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 04/29] Adjust tracefile open for write
Date: Fri,  8 Jul 2022 21:16:35 +0530
Message-Id: <20220708154700.18682-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Truncate the new output file.  Rely on umask to remove
group+other file permissions, if desired.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/risu.c b/risu.c
index 2f6a677..819b786 100644
--- a/risu.c
+++ b/risu.c
@@ -368,7 +368,7 @@ int main(int argc, char **argv)
             comm_fd = ismaster ? STDOUT_FILENO : STDIN_FILENO;
         } else {
             if (ismaster) {
-                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
+                comm_fd = open(trace_fn, O_WRONLY | O_CREAT | O_TRUNC, 0666);
             } else {
                 comm_fd = open(trace_fn, O_RDONLY);
             }
-- 
2.34.1


