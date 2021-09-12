Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C48407D76
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:08:25 +0200 (CEST)
Received: from localhost ([::1]:53028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPPDc-00058k-VL
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBO-0002hu-4f
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:06:06 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBM-0005Ks-Ma
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:06:05 -0400
Received: by mail-pg1-x530.google.com with SMTP id n18so6698821pgm.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=VuF7NmB3Q38fy7Hbke4C8NBnoJlSIDFO2U4tlXnt3L/VybWmN2rxhqzqt9veyVD4BP
 9l/FdM04NBYX5+29wWeNmrjWNxUwlGX2ckMm8bbVa59bc32IlkBj+yWM7Dc/smox8iK6
 BilVJGvZMBAvKyE2FDsfxWmaltT35Tw70CERsSaYKO3mubOn2xY88Ud60/hrHOT4x0YV
 tKJO8AJdoO43DtQkeenXDisTAfKnUFJKlTymg5SZFGJ2QtpvpLawXd6DJFHVua9d8r4x
 Yo0O7rsOl/+/9A2ivJjyKoFJGqZOl5ppUXIasWRukeqeCsS7tIwsV97M3d/pg2rufvRl
 0fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=jn2OnQWenOVmKQjm26ru8Tp9N5vNO7eDRnb5l3qdEwsmlt0oQb2iVAbRqXOA6Oy6+0
 PO+spxPRkOCDC04PHCNI9W5Ld5cun0fKRwFPkNfiQREuejaBxPqQd4g0e1bGVBaMYWvp
 Ihdi2BuSik2tqNEAUNXHxWwUxI7rBzjEa9szMdrIaOJ0y8xJHb87k5RP8/Di+C9QfHXo
 3lg0I9urE+m8V0MxzZvriQlGUa1XgY7WsA2yXDoH1JcO3MFwWGmVFTGymSWmPyZF/bWP
 /BXZTymiFoVAHSk6ASuop9uP8/MAkyTQtvDwgu2bcAkYsr7c0Zetb7KE+i060f/PG7fs
 c+zw==
X-Gm-Message-State: AOAM532iMS/RzO35BfB90WaxBlpxHjEM+oFCXr3pBhkK8YesOasIRy76
 mS1CgP2X85oxJiY6yxVHP52bIdDEiNuBClHS
X-Google-Smtp-Source: ABdhPJwScHgpZW2d1uzi87BwayuQDeC4sWeyByu7L1zLShqa5PVDz2rXPD/FxqfkYhA3T6q+D22VhQ==
X-Received: by 2002:a65:408c:: with SMTP id t12mr6528776pgp.229.1631451963101; 
 Sun, 12 Sep 2021 06:06:03 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id qe17sm3849565pjb.39.2021.09.12.06.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:06:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH RESEND v2 0/4] hw/dma: Align SiFive PDMA behavior with real
 hardware
Date: Sun, 12 Sep 2021 21:05:44 +0800
Message-Id: <20210912130553.179501-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Current QEMU PDMA doesn't align with real PDMA's behavior. This would
result in Linux dmatest failed. This patchest aligns with real PDMA's
behavior we tested on the real board. The golden results are performed
in U-Boot on the Unmatched board with PDMA supported.

Changelog:

v2:
  * Add comment to describe document errors.

Frank Chang (3):
  hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
  hw/dma: sifive_pdma: claim bit must be set before DMA transactions
  hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer

Green Wan (1):
  hw/dma: sifive_pdma: allow non-multiple transaction size transactions

 hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 11 deletions(-)

--
2.25.1


