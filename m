Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A9370E45
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:50:20 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGEV-0001Sb-Qh
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldGD2-00008O-4y
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldGD0-0000RR-JW
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619977726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIenFbRhZMpK6YdxR8zf9g5ensesv34yiFjAOFUW3Ko=;
 b=iSG0XhMIUpbeItWEGvby7/yxDJ2zCmhy2Bs8pTwc/hdXG/6g7ktBQlHbr9Vwy63QIT4C0Y
 NMm3Qh6eLT2HI63r7Gma0HbCQqMwwbZX6fYtOqqtQ7GMPWx4lfYYyv9lg+obLs0NXzZHFl
 lwvAl4Vau6huKBEqgbxCFXUPkwgNyUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-0TZ-St5IMuC_-ozLjZ6gCw-1; Sun, 02 May 2021 13:48:42 -0400
X-MC-Unique: 0TZ-St5IMuC_-ozLjZ6gCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C68218397BB;
 Sun,  2 May 2021 17:48:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-16.ams2.redhat.com [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40963189B6;
 Sun,  2 May 2021 17:48:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 1/4] pc-bios/s390-ccw: Silence warning from Clang by marking
 panic() as noreturn
Date: Sun,  2 May 2021 19:48:33 +0200
Message-Id: <20210502174836.838816-2-thuth@redhat.com>
In-Reply-To: <20210502174836.838816-1-thuth@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling the s390-ccw bios with Clang, the compiler emits a warning:

 pc-bios/s390-ccw/main.c:210:5: warning: variable 'found' is used uninitialized
  whenever switch default is taken [-Wsometimes-uninitialized]
     default:
     ^~~~~~~
 pc-bios/s390-ccw/main.c:214:16: note: uninitialized use occurs here
     IPL_assert(found, "Boot device not found\n");
                ^~~~~

It's a false positive, it only happens because Clang is not smart enough
to see that the panic() function in the "default:" case can never return.

Anyway, let's explicitely mark panic() with "noreturn" to shut up the
warning.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/s390-ccw.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
index 6cd92669e9..79db69ff54 100644
--- a/pc-bios/s390-ccw/s390-ccw.h
+++ b/pc-bios/s390-ccw/s390-ccw.h
@@ -89,6 +89,7 @@ bool menu_is_enabled_enum(void);
 
 #define MAX_BOOT_ENTRIES  31
 
+__attribute__ ((__noreturn__))
 static inline void panic(const char *string)
 {
     sclp_print(string);
-- 
2.27.0


