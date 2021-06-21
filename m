Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A426E3AE6D4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:13:54 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGwD-0007eD-L0
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGig-0007nV-CZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGic-00076P-9x
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fygHjwvHtRb2tKPf5A+pqEVvHlYibsKXFFZ+TQWCjxY=;
 b=QiwSTPcj5VR+NQjVMM7O2KBjSnPUo6G/0ltTRxYNUCsWQnddt2mQ/n6/jzDYFB+NaJ/Mq7
 k4dr+5il28KlnMqFmJPqir5wZpMgltXO7BO4jsHvV2KZdzShxfjfic2EwEYnFSnSf7vUJ2
 ic+45XllbysmBVRkiwHoHRnUTMe7rTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-G98IDyP7MgW9_McAgR1iKA-1; Mon, 21 Jun 2021 05:59:46 -0400
X-MC-Unique: G98IDyP7MgW9_McAgR1iKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CCEC100CEC3;
 Mon, 21 Jun 2021 09:59:45 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC4035D740;
 Mon, 21 Jun 2021 09:59:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 25/37] linux-user: elf: s390x: Prepare for Vector enhancements
 facility
Date: Mon, 21 Jun 2021 11:58:30 +0200
Message-Id: <20210621095842.335162-26-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's check for S390_FEAT_VECTOR_ENH and set HWCAP_S390_VXRS_EXT
accordingly. Add all missing HWCAP defined in upstream Linux.

Cc: Laurent Vivier <laurent@vivier.eu>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-25-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 include/elf.h        | 7 +++++++
 linux-user/elfload.c | 1 +
 2 files changed, 8 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 033bcc957671..811bf4a1cb5c 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -605,6 +605,13 @@ typedef struct {
 #define HWCAP_S390_HIGH_GPRS    512
 #define HWCAP_S390_TE           1024
 #define HWCAP_S390_VXRS         2048
+#define HWCAP_S390_VXRS_BCD     4096
+#define HWCAP_S390_VXRS_EXT     8192
+#define HWCAP_S390_GS           16384
+#define HWCAP_S390_VXRS_EXT2    32768
+#define HWCAP_S390_VXRS_PDE     65536
+#define HWCAP_S390_SORT         131072
+#define HWCAP_S390_DFLT         262144
 
 /* M68K specific definitions. */
 /* We use the top 24 bits to encode information about the
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17ab06f612dd..4b0172339eff 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1376,6 +1376,7 @@ static uint32_t get_elf_hwcap(void)
         hwcap |= HWCAP_S390_ETF3EH;
     }
     GET_FEATURE(S390_FEAT_VECTOR, HWCAP_S390_VXRS);
+    GET_FEATURE(S390_FEAT_VECTOR_ENH, HWCAP_S390_VXRS_EXT);
 
     return hwcap;
 }
-- 
2.31.1


