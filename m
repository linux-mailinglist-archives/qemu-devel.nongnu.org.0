Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35B333FBC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:57:03 +0100 (CET)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzKg-0003zM-Jt
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGO-0001L6-NA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGM-00044r-8u
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615384353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whWKpVu8xA+DzrGadbo1O+7eDzqdpgVKg8TpF66ONXc=;
 b=EkH0cw4dKqV6eO/ZEjxBcOIed/oDmIl5sEtgWpPveVovG6LfIrNDCCvJT8MTrn9vwmxmJE
 K6vjCNNtVJ2Qd5NVFOKqw3Y/VLEmpwp5GZkuTUsJvLSSIuj5+iwb3tQqTUKoyFY9R/xIQx
 tKjg5CXqMJunH7kV1+Ei/RAB3R83VeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-abI9GVubNPKLIklaFFgguA-1; Wed, 10 Mar 2021 08:52:31 -0500
X-MC-Unique: abI9GVubNPKLIklaFFgguA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5399A57;
 Wed, 10 Mar 2021 13:52:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4762F60C13;
 Wed, 10 Mar 2021 13:52:25 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] accel: kvm: Fix kvm_type invocation
Date: Wed, 10 Mar 2021 14:52:17 +0100
Message-Id: <20210310135218.255205-2-drjones@redhat.com>
In-Reply-To: <20210310135218.255205-1-drjones@redhat.com>
References: <20210310135218.255205-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, maz@kernel.org, eric.auger@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to commit f2ce39b4f067 a MachineClass kvm_type method
only needed to be registered to ensure it would be executed.
With commit f2ce39b4f067 a kvm-type machine property must also
be specified. hw/arm/virt relies on the kvm_type method to pass
its selected IPA limit to KVM, but this is not exposed as a
machine property. Restore the previous functionality of invoking
kvm_type when it's present.

Fixes: f2ce39b4f067 ("vl: make qemu_get_machine_opts static")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 accel/kvm/kvm-all.c | 2 ++
 include/hw/boards.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f88a52393fe0..37b0a1861e72 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2068,6 +2068,8 @@ static int kvm_init(MachineState *ms)
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
+    } else if (mc->kvm_type) {
+        type = mc->kvm_type(ms, NULL);
     }
 
     do {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a6a..327949967609 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -128,6 +128,7 @@ typedef struct {
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities.
+ *    kvm-type may be NULL if it is not needed.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
-- 
2.26.2


