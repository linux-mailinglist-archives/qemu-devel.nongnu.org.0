Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC8422F43
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:33:27 +0200 (CEST)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoJi-0000pm-Ir
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmw6-0002Sz-P2
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmw0-0007gE-73
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWC3XKuAFgu2XB5Lo01m20qnKYTT1H0S1+taYRlAw38=;
 b=RSYaKQUWT4iLCFU+kzqCnYP/BuUBlfISO6I6pHgsYiU4n3Nn/nFC7tiO2zBpkRmMBQqyhK
 VOtezlRow/FitoQc4l+TVSqZ07SzTt4QdTXi02YMqWdOmH0qA+Rrpz6pyG09Lkm4uejEfs
 BkrNwKubqCGuZI9LZ/kt//2hNRrFGM4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-g90h6jhvPvWdijdanyzqHQ-1; Tue, 05 Oct 2021 12:04:49 -0400
X-MC-Unique: g90h6jhvPvWdijdanyzqHQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso5912145wru.11
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AWC3XKuAFgu2XB5Lo01m20qnKYTT1H0S1+taYRlAw38=;
 b=XxxptqSY7rksAOm5c9Lies10vK3vI93jFQMR3sjf5Zme7HYD20qBoSfonLmTlmYyJe
 g6te4FeZPa52TE+4SVf+t+lx1mmVkP5vuqbcwW6hwUKOrBlOVu1a4OIQzka+TckUNMYQ
 q1365ZUhGnudWt3YKtHFQZtDXU3GPqPCig/hDX408DTa5MTmEApePa/jVgvMbd5WdJjw
 VAS6HvT2pW/2T5IXALwTFO3BXss82UOXqsNJBJRo4E+QMuHI+x0UGjJ8HbobCK7yfSNH
 u6HlNj7NGN4AF/gh1mZH9MIMmPbxafccaxkXrD0MVsFZTBXIQwycvxOeE4h0gVBmrugT
 55Sg==
X-Gm-Message-State: AOAM531JpQTNmIQVBADyxBzzoeMkHgIZuW2wt54i/P5NNbjD4B+1fWFK
 aA31JoQXFNxXqyK5o8nulEQbKWrKj/ORWSsFD4kCrNiVMI9hSb6Oz5BRSkLHXDor77Y8UyHLtVE
 lS6RiY/g7KHG6xmus+2VPUSoVsiVt+ruNKdffNOD7j4IHj0njLVWCM5R1C5Ro
X-Received: by 2002:adf:b348:: with SMTP id k8mr21499685wrd.435.1633449887664; 
 Tue, 05 Oct 2021 09:04:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL779pJg6S8zSY/P+AXZWm2EOgp0/uZdVeEkbNfhh8pNw2MQiRB04/Dq7OEmBPMX15juWlrQ==
X-Received: by 2002:adf:b348:: with SMTP id k8mr21499649wrd.435.1633449887465; 
 Tue, 05 Oct 2021 09:04:47 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id d24sm2229044wmb.35.2021.10.05.09.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:46 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 55/57] hw/i386/amd_iommu: Rename amdviPCI TypeInfo
Message-ID: <20211005155946.513818-56-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per 'QEMU Coding Style':

  Naming
  ======
  Variables are lower_case_with_underscores; easy to type and read.

Rename amdviPCI variable as amdvi_pci.

amdviPCI_register_types() register more than PCI types:
TYPE_AMD_IOMMU_DEVICE inherits TYPE_X86_IOMMU_DEVICE which
itself inherits TYPE_SYS_BUS_DEVICE.

Rename it more generically as amdvi_register_types().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210926175648.1649075-2-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 2801dff97c..0c994facde 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1621,7 +1621,7 @@ static const TypeInfo amdvi = {
     .class_init = amdvi_class_init
 };
 
-static const TypeInfo amdviPCI = {
+static const TypeInfo amdvi_pci = {
     .name = TYPE_AMD_IOMMU_PCI,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(AMDVIPCIState),
@@ -1645,11 +1645,11 @@ static const TypeInfo amdvi_iommu_memory_region_info = {
     .class_init = amdvi_iommu_memory_region_class_init,
 };
 
-static void amdviPCI_register_types(void)
+static void amdvi_register_types(void)
 {
-    type_register_static(&amdviPCI);
+    type_register_static(&amdvi_pci);
     type_register_static(&amdvi);
     type_register_static(&amdvi_iommu_memory_region_info);
 }
 
-type_init(amdviPCI_register_types);
+type_init(amdvi_register_types);
-- 
MST


