Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C1377D52
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:42:08 +0200 (CEST)
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0YJ-0007F9-4g
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SJ-0001dI-PI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SG-0003lo-Sh
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620632152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Hqvo+WY3MUa5q507SiS1jOkZQ1tc6z1XQjaNlbeT40=;
 b=KfLtVZeJVf7IoaVfd/yQOSXcgKEV/VzYW3/FO/wKidhWwvDmL5OOB1/o8o5mIWoAkvz9Fa
 5qnSV109mIyfdS7f09wjFxVJIJ4pTpxpnE0AV59FbbYYV8iA8TS2NI4I1nFzdYUt4Zd4BC
 N2K1xGpXw2hW6ZZtaFtV6bUK5ZiyCM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-KKC6EEdRMwCOd_PjqsJEEA-1; Mon, 10 May 2021 03:35:47 -0400
X-MC-Unique: KKC6EEdRMwCOd_PjqsJEEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9850C8BEDA3;
 Mon, 10 May 2021 07:35:46 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2CDFE154;
 Mon, 10 May 2021 07:35:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/9] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow warning
Date: Mon, 10 May 2021 09:35:22 +0200
Message-Id: <20210510073524.85951-8-thuth@redhat.com>
In-Reply-To: <20210510073524.85951-1-thuth@redhat.com>
References: <20210510073524.85951-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When building on Fedora 34 (gcc version 11.0.0 20210210) we get:

  In file included from pc-bios/s390-ccw/main.c:11:
  In function ‘memset’,
      inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
      inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
  pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     28 |         p[i] = c;
        |         ~~~~~^~~

The offending code is:

  memset((char *)S390EP, 0, 6);

where S390EP is a const address:

  #define S390EP 0x10008

The compiler doesn't know how big that pointed area is, so it assume that
its length is zero. This has been reported as BZ#99578 to GCC:
"gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
pointer from integer literal"
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578

As this warning does us more harm than good in the BIOS code (where
lot of direct accesses to low memory are done), silence this warning
for all BIOS objects.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210422145911.2513980-1-philmd@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20210502174836.838816-4-thuth@redhat.com>
[thuth: Use the pre-existing cc-option macro instead of adding a new one]
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index f0fe84c9eb..83fb1afb73 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -30,6 +30,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
 	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
 
 QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
+QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
 QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
 QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
-- 
2.27.0


