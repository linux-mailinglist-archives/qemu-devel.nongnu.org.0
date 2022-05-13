Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC8526928
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:22:09 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZvU-0005Sg-Q8
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZk0-0004ap-Mk; Fri, 13 May 2022 14:10:16 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZjw-0007LE-P2; Fri, 13 May 2022 14:10:15 -0400
Received: by mail-ej1-x62b.google.com with SMTP id l18so17704985ejc.7;
 Fri, 13 May 2022 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hp6j9E0komHwkQmjVaaJwGXlUmBw15qUD+2uycCxKRo=;
 b=F6ECj1KowlkuN7ndNLG4RXVONt3ugmk+q9Hi/xtsP3eiZ8ZL0nuSrxMOKrM5piAaMn
 oZVcacYQpx5jhTeQ451SnkGgZgcC+2FArUYvOOba7IXnLkpiLCmSjrJfH4140JrGfdaA
 DDKaBGot+x4QfZLJkUdcSRyMZy0355YA3JjyVQvKWKDVe9Oc+c0902kRxqJK47A9Owbz
 Wo23wbWOu/V3dS/MJkCO1+CxAj1a90WzQguDmjmui18vahU9ZuOVJyd1wrOW8CmmC5TW
 z1SN7HYd8RGG1I4E7qL0Om7lIq4IW5FH2ooK04osvFfWLUC7kJYdyWSiUU5whYG7aJw1
 CYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hp6j9E0komHwkQmjVaaJwGXlUmBw15qUD+2uycCxKRo=;
 b=KNYxYFDTxKU1O7P3e2Al+Yp7Uq5peOatKdU3+4r910QXaYGX79jrSiqiP17IWgWVz1
 VpYfuhWKwEfL284yAS+V7EwZ7c+qawmCDnBRUug3oyfmR6Z8yGslynv5zNqwYHn46CUm
 3GEGzg42Pa3cFT/y2ZB6pfBWGn8/zi60Xn74hFpIO0+wAkelqb6R8ifNIC4/8YrWE7PG
 5EMRxQ06y3a9YSjE1j2EOuyQCk6+tsDYP8hyZGRelBU8jLwSfF8APTYrjPA+F0SEThcv
 YrftnJOoOSvWdy94lIusmmjAeYdZhL51AbvfHH2HW+ip+8aAq55znlmFnNhKAg3slhdU
 gtAg==
X-Gm-Message-State: AOAM530uOZ1jzKi1trq41Q0N7K60XYyBaO+7KvwN4TjNac0vUTLAArMp
 yC42rFGyMXlyN0SOs7sbjbvWOU7DW60=
X-Google-Smtp-Source: ABdhPJwgEkBcZJqTIki5Kg8REFF/cfX7eSZw1juY5Lx09Lc2VuiwHYjI+5INyzSwkKmlGUFfLJt8Rw==
X-Received: by 2002:a17:906:4fd5:b0:6f8:5784:fddb with SMTP id
 i21-20020a1709064fd500b006f85784fddbmr5572529ejw.161.1652465409259; 
 Fri, 13 May 2022 11:10:09 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:09 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 2/3] hw/ide/piix: Add some documentation to
 pci_piix3_xen_ide_unplug()
Date: Fri, 13 May 2022 20:09:56 +0200
Message-Id: <20220513180957.90514-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The comment is based on commit message
ae4d2eb273b167dad748ea4249720319240b1ac2 'xen-platform: add missing disk
unplug option'. Since it seems to describe design decisions and
limitations that still apply it seems worth having.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2345fe9e1d..bc1b37512a 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -173,6 +173,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+/*
+ * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
+ * request unplug of 'aux' disks (which is stated to mean all IDE disks,
+ * except the primary master).
+ *
+ * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
+ *       is simultaneously requested is not clear. The implementation assumes
+ *       that an 'all' request overrides an 'aux' request.
+ *
+ * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
+ */
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
 {
     PCIIDEState *pci_ide;
-- 
2.36.1


