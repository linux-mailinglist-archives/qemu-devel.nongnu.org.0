Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9C04A5028
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:32:57 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdM8-0007kA-W5
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:32:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnZ-0004k6-Ud
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: from [2607:f8b0:4864:20::d32] (port=39854
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmx-0002bN-Ty
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:39 -0500
Received: by mail-io1-xd32.google.com with SMTP id c188so18402672iof.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9zDtgXS+L05+ekpD7VMpQo1Lh9R8HC1kSXvuE27qsY=;
 b=5At6AW7jsIGvsHhzFugiT8MsmO/itxFMr8HZKsadLx2pt0ceMHGSRAUgPh/FfXxFGA
 eTorMgkl4bgpx+O5BFLkFplGVbfRNXmIDYEECjo+CQmn5+SgjTCFU1wawFLPWzc5Q846
 T0sx5lB3wtjY5lDnL6cQh0QEeudIu8hpE+vPjr7q1fmVFYPknI7IVM4/yadOT1pnr8Bm
 FYel4EISo3kOc7PqAxNvyYFkXoFgVmg2x9Lp0vSn9ZJj/3phhar5wCoRNrPSuh0ClfQZ
 xbdjc7iuyNHRd/jw16oTfT47UwY6r4n/hUMubxUKvaS8vwgrXl51sO1w7p8Gz2ut6iFv
 QyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9zDtgXS+L05+ekpD7VMpQo1Lh9R8HC1kSXvuE27qsY=;
 b=z6ZjYIoHcUeB7W5YauCt7SlmMkd3/njJH3ySqFEGYoy9IVKK69HafOYigAl7wu1EQ+
 DMGTOMQ8SGdwSo8ItWVFrj17sXXeUJwvE9XhhhlKwPjvYWpBHjCAePhnKCAjgFBT5xP+
 7l+5xxF7iJXGTGJHoJ8n7eua2cQ7OqfK9p+7smKFTu3YwDemO4vhgZvECFOaeAW/SETZ
 Xw+8nB7WxIulGQkv8AjVud907BHZcGk70rJ098kcyW9U8Rn3gxJmLZwTezR8gkVxbVij
 8st/AsxKYR46j6hjNR5ycd/PNAPt5uancaFsiksV+N2uGRr4FIBVWLe9EbyCaCMXcAyU
 gkUw==
X-Gm-Message-State: AOAM531gBxTZPuvy5sMtbQd6qNbMdVTM0o2qO/7uNTtd42HhvRDz41YA
 VLkMwb2Czln1e6gQMrLAPFq5HcwtjIqJEQ==
X-Google-Smtp-Source: ABdhPJyF4ITUXFo7axp7m/nsLzt4J5K8DLS2AxhwGkMRHoWzOnGPTc37sOHrTP38PWRuSbc494J7Xg==
X-Received: by 2002:a5e:8406:: with SMTP id h6mr12194987ioj.144.1643658994519; 
 Mon, 31 Jan 2022 11:56:34 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/40] bsd-user/arm/signal.c: get_mcontext should zero vfp data
Date: Mon, 31 Jan 2022 12:56:00 -0700
Message-Id: <20220131195636.31991-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


