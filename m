Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57835613736
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIY-00038R-1F; Mon, 31 Oct 2022 08:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIK-0001xt-Pl
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIH-0003Aj-Vt
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WMGHKMTuV3NWmf5zc/IrtRbi4j/EPK5ANMvuhukrkpA=;
 b=ZCjmYbL6SRtyX/Q8EN22ZjbJBF6qskUur3mVBeHMrxZisdpJSczJp9lW6NlF5NpcIoafi5
 wFyq4Js7he/S9EJTAP6DSmbQHB9DOTNy3hTz/fkyBFty/bcP8rHGWAxA+cPPQCElVcoov2
 m6SORcw8l+t9xTM9A1ckIe9fclmjFHQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-wCddflUvMQaHVVz7fu5Ffg-1; Mon, 31 Oct 2022 08:53:31 -0400
X-MC-Unique: wCddflUvMQaHVVz7fu5Ffg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso2571121wmh.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMGHKMTuV3NWmf5zc/IrtRbi4j/EPK5ANMvuhukrkpA=;
 b=w3Vy5uR+9p20XAvitU0cCfbEK9cjle7P7sVE/aaWAJvZVG4y6JGt7clutVN3EiIbmD
 Z8E5k4ozoFXIJDdbdKra787u09829nJ8nMuUPgRRnHRF4C69fu+4mDTQuyZ7XwGHoRsq
 CUkmTbT8VjiAVfnszqHdm3rzc05HSRefv65bms0DZ56KMbLvQ+NnRxLnKmvAxlrL/clX
 AcKN72Zce8aaVlBCV3KyJvKiL3DG50WJRe7AC+gf/rV3Vf9gbJL/YMjnH/ceEI3bUSZ7
 cClvfif3YW++Qu7iiRFYEHriEvzTTfCTgw76o7wp14DyFv6iJPyAhjY/09570gZyRPNS
 OZMQ==
X-Gm-Message-State: ACrzQf3k3oOu+7uXCI52N7Kycehy7bZ5OXYxw2jb62ErSalWF77rEK6Z
 inmxVb/w/UZmzx/158AN+oO5FwmnLo9TQ+9C9wQ9ee5qrI6QMsfbtU4ChmWTEG02SrY/8+0dSDN
 Q43DJe5Xg37hpaDwrgldxB6U5Wj8wTbrfd1uKzJUsEzyoxZZtfT1PwyLV4AvZ
X-Received: by 2002:adf:f58e:0:b0:236:a8b2:373 with SMTP id
 f14-20020adff58e000000b00236a8b20373mr8112297wro.575.1667220809575; 
 Mon, 31 Oct 2022 05:53:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oXKJsCeZwZh+jZ8WBUGMKsKoMEHikJ2/c43UaiR+GZz+E8nmUZPRYGtLZLJNSYMuiU9ShWw==
X-Received: by 2002:adf:f58e:0:b0:236:a8b2:373 with SMTP id
 f14-20020adff58e000000b00236a8b20373mr8112281wro.575.1667220809267; 
 Mon, 31 Oct 2022 05:53:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i11-20020a1c540b000000b003a3442f1229sm7218842wmb.29.2022.10.31.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 58/86] tests: acpi: whitelist DSDT before generating ICH9_SMB
 AML automatically
Message-ID: <20221031124928.128475-59-mst@redhat.com>
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
Message-Id: <20221017102146.2254096-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..fd5852776c 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,22 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


