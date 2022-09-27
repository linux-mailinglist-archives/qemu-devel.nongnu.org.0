Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6B5EC2AE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:30:02 +0200 (CEST)
Received: from localhost ([::1]:53838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9ir-0004Av-OK
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S2-0003Jw-FL; Tue, 27 Sep 2022 07:08:34 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Ry-0005HD-JM; Tue, 27 Sep 2022 07:08:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id u12so793535pjj.1;
 Tue, 27 Sep 2022 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OBfXa3xFVi4lbcy7vm7XKQ/MxZiXQOmmQuqalNwWIA4=;
 b=Q17OGBh7nfuPlSvmIeeUDct3SAyQEVpdgKijs0bRcwMB1s1Jsj8uFwKNN3a/CMvEuP
 Y13usF6KO84Ym8WwRkNQdpNwo6J8MZi326KolbN6M5w+FzD80XaOayZUpDcqdl6edWd7
 Vof8inKF6d23kK23IycVoJ2QNdSdDxM2O4gOdBmYTWwaVRIxf5s/ya9Km88box8q9xU3
 wSrc3Zcf7GZy6oI3IARYFVPhXZL87ZK2sDRYN5Vf18lkaexOPwVD7dRRU+Rdupr/Pj0i
 /dxJjlWJzK+jNq/6JWYuXCtOrDjbOBxMY+cO3Zaxr4lKF6tFpYky6OEgGnwPv4zuwFIr
 Ufzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OBfXa3xFVi4lbcy7vm7XKQ/MxZiXQOmmQuqalNwWIA4=;
 b=bH51eFxwmsvXRpMG5kaGZ5P20m5SPJE8HIb1LmzHXf0GlT7OTMp/KU11TEMT8VUOfN
 fSvYYkk+nOHaE1F9CnQ+1RzXkreNmJoJIgm5mVJSZUaoA81Itr612fIpLiawN5eTHkAH
 3AtWRmSt9UNk5ML5NWwBtjKdNKWhj2WF076LirhsQiXIOSw8+bJqfj/0Fny9DDFMqTbA
 p23qOq1Wqqx+R0MchySS/5aZ7eVgS1SGjwNQyu5gNoyNo+C6l/vxUJZIdnWSov6TUbR+
 sfTj2Qlolmb/Rqzsy0BX0r8ufFVrzB1eciBg7OdRQyeb8mhMxoA/y8xuINC7/9Wq3VVl
 ly8g==
X-Gm-Message-State: ACrzQf3xtx+Wb18aSjgHuuX0OHcFGbvuimFaaPuEpcoyPYdWxInCoOSg
 wBIb7ipx1h9wjpPvcMG81z9CmZ1LcLc=
X-Google-Smtp-Source: AMsMyM7EvQwZ8zC2/tIDNSROHPNehKoiMbC/fOcFObTwZxkcRE5ACS6PAu/EMJRVsraBcrBXh8jVMg==
X-Received: by 2002:a17:902:6b8b:b0:178:7cf5:ad62 with SMTP id
 p11-20020a1709026b8b00b001787cf5ad62mr26219204plk.13.1664276908569; 
 Tue, 27 Sep 2022 04:08:28 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 40/54] tests/qtest: ide-test: Open file in binary mode
Date: Tue, 27 Sep 2022 19:06:18 +0800
Message-Id: <20220927110632.1973965-41-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
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


