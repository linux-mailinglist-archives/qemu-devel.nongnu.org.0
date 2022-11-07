Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CC620350
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxv-0003DT-0U; Mon, 07 Nov 2022 17:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxr-00034b-1F
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxp-00043R-GM
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WMGHKMTuV3NWmf5zc/IrtRbi4j/EPK5ANMvuhukrkpA=;
 b=Mv8wHRWANliuyrJnAbgqNidBscwMubtQTU8IshRn8t99uy7b/56MyD+djnK8cf99RGBYtd
 SFz/4s0v2kLtATgTJDesETes+e5Etw3FQPTqNjVAtDr4XT0XdTucDoC0blprTMnkrMnQfH
 b3JfxVG42Z6UbW56dJ+0AnlIj4uB+Jg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-xps_dmNlNyiDeG0ESVGAVA-1; Mon, 07 Nov 2022 17:51:31 -0500
X-MC-Unique: xps_dmNlNyiDeG0ESVGAVA-1
Received: by mail-qk1-f198.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so11293901qko.18
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMGHKMTuV3NWmf5zc/IrtRbi4j/EPK5ANMvuhukrkpA=;
 b=1QuczfT0Tm9BgZioWasxYmQPieYVgp7qfmb73L92s35ZA2tM9JMKu2CtHR3G2NbIpo
 3tp3m8FEsEEZhbjzYcXYGI3JJL8vOxdonMusTKfwrIvfrECqbGh4xVlSKNcDJIWPVh5M
 ZGGQRs1Ks32A6N3DIShSPWCujjrLeagEd1aSZyiHksOvFnvz97aZ4XWemCRIV+hIsFWI
 n9qbOaymtV7ZjTBVMt1ANLgbHDrvd/UhPNC87QCi3suYwjr3s1K5zeBvM4ixjK5kWdQo
 OvrYBp5zNujxUFK86haA1bwjNOhVq7Mhvs/b18qC4TAiT8crwNQDnWzA4aPtzvA2qq50
 tP/Q==
X-Gm-Message-State: ACrzQf2JGLCQCENjhmpOw19eMGx8GSZlNnmAArK2iiPJHN4RXmQ3x4Rq
 J/U8VUcY30oveqPKZN1GHArvQzkn1bsKcRbgHRzd3khYeTu11IViVyhGp9aJ9uPXeSSTwUE/+9h
 snAO5JpZ9lxKjRjF69CIU+LkGwekBLxedKK+HmiFg89iLIRnIvxa0DLmF9fs0
X-Received: by 2002:a05:622a:2615:b0:3a5:2706:3507 with SMTP id
 ci21-20020a05622a261500b003a527063507mr34076368qtb.68.1667861490431; 
 Mon, 07 Nov 2022 14:51:30 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6ogU3i3XsoFRXezNk2NF3nO1W832GvvytgCPVNDXPxovnBrj5dReEv38/PKPYh8lWOf80G4A==
X-Received: by 2002:a05:622a:2615:b0:3a5:2706:3507 with SMTP id
 ci21-20020a05622a261500b003a527063507mr34076343qtb.68.1667861490116; 
 Mon, 07 Nov 2022 14:51:30 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 gd11-20020a05622a5c0b00b00398d83256ddsm6988934qtb.31.2022.11.07.14.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:29 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 48/83] tests: acpi: whitelist DSDT before generating
 ICH9_SMB AML automatically
Message-ID: <20221107224600.934080-49-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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


