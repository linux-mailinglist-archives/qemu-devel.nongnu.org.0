Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC339DA9D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:06:01 +0200 (CEST)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD4w-0002z8-SL
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD34-0000iQ-Oa
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD33-0004R0-20
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtpuBvUcGUtATUOxWFnm1bVu1Wh+2HlSp2gWln9FVJs=;
 b=a97a19KQPYt2ykQvSNbBoZB3ccDk/zIni1w9/PqVpM8kpN0vRVhYH2SgfW3hUowBkNWhRx
 U+AfPOYXK/lHwPg39lM9X6ZvSZSlCI+VETOgxxDLv6CUx4FSRH46kknMxPK5rd5JacQOzT
 5dUu0GCdz0fJoeme2zQrEbrysr5335o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Utk-zXDjMsihHjm44Flj1Q-1; Mon, 07 Jun 2021 07:03:59 -0400
X-MC-Unique: Utk-zXDjMsihHjm44Flj1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD395501E3;
 Mon,  7 Jun 2021 11:03:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84F4360C17;
 Mon,  7 Jun 2021 11:03:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/26] s390x/tcg: Fix instruction name for VECTOR FP LOAD
 (LENGTHENED|ROUNDED)
Date: Mon,  7 Jun 2021 13:03:14 +0200
Message-Id: <20210607110338.31058-3-david@redhat.com>
In-Reply-To: <20210607110338.31058-1-david@redhat.com>
References: <20210607110338.31058-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use the correct name.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 0bb1886a2e..35a0086a85 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1245,9 +1245,9 @@
     F(0xe7e5, VFD,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
 /* VECTOR LOAD FP INTEGER */
     F(0xe7c7, VFI,     VRR_a, V,   0, 0, 0, 0, vcdg, 0, IF_VEC)
-/* VECTOR LOAD LENGTHENED */
+/* VECTOR FP LOAD LENGTHENED */
     F(0xe7c4, VFLL,    VRR_a, V,   0, 0, 0, 0, vfll, 0, IF_VEC)
-/* VECTOR LOAD ROUNDED */
+/* VECTOR FP LOAD ROUNDED */
     F(0xe7c5, VFLR,    VRR_a, V,   0, 0, 0, 0, vcdg, 0, IF_VEC)
 /* VECTOR FP MULTIPLY */
     F(0xe7e7, VFM,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
-- 
2.31.1


