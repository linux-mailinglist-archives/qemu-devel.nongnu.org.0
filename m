Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE12FB633
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:04:18 +0100 (CET)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qgD-0007zH-Hw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qe7-0006Q6-TA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:07 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:33004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qe0-0005vN-JB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:07 -0500
Received: by mail-lf1-x132.google.com with SMTP id v67so28944428lfa.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aChTYY2yTHgtoZDrBEPQvIShE0kFKVSxBXaLHf1R+3Q=;
 b=fJ0H1BqkzMHTzaV/Ev3KVhgt0YsBGe3LC1/Py/vAaH3IvrgsqF3EY74hS/Qt3Da6Hv
 cwWOXsS/WowaURPv3w16km1Ldmosx0sEOLWITUJhJZtVYSTaZ3uJRm6IZTAh9amRKN/9
 OcKQeNRdwCWgf31GfFhU35ZoceiqNDeeNes9ALe2rL+ee8k/w++wkM4QN2HjpwW6o3Ad
 3VQh6tBqqzhjQ6zC15+37IrjytXiyJ8UkeWzxYsaZDNsqrJTJdftu4USHQtPgK52rB1+
 Y0xGmRL+pl+jJqaEVqOiXockGVtVdBMGCsWFAdMTnCz6wS34F32ej2xChqsbvOw5ZsKm
 +Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aChTYY2yTHgtoZDrBEPQvIShE0kFKVSxBXaLHf1R+3Q=;
 b=gq4yK1/uMpXyiJopiyb3dmGaXSPj1kiJmMqOR48009txGMTp0GMXpR/iRZ+j2zn0t+
 LX03WNjTkiZhZUXX2sJHFY8ztAnM4/5nsBSwbocHCnAbH123sKjHCHO3G2rbHXEo2L/8
 eYzry3SP9dFHRbq0d359rd8iGfRC2O1VgTO8SS3X/hUbbfSQJGWzThLYCQWQcf9F/Kqs
 l2ISBI0Xd8uc7L2T23MK1/QxLso3oIt71GZPg4TR2NBXGsOZvuv9s0qafu3XAwCGbUjI
 mfoFZEXzuXzshAQq0DG8Wd3pERayPYDEovXMjNYKGR3R8BDfeldoY+1vKORM+b3wtg8n
 phnw==
X-Gm-Message-State: AOAM5305Ap9B35bk6KtCQk/RIdYxjfxIIuJ9qoqMWAYhbSZddPNquc9o
 NokeJn1SU7fTzjm+SHXwRh8gFhSEDHD5Rg==
X-Google-Smtp-Source: ABdhPJyKEpur98ycw4QgsTICmwG7LLxiF7jo2nxZLuTSzXoTr3jyNRv17z+v7DnNbaRcluC3E7tzlQ==
X-Received: by 2002:a19:1c9:: with SMTP id 192mr313941lfb.467.1611061316872;
 Tue, 19 Jan 2021 05:01:56 -0800 (PST)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id e25sm2356745lfc.40.2021.01.19.05.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:01:56 -0800 (PST)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	frasse.iglesias@gmail.com
Subject: [RFC PATCH v1 0/3] Introduce ssi_txfifo_transfer 
Date: Tue, 19 Jan 2021 14:01:52 +0100
Message-Id: <20210119130155.30194-1-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, alistair@alistair23.me,
 bin.meng@windriver.com, mreitz@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear all,

This small RFC patch series attempts to make it possible to support the
SPI commands requiring dummy clock cycles in the SPI controllers that
currently do not support them.

There are two ways SPI controllers transfer dummy clock cycles. In one way
the dummy clock cycles to be used with a command are configured into a
register and the second way the dummy clock cycles are generated from
dummy bytes pushed into a txfifo. Since these two ways work differently
this patch series introduces ssi_txfifo_transfer to be used by the
controllers that makes use of a txfifo. Furthermore, since the QEMU SPI
controllers models transfering through a txfifo require that the SPI flash
(m25p80) operates with dummy byte accuracy (instead of dummy clock cycle),
m25p80 is made to support toggling accuracy between dummy clock cycle into
dummy byte in this patch series. This is done automatically inside
ssi_txfifo_transfer.

Lastly, one SPI controller transfering through a txfifo is modified to use
the new function and has been tested to work with the FAST_READ command
(using 8 dummy clock cycles). For testing the first way of
transferring dummy clock cycles (when they are configured into a register)
the Xilinx ZynqMP GQSPI has been used and all works equally well as previously
with the controller.

Best regards,
Francisco Iglesias


Francisco Iglesias (3):
  hw: ssi: Introduce ssi_txfifo_transfer
  hw: block: m25p80: Support dummy byte accuracy
  hw: ssi: xilinx_spi: Change to use ssi_txfifo_transfer

 hw/block/m25p80.c    | 112 +++++++++++++++++++++++++++++++++++--------
 hw/ssi/ssi.c         |  22 +++++++++
 hw/ssi/xilinx_spi.c  |   2 +-
 include/hw/ssi/ssi.h |   3 ++
 4 files changed, 118 insertions(+), 21 deletions(-)

-- 
2.20.1


