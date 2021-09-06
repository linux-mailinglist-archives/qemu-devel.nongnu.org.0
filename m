Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C4401903
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:42:02 +0200 (CEST)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNB8b-0000fT-0H
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNB69-00071e-RQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:39:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNB67-0001lh-So
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:39:29 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e7so3582673plh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HjtGfbafd4DmU/9oP8FSbxIk/8884oXtFdvp9ieElU=;
 b=Govpt4duuyYpRVrGZEDkweDqeRo9V0cwi3q7kdXesD5JSwf7fLMRrmwxblbuQcS2pc
 GZQ7HP23Kvin5nphY6Sm5en7g4TEdqB/acSYNLVbGYCBaoChefBf3upOWDiIB5xFjvk0
 bCz7eF+l1sHnPofyDRx72m7wY9GxAJ9gv1FLypNV1n1NXvo3WYNZOdZ2Jf+Fsc6/BsoJ
 nlmPwTFlUAsnlQm0TM2uylDvs6cBpXBDl4bqHlSX0dqMThP9+YZidfCx19/dYu73qT4J
 flEL8ubl8btTG+S33Z+0FfL21Tzryzx+ooNnETEu00kGN8oLjl3uBXhDaMAVjGaKxNDk
 sx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HjtGfbafd4DmU/9oP8FSbxIk/8884oXtFdvp9ieElU=;
 b=hy2W/JUNy4OkLWS66YjXokRIGULgpnm5HiR6i3LDSkMIk0QyXInCkHWfZg93bFxnTn
 p63yTgwqMbmpTE+5F9TWlHD0OTl4XfEsBOX8VbcDx9/JgXf8rSsrbYvwGRxwuoSR8/xj
 KNcUbQ+/BdrrnK881/5Sw3QWuoCD/gVhqJ7oFIljMNqRqZy7Yq++Tmp3L1QhqVx9w7ce
 4GRjhRyNpECZNPBQiH0rDe4yPAz4DEs75hV49/3P9l9z493kE0AvsHJNfwMBlvFtDS5O
 YJYqEgi3BVVOKKyxGk1sag8GJsTN0s1Qbk8owRbUivaKOUYGxHvUukafdxrXogYO5nFB
 xO9g==
X-Gm-Message-State: AOAM532Qso2VfkW0bRTqbSzQT/qXIyzVKATCpq+CV5LuFopDmFkWLBLc
 492BG+rfCq/KouyIJVKFyZrj0X5v9wbrpQ==
X-Google-Smtp-Source: ABdhPJySKhZnuOsyoNXvc02ze5FpqoYb+EvKlFH8HknzzWO9v2CQhy3/7akNgmlHLry27pewTPc+HQ==
X-Received: by 2002:a17:90a:cb83:: with SMTP id
 a3mr13073092pju.91.1630921165700; 
 Mon, 06 Sep 2021 02:39:25 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.175])
 by smtp.googlemail.com with ESMTPSA id
 z131sm7111183pfc.159.2021.09.06.02.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:39:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests/acpi: allow changes to DSDT.multi-bridge ACPI table
 blob for q35
Date: Mon,  6 Sep 2021 15:09:09 +0530
Message-Id: <20210906093911.2069140-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906093911.2069140-1-ani@anisinha.ca>
References: <20210906093911.2069140-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
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

We are adding a new unit test to cover the acpi hotplug support for
multi-function bridges in q35 machines. This support was introduced with the
following commit:
d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")

The test uses a new table DSDT.multi-bridge. We need to allow changes in DSDT
acpi table for addition of this new unit test.

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


