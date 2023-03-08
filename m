Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1256AFC20
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNI-0001WA-1r; Tue, 07 Mar 2023 20:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMy-0000g4-Aj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMu-0001r6-3e
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cE1lvbrQD/be0DTValbD3GGh7xrknElB20eCW82+vjc=;
 b=CSZiRewHZWxahpUPLRn5ddknkXBx4Vxdogqd7F3jl+zxQsQijqIvfcU0w316oD+DB7DCyF
 s1rnN87L7utI21FhRUlxqMsAYSaPNJQMOE+YmjqRLNpPaM3gOEYJzjlCReL2JbGXnjVR5J
 THXSBqhYkew/W3RhxJNptHdv/GKHg5E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-SSy2PBXfPmKjW0Zxp8WnJQ-1; Tue, 07 Mar 2023 20:13:21 -0500
X-MC-Unique: SSy2PBXfPmKjW0Zxp8WnJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y1-20020a056402358100b004ea439d57b7so9288845edc.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cE1lvbrQD/be0DTValbD3GGh7xrknElB20eCW82+vjc=;
 b=YOsCDlOJM+OJbA/GSKoCfGRWNZi8ACnQb8Mqu5/uQ2X4QUgpwW0Vk3957nXed9Dyfe
 79f6KfueJ59KXKZ9lRYGYvU93NABy+mAirmguGpsZ3h3MM2euoNBvdzG7LIJgOxD44kE
 FJaMSEQ15WdMKdRXKmjSm0yyhvvwESdu64MhKbvLTwCMjgOmvOMu51IvP0wtYDC2Ksfn
 hXTJyUiUDQuapS69GzzM6zToZ4bGSdtqP24Wgi/RyG6d6b5fr5KmbNEIJGxxytEzejRX
 j4blN8G+Y8oAisu93+pOmAmFpJw4lhA1WEs0k/VjvZHL3MW6JKHXTPHpxKS4vPYPEkZl
 lKWQ==
X-Gm-Message-State: AO0yUKUwHIbocdFAjMF4roiG28ZvnpshMoPYqrIvUqmcTaZ5/J0UW4Hp
 zrVAY7W54ZU0NHSoOVsKK5U/bUg8vuAdqKGBbJaij7ViKMZpSajMO6ovTEn23qS4HwT8TD9kS8G
 5mDD/LoAoFegU04yDvh57UIPpiBWOqh1OzObX9EUZXNof8j8vFRLI/Z58JvkxSgNjUlXM
X-Received: by 2002:a17:906:1411:b0:8b1:779c:a8ac with SMTP id
 p17-20020a170906141100b008b1779ca8acmr16877988ejc.13.1678237999927; 
 Tue, 07 Mar 2023 17:13:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9UKOlRdfVIWchOoTPTst9M1aU83fP7chv5pMzY9Nl1Tk4rBgvvh66qmNs7YVxC7ZwRrkjLaQ==
X-Received: by 2002:a17:906:1411:b0:8b1:779c:a8ac with SMTP id
 p17-20020a170906141100b008b1779ca8acmr16877973ejc.13.1678237999682; 
 Tue, 07 Mar 2023 17:13:19 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 bj8-20020a170906b04800b008d85435f914sm6841593ejb.98.2023.03.07.17.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:19 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 49/73] tests: acpi: whitelist DSDT before exposing non zero
 functions
Message-ID: <a0facf38de479fc2d40d51dc4ad08ed5d160d21e.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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
Message-Id: <20230302161543.286002-24-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8911b10650 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,38 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.noacpihp",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


