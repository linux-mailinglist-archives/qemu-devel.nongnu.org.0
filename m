Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7359F867
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:12:18 +0200 (CEST)
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoIy-0005RM-IM
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmur-0004Qv-7y; Wed, 24 Aug 2022 05:43:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuo-0001kK-QI; Wed, 24 Aug 2022 05:43:16 -0400
Received: by mail-pg1-x536.google.com with SMTP id q63so310853pga.9;
 Wed, 24 Aug 2022 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eEoKxp42Yd3WBOROS2c0qiQDyg/EAnV+AW6xakgUti4=;
 b=VBq3AAQqrP8uyu8gEHd6zVduVlv5Ef+ui/ZaK/yoS01xBZkfkrfB599Al+MK154LGr
 BZ/YC88oX42d3ShsrSfa7VcVx/cZcsYESbfCAgWkMC1rdcqbXVHh5wQlDwz41QlXs+++
 YxrEC7cyBhY9iyDftLFX5S2RZVFUAO2RGKX6XN1Mrg1HIk1FwTOKGsrPiEK/7TOyepNe
 OoykRdEsyE4n+m2AcKDGsQ1oVezGmqOQNBJ1oju3r8EwRtR0672jX3X3FeV7eS5UEbpv
 S+FktJ2wGxzZV3WyMb3iBywP18dt7BDAsE/Y8kaeIVTOs7IPCuUO2caObQICxpandBgn
 4cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eEoKxp42Yd3WBOROS2c0qiQDyg/EAnV+AW6xakgUti4=;
 b=BAUFO3aqYf3a1+kmIvUSwaXB6CX+mUf0CBUEi+nkIGzZ0WKqDQ1X+68kRQ1HOHfyl1
 RioyckEjdVYO47jiBWkF3RK6yMm/3WWnnb/0rX8rhbQdYsua+mPZTamqY+q4iXPFJYPr
 JUdRtce7BCDsmJQ5r4Y0E89UB82+FIgYfTrA7sjPjyMnwS0oGJozWDKKrM7jbJNE5D3/
 y6JBHyipHvjWHjFuRyyhRVJa6dhj42kUkH48opN+gJKajGtP0RMGabx9yBn2QI6d6CTE
 rG5CbO7hObqavI++4pPJU0DOGdJsb6z7UyeuqD1bsmRU6kQ/Km0NSsz2Hx7kwdkKlfqP
 1DnQ==
X-Gm-Message-State: ACgBeo275WcJd3vc49n0sZ0NsPDL0of8RO95kcyjeY/KLEt01gMJcr9I
 6/g86+XwzN19Fo+XL+oD9NQo8NPaFo8=
X-Google-Smtp-Source: AA6agR7xNemF/2rVM3wx90IZYhfUNqRdR8Tbsqs9yvCnWdWSUsBtlzX6r1sK1NIr4hYOcTm5evluhQ==
X-Received: by 2002:a65:6d9a:0:b0:41c:c77:7b6 with SMTP id
 bc26-20020a656d9a000000b0041c0c7707b6mr24403796pgb.139.1661334193051; 
 Wed, 24 Aug 2022 02:43:13 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:12 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 38/51] tests/qtest: {ahci,ide}-test: Open file in binary mode
Date: Wed, 24 Aug 2022 17:40:16 +0800
Message-Id: <20220824094029.1634519-39-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

By default Windows opens file in text mode, while a POSIX compliant
implementation treats text files and binary files the same.

The fopen() 'mode' string can include the letter 'b' to indicate
binary mode shall be used. POSIX spec says the character 'b' shall
have no effect, but is allowed for ISO C standard conformance.
Let's add the letter 'b' which works on both POSIX and Windows.

Similar situation applies to the open() 'flags' where O_BINARY is
used for binary mode.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/ahci-test.c | 2 +-
 tests/qtest/ide-test.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index bce9ff770c..be11508c75 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1453,7 +1453,7 @@ static int prepare_iso(size_t size, unsigned char **buf, char **name)
      * Close the file and reopen it.
      */
     close(fd);
-    fd = open(cdrom_path, O_WRONLY);
+    fd = open(cdrom_path, O_WRONLY | O_BINARY);
     g_assert(fd != -1);
 #endif
 
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index c5cad6c0be..ee03dea4fa 100644
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


