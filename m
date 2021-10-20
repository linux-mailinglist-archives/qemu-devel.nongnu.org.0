Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F116E434984
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:56:54 +0200 (CEST)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9HC-0004nK-0Z
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8il-0005ZG-Fg
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ij-0004Es-Pn
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJsmD3QRv8SGmtAedpltN89f3tDK3M7g7adwY4lsG8s=;
 b=KA4a81Ya6MVw2K+K7wzghFbDShPpm+szg8ua6GodHcmXBNdjId2uVCQZrcJtlGk22VdWnf
 yoaEnWw1BHrnkBzvzk422P3TZYXmg4X3mZBwIoZ0bVwopNHQ75Fkh0+SdYvd7CPgjp6qcx
 I509RDsCp/WjDiq9jwFoTfYEIi2cOlI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-dUhSQ29lN4Wd3y45Iy9QGQ-1; Wed, 20 Oct 2021 06:21:14 -0400
X-MC-Unique: dUhSQ29lN4Wd3y45Iy9QGQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 cy14-20020a0564021c8e00b003db8c9a6e30so20535847edb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MJsmD3QRv8SGmtAedpltN89f3tDK3M7g7adwY4lsG8s=;
 b=46PIFON+I+k0E5oHiNI/NujRl5Tiz7aNCvq1oHMnWclZBrs3BllNMPmO7QzpXaFhDE
 67LlTdLjww86WUryufyl9b5kutRS1zXv0tGlOL0zpjebAcF+rIjwMbavG7hexNp7bI9l
 Q13aVs082G858W6K2It0mwTrgouwn3L5+md8hVLvukCSCkTufjZmvGcZwsnpS9Fn/9RW
 SUZgT13fOPjGwxW/Jiv1ani+RvLOvtw7ytqVR8v1rmqQm2RnjfHFV4cST6TXQftR2W4d
 +46EV6U8MbJFfik07TY1ZTJ8BN+RQYmxc+lPWVpZEyIkXPl8LoAjX7mv0TDVIjQqYPBa
 4/9Q==
X-Gm-Message-State: AOAM533ED8/aJiFW22WgRmYOo3ew0ibeUdGCz3W3nGSjl8ZrRGUXkCDD
 AplpJCuqQrxQzdcjmhZMpM7Ad0KPyv6LWq60eqiFhdnmEat5GxJTmUbGfDobweU6BqzHx9tyxCI
 AzN5YONesoM3A7CSn9kDPzHojauaiZID+T+czlBFG0CdLXCI0fEKUw7oaYzav
X-Received: by 2002:a17:906:58ce:: with SMTP id
 e14mr4156465ejs.261.1634725273250; 
 Wed, 20 Oct 2021 03:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJQu7NTa1ClIkHwkuR6m3rhQArX0CWOiV8ZEelAhqTgH4XFf8KBTK+JuZhY5tZ4OnukmPk+Q==
X-Received: by 2002:a17:906:58ce:: with SMTP id
 e14mr4156442ejs.261.1634725273020; 
 Wed, 20 Oct 2021 03:21:13 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id kd8sm832457ejc.69.2021.10.20.03.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:21:12 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:21:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 42/44] tests/acpi/bios-tables-test: add and allow changes
 to a new q35 DSDT table blob
Message-ID: <20211020101844.988480-43-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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

From: Ani Sinha <ani@anisinha.ca>

We are adding a new unit test to cover the acpi hotplug support in q35 for
multi-function bridges. This test uses a new table DSDT.multi-bridge.
We need to allow changes in DSDT acpi table for addition of this new
unit test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211007135750.1277213-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DSDT.multi-bridge       | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dabc024f53 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


