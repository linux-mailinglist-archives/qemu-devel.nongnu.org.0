Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42F508FF5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:05:59 +0200 (CEST)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFeI-0000Ym-NO
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhElB-0002GQ-Ne
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:09:02 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl9-0001bT-9t
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:09:00 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u15so5133990ejf.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ey3ZKqoew2kiA5eRRS7zHaD0MZADTFHGgiQpHdxA5Ok=;
 b=FTUE4BqxC8s1n+mVkVp/QzNnsio9zVfUvFosR4MvLZgBVS84sW5Kdpije8Yp6WIhEJ
 TKffKunBjgTHJIrVvaqSCYjKFTd7b+s3MLcX7uePyawa4KRDz1LzAgI3iqBPJqKYVDaR
 ZAr0dPieMfDk2ChgCQ3RKsKUPcoz6TfDdo1SDXhzvnKdNqFktjOO6UEJ3q8S4RNgvj8e
 iAkyFQhaeVFJuEQq9CW6BXBwUzAsjDTD5uDuMfa8O9+6N/kgU6AU4YJJZS2XqEveUzlY
 uWi/ypAC9gO9rB4Kl0ebNuPQDaD44utiMX5nODb8xGQnL0/06NvTI2Ufu8uqOtoX+Wt+
 rKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ey3ZKqoew2kiA5eRRS7zHaD0MZADTFHGgiQpHdxA5Ok=;
 b=5z2apTB822l9p9TRMPrTibjiv06yRlGdzYdpIZokl/8LI17nFI0ny4PyyW3BuYSXFR
 kDnSpMoz/Ijwaay5CLl0xZQ00dKTapFlS7u+RaQgkb/OY3yLBTyah1f+0Hi1VxIMXmPI
 l97c9T4buJCtoS6oCa+TpAmhnB2CRywUBfRDu3Yj7SbIpwUK+elTjIkVdy6h9f9cgdFf
 XtmsN7tqnYFVj6/AZBXOszvNZnZxWCkl4LbTH6l54cR1A9DN/IYXxryFKbdBqfFIHD1b
 lAnZHQoJi4TLNvsG9GEq9tuKwG9kdwop9U0GexObQZo3IfTnEjS18wmm+2617W5gKQbn
 AJUQ==
X-Gm-Message-State: AOAM531QeUdWBsCdZS2qCil/ApNapvvxIX/ydN8tn0UmAOiRnmJeWSY3
 BOLzV89cNDsel4I065H3RPLt2g==
X-Google-Smtp-Source: ABdhPJw64eWMrmNgxT1cU7JZqibyyqtrtc6mtTC6FN30LelcVTbyKfFZ7pkPgs7aKEYyvukbqY37YQ==
X-Received: by 2002:a17:907:1c9b:b0:6ef:5e62:fd62 with SMTP id
 nb27-20020a1709071c9b00b006ef5e62fd62mr18225735ejc.686.1650478138018; 
 Wed, 20 Apr 2022 11:08:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lo15-20020a170906fa0f00b006e8a81cb623sm6987461ejb.224.2022.04.20.11.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1416F1FFCD;
 Wed, 20 Apr 2022 19:08:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 21/25] tests/tcg: remove duplicate sha512-sse case
Date: Wed, 20 Apr 2022 19:08:28 +0100
Message-Id: <20220420180832.3812543-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already generate the sha512-sse case in the i386 makefile which
works for both i386 and x86_64.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: f8a4c6d728 ("tests/tcg: add vectorised sha512 versions")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-22-alex.bennee@linaro.org>

diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index f9fcd31caf..b71a6bcd5e 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -22,10 +22,3 @@ test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 
 vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
-
-# TCG does not yet support all SSE (SIGILL on pshufb)
-# sha512-sse: CFLAGS=-march=core2 -O3
-# sha512-sse: sha512.c
-# 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-TESTS+=sha512-sse
-- 
2.30.2


