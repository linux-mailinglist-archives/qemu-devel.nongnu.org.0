Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D299613773
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:09:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIc-0003VG-1w; Mon, 31 Oct 2022 08:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIT-0002jo-CV
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIR-0003L6-OU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=BJ8t5fg/1UaUUfwAlBZIh9IYAg6E6//uHQWOzx9dZz68quao18q1tRW3CPUDMAZyA3t4IO
 mzD5dMTU5jVluKDvzUXCW3kgIXSwxXqPLp0IFB6PrZ9IREnAohiXyEUxVcMDOVn9dSv4Ln
 2w+KdnD8Of0nBF5i3fKIZVWp0toTF0s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-21zH_sXSNG6kz096YHXw9A-1; Mon, 31 Oct 2022 08:53:41 -0400
X-MC-Unique: 21zH_sXSNG6kz096YHXw9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so2570490wmh.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=MTZM2EKFFFTsqd/X2YFdA5MT1BQK+rUhwd1FBlhOVZ9z+fwxWvQAv9DNRpn+E1Vz8i
 Smc0aYvDHY8hEiK7+0FeAlnmRfT0GGwz+upiCmrKv+yd9PJneecrCM6d4Zkq+lBrTFGq
 7AfMwvWhXGchrZx9Xa48jttF6j13uzU2DAl+JyDYmFOqqriDzu+cn9evR4Qb3EFKgd4j
 uMdqhVrDXiS5qrBtctWSvVpa+DAa1fdrxbtuiYWOGGM/X2TSALyJAXCk53Dynk1IdsqS
 hA0kck0FsLzkyHtJplsRiF9xJkAaH1KGmEDy7M9C1gZyd6eY8OXObwYii9SOzXEj6xdm
 P5Tg==
X-Gm-Message-State: ACrzQf2Kxv1nAR6oQu19j7KTQa7jzARiY9OBRh/IaWFiB1fjQ/9slRIp
 ckSK7WFJ3bQ9MeBYra54apz/RQfdKBNnPx7AWM9mnF7JsohP9wl9sZBvwps4fmcjVBFUySoTtBO
 vhV0LLnMKP6bd5VzDBuElXBzacMFXsl8jv4/qcutlXJT2aEp+a4WNuOxNfZC7
X-Received: by 2002:a5d:584e:0:b0:236:6f0f:9d8 with SMTP id
 i14-20020a5d584e000000b002366f0f09d8mr7950938wrf.701.1667220820379; 
 Mon, 31 Oct 2022 05:53:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pKoZf9VD2l4YW7yOPu6FxBwzSWx8xJCRtc5UC3sfQ7rWQpv096wJqkOaQIXNn/YKX6o01oA==
X-Received: by 2002:a5d:584e:0:b0:236:6f0f:9d8 with SMTP id
 i14-20020a5d584e000000b002366f0f09d8mr7950920wrf.701.1667220820121; 
 Mon, 31 Oct 2022 05:53:40 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 b20-20020a05600c151400b003b3307fb98fsm6992770wmg.24.2022.10.31.05.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:39 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 62/86] tests: acpi: pc/q35 whitelist DSDT before \_GPE cleanup
Message-ID: <20221031124928.128475-63-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


