Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7142E7FE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:44:00 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF4Z-0002Q0-6C
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcB-0006r6-VM
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:41 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcA-0002sd-GN
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id r2so7430327pgl.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuBUrcbK5IHnv9/MH2TrxQjSj4HGL7JlA8tE+X8E85A=;
 b=giCakC6l2MtvrckNHO00CDJOIHxjYyiiplMsqYrxIqY7SO11XjAkdl7LxsrcGAL39Z
 kg+U6SdomLFrTarLwoH76IJ+m7F9S9ufaoMWP433H4wFRsQJ5Mvs/d+wu82L1TMOa0+w
 wznc58l2+DtSlgByNYs/o9Y+CTD+7pFmjTKLdzYip32HwwDd2kq8OhlK6utG+JThcAQh
 xtTuPD3IkvreuKzlG4hAy8S+mtc9RNfWsUJxqB7jjep5vgaZfB1S9YAPzFbdeea9bE/N
 b5tOG7GqCzc9u/fzvs6Oz3jSrkte1GLF5V0+CCwHA3Jjw0UqnkxqmWUsbZs5EficOYiR
 zgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuBUrcbK5IHnv9/MH2TrxQjSj4HGL7JlA8tE+X8E85A=;
 b=mzXjpMN+wSWmq75H+0gST5AROvfFcVxbQGiicWp/wZeM0WY2bYhcdI/Ne789+R2eHE
 FtNWdOCT21GGEBtzi5SatGNKlz+nZ+SDyn9B3SXCdXcT529lt5Y0CtjrfoRTC+eRrfmF
 ql+8fL3yVvBm+kgPYmH+gx9qtzNZt6TCowDe1rDsYojxTspnbiOlPrkYYSNN+t5qkPPY
 fvY4NxoFRJXpk2moRRufUkoYGlzp+X90oD25ihwjeC/pu0AGTAqV2YzAM/7T1fOVBtli
 CZUyQblHUP4Exl5Gu7mW/kkIrewkRaH/cEjInkWxt29hPcQxh/z5+0G2h3Q6bAKA0QCT
 bFng==
X-Gm-Message-State: AOAM530A/Dw1wHaJecqYtzDkoUuD4T2NWdFTplLtZ5XwqJRitTMxuoZO
 2O9MWyMENiVyTCd7eYfl43SiEUnEhNc=
X-Google-Smtp-Source: ABdhPJy1EUFJmFetlUMUjzDWcwIA6wSmo07G9VldpWVaS1mhWvujnh9OEzrqyEqT00HibQtuiAxQjg==
X-Received: by 2002:a63:e116:: with SMTP id z22mr7227749pgh.223.1634271277080; 
 Thu, 14 Oct 2021 21:14:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 53/67] linux-user/hppa: Remove POWERPC_EXCP_ALIGN handling
Date: Thu, 14 Oct 2021 21:10:39 -0700
Message-Id: <20211015041053.2769193-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 840b23736b..483e669300 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -162,14 +162,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "External interrupt while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_ALIGN:    /* Alignment exception                   */
-            /* XXX: check this */
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
         case POWERPC_EXCP_HV_EMU:   /* HV emulation                          */
             /* XXX: check this */
-- 
2.25.1


