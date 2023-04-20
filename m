Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A895F6E990F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:04:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWl3-000199-QE; Thu, 20 Apr 2023 12:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWl1-00017P-EU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWkz-0002XB-Qc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so462230f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006616; x=1684598616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dk/+uSHPOcK7M/mEIB0DbVz/x0QhkAUEmLVhjx3k+Hk=;
 b=ZhMQWEBbmO5ZT4unerqGe/7QNjrPfsSXNxLqUt47evNKPSFocDcdBN2C3VF8Ig4tuD
 NQsT/DdHYBJ1NrvAJEuYK10Tx9uymxmzh0Kb5D5DYljJWg+ZXGVyPf1+Ozn+6RxLAbzG
 FfYwwcLyGxnA7Xf4FhtXukFeN5WpPvdfwBwLlWCvg7nn0Lvu2He9RXQ8sfBStbU91qDg
 fRz4geKqX6wV84yprZQ978p4CjjlJna2oIWJNoPbiKBIJjmHhSA71USRSmRL1SCReiiW
 DmWlQfeV2bgg94KBjzBvzuNY5qF4LDhqlYOvtVhfr1gIS1443Ok6ceR9f+v5eJRj+LhU
 Rcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006616; x=1684598616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dk/+uSHPOcK7M/mEIB0DbVz/x0QhkAUEmLVhjx3k+Hk=;
 b=Tu2OTuDzZhGbKmRkJTpaPyJaAE+AKatykwhxVqi6Jl23NNkH2kzKETXYbObjZYPrJH
 QMW7nkxJzqz1vJhYdlJ25SrtxOZUMvZj+BWSVw/U00wUuPm0QC6MAzrtZpOqc8/XA74w
 erc2eeQAWW+Mbq/lsjY2WWyQnUgkiRWG6YdsfoahOm/7Zluu2psQr/LMe64ljorbM4pj
 Yr4i/p+VrFX2bFFTgn8COzIG+fHuxPH18G/bNKCvyBAtekvFVENeLmXvlrpJzfVl0tv1
 xpzXEzPjl5fRhyVdg5hvyLAT5O2nBi11GxkTzRgsFMVxtlpasDasHy5D4YVxs0sRS1TX
 nIhA==
X-Gm-Message-State: AAQBX9fq2EWyARi014Mk0ue9R7y9nh/7NB8UikeadRnAw/H+r0+4/r2V
 +yAFqVJIEmZNvQ+/C/RC+D1zPWRAlXQ4r3y/cZA=
X-Google-Smtp-Source: AKy350ZMcYAfRej12sR9Fj6RHx4pQ+mvEOneGnwWiUdxORQ0OOnCrAVeEiTr/Inn2TZgIGfghgPRvw==
X-Received: by 2002:a5d:5965:0:b0:303:2115:1b11 with SMTP id
 e37-20020a5d5965000000b0030321151b11mr185133wri.39.1682006615796; 
 Thu, 20 Apr 2023 09:03:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm2310713wrm.27.2023.04.20.09.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 09:03:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/3] docs/specs: Convert some PCI specs docs to rST
Date: Thu, 20 Apr 2023 17:03:31 +0100
Message-Id: <20230420160334.1048224-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series converts a few small and simple PCI related
documents in the docs/specs/ directory from plain text
to rST: pci-ids.txt, pci-serial.txt and pci-testdev.txt.

Peter Maydell (3):
  docs/specs/pci-ids: Convert from txt to rST
  docs/specs: Convert pci-serial.txt to rst
  docs/specs: Convert pci-testdev.txt to rst

 docs/specs/index.rst       |  3 ++
 docs/specs/pci-ids.rst     | 98 ++++++++++++++++++++++++++++++++++++++
 docs/specs/pci-ids.txt     | 70 ---------------------------
 docs/specs/pci-serial.rst  | 37 ++++++++++++++
 docs/specs/pci-serial.txt  | 34 -------------
 docs/specs/pci-testdev.rst | 39 +++++++++++++++
 docs/specs/pci-testdev.txt | 31 ------------
 hw/char/serial-pci-multi.c |  2 +-
 hw/char/serial-pci.c       |  2 +-
 9 files changed, 179 insertions(+), 137 deletions(-)
 create mode 100644 docs/specs/pci-ids.rst
 delete mode 100644 docs/specs/pci-ids.txt
 create mode 100644 docs/specs/pci-serial.rst
 delete mode 100644 docs/specs/pci-serial.txt
 create mode 100644 docs/specs/pci-testdev.rst
 delete mode 100644 docs/specs/pci-testdev.txt

-- 
2.34.1


