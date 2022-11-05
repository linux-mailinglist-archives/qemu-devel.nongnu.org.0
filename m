Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7C61DC8D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMm3-00066B-6U; Sat, 05 Nov 2022 13:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlp-0005vi-Su
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlj-0007G7-FB
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=BOrWwzn4hym1Lb3dmUcrnKlI5qF1x9EfCPnLZcyfeH6wjBxE6XuZvbAPU8zTndTN8ogXzf
 mW7pGv7kSWkZa+2eMuNr3WtuV8MamJLm2jV7sMkA25OyS0ehpW6xe2va0rBNDdzOhHD7Xj
 7enAX33CP9sArQBM75ZUkq43SByWa7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-gCKMfSVpNQmtpSXnz2OPSQ-1; Sat, 05 Nov 2022 13:15:33 -0400
X-MC-Unique: gCKMfSVpNQmtpSXnz2OPSQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6006916wms.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=ll+GzJQQk22gPYFCT1WJts1l+bZUEX/CDhWX0H8j40I1so3ecNF52BQdizyoMNUSV/
 cUCdSxW1P+VdsDLS0Z3oqKpyCY7xP26u10NjLltvzsJ2YJNKXiTEhtI4QY3NINgWYNON
 nilU+grQhDCMaWPE0NAuiGplrH7/ouX4rDvFSyexLWKG+4qKaI7vsXPfpiE5Jz7vUeBT
 3UnUqAHIImkHI7CSDxa8ODdC34Fip0P03lZZKG0IEkdyAYAvLEyLs2nhFviBEpaaA9+e
 ixv71ENZY616N2T8BCRK9acuew2ItX7jvldS49Nss1x6W2BuLRDlcQuLP9oQ/fgSKSOM
 vbMA==
X-Gm-Message-State: ACrzQf3dI1YcYvVi51O6rgirFOt8YB4gZ5/QryEkX6rWTFPteRJ4wgkc
 855k867XrOe5VkCVdstVq5XnNRfEvPI27bMoVHVpI4qPWy/fIH0IinzScJFeLwwAWm8pL+RPoRF
 NDNBKHttDuyQ3RGFXBHJEXZI3WACE5wYR0zqTZsrEKYQBRHRuMdDhulaJvhyJ
X-Received: by 2002:adf:f1c9:0:b0:236:49ee:8598 with SMTP id
 z9-20020adff1c9000000b0023649ee8598mr25626121wro.481.1667668531916; 
 Sat, 05 Nov 2022 10:15:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4R81Lqe7SA/kLlk3vtJtNNfIwZOPPENNl2AMD3MS/58mgjbTlw0YhyoVw0vX5P9R7md9icQw==
X-Received: by 2002:adf:f1c9:0:b0:236:49ee:8598 with SMTP id
 z9-20020adff1c9000000b0023649ee8598mr25626110wro.481.1667668531698; 
 Sat, 05 Nov 2022 10:15:31 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d46d1000000b0022efc4322a9sm2629907wrs.10.2022.11.05.10.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:15:31 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 02/81] tests/acpi: allow SSDT changes
Message-ID: <20221105171116.432921-3-mst@redhat.com>
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

From: Robert Hoo <robert.hu@linux.intel.com>

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20220922122155.1326543-2-robert.hu@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..eb8bae1407 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/q35/SSDT.dimmpxm",
-- 
MST


