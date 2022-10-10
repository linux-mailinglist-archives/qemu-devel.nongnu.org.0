Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D425FA39E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:49:51 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxqX-0002Dg-VA
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdH-00043r-9L
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwd8-0007Uo-4L
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RqPtGI6BYMsOWdKedgX5Yf7/fys2F2dn200Fm9RGsDY=;
 b=idAq4p9ggdNQQOPYDYCQX90iCsXWhoOthvR50jkn5MQ2zp/qlRhql7qs1nz3qCdDTsBr3h
 c6RaK1OCyHTkGaDAiNaOZYOH/XW8r0aYpmWRlKJCPK5ISBDJNP6lk0FOCpLafcGjQEb900
 2w48+zelzmI7I505ACmiO7u+Fm11/Wc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-a1mSmGW9PfSy2nDl3MHikQ-1; Mon, 10 Oct 2022 13:31:52 -0400
X-MC-Unique: a1mSmGW9PfSy2nDl3MHikQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso7288914wmq.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqPtGI6BYMsOWdKedgX5Yf7/fys2F2dn200Fm9RGsDY=;
 b=VY1gZ9LzS4owUilaqo3543pj0ZjyXXQoUtQAjRd5Oii8fOtP+EahqEbIwClaqfjZXa
 ERBx6NrnniMPmnaof2mitJQCbij42Vn6PoFNXnXVQgmaGX+b4h3zUmJhuN3cPwtLoqXE
 ZDK03LKw7npqFAyLUgs74ITl0UQ3JNml4EQXGx33aqg1eoekZm5AnjxufYm+T4elqlSk
 uJ6MSRNXTlZso7JPZgcXa/JP6dS0UNAd4Fe37i/EhCnpGp3mudWdoxueDiO2GmXIxFTO
 VpsG5Bk1QuTfUE/e9ZBx7mUR0Z51G2ICMp/t8ds9DSjqf3krTW+OApIQYipgj56Py3QW
 LuGg==
X-Gm-Message-State: ACrzQf3VYo7rukUaSzy7AkM/QVZRgZC1ZgUcMy3oeqnPo0wBWpcTJOfy
 +7w7KYJkm00I8sk6+9ITwNFJ+gQLu3s3yKaSURY+A0Zt5cxIDZF5cDj9WKdGtlTYrutmBkKoUM9
 kdJwmZDpwXYLAa9VzOWYvqAjimKbreLg3LAUxZsbB2M6d/OWklN37hjYFbYEQ
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr2863923wrd.336.1665423110799; 
 Mon, 10 Oct 2022 10:31:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4g9K9ZjXSSOaRVgLzBCigGN7c/2he5TVdECoF9JWRS4InvIfwNKPIxl60pu0OJ6phN93toHA==
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr2863903wrd.336.1665423110479; 
 Mon, 10 Oct 2022 10:31:50 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 ay34-20020a05600c1e2200b003b4de550e34sm4602302wmb.40.2022.10.10.10.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:50 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 42/55] tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
Message-ID: <20221010172813.204597-43-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-5-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..452145badd 100644
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
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.nohpet",
-- 
MST


