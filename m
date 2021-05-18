Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E571A388298
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:07:16 +0200 (CEST)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7rw-0004Zl-06
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hc-0007QG-9P
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hX-0003Lq-Oa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNOnqYtJWtXTtX74dMfNOzHIoPFRBVKHzI5qhATwsig=;
 b=UYCSM5uR9kfP22PF8RuIEjFVh2uw0yZ6WegAHOYdyyUrJ+MQk8ugDDv+wRlKYmVPqrpBX5
 Sfk2iDa6ZtJ7DW3ZbuKd5otUmt+i3loy/9kKavV0Rbt3/bNr1MTG29Lh/3Uk0oKACeP+v0
 +G+i2GUuXq4aIQmSGp6H3H6VJ2xVtJc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-bxlfndTGMuKR2eNCdBw3iQ-1; Tue, 18 May 2021 17:56:27 -0400
X-MC-Unique: bxlfndTGMuKR2eNCdBw3iQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 u6-20020aa7d0c60000b029038d7337e633so335346edo.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GNOnqYtJWtXTtX74dMfNOzHIoPFRBVKHzI5qhATwsig=;
 b=YDXKilMBgMC7d5DkZQWi3z6pTACbXGiIZ6BRtnG/KJW5LSh6ryfFoQaWX0RDAwYweN
 nQsE+KBoeXspiHzltQazC16xcpk0fRt9XOC0HMruXnEDcEo8MXrD6hCRIqnuSydUr233
 nO4KeqX/9oDKPnm7IH5Or3eHxCP7zphAaE15NqwznkXRJdgUQzEu4CPSXBxZjTCz5/4o
 8eR/YHsUAmJq7PBY14Ik1sgL2LVNE62vAHQ44sXiM2qIL97SjdG31tJmECiv++hs3O5w
 iO0rzAEKHDOqKXqmvx0IYxih/J9CSTsaUW2iIgHJpReQebU050hDSAzLAuVbWYebn2Ri
 2XUQ==
X-Gm-Message-State: AOAM531Z8X6Gg48NyUMp8kJgdUCPE2Rhsw3WGIjZqL8ELcSYjTt3/62Q
 CYzWRasDnZEcXJN+cAgxnvInh6VmzH0CjVELb8ASVrT1ECOICiXOfx2q7noKsGUJ0mJUrXXQMAU
 +cZl4mtOUZFCNRPo=
X-Received: by 2002:aa7:dbcd:: with SMTP id v13mr9329792edt.59.1621374986148; 
 Tue, 18 May 2021 14:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycDQIdlwnflwljCWCxllNAFXAvl5/fabwXWSdRlQnCIMbSqaVwIeFwKRJodiJ7NyxHq/PY2Q==
X-Received: by 2002:aa7:dbcd:: with SMTP id v13mr9329775edt.59.1621374985985; 
 Tue, 18 May 2021 14:56:25 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d7sm10749316ejk.55.2021.05.18.14.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 08/11] hw/isa: Extract bus part from
 isa_register_portio_list()
Date: Tue, 18 May 2021 23:55:42 +0200
Message-Id: <20210518215545.1793947-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518215545.1793947-1-philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_register_portio_list() takes an ISADevice argument mostly
to resolve the ISA bus. Extract the bus logic to a new function:
isa_bus_register_portio_list().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/isa/isa.h |  4 ++++
 hw/isa/isa-bus.c     | 17 +++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index fd8b84d8007..ce31eef8858 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -139,6 +139,10 @@ void isa_register_portio_list(ISADevice *dev,
                               uint16_t start,
                               const MemoryRegionPortio *portio,
                               void *opaque, const char *name);
+void isa_bus_register_portio_list(ISABus *isabus, Object *owner,
+                                  PortioList *piolist, uint16_t start,
+                                  const MemoryRegionPortio *portio,
+                                  void *opaque, const char *name);
 
 static inline ISABus *isa_bus_from_device(ISADevice *d)
 {
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 65a26ac6c2c..c79d7e338b0 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -140,20 +140,29 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
     isa_init_ioport(dev, start);
 }
 
+void isa_bus_register_portio_list(ISABus *isabus, Object *owner,
+                                  PortioList *piolist, uint16_t start,
+                                  const MemoryRegionPortio *portio,
+                                  void *opaque, const char *name)
+{
+    assert(piolist && !piolist->owner);
+
+    portio_list_init(piolist, owner, portio, opaque, name);
+    portio_list_add(piolist, isabus->address_space_io, start);
+}
+
 void isa_register_portio_list(ISADevice *dev,
                               PortioList *piolist, uint16_t start,
                               const MemoryRegionPortio *pio_start,
                               void *opaque, const char *name)
 {
-    assert(piolist && !piolist->owner);
-
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
     isa_init_ioport(dev, start);
 
-    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
-    portio_list_add(piolist, isabus->address_space_io, start);
+    isa_bus_register_portio_list(isabus, OBJECT(dev), piolist, start,
+                                 pio_start, opaque, name);
 }
 
 static void isa_device_init(Object *obj)
-- 
2.26.3


