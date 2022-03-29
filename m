Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE14EABA9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:52:55 +0200 (CEST)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9T4-0001M6-Se
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:52:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZ9Lr-0004Zh-Og
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:45:30 -0400
Received: from [2a00:1450:4864:20::531] (port=42873
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZ9Lp-0002bX-FY
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:45:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id a17so20192198edm.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpbItHtNvQ9P2DpjQ1zHf5AjJX4C3nvqrpkUq0lAQMo=;
 b=KqcYH4z8V0ueV5iUznE589NpDz9cNI7GOp2cmRfkQhzRW1iqjMphKQZrlmtUSSvsIW
 fYupaEjOhy+1O7AHcw/xl47x+4RH45PbakEmoCNk1VT2PzOJt8aLeuDNpDBo3FWgJ2Nf
 CpfXNYAvnxncXnR5wEi9ExHBwSBDbRRvlAUq3MBNf22eil/1KPF6bKQKWMj1rs966jsg
 zwydEwPc/qYU7gydJ0Yo3ygIem8dWSZxI8zzVG7uTh017Enr1f5v10m4/g9Hg5czZzRQ
 EcV2yLpYGMqOR5Z+yMibB5myeNYjLmpPtAwWxJX+/Aq3S8CUj1DMoonvd9Dl6i9lmmjJ
 QOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JpbItHtNvQ9P2DpjQ1zHf5AjJX4C3nvqrpkUq0lAQMo=;
 b=LGIjns8Y0Jr663Ml8klKWV9Vv2MpkAL5B7NZ9Y5J35zeZDEq7PfONG0VPaWLnsdCVZ
 dp99gqTVrdLWQy9OfcDeALWBPHXgcj9xIQrbSm1EfGlLTvBixeykwcsFStR1ubvrT++J
 yfyk0ANVma58pCkGAX33sUfWIMLRVlQWWqFj96zYwRJfX+LZ7RT/w1baVKhChlQ5cPuW
 E2d8cyuNLIvecML5GulpNldND130pq6vQU+UqsQyef4kVaDIvfuBVgmX7A9L2hSh3nFy
 EqesB1JMdDcW5cLC8XRYeh3Kw3uGxmz757hcC1HPq+CYxzMYMQTm+gliGZXdmlgxww38
 kBDQ==
X-Gm-Message-State: AOAM531UyLkoLgjt4aLZl22hYC+nH+YDu4V2QYn2QU87+KsX5+PYf/NG
 p/TIoI5Jo86TvcrpNi9sKNzGF0nL6fY=
X-Google-Smtp-Source: ABdhPJwYBUTCRIMlJ/gl4W/t3pMm4KT6unOZ/mt49v6WW2nQ/w/H4t5GWsH6Uaz8hmppqXxItnqf5g==
X-Received: by 2002:a50:fe81:0:b0:419:16a5:d265 with SMTP id
 d1-20020a50fe81000000b0041916a5d265mr3763406edt.4.1648550723923; 
 Tue, 29 Mar 2022 03:45:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa7c047000000b004132d3b60aasm8200118edo.78.2022.03.29.03.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 03:45:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0] tests/tcg: really fix path to target configuration
Date: Tue, 29 Mar 2022 12:45:14 +0200
Message-Id: <20220329104514.815448-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was attempted in commit 533b0a1a41 ("tests/tcg: Fix target-specific
Makefile variables path for user-mode", 2022-01-12) but it also used the
wrong path; default.mak is used for config/devices, not config/targets.

While at it, explain what the inclusion is about.

Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index ae8004c76e..acda5bcec2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -32,8 +32,10 @@
 all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
+
+# Get semihosting definitions for user-mode emulation
 ifeq ($(CONFIG_USER_ONLY),y)
--include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
+-include $(SRC_PATH)/configs/targets/$(TARGET).mak
 endif
 
 # for including , in command strings
-- 
2.35.1


