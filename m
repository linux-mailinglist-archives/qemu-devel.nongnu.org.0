Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C272161D77C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 06:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orBlc-0004XI-DG; Sat, 05 Nov 2022 01:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1orBlH-0004OI-4m
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 01:30:31 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1orBlE-0003s0-Ek
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 01:30:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so6221006pji.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 22:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k5Uy0OiWF2UZFBGlBPPqg4zlg2QkR935dX5r1TNmVT8=;
 b=U8WVuyWfLD02+mxMXqZkRoY7YQM6L1G3j3OL4LsTxVRmm1FMf926LKZcTCkfjk/FVf
 wfjoUbaUPGsusfyW2syhU0R15umuJrUG8x5Ss6kGD/Conh8rRo6ec5CLr0X2w8HSQ4xr
 3Q9k+J7MMIa/qOcuWoGxM1ggIkXlPBucW3PHBafdvrsqulmprKaEVKNJuO2iIOiRGUF8
 eCsNODQxKCs2uijlBCCe1xFfjEOF6fN/ncRRQn3aesmBptQcgMLvSKtIPXCK5XWl4CBb
 B6MFW+RRvF+pFrFwmHUkgWXAbvE8Zl0b34rGBDF7qagUt7p9X+6l6+I0E/ekIpQgk/Eg
 BCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k5Uy0OiWF2UZFBGlBPPqg4zlg2QkR935dX5r1TNmVT8=;
 b=njsttuMLpDaS3geA4sa6EceVbKjY0pIgYhcuvT34ayZIzVsHRvWbx4LDFp/a/kqHer
 DqLqgmx6jwyuC5VhyRMki2E+3/jAeJr+2W0E6ZImgq2Pr394Hvktrs4nukmqHfHMcDwY
 0hgEdpaYHGCiHGfbK+1lP8Hdx/wVE8p+8TeVZriijWOedgp1Vx2BmKXMROq2FMDEyntl
 KsROXlSv/0UbnjpC+IuzVP2YNI6zEKKpqsZ7EUf5uo4mLbawHaMtgVdPNx3zC21BmdN/
 iTlPxRjCiKWuH0izCOvLe8V/CckZ2kqKnzCSF6i25EIdUE+c4j0S/jK3pcnWFEkIZjeh
 wCmA==
X-Gm-Message-State: ACrzQf1vZzGKedChoAF8aLNZjt4RQsNUS9K61rvVNUeaUhoI7HFFxyq4
 izjNYiDfgNs9b6byRRceK2rVLRwuMkBqXqv9
X-Google-Smtp-Source: AMsMyM5yQjXQt3Gb1rBk/NojbqaEeGxwnNC1bUgDsc8iP10/pwH42GaO47Xu3xlSAAXhnsDVAzcpuw==
X-Received: by 2002:a17:90a:2d8b:b0:213:b314:4652 with SMTP id
 p11-20020a17090a2d8b00b00213b3144652mr38252501pjd.96.1667626225426; 
 Fri, 04 Nov 2022 22:30:25 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a17090322cf00b00176d347e9a7sm678392plg.233.2022.11.04.22.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 22:30:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Use IVAR shift definitions
Date: Sat,  5 Nov 2022 14:30:10 +0900
Message-Id: <20221105053010.38037-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There were still some constants defined in e1000_regs.h.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 178d61d04f..21683dd0fb 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -30,9 +30,9 @@
 #include "e1000e.h"
 
 #define E1000E_IVAR_TEST_CFG \
-    (E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID             | \
-     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << 8)    | \
-     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << 16) | \
+    (((E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_RXQ0_SHIFT) | \
+     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_TXQ0_SHIFT) | \
+     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_OTHER_SHIFT) | \
      E1000_IVAR_TX_INT_EVERY_WB)
 
 #define E1000E_RING_LEN (0x1000)
-- 
2.38.1


