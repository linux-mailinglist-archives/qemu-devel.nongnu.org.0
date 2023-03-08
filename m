Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE16AFC32
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:21:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMl-00005b-8r; Tue, 07 Mar 2023 20:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMi-0008OG-P9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMg-0001kG-Qt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RMd8rd20zEEZ4sK5kfD9/Q46KHVDJ80++rBVhjvB3LE=;
 b=YPhqj2ocoI1R0oJIWYSl1CKeM1B/VF73nZ5A9wbY1sTXXx+JExdQnmJJHUUKRbrNzbN68W
 Vf3ETTSaG1BsNFi969M5oWbPD9g0RQDBGJjcay19IQ5DFRIKu8OqDzA1iGwYOFudnG5bWV
 l+EsOjksDqtSsZuGx0JwGneVg8dkn1c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-lIJTIUoLPIO2oLyJkUgjrQ-1; Tue, 07 Mar 2023 20:13:09 -0500
X-MC-Unique: lIJTIUoLPIO2oLyJkUgjrQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so18101424edc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237987;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMd8rd20zEEZ4sK5kfD9/Q46KHVDJ80++rBVhjvB3LE=;
 b=CBZe0YoUY4jx7R1Y1iwx+9EKR7JtoDtx+vaqdrbkgDCZgu7ByVdt9X9fUf/b5MUbvo
 j61opWXd10xMylQturmRRiqgKJD+T4XOxZiLbUkg2XKOcp9/BHXg012V3Ey3eRCcHa3Z
 j8hZbXFlf1xoJfNO5psAnRpVCbVB4ZRt+ave3KlOUU+h01HzcsFr0CElog5IMF75HhPY
 irUyphv0LQ/fwpnT7FYcFl09dK4WgYU+fJnpyVMH8aTu00yJOku2w0hNiuiqi9/gLguM
 2n5bj8RnwlkRJMUEn7hMIyV6IxgohOb4RnCHNe5DOtxmbSFI9EFaY3HxIOPtrRSpPxMY
 rPHg==
X-Gm-Message-State: AO0yUKVSLngZUFrFhdM2RQyOAujAV5llk8GlurKknI1gecUs6rdSyJer
 rWiLiSAxRGiu0iRxeSsPuYFFjFS8g4QpUBFi3mS6AK1comDSsFtkuGccGpo1adJ00cKKYnASBg0
 pljuKTVsVsAhJ3S3PdmAXSs3pBBrkaeswmJ9DsXJSYwDIEi1HRD2sDhPHwu/seRCUMTeq
X-Received: by 2002:a17:906:a4b:b0:88a:cbd1:e663 with SMTP id
 x11-20020a1709060a4b00b0088acbd1e663mr14488985ejf.6.1678237987728; 
 Tue, 07 Mar 2023 17:13:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9Apo0pTrN6FaT4NfK4foKxyqn9W9cDyDwQwDmlbSb/XMLwoA0UJrbawiplqh5mHhIeTYS1+Q==
X-Received: by 2002:a17:906:a4b:b0:88a:cbd1:e663 with SMTP id
 x11-20020a1709060a4b00b0088acbd1e663mr14488970ejf.6.1678237987476; 
 Tue, 07 Mar 2023 17:13:07 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 mb3-20020a170906eb0300b008e772c97db6sm6732434ejb.128.2023.03.07.17.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:07 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 45/73] tests: acpi: whitelist DSDT before adding device with
 acpi-index to testcases
Message-ID: <52ad9eb2372245ba5829742fc176f3c8af36f592.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Message-Id: <20230302161543.286002-20-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..70244976c9 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.noacpihp",
-- 
MST


