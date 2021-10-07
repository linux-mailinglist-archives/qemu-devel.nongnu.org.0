Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B918B4254F7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:03:08 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTzG-0002aC-Ik
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYTum-0008Ga-Mi
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:58:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYTue-0000vL-L5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:58:28 -0400
Received: by mail-pg1-x532.google.com with SMTP id q201so5713223pgq.12
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiHzdOCyKMEGVLJeRxLbUqETLMqgsGnb2Pz9cIoZhC8=;
 b=HL4x20kFYecpNvvXkHC+pKUCg0g/ed6JVs3gNXjqRWJ6q38kTCQ4XoflRK0ig5O8ye
 Wx91aNoQPZZwPnhnt1gw3w/6EMx+O1kmzfasde4jic+hrSYQFpha8Xr2/QR77XCCzoEz
 YvSHmZTRxsoges+2o+cEzAZ1LIplLpA8bW1jqygXNdpOKSjMByTfVLW6WU7pveOmbGV5
 zbtT+k+Onsla10Fov3K7jI6BLoYUMXZJbQaYs6d6o8bE4tzgbtyVOBPu/8yxz/lcQcUc
 S1APKmItgMQemkZjE8kBMgflaE9HC8anAzUFPcGJxOAfYMiSiPByYgrrZPPT3trHLxPR
 njYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiHzdOCyKMEGVLJeRxLbUqETLMqgsGnb2Pz9cIoZhC8=;
 b=suHgvHxhYpzgsqPC/HPwdAkzD+0u0YxuDvQkaBZzCz31EWlTzEmNiLKEiyR/a1JRa5
 B/MJZdZKAmp9BFalqyRpdNUYyqq1VTCkVQPn3xPCw4bfqAzRWjNiU1fRs0RnABVFMV+Z
 6S5SrgVdBpKN9rQk6KycaOiuYcv5xR6HpTSGlAKwA6DRIUfHcQ2HsrEj1+tOrLFJPEaH
 msrabQPCZWq527wKMuoDyxakJrVek4SltPvc5Ku4i5NKIZF6Ne6mrhmeksOYYjAJScq/
 yGgqlcMS7szAXQV/4mNtU4aysVAANNNI2QKRT1TkkFp5busdAIwfyiZRJV3D5ileZaVy
 TlUQ==
X-Gm-Message-State: AOAM532n0eOz2jDXTOfgfVaRaNUQy5mSseQX1rJpDrosn0fejam9uox7
 M0C3v/CJnsnbZ+h8fk+YusZn5sTn6cc9oQ==
X-Google-Smtp-Source: ABdhPJx/BJ/IANc2ofonYOl9pdrUFJIKbmucrPogrIalcYL3m9G7uYXyq4bHu2sxYMBFzvVZwT6FQw==
X-Received: by 2002:a63:1b23:: with SMTP id b35mr3484575pgb.262.1633615097715; 
 Thu, 07 Oct 2021 06:58:17 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.196.214])
 by smtp.googlemail.com with ESMTPSA id
 p189sm24283400pfp.167.2021.10.07.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:58:17 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Thu,  7 Oct 2021 19:27:47 +0530
Message-Id: <20211007135750.1277213-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

changelist:
v3: removed "nodefaults" from the command line and rebased the patchset.
v2: incorporated some of the feedbacks from Igor.
v1 : initial RFC patch.

This patchset adds a unit test to exercize acpi hotplug support for multifunction
bridges on q35 machines. This support was added with the commit:

d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")

Ani Sinha (3):
  tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
    table blob
  tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
    for q35
  tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
    test

 tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8583 bytes
 tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

-- 
2.25.1


