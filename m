Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF053F2E3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 02:12:00 +0200 (CEST)
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMpD-0004hA-V6
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 20:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLzY-0000dQ-33
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:18:37 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLzW-0004Nv-3G
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:18:35 -0400
Received: by mail-pl1-x629.google.com with SMTP id d22so13324882plr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HINwgAVocusWc50tV22H1l1kBAlO6yNpO5Px0lUjtCQ=;
 b=bwNI/Scn5MGVdJETc5axkqjnQrEFj43ZVJL8NvxeCA00/GZqCMm4ehMEmmFXdXXMuQ
 RNDHET4DzPm5BJvDpXRtfzaB9W5/DofByXGpSaCGO6fYDJ4hyOCjCvDNH211TvLOQWw6
 qYPI0Owor7PNyKp685/6FhhV/1zOycv+eHZuaAs5sWo/F+sFC0EzGDOeNBSuaF0SAd3t
 rdrb8WtG0Dv3oiqHjNuwsr6So2eOMXyD4g5iZBYjQy8mJqyZXP9Zj0yyhBQnwOVKqTiq
 zOZ2cSOPJygAtNLEcCGmRlHI+j/ZF596B/QXc3/c8LGfmh50VOdmKtZT/JXzAXavJ4XL
 soUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HINwgAVocusWc50tV22H1l1kBAlO6yNpO5Px0lUjtCQ=;
 b=fKspxrWbaSGdNwNV7OZUZPwh1ZXc3/JZjRm3EO5SyJ04RJQRepmJArB4FBv+mJ7nhM
 aOffK/oztaFtTjht6GnSyue41uJCGBwT7E75gBtTCI4DR6nXafAG+dVFL5szMxcJmUP9
 qVJ+olVdwrElhn4E+pgBim+EVf6yZHTXjnm04elSi5KjGw+ccgaS7mYsL8ELOysKOKSd
 oLtMBqTsHfSCO46UWF/6R/65CX5HCYsuDrLjxTf0PnVDn0G1anb1nNpxuWZPE2qv+Oe9
 SsCSj/K4FV4II0lb3JuLE1rDTuSr5m3q+7W2gte/SCcv9kOZGbutw2ahgFYstalbP/dd
 VP4g==
X-Gm-Message-State: AOAM530IbWh8NYYlZ60DaCTooX0DmdtKmnGKnb75kll4VTU20b1dPcX7
 9FGhrCE9nyCEESWIfoBSUbkr4EkHb1SHhQ==
X-Google-Smtp-Source: ABdhPJy/ey9AdpGiIbqMsjEkKl0Ax1omMYEzFiHgmVStV7Iy092pNuf3Xa7ehfc1qyZqOKj2f0NUSw==
X-Received: by 2002:a17:90b:1a8a:b0:1e8:9388:5b5b with SMTP id
 ng10-20020a17090b1a8a00b001e893885b5bmr4678642pjb.50.1654557512722; 
 Mon, 06 Jun 2022 16:18:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a170e00b001df239bab14sm10667754pjd.46.2022.06.06.16.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:18:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 43/43] target/loongarch: 'make check-tcg' support
Date: Mon,  6 Jun 2022 16:14:50 -0700
Message-Id: <20220606231450.448443-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001,
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
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220606124333.2060567-44-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index ac18ed4f3a..e69537c756 100755
--- a/configure
+++ b/configure
@@ -1831,6 +1831,7 @@ fi
 : ${cross_prefix_arm="arm-linux-gnueabihf-"}
 : ${cross_prefix_armeb="$cross_prefix_arm"}
 : ${cross_prefix_hexagon="hexagon-unknown-linux-musl-"}
+: ${cross_prefix_loongarch64="loongarch64-unknown-linux-gnu-"}
 : ${cross_prefix_hppa="hppa-linux-gnu-"}
 : ${cross_prefix_i386="i686-linux-gnu-"}
 : ${cross_prefix_m68k="m68k-linux-gnu-"}
-- 
2.34.1


