Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B574A046E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:43:10 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDatZ-00015D-HQ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:43:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafj-0000cV-U2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:52 -0500
Received: from [2607:f8b0:4864:20::d31] (port=46958
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001a6-Kq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:51 -0500
Received: by mail-io1-xd31.google.com with SMTP id e79so9637260iof.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0pz1mYsxMG+ZM0MzZl75FORMdT6nHp51WXALYPrt0k=;
 b=xSRPQRbiZtFVU3uJ2oInngkgw+MOwuE36L8TW3aA3a6dz9yQPFXS6m6v4pLlVYDonh
 Moj/cJhQ/Bgy7dAvfCRBGbeprDt1kApIRfd2OVjp01tVQYD/fBT9KQNJAf3tEK0qGWaR
 kHinkzDygUayrqqOC82XMIKz2fkUvdxXQgjqTz+T8ynRgyPkMJP94oQY0mJ31HMgRd3M
 MvyXiVjOncewZbvW9Th1t+nksAo6f8ZG5oyQhbUA07PB4sdFinXpDngZrQknxxfnVJmj
 9qF+dqutqd6CJPPjtCt5h5OjNnbbF/E7t1TW9imFps6OsF/y1Fk72egm76R+JB+A0Hyz
 LEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0pz1mYsxMG+ZM0MzZl75FORMdT6nHp51WXALYPrt0k=;
 b=36snB8/0plPg5Nfu0ckIEh1AOrMMP6rlcXWOFDYLZE2tOIL0mxymjdh6wfONWpkmnt
 v+B8weTVxAFkHD5sZQVPZxiWqBb8RPs56ufMZVZ6L03OwsXFPuJ7G3LMrdkxzZP7hsOx
 vzp301c2T1DVcwf/4Hwm360WGq/DEcsaxaVWEz9RlC2dU5yGjLLE9Qz//Yx84sKXLSNc
 1VtLnG/uYMmGn6SLOwvhOfhQoP5lGXc3+hn7tlvcMPBSoZ0PHSC2hYg8tpKOhD3m0Iwe
 /APkNO1nbnRPLzmWQAU0MZaMaGkcwmCKDgmqsjVp0iYc995iUtVeMno4Fiq25APYa6Zs
 8eNQ==
X-Gm-Message-State: AOAM530lB0taL5gsNRt9/rlXVm/SSg8dKy6wOtn0/d11L5frdU0UVtGC
 8w8goEVwrBAkLobPvy6uPdwIpzW3MmMSXw==
X-Google-Smtp-Source: ABdhPJyEG7mZ1fiJgIChqa6c9iLD0dBZPi5yNopKLqBL5ASZ0jQK8vqo74M2r4cN8L2UZH2G6hVkdQ==
X-Received: by 2002:a05:6602:1409:: with SMTP id
 t9mr6507399iov.176.1643412496927; 
 Fri, 28 Jan 2022 15:28:16 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/40] bsd-user/arm/target_arch_cpu.h: Use force_sig_fault
 for EXCP_UDEF
Date: Fri, 28 Jan 2022 16:27:39 -0700
Message-Id: <20220128232805.86191-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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


