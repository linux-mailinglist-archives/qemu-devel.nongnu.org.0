Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817E493722
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:22:34 +0100 (CET)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Am-0003hj-SF
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6OL-0006U0-3q
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6OI-0004ep-Ji
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IspAsj8viqjov9r9Wz0WvaHsOhWwgCENretjvZS6kzE=;
 b=PC1UWyBG+i2EHKVqXeBJankDJpvKhZRgERhSJoWgzu48lreElogM7EfOBEgMju4UouUxVl
 61vOH9trekLt+bNJW2xslkxwezJNt8iWcLJlqhBPOHNaaKoNsPGCVRj4YQFjFVd8bum7Ny
 UpEDBtM7NNy50aDZ39kZYLyAUkTVL94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-7XYSfhprON-F1hq8Dlf68Q-1; Wed, 19 Jan 2022 03:32:24 -0500
X-MC-Unique: 7XYSfhprON-F1hq8Dlf68Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972031966320;
 Wed, 19 Jan 2022 08:32:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 347E64F858;
 Wed, 19 Jan 2022 08:32:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] s390x/css: fix PMCW invalid mask
Date: Wed, 19 Jan 2022 09:32:06 +0100
Message-Id: <20220119083215.120911-2-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Nico Boehr <nrb@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nico Boehr <nrb@linux.ibm.com>

Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
1, 6 and 7 need to be zero.

As both PMCW_FLAGS_MASK_INVALID and ioinst_schib_valid() are only used
by ioinst_handle_msch(), adjust the mask accordingly.

Fixes: db1c8f53bfb1 ("s390: Channel I/O basic definitions.")
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20211216131657.1057978-1-nrb@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/ioinst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
index 3771fff9d4..ea8d0f2444 100644
--- a/include/hw/s390x/ioinst.h
+++ b/include/hw/s390x/ioinst.h
@@ -107,7 +107,7 @@ QEMU_BUILD_BUG_MSG(sizeof(PMCW) != 28, "size of PMCW is wrong");
 #define PMCW_FLAGS_MASK_MP 0x0004
 #define PMCW_FLAGS_MASK_TF 0x0002
 #define PMCW_FLAGS_MASK_DNV 0x0001
-#define PMCW_FLAGS_MASK_INVALID 0x0700
+#define PMCW_FLAGS_MASK_INVALID 0xc300
 
 #define PMCW_CHARS_MASK_ST 0x00e00000
 #define PMCW_CHARS_MASK_MBFC 0x00000004
-- 
2.27.0


