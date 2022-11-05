Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722B61DC63
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqg-0000eC-CB; Sat, 05 Nov 2022 13:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMny-0007DJ-Up
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnx-0007b6-D5
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=EKbNQdvR6AYLDNKKPdcgfnd/jiqGSADSvHJGdsq1Fn8k/oaOqlYTjLlhzLz67AL9Sl46VM
 1wFLHPHiwNLHTScHzXg8N33j9oGbi7IpQ7z0tDaNjY2HVOmTa9klSqJU0KLK6qVw+vuoBt
 ZiGywXEUafEISJB0nz6cXwEq6XSApfw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-mti9rCM-PiigtN02DrXApw-1; Sat, 05 Nov 2022 13:17:56 -0400
X-MC-Unique: mti9rCM-PiigtN02DrXApw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so1874793wrg.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=jR14z2UoD0rtZLlKxQ0wgekhMV2L8etSFzlRm5PiWweyl78pz7vZ7eTmf+1CYkIjDz
 2E/40CWd00+cEHeJH1i5AiWF9iJA/Tmf6i9IdbGVpg+C1tspznDXwSHohcmno2hnFnts
 NzcQlMe6JADi9zh1HTViLnypLeaP3SaICrO7y5KIfDIjXdY+P5buFOtiU0Bss+gKfjnY
 evEN9hP2r1xm6JlnS/0zfJU9KFvuHxTiU+xbJaQjNVGa8aebby9dEsWq8x/TCB57VrC3
 QyYPZPrkIiva363zc8AXpwt5UaPLQt7FeXzXB28Bkxj4ILW63apaZ3HC2S7twZq2ANU9
 XNCw==
X-Gm-Message-State: ACrzQf2larI2uX3Li7vQrxe5TturaEnVvevKVAsOYak1aKEUi889jiLK
 GyZ5WVc1nHy+sTfQNOr67e1q0L74ej5rWOTRq1n0erRrM/cr/OGvBXLMZK/j1humTqeKbvhsq/q
 p32lNqipaHgipQZ+k9cOFUGNhG8nMw7ZLFSGw8hE+8g58y9zioAmcg16j+ldd
X-Received: by 2002:a5d:4f05:0:b0:236:a65e:3762 with SMTP id
 c5-20020a5d4f05000000b00236a65e3762mr25196892wru.156.1667668675596; 
 Sat, 05 Nov 2022 10:17:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DlINZvtSYcAJ3kt/V1mwB6C1UhwcTfifD2h99CP1nWzzHxQVMncD5vz9wZknbNwKWknNiUg==
X-Received: by 2002:a5d:4f05:0:b0:236:a65e:3762 with SMTP id
 c5-20020a5d4f05000000b00236a65e3762mr25196881wru.156.1667668675236; 
 Sat, 05 Nov 2022 10:17:55 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000114200b00236860e7e9esm2526746wrx.98.2022.11.05.10.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:54 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 50/81] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221105171116.432921-51-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..570b17478e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,35 @@
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


