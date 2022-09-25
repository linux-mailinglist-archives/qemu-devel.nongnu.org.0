Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CE5E9301
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:16:32 +0200 (CEST)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQYh-0004Od-Iu
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs8-0003Nb-Fb; Sun, 25 Sep 2022 07:32:33 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs3-0006Rt-7N; Sun, 25 Sep 2022 07:32:28 -0400
Received: by mail-pf1-x42e.google.com with SMTP id c198so4138848pfc.13;
 Sun, 25 Sep 2022 04:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OBfXa3xFVi4lbcy7vm7XKQ/MxZiXQOmmQuqalNwWIA4=;
 b=dCsDknvWnfotQeY7AC9SontTAI7/UX8fr/91Hfq9NBI4f91dl3DmCkLjGFcfdu8u+L
 CArNlDYUIrvqe72Wl9hSFAYLgb4C2ykB31jcboIUwmjxJzAcp26HTdalE0WepR7Yi87N
 rBTL6y3gqcmquY0hibe0L/jq7PC2JBQpKRnGbTOtSkDZXtq8V9zISe/dtkwpTbK+sB6p
 Ar+AixcHICI/8sx5foVDEWM2uVt7bZWyGNcxz6E1pA6SgYmMrE0zxtC0xLptEn8qRCWg
 2LU/CqEEO9tCyQj1gxVuhRPM8+L4lbiyGRtlXFoxBpgJUPLLCGnqTP6L9MPWpzk4h9N/
 171A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OBfXa3xFVi4lbcy7vm7XKQ/MxZiXQOmmQuqalNwWIA4=;
 b=Mf1FTmsUkGQRBaJuxTvjkPmfHUw/GWFgDjfFc2YP3DLAOoxarokI2Sd3AaD2R8nRjT
 vzuBqM084gMY56nVlhv3asnKCLMmgKWOK3puNWjZ4n4XBmUO5Ln+ocQdEsBISVGnqRfW
 2QG2PYY7mQ+NhFJpGYEYSBWXZ8qx+nElARSHqJmzv/MwHGsEVWWpcCz/WnoLWDlq3lBv
 mtgYFb8BPuPzjqff0Xiz45L5Hf+acx7RvW0lSURafnFEdeL6Lhbty0KvSyDU6xIxnAYl
 lW0GSeF8TqfR9I0tyWwSBp7TfBT8kHvbJsl9JZLQuhFwZ0vlZftbvB0iSOnsXoKlDv94
 9JJg==
X-Gm-Message-State: ACrzQf3JOSx4tRsNXu5DX9JrZ7juUuFehQyzAubQKOHrO4XciWVsNJph
 vt9eQ28PnYqZONqp9QF/3zxuRIWfNK8=
X-Google-Smtp-Source: AMsMyM62rQF2HCdx52L2ETTIilN+MAkxuVk8L/p1GhZGWYqDye0ZHnw+4ZI23tvKFcj+MdFfMbiAJA==
X-Received: by 2002:a63:698a:0:b0:41c:8dfa:e622 with SMTP id
 e132-20020a63698a000000b0041c8dfae622mr15084465pgc.465.1664105544646; 
 Sun, 25 Sep 2022 04:32:24 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 40/54] tests/qtest: ide-test: Open file in binary mode
Date: Sun, 25 Sep 2022 19:30:18 +0800
Message-Id: <20220925113032.1949844-41-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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

(no changes since v2)

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


