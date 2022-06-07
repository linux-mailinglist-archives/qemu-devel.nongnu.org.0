Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5968541F7F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:33:12 +0200 (CEST)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyihD-0004Mt-Qd
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyheb-0005WH-28
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:25 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyheW-0007vG-4T
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e9so6356864pju.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 15:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rtDAhCLf9N87R4+LTH6i5sFHnNG85TAi8iRmZuIwB0=;
 b=FNMDITtCpwl0Kk/3QvIPDbbZKWI2XXJ4TsOjgeTfPAhGCU3aUyIqUIG5Cq9vXIsr73
 qBQ7QcYkjgIW28fU3jbYYmjTgLepiL83Qt3GxsjwBiuUXC34cIMlvzCR9zCjRcIHiK2X
 rS89/vrJ4bhsMunaBaEPCify2vEQ62G4Yb3SPEGpnjO59grxYHAeHYBQaE3ytE0HTbv/
 nDa8XqLTEuyhs+lhbOXX6peC8Dsi8Fjwk+xwX1Vy+mccGRDFII1psRtOKn5lcyWcrVCd
 OeeBvXLpfN0FvdZ9n1OAVXHPiSXlRKeCzqlYQnxvRKv4s/NswSD1g2fsZngKcroSARe9
 U74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rtDAhCLf9N87R4+LTH6i5sFHnNG85TAi8iRmZuIwB0=;
 b=2FV0tvVCix8zDu1MZbdidQRBx8S2mefDQQC3Lg18xqgg1md7B0j8nmq6RRxVufiYG4
 b8OLifv1wOIDn0NYWhnQVjpDeIdIOXI+HTpjvzVc/l5oThD9Ysc8UBpnh//khzBpL3Wm
 2NkF2wanTk/LxaaV3oCanZCWi2tpjKqyDRlC3VbfhgMoj06TvpRwnOXKZI3yaScvCBL1
 7E/Ar6bZcuaUHN2+w4L0EZMetXO/Nu2pw0wgUX01SOpbHJhtH59d0q0Vh/lm3wNGuRAB
 y5zXCFEZ06AplcB1vgcI6gKWmVH4EHYhdZOgM5IaL8PWLzeqSpLZbeeLhcpJJa+Pcix5
 DzMw==
X-Gm-Message-State: AOAM530bigHk9CeP/qNgVsCRNdX0pvoXILn730TQNkFemKPeXLiqw9b1
 q3jmjo+FqilbgekcBfR1iNFScFobJiYyQg==
X-Google-Smtp-Source: ABdhPJwfoniV3Jge7kZUBqCAUv3/7esxiyLF78HoRP9Be9Jhk+naWriSC640CH7FORZEcISQApjj7A==
X-Received: by 2002:a17:902:7282:b0:164:17f6:e36a with SMTP id
 d2-20020a170902728200b0016417f6e36amr30395419pll.139.1654640778116; 
 Tue, 07 Jun 2022 15:26:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a17090ae4d300b001e2fade86c1sm15112133pju.2.2022.06.07.15.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 15:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v4 0/3] target/m68k: semihosting cleanup
Date: Tue,  7 Jun 2022 15:26:13 -0700
Message-Id: <20220607222616.717435-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
("[PATCH v4 00/53] semihosting cleanup")

Changes for v4:
  * Split out of v2.
  * Convert host errno to gdb errno, which for m68k is guest errno.


r~


Richard Henderson (3):
  target/m68k: Eliminate m68k_semi_is_fseek
  target/m68k: Make semihosting system only
  target/m68k: Use semihosting/syscalls.h

 linux-user/m68k/cpu_loop.c |   5 -
 target/m68k/m68k-semi.c    | 375 +++++++++----------------------------
 target/m68k/meson.build    |   6 +-
 3 files changed, 92 insertions(+), 294 deletions(-)

-- 
2.34.1


