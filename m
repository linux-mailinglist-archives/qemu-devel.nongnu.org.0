Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B86137A9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZ6-0000j9-Jx; Mon, 31 Oct 2022 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYh-0007wa-JU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001FL-BL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1422266wmb.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1c2b7Q7q1SEFZIH8VI4BhrqJ/b4v64bPVNJSJmKD4M0=;
 b=ebeCKbnoJXyONIlkf10ntHNX1J0m9BH7UNmc5i4zeTW3to39gbOdsXixKShWbi9KWI
 laLQpBGugTZz57qy1oQvQkEMauDno5t2O8A3SBA1uAMmlTrsRLXA+NRHfIw7YRxJgNnS
 e2OOgqq8/l+Nj9aWYmIdB74Ld/jJo1PM0fjZsAdeC5fz3/G20bqJt6m/sGTJAuiqPLgq
 aIy8qkpGBhTPBDnC70PUdgtoz0CeoGF3Xe9WmpT8ahJWSO2+KG06F2wcPKqWvxtJSllU
 vrAbOmY2jSZwG7lR4a/S36S6RCDrU2iLklkpzByaZ3uOGtez5obEdm+QbqCmjJQl/gh1
 Ziaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1c2b7Q7q1SEFZIH8VI4BhrqJ/b4v64bPVNJSJmKD4M0=;
 b=WaCacRTvUQVgfycLIff10huxHxPSzlz2PvBNrg782Sl2+9m5ngrNeCkD1e3fzaoq8X
 E6vZKrp/zTmd96LZlYR67/iXvQwq6L2yGiL+UL96yz5aoIZeTH3Eqf8c+G5GwVjgnmcp
 5ECOJaoT9MaKtlP7wvkBmjvadPYzCzneZPGpKnu+edfURjXBcrj6cWhdkavTXBpS0hsV
 4Unn+4SkzuOsVZeM7UUaBWfRMfHu2r2Y3Zre1DaBFsV/w/8nW3f8BXVqY5fw5YFDabZ+
 CiEg1qtAMnMI+DyZleUNIV/6I1bplZfGcVw3h6eOhDu7paitV7HdQZcSPHvpJyGsB/CG
 oRRw==
X-Gm-Message-State: ACrzQf1Twvb0j45FifIM9JtRuTePAXGbJgxPlJ0DFESp32DtguoAlQ+X
 c9OxNlIGNLL/nsyq8CHbE3SCNsq4q4Fj+Q==
X-Google-Smtp-Source: AMsMyM6eLN1wIJAm0Pp2wcMFfxN8E+vp2r1jMByzdLFiktma0LrK7QZ7DKhygqDtKMP2TADLcDWuZw==
X-Received: by 2002:a1c:f008:0:b0:3b4:fd2e:3ede with SMTP id
 a8-20020a1cf008000000b003b4fd2e3edemr18449619wmb.133.1667221821793; 
 Mon, 31 Oct 2022 06:10:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p29-20020a05600c1d9d00b003c65c9a36dfsm7309084wms.48.2022.10.31.06.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6E6C1FFC2;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/31] tests/tcg: use regular semihosting for nios2-softmmu
Date: Mon, 31 Oct 2022 13:09:49 +0000
Message-Id: <20221031131010.682984-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The nios2 code now plugs into the common semihosting code so we can
use the same redirect invocation as the other boards. There is however
a bug raised for the fact the tests don't seem to be completing
properly and silently passing anyway:

  https://gitlab.com/qemu-project/qemu/-/issues/1258

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-9-alex.bennee@linaro.org>

diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
index c3d0594a39..bc7fd55060 100644
--- a/tests/tcg/nios2/Makefile.softmmu-target
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -25,8 +25,7 @@ LDFLAGS += -Wl,-T$(LINK_SCRIPT) -static -nostdlib $(CRT_OBJS) -lgcc
 %: %.o $(LINK_SCRIPT) $(CRT_OBJS)
 	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS), LD, $@)
 
-# FIXME: nios2 semihosting writes to stdout, not a chardev
-QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
+QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting-config enable=on,target=native,chardev=output -kernel
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 TESTS += $(MULTIARCH_TESTS)
-- 
2.34.1


