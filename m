Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47B4AA8F2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 14:00:09 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKfg-0000Be-Mu
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 08:00:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSD-0000QV-GU
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:15 -0500
Received: from [2a00:1450:4864:20::434] (port=39771
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKS8-0006GJ-JI
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id v19so1335790wrv.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evtIBXc2XbOQXIQlNH8D77rdUx7zxf/It59jNbA4TBw=;
 b=PuvKiVkkmr3sD5KBpbNH3iM0GFQsYHzWDEAEexSc8M9ASRny4gDPLPeOWlH+VNj9X1
 RZ3wpBkcQwK3q6dfukAEauCkolx+D91UdsPGx0QhqzadUVgHFH8LP6SwlwLebfjMLyyp
 9dLKCGNNAs59jhGqGKD9Q/PyOc2seZ5/cRIU5iqi3wcRcRfIQtt+IhDC0wtBx4G2f55Y
 oHzSJweGKsYr1pjg4OqGtlXKke+4tkvYyNlFTV29MdaMhRPcs8Xdz45fNTgcDyTjMnQ0
 PE3Lh3neD4T5P8B6+0P+hX9NNWlW+S3uNR3WzyxoVIYSC3RZAeBadIbZ2t46i//M3CT4
 XuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=evtIBXc2XbOQXIQlNH8D77rdUx7zxf/It59jNbA4TBw=;
 b=PQsEpoergylKJ74En/Clwul7VPgGaj7sdf+/fxK5djdQYVXBiA41+2NdLueE4UuFGx
 57nuJcA+oNAKASwnE0AqWt0HU1emle6Ao0ijj7AnSb1XrfF2IUSGgm+NsVF+x/12lv1Z
 t60MRUcYkVuaGpXC8apzPOZtAGoZScMQvOOaii1+zPhy5VYUWLWF5QwImUqSubty4kAL
 NAWJfKegKRx/Mzd+DwM/8BrW+soQ50rGCxGvVltlwmkGCWM348AQBRYFUqUr51TJCeiE
 ru8i1c90UOFO1K6xZzK4tYJwk7ahb1er4XhMSe/rshNb9Qo7MVtjL9tqs89DF3Rc+yJ0
 cA9w==
X-Gm-Message-State: AOAM530CDsbm2l1OqLujLBaLvn1q9YapzzGiC+CgT0T4y9+oidcz/YAb
 Rp3ayrvaaWNgap3gAZeOUhBlC/tcDww=
X-Google-Smtp-Source: ABdhPJyfjuohszKFd0FN7LnJzMh1KUYLFVceTnQRhWQZJ41hFrK4najayA1Rxm4souXs12X97J8DnQ==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr3080693wri.337.1644065133640; 
 Sat, 05 Feb 2022 04:45:33 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 t1sm5378265wre.45.2022.02.05.04.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 04:45:33 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 1/4] tests/qtest/acpi: Temporary allow VIOT table changes
Date: Sat,  5 Feb 2022 13:45:23 +0100
Message-Id: <20220205124526.500158-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205124526.500158-1-f4bug@amsat.org>
References: <20220205124526.500158-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

In preparation of changing the VIOT table, add it to the ACPI tests
allowlist.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..27ab8d3ba8d 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/VIOT.viot",
-- 
2.34.1


