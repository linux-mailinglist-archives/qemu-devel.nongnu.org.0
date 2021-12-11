Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB1847159C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:19:48 +0100 (CET)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7uN-0006pr-42
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:19:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mc-0004vi-6C
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:46 -0500
Received: from [2a00:1450:4864:20::336] (port=56002
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7ma-0006Cy-A4
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id p18so9147142wmq.5
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLNR1fcnj1CQdExPgAQtQq8Gfk8TpYAkjXC++HyyPjA=;
 b=ED4MakYpiiUS3jWg1EwVlyWsqDYIZdUo5+tHqJukoevqseWJudiFa0mOrTxFDBUxWg
 PAOGqRszQQ6Wbj6aIdBEwlYm6gKkZE86AK/pzbRsDAzFmyDuVQkpCxKN9ahpKllqZroX
 jFF6GPCv/E8edgQIJHx+jXo8L63SpJ7oy8SRoxgW/xYOcVNp4YMatp2EPN53z8gl0vrj
 53t3TOtyLAOnvuOYb1fdaeM5mDjgJgNesgznO1A6zXxuNJOY7mZ75Yi/BzMfW4BgYQSw
 BkejFS9vkQL+RXfDXXp0Vx8zaGaGBsCMKUjrG2wRmouk2kP9WdO/dkwH885WGcU1o5le
 4pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLNR1fcnj1CQdExPgAQtQq8Gfk8TpYAkjXC++HyyPjA=;
 b=QG13YbJssotEMQCSGobZ5RJ0yFUyjWVciqDeZWLcTUhA4JSXbESS8W7Zsr5G2BqlK1
 1Sg8TtGgFvWRPWUDbBJTtxynDi4ebOZLfKqROvGJ9EBt3eLhv3Mhofw2lDPY4ZF/c0n7
 SS18l4Vj4LUYwxBkdP4fhCDGMuiR0HYQIeBBPoUATCJtUJzUg0wTieXdQFYau86fqwk8
 DTAiDuYjnfB4O+1j9LVcUy5tevok89uVCpwFkXCqE5LR6FgDlrRAmcI2NHlHsm/gSa84
 YguGGw+xwqJYT7dsPLTHu2KWvy0pW+s5RWogdesESzz83qK2v20N0r3XT+VCBUdfNaMN
 L98g==
X-Gm-Message-State: AOAM532/EVlxVSYQjHfFHx/pvPaoxkLjt+iMbPNsj8Wpy4yDiJudRp+v
 MVT97GoBFMciiAnvyh5c5GW+vw==
X-Google-Smtp-Source: ABdhPJyY08PkGq0h148FJzKA1/aO8iZtaXJE2han4QCdbv8+wywTF/dba2xQyz6BZbiu2WRZQafbUw==
X-Received: by 2002:a05:600c:2c4a:: with SMTP id
 r10mr26231909wmg.125.1639249902902; 
 Sat, 11 Dec 2021 11:11:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/26] hw/intc/arm_gicv3_its: Don't return early in
 extract_table_params() loop
Date: Sat, 11 Dec 2021 19:11:14 +0000
Message-Id: <20211211191135.1764649-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In extract_table_params() we process each GITS_BASER<n> register.  If
the register's Valid bit is not set, this means there is no
in-guest-memory table and so we should not try to interpret the other
fields in the register.  This was incorrectly coded as a 'return'
rather than a 'break', so instead of looping round to process the
next GITS_BASER<n> we would stop entirely, treating any later tables
as being not valid also.

This has no real guest-visible effects because (since we don't have
GITS_TYPER.HCC != 0) the guest must in any case set up all the
GITS_BASER<n> to point to valid tables, so this only happens in an
odd misbehaving-guest corner case.

Fix the check to 'break', so that we leave the case statement and
loop back around to the next GITS_BASER<n>.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I suspect this was an accidental result from a refactoring at
some point in the development of the ITS code.
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f321f10189e..c97b9982ae1 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -795,7 +795,7 @@ static void extract_table_params(GICv3ITSState *s)
             s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
 
             if (!s->dt.valid) {
-                return;
+                break;
             }
 
             s->dt.page_sz = page_sz;
@@ -826,7 +826,7 @@ static void extract_table_params(GICv3ITSState *s)
              * hence writes are discarded if ct.valid is 0
              */
             if (!s->ct.valid) {
-                return;
+                break;
             }
 
             s->ct.page_sz = page_sz;
-- 
2.25.1


