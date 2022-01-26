Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8249CB73
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:54:16 +0100 (CET)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCikZ-0000Lv-KG
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCiYc-00057B-6F; Wed, 26 Jan 2022 08:41:54 -0500
Received: from [2607:f8b0:4864:20::22d] (port=33542
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCiYa-0007xc-GL; Wed, 26 Jan 2022 08:41:53 -0500
Received: by mail-oi1-x22d.google.com with SMTP id x193so37607178oix.0;
 Wed, 26 Jan 2022 05:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52aMKQy0NeqkQtCdVf7J33vTUf2NEu5M6ZibAMEJggQ=;
 b=OuuqJrZ6muQ07BdHwS5s5Y82A5kJT2cBRknhaNyNnG9Bhq2Gz0a3O+UYLzLI3vevpv
 ERQadaI0Hla+6XxnEOvU6eFFLBrL77R2Urcf2go1KpCH06bEbtYNCkYin0ELRWs4qHCj
 kqQ3iPaZkW/nyI3Z0qnnT3gTdvrrKn/MsLlXTM+Uql0UY0up1RGoTLHyHNde7kD8RoxZ
 cwT/noO+YscmKc1/AV7Cp+AJLoW2sQ5EfHaiGHSh3SsO0q1oOpDslvQ6Qtpd/JW7HkPK
 sT6XOxnxLjXFchFY5j6uz/gLhRiwT1hLJJXDjH66I0q0Vt4kkl4KE8IxnsKtccaBQFXp
 5TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=52aMKQy0NeqkQtCdVf7J33vTUf2NEu5M6ZibAMEJggQ=;
 b=fxa0u4LPCgXJvlM0i3EQfpyJMUTCCZNh/laYW6USqDOlX6b8mGZHJqE+O0paLWKfb0
 k/G7jOQzgqJpFRJRoGfiScrVqD61xUt9tcDXT7UrKDFMpI7c5ZpyqOQfcNCrP93sBt9S
 yWPzezAuJlXIeBYjUAvWpF7AJ0SsiHOa/iJNz4q5Km/SjIfr3uzRwpn+OKgF8DvNNWx9
 wL+VABk2LME7esIZlgxdttV+A5Q6LESDmSaXsQN/EOnQEM6otuIYCs+piDl2bUHWa0RM
 NqA0L26oMslFxDXZDY/2KqRQ12nGYtyxk96fSM1O+Aj1f6BwqEaPwJ3qzV6wrHZx5yJ0
 w2qw==
X-Gm-Message-State: AOAM5307bAyzULwmNIse5XyE+r7uwLKpLbsqbhaSSJHvE9uduY5a3DLG
 VkCr2tGc7dUMFJlT4rlpmfAH7Ai4wck=
X-Google-Smtp-Source: ABdhPJyCnDB09tpm+3/y29Ajq1cIIkLXQyT5a+XR6ejtsnTMShkqQ2pc/E6NJihgtz0qamKkOB/fzg==
X-Received: by 2002:a05:6808:151e:: with SMTP id
 u30mr368779oiw.286.1643204510997; 
 Wed, 26 Jan 2022 05:41:50 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id v26sm4939342ooq.20.2022.01.26.05.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 05:41:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ppc/pnv: initialize 'taddr' in pnv_phb3_translate_tve()
Date: Wed, 26 Jan 2022 10:41:36 -0300
Message-Id: <20220126134137.791968-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126134137.791968-1-danielhb413@gmail.com>
References: <20220126134137.791968-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'taddr' variable is left unintialized, being set only inside the
"while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
is an int32_t that is being initiliazed by the GETFIELD() macro, which
returns an uint64_t.

For a human reader this means that 'lev' will always be positive or zero.
But some compilers may beg to differ. 'lev' being an int32_t can in theory
be set as negative, and the "while ((lev--) >= 0)" loop might never be
reached, and 'taddr' will be left unitialized. This can cause phb3_error()
to use 'taddr' uninitialized down below:

if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
    phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);

Setting 'taddr' to the top level base address will make compilers happy.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/573
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7fb35dc031..617d42c5a0 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -788,6 +788,17 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
         /* Top level table base address */
         base = tta << 12;
 
+        /*
+         * Some compilers will complain that the "TCE access fault"
+         * phb3_error() down below will use 'taddr' uninitialized
+         * because, in theory, the loop that sets 'taddr' is skippable
+         * due to 'lev' being an signed int.
+         *
+         * Setting 'taddr 'to the base address will bring piece of mind
+         * to such compilers.
+         */
+        taddr = base;
+
         /* Total shift to first level */
         sh = tbl_shift * lev + tce_shift;
 
-- 
2.34.1


