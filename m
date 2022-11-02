Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F0616731
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIi-00038t-Q2; Wed, 02 Nov 2022 12:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIh-00037V-Gq
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIg-0002O6-3L
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmk3N2TkEM2NEWtSgSN/BkMeJ3tFoPM9dpA0sZODk+E=;
 b=SRqC4+QOfuoVqt/YZKeNkr9mkV6zSi2Po6TjxnarX981pX9L2qcxKjymN2qr2TpB6IZZsp
 6+kNyih96Sj4uT4A/B8MUIsjiuckCFSNk1nSI/41RicEa/xl1KPS3jLUY10NdnEzV1VniK
 DgO1VXTqYg0s/FB4jwRjMN5iIYpV2eY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-btX7UVVWPhambENbpGCEJA-1; Wed, 02 Nov 2022 12:09:08 -0400
X-MC-Unique: btX7UVVWPhambENbpGCEJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso644114wml.7
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmk3N2TkEM2NEWtSgSN/BkMeJ3tFoPM9dpA0sZODk+E=;
 b=toNFMrZlV0euQURBO8oC05zs/2D0Zj5/ZxG7BlMdYs2UQgnjIAJZ4Qj3DYCcAHvkUs
 pAdVugn4zzL5LfTsI7kWvaX/K+lDEWmjX1eq2IYP0SR93Y9/0JGynpdBfuXGIlyD7wC2
 ybzbZaydJIB15S5nuKDdorlgQJ9wRD24XM8z/0cPXx4snFPNJ/Jcfh4BYoIO8NbWxZX6
 6MmYw6iyjq/ii+KXGEISiwVURsEGmThBPOHgCXKh8laukK+JrDfCFZGvSOfx4mvdQN+o
 smvYyjeXhC+NdKi2vcMNRjRt7V2suTrFat7bIJNuBmKdND56Cl3qPKbqDURHUi+5bLge
 C9QQ==
X-Gm-Message-State: ACrzQf12qIFTKMM/JU412xKAUGwu1P2oXeVcpaCV8tApBxwvdzZiWbub
 7ywE6h7R2vcmjYoReFcAqx4SI4aSIY29PCwUTophbQHC8s0/QNND/5tkbQiqcOniD2nubmex4SV
 X3QAKbJ9zS6kcaJx+tKN6rn393qVOAel0ZpxlS8NXKRAH2MRb6YfZipX5jve1
X-Received: by 2002:a5d:4711:0:b0:236:48b6:cb89 with SMTP id
 y17-20020a5d4711000000b0023648b6cb89mr16149375wrq.246.1667405346981; 
 Wed, 02 Nov 2022 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dGR+jAAqOEeiS07AM6ERYtVWCi6ev7s8Rt5e9fQXCKY9AroZKoc3jeKICQAy3lzxOLFUV1A==
X-Received: by 2002:a5d:4711:0:b0:236:48b6:cb89 with SMTP id
 y17-20020a5d4711000000b0023648b6cb89mr16149339wrq.246.1667405346706; 
 Wed, 02 Nov 2022 09:09:06 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 a16-20020a5d5090000000b002206203ed3dsm13139928wrt.29.2022.11.02.09.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:06 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 16/82] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Message-ID: <20221102160336.616599-17-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
and all the related changes including fixes in biosbits software itself. Making
myself as the maintainer for QEMU's biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221021095108.104843-8-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4adf8c65db..07df572adf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1862,6 +1862,13 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+F: docs/devel/acpi-bits.rst
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
MST


