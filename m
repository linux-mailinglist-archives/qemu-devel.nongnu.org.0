Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2612A0F81
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 21:32:00 +0100 (CET)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYb43-0006CX-Dr
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 16:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYauF-0000by-8E
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 16:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYauD-0007ib-N5
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 16:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604089309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jnic1NLVi3yOaelWu2Ae/wYwDuJiLbjp5nCA3Fl1x4=;
 b=M+F6cwqJXA7oDgSYl+Ut09K3y+wa98PaUiz+lICkfipWkUt5MDD9P8k2ig/l1zJR4SvoG2
 LiVbbQQXoHrhbAw4uHd3h6ihSXkRRC37afIK+X2Mewh8ft1i6XEWMvyveuSQWHPEyR127T
 yGBn+Dv4+mBJMGGR0pWXrvpQ7OIShv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-NSLM91z4N6OuFujU9Tn1YQ-1; Fri, 30 Oct 2020 16:21:45 -0400
X-MC-Unique: NSLM91z4N6OuFujU9Tn1YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D6B108597F;
 Fri, 30 Oct 2020 20:21:43 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A55301002C01;
 Fri, 30 Oct 2020 20:21:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] qdev: Stop using error_set_from_qdev_prop_error() for
 css devno property
Date: Fri, 30 Oct 2020 16:21:18 -0400
Message-Id: <20201030202131.796967-8-ehabkost@redhat.com>
In-Reply-To: <20201030202131.796967-1-ehabkost@redhat.com>
References: <20201030202131.796967-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 16:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just setting a reasonable error string using error_setg() is
simpler and makes error messages clearer.

Before:

  $ qemu-system-s390x -device x-terminal3270,devno=x
  qemu-system-s390x: -device x-terminal3270,devno=x: Property 'x-terminal3270.devno' doesn't take value 'x'

After:

  $ qemu-system-s390x -device x-terminal3270,devno=x
  qemu-system-s390x: -device x-terminal3270,devno=x: Property 'x-terminal3270.devno' can't take value 'x': invalid devno

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/s390x/css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index c8e7ce232a..ad631bad29 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2384,7 +2384,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
 
     num = sscanf(str, "%2x.%1x%n.%4x%n", &cssid, &ssid, &n1, &devid, &n2);
     if (num != 3 || (n2 - n1) != 5 || strlen(str) != n2) {
-        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+        error_setg(errp, "invalid devno");
         goto out;
     }
     if ((cssid > MAX_CSSID) || (ssid > MAX_SSID)) {
-- 
2.28.0


