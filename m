Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55500681B96
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMaeA-0005vo-70; Mon, 30 Jan 2023 15:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadj-0004mO-Kq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadg-0007Fc-Sj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JjnCufhxxd9comUmhDEOHeCYqljOgt4/fuQgr1F6Ols=;
 b=EvHIDu1u08OCsi0mJEd67r5S8hF2XEPkf1KXwmD8bzJUr+MxxXqKdhXLAvcWnC830HJooA
 grzUjeYi2msFtt+HhHYbGsVOQOdDPwTuqQ72db/+z8nXnwFU/5PFscQTXZsEB+N9ONDfz0
 pMeqFuRrYi2N7ScJw/yKPnmnl6DbqRk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-y-xT7rHiNwGbk6qCLa5liA-1; Mon, 30 Jan 2023 15:20:26 -0500
X-MC-Unique: y-xT7rHiNwGbk6qCLa5liA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so8884128edc.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjnCufhxxd9comUmhDEOHeCYqljOgt4/fuQgr1F6Ols=;
 b=IKc0GWbDHeEYA/tP7o2TFjKcfoRN9D76rPyIeSNQBXyQG2tKco8h7fzjH/7vyAfFHt
 ox+zlN0hRRRjTyrDpL4q9ap9xX60KqbtpUiMg+oh4+x+XVXRrICp0RHmjjKH5cEgdBcs
 Nq04Umua8D0K3gett0cVxS4Jy7II4j1uNoE82ug4qtwr5A/NHDGC7Fu4XOx5lcKwD5Lt
 LRNmmQ7a8o+AkDHN7PT9wzygjcLvoRDPqsnlU9xxzF7dbkIM4l2ujHlvRf14+vSIARDW
 HkNNJo5ok04YNSoalDRhvjolC2Wa6JvPaRgtP38sPNCZ6t9MrjSX9Duc7ytUfj77yARZ
 F9jA==
X-Gm-Message-State: AO0yUKVQpfE5toerxMfqUiU/Zch+4WwgUUveT5kmS2rbbVzcKMVmKSiw
 w8C3sxUASfOEe+baaHmdxansBEfwIigmBGAlm0ev55//fJK2ScPc53GiO+GYbQgsvPFoa61TG5c
 F4uBPoJM9QqxtMLb8FkSVh1L1i8r24xFaOZ9adYEn37G1khBFg6O/8ufEm0PK
X-Received: by 2002:a17:906:3da:b0:887:d0e6:fa24 with SMTP id
 c26-20020a17090603da00b00887d0e6fa24mr6087661eja.76.1675110024766; 
 Mon, 30 Jan 2023 12:20:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8r9XMaaxxU5cv5H/5dLAeyva/g8Cp2lLlDioPS0I+tHSL1PpsNLGpA9CeM17ZRuSLuxaphig==
X-Received: by 2002:a17:906:3da:b0:887:d0e6:fa24 with SMTP id
 c26-20020a17090603da00b00887d0e6fa24mr6087649eja.76.1675110024511; 
 Mon, 30 Jan 2023 12:20:24 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 g13-20020a17090613cd00b00782fbb7f5f7sm7340482ejc.113.2023.01.30.12.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:23 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 30/56] tests: acpi: whitelist DSDT before refactoring acpi
 based PCI hotplug machinery
Message-ID: <20230130201810.11518-31-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Message-Id: <20230112140312.3096331-21-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4be20b2cd1 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,37 @@
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
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/pc/DSDT.hpbridge",
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
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.core-count2",
-- 
MST


