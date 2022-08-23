Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049159E605
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:31:45 +0200 (CEST)
Received: from localhost ([::1]:32860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVsU-0001iQ-Gc
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn6-00022P-99
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn4-0000SO-No
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id k9so17463055wri.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3fNSUwJiW7BbQBy9RsNgQK8fZTGXdhnAyu5t86LKQy4=;
 b=dWtQdhnwjHKLOUkPJ+YXUTeD1VqSa9RLuHaHptuL71+C+TPyWQ9bhLGTiCRkkHOpGo
 CMQUCmNSZfVCVz/j6Lxa4y2UKRe0CT+yH2tnR0gmfbiterv4hE23mg+n6YwvntHDWsHY
 3slVhYvPKQBb9RXLjdk597PftwwB9ZhhT17c0OywLrQCcgOdVyTJKkby3qzta5d89GNP
 IMSMESxSw3UU/sfNCqgxBLu8dKkDvrnl0PZ4yDOyw/f+Y464t1pfmDfw49DlvgT0lyUb
 AH33slbJ8k+iCQMpdStWPuSaB3mU/kxyRtg3m/5tGdaonPhrpPgChBGNE1S/vaEWwywz
 bClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3fNSUwJiW7BbQBy9RsNgQK8fZTGXdhnAyu5t86LKQy4=;
 b=NuCsJ5Qww8L7lof5uX+tkMUUV9zMytYu3B6sUIYRwQJMT5K9rTx1nwjw6nhfX5ltQo
 4Nl32/aHDxJr/UQu17VUW/PTFgY/j8rYcPFO1G+wDJKNijqLYpdHsG1wtqerzsw1Jo/2
 bzuFsUkWobLruXt+j+1y/6C9zjasUHUb2glZIjeI6h/dkDHPFh5tAGodF/LRTNHScoqt
 U0qh0xx4hgyReD7decZom4PsACHQBITbGZEa1enYwwvNd0e9vSlTsBPZmqyEbes4ykjI
 KbQjS8ZrCC97MJ13jWxaKfSA+sX3q5dBYNVcD37qjO+jAkI0UrEPToK56iUApbLedJpZ
 eMew==
X-Gm-Message-State: ACgBeo01r+XjRFTMqsWnLAzjhHYs6Ctwg+7yguG5QT12PHlYwMVVtU62
 2TuF/vtdoRnIx2Kv6cEOV0WsMA==
X-Google-Smtp-Source: AA6agR6/E1K2VQkJY+qAQUfytdeGADUKcfdI1hpURfa7GbAZfRQMrHDr08nJlUTTH+Sghj5zGdQttQ==
X-Received: by 2002:a05:6000:11c8:b0:225:3316:6957 with SMTP id
 i8-20020a05600011c800b0022533166957mr12551783wrx.218.1661268365377; 
 Tue, 23 Aug 2022 08:26:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056000181b00b0022549ac786asm9079816wrh.47.2022.08.23.08.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:26:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E39FF1FFBD;
 Tue, 23 Aug 2022 16:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 5/6] tests/qtest/migration-test: Remove duplicated
 test_postcopy from the test plan
Date: Tue, 23 Aug 2022 16:25:57 +0100
Message-Id: <20220823152558.301624-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823152558.301624-1-alex.bennee@linaro.org>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

From: Thomas Huth <thuth@redhat.com>

test_postcopy() is currently run twice - which is just a waste of resources
and time. The commit d1a27b169b2d that introduced the duplicate talked about
renaming the "postcopy/unix" test, but apparently it forgot to remove the
old entry. Let's do that now.

Fixes: d1a27b169b ("tests: Add postcopy tls migration test")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220819053802.296584-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220822165608.2980552-6-alex.bennee@linaro.org>

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7be321b62d..f63edd0bc8 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2461,7 +2461,6 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     if (has_uffd) {
-        qtest_add_func("/migration/postcopy/unix", test_postcopy);
         qtest_add_func("/migration/postcopy/plain", test_postcopy);
         qtest_add_func("/migration/postcopy/recovery/plain",
                        test_postcopy_recovery);
-- 
2.30.2


