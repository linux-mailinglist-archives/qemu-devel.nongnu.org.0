Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7C4348F7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:31:36 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8sh-000074-Lk
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gy-0002oy-2n
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gw-0002gF-F5
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8l2qJYP9VLojED18WIThA5ayhCuizkU4T6ELRj0TeQo=;
 b=Cx57WIi96azwCyDX3QMgt5mwSIJI8+m4bidOIwYC0XnUWKyev/YF1m0O412tL3eq3UfhWZ
 yqARnHkTj57NmiOUmivTIcZQhspDE8Zp2bymswzoqfZZ5PzxK7XbZzBHuekxjCoUIsZEqM
 kd+MOlqI8LXT7tUkVzCwbkMFGtG2v8o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-8nQ4p4O_NqSevjKMaO8AiA-1; Wed, 20 Oct 2021 06:19:24 -0400
X-MC-Unique: 8nQ4p4O_NqSevjKMaO8AiA-1
Received: by mail-ed1-f72.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so20503403eda.23
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8l2qJYP9VLojED18WIThA5ayhCuizkU4T6ELRj0TeQo=;
 b=pZx9aZ6BvxK6FbDSh2QJlX7p6IqbY8czgZeIPQdu9WhQ4IP5w30qZj1ZVAOwbASH0p
 A3nWx1SmoLZDJPQ6MthUTt0uWdbpL160xIVpkopqv/xNGEJ41m6+qnvup1JU7TOalWml
 BXp/qx1uDwtBiPDcZwWbQkH1LHoZZG6X1dHK5UzIKlvh+EpC4fXxzNSsGCfk3YSR3CN3
 gcg4HWhjznWzEgLUxlJt+YrF3MBwK0ZeUbysIXf7q8BwUjFGclL3sSftbuEtIDxT1a+0
 7ybeLaZtBBXrZHcZuD31hMkjgMEJ20U2tklRnZTZic4IqK6+LpNX69elCk5Ncq5DBjTQ
 suWg==
X-Gm-Message-State: AOAM530J2o9JDIJyVXPALUDNoTUbv+EWXxNKajrh3U9+70pwF5aV3gem
 KrgSJmkL7Mudu90X9wGAuwbRFA5TzKCJ6MD2q8/XHj7dnBsl+1qr5dhdd/Z2AwOaWtEKWc/xAiw
 axA1jBYH2A51EX4enrDp9CXzA+FjdpeOOyYHY2Qo0ZcZ00HZ49O87K7xEWVoQ
X-Received: by 2002:a17:907:168a:: with SMTP id
 hc10mr45161732ejc.214.1634725163337; 
 Wed, 20 Oct 2021 03:19:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFM7l3ZuuoRqK+bTOoDlh0ihfoY8G+5rvj4yyxM+lWJzqVN9PL9tRGMCxrZneosH2ebk/xvQ==
X-Received: by 2002:a17:907:168a:: with SMTP id
 hc10mr45161705ejc.214.1634725163114; 
 Wed, 20 Oct 2021 03:19:23 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id p10sm826321ejf.45.2021.10.20.03.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:22 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/44] tests: acpi: whitelist expected tables for
 acpi/q35/xapic testcase
Message-ID: <20211020101844.988480-4-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 tests/data/acpi/q35/APIC.xapic              | 0
 tests/data/acpi/q35/DSDT.xapic              | 0
 tests/data/acpi/q35/FACP.xapic              | 0
 tests/data/acpi/q35/SRAT.xapic              | 0
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.xapic
 create mode 100644 tests/data/acpi/q35/DSDT.xapic
 create mode 100644 tests/data/acpi/q35/FACP.xapic
 create mode 100644 tests/data/acpi/q35/SRAT.xapic

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..344eee3acc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.xapic",
+"tests/data/acpi/q35/SRAT.xapic",
+"tests/data/acpi/q35/FACP.xapic",
+"tests/data/acpi/q35/APIC.xapic",
diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.xapic b/tests/data/acpi/q35/SRAT.xapic
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


