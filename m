Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F06624B2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:54:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqiS-0002mg-JY; Mon, 09 Jan 2023 06:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiP-0002lR-Mm
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:21 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiO-0007tT-6G
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d17so7891422wrs.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=En2ECShv0kRWnzSOnm7XMPCMXkKsPEIuZqm6vHr6CKI=;
 b=u8KMncHg76duqBCs6KrKvA+tOa4W8vEunpceL24mhz3ZpBXxQ1NOZG9tIzCT8QQ+BI
 83dDTtMaAaI2FfRybaUAlQQNvNOPEsXQFiCC2jJa7WOcbxbWeBKhA0/GVEeBsack0e7D
 LH692XhsVf1HZLIiCHYVo5y9urFrYkUNZFmOttsX7aPyVf35zmp0s/CHBtUnFR4Y2NAt
 X6rizteHEmIm9HIESHvdMl/cjO3aXe1CvSriQ15LKwvUYgnDJheW4g8sTKlaB/sXq4s7
 b44ftJx61aFs5yQa/Qrvj/IBeGYTzqL5JEHroelaLewbFGe25f3WwqzJK1i+HrAZvIH+
 OFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=En2ECShv0kRWnzSOnm7XMPCMXkKsPEIuZqm6vHr6CKI=;
 b=fEnBxbJt74UwZiRdVyDKbq5tjUBpPHxL+WPMLX1hYd0Uq3B1+PxHA+p99fz1hDggTK
 bS8sGwWxpEv7B5v71hbvU5c2poPLqqbGOJ2AkGQYDMOoiqVrwmHkXKCbV/gwVvaTvAuv
 enn80JCc8n+GAJmFfJAuzuVCvTPJJ5IK7cVNHUlgMvZnCie2exd2uVYBWznn2gO9bL+5
 Witt9mpR7j16nV7ulWOoBubQiC+a0FZAz1rp+HfNgoswvH9stFR2TnmEr4u0jslUXR3i
 hobP5pETZp1eD2FMae8yB6omCKOAzNJK7EjnoiN6JS+W4JRSmgSnPgSna782Q2hG8Zsg
 h/Gw==
X-Gm-Message-State: AFqh2kpYdWb1DMS2ZoreuP7VmtP7yAyTrkPEZEDOo3i+pqLUV6RhC2JZ
 CPZZYzQyZ0OQRkm4fkO3VwX48qnmLufzvDU1
X-Google-Smtp-Source: AMrXdXurLCL0BPU+5mpNRSkOCxTbYCnOnrHS4MXBLC+zxLW+1ys0QnIF2xNbjYOum494OI371ME6PA==
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id
 h12-20020a5d6e0c000000b0027da1eadcfamr30774572wrz.19.1673265198291; 
 Mon, 09 Jan 2023 03:53:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm8475609wrv.76.2023.01.09.03.53.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/13] hw/arm: Cleanups before pflash refactor
Date: Mon,  9 Jan 2023 12:53:03 +0100
Message-Id: <20230109115316.2235-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Various trivial cleanups:
- Remove unnecessary sysmem argument from pxa2xx_init()
- Use IEC binary prefix definitions
- Remove unreachable code calling pflash_cfi01_register()
  (another use in PPC sam460ex will be removed separately).

Philippe Mathieu-Daudé (13):
  hw/arm/pxa2xx: Simplify pxa255_init()
  hw/arm/pxa2xx: Simplify pxa270_init()
  hw/arm/collie: Use the IEC binary prefix definitions
  hw/arm/collie: Simplify flash creation using for() loop
  hw/arm/gumstix: Improve documentation
  hw/arm/gumstix: Use the IEC binary prefix definitions
  hw/arm/mainstone: Use the IEC binary prefix definitions
  hw/arm/musicpal: Use the IEC binary prefix definitions
  hw/arm/omap_sx1: Remove unused 'total_ram' definitions
  hw/arm/omap_sx1: Use the IEC binary prefix definitions
  hw/arm/z2: Use the IEC binary prefix definitions
  hw/arm/vexpress: Remove dead code in vexpress_common_init()
  hw/arm: Remove unreachable code calling pflash_cfi01_register()

 hw/arm/collie.c      | 25 +++++++++++-----------
 hw/arm/gumstix.c     | 45 +++++++++++++++++---------------------
 hw/arm/mainstone.c   | 37 +++++++++++++++-----------------
 hw/arm/musicpal.c    |  9 +++++---
 hw/arm/omap_sx1.c    | 51 +++++++++++++++++++-------------------------
 hw/arm/pxa2xx.c      |  8 ++++---
 hw/arm/spitz.c       |  6 ++----
 hw/arm/tosa.c        |  2 +-
 hw/arm/versatilepb.c |  6 ++----
 hw/arm/vexpress.c    | 10 +--------
 hw/arm/z2.c          | 16 ++++++--------
 include/hw/arm/pxa.h |  5 ++---
 12 files changed, 98 insertions(+), 122 deletions(-)

-- 
2.38.1


