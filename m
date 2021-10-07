Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C24254F8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:03:08 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTzG-0002hI-Js
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYTui-0008BR-Ei
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:58:24 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYTug-0000x1-01
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:58:24 -0400
Received: by mail-pf1-x433.google.com with SMTP id s16so5486733pfk.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpTwyC6LmhLimBWu/X6COjcvXv9MrWnGiSjZi/aYcAs=;
 b=UZyhF6GmM+oe1EKknV3kWvBKDE1QLtCy5SgHuPHn1d4c49uQSICC5g3k3uJ7N6CKhP
 eVKGmE3FZm1P3xoFdzh8PEdlrZV3r1UA7n4nyrrnZ86dUVF3ua3pXFANgWLc5K54chz8
 HQRySombswxVYhjQFTA0Gwb82PAuAQtf4DopDNH5bXUIUzYKUn5iYHawZ78mTgyOMZWh
 ZWwDiaq7KNKJFlxu4xiu8JjOnm8K6d1Zjwvr/DtyzPvxJ4iGD2gGciMwSxVUx22WEV2E
 RYw5T4/qXkK7ISZrqkEuQghzeMS4fFX/1oNTp2+B2pbOofGifw4VbcwmaUen7BhV6uo9
 n2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpTwyC6LmhLimBWu/X6COjcvXv9MrWnGiSjZi/aYcAs=;
 b=b+aCp88mYn3YwLV7s3ZIwGihYu37nrS+Y0EyHBRJkxzK+nRIQ6rgtHs6ik3s3/hxPh
 TWz4G6KJaPmtOPr8ZI53iyEbzcX02bdh/y8mUGFGA00BTrqQ4lCyQwQW0nhikfiNpIfR
 OdH4v8eA/cM2dNE1u7WydjRq7zLfGfkD9ax7sQ/916XcrQXUvvNnS3lqb61ywAV0p2i/
 vQUJPKWGM99RFVXJqLdmACBr9On1wgvkNZdPHOhcNh+aUQt4CaQjwhZRssQalTESTmx5
 SKZL3LiA9iBde48Rzws323wvmKo6mhesQrFQQQCsXqOF6vVj5lvSijdXSnBwVpkWKF07
 ySBQ==
X-Gm-Message-State: AOAM531jmLBoCFI3j38MKGiaXAJsCNzQX0n3Qla/A2KZVig1I4chceYB
 pK+WN7ruNQgcPWHwOuYZUi1Hnr55XwHihQ==
X-Google-Smtp-Source: ABdhPJzbQPqxqj0UPbBhyJqWxyGY0CHjdWGlek/0mMLSXxNk4K13JAz9EAxnNMlZg1XCnqakQD2yZA==
X-Received: by 2002:a63:dd46:: with SMTP id g6mr3521934pgj.347.1633615100320; 
 Thu, 07 Oct 2021 06:58:20 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.196.214])
 by smtp.googlemail.com with ESMTPSA id
 p189sm24283400pfp.167.2021.10.07.06.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:58:19 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] tests/acpi/bios-tables-test: add and allow changes to
 a new q35 DSDT table blob
Date: Thu,  7 Oct 2021 19:27:48 +0530
Message-Id: <20211007135750.1277213-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007135750.1277213-1-ani@anisinha.ca>
References: <20211007135750.1277213-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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


