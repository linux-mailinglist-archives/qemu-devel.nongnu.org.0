Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A4F4635AB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:41:49 +0100 (CET)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms3OD-0005b4-Rr
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ms3Ex-0005jZ-8q; Tue, 30 Nov 2021 08:32:11 -0500
Received: from [2607:f8b0:4864:20::92f] (port=42568
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ms3Et-0000Oa-LK; Tue, 30 Nov 2021 08:32:09 -0500
Received: by mail-ua1-x92f.google.com with SMTP id t13so41377926uad.9;
 Tue, 30 Nov 2021 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8D6yTxUQLUa8/CJyWSPpmSVpmr3xI3g8G7rxNU+5T+k=;
 b=ddXc3vCSwUcE9ckXWiBC1GLpY8/sKtqxL6kGvFnhxt6WfCv4Fai0zpzXEDOGZVKiBy
 LsNsfO4XPtLcddcxXtgqjJc8wb3CTXropQhnqpmt1bwrpLiRTFZriHbOGR8DfeVRtxG1
 MRsl21E2cJOexPnYKZbzRhyOdfmEUe4D0A6YHZJvJdkdnj+7qpkglML95ckDi+5yX482
 3RtxtTQSA47rCzyiuGskBsSlS+PXjpdhKKLANuT7/6KFcqEv4YwiHQ36GTQsu+0XX1ZB
 cyuzJzdhGj7LnkMa3ZjSqzmyu6m6Z7i0kz25qrAnAJRXIpbTS3glyola62N1Cfn9zmey
 99/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8D6yTxUQLUa8/CJyWSPpmSVpmr3xI3g8G7rxNU+5T+k=;
 b=Cp9XdOE34ErLUGEXxS7hV4Q3R0tovL3waQuwIx26PWMhMudl14mvR9XIm+7wSzcU90
 IYj07bUCxIwmj3i0ZHKxX5ctJI4SajeSDx6GZu4ZCVD3vLfoIr0/Tfjw3ig8/UN5xYnb
 GP1eZdKIDYpKyaBdF9hfKwA5Oh9VOSIrbQk/ukSnFUrqlCjwL5OaSGL0PMWgijMtene9
 M6trqusSfVC11ex9D4l6Bqqf2uk4Ulz3cSasEPuM45xSv4Q4EVxMtULskW9eAs8sdnyC
 Oeqi89lgOJ3xssQxdURBSadgQDlV7TZC6QWc6wUuY5pMN26rlagvohRi9c0gkhi/Orvk
 jthw==
X-Gm-Message-State: AOAM533bQewK9bS27cY7lPx49rwrrk5b+QdFQrmdzpi5kp/QYI0f9pzJ
 A1xiR8O9UlWeGFdJ/IGT7mGnoOGryUo=
X-Google-Smtp-Source: ABdhPJyAGvqOz2rloU5xUFkzCTC61U/yY2JcC03sp70MCGcGc/VJzqeWMvE13krJUsASuAaRlSGjTA==
X-Received: by 2002:ab0:1d10:: with SMTP id j16mr57014916uak.40.1638279124536; 
 Tue, 30 Nov 2021 05:32:04 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id h22sm2058071vsu.0.2021.11.30.05.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:32:04 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Date: Tue, 30 Nov 2021 10:31:52 -0300
Message-Id: <20211130133153.444601-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211130133153.444601-1-danielhb413@gmail.com>
References: <20211130133153.444601-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


