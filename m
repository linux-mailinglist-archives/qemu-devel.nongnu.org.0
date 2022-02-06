Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10FD4AAECD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:18:35 +0100 (CET)
Received: from localhost ([::1]:60412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGect-0005RY-3H
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0F-0000gI-DU
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0D-0003il-Cv
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SAeYk6Qwn6EXatjRomDHKxEpW2B7uuJLKwuu/8IMtM=;
 b=KWHHnJlW45dZbf5KsRwgMKglxKTm4pp1TYJsbd/+7U5WgYAO1Wj4OlggviO7ieOoPxvvdV
 ibkL1ILqNZhbl2vo9E128G6NP+qF2mlpfsnAYS4pDWP5Kf8MJgXOhYg0um/0lmbkw6bpna
 rel/IdhiNYtJK9tCt/68wmdxU+qIXCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-bPuoYse1OxGB0rzig_dqcQ-1; Sun, 06 Feb 2022 04:38:30 -0500
X-MC-Unique: bPuoYse1OxGB0rzig_dqcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 130-20020a1c0288000000b0037bc5cbd027so66082wmc.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9SAeYk6Qwn6EXatjRomDHKxEpW2B7uuJLKwuu/8IMtM=;
 b=5bQKeP2ZTs+C7EJW7LygXkeOL9CKsp0k1VyrAQcebFQcRKs/Yp8aijWth5Hahkrh2k
 6UcQEh/g0PfBQKGNzeOHbWpZSXAaogIV8ese3+U5zALI66WP1sqVB8GfAPFud0dnu1Gq
 eJcRWh8ise3om0wwHeL4xVAd6TX+zFWxPtWswXO8v4u1VeifPjdGhpzJ6BUovqRIM5da
 YeN7p2rCPKNfNxEAEPpiBLoo+JdOw1VHhuZrYTagqFkhaLxI3abGz7YS2ARRyVW3TZs9
 LbCdprxJ7PgHWhkcl5VP8IZcYYcw2Z2GLbK5/pDeCwS8E3RhSpnl28IPLjeNAA078TGl
 lY6A==
X-Gm-Message-State: AOAM530XhcugT4IHEkUB/wO/IRfOhaiMmDZimwMtfGZHkaqz/BhjZTPw
 ejNs/jGdODHX9Chcn1QzyikCe4cXWgVJ9fquC/zP9GoZ/kGoK3IYONEx7OZ5zm4rpiwZUsNKBg4
 GobO72bCAJMKrGjKOlOn/M7fLGwQNR6SNNBykG80Xdzl5aD9mxKeOoRXIP+qY
X-Received: by 2002:a5d:548d:: with SMTP id h13mr5871755wrv.28.1644140308686; 
 Sun, 06 Feb 2022 01:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwags1fy5d+i7Mx1QyPT7OH625JEKJx5fNgvBd809Fd5g18u75+ge4IT1XkalUMVY7YP4rW+g==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr5871737wrv.28.1644140308443; 
 Sun, 06 Feb 2022 01:38:28 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id b6sm7621637wrd.29.2022.02.06.01.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:28 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/24] ACPI ERST: bios-tables-test.c steps 1 and 2
Message-ID: <20220206093702.1282676-16-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1643402289-22216-2-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 tests/data/acpi/microvm/ERST.pcie           | 0
 tests/data/acpi/pc/DSDT.acpierst            | 0
 tests/data/acpi/pc/ERST.acpierst            | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST.acpierst           | 0
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..603db07711 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST.acpierst",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST.acpierst",
+"tests/data/acpi/microvm/ERST.pcie",
diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


