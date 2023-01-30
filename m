Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2283681B94
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMahM-0001su-GG; Mon, 30 Jan 2023 15:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaf9-0007ZU-2P
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaf2-0007UE-2C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4XNQdhv6ZtyeuNVlIseJKebey1JzlwjNMp41O5jDVk=;
 b=GWz3Z2aaP1Hv54C/+r0MrR7YZnf7zRUwIQinDIXgKjVV1/bRy5MCIRfmyItWFO880eU1Zn
 Gj2YHYKvwxaB2/s+agqtGoaMH0aUo3eeIMQNaEX0r7woJkmTGVj3svSp8AGbr9zHaw8d1h
 6TGzp7SvWYd8Oe6rHPSgMGebAA2HWeM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-29UQ5aIbOxiKsYLHyMunVQ-1; Mon, 30 Jan 2023 15:21:50 -0500
X-MC-Unique: 29UQ5aIbOxiKsYLHyMunVQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 d10-20020a170906640a00b008787d18c373so7037903ejm.17
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4XNQdhv6ZtyeuNVlIseJKebey1JzlwjNMp41O5jDVk=;
 b=XY8ZNU6qhBSiRBVDYhSMTzg7qaFZ7eyHkXL6yXxXpQV7LHmonxJRxnjea38nA1KFqv
 VwPsE9Zs3UWlj7nFKt5tEKfLPianAQrxQEBbTl/M3rK9yTOVRtPRLytkXFvRuujG9CUK
 U2vGsr7oDnjPiaUcyriX+u0BcESDVehNWzrg4lUUrSPP3z+ERiCoVO9zUU32ZmXlbW1Z
 7qFPjJyDZCzcSFI+3BwYZyc88Bz4CFPEQZnyBZmPYSGgNMM6qotGEibmdkg6k+8RCQER
 RhJMCk3F7SXrKGlW/tFSD6SIlnarQQC1vgRV3uUr2U+P5rhGiFAd81VgqtQvPhmCntmj
 J9eA==
X-Gm-Message-State: AO0yUKW7bKln8Pos1uQS9clANcg6snVBSI+SA1+pkKO2nu2AnD4DiUX5
 UgSu7RZTZa+DkAABBYWZNKkng1CsSb1Px0C8sdwWEssdZmTIi+UZRl/TOr/S+P4MdzNfnoOj36A
 CYMHJZ8Hap4wGX2geIKa67ClRZ1ACLjdWAqlaGX5f+kyqUFjjPKbH1iMWp9aG
X-Received: by 2002:a17:906:9bd8:b0:883:ba98:204d with SMTP id
 de24-20020a1709069bd800b00883ba98204dmr9486979ejc.65.1675110108917; 
 Mon, 30 Jan 2023 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8KknPptBk/Adku+r3H8P35498yRd++/yBVUaPkhxXs42uHEHS/LuGONdENi6IJxDlDF1AfVw==
X-Received: by 2002:a17:906:9bd8:b0:883:ba98:204d with SMTP id
 de24-20020a1709069bd800b00883ba98204dmr9486957ejc.65.1675110108689; 
 Mon, 30 Jan 2023 12:21:48 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ce4-20020a170906b24400b0078d3f96d293sm7366835ejb.30.2023.01.30.12.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:48 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 56/56] docs/pcie.txt: Replace ioh3420 with pcie-root-port
Message-ID: <20230130201810.11518-57-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Apfelbaum <marcel@redhat.com>

Do not mention ioh3420 in the "how to" doc.
The device still works and can be used by already
existing setups, but no need to be mentioned.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230123174205.683979-1-berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/pcie.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..df49178311 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -48,8 +48,8 @@ Place only the following kinds of devices directly on the Root Complex:
         strangely when PCI Express devices are integrated
         with the Root Complex.
 
-    (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
-        hierarchies.
+    (2) PCI Express Root Ports (pcie-root-port), for starting exclusively
+        PCI Express hierarchies.
 
     (3) PCI Express to PCI Bridge (pcie-pci-bridge), for starting legacy PCI
         hierarchies.
@@ -70,7 +70,7 @@ Place only the following kinds of devices directly on the Root Complex:
           -device pxb-pcie,id=pcie.1,bus_nr=x[,numa_node=y][,addr=z]
       PCI Express Root Ports and PCI Express to PCI bridges can be
       connected to the pcie.1 bus:
-          -device ioh3420,id=root_port1[,bus=pcie.1][,chassis=x][,slot=y][,addr=z]                                     \
+          -device pcie-root-port,id=root_port1[,bus=pcie.1][,chassis=x][,slot=y][,addr=z] \
           -device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
 
 
@@ -112,14 +112,14 @@ Plug only PCI Express devices into PCI Express Ports.
                                              ------------
 
 2.2.1 Plugging a PCI Express device into a PCI Express Root Port:
-          -device ioh3420,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
+          -device pcie-root-port,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
           -device <dev>,bus=root_port1
 2.2.2 Using multi-function PCI Express Root Ports:
-      -device ioh3420,id=root_port1,multifunction=on,chassis=x,addr=z.0[,slot=y][,bus=pcie.0] \
-      -device ioh3420,id=root_port2,chassis=x1,addr=z.1[,slot=y1][,bus=pcie.0] \
-      -device ioh3420,id=root_port3,chassis=x2,addr=z.2[,slot=y2][,bus=pcie.0] \
+      -device pcie-root-port,id=root_port1,multifunction=on,chassis=x,addr=z.0[,slot=y][,bus=pcie.0] \
+      -device pcie-root-port,id=root_port2,chassis=x1,addr=z.1[,slot=y1][,bus=pcie.0] \
+      -device pcie-root-port,id=root_port3,chassis=x2,addr=z.2[,slot=y2][,bus=pcie.0] \
 2.2.3 Plugging a PCI Express device into a Switch:
-      -device ioh3420,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
+      -device pcie-root-port,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
       -device x3130-upstream,id=upstream_port1,bus=root_port1[,addr=x]          \
       -device xio3130-downstream,id=downstream_port1,bus=upstream_port1,chassis=x1,slot=y1[,addr=z1]] \
       -device <dev>,bus=downstream_port1
-- 
MST


