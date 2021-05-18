Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D438827E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:58:27 +0200 (CEST)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7jO-0001b2-AM
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hX-0007HJ-Vy
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hM-0003HP-Uy
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HR1VL7xO46nG3TW0eDU8ydyDYyyww2jJCBLbd9ZBTCg=;
 b=TTeu+99QYKPij5fe2y7uzY7RfiBEwir3a32rmmogNqcZizJoLxiEH1T0lKKX8PNHByv+gj
 FAlUSacSs6MyfGbPMOvHCEIGAGau8rxNEsxEvY8EA9C6fFGHyNQJLOneYaJ2KIEcvTjCiO
 NLCVi1d/sLxqri/1We4gNbM3ytmRvNY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-cQCM4B3zPea80RwDmZ9xdA-1; Tue, 18 May 2021 17:56:17 -0400
X-MC-Unique: cQCM4B3zPea80RwDmZ9xdA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy15-20020a0564021c8fb029038d26976787so5062626edb.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HR1VL7xO46nG3TW0eDU8ydyDYyyww2jJCBLbd9ZBTCg=;
 b=fYOwUzByhStt2rrzMyDkJk2Hb6eQznRuTepVNaK68fEDauamJEKoezK4sFMVT5Vkg8
 flK3M0K+AuaLHWDN2vOgDO0QBziQhh/HSey19NbjYX0RJO/AgcH1zLyoUAbrV8obqykO
 BmSsRR1PQCmVCflCSA+HsLglDq8rTq661s756XiRTuMT4A1DnnLk8fWLB9mXkZUJIEZt
 brAkv7AoUnkegSQ22TfKPDnikx+gN/NQWwopgRK9iqCT3e85U/Jh8Thbn8r9BQ0UKwAm
 gto3zvml0BJ/3rIIC121SnIdpt5M13u4cosW2rjJwxhxWWJmi37GqK5u1rbBa8yl4eB8
 klfA==
X-Gm-Message-State: AOAM533TrV13bDnE/VIeH9iuhScquU3rugJRNLArpOW8B0oCDPH9+moC
 /voD18/6fcvrIGp6B7x6GRk2vyX1MVfFenDmY2++g0vGTvoB9GSX3Z92GzffNV00lkieldbQkVr
 Cm+ndeVJA6CCIEy4=
X-Received: by 2002:a05:6402:48f:: with SMTP id
 k15mr9325852edv.262.1621374976273; 
 Tue, 18 May 2021 14:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCSwgJxABwZAVfapYqFe2X4sxUnBxNd9hryF/dFWDfuvAt4BLjCAfg6wKSsr+ykn7jKVwuAA==
X-Received: by 2002:a05:6402:48f:: with SMTP id
 k15mr9325841edv.262.1621374976120; 
 Tue, 18 May 2021 14:56:16 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v8sm7164395ejq.62.2021.05.18.14.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 06/11] hw/ide: Replace isa_get_irq() by isa_bus_get_irq()
Date: Tue, 18 May 2021 23:55:40 +0200
Message-Id: <20210518215545.1793947-7-philmd@redhat.com>
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

Both PIIX/VIA objects inherit PCI_IDE, thus have a pointer to an
ISA bus. Pass this bus argument to isa_bus_get_irq() instead of
calling isa_get_irq() with a NULL device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ide/piix.c | 2 +-
 hw/ide/via.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 3aef9b1e21c..debbc0023dc 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -139,7 +139,7 @@ static void pci_piix_init_ports(PCIIDEState *d) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
         ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                         port_info[i].iobase2);
-        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+        ide_init2(&d->bus[i], isa_bus_get_irq(d->isa_bus, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 654e15edfed..53545aac474 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -106,6 +106,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
 static void via_ide_set_irq(void *opaque, int n, int level)
 {
     PCIDevice *d = PCI_DEVICE(opaque);
+    PCIIDEState *id = PCI_IDE(d);
 
     if (level) {
         d->config[0x70 + n * 8] |= 0x80;
@@ -113,7 +114,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
         d->config[0x70 + n * 8] &= ~0x80;
     }
 
-    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
+    qemu_set_irq(isa_bus_get_irq(id->isa_bus, 14 + n), level);
 }
 
 static void via_ide_reset(DeviceState *dev)
-- 
2.26.3


