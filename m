Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDFB362F45
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:36:40 +0200 (CEST)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiJb-0007aF-IA
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiED-0001nR-K4; Sat, 17 Apr 2021 06:31:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEC-0000wo-2h; Sat, 17 Apr 2021 06:31:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so5802357wmh.0; 
 Sat, 17 Apr 2021 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLE3I1k3IJfuJNE04qzx4N5NNPVf33qPSjT+93d2QLc=;
 b=tmfZs3MCmYdxjGh6o1UJtIaEBHAP6sNCG2Pym2EeygJzUNuuHqg37NV06C7ByB9rhK
 sbLxZueophscqQkRKCL0ipo0l70IShlxrF0bE4GwaHR6bmIttzXHaWJNSCIET70V+RR9
 udp2vCPfw5Up8Oh5t51v2+taCF9FQzfEdDaJa+RK9cOE+Bu9qFGc34hk/cDhuWbv1LSL
 mEpT3hVYxoA5s5eV+G9njyERm3r2yrgtWVIRmBgVDLUyNJi2IvlbgOx0j4iM9ajaofAz
 TAKfKge8Gkc9nr6rqiBMV/XWDGEtwylmu3gOJc05V1liom0CKQwXgtOrG7SzHeTlfaJh
 lnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VLE3I1k3IJfuJNE04qzx4N5NNPVf33qPSjT+93d2QLc=;
 b=M87CJg7W72Axk6bQ5VCpHVG+qSDdZU/Pl0OMHEmoo+1JS1BGlxzq9QjULyljDgkE8B
 eZogQLvqJQgFqmtNnhiUz0IO3w685zvxfQ5oCzeavLQsaozMlrpQUKkQk/gjSL67hbQx
 z8xzwsB24sKqZ92RdosrAplUY67U24WRpogBGcfYuj/lmtCOrTR3CujxclHs87N51/pQ
 Cpmc/QHtUcQyUHogm3eYgMZpXmJzjnTq3iHp9k0PDRXgl+NgEGZDI6LN+1J21Gwoax/d
 8t6vQFTHZgTzAPTQ8ydF7BRohJQnqJRRYJtjbz0damF7SOwrZffq+pbD/mPJ6zv5hpHD
 YVdQ==
X-Gm-Message-State: AOAM533hoJctQEau9YAhwZSryOO6JjI/Y2y1iN7GOzwLjCqoNV9sBSGR
 B1LJefofzqiI21y/phohpeOPJxq1PDQ=
X-Google-Smtp-Source: ABdhPJzw1E06YjdNsiB2yEdIaN4rYV7HJHzKHamdey1Mv8Ni9ANAOFK6szhDiyuj33hghT+iCDdNVQ==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr12113042wmq.29.1618655461755; 
 Sat, 17 Apr 2021 03:31:01 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m11sm13996085wri.44.2021.04.17.03.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] hw/pci-host/raven: Assert PCI I/O AddressSpace is
 based at 0x80000000
Date: Sat, 17 Apr 2021 12:30:23 +0200
Message-Id: <20210417103028.601124-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region")
abused an AddressSpace API weakness which allows set non-zero base
address to AddressSpace root region. We will fix that in the next
commit. First add an assertion to ensure no regression is introduced.
As raven_io_address() is called by both MemoryRegionOps handlers, it
is a good place for such assert call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 730f31a8931..36652122424 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -141,6 +141,17 @@ static const MemoryRegionOps raven_intack_ops = {
 static inline hwaddr raven_io_address(PREPPCIState *s,
                                       hwaddr addr)
 {
+    /*
+     * We shouldn't access AddressSpace internals. However this assert
+     * is temporarily introduced to prove a subtle inconsistency from
+     * commit 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region"):
+     * AddressSpace root region must be zero-based, but the Raven use is not.
+     *
+     * Assert the root region is based on physical address 0x80000000
+     * until the issue is fixed.
+     */
+    assert(s->pci_io_as.root->addr == PCI_IO_BASE_ADDR);
+
     if (s->contiguous_map == 0) {
         /* 64 KB contiguous space for IOs */
         addr &= 0xFFFF;
-- 
2.26.3


