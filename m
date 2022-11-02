Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850F616897
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:23:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKr-0001YA-6x; Wed, 02 Nov 2022 12:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKl-0001Da-2b
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKj-0003OH-Ci
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=DGX4ch+3Z9wWmQg4I5FtG0CJWiLP/75S6XZ6Mw8POtkuRyO5T8i1hhlW2YcjaerjpVvUmC
 4v69jfw8rikEP/IYjPmGv4PyprHVn0Pt6/KKDFx/KyQpLsWNPvDa6tSyKHjaEWyCSjW2Wi
 2FPibsWSIvL7sUVlrNt/H6bFu0y46AE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-0v3Kx5vIOZ2NoalMqkUfYg-1; Wed, 02 Nov 2022 12:11:15 -0400
X-MC-Unique: 0v3Kx5vIOZ2NoalMqkUfYg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so1264566wrv.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=5rbssPABjFnbcXoGlK7mkn7dEjlZhgQGZKICy/thq6lCORuXZSyZCK10TVkRu/BnLS
 WNBqsoqTfCCCDrJxWb6DBTfuZDyQjnNSltCnCiRpdg+qVd1rUY6pYH2bja8orDq0NXbn
 lmCEZtzKcTO2wVdmKybw1xVM/voNkRIfKSx3V5oWDcAKyX59Rk0eMA6sRxWgFkexkelC
 TzkhAS+LH8qrUgDgwfqwwnBQI/u7W9A71loV7tmjhjaziqQM0Hpv+2afJBtUl4+ND+4a
 qOii0at6xMYVEiyBUNHrVxki6uDIJGGdPrNP0cmO2+atCPI/IkNjTLQXtZFOGJfUM/G0
 Pkcg==
X-Gm-Message-State: ACrzQf0kqOV657hq0dtUD+DMXyQEjxnUu344O4UIbPfRfNhqGrdJs1Zg
 ACaiosSyRIisK7Vv765Pzg8tzl5OqKS4hgACXyMoa5UfVJcdhtlLeotA4ARysFZwtr7OdY8Zl7W
 kiTU7qOnDGT2we0q7pmLS4O6n0rlHR9k9R8S+0yeA2kzEuTn+VAv9gJmfbUuB
X-Received: by 2002:adf:f187:0:b0:236:6dca:37e5 with SMTP id
 h7-20020adff187000000b002366dca37e5mr15768849wro.171.1667405473384; 
 Wed, 02 Nov 2022 09:11:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ytAfxYo5ECvXK1+eayxZWa4G+B6r0KETvA6CMZWMo6G9BY3gO4WmvKnuijQiBwvh3rqQBNg==
X-Received: by 2002:adf:f187:0:b0:236:6dca:37e5 with SMTP id
 h7-20020adff187000000b002366dca37e5mr15768819wro.171.1667405473105; 
 Wed, 02 Nov 2022 09:11:13 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003b47b80cec3sm2762474wms.42.2022.11.02.09.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:12 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 60/82] tests: acpi: pc/q35 whitelist DSDT before \_GPE
 cleanup
Message-ID: <20221102160336.616599-61-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..725a1dc798 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,35 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


