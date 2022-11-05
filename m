Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917461DCAB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMp7-0007lV-DB; Sat, 05 Nov 2022 13:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMma-0006c1-OV
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmV-0007M2-Dw
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=JYWczolXu83iy14HwjDcZlclXliutmEMQWXXMhbNWxKM1SrPl4se/I3RWbo8QLJaHYdIev
 EnqTkwV8LmY30brFPPfSJryzyBs8qrQ64UFCDMPsLOVtmrv6EjJVc793iwi4Vq+vnKj/59
 8aCEoi89uvQW0znESNg9VB/a2bcudFo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-3ZTt3HafMpSbV_qP18yqWg-1; Sat, 05 Nov 2022 13:16:26 -0400
X-MC-Unique: 3ZTt3HafMpSbV_qP18yqWg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so5987802wme.7
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=737OBKMsN40/79e2QGAmngdnYfZCgIS27QK9Jx3yCfg/wuSGtYfwePSOVC1e5rBvwt
 uf21kiLqbREXjley9wfyryKWzO9InzIVpWRI4WCwa4MvTMjMU3hyRyQmh9XOf6xwJG8F
 SeFaAHJCH8QvYxCKKUzsiKB1K3udUOOFAQeJoliytMB+0rVwNFRZjMgGYcI4I5TVb+/S
 1NcCOIvNfldS287A9yRLCjVZAohr4rTV+zPrvGrzB4YxIOzrzH5EbpxiUCjurf/p4V57
 PEpeLMuiCBwTdnD+sBBVcfC+UnmPD6ctHxUe/oxYOgdkFF1oq4B8UgJwFWU4SyBb9wE0
 A7yw==
X-Gm-Message-State: ACrzQf1vHYwTRw2Ixr0jGpapCwyXgzNXPr6dGomrcLFylDkoat7/+D+Z
 WJNLnfrow4zn2IoaQy4/4fK27t9XS7b3PtE24dKpyEJnE8ViPrvYzDVPjG7LLffPTuPYkUlnHDf
 LewiRwxyRCwvKjchwXP10y9/Z+Iv+zHr0G0N4pjq9ISJ/KcdISmqxWlNYrllI
X-Received: by 2002:a5d:544b:0:b0:236:68dc:8f54 with SMTP id
 w11-20020a5d544b000000b0023668dc8f54mr24753688wrv.504.1667668585591; 
 Sat, 05 Nov 2022 10:16:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Y/k5SCEGuJ1ejQXWElYaYrBArHuj/J0GFZrrFN/nUoDozLXdF7BfaOFgpIi/8f3ggqHBGDQ==
X-Received: by 2002:a5d:544b:0:b0:236:68dc:8f54 with SMTP id
 w11-20020a5d544b000000b0023668dc8f54mr24753671wrv.504.1667668585228; 
 Sat, 05 Nov 2022 10:16:25 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b003b4ac05a8a4sm8159726wmo.27.2022.11.05.10.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:24 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 19/81] tests/acpi: allow changes for core_count2 test
Message-ID: <20221105171116.432921-20-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


