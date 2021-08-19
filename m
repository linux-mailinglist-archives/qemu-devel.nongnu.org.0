Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B33F20BC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:39:47 +0200 (CEST)
Received: from localhost ([::1]:49114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGntC-0003Hi-OJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnre-0000rV-Ip
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrc-00006l-Rv
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629401888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2epPQk89Uaq3BOgv3vn1lPln1C/SGK69zkTXhPfkd4=;
 b=C8vbsXf/kyf4fpa8JpaJum3jVivkfEvaNLYqfe1eaVNgD8EjM3DOK7cops+0fV8FZ0TDY2
 zwD088jG5ZyjI0HRHn4j83HZyyITTvaFle1XEo8T2TtxPRloSH65WPTmJAhNnZci/4TWs8
 AuQC/bzCTpBX/hQOrVd3JOF4pg+H3xM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-ruRE2T0nOiKqJMmkRYYbtA-1; Thu, 19 Aug 2021 15:38:06 -0400
X-MC-Unique: ruRE2T0nOiKqJMmkRYYbtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F3F55F9D7;
 Thu, 19 Aug 2021 19:38:05 +0000 (UTC)
Received: from gator.home (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB9F1970F;
 Thu, 19 Aug 2021 19:38:03 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/4] target/arm/kvm64: Ensure sve vls map is completely clear
Date: Thu, 19 Aug 2021 21:37:56 +0200
Message-Id: <20210819193758.149660-3-drjones@redhat.com>
In-Reply-To: <20210819193758.149660-1-drjones@redhat.com>
References: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bitmap_clear() only clears the given range. While the given
range should be sufficient in this case we might as well be
100% sure all bits are zeroed by using bitmap_zero().

Signed-off-by: Andrew Jones <drjones@redhat.com>
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


