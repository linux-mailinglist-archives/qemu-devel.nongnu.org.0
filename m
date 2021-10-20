Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA70434918
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:39:17 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md908-0003bO-GO
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hI-0003Vs-MR
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hE-0002uW-Aj
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NYKn9Og3lz4o30x/1JiH1NpvUb3mCz2MPvSBP82Jf0k=;
 b=DACpa+6ahkfMHFBkPiqAgZQriZicgx1IGVuXb4ifyLxpDnCBrUHFgydy2ZGMYsPt5UVsOX
 AbweG2bRwMTJpNk1DLXKjgtZhLD+QRPkoJbQIRGvs5oGEtD2D8n+g4MsP7n+zBsV+/3jbQ
 rdk2FH35JVVKc/y00Ro8dGydtGo479A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-4zgMl_REObqrxW46VvW24Q-1; Wed, 20 Oct 2021 06:19:41 -0400
X-MC-Unique: 4zgMl_REObqrxW46VvW24Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so20504018eda.23
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYKn9Og3lz4o30x/1JiH1NpvUb3mCz2MPvSBP82Jf0k=;
 b=X8BJraTnpAxtodNrIqWwTKnpJq4hEsYaZ62luLuwnL54SdCbfhlxmEOdHozJ7/eKdy
 AHF06CuzkwEPicbdvgPCNoEiwgoWuJaMfQjpDL3S+uThV8ej+T69inIzot1Yf1iZpHuq
 RY4gXXG6sVMYyngQkO9HdrGdptxjdnTUo3DcZ0+Zcyx4oUl/P7vZKaBczS+zE4PZmydV
 wZsuGK28AFw+7uUUz+jjp4yceOSiA5YDQtgMWltbUeO5cQhMMVlIjSzWq4TTCPSLFKCf
 Mrqky/ybhzTD5XCj6VOHtow77xEJgx50PoXLPtn41k1RpDyoghkaK63YoNg3g6AMHY07
 Z3nA==
X-Gm-Message-State: AOAM531O13V8JycvxkvbWW4M4StKCTewUpNkAWbkTNtCloinfH1iwSvb
 fki4YpcjMYW8xp51eD/9wWux4FXiQoQCmwUuJ/JVHKQT9qhFrruPKEych7MErtFCIyYjQgh2G9K
 rQ+RdA8fK/RIXqkJ3pOwwHiRUCWUlavZw1ZqnUd3FFcVo2gl/EqElLYhCqtrV
X-Received: by 2002:aa7:d8c7:: with SMTP id k7mr56181768eds.85.1634725179970; 
 Wed, 20 Oct 2021 03:19:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrg8Sncz6ysTvkwLqL+Jj9JHWaPqdCjpcuK+3QGE4WkABc1TghPDCCHx05op6OLt+3zS7F0g==
X-Received: by 2002:aa7:d8c7:: with SMTP id k7mr56181744eds.85.1634725179761; 
 Wed, 20 Oct 2021 03:19:39 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id e7sm1021511edk.3.2021.10.20.03.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:39 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/44] tests: acpi: whitelist expected blobs for new
 acpi/q35/ivrs testcase
Message-ID: <20211020101844.988480-10-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 tests/data/acpi/q35/DSDT.ivrs               | 0
 tests/data/acpi/q35/IVRS.ivrs               | 0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs
 create mode 100644 tests/data/acpi/q35/IVRS.ivrs

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4fe8e8272a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/IVRS.ivrs",
diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/IVRS.ivrs b/tests/data/acpi/q35/IVRS.ivrs
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


