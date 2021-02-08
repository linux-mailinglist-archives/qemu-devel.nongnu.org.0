Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6590312A18
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 06:28:12 +0100 (CET)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8z5n-0001O5-AC
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 00:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8z3M-0008Jd-Mv; Mon, 08 Feb 2021 00:25:41 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8z3K-000578-Id; Mon, 08 Feb 2021 00:25:40 -0500
Received: by mail-ej1-x632.google.com with SMTP id f14so22608599ejc.8;
 Sun, 07 Feb 2021 21:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gPTy3prYFMOOFaxBGoyd7hcvUquvXifcFGkIKIgtZ54=;
 b=TcKtZfPir+J29mmaFt0tFH+sXXgjDFe8jrPvs4f+OtTtCkBUgOdKdnFXrKggjvc0V5
 b4H6drG/4s1LhA5+tJIe4X1zTbVuzfnnueAEoBBSixq4K4SiZJYQi9VPh5umogGuajNN
 wfKLTJDlZ5/eWsVM/unWXTeIRbx6JGAxAPWmGQP6vILVi5+7HlleeBBaDxgeDQjN8M+Q
 imbOqJwrmoP0/i9PNFOlkGlQFMoM5ZNZwLND9+vwgaRRJZTQt6fzmqj7fBO3FlbxBVeJ
 u031EBGbITbtXRXy3fFoYuPqg/o8bb3UlODkmqDrmWihhLZHnH1vW/JQ0byTpX4EPXcD
 avtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gPTy3prYFMOOFaxBGoyd7hcvUquvXifcFGkIKIgtZ54=;
 b=d1HGFlIqbqnd3Kz9yEQZ8GW7Yza6mgHuJAVNxN/jr8Yf58qfnzVZPMriYVcl0lpQPu
 K/MAPc8kr37m8//cCIDFp0YjvUBmk+GuwLaufdMHSUxCmGVJyRtCz2uOmJKIlMWiaHF9
 IYdLpNLGZICvF6AwSMIwSwVScnH24XVW4BSilfcXchDEk0CgkMqhhRRsC3enxZY2u0dQ
 rXBUGao1V5BLUHNH9ogNNCEPM/AUDyV6QpiJdx0e5LKiy+gy3IMsyhPcXlsVcBlRc8tV
 H+QDGlNhqCpgaCjzlSzx/CLi/7eVlYvmad3KwfAnO4jDiGS8p9xOL9/Sf25GZCbWZ//8
 qsrA==
X-Gm-Message-State: AOAM530PFPn6tFWuKXItCgZoEpbh8fFTatOZ8DRJXYWfUuZ5fCm8Qb2N
 89t+erhDPREy4aYoy6zHJbU=
X-Google-Smtp-Source: ABdhPJwIFP6a4DUrN3jscoTx13Tb+TUcpEXrujcYGffiNuHb8ev2A+btxyuCjDG6OA4mQHQWKWcHtQ==
X-Received: by 2002:a17:906:c049:: with SMTP id
 bm9mr14769147ejb.535.1612761935872; 
 Sun, 07 Feb 2021 21:25:35 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id zk6sm7961098ejb.119.2021.02.07.21.25.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Feb 2021 21:25:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] ZynqMP QSPI supports SPI transfer using DMA mode,
 but currently this
Date: Mon,  8 Feb 2021 13:25:22 +0800
Message-Id: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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

is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

Add a basic implementation of QSPI DMA functionality.

Changes in v2:
- Remove unconnected TYPE_STREAM_SINK link property
- Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
  the device what its view of the world that it is doing DMA to is
- Replace cpu_physical_memory_write() with address_space_write()

Xuzhou Cheng (2):
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Implement basic QSPI DMA support

 include/hw/ssi/xilinx_spips.h |   3 +-
 hw/ssi/xilinx_spips.c         | 230 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 200 insertions(+), 33 deletions(-)

-- 
2.7.4


