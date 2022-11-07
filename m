Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BEA620229
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAMV-0005Sw-Sc; Mon, 07 Nov 2022 17:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAMF-0005RI-Qt
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:12:43 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAMD-0004Yh-A7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:12:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id v1so18219314wrt.11
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cNeNMUuSepqL9FvnQaZG9cy7VW1ENolnFrvInf+gIZc=;
 b=qoWs/WTgu+xt4o+ISywWL1S2zwIqaE9rJfc12xPXL/XFXYQmJStnDakCttq/cgu0Ey
 MK7qyaogNVP6bp24hkoU5Z6taO9K5yOJBv90ROMub1cAEhp/IR76LsKIjTtEmcJEGCqV
 VxdNrbKga/FF+M9HudNOL9PZXSRMs6qpnC5WMGLTINc7VdEk4tfStN50KIZrAEN7CH77
 2pk47SlnNZyg3To3tjzi3IGS+wj1yXhXtRuq77tWm3cVfSsxMqUblqvnjZ01YCVzPVA7
 2pdt3QF2GuV8uZ06F+FSGUsbzhWeP3xkZwPJ/l1nkzERr6zZgic7vZ+Nkzqyez6ycfKY
 DgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cNeNMUuSepqL9FvnQaZG9cy7VW1ENolnFrvInf+gIZc=;
 b=CkY6mRgMSuAWOHRgCSmdZzUKnvMNIkTXo44a0xX2qkTl7KGBCtZSD7PdbkjO/Me6fV
 fJW5ng5AiS4dJBG88djCL26sc4ArKztn+4m2WdVLuETTfMG1BlKyDnc3AmcJ4GrUGHoO
 jlARGPi0/0OA5EDxJbVh72mZs2AI7RyBTAVGp14xRLc5Uxy9PzHDEsW7d6BMLHLoOfAX
 zXofHU24DcygjA1VbGV4pa3GmsS4NuxaJKTnirpZFUrdS3aH+PYmswh+cQYb3QO2tdM7
 6Wu6xm5Mbav8CWem31Q499yulj6NSsz4afe+GIPTfUPoALPFFpi/tk7Ucc4QOA4ySC63
 d6Ww==
X-Gm-Message-State: ACrzQf1u9+VOanC2pGPc8rZOwxtybYPzG/2nDYDBopQCeEA1VJoXB5MQ
 ft2EVrFU32tU12eTcKrsC0dhG68Mmx+k0Q==
X-Google-Smtp-Source: AMsMyM50QDu0MsGVJ1OGLg3ohKWtZEoTGa6K8ZToIKGXN3N70WqXiie6gHtjCT97SP+IleohNKWzjQ==
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id
 d10-20020adfe84a000000b002365f2d9027mr32727685wrn.89.1667859159415; 
 Mon, 07 Nov 2022 14:12:39 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a5d6ac6000000b0022cc0a2cbecsm8620432wrw.15.2022.11.07.14.12.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 14:12:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sai Pavan Boddu <saipava@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH-for-7.2 0/2] hw/sd/sdhci: Do not set Buf Wr Ena before writing
 block (CVE-2022-3872)
Date: Mon,  7 Nov 2022 23:12:34 +0100
Message-Id: <20221107221236.47841-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Fix for CVE-2022-3872. See description in first patch.

Philippe Mathieu-Daudé (2):
  hw/sd/sdhci: Do not set Buf Wr Ena before writing block
    (CVE-2022-3872)
  hw/sd/sdhci: Factor common Present State bits in sdhci_data_transfer()

 hw/sd/sdhci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.38.1


