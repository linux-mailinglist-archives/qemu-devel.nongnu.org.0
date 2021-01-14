Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C52F6A1F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:56:16 +0100 (CET)
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07n5-0001DW-Ba
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071B-0001ri-NI; Thu, 14 Jan 2021 13:06:45 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:37031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0718-00050A-RP; Thu, 14 Jan 2021 13:06:45 -0500
Received: by mail-qk1-x732.google.com with SMTP id h4so9144310qkk.4;
 Thu, 14 Jan 2021 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qA+hTawZuCB29ODtiQTgs7aKtUv1YETVYNC1B0Au/Es=;
 b=pJBpihp54MNQGs5BhssgzqKN+CsuNzaLtGDvWRRgAGzNgE1V/fZTVg87wjkMj2l520
 IRxJucRpl/eGZD7edJ1RTtO2EuYlq2qCIZTIJMZ65R8SU3jPBHDy6ZlCiJQVhiUmGvvy
 2d1egU+x5UGtUfU+H4hVB7aG6RiEhDQqhoU6DUhjoXj6AVEuomL87SLFAzvyOeWXv5lb
 tGMQolm/FvI1ovPyRSAUUQ1VykjLYZEV6OF3mH2hh1Gr50UXpJU/14X9vHDhcPxlWT7z
 GCyz/S9/Gydgg9ZiG6hZ9fzrmfDmwJXkaQnYjTIzjTTRlRTzj5JvQOTYxzKd/eEWvbWA
 mXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qA+hTawZuCB29ODtiQTgs7aKtUv1YETVYNC1B0Au/Es=;
 b=JkfJ4Vw3kCWtdqWGLIOmetHPVHb8C95orzlByQQROgHajUkuOunagLF9joNTf6cd4Q
 aR3g965hFgLgRiiZ9lPflk8gmr/gvjnEaPDprjiffmjC8ypMxvQYzK8Ztqbw6gaPt9YT
 X0cWN8AIGJwoLqVknve9AAJhenDWItdP/Do6FUwhIpCQw5uYNwNrWHiigFma9Ktd/nJV
 +xc6BNfbS+eGwdlKns7tadftdYXAIEPxeHKvFebX4FZFPaXFCMcFNTLyqUwjLpSkfwfQ
 rFSFav7Uoo3Qvr/3qYWXtXGbZ5H3aG95XMqpEtBHlZhKaP1e5A5gBGFEsuhSapweQbBh
 wsag==
X-Gm-Message-State: AOAM533PKLUJ/tt0lF9K+id33CEAy5RF8QitCp11toI6VraFIIhPix9l
 gloi7flHSpPDpCtFMgz/SPy6uOb5V3c88Q==
X-Google-Smtp-Source: ABdhPJz5PXpXGbpXy+nuQfeeQGxX4FrnpQsaJAZQiwGAnvZOnRNd9l/cyUwMGZHhXr7Vgask1VE0hQ==
X-Received: by 2002:a05:620a:21d3:: with SMTP id
 h19mr8178040qka.341.1610647601359; 
 Thu, 14 Jan 2021 10:06:41 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/7] spapr_hcall.c: make do_client_architecture_support
 static
Date: Thu, 14 Jan 2021 15:06:23 -0300
Message-Id: <20210114180628.1675603-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is called only inside spapr_hcall.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c   | 1 +
 include/hw/ppc/spapr.h | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index e5dfc1ba7a..7b5cd3553c 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1632,6 +1632,7 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint32_t max_compat,
     return best_compat;
 }
 
+static
 target_ulong do_client_architecture_support(PowerPCCPU *cpu,
                                             SpaprMachineState *spapr,
                                             target_ulong vec,
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 4d37c2a93b..a2d1fb21c6 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -583,11 +583,6 @@ void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
 
-target_ulong do_client_architecture_support(PowerPCCPU *cpu,
-                                            SpaprMachineState *spapr,
-                                            target_ulong addr,
-                                            target_ulong fdt_bufsize);
-
 /* Virtual Processor Area structure constants */
 #define VPA_MIN_SIZE           640
 #define VPA_SIZE_OFFSET        0x4
-- 
2.26.2


