Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F05EC147
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:28:02 +0200 (CEST)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8kr-0001B4-OF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qb-0002On-BQ; Tue, 27 Sep 2022 07:07:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QW-0004mO-EL; Tue, 27 Sep 2022 07:07:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w10so8742403pll.11;
 Tue, 27 Sep 2022 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IOk5o82HlzTaRF4tA+m1XabKpzTdOlWa4a9Iku2Z2e8=;
 b=MarMC6WZTRnjGKtbJ+/SgdtdUhwaMAwWiTa6NCxabjkl6RGOLmqz5rSM00xZQD0/Ok
 qHEEqXGbPwUKH+74taZOLJWfAw/kHTfYSMRasvPJXeaSGHA/o0S8TyadDwX4tNb5Laij
 VR17l6AZ9OrO6OQHDv5VJs6z72NfEm/iWRqevmk7Cjhhr/lGmwQU1VqgqXrozhHYDsB6
 qbG3flK8ExigClWP/oFWIfI5bTbM2GKKyp8qZ9S8qLLbnDvO0/9iwKg0F6HcU0Lx+eTe
 EhrfqEdzLydEvqHQaPlakyszoDF9V9rHUdRezw4xWT+7TyuRGVDZaPVcqqKA0VM8JcKE
 Q4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IOk5o82HlzTaRF4tA+m1XabKpzTdOlWa4a9Iku2Z2e8=;
 b=Os1i7gepuAYcOXwY332hRx3iP0di7ccpXPLEu9is7Ond4Bd3VCWPsCF+l+mvuJEpgp
 hsPIMi7fehCJA6Zy5n6q9pUaZnDSUH5LkAJRwaFPZ8IF7V0uSCwI3ZLaM9KS5Z0mnwb7
 fT0N53S7CsHXZ6ke+i1I6RkoHWQPAfIImkeM4fKRceH7KXlDuwxEd5c4CuMG+vuoX8JA
 R3uJMW/2gBu9qdNq0veW78+6SKgjwII3+Y1IrybBLyjM1Ejz5hclF2hlIsCm+neCtbKY
 9DhQ3nGhT/KQvrgt70ssQEdosX8BsbjxQWcKZynQHgrS1avOmRDtDc7Yn0MstqpuErDh
 we2w==
X-Gm-Message-State: ACrzQf0XW5AhJuSDj7WcUzewYqtaHwpkzJ9M3FCXSWBCrS0xJajaBKBR
 iuQl5eAfTbE/apt3aYqxkz9Q69akXaY=
X-Google-Smtp-Source: AMsMyM4UjIooe4Wrok7vwuqleKH9/0A9t/Kil7ss+TG3Cqvi31voALfoXU7sauagV+LdC8j+5vnf3w==
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr4068276pjb.197.1664276819344; 
 Tue, 27 Sep 2022 04:06:59 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 06/54] tests/qtest: aspeed_smc-test: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:44 +0800
Message-Id: <20220927110632.1973965-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/aspeed_smc-test.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 05ce941566..c713a3700b 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(void)
     flash_reset();
 }
 
-static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
-
 int main(int argc, char **argv)
 {
+    g_autofree char *tmp_path = NULL;
     int ret;
     int fd;
 
     g_test_init(&argc, &argv, NULL);
 
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, FLASH_SIZE);
     g_assert(ret == 0);
-- 
2.34.1


