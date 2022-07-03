Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76405564671
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:35:32 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w0p-0005S2-B8
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vS9-0004p8-St
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vS8-0004AN-Ap
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:41 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c13so2313105pla.6
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pR1kqzu7xwtxnUko8pBi5w8sHK9mw7vU5UGn6K+yNzI=;
 b=HrjsaLr2QC4GpVt/OAmW1OU3PzhNj5PAkOQryGbxF3dHzuPS+QCpdvC1GRSU5Xh8zS
 bMDBuPynQtGGy+oCkm4gfZ3z7pDjijpk7i8LlrY9MqyLG0qR5MzfBxymcdDmVAAhyjRI
 QexAb1tZOpWkvHt7ADu2XwSc4tlGMWREYYRQntCINZ4A2x5NOHzfZfJ4J/1RxCRbVbzW
 wHqJW/1nKdo7VWP0tHoBJ3Qa9SFrIrdIHS+gSxALWlNQl+5FV76m1Q3MSY0oIp+6CQXg
 UnwWb/ntunuBHcjOCQcUijDVKQ0hCeBhzW64LOvvDPQUcoyKaCtdw0lPaCIcvFTKBBg+
 pN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pR1kqzu7xwtxnUko8pBi5w8sHK9mw7vU5UGn6K+yNzI=;
 b=wxNzK1wxlk95eV/UICstHrNN0ziPlrMAsWQCXq9KYz1JJxk6p39YIjShiWG9Si7TSo
 vRYW0BXorvhO66reiz6FiRUICgm+yj9N7pLaqUjn4sS7hNdLw2DPl6yw/KFI8X8IUvc3
 +X6lYl8dWsH5aw48H3qcs3EZgD+69+44j4JzIXw4KRAjz9gU7qdq2C1GBpdphwOD+Vj6
 +8lR0ki+3v3PLa+6aJp2W6ITAGN9eLZInFIzCatSc9DP7pFWFlXOl+utnN4MU428egRm
 dyy2PvBu8+8ZBkvU/vhUVQu6+b7YCFOUiJYi18oNqsF6jLHNfVBVzkBa+fgGs+p8xydj
 5M3g==
X-Gm-Message-State: AJIora+K6nFes7aP7/8DT96ojxisPqVzWmBwJHf+2gJmqrvQ8O9yylRh
 GWIjSKH68usol/ZpkVCefKRd71ov1FXFZdJ5
X-Google-Smtp-Source: AGRyM1tx+ypKI183fH1xKqN5DTuGPIMHH0LVGiboBapcWv+JZS9jae0rnJczJiaZw6jKKtIGHGT6bQ==
X-Received: by 2002:a17:903:2345:b0:16a:28ac:1c1b with SMTP id
 c5-20020a170903234500b0016a28ac1c1bmr31421493plh.106.1656838779045; 
 Sun, 03 Jul 2022 01:59:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 06/13] scripts: add loongarch64 binfmt config
Date: Sun,  3 Jul 2022 14:29:06 +0530
Message-Id: <20220703085913.772936-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-7-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/qemu-binfmt-conf.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 9cb723f443..1f4e2cd19d 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -4,7 +4,7 @@
 qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
 ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
 sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
-microblaze microblazeel or1k x86_64 hexagon"
+microblaze microblazeel or1k x86_64 hexagon loongarch64"
 
 i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
 i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
@@ -140,6 +140,10 @@ hexagon_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x
 hexagon_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
 hexagon_family=hexagon
 
+loongarch64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01'
+loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\xfc\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+loongarch64_family=loongarch
+
 qemu_get_family() {
     cpu=${HOST_ARCH:-$(uname -m)}
     case "$cpu" in
-- 
2.34.1


