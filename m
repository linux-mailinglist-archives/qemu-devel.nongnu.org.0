Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256B6A116D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:46:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRj-0002te-H2; Thu, 23 Feb 2023 15:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRg-0002rx-PR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:04 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRf-0007T7-9S
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:04 -0500
Received: by mail-pj1-x1032.google.com with SMTP id pt11so14995497pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DH8GytkPurA9HrZaN37YWqxqd2398SYcw6ExGS87Do=;
 b=XEAP3hiJfXhcMkZwci7Eq88t0pM4bM+B+Hk/UBnOnFyrF0na7znaTQ9a4rSOIBvNI5
 m6CpW4LK5DIu3a7cLvgWKAsJDWw+x2Vgb3kS3TCIYA8Ly9Gn1xrjPYnohLn79kWPN8ur
 fiSahnMRIPsHnkiKZuXHLWKEuiHebwDmw62FJhzPoDB6JJdSWozoo3cuCqIfbfztl+oW
 FrNzUSLwdn01+j/PkgrNwfCoItLSLPGRj2Ki0VJYRj0C4hXmfWAMkb1FTM7W7WCpoPzg
 OtRCYuToKb4xVOHqumlSpmCbu7HjW6oECeS13UTfFYxufkO4iccXVJ9FjrIMGhm3ec83
 Ssyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DH8GytkPurA9HrZaN37YWqxqd2398SYcw6ExGS87Do=;
 b=VBTPdEFfclM4SXjde5QrGj5w1AIhRhK7HAz5cNVYP+c50aEyh8Ei/uR/yR+h2Pddtg
 Oq5TZnFhB+D8aA3MAywax6YyhRhdVqnF3N27b5Afmu1te3h/a8QcN//VEmKnJAmtzzyi
 OFfJuEjR5r8ngWXgPBbVykP9LPg0uq/tQAf0pmgKnWCXgefK8Ufq+O/dDeehgcEqOtFr
 uqTU9/+O/5tVNMTYTojT+FKV5i9VmWBo8x5raSVL/YarkiFLKFmmITtHcU1MjP1CeYOK
 p9Ghx2cyMagIHdIRVaHjAYHZIfGoS7FMB+NKekdAqsey45wHqluCJOSe9M1qDPYHFOnI
 fUBQ==
X-Gm-Message-State: AO0yUKXTALCKQNhgqweBah0WrNai8e0aflsevfDpFQu/5NVmtJxNpZ0d
 gSMXB7DcVD8hPlllfbYKIlxo+QIdoIGpvZUsqNA=
X-Google-Smtp-Source: AK7set97R923kVQZyuWuSHFxVdW7E6/grwh5ONPGLDjkq6eFuzhopbXT9zQPDbRuADsNIzcjHdQaXA==
X-Received: by 2002:a05:6a20:8f10:b0:cb:a66b:3a88 with SMTP id
 b16-20020a056a208f1000b000cba66b3a88mr10004856pzk.1.1677185041785; 
 Thu, 23 Feb 2023 12:44:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/13] exec/memattrs: Remove target_tlb_bit*
Date: Thu, 23 Feb 2023 10:43:38 -1000
Message-Id: <20230223204342.1093632-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These fields are no longer used.  Target specific extensions
to the page tables should be done with TARGET_PAGE_ENTRY_EXTRA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..1bd7b6c5ca 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -47,16 +47,6 @@ typedef struct MemTxAttrs {
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
-    /*
-     * The following are target-specific page-table bits.  These are not
-     * related to actual memory transactions at all.  However, this structure
-     * is part of the tlb_fill interface, cached in the cputlb structure,
-     * and has unused bits.  These fields will be read by target-specific
-     * helpers using env->iotlb[mmu_idx][tlb_index()].attrs.target_tlb_bitN.
-     */
-    unsigned int target_tlb_bit0 : 1;
-    unsigned int target_tlb_bit1 : 1;
-    unsigned int target_tlb_bit2 : 1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.34.1


