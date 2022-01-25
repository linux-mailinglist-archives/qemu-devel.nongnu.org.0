Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7449A211
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:35:00 +0100 (CET)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAjc-0004nu-1R
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAem-0001lt-0k
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:00 -0500
Received: from [2607:f8b0:4864:20::d29] (port=33509
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAek-0001Ko-C7
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:59 -0500
Received: by mail-io1-xd29.google.com with SMTP id y84so5491458iof.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkYatV3ZgRqTPknoAin9rpPN5p7SZS/B/G0X4rcmyM8=;
 b=edUW7AeCsYWIwd9qLyg1cE9GrYuGKnogwD4lGQe0BHQ/knT78wxPOwrZcYrUELxj8G
 eQy9FtzKKN67h81CWY5pPyFy4xbMnzxtcqbFI2CZ0dUnvN9soPvbfyODW8c9su/V0LAA
 kRVx2QqRaOsNSda2x3StV6M4mM4VqBlT54Bj9St2qkU2BxARqP/gHF/2I0FwE/FbjwVe
 wntBr0PblKboJ45dtfqYIyvgtB5lEF4GRLPcNd08PQ9p2WR0W2SpNgVGnrO9AwWztEpq
 ibW4/qjZffRDgNAAoDWQpNxXUOJ/yobNMT697+c2ugtlwJDIQ5irhw1PWsByc/J/ohP6
 zMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkYatV3ZgRqTPknoAin9rpPN5p7SZS/B/G0X4rcmyM8=;
 b=3iUxAaAi/lmMifSepNEQrS/J2PA0TSqgN/F1IcVRoteytLKIRwv5lVGBicJ8AUDvHb
 e6RWDBnT0ImcLhWJr9pC4C+cgvHonYcXeagQzxibkSIpk9kEau4iBd+eiMLdN2ttnNJt
 L9eTB42Mh/4nXrWrBuafJ7inO5eHXOO6+pAZGztY0WIUibXLP+YXb5x05G5/f3dBl2Bq
 VIHHInaCuRkHf2qWYXVYYnBPH2WAHYR/BG9IRl470MD7T2eTBzzgu/Q2Hyo0y1AWYADb
 mGSQFWYM2UFrN9mJdV74IhPxck6vARXiQc4S7VX3ZzS+dkQlz/JCzFgqD42sIA2mO038
 OuxQ==
X-Gm-Message-State: AOAM5317GrXZVo/VFIzVqheOm1noSbByrImVnGTuUXGWOOOoyW2sg+C0
 Y0dI1kTxFydtNlcxv0Z7yLLeph9/uOlpLA==
X-Google-Smtp-Source: ABdhPJxIEIndr7G3SIvRtdEHY1/W4GMEpJo89teh6IULZsduL6/LSNsGoGRhtg1LtGRCpFDRSVIFAQ==
X-Received: by 2002:a5d:9851:: with SMTP id p17mr9780784ios.85.1643074196955; 
 Mon, 24 Jan 2022 17:29:56 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/40] bsd-user/arm/signal.c: get_mcontext should zero vfp
 data
Date: Mon, 24 Jan 2022 18:29:11 -0700
Message-Id: <20220125012947.14974-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
---
 bsd-user/arm/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 9026343b478..6eadc6e3c56 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -109,6 +109,14 @@ abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
     gr[TARGET_REG_LR] = tswap32(env->regs[14]);
     gr[TARGET_REG_PC] = tswap32(env->regs[15]);
 
+    /*
+     * FreeBSD's set_mcontext doesn't save VFP info, but blanks it out instead.
+     * Instead, sysarch(ARM_GET_VFPSTATE) is used instead.
+     */
+    mcp->mc_vfp_size = 0;
+    mcp->mc_vfp_ptr = 0;
+    memset(&mcp->mc_spare, 0, sizeof(mcp->mc_spare));
+
     return 0;
 }
 
-- 
2.33.1


