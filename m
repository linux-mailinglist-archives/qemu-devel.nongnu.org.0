Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6767C9C8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:23:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LW-0002yX-Or; Thu, 26 Jan 2023 06:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LQ-0002ac-Tn
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:05 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LO-0003eA-KK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id m14so968895wrg.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pfi1W0xHLZWf1PK1ikWIAw2bTkm2srMITC6ITRXr/yk=;
 b=RNGgCJKULw+PA4CaChhuYH4tryI/8HPPO2QOTlkZc7nfkWLdd2tFGe3KE16bRNfLmt
 J2D3OpPxGvxJHBVyVQl1yZm+L6FGVF4kVcRAKXiOvepGZi8o7eixbjquu1t2My3z0jyF
 y6lgd6YF8Jxh8aYxd8POoFDkrOYmAglaAgArR++w3J4iySUq2z5C85mw1Ho38FKBawfv
 bEO30A1rCjRCUsniNmCCqBZRXkU5XnzEhAR01oOcb9KLOCLpTOxZVS9gIej0VFgVJRVw
 JVvXDGXMnnSe6olfaLqxPBP9SJnx5LWH3E+NdkE8O6GuCQRUHdDJQ1GSw4OKEt//WXjj
 gqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pfi1W0xHLZWf1PK1ikWIAw2bTkm2srMITC6ITRXr/yk=;
 b=M8DFYZWq26xmRRVMzJIpi13bbffzWaJGNiVBLoPXTIfObg4DWwIuOlypFrC5MQXz4T
 XUeOatuo7lGRLi9VNNPfmyi7c4xop9aPzu4SDCv0BrRVDrA+6M2mxSpYzFfyrvTumJLp
 n85b4u1T3sfqTOFS7lPESULtDuK4EaAo4TnFrswQdgcz64SfYFK5UYd/BsYdwQZuAEx4
 xCiDC7rogjRxil8Rk5pb4a2pL/Xl1hCQKeF62WG0xNWsCvCP2gATlWCp1sZk/Qacc9Kd
 kwmObYFuQD0/h8zPNFVCXmQDuLfct5taOUfKP/X/v2ZztMQYBTDiQLABSVgUMgTfcUyN
 CFjg==
X-Gm-Message-State: AO0yUKVoKQxK6XaSF28QgbIl5YD483ukRXWIk/E/ebP8pseUKQfs7u1H
 OxhDvLz+adAkN80I4DfH8wIssw==
X-Google-Smtp-Source: AK7set+Dy0TXCCElMADXGKqw+TjA654dTza7FG9wY82enZlXFVjxeeL+59oF6WYDQsZ49NPDgQsynw==
X-Received: by 2002:a5d:4b8a:0:b0:2bf:af4a:281f with SMTP id
 b10-20020a5d4b8a000000b002bfaf4a281fmr8422673wrt.18.1674732181782; 
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfe382000000b002bfae43109fsm1024163wrm.93.2023.01.26.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EBA31FFC3;
 Thu, 26 Jan 2023 11:22:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/35] MAINTAINERS: Fix the entry for tests/tcg/nios2
Date: Thu, 26 Jan 2023 11:22:33 +0000
Message-Id: <20230126112250.2584701-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

tests/tcg/nios2/Makefile.target has accidentally been added
to the Microblaze section. Move it into the correct nios2
section instead - and while we're at it, it should also cover
the whole folder, and not only the Makefile.

Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test building")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230119130326.2030297-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-19-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..629ab5bbb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,7 +240,6 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
-F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -262,6 +261,7 @@ F: hw/nios2/
 F: disas/nios2.c
 F: configs/devices/nios2-softmmu/default.mak
 F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
-- 
2.34.1


