Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A322BAAC9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:06:20 +0100 (CET)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg67H-0000X5-TY
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kg665-0008FV-Bh
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kg663-0008HX-Ie
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=37uWbAud8aGxTZxjodN1V2QiMzA9ShEayZnQZRmB8P0=;
 b=NDkuSTwyAd1Kh3Blpk95jWLOZvVB1YUzQUptZoxgD5xiBiV5luKp61ZOux+tK4VF0q8MCD
 Z520CrbXLh7p1MvGJT8GHHo6SpfbTfB1ZLjxj+y6uW4n3YQyGHsKLf/4VIo0S1xdeXyCzo
 GvHrWfZqoTUSSZQ/nANak/TW5ui/Zlc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-1ZRDj5tUNFeusDvhPJUXeg-1; Fri, 20 Nov 2020 08:04:59 -0500
X-MC-Unique: 1ZRDj5tUNFeusDvhPJUXeg-1
Received: by mail-wr1-f70.google.com with SMTP id x16so3376152wrn.9
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=37uWbAud8aGxTZxjodN1V2QiMzA9ShEayZnQZRmB8P0=;
 b=GCbYcb5mad8D+yFNO55Pexe+MiyMp28hB2wywNJhBo3ArMpq3yt707op12IsjJMyi8
 2AgtCHtwsHuqwR/8DiwrSNEYfaCF/x3s2BUoemrWSUigr9cWihEFpFC3zGZvz+dXd79G
 kesGb9Qf8O6HaMB4RL3SV2Vep/KpIoG6zw7l1gJsubq8ss4tui6XyWoz3U27IXK+xeyW
 2DQnLQL/snCOHz/ArhxHRAOgtsxWbplPh47Rk5GGiG8WnpRfn7XVZlG8zCNUEMzr81rP
 YOYTMyceMEx4v9TdxgIeQtik3jgh/N24SBavWjwuMqPd5nfugXgwkjuPMxNAAN2EJ/aD
 I0NA==
X-Gm-Message-State: AOAM531XGVgZaevEqus2aSc97kTgDv27a1wd/8Wp2e8STm44I/dyVnRk
 38TWwKsXztxi4/Vf1JbYfmNoIgAhEB2qmarnf8dnSagR9BEyBnoKU5zv6z8zyK2EZXkT3IDand6
 7kbRZivOadcY7aGoQjb+Q7ExbSRQo6xCUFa/phuqiNPuR20oJagNBBMusbPxZ
X-Received: by 2002:a05:600c:288:: with SMTP id
 8mr9809969wmk.106.1605877497551; 
 Fri, 20 Nov 2020 05:04:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPr9r3ReW9LfeyjwLaNeFcOO2VxiaHE3KRuJKgGI/pv9HZyjoLPbfdsScWORB95HlSN0/oNg==
X-Received: by 2002:a05:600c:288:: with SMTP id
 8mr9809923wmk.106.1605877497248; 
 Fri, 20 Nov 2020 05:04:57 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w17sm4823058wru.82.2020.11.20.05.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 05:04:56 -0800 (PST)
Date: Fri, 20 Nov 2020 08:04:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use qemu_strtoul()
 in set_pci_host_devaddr()"
Message-ID: <20201120130409.956956-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Klaus Herman <kherman@inbox.lv>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
introduced a regression blocking bus addresses > 0x1f or higher.
Legal bus numbers go up to 0xff.

Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
Reported-by: Klaus Herman <kherman@inbox.lv>
Reported-by: Geoffrey McRae <geoff@hostfission.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

checkpatch will complain since it does not like strtoul but
we had it for years so should be ok for 5.2, right?

 hw/core/qdev-properties-system.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b81a4e8d14..9d80a07d26 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -858,7 +858,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
     char *str, *p;
-    const char *e;
+    char *e;
     unsigned long val;
     unsigned long dom = 0, bus = 0;
     unsigned int slot = 0, func = 0;
@@ -873,23 +873,23 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     }
 
     p = str;
-    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
-        goto inval;
-    }
-    if (*e != ':') {
+    val = strtoul(p, &e, 16);
+    if (e == p || *e != ':') {
         goto inval;
     }
     bus = val;
 
-    p = (char *)e + 1;
-    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
+    p = e + 1;
+    val = strtoul(p, &e, 16);
+    if (e == p) {
         goto inval;
     }
     if (*e == ':') {
         dom = bus;
         bus = val;
-        p = (char *)e + 1;
-        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
+        p = e + 1;
+        val = strtoul(p, &e, 16);
+        if (e == p) {
             goto inval;
         }
     }
@@ -898,13 +898,14 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     if (*e != '.') {
         goto inval;
     }
-    p = (char *)e + 1;
-    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
+    p = e + 1;
+    val = strtoul(p, &e, 10);
+    if (e == p) {
         goto inval;
     }
     func = val;
 
-    if (bus > 0xff) {
+    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
         goto inval;
     }
 
-- 
MST


