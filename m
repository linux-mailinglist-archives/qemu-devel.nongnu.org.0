Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFA525DD0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:55:28 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npR55-00046W-2u
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1npR1U-0001ls-6o
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:51:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1npR1Q-0005GV-2Y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:51:41 -0400
Received: by mail-pf1-x436.google.com with SMTP id a11so7142712pff.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 01:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsHr0G9Zr2YOWJd31QFma/7YGSDiUr9kJxJhnyf2kso=;
 b=G1U0XFZ7IdiYWmBHKNJr52/Q0oJHpnXhBAKA9BoNP1je3ZTU5b2tQY6OE5/GdtERiR
 6BLI3TkfCeCuqFgORYkG2cfVAa9dmgLonu8mLazT1pwW1lPLSLabLs2fegSK0pWwxsE/
 IzZecuDoajK2KXyA4nAbVO3kBrdPdAQgkB2xU0hY8O2Fd3l4l4KubiEpxQargSPpvO0J
 vPtnpn+L6nrdqqbXttAOZ5of2lUV9k2xz74jiN3g+bd8lzYu8bwKbKRk/BDIhrVTSMO7
 CojOlOZ4TL93HNVT7QKb4DIjx+5sxxs1IRe8Rik3FQkZGNax80SG7tXQdWV3kAPZOcWb
 3l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsHr0G9Zr2YOWJd31QFma/7YGSDiUr9kJxJhnyf2kso=;
 b=X/hf/8iohzCUQ7UI/wmn+Sy5Y096dJ/gbg6wKD6nNNBPAMvk/GyeQRdMW0+IkAxwL3
 Y3BhbTo7h/VBE/iGZY+WYhAeKOEG38/8RN+Ds/tkC+VzKNGsgmEWTD80x4XUuID8eIi8
 rteNQWLtcsrsyaIgeB5IcjHpUgcnVNzw+tmKz2cggMaQZiUvCQIiS/QRVWGKA44adPjc
 VASiu6lu8ooI6rP+frHX30nhiocjCQmQ3qc+1JqTmjoRwt5jgYo3O10e1Fh503Fei9lD
 wvijQGzWvV1iCE5VIsc8wcCOHEQOXZ9Ba3J1xAywiNdGZqVvip+PKgzS9cfWCauto+qu
 aOLA==
X-Gm-Message-State: AOAM533l9lhi+swpkprQok0jatK+Pmc9tmDE2/H0N/aKlQMTKB9PAt5I
 w/mL0pjsennNdoxLgRsrOf7H7/LkueQI3Q==
X-Google-Smtp-Source: ABdhPJwZVowd93YjG4HQCK3EZEBbLTdtWU/uH9WwgA5UQ5wPnl9qqUXMhcufc1SMwoXmSfTnroyUyw==
X-Received: by 2002:a63:570f:0:b0:39d:2648:261d with SMTP id
 l15-20020a63570f000000b0039d2648261dmr3079129pgb.551.1652431895873; 
 Fri, 13 May 2022 01:51:35 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:198a:9865:5430:73db:b48f:47ad])
 by smtp.googlemail.com with ESMTPSA id
 a3-20020a1709027d8300b0015e8d4eb26dsm1253734plm.183.2022.05.13.01.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 01:51:35 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v4 0/4] RISC-V Smstateen support
Date: Fri, 13 May 2022 14:21:21 +0530
Message-Id: <20220513085125.403037-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

This series depends on the following series from Anup:
https://lists.nongnu.org/archive/html/qemu-riscv/2022-05/msg00139.html

Changes in v4:
- Fix build issue with riscv32/riscv64-linux-user targets

Changes in v3:
- Fix coding style issues
- Fix *stateen0h index calculation

Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 555 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  21 ++
 5 files changed, 615 insertions(+), 3 deletions(-)

-- 
2.25.1


