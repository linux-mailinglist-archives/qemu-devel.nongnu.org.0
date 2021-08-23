Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA63F4E03
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:09:07 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICVV-00021X-KP
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTT-0007i2-03
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTQ-0000Cw-4O
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTxvA1H6X6WGEH/c1mFFnPlMd4K7+50QX0Z8QtbZhp8=;
 b=Dyz3V6Ks11OhoPnYfAwT0nzM6f4aDmC0rwZ+ajj9gkRVkmRGnYXDPjqB+0/Hxok/35GkbV
 vh1yFY2uAheJXzYR7UF+OtHclCtO1Ctro8sXvHzVuB1YMFCcqgE7NxqoP38QfWQpOBIViG
 Kt1rf3PyCVpoiSezA+GU5/MPjAOW0V0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-zpIKNfNmNgSsmY_d2y7kLg-1; Mon, 23 Aug 2021 12:06:53 -0400
X-MC-Unique: zpIKNfNmNgSsmY_d2y7kLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EEB28799EB;
 Mon, 23 Aug 2021 16:06:52 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D249F60C82;
 Mon, 23 Aug 2021 16:06:50 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Mon, 23 Aug 2021 18:06:44 +0200
Message-Id: <20210823160647.34028-2-drjones@redhat.com>
In-Reply-To: <20210823160647.34028-1-drjones@redhat.com>
References: <20210823160647.34028-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow CPUs that support SVE to specify which SVE vector lengths they
support by setting them in this bitmap. Currently only the 'max' and
'host' CPU types supports SVE and 'host' requires KVM which obtains
its supported bitmap from the host. So, we only need to initialize the
bitmap for 'max' with TCG. And, since 'max' should support all SVE
vector lengths we simply fill the bitmap. Future CPU types may have
less trivial maps though.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.h   | 4 ++++
 target/arm/cpu64.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d503..cc645b57421f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1019,9 +1019,13 @@ struct ARMCPU {
      * While processing properties during initialization, corresponding
      * sve_vq_init bits are set for bits in sve_vq_map that have been
      * set by properties.
+     *
+     * Bits set in sve_vq_supported represent valid vector lengths for
+     * the CPU type.
      */
     DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
     DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
+    DECLARE_BITMAP(sve_vq_supported, ARM_MAX_VQ);
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c690318a9b63..eb9318c83b74 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -840,6 +840,8 @@ static void aarch64_max_initfn(Object *obj)
         /* Default to PAUTH on, with the architected algorithm. */
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+
+        bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
     }
 
     aarch64_add_sve_properties(obj);
-- 
2.31.1


