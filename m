Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AF37CE5B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:19:05 +0200 (CEST)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsVk-0007J0-Fr
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSy-0004QS-QM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSs-0007WM-6d
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620839764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2sxjCGp9LZMRIb4wXnVyf6rBHHXIZCOLyxuWDQcf1o=;
 b=M2Nli2vySGg0POTKoAnm8gVHH+pYwOfvbvIhxxJMHQVT/J8UoYQTMoSS2QjmwLvUvYqCJ2
 2Ss8FEhJqo+oxx/Y8KZ39kDwSL8I8yypAwBeFWDQbAdd9+XBkdcoseBhdn+xnTaRoKNV7l
 vNtYOOUcusZcBmjBSg1W2dfbBg1F090=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-pgsqxgImMGmfkS1Wb_cKtw-1; Wed, 12 May 2021 13:16:02 -0400
X-MC-Unique: pgsqxgImMGmfkS1Wb_cKtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8624107ACCD;
 Wed, 12 May 2021 17:16:00 +0000 (UTC)
Received: from thuth.com (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0624D61094;
 Wed, 12 May 2021 17:15:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 3/3] pc-bios/s390-ccw: Add a proper prototype for main()
Date: Wed, 12 May 2021 19:15:50 +0200
Message-Id: <20210512171550.476130-4-thuth@redhat.com>
In-Reply-To: <20210512171550.476130-1-thuth@redhat.com>
References: <20210512171550.476130-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Older versions of Clang complain if there is no prototype for main().
Add one, and while we're at it, make sure that we use the same type
for main.c and netmain.c - since the return value does not matter,
declare the return type of main() as "void".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/main.c     | 3 +--
 pc-bios/s390-ccw/s390-ccw.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index 5d2b7ba94d..835341457d 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -281,7 +281,7 @@ static void probe_boot_device(void)
     sclp_print("Could not find a suitable boot device (none specified)\n");
 }
 
-int main(void)
+void main(void)
 {
     sclp_setup();
     css_setup();
@@ -294,5 +294,4 @@ int main(void)
     }
 
     panic("Failed to load OS from hard disk\n");
-    return 0; /* make compiler happy */
 }
diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
index 79db69ff54..b88e0550ab 100644
--- a/pc-bios/s390-ccw/s390-ccw.h
+++ b/pc-bios/s390-ccw/s390-ccw.h
@@ -57,6 +57,7 @@ void write_subsystem_identification(void);
 void write_iplb_location(void);
 extern char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
 unsigned int get_loadparm_index(void);
+void main(void);
 
 /* sclp.c */
 void sclp_print(const char *string);
-- 
2.27.0


