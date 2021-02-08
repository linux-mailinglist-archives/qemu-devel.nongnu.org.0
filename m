Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD9314349
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:54:59 +0100 (CET)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FQo-0005j9-LB
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCF-0002rs-TV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:43 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCE-00061d-0h
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:39 -0500
Received: by mail-wr1-x432.google.com with SMTP id v14so2805386wro.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fD81jsDTeYK4+eURnIGLe1g62Xp8VlxDYja/CHWOcds=;
 b=WYdJEtWQoO/+YbvLTH81icEs/Hw8A7tsJBDbsowE5F58uTZnisLP1fqxX6ryiploCg
 CL1ODgBkCgbTfAMvj5n4DAMktZ3Pg+9fICmeWQkeY41FyqqXQJN5HzC+iJ6b3pj453Tv
 GH6VdA7yv7dmLszTFiMuLO0gO5/mUF+9qtNlFa7KzpusceETrQFWfpOhvr7Ea0zKSpi1
 rUjgZS7bOd3wAlESmc4qSkWd6aa3/OAzZNTZcAwVNe2h/WHln1YkPYCMYKhJNs+YNhhG
 F0opRSR9cImCFQ5hfRSUFKROGi4C3nXzkKq9HadBkwVnk+Kk8gSJNYtYtSXY9KmG57+U
 0m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fD81jsDTeYK4+eURnIGLe1g62Xp8VlxDYja/CHWOcds=;
 b=gk+LCu3dNBA0P51+ay5Sm129SN3eDRcxYiAD9FrBlVWMab5eliZI4GKUG7rnzC2lRq
 BqdcVr8T2F44X7K3yu7rwUTrOfX77nOpGfOYCxN/n/ZdblO+qkAbCSRJKRFZ7TSDNq7t
 xniNXTtooNo7+dWfb34wuIXMgqXxP1zj4PcoFEM4QcYbyzK2FmKIm3cgUFh+gQl2bz9o
 dKKsNj76JT5FLKYozvPdJV9IIHqpLF+K8NXGsvR6Tx2f1fLWvE65lvyasWv4sCCvd+DG
 nJNJmdYI8Mjv05s8zdudwhEHJ0BdyVSzihIo6woEggdCBvQnRpWtwnJMWbYFHQqnBjoV
 tBAg==
X-Gm-Message-State: AOAM531qyYZ7TGRHEeVsKqob/J0kRXJsEWKFo+vDDNFMwAcGfjsq6Nhf
 +3nvrk/QXT79NU+WqAsahfl5+o4pVL1DQw==
X-Google-Smtp-Source: ABdhPJxvslcWVYgeuJH02unfMN4nlBe1VcflbFqTnU9mEVyRNsbdf0tCNVSUNHw1N+fPMNGdkKi95w==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr21466192wrx.302.1612808615696; 
 Mon, 08 Feb 2021 10:23:35 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/46] fuzz: refine the ide/ahci fuzzer configs
Date: Mon,  8 Feb 2021 19:22:47 +0100
Message-Id: <20210208182331.58897-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



