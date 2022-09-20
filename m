Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F95BE708
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:27:41 +0200 (CEST)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadHo-0003YS-Fn
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ6-0001HW-9k; Tue, 20 Sep 2022 06:33:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ4-0004yf-Hf; Tue, 20 Sep 2022 06:33:19 -0400
Received: by mail-pf1-x434.google.com with SMTP id c198so2286036pfc.13;
 Tue, 20 Sep 2022 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=awzAMIJYKF7cu7o7r8nJlieLkv87kMXItIakOVnPH/c=;
 b=blStzgLayCuQDhLDYUk1259pcgLRKrsM5b8rslWM2S/MNQuLITgNoaYp0UP1QHPhh+
 L7XEe2ICMVCNC4Y0tpKhh7PE33duLRdkoGBL7alYQZbfsIzVwznHS5bhY7RzNzfMgkrj
 Kd422nUwTABhZ35HKeSwpg/fQCPx5wxC3CJO3yrDh4Lm6cBNdUEmP1ycCc3jB3S2xBOO
 o5hyFEVigMpTnfsw9BBlRNDOAaI2yIYIQujSr6vvilGAWUUoRkT0Z3iw1gnaoW5JgYzw
 7+th69B7BZ8Uob1BKPwvcCU4Z94Yfy/ZvKtk7awo1Jju7760d+Vu9QFwUaNtI4ex2sQv
 6ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=awzAMIJYKF7cu7o7r8nJlieLkv87kMXItIakOVnPH/c=;
 b=BTRT+CU+z/rWOKt34WQ4UzuBqV/1VN5Zj4tpebhnr2s4OA05X4r9mwJI+PjDuClYbv
 IH4JXNSjeHpezErAQkSbWjHEYeatmGoZiDAG3P7F2/B7snujD24joVm3B6GL7w6ABbcg
 SzNMaoLjB2e/gk1cv9AbSuNnCrUTiScjzvB3UsvF6jPuYw43p+pIUJkA0EjM7GBHWL8P
 EzZGd+5tnXW2H9JrahkNaoXzdhL/SO9ivX2rlH4fH+fCCx0I4qUc9QV0gEsftxXkSXmB
 KTtAG2012dCuueuwosOia3r/dWjR/fFYTnYH6ThD6RmKbboU87Q2XAdOYhrA1OXuIYHn
 aaXw==
X-Gm-Message-State: ACrzQf2O0qOPCOvEd9MhXN/RZOqsVTQNvywBUfpLoRKPNrFEtOi0LSgy
 ajrFy8IBLV2NatsiffDqXZdJn4UDc8U=
X-Google-Smtp-Source: AMsMyM62c82JH7BgmvavokMPLnsy5RD1mi4J/HqKY0BPSUce56sAON8irFvr1KGzMGzDckRgUpSLpA==
X-Received: by 2002:a63:d309:0:b0:439:a5df:c64f with SMTP id
 b9-20020a63d309000000b00439a5dfc64fmr19966790pgg.278.1663669996380; 
 Tue, 20 Sep 2022 03:33:16 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v2 23/39] tests/qtest: ide-test: Open file in binary mode
Date: Tue, 20 Sep 2022 18:31:43 +0800
Message-Id: <20220920103159.1865256-24-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

By default Windows opens file in text mode, while a POSIX compliant
implementation treats text files and binary files the same.

The fopen() 'mode' string can include the letter 'b' to indicate
binary mode shall be used. POSIX spec says the character 'b' shall
have no effect, but is allowed for ISO C standard conformance.
Let's add the letter 'b' which works on both POSIX and Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v2:
- Drop ahci-test.c changes that are no longer needed

 tests/qtest/ide-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5e3e28aea2..4ea89c26c9 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -892,7 +892,7 @@ static void cdrom_pio_impl(int nblocks)
 
     /* Prepopulate the CDROM with an interesting pattern */
     generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);
-    fh = fopen(tmp_path, "w+");
+    fh = fopen(tmp_path, "wb+");
     ret = fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
     g_assert_cmpint(ret, ==, patt_blocks);
     fclose(fh);
@@ -993,7 +993,7 @@ static void test_cdrom_dma(void)
     prdt[0].size = cpu_to_le32(len | PRDT_EOT);
 
     generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_BLOCK_SIZE);
-    fh = fopen(tmp_path, "w+");
+    fh = fopen(tmp_path, "wb+");
     ret = fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
     g_assert_cmpint(ret, ==, 16);
     fclose(fh);
-- 
2.34.1


