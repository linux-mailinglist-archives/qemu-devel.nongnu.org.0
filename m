Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736EB2D083D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:53:06 +0100 (CET)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3px-0001mE-Fa
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eo-0006TK-G4
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:34 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3ek-00085l-PR
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:34 -0500
Received: by mail-wr1-x442.google.com with SMTP id x6so7099398wro.11
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4WG/zg3A8ipr+8A7P0n4m3RDjKDl/Q06gfRVWrIvHA=;
 b=CjcdPERRFYdDm7Pq8nJzQdznI0uVtZpeDPO3WiImxywEkNRymEGw3O+sZ22xkrGx5/
 bFDTITaUssJz2fpNucSftj2HmbFSrHezuDKTlZxJbK8dwwFA2DcFmq7o9w/134W9cCKi
 3ARmMzZ9ID0hkxT/8DJNST9AHvUxO4KoFX0tORXJnt0ZTP8n1Q3Dbeo0WxzpQQIuru27
 yAkx+F2wjMu2Xwmcsp9Tftqw/uBUWbHKbD+NAsK8dmWmMhW4TKYwUSRKDE+TROTp8JzE
 k4rZJuzsSdwvxfCQDv4J5klz/iUt2Xmsj7boknXR/GV1mLiIz5ApJ5PD8hw0wulZerRo
 oYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k4WG/zg3A8ipr+8A7P0n4m3RDjKDl/Q06gfRVWrIvHA=;
 b=lmqowJIqJm9KSOM/gDkyVMWSNhI1muk8HwnhvxsdUNkrJiaF5BitI2Xh3fzvPpTdEE
 h/7fdwmCGnQGccXhtOX2qgoUKWFOKth1/tjsClcBQsVseiKKl3zuHEYQbSEzDST2w4ol
 NG5vxcEHqlXo29kmqLbKXPDHk2xAeWgltwPXyQaMUH1xH4cdKf2fAc7lOh8XBTj3cTpy
 GQnGHD/pcStG59mZpPbTS2OD6jUi8QYvnfCCF1qbfKzX1J1ss/m6OwX+ao23SZjNqW2+
 OrlZ4kvh/XZwDUjFAqvT/oKpn58IouBBECtgnvhAElR6arou+eXVPShIqzPTkgpb5if9
 IHVg==
X-Gm-Message-State: AOAM5333xJ+F6rZw0KO/ySrelJ60qavdZCOcS5V4sOBQ0cHKUMq9LZtl
 YZDAP7gFjeJTtRZXxFxC8+oOH4XP3uM=
X-Google-Smtp-Source: ABdhPJzlEBxNwEXGOad/lFiRSGUTbNn0/EeExTcljG+Dg6lArdB7sGAjkFzn+Ckd4AU+UsiZozhsiA==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr9986471wrw.132.1607298089266; 
 Sun, 06 Dec 2020 15:41:29 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s13sm11135976wmj.28.2020.12.06.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:41:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/19] target/mips: Only build TCG code when CONFIG_TCG is
 set
Date: Mon,  7 Dec 2020 00:39:49 +0100
Message-Id: <20201206233949.3783184-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
We are very close to build with '--enable-kvm --disable-tcg' :)
---
 target/mips/meson.build | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index c685f03fb28..ef70d9040e2 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,11 +1,13 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
-  'common_helper.c',
-  'cp0_helper.c',
   'cpu.c',
+  'gdbstub.c',
+  'common_helper.c',
+))
+mips_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cp0_helper.c',
   'dsp_helper.c',
   'fpu_helper.c',
-  'gdbstub.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'op_helper.c',
-- 
2.26.2


