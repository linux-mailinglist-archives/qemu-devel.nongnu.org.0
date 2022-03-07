Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98E4D0797
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:23:00 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIwe-0006nN-1E
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq6-0006a5-RK; Mon, 07 Mar 2022 14:16:14 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=40863
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq5-0005ww-FN; Mon, 07 Mar 2022 14:16:14 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso19051269ooc.7; 
 Mon, 07 Mar 2022 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5HMoFpGnQQyw41QxQcu8bpX16VVn3HjQWgitpykCQhk=;
 b=IBinz2cN5GmYMpqxRBowIzqFIVvIKakjzwnXe50vq1cH/yB3WcQx7UVxdtdFHStCHm
 BH+2uOa6WTpdhj+T5LcnnjUF8BZlxmF5kK01Yu1Q4wR2YWjmjyy4RK4EnMLcLhhSLSxz
 4JIWYKyv0vca3n8I/4SlIhamy06OqHfDog8b9U8NqpSMmiaDQRp38c92ZcNU7UsNJIcs
 DrLECBJvS8Z1kRyNxol/CoElmTm3Atv2+jxCyprGzCV/XktA3Hf/448slJ38hjHSv8dG
 jQvAxB8XaFW5C8fkFHYMDrLCX8uGPsYNmECO3L9hBWXUo+I1x4pO0J49DWDOd1TGXAnN
 MXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5HMoFpGnQQyw41QxQcu8bpX16VVn3HjQWgitpykCQhk=;
 b=fd/zqnbHhfnGqvGy6tNVIg47RUqGet+jMhhehvUq21OpmZxMthE8UX0xhr2cKxWbps
 GgenBhvro978guCO1NP5X6bQ5d66KsvgIsqM19QXDCjSv7QyqcvyBmrNR202jUsr25dB
 g+7bQjNnx/pGiTjfnf2mFNZ8GYC5FeurbBaD42a+sB8l60w/V0wKrXvTN1ob/7L2RnXI
 M4H+DW7mhwFj9f+rX5w+qHzaneSQEHigD+M8JrRPOPLUqD8pzcSBqTYqjNluqSfkN0aR
 o3S6OXfyA9+9IMTj6ZYIIbZhXUHx8pff9SE6rPbOXVMAQ0WnO2im8CZdqvoqlRRDNaol
 k3PA==
X-Gm-Message-State: AOAM531YvRFDcK+jKDgc7I7CsRlxcFXuvsW3itYrHuYGADTYA6bqkA+8
 JXtjbBf6HeJuTV/v7pYOvym6GfIUYKA=
X-Google-Smtp-Source: ABdhPJwfY8L998SwyCpj5p84n1dXZEiU1ASIQGKjzGwGn7HaGs/P+XPSHU4UfmVNgnhr1gkZViUp1w==
X-Received: by 2002:a4a:e402:0:b0:320:bf45:3193 with SMTP id
 t2-20020a4ae402000000b00320bf453193mr4836176oov.77.1646680571940; 
 Mon, 07 Mar 2022 11:16:11 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:11 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] hw/ppc/spapr_hcall.c: log h_copy_tofrom_guest() as
 unsupported
Date: Mon,  7 Mar 2022 16:15:48 -0300
Message-Id: <20220307191553.429236-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 5839b6a749..7cfb17689b 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1544,6 +1544,8 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
      * This HCALL is not required, L1 KVM will take a slow path and walk the
      * page tables manually to do the data copy.
      */
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+                  opcode, " (H_COPY_TOFROM_GUEST)");
     return H_FUNCTION;
 }
 
-- 
2.35.1


