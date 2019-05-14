Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3791CEAE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQbsi-0007qZ-3R
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:10:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQblu-00036b-1N
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQblt-0002d6-5V
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hQblt-0002ca-07; Tue, 14 May 2019 14:03:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BC77308425B;
	Tue, 14 May 2019 18:03:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 532B412A6F;
	Tue, 14 May 2019 18:03:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 073331138407; Tue, 14 May 2019 20:03:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 20:03:10 +0200
Message-Id: <20190514180311.16028-6-armbru@redhat.com>
In-Reply-To: <20190514180311.16028-1-armbru@redhat.com>
References: <20190514180311.16028-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 14 May 2019 18:03:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 5/6] pc-bios/s390-ccw: Clean up harmless
 misuse of isdigit()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, thuth@redhat.com,
	Cornelia Huck <cohuck@redhat.com>, philmd@redhat.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

atoui() and get_index() pass char values to isdigit().  With a
standard isdigit(), we'd get undefined behavior when the value is
negative.  Can't happen as char is unsigned on s390x.  Even if it
could, we're actually using isdigit() from pc-bios/s390-ccw/libc.h
here, which works fine for negative values.  Clean up anyway, just
to avoid setting a bad example.

Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 pc-bios/s390-ccw/libc.c | 2 +-
 pc-bios/s390-ccw/menu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/s390-ccw/libc.c b/pc-bios/s390-ccw/libc.c
index a786566c4c..3187923950 100644
--- a/pc-bios/s390-ccw/libc.c
+++ b/pc-bios/s390-ccw/libc.c
@@ -38,7 +38,7 @@ uint64_t atoui(const char *str)
     }
 
     while (*str) {
-        if (!isdigit(*str)) {
+        if (!isdigit(*(unsigned char *)str)) {
             break;
         }
         val = val * 10 + *str - '0';
diff --git a/pc-bios/s390-ccw/menu.c b/pc-bios/s390-ccw/menu.c
index 82a4ae6315..ce3815b201 100644
--- a/pc-bios/s390-ccw/menu.c
+++ b/pc-bios/s390-ccw/menu.c
@@ -134,7 +134,7 @@ static int get_index(void)
 
     /* Check for erroneous input */
     for (i = 0; i < len; i++) {
-        if (!isdigit(buf[i])) {
+        if (!isdigit((unsigned char)buf[i])) {
             return -1;
         }
     }
-- 
2.17.2


