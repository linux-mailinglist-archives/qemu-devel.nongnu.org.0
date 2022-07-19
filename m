Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1997579A5A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:13:48 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDm6l-0000bR-VH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4L-0004v2-6D
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4J-0001lL-M2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b26so21314502wrc.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VP1puZ7Kqisr5dvxsNpLvw7ulkMOEZ3tezwiO4vRy/Q=;
 b=CV9iQqsLtK0pdtRCCunDRofgTsU9rxGpsO0gM7uef8FDNKH8Wh3uIHLzeY+m3fKjRM
 jiQeg3RhAk5vl5NoRDyrJFaTzfa6pAavti6qNf4fZa1kPdH2p2KApqKwBFr2Og9FonE1
 jXUhSbi3mUF3qMmas5w3Yv0Z/GN8D6Sg7bW6fWIN/rrWkhKyRmR/1hm8y0VVQ0o1xTXu
 ciCf1+d5UtMVlcOZwNXE2zm0caUNaFH8Dq0l8pZLy+N4/wcKjZwSeQo/KF0ylEVpK9Vc
 RjvzyoRmFwa+PZKe7/l+P9YhRbcLe1iWrD6i7nRlGWrddEKkMLhGE8X0qs0myCDOCwNl
 D2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VP1puZ7Kqisr5dvxsNpLvw7ulkMOEZ3tezwiO4vRy/Q=;
 b=wQVq+nVL2uUd30QmRq3iiBq8FnyafyxojnNsiLWV4iLAmZSsO+ZFJ59bzZSrrTxzgS
 S7yGayoNRoHstmpsg76eVG94VcO8sx91VeD3q/s46xK40IbKqwCpMVcDqvI18kHbMVDi
 EihnKPpqL836WcxrMNM7d0EoaLJI0VvzXgE03kmKiXPVQcpld6LMnZuCuOV/7hXGRqsQ
 jT0kinGbvUOx776wc/wca+piuY/YxgPO71VKyjMYYexZnicscw3qL724TaCKjnyGMgdd
 0S36yLg+wuedzQ7puYrbrufU/47V0Bm6ep0OGPbbRvtMaXbgMcLWJ9m5YOJQ7Hg6hz+e
 C2vQ==
X-Gm-Message-State: AJIora+dLOdyJK6Xkq43st2KO0utkAbl537omPyF6US0OnbfKg8vOh/u
 4DsKsQ4Ec/RuuyX4+WRZEGo/Gv4DhLEAHQ==
X-Google-Smtp-Source: AGRyM1vwpew5RXH8GO/a14EwGIcBGUdWhSeqAwg3e/T6SHsNP2hKl8PqkuYlDtk8o8CmaUCMlkcQqQ==
X-Received: by 2002:adf:f306:0:b0:21e:4377:f956 with SMTP id
 i6-20020adff306000000b0021e4377f956mr779932wro.530.1658232674278; 
 Tue, 19 Jul 2022 05:11:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0039c5ab7167dsm22111287wmq.48.2022.07.19.05.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 05:11:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/4] semihosting: Don't return negative values on
 qemu_semihosting_console_write() failure
Date: Tue, 19 Jul 2022 13:11:07 +0100
Message-Id: <20220719121110.225657-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719121110.225657-1-peter.maydell@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The documentation comment for qemu_semihosting_console_write() says
 * Returns: number of bytes written -- this should only ever be short
 * on some sort of i/o error.

and the callsites rely on this.  However, the implementation code
path which sends console output to a chardev doesn't honour this,
and will return negative values on error.  Bring it into line with
the other implementation codepaths and the documentation, so that
it returns 0 on error.

Spotted by Coverity, because console_write() passes the return value
to unlock_user(), which doesn't accept a negative length.

Resolves: Coverity CID 1490288
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
console_write() doesn't need to pass the length to unlock_user()
at all, as it happens -- see the next patch.
---
 semihosting/console.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/console.c b/semihosting/console.c
index 5b1ec0a1c39..0f976fe8cb1 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -111,7 +111,8 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
 int qemu_semihosting_console_write(void *buf, int len)
 {
     if (console.chr) {
-        return qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+        int r = qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+        return r < 0 ? 0 : r;
     } else {
         return fwrite(buf, 1, len, stderr);
     }
-- 
2.25.1


