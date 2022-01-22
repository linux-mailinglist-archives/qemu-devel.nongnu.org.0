Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A54968CD
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:35:06 +0100 (CET)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4Mz-0001SQ-MB
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB4Lr-0000OR-OW; Fri, 21 Jan 2022 19:33:55 -0500
Received: from [2607:f8b0:4864:20::62c] (port=45592
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB4Lq-0006Kk-B3; Fri, 21 Jan 2022 19:33:55 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d7so10144521plr.12;
 Fri, 21 Jan 2022 16:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cc6IjahI2sgKwlvBITvToMCZaNnslADDopvO2JmTQxs=;
 b=VSonq31IkogXhlP8OjQ2v0O3MG1AP+MzCUqYyplXl7UJLsUMT7goF3uSuyiFfpFoM3
 KGAs9WlC78hbGnh7rQymmk90517GChkd0Y9NlRycc2CVUnYI+/NQfKr65pTqsXaaG/fd
 t/Mf+kmEJtdGvcnB791EDIzC02EdiplNcrj9DDJM8huSi74Y2suQYBe0LDnOSk4Its2B
 a1WwgQN1pmBQAIgMwAN+597TMexaDy422LAgI7Gh19l/b4E6mHQ8lNG+2604mcIIH129
 raF+I23ieXpHuCoab0mnRN8rq5YmQDvhv8k6GGQqKR8DWDPrFUG1tBgac65T4HKjQSAT
 e26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Cc6IjahI2sgKwlvBITvToMCZaNnslADDopvO2JmTQxs=;
 b=mjMlDzeHU3VpiWbRWivbLAn/GXCWoMgYk4y2Ru+tuChriMCPn1E9cFfXGH8my9JmIU
 1Lidx8Eh01lprYk37tc3fA7TD2NxTvf2KaF7wKjrL5esDe7Q39BtWUJpNVwEd75km/c4
 MO8rSW2YnNhGjl05+sMIE936XseswU4jD/NApHbWGQc8la4IaIaBtvABFsxpUSmZwd4I
 qHw+EAUxKrmxgT6SkOiXqRvJjZOh0KPxDm0dHXPmNd+6b4Lw2eegGGJPeHBtza85VlIL
 UYcPFmAILYXxdcRBa60uLQs0LfLI88yThI3KbnH0EXgXjvygK6vDTYtD/QQPkVALoKRO
 VIDg==
X-Gm-Message-State: AOAM531yXvNERFuM6R8nj0BJhD0hBOnkJjnZCNq3qvDn1bt0BOhuD1FP
 cWbk8PS2fXbXcY6GVn3edl2c1jKadwU=
X-Google-Smtp-Source: ABdhPJw8la6I5xw+D43LEGU6Qq8mYAfQjch6TCpa4Cv1wHpDEcb+LhCZKvJUB9/MyVQC6NBTicThoA==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id
 nu11mr3011865pjb.143.1642811631580; 
 Fri, 21 Jan 2022 16:33:51 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p4sm6963273pfw.214.2022.01.21.16.33.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 16:33:51 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>, qemu-trivial@nongnu.org,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/remote: Add missing include
Date: Sat, 22 Jan 2022 01:33:45 +0100
Message-Id: <20220122003345.84522-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Currently "qemu/error-report.h" is implicitly included, however
if headers in include/ get refactored, we get:

  hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
  hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
    183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
        |         ^~~~~~~~~~~~
        |         error_report_err

Add the missing "qemu/error-report.h" header to avoid that.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/remote/proxy-memory-listener.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 882c9b4854..0e893f3189 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -16,6 +16,7 @@
 #include "exec/cpu-common.h"
 #include "exec/ram_addr.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/remote/mpqemu-link.h"
 #include "hw/remote/proxy-memory-listener.h"
 
-- 
2.34.1


