Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE7C410FA2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:51:01 +0200 (CEST)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD8m-0005YH-Ln
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD5O-00016T-5m
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD5M-0001Fn-5L
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id j14so3253665plx.4
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpTwyC6LmhLimBWu/X6COjcvXv9MrWnGiSjZi/aYcAs=;
 b=vLkVHOvgsn5nTaHWgXRDWp3EoegKozxVFxD/++DggYvbGCo4/QIvXevldqJSfaxTHs
 AErI7k8UmTK/g7xnHYKDI0wuhQ6r8+z7VdUTRLjq26j9ooeumRo0p5Z4zGeeK9Q5BVh/
 UmRMjNCY0u19gzjotNFoxkzG6kyIvRFHrLM9cHp/wI4ZcuA9xb5ucYLi+GcOUHlrj6Xv
 Ut3vNEOio7uj1gug4ksooIR58AfSNIKuZFNFlVdyBZkL45pdsa+Jg/o9ggd4mGQ1Oegb
 6wHsyRsTQD3Ed18W7BiWRl0CLE7MBv8Zku41AtOeNsuhMxKsu52iafy6o4XzsjKm9qkD
 1lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpTwyC6LmhLimBWu/X6COjcvXv9MrWnGiSjZi/aYcAs=;
 b=sfftigElgMKVOfZOQxDC+Ckpb7mCLhj0eNB9QJlTKZerlIKbWFQV9dp6h6FBTYMin7
 Mu9GRTXSCR9QD/57//JrQP8NYMdh8u81gC+aOK2Hu0ZEtyXqou/OsUPQjz3BvLFSaCXG
 g+3mnuDtilI6edIU1XgJoOTIIxIG0m7iZkRTixRlJOZPC3TtxCRElCJEluxsNDFs4Pjw
 l18bVmUbt7EOuSH8UsZFaE38/FaWdZzVTTpmn/rQvgwR0QzCzhxVgUuffq3x8rU+Mi3u
 t44D/GXHDP7tskRFskclr5NOTtK2pqQ8QEOW5LDsUaDLz3ViBZu0QjbTbO5yCGP37fZK
 E0rg==
X-Gm-Message-State: AOAM531TAWYQk31hkMhdmghmnv+wZO4euCj28F+pTQiNcy4VofuOMKcH
 6NoTXqoj7BGpNp0AUtXHgl3TF0BeC1qIRQ==
X-Google-Smtp-Source: ABdhPJzqL+y1nKQUyYtB9jH/VGe7Bkhyg93QMLOcCgEsCDFpI2/sqRPFx/fNr6nCDdrgSOv8LNXm6g==
X-Received: by 2002:a17:90b:300e:: with SMTP id
 hg14mr375744pjb.90.1632120446364; 
 Sun, 19 Sep 2021 23:47:26 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id u24sm13400752pfm.85.2021.09.19.23.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:47:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] tests/acpi/bios-tables-test: add and allow changes to
 a new q35 DSDT table blob
Date: Mon, 20 Sep 2021 12:16:31 +0530
Message-Id: <20210920064633.3936409-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920064633.3936409-1-ani@anisinha.ca>
References: <20210920064633.3936409-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are adding a new unit test to cover the acpi hotplug support in q35 for
multi-function bridges. This test uses a new table DSDT.multi-bridge.
We need to allow changes in DSDT acpi table for addition of this new
unit test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DSDT.multi-bridge       | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dabc024f53 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
2.25.1


