Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB56203C4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0W-0006E1-4d; Mon, 07 Nov 2022 17:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0T-00068j-TZ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0R-0005gz-FR
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=XLHwQ8kfZJkQnNWIsn9Sr6L0zDwSrMRkkaL1NPI6KfQzyEUQ9ZrIhG6JPKI7yzsSW0i3dz
 OP8Pm7xI56WCqFcCHtBj0vOFODm3zZVYq6l2+u3zRpVEQ8s1bysKC241JtMAk++ic3n4s6
 cR+fMMj+SPTGJwvJpMUAcfoUsC7XpD8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-HT7LzTE0Omar4c9oRXR19g-1; Mon, 07 Nov 2022 17:54:13 -0500
X-MC-Unique: HT7LzTE0Omar4c9oRXR19g-1
Received: by mail-qv1-f70.google.com with SMTP id
 q16-20020a0ce210000000b004ba8976d3aaso8524034qvl.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=6RDl48DeQmzYX2pDsHbRT6l43xnsgow5/zlt5K2tmZzmIB39UlFV92PR9lYF4jkAAw
 FPBIjah1p25PsIB4/GuFK9mFDtiIV3YTzfDjYlLCfbxSe63vj5icBUOCOys3AZcB4qVE
 LbwM5ya+rghx2OyclmIIIWgDo+a25ZPTST+E9m57mT5SExpElhAXxSML+Z8s8xXou4wF
 C8YXOWGUu56Zn2ETX9drZdcN4CmJTaDciwh5Slbs7vZ+dkW7+UjwjkImXztL47Ff4zGs
 IneOkE+ZAgncId+ib6XSQGBOza81GhiVqBbvh+h8fjGh225y/20mcsh2kEoxumM8EVxq
 VFZw==
X-Gm-Message-State: ACrzQf19XhqCokfJYLx6quaiNmZEh0HWCBnDp8CTIvAzrFqsB8cjcDvt
 IZkCWTBG/PEsFtQeLiNGHDMheOOi9ASLTq+ZBwZhrVerPyIqfwyG3pcI15vjY7wjgEjiM+ysdOy
 FMhCikGUWv3Afi9arTPfeXd0W1cvGz2Q/Eweq3cLsGc+9nS+bizl0gJwf+wxs
X-Received: by 2002:a05:620a:1359:b0:6fa:3241:52a2 with SMTP id
 c25-20020a05620a135900b006fa324152a2mr29859991qkl.95.1667861653125; 
 Mon, 07 Nov 2022 14:54:13 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6RcX3hbRbapC6YKv0fRC2mD61M1ov3wOY0lt4smTOQfGYvO/eT93k7uLpflMcvp84gCTKU7w==
X-Received: by 2002:a05:620a:1359:b0:6fa:3241:52a2 with SMTP id
 c25-20020a05620a135900b006fa324152a2mr29859976qkl.95.1667861652791; 
 Mon, 07 Nov 2022 14:54:12 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 x18-20020a05620a259200b006e42a8e9f9bsm7797056qko.121.2022.11.07.14.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:54:12 -0800 (PST)
Date: Mon, 7 Nov 2022 17:54:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 79/83] tests/acpi: allow changes for core_count2 test
Message-ID: <20221107224600.934080-80-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

From: Julia Suvorova <jusual@redhat.com>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-4-jusual@redhat.com>
Message-Id: <20221011111731.101412-4-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/q35/APIC.core-count2        | 0
 tests/data/acpi/q35/DSDT.core-count2        | 0
 tests/data/acpi/q35/FACP.core-count2        | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e81dc67a2e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.core-count2",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/FACP.core-count2",
diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


