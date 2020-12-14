Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE132D9160
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:27:53 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobiS-00013z-H3
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobh6-0000EL-Rw; Sun, 13 Dec 2020 19:26:28 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobh3-0001DJ-C0; Sun, 13 Dec 2020 19:26:27 -0500
Received: by mail-wr1-x443.google.com with SMTP id y17so14711588wrr.10;
 Sun, 13 Dec 2020 16:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpEWn8UPKBlE5og7qP2cAW4mdzti1zrsKB2AYD+k8Bk=;
 b=hZHkiRJYdXLK/F2HWGCe8BBjQOLr59DYUyDuxrCOaDKlO9ITbbIe0sZ9gZoNopxVDh
 PW8x1oAYk7aTe3hbbXfb43ZkpLU1z+r3bmlPg+S0iUChxxqgqtGIoXonKQwcCt+og0Yb
 ixoXSa2wSH9Ak6C/fn22o0kc1/6t21vnnNUztrIhnxjwhD0mTiwe6l6BkljvDcsmyGgN
 aGnj+gZoM4JaF5CUSjaBlIHbHUrZrBWvtEKrHtJaue62Aj/jwqR7EMkOIul+qNuoJ0LY
 4Ds78m44p/8L73yKxLK1nsIJLo5hfSRi++KAnTpQsmPN1bbaDOtSwzlTVveQIRs//ImW
 t4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HpEWn8UPKBlE5og7qP2cAW4mdzti1zrsKB2AYD+k8Bk=;
 b=PgBjEHBTpNW0chhbcjHRPhtSMAmAMhdB0VGdM50D0f/73ka9tHoiRBCn3jTRJdlv40
 jmap9VqeB7EPrtCwaRwxJyO4tZ7cTK0fQaFXVldH8me6lGvxwHtfzkLBPJ7iFoxvsbr4
 JwL6PAGvw2vwSPV9HV84GBZx6dgFViMYn8FzX9icOrHpMf1bTyK8uQ0JUlmnFRCsc5YM
 n0RGRHfrHz//TBmGNCnevkBUYkswj0/pGQOBIntxT1Y8VUGzKZKMP7TB+xILeMXDTZnY
 qrbgDvDnqgePMMgF01lHH79fjNPoQUrNj834IxOkcwhcf0OKttTuF9fivaNahc02/tOr
 ym7w==
X-Gm-Message-State: AOAM530ta79qCD5r6Jh1KJJT64G5i5Cy3LpAUhYbHaIyylD+hnWCFeYC
 T1D/2ucNG5Nz8qUkm3ozunu5SirqDBk=
X-Google-Smtp-Source: ABdhPJyRCmhrfqFMiQCg035NUpi+GZVT8HSg3mfaqJqjKd9+5HqmH5Ji2iZFGP/V7mi4+mPkyzWn2A==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr19047192wru.327.1607905582648; 
 Sun, 13 Dec 2020 16:26:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l8sm28197427wmf.35.2020.12.13.16.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:26:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3] hw/block/nand: Decommission the NAND museum
Date: Mon, 14 Dec 2020 01:26:20 +0100
Message-Id: <20201214002620.342384-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the QEMU equivalent of this Linux commit (but 7 years later):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7025a43a9da2

    The MTD subsystem has its own small museum of ancient NANDs
    in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
    The museum contains stone age NANDs with 256 bytes pages, as well
    as iron age NANDs with 512 bytes per page and up to 8MiB page size.

    It is with great sorrow that I inform you that the museum is being
    decommissioned. The MTD subsystem is out of budget for Kconfig
    options and already has too many of them, and there is a general
    kernel trend to simplify the configuration menu.

    We remove the stone age exhibits along with closing the museum,
    but some of the iron age ones are transferred to the regular NAND
    depot. Namely, only those which have unique device IDs are
    transferred, and the ones which have conflicting device IDs are
    removed.

The machine using this device are:
- axis-dev88
- tosa (via tc6393xb_init)
- spitz based (akita, borzoi, terrier)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Do not manually convert tabs to space to avoid mistakes...

While this patch only *removes* lines, checkpatch still complains:

 ERROR: code indent should never use tabs
 #14: FILE: hw/block/nand.c:150:
 +    [0x6b] = { 4,^I8,^I9, 4, 0 },$

 ERROR: code indent should never use tabs
 #15: FILE: hw/block/nand.c:151:
 +    [0xe3] = { 4,^I8,^I9, 4, 0 },$

 ERROR: code indent should never use tabs
 #16: FILE: hw/block/nand.c:152:
 +    [0xe5] = { 4,^I8,^I9, 4, 0 },$

 ERROR: code indent should never use tabs
 #17: FILE: hw/block/nand.c:153:
 +    [0xd6] = { 8,^I8,^I9, 4, 0 },$

 ERROR: code indent should never use tabs
 #18: FILE: hw/block/nand.c:154:
 +    [0xe6] = { 8,^I8,^I9, 4, 0 },$
---
 hw/block/nand.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 1d7a48a2ec2..9ed54a0a922 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -137,7 +137,7 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
 # define ADDR_SHIFT		16
 # include "nand.c"
 
-/* Information based on Linux drivers/mtd/nand/nand_ids.c */
+/* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
 static const struct {
     int size;
     int width;
@@ -147,21 +147,11 @@ static const struct {
 } nand_flash_ids[0x100] = {
     [0 ... 0xff] = { 0 },
 
-    [0x6e] = { 1,	8,	8, 4, 0 },
-    [0x64] = { 2,	8,	8, 4, 0 },
     [0x6b] = { 4,	8,	9, 4, 0 },
-    [0xe8] = { 1,	8,	8, 4, 0 },
-    [0xec] = { 1,	8,	8, 4, 0 },
-    [0xea] = { 2,	8,	8, 4, 0 },
-    [0xd5] = { 4,	8,	9, 4, 0 },
     [0xe3] = { 4,	8,	9, 4, 0 },
     [0xe5] = { 4,	8,	9, 4, 0 },
     [0xd6] = { 8,	8,	9, 4, 0 },
-
-    [0x39] = { 8,	8,	9, 4, 0 },
     [0xe6] = { 8,	8,	9, 4, 0 },
-    [0x49] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
-    [0x59] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
 
     [0x33] = { 16,	8,	9, 5, 0 },
     [0x73] = { 16,	8,	9, 5, 0 },
-- 
2.26.2


