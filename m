Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA9450A48E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:44:29 +0200 (CEST)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYyq-0007a6-Ab
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ0-0006hR-8N
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYYx-0006CF-Ih
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:45 -0400
Received: by mail-pj1-x1034.google.com with SMTP id 2so5248041pjw.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SzaErCxPynOXfprynx7L2dok5JtwK8hmgMvAuV9lE9s=;
 b=uRYD+7Lf40jI2JFQsvztWVHdBLVLkSVSJXAnjgo1gZRMxuIY3ltCnfzkz1eLb26lFS
 d/SusM9pXP+F92f/iEFr0dZztSWFDeZJSCIyQJAZ0ScBMC2oANjFymk0EoJntkoQQkct
 k9gh+lVTSBdS0jb5sM3JxGQaiOSbr9ulAckf3MA45RpfmfMVixeUwO279AwYwM9laon3
 UM0tTcVvtoZFxWm2ZWc3ikYEqzMw6jiDCwZbC3dQOgCbcsvcP9/MxNHSC78pDGtO9Mem
 GH+sgVDJhmxrMa3XXMYHJsO4prO3a/HZG70hka3iXrs+OO/qrp1gPkC2m50aUjtzGzVO
 bBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SzaErCxPynOXfprynx7L2dok5JtwK8hmgMvAuV9lE9s=;
 b=qT4ZJ/91IE6ucpczXZdK5tta1xe1ZreuMflBtLtRDwdKULFjSubyFpeNXD/7F2mud4
 ZN8MGSNvGtMBwoR76nTXxfKibD+hHBPtwXx/gCAIH6BcpNNQtCBMPVnPEh+r4AwLUTZe
 4vQhM1kcXOgOuWfMq58WVLQKkrvvtJkxOUoWgGwiSJFsFEiiVZHnhn4gnrRxofQxNcJZ
 CFu1c9o2mm6Tbu9w8IEvG5UGVh+jAEByLs1DYwwGV+oTVhrGj5ZaY9YB9JC9AJnXFxXQ
 xxhKlAcF5qnVtjIvr7BA82FolMVqTnchTeFzrqtKvat1ioGHXrW/IOdDHHq2ia/0V8wy
 HGsQ==
X-Gm-Message-State: AOAM533BNZSOQ09jY008AJuPQxu96OfJQtkux4KBw5WX7FXDiQh6IS62
 Cn7hAFGX1MV49FXJO6vjXTdExhZ5Ko7iCw==
X-Google-Smtp-Source: ABdhPJwPGBU14b8shYDfa0VZOrno3hGsLD8n2ZzDMwmjNOGhXJo+4f3iUJMxpOSvDEueZdk+tv1tUw==
X-Received: by 2002:a17:902:da84:b0:15a:1214:2eab with SMTP id
 j4-20020a170902da8400b0015a12142eabmr13493976plx.114.1650554262148; 
 Thu, 21 Apr 2022 08:17:42 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/64] linux-user/nios2: Fix clone child return
Date: Thu, 21 Apr 2022 08:16:33 -0700
Message-Id: <20220421151735.31996-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The child side of clone needs to set the secondary
syscall return value, r7, to indicate syscall success.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/nios2/target_cpu.h b/linux-user/nios2/target_cpu.h
index 2d2008f002..830b4c0741 100644
--- a/linux-user/nios2/target_cpu.h
+++ b/linux-user/nios2/target_cpu.h
@@ -27,6 +27,7 @@ static inline void cpu_clone_regs_child(CPUNios2State *env, target_ulong newsp,
         env->regs[R_SP] = newsp;
     }
     env->regs[R_RET0] = 0;
+    env->regs[7] = 0;
 }
 
 static inline void cpu_clone_regs_parent(CPUNios2State *env, unsigned flags)
-- 
2.34.1


