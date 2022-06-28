Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB66555C0A7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:25:01 +0200 (CEST)
Received: from localhost ([::1]:49024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69L2-0004WB-Ua
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Hs-0001kl-Oi
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:21:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Hr-0003nu-BH
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:21:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x20so5176764plx.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yVgcuJVX4/SDUH0PbfGrPwGUPaAB3n7/Itbd79Uj2U=;
 b=J9fCHZJN31NehZM146ru1FwK5ucYhcL3hka9/h0PjUC6VJwr35pHMHqhF3FZOL1/Sw
 hNDnMor7CUhxa4ahjxpowxM2iK4dk/yBWSlKg6Plqorzp/AsE+7HBw0E92eusbRJXNjX
 nkl8+x1WDVsF/QkTPty7pv+r2+NI0UchXWJbcG+KSfaTpFQDbvbR125B4IJoF2aC1gKZ
 DkZFFdJeA1ufvaecdXK6VFshJwUrrxVEL7aYdS0qZ2r9DZzxTL7NKTpQtmX6oB4BaGUQ
 xWZm31KNM/AZgOy0tEYm6h2CPmbarJeFcSSbG5PwviloxKHyhds2dP+Znzy8Y66BhJBR
 rCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yVgcuJVX4/SDUH0PbfGrPwGUPaAB3n7/Itbd79Uj2U=;
 b=t29ckugDsdlJH5S5198Mbp2oB+9/rEwTui4xksNi4+1j9uWQ18RVY3G7tbv1C+6S4u
 LquQOtHYUyJixFh8viI4R53XPVRH6ecD8iOULPRXLM2/03xM2TMQrTfHRA4VZuU3HrSZ
 cHr+wNrR/BnvP5t9vfstd+/BeylsNKKa/iXE8xxnSjo2n2LYjfoBWEVtCWEdCv/QR7Qe
 q8H2TsGyEBlTF7Cr4sowfSFSwbQyoWn3rTAlX+F/0O5K0lZ0ERkJD/gfhTRU3ZQ14yw9
 T2S6aGo51HHaEM1onYuMo6DW8fEm5gASxA5laOtr9szy5OBlpira2TOb07GZ+QTVEreA
 d8Sw==
X-Gm-Message-State: AJIora96RujDCwPJnTtiw0RtpSkggMS5lFHtQ5CSvXgqHJJo5dYVgWC/
 bekoYojzaPvhoI0wRB5E0+7AyFnXMnMAfw==
X-Google-Smtp-Source: AGRyM1slkGef7KxLTvV5IUgOAUmj3mgD5SUIEvOairhh0cWRqxYh/OzDOHNTO4qAzzseQOkK/h5+iA==
X-Received: by 2002:a17:90b:4a0a:b0:1ec:bd8d:a128 with SMTP id
 kk10-20020a17090b4a0a00b001ecbd8da128mr26492273pjb.67.1656415301862; 
 Tue, 28 Jun 2022 04:21:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g19-20020a62e313000000b0051ba8b742e4sm9192177pfh.69.2022.06.28.04.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:21:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	peter.maydell@linaro.org
Subject: [PATCH v5 0/2] target/nios2: semihosting cleanup
Date: Tue, 28 Jun 2022 16:51:33 +0530
Message-Id: <20220628112135.685617-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Changes for v5:
  * Rebase on master, which includes all prereq and patch 1.
  * Split out errno remapping to a separate patch.

r~

Richard Henderson (2):
  target/nios2: Use semihosting/syscalls.h
  target/nios2: Convert semihosting errno to gdb remote errno

 target/nios2/nios2-semi.c | 321 +++++++++-----------------------------
 1 file changed, 77 insertions(+), 244 deletions(-)

-- 
2.34.1


