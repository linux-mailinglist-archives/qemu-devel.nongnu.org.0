Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A556511F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:43:07 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ibi-0005ua-N0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITH-0000Ic-RA
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITG-0004xB-DL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x4so8469442pfq.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pR1kqzu7xwtxnUko8pBi5w8sHK9mw7vU5UGn6K+yNzI=;
 b=YDLM+t8juK28vWXHYDwK8oJK3P1dz6deSepRcCQcpEntdO+rK8TtX8Sl0YPJDUGNYn
 ye5oLc0hYESnDy2RoNo2s6mHW2l9NsiAr53ij7fjBFhQacRB381gVRHwiTA0Hl5pq3E8
 Aj/FSnLHJGt2ap//ICunmO0LYEZd4gWVtw43pgopRikJ8nb4YXW0QprGSFJfJ2RxNiQt
 x7gIUV43Ozr6JmPySmr+75Oos+D19Q+UVmkhaDPsFc+EqspDsakdyjJT53mHuPorXRFa
 yRTn/GmAKcM5vvfK4IQVQwcIVhQBhHqzOsfB29bZxsRQVkd499HAhDhx1S8kekaEwk78
 KxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pR1kqzu7xwtxnUko8pBi5w8sHK9mw7vU5UGn6K+yNzI=;
 b=2ersxYi30vAkDBHdVJ3m5qFKJ8FinYMZyb6V6gnF/vRQeimIa8AU7wdHOAD2mreEME
 ifOQmjYnMt+vNmQJGdv2Ycj9FAJevsGpWo1gECClt6iCZGXviuTkNXb4BvlrK2PW4+t1
 7VwM9wNXl0KlAGMLnETsm2tmw9jjmz+BeAVeMgxOqqRK/uACE5tx1BMLtmAo2f/6GxZi
 1qOa7Bsp9JjUiYtS3wTkEFWRf6KkhpEvucSG9HeaC3/COfB5/6lI68038rTD4SjruqSh
 yPinlj3Lfh4JN43B0lWU37YVgXOBONawU2yHbdOCnArQYlgCKr5vGphOWxbSooKIxPuC
 0Q2w==
X-Gm-Message-State: AJIora8sgTCSfccXganCbALV/e56emWc7RIGsQTGo4dDnEFtUT0X8UGN
 K95/C++jVnSqczxwLcnVvA+ALl+41K9VWfYy
X-Google-Smtp-Source: AGRyM1vGk3/7aOxgqOhWxxkeBGpv8bw6Dp3Bm6mVKOyT9M/PjH5EXdgVxxcSHiE/UWQ9X0TiHe3sXQ==
X-Received: by 2002:a63:4d5f:0:b0:412:12cb:b09f with SMTP id
 n31-20020a634d5f000000b0041212cbb09fmr8964166pgl.26.1656927261015; 
 Mon, 04 Jul 2022 02:34:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 06/23] scripts: add loongarch64 binfmt config
Date: Mon,  4 Jul 2022 15:03:40 +0530
Message-Id: <20220704093357.983255-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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


