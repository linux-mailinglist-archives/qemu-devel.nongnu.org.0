Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE15F4528
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:08:20 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiao-00060B-UW
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq0-0001Hk-29
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:19:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhpx-0001pm-Qp
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:19:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bu30so1402865wrb.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yGSkbMoPofI9Br/KBzjNKYqnINCzi4oVJhDzB+0baZo=;
 b=adnTEUGeqU2ImWVa/ItQoKk//DIlMZ7ZgUAXSIbj6oVpW2iq++voRWo+o7YnHF0JqF
 weEsYbe7Egjb9BAAfClCDsbsj8aA1NkiNm5eG+c82g7ahRe0w29k6t3phbTarbnpo1yH
 EOdI56CHN0WCOPwpSgjiuDwQ9tp+JoxCRIxo4S2pdH4pB1M8R65vudCRfCLtPCQ60lxu
 bOfogEVNMxXd1VQ6Dqg0EOXTVyyWviHrUOgOxBGxc93OHgbMZGqJQLrUufdQpSNp4eBc
 yeYB4TU666l2kJzdzlYK7T2BQAVNveCFgqBv/I5kAFHPk/OvDzXuYUe2d1zOhQhSy06v
 w4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yGSkbMoPofI9Br/KBzjNKYqnINCzi4oVJhDzB+0baZo=;
 b=Kuyv/s4u3otzmyL0BPq+QQKQS+DajPjmjYqm2zqeAfTx2kQynwlPnzcfHyuiGzREyX
 i/kIe+xJ0IZO734sZYdjX5wWCS1ZxQC6WeIzYONgJ2woNORKLVqmw2X8y1Dz83Q7woUi
 bZKCYyMx7z582JlyGs2+bEype02tc9oARJqdy8uIrecDu8l03S5PoGIz1gwgqp7KR4cX
 AwfIwU7ybxBJ53S8Z5DcQgkw9RluYuIsrx9GfyDR3NiRVGlgcGUmdtm7dQgLzUhHCoFb
 /cpDM8fOwA+dVjEfTyvk/M68S0B0FKaDvmHVWUdW2aCsG6P/Sp/pVgRJs/ZYMeaM05Pg
 t/ZQ==
X-Gm-Message-State: ACrzQf3e3hNurSxNTNi/Z43lgnEolxLDaj0/GTZwnLqtcT0whHd5xRSw
 lx+qsz9vG+uVb62rfnb5NIc/Rw==
X-Google-Smtp-Source: AMsMyM4CWwSYhOo9RjlF0tAM6DZDOkum3gFO4qqqFb1mz0N2v33o/xQvT8QYgj0li3LySv40HSZRoQ==
X-Received: by 2002:a05:6000:2c5:b0:22b:c77:7690 with SMTP id
 o5-20020a05600002c500b0022b0c777690mr16160593wry.563.1664889592015; 
 Tue, 04 Oct 2022 06:19:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adfe90d000000b0022e57e66824sm818833wrm.99.2022.10.04.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA6BC1FFBC;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 41/54] semihosting: update link to spec
Date: Tue,  4 Oct 2022 14:01:25 +0100
Message-Id: <20221004130138.2299307-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old link has moved but it seems the document is now hosted on
Arm's github along with a license update to CC-BY-SA-4.0.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929114231.583801-42-alex.bennee@linaro.org>

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e741674238..bfea9e9337 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -24,7 +24,7 @@
  *
  *  ARM Semihosting is documented in:
  *     Semihosting for AArch32 and AArch64 Release 2.0
- *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *     https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst
  *
  *  RISC-V Semihosting is documented in:
  *     RISC-V Semihosting
-- 
2.34.1


