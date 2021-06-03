Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881F39A5B5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:27:49 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqCC-0007PF-Ir
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl6-0001tw-VD
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl5-0007JG-8n
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id i94so1347433wri.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=umKlYqbHmDGAhLtrJPTkOzCMHctMqp53oORvJhnAQvE=;
 b=b+RnnyTY02ccACDmzEG/ArDgV8bq5ySPA4SWnzClpJOcltvl6Paxt2nQ9IT8Ie41SY
 5+NWJmHwqTx16eEmHcLtUs2YIPe3meswxn4rmIHoPY+vVG3wYrVbokSLfEk6X3Fr70CF
 3oWKxCcN6eVWHMf3jSvt4sNMoC9ef1Pq4fFZ54kZjCF2Xj5I2OrBujTkJG6LWrKpZjV3
 Bu6IIawr5nQjq/EoXaL8oCQfKtQtacPJzF1s72DxVg+VKLiYFqfQuRb5CjZxaX+Ya4Wn
 wYG3ZnmISu4QptrV0ZDwt8TYQDl5nNft+AEB3cBFiJYRsNkzFXvQ+5TE1wRVsU1dCvqg
 JIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umKlYqbHmDGAhLtrJPTkOzCMHctMqp53oORvJhnAQvE=;
 b=Sixu+jQRRopHW4wukmMU89b1ssjpfpiU02lQaLpgdexkEGQpeZLH9g6ai03/RfivdD
 0GhQjio1mVZtJl2qChzNrdL3idoKVMKugZjplI9yOS1yJzaoJxWa1TmvMAT70SKrot7s
 rG0oet938aJ2atK4J7pEiUgNX7NoiYlUEwfbitetttDsNlCqtiNEQMhB1VTszS+Zt4tU
 1WCOH2wR8ZrMh2HlRnEKP8U2snCM2BAhDXShfm0ELmS4v4L6pzgKOyCzYBY8zUv1xo5E
 Gwr2wjeVcg9hYi8jncd8/uhMd4vpJIT2TYKHfhnxnNPsXq4xSCoiQFc/H/zqryuTGEm0
 nHiw==
X-Gm-Message-State: AOAM531JyBhYDc2dyLPljkVvcaXO1IOR2Gecq4sjle75Eq678EEZnzb+
 DA+1BJ6c7br4/Xt1JTJshjaMTVwfmrnBJ/DJ
X-Google-Smtp-Source: ABdhPJyEqxyyrVpgee4JqvtfdzF/GnYthKftmB7ShRWoHZs+grwcN7BxJcrWSz71164S9YZl4hXqKQ==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr660817wrs.22.1622735985936;
 Thu, 03 Jun 2021 08:59:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/45] tests/qtest/bios-tables-test: Check for dup2() failure
Date: Thu,  3 Jun 2021 16:58:59 +0100
Message-Id: <20210603155904.26021-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity notes that we don't check for dup2() failing.  Add some
assertions so that if it does ever happen we get some indication.
(This is similar to how we handle other "don't expect this syscall to
fail" checks in this test code.)

Fixes: Coverity CID 1432346
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20210525134458.6675-2-peter.maydell@linaro.org
---
 tests/qtest/bios-tables-test.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 156d4174aa3..51d3a4e2390 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -489,10 +489,14 @@ static void test_acpi_asl(test_data *data)
                                                  exp_sdt->asl_file, sdt->asl_file);
                     int out = dup(STDOUT_FILENO);
                     int ret G_GNUC_UNUSED;
+                    int dupret;
 
-                    dup2(STDERR_FILENO, STDOUT_FILENO);
+                    g_assert(out >= 0);
+                    dupret = dup2(STDERR_FILENO, STDOUT_FILENO);
+                    g_assert(dupret >= 0);
                     ret = system(diff) ;
-                    dup2(out, STDOUT_FILENO);
+                    dupret = dup2(out, STDOUT_FILENO);
+                    g_assert(dupret >= 0);
                     close(out);
                     g_free(diff);
                 }
-- 
2.20.1


