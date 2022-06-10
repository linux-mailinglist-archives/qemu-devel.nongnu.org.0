Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81A5460C2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:04:20 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaZ1-00043f-6W
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXH-0000aa-83
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXF-0006Jb-M9
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1crx0vve3way+UwYuSFBl+pY/N1VbYbCvLxJyL9VgE=;
 b=Y71UBDH/LhPpUqSf6xxHPDgHmcHJH4UoqxV/BnOrfHctJZAMUPsmbxLHs07ocqnPPYVEug
 j2/5IzYq61HRUzUHLb9qqHwKdmvEk4DIyhSKI9IGgyQVq16B3qN0bBz+9OOwnYVwBdNPfZ
 cT6U8qKxmHbOirnE62eVQyn7tPLnlZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-Nk7BxkK8OdaM9SPATUsv_A-1; Fri, 10 Jun 2022 03:58:23 -0400
X-MC-Unique: Nk7BxkK8OdaM9SPATUsv_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 p18-20020a05600c23d200b0039c40c05687so6230356wmb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/1crx0vve3way+UwYuSFBl+pY/N1VbYbCvLxJyL9VgE=;
 b=EPc5+K9FfuoQqFuyxvzCLmRUmOwr0lciwZbn7vEuwWfOm9vqqligSOVPClPn3taZkB
 zhT63Ks1cYYuf79Idy15DdMIxIxEPlGpSrNK0hcEnh6Gv32uvYa7kh/JX2PEWi17+9fc
 hDLjfK17/yB1hXAnX1ThEnN/wqKoy6Fip//NcvwfQK1OVUA2Oc6mK9LGTbWPPTWeky6S
 5hb+NdeLOw2+744FuP4dOqEg9LExFza6LBwTKyJxyak4TmGasLQJRPWZERf7BGBreOB7
 ptyvur513wT/w+Fvx1H+hoP09JsqgBJylnTtMT76w6/7ZOGqMFCE0+zkcUAEA4TO+Qym
 HpGA==
X-Gm-Message-State: AOAM531h6jKaCKIbfygdFt2FM66KcOUxcfu23p46eFS0ITqXzWvIXw5z
 o9z4qHQFD3JZV9UlWf62R/CwHq1FDctJdrfscgQ8bfNNDPp0ZU3CUOoAdGyiwNzvH2gHsfrx/Qa
 YjhBhruz0iURDO/FeFRV4kHnoydzBGlZqDEoJFDA6H/ZlpAFC5gKKWctxok6I
X-Received: by 2002:adf:fa8b:0:b0:214:1f4f:5e71 with SMTP id
 h11-20020adffa8b000000b002141f4f5e71mr35309365wrr.149.1654847901986; 
 Fri, 10 Jun 2022 00:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9EvJrXPG9vD73UMX3KOsnjx1wnLAPPNJygAkWvx/RDxqAw+4A4gBThIGXcEfdIUT/aMnkOg==
X-Received: by 2002:adf:fa8b:0:b0:214:1f4f:5e71 with SMTP id
 h11-20020adffa8b000000b002141f4f5e71mr35309333wrr.149.1654847901582; 
 Fri, 10 Jun 2022 00:58:21 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c050700b0039749b01ea7sm2300914wmc.32.2022.06.10.00.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:21 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 26/54] tests: acpi: white-lists expected DSDT.pvpanic-isa blob
Message-ID: <20220610075631.367501-27-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220608135340.3304695-27-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DSDT.pvpanic-isa        | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.pvpanic-isa

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..d5cd7aa4f5 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


