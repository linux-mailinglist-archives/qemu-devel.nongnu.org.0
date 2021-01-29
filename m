Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8545308882
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:46:22 +0100 (CET)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SEH-0005Ny-Po
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnB-0004Ar-Di
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:21 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rn9-0005tH-0v
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:21 -0500
Received: by mail-ej1-x630.google.com with SMTP id by1so12486565ejc.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fD81jsDTeYK4+eURnIGLe1g62Xp8VlxDYja/CHWOcds=;
 b=NHxNaiKDSy+XYfPEZ1JEp4GoZ7+CaOh+8uSB50nkmK3En2+hs8Q01JFqxjszmWBrA/
 elFdgxrfWbZLk6blE1DQLWbnxjd61o2TzNbsmk45t3JiqrUHcHd6YV/Dr+3maY+8xU29
 +Y6kwOJgL53QCqpaM2kQcw1JHfLuPxO7fV8Pl7V8GLGovA1nC1JxpVW0bjV9pEQe08Sv
 AayIBL1EPIc69x3nTnj3pAoL6L3mriK1YHNXJCrzPDJXauuimzenHq9HbjU/ut3F46ls
 SU0EcsX7crYq0376517nyfi5tsbXaOZPMCCKBBzcEQnnDwPz/LWEXMniJWKm5lQ7wAxk
 nBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fD81jsDTeYK4+eURnIGLe1g62Xp8VlxDYja/CHWOcds=;
 b=nHw1I+Ky4e0iGewGdoJbqnHW2YXgmnIL/gioX0lwss98zJmQhS1hRzaZbIKhCWa0YU
 V4vbT+FLtINX7b+yyDQgB6GZi0jp0Ai4EVB482H0NZ/awV931vUXABkPs30orfT7M6IK
 BuW7KB6r2o0q4KUv7b4LRauZmb8mOmprq8PxQKJcF1KnBnSi+VF8KWiibam5mma8lqns
 mmb78Is1nepqo0H2TSD677Q6vwSvdSG5k1jqJWCJZUEo2BEfca8YHY5tjnIoifL9ru6l
 xqI85SzGGYwSnCuquHcpjhhjLH0y/8w4DEt2bnbBOc+vJAZY4sNmnpITjLrRX9WYkgnL
 rhmA==
X-Gm-Message-State: AOAM5326pTn/2iDyQenY99IHcW+c8zW2DAQDzzOhSD5pT1LzGOQPyOCV
 feuTC7lNLuovhJ92hKJLRkYh+ccphvQDBA==
X-Google-Smtp-Source: ABdhPJzd4vM955H5z+gsrC4CptiGLOcCKAeM35CUBXUtatiWR7NNFDvd+Yta6lSXHViALmj/xK5r/w==
X-Received: by 2002:a17:907:2851:: with SMTP id
 el17mr3808009ejc.405.1611919097695; 
 Fri, 29 Jan 2021 03:18:17 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/36] fuzz: refine the ide/ahci fuzzer configs
Date: Fri, 29 Jan 2021 12:17:40 +0100
Message-Id: <20210129111814.566629-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Disks work differently depending on the x86 machine type (SATA vs PATA).
Additionally, we should fuzz the atapi code paths, which might contain
vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
machine types.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210120152211.109782-1-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..aa4c03f1ae 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
         .objects = "intel-hda",
     },{
         .name = "ide-hd",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-hd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ide-atapi",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ahci-hd",
         .args = "-machine q35 -nodefaults "
         "-drive file=null-co://,if=none,format=raw,id=disk0 "
         "-device ide-hd,drive=disk0",
-        .objects = "ahci*",
+        .objects = "*ahci*",
+    },{
+        .name = "ahci-atapi",
+        .args = "-machine q35 -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ahci*",
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-- 
2.29.2



