Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A632A060D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 13:58:26 +0100 (CET)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYTz7-0005ex-7h
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 08:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYTmw-0000uT-Lu
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 08:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYTmu-0000nE-Rr
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 08:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604061948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0O00/al7cwQGWZwwOP6NLGwTcTYmOVWX7BhS/dcA4E=;
 b=FMJe4HzMamcQyAOVX0xvjt6Wq4vQ6dvT74D9MhrJ1xVkKe9ex9Zc98QRhjNztcf1Z7S3pe
 5alu+SwyzJF1PeJpnRqUK5pw13xdSowRcRW0RvDK2Tiv3GbGw1jO1KDEqS7bvos+NBoJSu
 I8O9G1l7RtUIdGzQ0uofSkwmI+VZUKo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-aRqpl91VPpGOWU54nm-07A-1; Fri, 30 Oct 2020 08:45:44 -0400
X-MC-Unique: aRqpl91VPpGOWU54nm-07A-1
Received: by mail-wm1-f69.google.com with SMTP id 13so1212263wmf.0
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 05:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d0O00/al7cwQGWZwwOP6NLGwTcTYmOVWX7BhS/dcA4E=;
 b=o2Zw/zTm31QPReN+yK25e9EgtouhV8tfoFbT0kWmozeii3saPqTqu7pQlTItNG16t3
 o1AiAlTOmZYBzRBkSb4e4afpVKKwie+yWjoZ0yEOopkaZxLbKF90ZRNwwXusAKLSejm/
 1r94p8RAKmlERhMmLbS3SbVW0Mdlf+dAkUqtFjnpHTBTI4wksJisbAZKwYFExEAECRoG
 qOUvvcqKa2wzXVLDzeJV78aceNW7oAV/7nzF/fdGf3DaGyrHKJfK3weOYwAtXFX1VjZe
 JvjwYzdQgMR/r6nXhh2LN746wWdIqNUqP919GDf+ragZtlXlllhz6K8EkWtLkquyWzZA
 +s5w==
X-Gm-Message-State: AOAM530CSrYAZx01dBtbOBizsmOmVREgrNrUm+PO7qnNjezy+FWivSEF
 sc8Tu7wwT/oDXh3yP/TSgHmANCUlBdhGuCjGghfqDpSMY7Y7F8Vubg9FzqUT0MGSnAlbmAI4/wG
 goY98lk1DsgDWeZ0=
X-Received: by 2002:adf:de91:: with SMTP id w17mr2903961wrl.84.1604061941794; 
 Fri, 30 Oct 2020 05:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS1eyLrIV2EGFJ+mVITJxSDEJQ+/befsmFugOUGtNYxicEuDDDD8hlFiybicxx7gTJp+HsKg==
X-Received: by 2002:adf:de91:: with SMTP id w17mr2903940wrl.84.1604061941600; 
 Fri, 30 Oct 2020 05:45:41 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id u202sm4784660wmu.23.2020.10.30.05.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 05:45:40 -0700 (PDT)
Date: Fri, 30 Oct 2020 08:45:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] intel_iommu: Fix two misuse of "0x%u" prints
Message-ID: <20201030124454.854286-16-mst@redhat.com>
References: <20201030124454.854286-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201030124454.854286-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Dave magically found this.  Fix them with "0x%x".

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201019173922.100270-1-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 749eb6ad63..70ac837733 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2665,7 +2665,7 @@ static uint64_t vtd_mem_read(void *opaque, hwaddr addr, unsigned size)
 
     if (addr + size > DMAR_REG_SIZE) {
         error_report_once("%s: MMIO over range: addr=0x%" PRIx64
-                          " size=0x%u", __func__, addr, size);
+                          " size=0x%x", __func__, addr, size);
         return (uint64_t)-1;
     }
 
@@ -2716,7 +2716,7 @@ static void vtd_mem_write(void *opaque, hwaddr addr,
 
     if (addr + size > DMAR_REG_SIZE) {
         error_report_once("%s: MMIO over range: addr=0x%" PRIx64
-                          " size=0x%u", __func__, addr, size);
+                          " size=0x%x", __func__, addr, size);
         return;
     }
 
-- 
MST


