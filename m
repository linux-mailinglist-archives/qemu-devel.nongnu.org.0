Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC893452C2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:06:45 +0100 (CET)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTdE-0003bK-PF
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTX4-00075g-M8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTX2-0001Dv-U2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JvOManbKVW60cRwLAfNSDeNnb3glbQKDFfztyXD6vBs=;
 b=Lt1E3JDszVNtgjY1T7qhtdyRUEVRqR9zHj25kizNVq8SsEBOBy+yyj7W+IDy8f3U2H3r2f
 sGOj5z1wG3X/FcnGDRwwllKMjYpwT0ckUX0021xNa4lPCnZ+sUTRqFPT5foYJ+kFFocSQ9
 i05NQg+pteaQwyj3xHxDwW05ARrFxbM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-vlRgijupOUu90We1j667ZQ-1; Mon, 22 Mar 2021 19:00:17 -0400
X-MC-Unique: vlRgijupOUu90We1j667ZQ-1
Received: by mail-wm1-f70.google.com with SMTP id z26so171954wml.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JvOManbKVW60cRwLAfNSDeNnb3glbQKDFfztyXD6vBs=;
 b=UUMejm5v50mCJkZHpea8p7n1y9OB/nrH3ESirW2RFtV5G6VIxJifZ7P6uDGi9JRN1f
 NG+MjhL/jptpRWZNeTjJMCJgW511jzLhtP3sCz8g5sJL/DfFpR450k8vaNTJcq8ns+wX
 AcuqjJ4Bas+a31Ue/l9Noe+rVFNf1jopneqh82xVx1pj66nAOw/LLGxh2l+/KEfRahiS
 9Z/EiaVBs7IWQEl7HGrBrt5pEO1fyr0jh3rliESZEYDvGvAy6k1dt0uG5h2kuyt7u75U
 hUhmiauE2/KMW5sr0zaO1RACvwPKyp+bv+XpNO82g6uZghF3UGom0MNLA/dBi5rvsw0F
 j5Hw==
X-Gm-Message-State: AOAM53140QzFdK2q1rn1WOowlxbXBzoWC2kxdu5m0d3mX+aoz+rm3y5o
 V5n+PyLkAQF1yZHja3u2JsHwH2SK6UEunchy/Je1TswaTQGYcn8M8qHbG6If0Ifp8+fimM1AKsc
 /ET5U45sDGxDByqKZo/ZWa/SttdEp55HkujDrl8M8y5zg88Qdx/U0wCHoncHG
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr624410wmi.112.1616454015660; 
 Mon, 22 Mar 2021 16:00:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOcSb1zegdbu/19hB4c4541utruv3md93NinRUFM81GH07q2dbx1ggDmAO6Te6J92N0/wcjw==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr624399wmi.112.1616454015402; 
 Mon, 22 Mar 2021 16:00:15 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id k11sm764791wmj.1.2021.03.22.16.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:15 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/19] tests: acpi: temporary whitelist DSDT changes
Message-ID: <20210322225907.541943-10-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210315180102.3008391-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..fddcfc061f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,12 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
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
-- 
MST


