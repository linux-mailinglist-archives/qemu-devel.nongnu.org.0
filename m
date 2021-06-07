Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E439DB2D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:23:43 +0200 (CEST)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDM6-0001j0-SE
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4u-0004pP-Lb
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4s-0005mx-Qc
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCJr+msM5GSNVFrtcT2Kjeda+TZvpZ3j4mGc6jFYOt8=;
 b=Av0S0WOt8BUN9C2ULusMfTzv4C1lwzkBroiqJU7xXM5YArlpnumurRibnmzgwtB3VsuoQa
 iN0l9QjyDDRRqdVnGEw8UoaMI/Ke2wqrbRGm8VA5+4D0gFpe/cZWLuL94SYXK+PlXVQRN+
 zHgQ9w3SfFhK0fWjUXUj7aeyHhU4W30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-Yi1dlQZCPIGx-Gz23UpoAw-1; Mon, 07 Jun 2021 07:05:52 -0400
X-MC-Unique: Yi1dlQZCPIGx-Gz23UpoAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 628E0801ADF;
 Mon,  7 Jun 2021 11:05:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 437C260C17;
 Mon,  7 Jun 2021 11:05:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/26] linux-user: elf: s390x: Prepare for Vector
 enhancements facility
Date: Mon,  7 Jun 2021 13:03:36 +0200
Message-Id: <20210607110338.31058-25-david@redhat.com>
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

Let's check for S390_FEAT_VECTOR_ENH and set HWCAP_S390_VXRS_EXT
accordingly.

Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/elf.h        | 1 +
 linux-user/elfload.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 033bcc9576..0049d5a318 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -605,6 +605,7 @@ typedef struct {
 #define HWCAP_S390_HIGH_GPRS    512
 #define HWCAP_S390_TE           1024
 #define HWCAP_S390_VXRS         2048
+#define HWCAP_S390_VXRS_EXT     8192
 
 /* M68K specific definitions. */
 /* We use the top 24 bits to encode information about the
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17ab06f612..4b0172339e 100644
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


