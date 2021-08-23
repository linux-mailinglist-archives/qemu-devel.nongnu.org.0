Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEFF3F4E0C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:11:45 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICY4-00075S-Ox
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTT-0007iI-Mx
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTR-0000EJ-S9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK4ROJZ0pGE5cDcdV6LxkQKwph4f2pa5k450CDwBwwE=;
 b=blbFgInbKl8Yh7ZgGThLAMyLK7JGCpejaRC1RzV5a9QTtUIKzjVxhaJMBnjj8aCAwIBVJ3
 d8SDJ8IHnZi4iVwh5IPxMpN9N+kBgsbBvmdCVEFscMNgxoimhZmp2TMU5nK4tYpKhI+ByE
 aqQz2/+wlYhAU89tNky6g79q4aqDzL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-wOBMuMJaNi-g4nDqXGRi6A-1; Mon, 23 Aug 2021 12:06:56 -0400
X-MC-Unique: wOBMuMJaNi-g4nDqXGRi6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020A03E741;
 Mon, 23 Aug 2021 16:06:55 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08F7560CC9;
 Mon, 23 Aug 2021 16:06:52 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/4] target/arm/kvm64: Ensure sve vls map is completely
 clear
Date: Mon, 23 Aug 2021 18:06:45 +0200
Message-Id: <20210823160647.34028-3-drjones@redhat.com>
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

bitmap_clear() only clears the given range. While the given
range should be sufficient in this case we might as well be
100% sure all bits are zeroed by using bitmap_zero().

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/kvm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 59982d470d37..e790d6c9a573 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -740,7 +740,7 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
     uint32_t vq = 0;
     int i, j;
 
-    bitmap_clear(map, 0, ARM_MAX_VQ);
+    bitmap_zero(map, ARM_MAX_VQ);
 
     /*
      * KVM ensures all host CPUs support the same set of vector lengths.
-- 
2.31.1


