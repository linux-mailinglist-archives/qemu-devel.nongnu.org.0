Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9373071DA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:47:05 +0100 (CET)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52xE-0003vP-DQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52aw-00067P-41
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:02 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52au-0005k2-E7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:01 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l18so3842868pji.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBCcLumWniM/+fC/4eU8EcpSrpup7jHrRf0ZPnvW8R4=;
 b=D9HkyJHDcvgt5VK74A91d6+cya1fsnZWcXymNGtaLkzY0M6Cn74jSvxiN2zdLX+GSM
 q1YtfD9VUa70kJ1KdTmAqZTuqMKyTHhWJHFq4igSKCL2xDQJTVCCOpBf3EIUQkejE49C
 ReGb5o0OYeDuM+YJmcfoQ0HYhEVtboNk7fzMCq8ots6SDz64EkSwkIOOk5lv9VcfSOAr
 Z4FBgvhfbc1fMWdBfrd7rzzyOUUv0wx/y46NlDpqdbhTpTgVb28ffVZYMyoZGYyEujh2
 86+3WZCvtx5Cy7GkrSMiyU2SboApjJ0N2OhB0s0qnKH4SgW2e2gX5vFqDkoV4FdjiEYo
 vIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBCcLumWniM/+fC/4eU8EcpSrpup7jHrRf0ZPnvW8R4=;
 b=bzOefwGgYjB+nka4B7eUmuoXE1qFE1dX2AHsO86T8kBfWR4nDu0aSM4E8MahdvSuIv
 IxpRSbcYekQwMkQpVNCUoYeA1r58NWEa+Jo7wcc+kupTBczZIouFZASXn4jxkX2qQrPd
 mBprxdV4pf2O5g6zyUTkcjxhY8PenyPSsfPxet1gm/B5jATMRLNhP1atDKMm+iyvoMGC
 33npcJpCEy7dMpl9GiMZ8vvqLTB2wRFYZTlMT0OpgNlqApIwd8jsR3eFlyBFeqWB/o+o
 JyJkPMwRDQ2sbn+bUXCULHHSjkADGdEZ3qZ2HlvsvXUQgVc3xjp15o5ZsYk2UurY4CRK
 WIvA==
X-Gm-Message-State: AOAM530cv3Oktx71KJ+qJMnqIHpzBW+zYakQRxBHnBtEBiNQBBOvVOPu
 CufNuTNsIpovoFa6PJs1MpnTztwiCFtCDGe3
X-Google-Smtp-Source: ABdhPJxtTBeyft05D4ocXveZUOU+6bQEx2WKOMolnpwtkYm018PTL8flQWnrotn+PwvDjCP8CABD0A==
X-Received: by 2002:a17:90a:7e8d:: with SMTP id
 j13mr10042480pjl.37.1611822239151; 
 Thu, 28 Jan 2021 00:23:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/23] tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
Date: Wed, 27 Jan 2021 22:23:23 -1000
Message-Id: <20210128082331.196801-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 95625701bb..233fc0604e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -599,6 +599,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
+        case INDEX_op_ld32u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -854,12 +855,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld32u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
-            break;
         case INDEX_op_ld32s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


