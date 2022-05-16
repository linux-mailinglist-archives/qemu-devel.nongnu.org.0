Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A626529283
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:16:29 +0200 (CEST)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi4q-0002vh-IP
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhi1-00070A-S6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhi0-0006Z8-8x
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHG11zW9ytEGJcq0NxBwMU6ZJLK9QPAgcxuYNK5gE5g=;
 b=cpO2Klo7sty/gXtVSPFwAGvFEOJvbLxr4kU3/JdyDD51o9xnEbJI6aTx9sqBc6s4W6y0kk
 WS2C38GN+8lc1mt1gn7066xpgEjDKNjOUhlrDXS0Q3Pd4bCIbaDOzeYgy7OFjWN2jIoZwE
 Dg4w+w3n4EKyY7ip9iAtMC7X2Di+2/0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-v7n8lRuMP66CqvgaZiwqPg-1; Mon, 16 May 2022 16:52:50 -0400
X-MC-Unique: v7n8lRuMP66CqvgaZiwqPg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w5-20020a056402128500b0042aa2647eb6so4043103edv.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qHG11zW9ytEGJcq0NxBwMU6ZJLK9QPAgcxuYNK5gE5g=;
 b=GCtNOvs1QVNLKSERsECVg6pM1O+0RjzLnUC3KlnsnEju0zlM5otbReKiXKFxY+mXR7
 utkYax7qNdzYS9WgYZYq45ISjrgfvrQII++itOXOkgl32O0azROjh+o/mee4y9Vov9zw
 J83QF3pJKzOCd2nMMwdniQqnALsoMkG5PzOwL5MZYqvDbuUWUtiyksHzk7flRkPgIRRi
 Foul3anAE6oL6dZ4LKrJVCgQAPC6M8TK5oiaeAxaG6yYr1kxWCD2oRT8lzgHcsSeSABF
 vD87le34SxP58aMjpFmz/DF+lovupw14BKAYtcqhNMueI9MVugDaawwslQoxJXYhYsCP
 2KYw==
X-Gm-Message-State: AOAM530eMs6VySjoYvVsbotafXYnvGEy5C4TS8fPSNWagKnxYddfUWcz
 Z+R1l8Aja5hJClAzWt7266TSEAG0IZo89cDuSoFhNSmEVCqMEt+j1y0OkL4vVk2H/DvHX+FakOX
 1ZVCkDuvzktCmI4oKpjlPMDavmkIPrhTLu+Y/Y7fk7b+/HHmvAyI9bwrjZwBI
X-Received: by 2002:a17:907:7e92:b0:6f4:c553:c734 with SMTP id
 qb18-20020a1709077e9200b006f4c553c734mr16997639ejc.286.1652734369177; 
 Mon, 16 May 2022 13:52:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU6x1Z7htMQ4ImhvZz23KKTzCwr+gD2qQehvaLXIEYazg1OdozcjRJG4OzKlVtg9Qjpdhncw==
X-Received: by 2002:a17:907:7e92:b0:6f4:c553:c734 with SMTP id
 qb18-20020a1709077e9200b006f4c553c734mr16997623ejc.286.1652734368960; 
 Mon, 16 May 2022 13:52:48 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 zd20-20020a17090698d400b006f3ef214e46sm155413ejb.172.2022.05.16.13.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:48 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 38/86] tests/acpi: q35: Allow addition of a CXL test.
Message-ID: <20220516204913.542894-39-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Add exceptions for the DSDT and the new CEDT tables
specific to a new CXL test in the following patch.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-37-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 tests/data/acpi/q35/CEDT.cxl                | 0
 tests/data/acpi/q35/DSDT.cxl                | 0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/CEDT.cxl
 create mode 100644 tests/data/acpi/q35/DSDT.cxl

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7c7f9fbc44 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/CEDT.cxl",
diff --git a/tests/data/acpi/q35/CEDT.cxl b/tests/data/acpi/q35/CEDT.cxl
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


