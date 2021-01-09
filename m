Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2212EFF7D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:37:56 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDVD-0002kC-1P
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTR-0000od-Pn; Sat, 09 Jan 2021 07:36:05 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTP-0001VM-DI; Sat, 09 Jan 2021 07:36:05 -0500
Received: by mail-pl1-x634.google.com with SMTP id v3so7093989plz.13;
 Sat, 09 Jan 2021 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rw7xFilfQauR99xCZ/G49M0Aibqgn0UsL5cXaRjCAxk=;
 b=B2IV64Xu2I6y4r2MrkdMNeN98K1kkSWNPa+XhpuO01kYDE9jwTmvHPXgnzxFSpusZT
 F6SzeNZQ7SLP8emTySCLAZFRMrqPVKTlr/aUgrfh7aPfNZFDY7FHrM/5qZv4B6p4NYNS
 PduEyQi4qG9GMRGx1I/RmjtE0GkWwqp2d1BAJ1qyGFW+15K1Qt+kOp3qcGl03otkaAKP
 ljw6RPewMiURm2rFC6Hgk5vWTSQFkofaE1Xjbar0ywGCrbs9T6dnOmmU+vcKUPVwgX81
 1mWqo/RTvXy1BkuSkD64qZN0PicrQS5dpHTAdrR2qAjtdQAKafKHSZsqywR/clFecxK3
 t40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rw7xFilfQauR99xCZ/G49M0Aibqgn0UsL5cXaRjCAxk=;
 b=MH9H0KOl+I81LhPsjk5kebr3oWkRZR69UKk0vWLHdv5cxQ3+OZSt/1JNwLxFdyfpnV
 jd+uqs5OxFrjxBgtB9YVi99nOMWzSRNGZDVMN1vwswA0jEO0eMiuaC9rW3BwBnH6Gs/m
 CewaIP6AFP/12GG6c0w7VVlunGJdM3/IbZIsFOm3ZuzMT+CjjlUH+wmhci70cM1rtIit
 lrbc6aniPw7yGSYwDQGtuLVme0BSvMhI2bZAK0Jd+RBe6RweJ2vUXSqNKbWP/tcOqfgQ
 C8XCrCleZcxlq/yH9pH1UcCe28fBJ/2QtBmEn7foPCwFEZz7d50YLvqmLjrZLkfPjhnF
 q8dg==
X-Gm-Message-State: AOAM530z7ZKjTPcVx0sRki7+cevNb/jc2ZzOfOt8jA3UQpSzAnu7qIbf
 TdZ/sjHPAGaUHTsvMbemxfM=
X-Google-Smtp-Source: ABdhPJwViZy1F5D/e4CMHQ7DVKQBbaAgFV7HFkknkJuZ8VpMTJum1OUvs8cTgWGmOKwamEUldZq+rQ==
X-Received: by 2002:a17:903:230f:b029:dc:9b7f:bd0e with SMTP id
 d15-20020a170903230fb02900dc9b7fbd0emr8310938plh.47.1610195761467; 
 Sat, 09 Jan 2021 04:36:01 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Sat,  9 Jan 2021 20:35:39 +0800
Message-Id: <20210109123545.12001-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This series fixes a bunch of bugs in current implementation of the imx
spi controller, including the following issues:

- chip select signal was not lower down when spi controller is disabled
- remove imx_spi_update_irq() in imx_spi_reset()
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v3:
- Move the chip selects disable out of imx_spi_reset()
- new patch: remove imx_spi_update_irq() in imx_spi_reset()
- new patch: log unimplemented burst length
- Simplify the tx fifo endianness handling

Changes in v2:
- Fix the "Fixes" tag in the commit message
- Use ternary operator as Philippe suggested

Bin Meng (5):
  hw/ssi: imx_spi: Use a macro for number of chip selects supported
  hw/ssi: imx_spi: Remove imx_spi_update_irq() in imx_spi_reset()
  hw/ssi: imx_spi: Log unimplemented burst length
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects when controller is disabled

 include/hw/ssi/imx_spi.h |  5 ++++-
 hw/ssi/imx_spi.c         | 42 ++++++++++++++++++++++++++++------------
 2 files changed, 34 insertions(+), 13 deletions(-)

-- 
2.25.1


