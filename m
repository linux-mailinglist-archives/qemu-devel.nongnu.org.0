Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FAD4A5020
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:29:52 +0100 (CET)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdJ9-0006DD-5e
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnd-0004rw-B4
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=41770
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcna-0002e0-D4
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:16 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q204so18390593iod.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0pz1mYsxMG+ZM0MzZl75FORMdT6nHp51WXALYPrt0k=;
 b=yKHIpUPvuC7CfZhUIVaY+eAB2DPGRXxwDGIQ2VklII+h4uSgW/BglKx0OpJlM7TCQJ
 X6Xj1do+Zksnouy5Mu48Gx2X44sTmxILp/kvTj+CONSF6UbQeegCILvJ6W/Tbnox4y5o
 xEg2rthXwoAmJlMUuK1y9oBvGIlqEWyIcTomiFKHULZtLaMDvYs1UxApIlj3dZ/X8Hiz
 uadT8Dbzum4cny1079jjtk419/hiXBCNuggS/TiV6yt28Bgxau+qqYM2mt7iHol2t5Oo
 or0UBlBsUOIRblNtp4SycxSCksLcIMBNZsYy/6yw3NFvy5lebaS6VpFWkypGyJS8eBQu
 kz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0pz1mYsxMG+ZM0MzZl75FORMdT6nHp51WXALYPrt0k=;
 b=fzJW2PZBjsIEWXiMtCxTIfnsFpW5M279L1xdH+3bc809WJDxxnAqWYXW3JoqkvcNVI
 E3p4lwAFA/aNgf/g2J1eNvuaL+PNmgen1ho67ihKINwZ6cF6dp/17NTFnjd140wgi0pf
 tPBxy0Y5NRpR+eXd3YZPCPwRRMBPRYLhf2h59b2nj+6VVaGDZhEVHZg6L0tFJf+FwmyL
 4M6KPyOgvb003+zi9VHq3LhxrsTjr236vb0QajxbewFcddnB82wdhRDOt9GGqiSmWW2x
 9rszJ58llCKVRspGssf7d3WNu1JBX8wMPal4m1kCDEYxiOAhJQXIIhA6VPN75LH07fYR
 F8gA==
X-Gm-Message-State: AOAM530BxZKyP3J0Y0vdxf4yR+arJ4tHkwnVZyGSQjcYYv6E8cXAg8Ok
 hJJEwQOTxhKPOEKMhk3tq6O3Na15GbfAGg==
X-Google-Smtp-Source: ABdhPJykNUcrpp7ibap7u7oVHWxyUdHqYyeYXAafgwch5ITwO6xih5FRJywOya+JIKKncQrHdTeHxw==
X-Received: by 2002:a05:6638:389a:: with SMTP id
 b26mr10820116jav.158.1643659004227; 
 Mon, 31 Jan 2022 11:56:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/40] bsd-user/arm/target_arch_cpu.h: Use force_sig_fault for
 EXCP_UDEF
Date: Mon, 31 Jan 2022 12:56:10 -0700
Message-Id: <20220131195636.31991-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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

Use force_sig_fault to implement unknown opcode. This just uninlines
that function, so simplify things by using it. Fold in EXCP_NOCP and
EXCP_INVSTATE, as is done in linux-user. Make a note about slight
differences with FreeBSD in case any of them turn out to be important
later.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 905f13aa1b9..9d790176420 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -51,18 +51,19 @@ static inline void target_cpu_loop(CPUARMState *env)
         process_queued_cpu_work(cs);
         switch (trapnr) {
         case EXCP_UDEF:
-            {
-                /* See arm/arm/undefined.c undefinedinstruction(); */
-                info.si_addr = env->regs[15];
-
-                /* illegal instruction */
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                queue_signal(env, info.si_signo, &info);
-
-                /* TODO: What about instruction emulation? */
-            }
+        case EXCP_NOCP:
+        case EXCP_INVSTATE:
+            /*
+             * See arm/arm/undefined.c undefinedinstruction();
+             *
+             * A number of details aren't emulated (they likely don't matter):
+             * o Misaligned PC generates ILL_ILLADR (these can't come from qemu)
+             * o Thumb-2 instructions generate ILLADR
+             * o Both modes implement coprocessor instructions, which we don't
+             *   do here. FreeBSD just implements them for the VFP coprocessor
+             *   and special kernel breakpoints, trace points, dtrace, etc.
+             */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->regs[15]);
             break;
         case EXCP_SWI:
             {
-- 
2.33.1


