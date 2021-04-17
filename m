Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB60362F55
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:43:42 +0200 (CEST)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiQQ-0007IL-1S
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEd-0002SD-FL; Sat, 17 Apr 2021 06:31:31 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEb-0001Gg-U1; Sat, 17 Apr 2021 06:31:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id y204so14149275wmg.2;
 Sat, 17 Apr 2021 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gigBM1s+F8HC4WmipCGGWWK+Zc3mdWdnCe6+x4OghgQ=;
 b=MwueMmS8oD6spzk9WFw3065ohzOuSqbF7Js6YfDzNUHUDb+LpLdKYoGJH79SASQ5zm
 X4KjvPEBF0ixmvPdDFZQv/Bz9d3Gb9JNnPaEiZBALqvJoWY5y2YeW9u7D8Vx5pnVHzve
 XIGNsp4vnZcilKnGAToxNREVYEDpsUrH+kVGRx5VoW4KTsJVTdwAde63QKb6F0oVoGzh
 k3NzazNFFcsxfBU+cL4+BsYs4PnD+5+GHZag65/X6M2hZBelqfAJ3vLE2uKfQLenE59h
 EOSnyTRTXzQD0RPzu3PyMevn9g7hMuAi9emukm0k1Rok5Qyc9QgAtE+S7kVPXPn+qiKx
 JQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gigBM1s+F8HC4WmipCGGWWK+Zc3mdWdnCe6+x4OghgQ=;
 b=J9SAEY2hRAHbZ7L4jZQlPeDiu4UKVGqsLBY31bfiK365/Rbsd7ysil4wLhnJhJBRyI
 Xo7JcFlr0IIJ/QsrLP68NFZT5w+VcpcGGtVGtP1aVq9iWuyMhUYSl+c8nqscDCch1yDH
 N4hkTAeDeDQWdQm6a7aYU77pK0Sr1OmVYeSgj94Bb4mYpqcXuvyd6C8JzPAZXlTyvPrC
 1EOczevF0CiMSEi1rn3/p1Aazy6Is9I3pb3Sv1D3KoRIKoWKu9xkl2ITV0oXqvjYM34f
 +3Gq50huOJT18TwwXchCHIvDwKTDpn2oVkapUuFGJ0ofU59UaWu+Bi3x/JP1fURx43Fi
 JjVA==
X-Gm-Message-State: AOAM531pM2FuHTMsrzLtVrwnB8sqzfuNPoIcoHkcISvB/GWDicMMZvFS
 lMRkm2KoezS+dkQzySROCx4iyQO+KZs=
X-Google-Smtp-Source: ABdhPJw/dZBzwMZUey7yEHd29htp+tWvJn/VFSVNoujvvp9sF4mqO2yIEefGyv5XXLvaUfEAhKTqcQ==
X-Received: by 2002:a7b:c098:: with SMTP id r24mr12066647wmh.77.1618655487679; 
 Sat, 17 Apr 2021 03:31:27 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 61sm15406177wrm.52.2021.04.17.03.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] hw/pci-host/raven: Remove temporary assertion 'root
 MR is zero-based'
Date: Sat, 17 Apr 2021 12:30:28 +0200
Message-Id: <20210417103028.601124-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Previous commit added a check in memory_region_add_subregion_common()
to ensure AS root MR can't be added as subregion (changing the MR
base address doing so). We can now remove the temporary assert in
the raven model.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index d8c1aaa11f5..3f8508bd467 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -141,16 +141,6 @@ static const MemoryRegionOps raven_intack_ops = {
 static inline hwaddr raven_io_address(PREPPCIState *s,
                                       hwaddr addr)
 {
-    /*
-     * We shouldn't access AddressSpace internals. However this assert
-     * is temporarily used to prove a subtle inconsistency from commit
-     * 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region") which
-     * expected the PCI I/O root region base address to be 0x80000000.
-     *
-     * We now use an alias memory region as root, which is zero-based.
-     */
-    assert(s->pci_io_as.root->addr == 0);
-
     if (s->contiguous_map == 0) {
         /* 64 KB contiguous space for IOs */
         addr &= 0xFFFF;
-- 
2.26.3


