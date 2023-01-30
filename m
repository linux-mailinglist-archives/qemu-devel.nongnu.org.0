Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2DB681B64
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMagF-0008E3-Ub; Mon, 30 Jan 2023 15:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaet-0007JZ-Pc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaed-0007R7-Qx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzVW+M9CdG3Kbivqbsvk5I7zIAHXJlZCPmiYemzJ2xU=;
 b=RcEnD1U02A9bTPnD49SoCLCFCc3gkc4bPo4/XYpiQVvTAKuuG+KcF07WVp6tBDBWGHL6ye
 1DvIcyCM+6pOfXN6R/rN/DiHKkCOJGDAjg8rIBKUEz3mE+r/kSBQBQeE8DkWrE3c0lse9j
 fhTspuoXmjVFoo6gDUX7ptu8dR3ii1g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-ZxIjY58zMDaBTRMltipURw-1; Mon, 30 Jan 2023 15:21:26 -0500
X-MC-Unique: ZxIjY58zMDaBTRMltipURw-1
Received: by mail-ed1-f70.google.com with SMTP id
 t26-20020aa7d71a000000b004a244cc7ee8so2818832edq.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzVW+M9CdG3Kbivqbsvk5I7zIAHXJlZCPmiYemzJ2xU=;
 b=Epy4FaZ3m2KXGEMTNDwz75sxSSbBx2nbsuYYNbw1E1NWF2YkjacIvL/tAY2LkO4YnO
 qFbSU4I2NVsJd3wDjRiO6QHQ7ZzHq31BE67RvvlBxnHs50RyDQ2mZ+R0uZWOyedQrj2U
 qAmTFXDkern/I7RM4eP8/fsVtDXiWoIqvTIqOHgzk6LyjWzfcXNBN1ma5pNEqQ+SFYzb
 neCGv0dmZrPJyHRc1HguKZAHHv0uJEfkHrCnfwO7JSofVVWE0hP/PlH7lYAKLjV+0M4S
 NcbBCB73OKkodvv+DW4l5VVHUstcqATT63o63kZBmhSitlOd9Pc7ulCfMc75a2YbTPtX
 wHAw==
X-Gm-Message-State: AO0yUKU/NH3f/JaC+bhygQ19mJkLXz1Kk0OlI24sI7p6KqXlcf0luFRH
 Ajnc84IrPrCG/ld1ro7BCXDwsQL/PpUZVoJfHHUxP0NaB7Cs1BrDQKhs+2ryrKlvA8dnJ8NdYC4
 y2khLfMvneiz023R/917oBk4HRm02+2q3jwTL7M36lXy77oimuHLY9gIW5jPj
X-Received: by 2002:a17:907:6d92:b0:878:52cd:9006 with SMTP id
 sb18-20020a1709076d9200b0087852cd9006mr947836ejc.69.1675110084273; 
 Mon, 30 Jan 2023 12:21:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/dGOekejMxCKBeUI3eXxWleTBLGiCv60arXMNKPw25pWD3xvImWYoOOSWqFWKEPfeQYXOUmg==
X-Received: by 2002:a17:907:6d92:b0:878:52cd:9006 with SMTP id
 sb18-20020a1709076d9200b0087852cd9006mr947818ejc.69.1675110084055; 
 Mon, 30 Jan 2023 12:21:24 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 os25-20020a170906af7900b008874c903ec5sm2811818ejb.43.2023.01.30.12.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:23 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 48/56] tests: acpi: whitelist DSDT before moving
 non-hotpluggble slots description from hotplug path
Message-ID: <20230130201810.11518-49-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-39-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..0adf61bac3 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,12 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
-- 
MST


