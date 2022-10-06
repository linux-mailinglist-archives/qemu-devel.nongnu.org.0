Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0795F6AE0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:43:31 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogT22-0001UF-18
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSYA-0003k4-Bb
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:38 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSY8-0004du-6l
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:37 -0400
Received: by mail-pg1-x536.google.com with SMTP id c7so2100887pgt.11
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkoA3/IdgkFbPFM7JOrL7Fwi0zdak8HIGCewrWVpcWg=;
 b=UXducB6WIlPHbBbEwxzKyEAsQyjAYTnngzjFpmvuF08AizvF9HTSGbdPlE4PAVxyqa
 12vIFLK5+8EKr3w2J0Dt9NyJucakRuviQLFG9uM+YZC47z8HnECWoBNsWMRuxj807I7m
 l+HrYxLAaGE6XEMsCFPH8RQBEriT9Yvq1zF3aZQmKhHrWBj/yAAb1nTLDX3yS7f7Mjzu
 QL92KkNLQq5YZfTBC4UlK+rCcaysMVpnWMPxybFeFVy+vo0RgKhO9ibPV1U8aMunMYak
 jtVy4Nwt1spFyQdVOtge4joW0Hz51kLZi+fcVUQug9ydzIdOYa7yuWLyj5iNPKMtf7wn
 7New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WkoA3/IdgkFbPFM7JOrL7Fwi0zdak8HIGCewrWVpcWg=;
 b=N3SRyVH48z+pffzd7ZT1NHUzy7tayjqA5PmLD21po5ViB/z5luVgxEf9Gta5c9mtHL
 GRVrW1JXKm6/IzQnM/UAqJgxHLsuscq9V1uTfMLjAGMGXZVHv+Oxm68vxNGfHsFzG4Nt
 YeXetuXxft2+60Oe8UnAJpc9bp2RKsm5AXK2m9oyJMbKDsBBJBKPxWw8LpWEHbYZF83H
 SD8+M2hB8mvQLzap2iaCLRKD276zmEB3kXjR3zgMwy+Mmc/2p9WW7GFjPGx6iPTa42CZ
 tmECSqQDvp7wGeTyPZFavNhMNiVzSkE6/rKxXThF/NWQE3vwcSKzPybzLybHKn86jenP
 pNzw==
X-Gm-Message-State: ACrzQf21EzjE+4s0tWHkO3x5XdI9f3X64UuyN3xtp+a7x9T2rMSLAiV6
 AKFjnFLKl9G83QDiU4ccaAYLzxDaIqc=
X-Google-Smtp-Source: AMsMyM4jETCHZxXBwjGwCJa0zoIlWOe9kh3+CKs2RNPaOV0XvYTl+I4nil3sZzMnoVmA+2M3VbEezQ==
X-Received: by 2002:a63:e442:0:b0:438:7919:adf with SMTP id
 i2-20020a63e442000000b0043879190adfmr347912pgk.4.1665069154525; 
 Thu, 06 Oct 2022 08:12:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 18/18] tests/qtest: Enable qtest build on Windows
Date: Thu,  6 Oct 2022 23:11:35 +0800
Message-Id: <20221006151135.2078908-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

Changes in v3:
- Drop the host test

Changes in v2:
- new patch: "tests/qtest: Enable qtest build on Windows"

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 455f1bbb7e..8701c3a8e7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


