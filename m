Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295AA410FCD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:04:43 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDM2-0002vU-96
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSDIs-0005AO-KX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:01:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSDIq-0004ff-SS
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:01:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id n18so10398769plp.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpTwyC6LmhLimBWu/X6COjcvXv9MrWnGiSjZi/aYcAs=;
 b=M55ze9OeTazEw4ASqnGTh3ZPWVfgwaYajC7/G5GT2PPhmZCzFaX9D3k2JLbRPXkk58
 fTxIL3ewQjrj1BabWRJicijgH0Ukh5bBhkRYrmMwmnF1TBFxbQ+fv2OxvJN4884oDjEt
 m8J3KADH8lkPnI3YlHCVk3q4ezccqgfz1zp63zlqAGpRGP3buST1YcU0eeoDWYPLVhJT
 VyY1Fmus/HMh9hImS2wmTWJfkJrCDezeJRf+Z1z5CM9umjx75kFpqENbCTGdxZ+zrssl
 1sAM9TlSbO83/IpEKCFrk0inqdldn0esqolMtnyoMJiRL+sqZfgIFy+NatR7tA177S6u
 YNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpTwyC6LmhLimBWu/X6COjcvXv9MrWnGiSjZi/aYcAs=;
 b=seuoV4g9GrOc9Q4kBObZ44m5EwvCrZK13ZzqN5k1qKApRCKe2tzln1gtJOdjssegr4
 JOEO+TlcXI+SNVaRWfKq91514X+Kv4PGKP07kL8U5Bqp4diKsSZyyvM24ZoE3hKzueqQ
 kiScLJ8/DvdBTnbYu8lCG/p0pkPKLUg553soF3vQ9q7Ahdny6XzaUY1DpOIkqqazvRYV
 4xWtmCS1G9VTzai4l/7ZhRXmzWT/lmsD8x8oJvdReJ7OomUOcXd3Eojinz1gHpRw90bL
 2MlOK5ZZZEGTxU6qPORKKob3XnZbiJyEdQ1U/60XzdggUsQCHYXwYiPn3frYESUZF+vk
 2c3w==
X-Gm-Message-State: AOAM530QTyGTrbeWQIIHaOuTBpFVq7yBfnZgf5rBxKF64wbE4+I91xs8
 KbgzcIBlLRC6pfDL1diobzCSZp9imgNLLw==
X-Google-Smtp-Source: ABdhPJy4GS+rY2rjkWqYhHy45LBRujpOJkYYX5T0wNltOmiOgvL95auhUQREq60v7WdM4TuoJVz2mA==
X-Received: by 2002:a17:90b:4901:: with SMTP id
 kr1mr28024972pjb.80.1632121282826; 
 Mon, 20 Sep 2021 00:01:22 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id
 o20sm12897901pfd.188.2021.09.20.00.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 00:01:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] tests/acpi/bios-tables-test: add and allow changes to
 a new q35 DSDT table blob
Date: Mon, 20 Sep 2021 12:30:45 +0530
Message-Id: <20210920070047.3937292-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920070047.3937292-1-ani@anisinha.ca>
References: <20210920070047.3937292-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
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


