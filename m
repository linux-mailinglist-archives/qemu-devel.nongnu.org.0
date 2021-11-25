Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32245E312
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 23:43:44 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqNSw-0002es-NY
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 17:43:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqNRm-0001oN-HD; Thu, 25 Nov 2021 17:42:30 -0500
Received: from [2607:f8b0:4864:20::930] (port=36645
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqNRX-0004Ce-7X; Thu, 25 Nov 2021 17:42:30 -0500
Received: by mail-ua1-x930.google.com with SMTP id r15so15132776uao.3;
 Thu, 25 Nov 2021 14:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8D6yTxUQLUa8/CJyWSPpmSVpmr3xI3g8G7rxNU+5T+k=;
 b=h5EGOCgZQ5Ujs3//Z+paQaTShqn/DLxHZnNatZS0z39jWMiKkQJ0+Z4bo5emoKmMdM
 ysKQ1NQaLfCP4mg4HgIGEKt9besn1aYSfxZnlsfKLK2IwdmgVBYqAUI49pweGQgbS2On
 LaF5HpN4TmRQjEhQwbAsgDGQZgdICuIacorVpjyOHqVfKUhJF/SgyNA0WcCcCtjwRwig
 oFh2qb+lGIqQ5R/ZgiGrjZItcTbCW312JPqSZLFOKvf32erOtDVyv4ASeHtmzawAaFji
 cWWSQzSTqPtkXJ3W70bxGo8gbwvrSBht/ufZMu1x0eeTi/N5297JOy7x8kMc4EQs9iCr
 gS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8D6yTxUQLUa8/CJyWSPpmSVpmr3xI3g8G7rxNU+5T+k=;
 b=qVZi/YwBvumd+/HPNZ+X6O+RZFPQFXl5hcHfXrngZ1Y7LOOTBtcp+dF/6ay+MmXifd
 YGN8WEq6p3BCqgDY03Tt/+hsmwVk6ORf1InD3KW6mRtz9o2k9DHUM/kIfCSdcjnyK0e0
 5xNNzeNJFepYSz/3+qxPX1dTxSaj/9eL2ak1PBrB2r2rqfeM8RIW7aMuP5Aomuqwcw5w
 D+jZJRoY4tHaQQ3c6A6y17ZMNI6PLkg4DjbGZmvOL1pZ+EJYDlLJ7lO7DbH6dO8c0ZgL
 kf2Go3JXTB2ZY3mZcY7791nYJtqpmQ21vmfLok8isju85qMGS0REd3K5zbKf71dHYXib
 Em+w==
X-Gm-Message-State: AOAM531pHc6PZT56je/+wgIj4ph1IyMWXj+0PGM4MH7uVAsd04511VDm
 0iJlRR2k/eiCPX6QBg9aAoPCU1H6wew=
X-Google-Smtp-Source: ABdhPJypq7ZEilkonHKm/RpzJf5fVXb+vX7SiEb6VfcrKy1D5P9g4e3JfA/hTyo97j1vcYm5EGacTw==
X-Received: by 2002:ab0:4465:: with SMTP id m92mr31213110uam.47.1637880133714; 
 Thu, 25 Nov 2021 14:42:13 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id g187sm2683721vsc.10.2021.11.25.14.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 14:42:13 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ppc/pnv.c: add a friendly warning when accel=kvm is used
Date: Thu, 25 Nov 2021 19:42:02 -0300
Message-Id: <20211125224202.632658-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If one tries to use -machine powernv9,accel=kvm in a Power9 host, a
cryptic error will be shown:

qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko, only "-cpu host" is possible
qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

Appending '-cpu host' will throw another error:

qemu-system-ppc64: invalid chip model 'host' for powernv9 machine

The root cause is that in IBM PowerPC we have different specs for the bare-metal
and the guests. The bare-metal follows OPAL, the guests follow PAPR. The kernel
KVM modules presented in the ppc kernels implements PAPR. This means that we
can't use KVM accel when using the powernv machine, which is the emulation of
the bare-metal host.

All that said, let's give a more informative error in this case.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 71e45515f1..e5b87e8730 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
     DriveInfo *pnor = drive_get(IF_MTD, 0, 0);
     DeviceState *dev;
 
+    if (kvm_enabled()) {
+        error_report("The powernv machine does not work with KVM acceleration");
+        exit(EXIT_FAILURE);
+    }
+
     /* allocate RAM */
     if (machine->ram_size < mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
-- 
2.31.1


