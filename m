Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C024D40A5A7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 06:56:39 +0200 (CEST)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0Uo-00023k-RU
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 00:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0So-0000a1-4a
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0Sm-0006aZ-HD
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id n4so7346656plh.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 21:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxK/zd8mRclYhMbLhjoUuX49tGs9BN4rwd7P7Hw9PiI=;
 b=qegCo5ztfghW1GzZPpqTDC90SwLAKmD7Iec/YTd7fI8HybTNYTwd2xhP2vJ7xhBw0T
 x4bnqWoZDkr3+ux1zynohiZJsapQ6qU9ZJHGCasuakewg5MFCWaXzcjxuY2bVjnW/fYQ
 iqNRbuhnK3HX7gTufPJEoRurfx3J6srWCLtdB2uf7nGB0Czjq39C4k72hvtrIK6U19sR
 TIhH3cGiXCR0hFFkDgLXvXW7PdR5ID4K/dQ/mrUDuLHKc7p63HDRVLxPJWzcbiVTq3IE
 WkCU6Ilnavlok4roI7v0Z+C7XIO5ifSI1VeJDX82ln61SF9/fU/WMi0rH+YE0mSrRKET
 FSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxK/zd8mRclYhMbLhjoUuX49tGs9BN4rwd7P7Hw9PiI=;
 b=NynF4NoyCiK3tvMIBlLKW1Aca5138MIFB9/MUSfmOu6pS7eiCpiVWtJW8tKGQ22zGG
 dQT9gnpZvJZ4wgMZlG+8XMlPoCebruh+mSQrKhRQgZcbDAJOnjL4xqCFUeIrPTyrL2SU
 ycf6nTkaKmb9MFO2Qfx3IgojoXQshbuU32OJEvCOzVqpf84weYYe+ztM0P23Pivf7E4j
 dEphJoY30ZhfhMLt66GWE+HfJy5jgvtz7A8TBQywKa2C0SOS6mInw9elzIVIdBScjnY/
 9UYBbbZ9vWRXBclU4cUQ1XnXBXTfZdFl4ch2KgjVOSahcBmZFFTFcW5KpeFQHmks0+oO
 7MxA==
X-Gm-Message-State: AOAM531qENIyLBH0G+C1MNsYnY61+9FdtPt0hZd0Dulk8385Pvv7w6Mv
 2kj46xujRyQXY6vABtSWFYUMWbEzm3ulAg==
X-Google-Smtp-Source: ABdhPJxJu2FsoefJdo/QvMIEQ9Div5zWW+WhzT1AuiuyPz1vIK6Xa2jLjloV50rssbXN48tvTfnQKA==
X-Received: by 2002:a17:90b:1e43:: with SMTP id
 pi3mr3454719pjb.135.1631595270910; 
 Mon, 13 Sep 2021 21:54:30 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.215])
 by smtp.googlemail.com with ESMTPSA id u24sm9262522pfm.27.2021.09.13.21.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 21:54:30 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] bios-tables-test: allow changes in DSDT ACPI tables for
 q35
Date: Tue, 14 Sep 2021 10:24:08 +0530
Message-Id: <20210914045410.3380946-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914045410.3380946-1-ani@anisinha.ca>
References: <20210914045410.3380946-1-ani@anisinha.ca>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to commit a change to fix IO address range allocated for acpi pci
hotplug in q35. This affects DSDT tables. This change allows DSDT table
modification so that unit tests are not broken.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a02b88305c 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,12 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.25.1


