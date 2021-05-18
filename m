Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EAA38829C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:08:57 +0200 (CEST)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7tY-00072B-Ca
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hl-0007d6-OS
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hg-0003Pr-6Q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2Pvl9I1wj1oCEyIeTI4k6awM4sKJAsI8r1Cgft8c+U=;
 b=D8Egmf1D0wk0nHM/dXalaIy7jvXZxMaSwXC3DrVSUniHDH7S0uysUGTe7/NckzCEbMUlO2
 tyBfrzd76GUWkvWmyLZm9nckJzs/pl+aYO4K07nhkA/HRltJTmRMU0nPkD3nJSvNfixFdb
 p8X4iVRkddB03tbj8QsBuQC/JVpuk5Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-uVdqeR8vPb601XqUt6zsDg-1; Tue, 18 May 2021 17:56:37 -0400
X-MC-Unique: uVdqeR8vPb601XqUt6zsDg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so6482099edc.15
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2Pvl9I1wj1oCEyIeTI4k6awM4sKJAsI8r1Cgft8c+U=;
 b=Kc71TJyY8DBtVgKKr2akUr5kgEW/decOJmj7eBJJDU8Ib8JuS6SCDylM25zDuxZ1EG
 sAZI/qPyUqLG0CU90clZUXOpG1rStJ5+xGr+51H17v5JWpcA9O1M2JC9JkI4+xfgc6bv
 lGfJzR9vIz5eKdY7qIA4OyMqScgPJC0sIOB4m5l0jRJKa5XYhUV/p6J1kuwvLt1VjImD
 y39nLPAfv9rel4CMXXs2k0IfsUJABR7cRafHcKjpTRIeZaxCBBmcqF+ajCgi6tvqRZF0
 RI2q1R0Voc7QE1fXHseqQr1YFgGmcWwejpFsitayQsFNHSznXhTGpLUNbX1kh7iwxHFx
 +AkA==
X-Gm-Message-State: AOAM533+0yTuQ8wjMWtPD+XdXDclx+yw72I7AmTfaTdLk73jnEtZmtYl
 Jd4VIR+C90cHYeRhWmuxg+tFV9oirnWUS17wQ+z1rKEjDoT1kGOX01+rzNC/WcZ8lKnbw1fQ8vs
 kpvjsEjzvaY9ZYrc=
X-Received: by 2002:a05:6402:2712:: with SMTP id
 y18mr9854282edd.41.1621374995838; 
 Tue, 18 May 2021 14:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxETrQp6NBFg+Rgy6IjkVcEfaW9d6MOii61B2nUbMh7qPkl6u871/KxSkt/ET6Jehxz5LGoGw==
X-Received: by 2002:a05:6402:2712:: with SMTP id
 y18mr9854268edd.41.1621374995672; 
 Tue, 18 May 2021 14:56:35 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a19sm36820edv.80.2021.05.18.14.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 10/11] hw/isa: Remove use of global isa bus
Date: Tue, 18 May 2021 23:55:44 +0200
Message-Id: <20210518215545.1793947-11-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

In the previous commit we removed all call to these functions
passing a NULL ISADevice argument. We can simplify and remove
the use of the global isabus object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/isa/isa-bus.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index c79d7e338b0..a19e3688c28 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -136,6 +136,10 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
     memory_region_add_subregion(isabus->address_space_io, start, io);
     isa_init_ioport(dev, start);
 }
@@ -156,6 +160,11 @@ void isa_register_portio_list(ISADevice *dev,
                               const MemoryRegionPortio *pio_start,
                               void *opaque, const char *name)
 {
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
+
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
@@ -302,18 +311,20 @@ static char *isabus_get_fw_dev_path(DeviceState *dev)
 
 MemoryRegion *isa_address_space(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space;
-    }
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
 
     return isabus->address_space;
 }
 
 MemoryRegion *isa_address_space_io(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space_io;
-    }
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
 
     return isabus->address_space_io;
 }
-- 
2.26.3


