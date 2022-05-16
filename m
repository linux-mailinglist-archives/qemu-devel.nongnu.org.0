Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD5C528367
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:39:54 +0200 (CEST)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZ4r-0002EG-CU
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6v-0007WC-TG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6u-0005Q7-CP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHG11zW9ytEGJcq0NxBwMU6ZJLK9QPAgcxuYNK5gE5g=;
 b=VIU9birgsb3ctqA1JxkwCVUfsz1pGmrznqWXdDwbrLPqok3XlThFEBKgUu5zlVK2JH5xRx
 XvO/bylJ73eglyYf6rk94AOF00aII51R/8I1v+63WmIhrN/n2Fp0eZoRlaPadJPbM4NiOw
 M0IKvUKdOBBkPsQIBVKulsh/gILYb0M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-V_AQ7CauPcmCw1zJgg1xQw-1; Mon, 16 May 2022 06:37:54 -0400
X-MC-Unique: V_AQ7CauPcmCw1zJgg1xQw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so5439574wmc.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qHG11zW9ytEGJcq0NxBwMU6ZJLK9QPAgcxuYNK5gE5g=;
 b=S5kVScwaV2b2dOq/IuMZtS0ytjgIL/ORYgPbphCYgPMY/iryD6LXZ3rCSc5CIgY+7f
 GYcwDBkJNhrHdhWjJ4/Ec0wB0oRBSB/rtLXWefDx8dhQuMQGB8IYRUq3PFPTBi8l013f
 DZolD7gNSgJBtNGZuc5hSZtmlzPxy1Qlrt5vor+7SEe4hBByPpi3IaIcsc+Rxd3ZLkwA
 UYCq5aGvypzlr8GFm+2uZjFJtzFYng1p+5wW4ACFJY+PqVQLzCsUi/rpmWvBXhvOOOtX
 62JCwhRB1guqpJ5PzoeOUMp94bL4G2r/YEBtvFUKrMVT8e8E0HNKFQ46J5iaba/P6hbK
 bcCg==
X-Gm-Message-State: AOAM533zlG4jrsSzPWfdU03bgmLnYgNDq7/sx4kfwlo4hlxSih582RSx
 tdBpQl+1n5GCwDcXkC+C16WWoP0jkEuj8Pb2PmG1+z6jzLX7//HzdpRVO4pVmnwgFJujl0b8Exy
 HfZF7zNP4p8NvFcyGQzpCD8Mz7pu6D3bA+jQ/WZt4B8z8DoLepjnrBqvBo++D
X-Received: by 2002:a5d:47c8:0:b0:20c:95c6:23df with SMTP id
 o8-20020a5d47c8000000b0020c95c623dfmr13739460wrc.315.1652697473455; 
 Mon, 16 May 2022 03:37:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEKiVFukfV0y1Sxs3NOPQbGbAHOySZNIPNavHiBLzJTsRAeXR2nwpb/iHvXr91bJsfotTGSA==
X-Received: by 2002:a5d:47c8:0:b0:20c:95c6:23df with SMTP id
 o8-20020a5d47c8000000b0020c95c623dfmr13739436wrc.315.1652697473188; 
 Mon, 16 May 2022 03:37:53 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 g21-20020a1c4e15000000b003942a244ed0sm9827882wmh.21.2022.05.16.03.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:52 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 38/91] tests/acpi: q35: Allow addition of a CXL test.
Message-ID: <20220516095448.507876-39-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


