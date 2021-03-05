Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18832EF7E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:59:32 +0100 (CET)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICrT-0008R6-Q3
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnp-00046i-Ay
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnn-0003QX-M5
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFzKoHqZVN58xXzW9REjb7dVMfQ+d82D122kA9U6f7Q=;
 b=Sp+UT/PWaNf6+9k4TkPzL6XMgssqBQcR8eBOTUtiKh5JRguXas5hK/jMoPftrAU570ItE2
 EO6hFecpyyUqjIbIJ4sSqvKa/grFFl4bYg/EEGjr5wUZFu1O6jySxTd7tdP9qzHijetOUE
 yLQrudbQsrqaNJWCmtLOnOw1S+7Qvyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-IMHxHxCWPJK4Qr_q3Yrmzw-1; Fri, 05 Mar 2021 10:55:40 -0500
X-MC-Unique: IMHxHxCWPJK4Qr_q3Yrmzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B0AF1005D45;
 Fri,  5 Mar 2021 15:55:39 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBE576B8DA;
 Fri,  5 Mar 2021 15:55:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/8] vfio-ccw: Do not read region ret_code after write
Date: Fri,  5 Mar 2021 16:55:16 +0100
Message-Id: <20210305155517.1604547-8-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
References: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

A pwrite() call returns the number of bytes written (or -1 on error),
and vfio-ccw compares this number with the size of the region to
determine if an error had occurred or not.

If they are not equal, this is a failure and the errno is used to
determine exactly how things failed. An errno of zero is possible
(though unlikely) in this situation and would be translated to a
successful operation.

If they ARE equal, the ret_code field is read from the region to
determine how to proceed. While the kernel sets the ret_code field
as necessary, the region and thus this field is not "written back"
to the user. So the value can only be what it was initialized to,
which is zero.

So, let's convert an unexpected length with errno of zero to a
return code of -EFAULT, and explicitly set an expected length to
a return code of zero. This will be a little safer and clearer.

Suggested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20210303160739.2179378-1-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ccw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index bc78a0ad7638..b2df708e4b01 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -104,9 +104,9 @@ again:
             goto again;
         }
         error_report("vfio-ccw: write I/O region failed with errno=%d", errno);
-        ret = -errno;
+        ret = errno ? -errno : -EFAULT;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
@@ -192,9 +192,9 @@ again:
             goto again;
         }
         error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
-        ret = -errno;
+        ret = errno ? -errno : -EFAULT;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
@@ -232,9 +232,9 @@ again:
             goto again;
         }
         error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
-        ret = -errno;
+        ret = errno ? -errno : -EFAULT;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
-- 
2.26.2


