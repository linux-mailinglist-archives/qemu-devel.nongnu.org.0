Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686902B5ECB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:03:01 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezhM-0004F6-8t
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kezfz-0003O4-Eg
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kezft-0005dO-RR
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605614489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BcOAMM8T64H99sWBWVknGqExdGrrYQhRqVV+46dbmRs=;
 b=Y7+07mi3FRJDIpAl3weTt/dPqjz13aYUTKUH/fnU+QeMbx3f358dNm2MOMnk4bDdNSW+7E
 VthGvjx766RMUoFkHqOVK4X770kceTPEz1xTJZPgE18HSmA5KEFybt+GL+G8HmFkNICfRa
 A9pB6jz08jeq++wWzJtL4sYJG3zxB2A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-5xuOVrUwO0ifdWkZchd7tA-1; Tue, 17 Nov 2020 07:01:19 -0500
X-MC-Unique: 5xuOVrUwO0ifdWkZchd7tA-1
Received: by mail-wr1-f69.google.com with SMTP id w5so10736817wrm.22
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 04:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BcOAMM8T64H99sWBWVknGqExdGrrYQhRqVV+46dbmRs=;
 b=PgxI0erfYbjKESvJpQC5LA6k4HSrxvAhPUKjTSnl7RMQKn3c5gJsyeQlN1QVTU9LXp
 7bdioJUvttvJjaym0J9j8XKQ+SyU7AQbKurACrLyf2MPfAPStoVxuSghr+mB1l5Au6ut
 Jiikcv3c6cnznWT3n3nXvFDClLtHTVKRVW/kqdjmw6d521/Jqj/gbPcRlyKJwbJZbFQC
 QoOHsFU2VLMCn5ojCJjvTp/ltKtoKZ56DPnbvevBjtCpSqavgZ3XbQDJazHx44637+zU
 sbcA0ILJTxNLqMcuZSjjqLBST518+QNN9XvAsbqrjX1GQii5svPgBVDO/ijzkcyqDXNe
 6Wjw==
X-Gm-Message-State: AOAM530NhHZdBnD0SQTN4akYZ6TM1YdAP8O3ScGR75k+u/upzT5EOInE
 NEo5/qc6vT/GLU4W2XaBAXPYwcUFg8O3iDeOPuI5+iPwaKB8bW74GYbXxkF4m5yOANg16pmBnh3
 38DXfZZKgXHLvKHNPu6Fc4R8xwZlGdWkCqixsu1Ok3neBp5l7U6BGKyuskKeuEVTn
X-Received: by 2002:adf:f24a:: with SMTP id b10mr25326594wrp.352.1605614478382; 
 Tue, 17 Nov 2020 04:01:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWqA5VDMUyiYK1SZxCX8gOJVVgIK0vu6h+j/ehAlmDnj0zhrOmywzsvnw39Q6Ym2Yi2Y+5cA==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr25326537wrp.352.1605614478020; 
 Tue, 17 Nov 2020 04:01:18 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e16sm1532063wmk.5.2020.11.17.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 04:01:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
Date: Tue, 17 Nov 2020 13:01:15 +0100
Message-Id: <20201117120115.1234994-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix an endianness issue reported by Cornelia:

> s390x tcg guest on x86, virtio-pci devices are not detected. The
> relevant feature bits are visible to the guest. Same breakage with
> different guest kernels.
> KVM guests and s390x tcg guests on s390x are fine.

Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
Reported-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because review-only patch, untested
---
 hw/s390x/s390-pci-inst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 58cd041d17f..cfb54b4d8ec 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
         ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
         S390PCIGroup *group;
 
-        group = s390_group_find(reqgrp->g);
+        group = s390_group_find(ldl_p(&reqgrp->g));
         if (!group) {
             /* We do not allow access to unknown groups */
             /* The group must have been obtained with a vfio device */
-- 
2.26.2


