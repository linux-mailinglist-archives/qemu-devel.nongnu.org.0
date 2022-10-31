Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79458613797
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:14:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZS-0002or-Py; Mon, 31 Oct 2022 09:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYf-0007wV-NY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYY-0001Ez-2g
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id cl5so4257069wrb.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoltzJLghpoj0ev417tk1yzR9U9U1ZCmpckihK4pGOk=;
 b=MqrN538ShUaKX6Z1d4RlTz2L/bSOFllIAjGSi1akAIeVspnj7r3xcoPjwDpaqH6BQD
 VYymuw54Q3GEssXcXoMxZpp+a+oOYJIVk5n45/et8UijXLkfOenKqUDkQc5iijj70WwW
 MeuVwc93NEXiatuwVDTVJykgmv7wjP3iCvIZlUjtBy3Gp8Tk2Di235I6GyZn4q+4CtaY
 9rg3wc4LEvABiqHhQdJNQQSzA1YevlIrM7igwMuDdsmaLV+JOlT+5DGL7W1dWAJWnfa6
 1oudr0/tWrTKUZwasZU6hF2byI6JKd8HAEdgYAUOg4UhMPET7H+JHtKjefnHOwQ027Xa
 bfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PoltzJLghpoj0ev417tk1yzR9U9U1ZCmpckihK4pGOk=;
 b=Ty2TSO4EKislF/RSepkor3/Hqvkh5a0PmrApzCE6aPrD5NQn/dyHh6ZMnoFUGyoOaf
 f5POPFXyPHStY2SuRNGRLydDcb4wNXOBm19BqyW4WyppmZzpnE379O7+9k2pOcsWwnuB
 7rpUArYJs33zzLgpOnlqDEPuM7aCbGJlVcDBvWTjXMgZmXpS4rLW74UBlHeuPWMR8ntZ
 FEFYLMw2PX4aKvKtzzoPStyUwQZ3Uljv2fxYRZ41t2sv91/eOvQEOcFmwS00p5cX8bZ6
 HLN+5v3QvxRsKCYNMdEy9VAAzkI381koV1o65hx1AT3ilUk6D40sOgf+5vPcCg84NcXy
 poeg==
X-Gm-Message-State: ACrzQf093yjTCjAb3p7R5qZ9fqb87ps7QmP0+7mevAjlyQXM6RWKz9ah
 nf/0Pf0HDGLvYWE9mkqPDmXqmQ==
X-Google-Smtp-Source: AMsMyM68QQwEVCr08vEInZE40vsMYweG21aenxvd2Hav8CtqiVfXg53d7WQ5LK+4aIyZQyEGX2JLpw==
X-Received: by 2002:adf:e283:0:b0:236:b557:39e6 with SMTP id
 v3-20020adfe283000000b00236b55739e6mr6752344wri.642.1667221820815; 
 Mon, 31 Oct 2022 06:10:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003b49bd61b19sm7477266wmb.15.2022.10.31.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA9231FFC0;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 08/31] tests/avocado: extend the timeout for x86_64 tcg tests
Date: Mon, 31 Oct 2022 13:09:47 +0000
Message-Id: <20221031131010.682984-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

These are timing out on gitlab.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-7-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index b7522ad3a1..571d33882a 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -19,6 +19,7 @@ class BootLinuxX8664(LinuxTest):
     """
     :avocado: tags=arch:x86_64
     """
+    timeout = 480
 
     def test_pc_i440fx_tcg(self):
         """
-- 
2.34.1


