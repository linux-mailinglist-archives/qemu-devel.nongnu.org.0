Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C404A0449
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:38:28 +0100 (CET)
Received: from localhost ([::1]:45344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDap1-0001Uh-9f
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:38:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf2-0008Ui-0s
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:08 -0500
Received: from [2607:f8b0:4864:20::d34] (port=33790
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf0-0001XV-9H
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:07 -0500
Received: by mail-io1-xd34.google.com with SMTP id y84so9767974iof.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9zDtgXS+L05+ekpD7VMpQo1Lh9R8HC1kSXvuE27qsY=;
 b=vPe0G4qPQRHboU6hfGKF9oJrby3F7Ghjbx/PDoDIDScE1IdtTifGuKJUGCoOBk+spM
 ahcEMQnSjn71T969Tm6QD9y20Ld4sSBQkKf/CUYsuW19gUVLiItXfPintBEfLFITSQR2
 dh8gm5dzjAJmDwmy1DkGCr1ASQiTGKCaMHlFKtjjDb1WOs78BXZF7BCdLenQtyQBNbj5
 Tx2nvpre5MDmlYiEuzdfAJgIQb/rHiwlBM6M/uvqf8T3++Kpc8DalIv6V5zM7JIWogFI
 Lhs+XXek/CaMlPKLIf1YviruMcyk+w4OefjOLHJwG3UWDdwnnUt0BVgduYEe4Gzo46Ye
 Fywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9zDtgXS+L05+ekpD7VMpQo1Lh9R8HC1kSXvuE27qsY=;
 b=gBKf6amRvLtY6bZ0BdzaGHWtzS0xMpi2ZFSJeZu7bf1cSUUo5Ov69wBmNaLUa8gTau
 HpOYKwTRZBN4FxDHVIXtqEREKWjXywGjG9DZ/XcBm9gyL7ClaHiwpF6jPSBZJWf8v3gA
 kiVQouIT5aEvxC593yKSATjcJKcUd2eBHkKJWWMfxPa8eWeuzBKXwGFcfVfgL49Jbf6L
 WCiOPrMm8txuRXeFtlfcmS6AfZXtMNRj+MnkLtBeI5mlSI+KJcDXEk6Hocvbuc/YVCWq
 ah+hUuzx1cAFIGDESt2WiTGT6Jb+xcwGbzJyfmJSgPio1d6njrMrYhfsRpy8EjOFlNTV
 XUFg==
X-Gm-Message-State: AOAM532fao+oioFwo1hYaqyvlqWtcjkf9PRXoVZAR3lgXoJFii66Mw3X
 q3C+F8lw+Gs0xvwoopn6q0M6jGEVly86nQ==
X-Google-Smtp-Source: ABdhPJwGsgWlsFPSEWym54cAsrutTimGRyA+kHsxMuIuBnQUO0JDtTA3PgVMozr13BdeDT5TnYersw==
X-Received: by 2002:a6b:ef06:: with SMTP id k6mr6467809ioh.70.1643412485061;
 Fri, 28 Jan 2022 15:28:05 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/40] bsd-user/arm/signal.c: get_mcontext should zero vfp
 data
Date: Fri, 28 Jan 2022 16:27:29 -0700
Message-Id: <20220128232805.86191-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD's get_mcontext doesn't return any vfp data. Instead, it zeros
out the vfp feilds (and all the spare fields). Impelement this
behavior. We're still missing the sysarch(ARM_GET_VFPCONTEXT) syscall,
though.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 9026343b478..2b1dd745d13 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -109,6 +109,15 @@ abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
     gr[TARGET_REG_LR] = tswap32(env->regs[14]);
     gr[TARGET_REG_PC] = tswap32(env->regs[15]);
 
+    /*
+     * FreeBSD's get_mcontext doesn't save VFP info, but sets the pointer and
+     * size to zero.  Applications that need the VFP state use
+     * sysarch(ARM_GET_VFPSTATE) and are expected to adjust mcontext after that.
+     */
+    mcp->mc_vfp_size = 0;
+    mcp->mc_vfp_ptr = 0;
+    memset(&mcp->mc_spare, 0, sizeof(mcp->mc_spare));
+
     return 0;
 }
 
-- 
2.33.1


