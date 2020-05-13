Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224821D1D33
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 20:16:22 +0200 (CEST)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYvvZ-0005OY-4D
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 14:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYvpW-0003og-IF
 for qemu-devel@nongnu.org; Wed, 13 May 2020 14:10:08 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYvpT-0000ME-5z
 for qemu-devel@nongnu.org; Wed, 13 May 2020 14:10:03 -0400
Received: by mail-pl1-x644.google.com with SMTP id t16so141199plo.7
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLvKLW9QkwF6CYlMcG5jB8i9eNtam9qfgfh7941aYEI=;
 b=qBexN1V5iAhi/Y3W2qYSdY2X2j5MqvO+VRrkXN+YKGMef35whPusMsSCg4I515AoAK
 ciN8FpFypbDlMvXFJV6hHr0WIBCNb1GNnXd1jFmsSXP2q1bQaoj9h7cr3g0PqGX1P6Om
 Vf16XHf2JvH6uq9pnIS0KFREPjpbRqRkfGYeWNoqXx6Xn2cdM/UuJMm41yAjIXTk+56H
 8PabMse08+IKcxaT1BYeHY320jtPej62P88f98HKzT3zxyQMqIBhv7ClmuiP5h/zVGtC
 hBsj9ErF9pUKzcptWwKHFkLZwHG0nno4GIlxy5NK3fjIabnZIpHvFDbL4WbmdgJU5H7t
 kT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLvKLW9QkwF6CYlMcG5jB8i9eNtam9qfgfh7941aYEI=;
 b=W1HXQmS9nMl62zP7tH2//Gh763L/47NpmTzo65qtpnPzoLxTvpq3AY3MxoOrfE9JwQ
 GyYPEYO6FEQeWGSJ662ZZn/UMKTOOoe79bANHRdyhb3iS5+hPDrMq4tN/V+pD9mlcb9k
 SOU6eMMWucECFOItZEwaY7o8VPCwGQlgOjledeE60Vt0mQF30CJlt/BcHKBa/OaxBokL
 yzOE+yjTVJoc2R9ACcq7vlX6d2TKU+7t9d7h3+pjibVhYsom/AbzKAvaXH/yGzw3aQDi
 C+cvjcpl1kHUdJwPmb32LDsZS+kUe697IvRjPCI8E5GrBUWDcwb2TsYj/eHYyatyNnD8
 n9iw==
X-Gm-Message-State: AGi0PuZGZsg9P8RX+kzL5Fj8JambCpXW4+QiXxVynrUF/19n+DboaOXk
 dTSr1nCl5fvxwj31jVRr+HTlHGXesvQ=
X-Google-Smtp-Source: APiQypI878sRt8iPBlDc/wXsDjVyLR00uYdbvInFQVXRjaT2A8DwjP0EKQ45GSWV+xdO/2TBBu8Uhw==
X-Received: by 2002:a17:90a:204b:: with SMTP id
 n69mr35084488pjc.176.1589393400875; 
 Wed, 13 May 2020 11:10:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i185sm197361pfg.14.2020.05.13.11.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 11:10:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RISU 4/9] Adjust tracefile open for write
Date: Wed, 13 May 2020 11:09:48 -0700
Message-Id: <20200513180953.20376-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200513180953.20376-1-richard.henderson@linaro.org>
References: <20200513180953.20376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Truncate the new output file.  Rely on umask to remove
group+other file permissions, if desired.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/risu.c b/risu.c
index 1c66885..f404d8f 100644
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
2.20.1


