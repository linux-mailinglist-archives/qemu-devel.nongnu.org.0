Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B09F183D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 15:16:25 +0100 (CET)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSM6i-0006vg-PQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 09:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iSM4v-0005te-Uv
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:14:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iSM4t-0001RO-8Z
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:14:33 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1iSM4t-0001QK-05
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:14:31 -0500
Received: by mail-wr1-x444.google.com with SMTP id b3so20224631wrs.13
 for <qemu-devel@nongnu.org>; Wed, 06 Nov 2019 06:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fEcohBnkvtT1G5e9lFAG8tmB1GhBrKu/sIO4qHnZGGM=;
 b=T1is5ZBUzcVuCimeNgm136na8x/brmMT+uD1hBDOwKF9Rq12Prx/IrxXqt5+qyysWE
 fWPXRDuWFi55++AmgMAAmXQB91CCe/vYhkukLljm3//OMMnKlBBz/0KAKZmREmaXkbeZ
 SXfo3ycWq5s67O1XEA3zRFwgv7VDgJUCGlrlmsv8oHerCPGcmyEBPApFDgXRZFJW3H6g
 Wk0OjuPa/3uI3+QbZ7hwpfM2ULXNg/yMhtEV3vBlqCuYd9V0Kvk+DAAQ2MDHlw4BQiJ9
 vH3wZzCUQHEKOffNAiph6nDB/QQabMX5eoXC2sRAdpPLvIcxoNeUZYvV99DhSHrp0aPR
 Xdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fEcohBnkvtT1G5e9lFAG8tmB1GhBrKu/sIO4qHnZGGM=;
 b=JYvKcrF8pJofKDAPghdXGTX20Mw3puHKnNS75+XiLCjgKhmZYKKop/OisZTGxL+F/v
 luPGfO0cy+qPThuBk9oBWVsONGofwWAyJ0pgQ9o0Jeoj3JL0aShi3CULw3s2Ha2fb1if
 FMR/ThTr08xBC3f6u/oS7jlFKAz0JUCQXN6ouXjsIdxAq2fMBiBv130mD1UA26JRXbdT
 HkgaIdHUuB+TS23DU1X04/UxOeNzGQU5i7G0BdsJ90LAD/e0R9a6LD0dgRdipfRn6Xvl
 8plTFGtbSPQ9h2h4FUV7OnVt8vKsy+mt+Rf1jaFIwAD41Ujda1j6jWJNpwKbIiyjhNEm
 nb4w==
X-Gm-Message-State: APjAAAX6r65LQdXQzJLFgSdmJgC784zIxOMD0l6+BayrHa5I/bVl5Eye
 zonjNsZ/933DRsjN2je99G2rGkATa9k=
X-Google-Smtp-Source: APXvYqxkr1zFn3XUn+7OD8WC6TC7qIgnyenkk2d3oNuKAU0gHstfaBpwmfbX6lwD+h69o1yagplU6w==
X-Received: by 2002:a05:6000:1621:: with SMTP id
 v1mr3095706wrb.62.1573049668868; 
 Wed, 06 Nov 2019 06:14:28 -0800 (PST)
Received: from localhost (ec2-34-244-242-0.eu-west-1.compute.amazonaws.com.
 [34.244.242.0])
 by smtp.gmail.com with ESMTPSA id d13sm21719571wrq.51.2019.11.06.06.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:14:28 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/3] target/microblaze: Plug tcg temp leaks
Date: Wed,  6 Nov 2019 15:14:21 +0100
Message-Id: <20191106141424.27244-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

On some workloads we've seen TCG run out of temps due to leakage
in the MicroBlaze translator. This series fixes the leaks.

Cheers,
Edgar

Edgar E. Iglesias (3):
  target/microblaze: Plug temp leaks for loads/stores
  target/microblaze: Plug temp leaks with delay slot setup
  target/microblaze: Plug temp leak around eval_cond_jmp()

 target/microblaze/translate.c | 61 ++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 19 deletions(-)

-- 
2.20.1


