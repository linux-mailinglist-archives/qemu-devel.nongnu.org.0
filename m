Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6233A749
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:08:18 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVA1-000092-U4
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1U-0002BI-Ah
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:28 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:42545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1G-00028E-N9
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:28 -0400
Received: by mail-qt1-x82d.google.com with SMTP id l13so7657564qtu.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NXtQw9hpPp+VCgrduDja0oQSnznjQ9crwR/vZ//mYY=;
 b=iCM8bSzTKdYITmEQEJAGPbZXZEc8almMrR4wb+ut32XGVIb4W/jFVmtR8MhN+YmXCZ
 EjifYoNQOIFmKPbgmg8Y5lA2F8fAlU+SlPglkmRb8LkTvzM5T0qzZQHO+sEoPAjzsZk3
 qqIl96yXTnyhHU0eIuIrb3IuIRo0MY1zKL8M8JwLlcObgHNI8Zxlb/J4wEVX347ROL3Z
 XDE8R5LsMg2GO2GERxvygRHDYCKphBxsH5lg59oUavPRHj0r0C6KhbzNCbWartYwblKu
 gGQrLVtE6yLE5vLrlg/QQKigPahdP10L2v83ezPsHz5rTNSbrG2P/E7zdN1Kg2naCZvC
 rn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NXtQw9hpPp+VCgrduDja0oQSnznjQ9crwR/vZ//mYY=;
 b=WAP+TxMMfGmmYPkERYk+rIEoY5ka00VSxJjJwA3xuMyeHcYOTBfJn1vKwlJmbYbxuZ
 RASxFhNRFbfs/ps2Of4RljH+47LEPNM/8c3yCXOF05HhPRb01Z/b3+XIhyrnn77v4TTS
 XgVGPkrKsmWZ+xF+wzfDIyCYdS9ugg481ge5LLSXisPpMlayktTS6oYWr+3msmlWG7Cj
 GnWL6AeA18pai59wed/VfrC2CAL+tqu/XOSbzKQj6t7ZLxorFmBkH/xw7WHhNTPaLFVx
 MwQ33r8l5fEhxf8PKcU4/ujto9ARUkL3zd/Op8ktPQM54dK2P1fvxGbIY0fTskhUoKX+
 RN7Q==
X-Gm-Message-State: AOAM5326EhPh36mtdEK0qGMdQbSRmsznkprZWAyXuvWVxMWjeR+qgwBV
 pWtVVvIPbnpBZq1SM1Jo+198w26pjrnr3dH5
X-Google-Smtp-Source: ABdhPJx1yyBV//bFI3Lf58VRlDfUHoIrQIcwbSf6Msh4Dl06SU/kbMOLthcEaSnMpJZMli3DcChRZA==
X-Received: by 2002:a05:622a:1748:: with SMTP id
 l8mr4552820qtk.73.1615744753834; 
 Sun, 14 Mar 2021 10:59:13 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/16] target/ppc: Do not call hreg_compute_mem_idx after
 ppc_store_msr
Date: Sun, 14 Mar 2021 11:58:54 -0600
Message-Id: <20210314175906.1733746-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ppc_store_msr we call hreg_compute_hflags, which itself
calls hreg_compute_mem_idx.  Rely on ppc_store_msr to update
everything required by the msr update.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/machine.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 87d7bffb86..f6eeda9642 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -125,9 +125,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    /* Recompute mmu indices */
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
@@ -418,14 +415,12 @@ static int cpu_post_load(void *opaque, int version_id)
 
     /*
      * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring
+     * before restoring.  Note that this recomputes hflags and mem_idx.
      */
     msr = env->msr;
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
-- 
2.25.1


