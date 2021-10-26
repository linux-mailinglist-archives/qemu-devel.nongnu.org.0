Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1383843B89A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:50:47 +0200 (CEST)
Received: from localhost ([::1]:51214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQay-00038c-Nz
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfQQ4-0004o6-Cr
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:39:28 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:35476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfQQ2-00064r-CU
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:39:27 -0400
Received: by mail-lj1-x236.google.com with SMTP id o26so159404ljj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67U9x0DmEsGNqzo94k33u4QJ4UcEkrcJ9NWIUhvcskQ=;
 b=xdWHibeyQ07uZVTvBo6Sd9i0ysWNpjfy8rrbiXiLwURSNKC61cw1sj2thArjk9RLGK
 qXsxJMl3FHwQIythppg/MAZXVogYanqr24HHWQT+M+YJf7uy+jQD3DSw25C4vVgyt6So
 1nUxOqv5INeD2OHV1Uge1ld0bERKeJwGmU2G2UV90z/U3XBBPxB1RSFQqjZ4IIJMQ/ub
 CpIRC/zHN21+bmSO4aMFlEwV32tkiMqVbq2OuKm3eYYi9YpiLUY7LqocvhhS9ptVmIHS
 qCgA84v8vWyMhUT87L4jmb4dC2dJ7rHKVwZ1r+pyotpAdFqvYH8vs3hDvLuRqTMZ7EQe
 wdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67U9x0DmEsGNqzo94k33u4QJ4UcEkrcJ9NWIUhvcskQ=;
 b=fp4bIb4qq0wVFC3FdC0xG68xb7j+UlpLE1mnGgpm5qHCbDz38RuIsOfitiaT6haRG+
 9nlC01Cr2/7LrbaZKuTVoV4c6n5oCxfy0j0frGG/auZ9b+cSYsJ1ofApJKcZU0lKF7mk
 zs5N4CT00/epyIznHZ4xyb/SqBI13JYM6wbWV3KEcMw5x/7k8u3PST4ElOA2xcl1X2Wx
 L0EkLOpRsdpzzYq69Qib+J/hD06Kxd4ekDA5+Uh3qu6QRifkhL+ccfHJ12Qs+CVNgAVF
 CTITLGXm9JN1E+5cOXFFj+bdyDKEZP0EprV/aIwV8lXDKeG/k2MAtkS+cBb3Ozg8MAwZ
 1kLA==
X-Gm-Message-State: AOAM533/E7Nzfvp1J1os3caM/w3BnLr5PjByWxHh+iowzjdnPY+LZElZ
 pIM2/CZp3JYgyFWgRuRgIcCWKA==
X-Google-Smtp-Source: ABdhPJxfLiDJ8NBJwQUIQSZT0/q5jynrTERkZtsqiQCyBeuyBz3Sp+I0W6imZt6i1Pa3FV4of5xQpQ==
X-Received: by 2002:a2e:a170:: with SMTP id u16mr28595757ljl.108.1635269964517; 
 Tue, 26 Oct 2021 10:39:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b39sm110574ljf.52.2021.10.26.10.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 10:39:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 24AD21FF96;
 Tue, 26 Oct 2021 18:39:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: remove debug polluting make output
Date: Tue, 26 Oct 2021 18:39:14 +0100
Message-Id: <20211026173914.79377-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 5343a837cd ("tests/tcg: move some multiarch files and make conditional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index b962ed8236..a83efb4a9d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -16,7 +16,6 @@ MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
 endif
 MULTIARCH_TESTS = $(MULTIARCH_SRCS:.c=)
 
-$(info SRCS=${MULTIARCH_SRCS} and ${MULTIARCH_TESTS})
 #
 # The following are any additional rules needed to build things
 #
-- 
2.30.2


