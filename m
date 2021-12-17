Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AA479795
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:38:03 +0100 (CET)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMnb-0001cJ-2T
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMkh-0008Vx-KR
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:35:03 -0500
Received: from [2a00:1450:4864:20::436] (port=40534
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMkg-0002MK-7T
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:35:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id q16so6847711wrg.7
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 15:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WJ9MwYBX4+lyuOeNMHH9h1NX0u1BTkZPB1Qpp/P6bb8=;
 b=eeWx5WwtmOtVkA+qNCfj+ruMDzyX0Rqq+bDSyy5RRua1pirCiI4brAh+LlPF63R03U
 8xTQawHo37cYrM2jED3XuGdRjlGr4A1dtA9jBk4grAGohmEseICrH/Fn1n3vnKE2bg3j
 ZgAT/wgiSLPgQMtvVZbitg3fm3jaMFYRPU25qxE2vaTnpTSDk6zY7eBVAQcM63mZWSuj
 hbxncAjHabT/8ErZC9PzHQGNkTDcuq62oSh6LctXQpAmbL5TpFJoqbee+h7ljP7hqn5B
 WEYRBiGUGsyajNyjLV5XYWAGtLx/anq5hPFmVDVdFGt+4rhmA+Uazb5afFdeeiKCWhj1
 r1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WJ9MwYBX4+lyuOeNMHH9h1NX0u1BTkZPB1Qpp/P6bb8=;
 b=UzLNg7QQqxEuU9dWduR8uaQzBQYX0G0/CKYLLoie7AVJhiPkmiLNmvM7zxdapQyauS
 aTmlhcySodUnVOeMYPGCW2cN5PNgUSra2Um/MG7CW5NFEHkHWQ8Db4kTqQnaPqQ00/27
 y/nD9LOcrDRt9gVJTKi6TDK/Wsr8IIYpts6EeFFKazqIF9KuCRn4jnkAyhYNfqAz31cY
 Xy3K8lXvA9CVppm2VfiO5x36CIdoAYB6bcmM+u8q8Os92tIN2VJzeWLJbFNx7KC09dgA
 ycNtpWkT0F8vkzCZ/wuNpAf0X1Sfceh/aCTKU+LihlnYwMTxcLICFjavzNXavC35yr0c
 SF2A==
X-Gm-Message-State: AOAM533YUhHQJJf4QqyjkfJTJTZxtM5k7ld26gezV9gwH0oEqgayQAHc
 3JavtzIZCPRkLLmhyL4UtLxS1JUD920=
X-Google-Smtp-Source: ABdhPJxVo607sIzUdoibbyxQgweTvbHcQMpz8ZCkzBOdPAplRS0Z+nMckSzUSJvbQN+cpG3jnnuZnA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr4228971wrv.73.1639784099665;
 Fri, 17 Dec 2021 15:34:59 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g11sm2966646wri.73.2021.12.17.15.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 15:34:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Align vector registers to 16 bytes
Date: Sat, 18 Dec 2021 00:34:56 +0100
Message-Id: <20211217233456.1475527-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Align fpr_t to 16 bytes to be able to use the TCG "Generic"
vector operation expansion API from "tcg/tcg-op-gvec.h",
otherwise we trigger assertions in check_size_align().

See commits ec8e23e37f8 (s390x) and 11e2bfef799 (i386)
for similar justifications.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 56b1cbd091d..15b983f7104 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -30,7 +30,7 @@ union fpr_t {
     uint32_t w[2]; /* binary single fixed-point */
 /* FPU/MSA register mapping is not tested on big-endian hosts. */
     wr_t     wr;   /* vector data */
-};
+} QEMU_ALIGNED(16);
 /*
  *define FP_ENDIAN_IDX to access the same location
  * in the fpr_t union regardless of the host endianness
-- 
2.33.1


