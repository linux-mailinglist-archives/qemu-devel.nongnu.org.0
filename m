Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B496203C2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAvW-00073l-Nt; Mon, 07 Nov 2022 17:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvT-00070Y-VQ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvS-0001ja-50
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=d97TiFUOCzX57xlaA+ojcew8JCvfgpfg7q3r0xJvGjL1t1GdBfbtUdC1Wjxwq5ZB3gIuVt
 CxatxObfzlZ/ay4wmHMSC9skq9rZ0JO9tZjHLbtBlXIHVRoMg3aITyH5LjYVQPBAxKzeR+
 Mq7XovMw9z+5nM3SN2iAxbHPYTFm8E0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-YrozrCwwPS2btBiagQmXoQ-1; Mon, 07 Nov 2022 17:49:04 -0500
X-MC-Unique: YrozrCwwPS2btBiagQmXoQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so1143903qkl.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=xFJpUGPYH7SQxMFgiDL6U1Q7tvXqlqlFhDMvgCQmNZADXeqxLNmuLzuVMjra+N3tE5
 h+IvRr5FSzOuV3i7PfCNogn1UAPb6zvADFQvJkDsNCQabRftnmHks2LOPjgHMRvJwrUA
 +8/76Dx91ZsrC+wgh8H/AD4zwAxg7YeC1X7BePJDM9Oapyrckju68/fx0+0Vys6rHovb
 /vq3IMc7kWbLpKRvU9iCWu9ONmISj4beTLrLSiEKU6PCEPKUJhUfZG3o4auW/wIYPOxc
 g78O9eYYi1QcE1uzJ+DtdxRwN6jIljL+BZikrJ5Gg5gAMXZSXXokEMXwBLdOxBM6YrY5
 38cg==
X-Gm-Message-State: ACrzQf1ntBiPccWj4cqPXdk9YtigXx07YeZ40sxaznJaA9ny+GOb+UWo
 iTRHTyxm8+s4AaKqEirTeW6Be9aFWsHlC8XHX8BFqpwyYO1looY6O5fVxT1ImTNlht43zQb3Q7l
 VIWMkHEhaLEWXDErCDlo7PlN67YuSdiSD+rZrBjgIsx13K55Y1mCMhEVs+gGd
X-Received: by 2002:a05:620a:2a0f:b0:6cf:92d8:2aad with SMTP id
 o15-20020a05620a2a0f00b006cf92d82aadmr37343913qkp.237.1667861343800; 
 Mon, 07 Nov 2022 14:49:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7ALf1LbRLSp8dSxwVQj8qmpysuCaoSyqzAKg8wxDAQDC2qxYEwqbB4CFujgPW5b6zI43svUw==
X-Received: by 2002:a05:620a:2a0f:b0:6cf:92d8:2aad with SMTP id
 o15-20020a05620a2a0f00b006cf92d82aadmr37343898qkp.237.1667861343513; 
 Mon, 07 Nov 2022 14:49:03 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 ga23-20020a05622a591700b00399ad646794sm6971173qtb.41.2022.11.07.14.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:03 -0800 (PST)
Date: Mon, 7 Nov 2022 17:48:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL v4 17/83] tests/acpi: virt: allow acpi MADT and FADT changes
Message-ID: <20221107224600.934080-18-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

From: Miguel Luis <miguel.luis@oracle.com>

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20221011181730.10885-2-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8dc50f7a8a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/FACP",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/APIC",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/APIC.numamem",
-- 
MST


