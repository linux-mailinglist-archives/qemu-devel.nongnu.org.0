Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E659C479BB8
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 17:13:16 +0100 (CET)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mycKi-0005Bq-1M
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 11:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycH3-0001Kb-Ma
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycH2-0001Fh-8K
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639843767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lm+2VsrdWbkYCrKuR4VdYcv+nYRPOsvJEvTZMZQRV2Y=;
 b=Cdg2s4hdAuMPFXW9zjMJFBqbD+oxgT08Gn4r9mDRABqBe122FESrii4+nlWBbj76fS3khR
 qeFJFj6ho0p3IJnbNTnrKnQD4qJlbnLAEcApemgxXv7FMihyJlHloBGnqFv5yiu7Q8X3Nc
 FqxrstVhBprZ1VncTkt27pBtdHvBYIE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-tN3FPqBQPG-MufXLjIXnhg-1; Sat, 18 Dec 2021 11:09:27 -0500
X-MC-Unique: tN3FPqBQPG-MufXLjIXnhg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q21-20020adfab15000000b001a24b36e47eso1551548wrc.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 08:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lm+2VsrdWbkYCrKuR4VdYcv+nYRPOsvJEvTZMZQRV2Y=;
 b=4TPN0EZ7WxMMNTs/C/bKovGpo43tj81nIRaZ11bgv7xNMhHolzGyDZnuQjhWqlgoiX
 KxOpWj1HUKxORyUh1JgynxYUPx4rSHJY2eo9s6nUVjsSjEYqVtOxwk8GTpgaS+NLcaPV
 r5yTlAjZPpS7pBkmcnycFRnXC44zC3MYNftzzu94LfNa558DZQFzs6WfgN8v9e+Bmdbz
 FU/OnZTXqZJ7+9TJoDqaR2fuR6P+JeO1UFdQtIWl5eZD+F9z5ZtuERzsfAK2VxDh9hIL
 KWEDv0dVk8HCEC7kzknXup1agHchcOmmRFxKEWfKi4VMDeM0yc52fhC6CCpNrX6qTndY
 kDSw==
X-Gm-Message-State: AOAM531wX4JnTuOZQuWn9++C1JADS1B+6y+QsLwI4KzSFSAM+F5LXcz/
 fdQrr85fsYDIH2MNXiRzloC+FiIji7PesFQyaac9qlMiweoQnpJysK53GR7HTfhgQWA0aNPbHyR
 OICPOkydaSCLn2mQVhujWViSIXp1ZlAquKYCQB4CbCOM15QKBKvU9bg5m7oszcc0C
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr14300493wmh.99.1639843765517; 
 Sat, 18 Dec 2021 08:09:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpIma0FuFr5JTICHr7wNGKHr9Iab9Z1P81sMyy5GzyOWGYrxYrYfy3H2ujCfeZEWs7/X/aGw==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr14300465wmh.99.1639843765253; 
 Sat, 18 Dec 2021 08:09:25 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n14sm12592890wrf.69.2021.12.18.08.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 08:09:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] hw/audio/intel-hda: Restrict DMA engine to memories
 (not MMIO devices)
Date: Sat, 18 Dec 2021 17:09:11 +0100
Message-Id: <20211218160912.1591633-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218160912.1591633-1-philmd@redhat.com>
References: <20211218160912.1591633-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Thomas Huth <thuth@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issue #542 reports a reentrancy problem when the DMA engine accesses
the HDA controller I/O registers. Fix by restricting the DMA engine
to memories regions (forbidding MMIO devices such the HDA controller).

Reported-by: OSS-Fuzz (Issue 28435)
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/542
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Likely intel_hda_xfer() and intel_hda_corb_run() should be restricted
too.
---
 hw/audio/intel-hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 0c1017edbbf..3aa57d274e6 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
 static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
-- 
2.33.1


