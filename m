Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3C442D52
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:59:17 +0100 (CET)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsRg-000513-Js
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhC-0001Wj-LM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:14 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:45665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhA-0001zP-Oa
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:14 -0400
Received: by mail-qk1-x735.google.com with SMTP id n15so5726660qkp.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbVRREsh8zZn+CBQ6RQjqfCoQN/6HupmGu/vI+h3Hm8=;
 b=vD2gFwofre/RV+VxOjOxKCp22c/qqzQ6pZw6nefkI+YyCZqlIq7GnnqsJIMe6DC0g+
 Pqgkgjzer1ZxirHDjL3kze3pziC8v/Z5iYCc7vWxJUKQj3b6iwEWcvBv3IY7LmXgMYjm
 +uR5a/Gw3dVCt8bmplhnnofxuQpDF/YxpbWGHpeBZtalErywye0fJLiidnoye+0HoyAy
 oP6qmunBlYMWjaja6dNuumPJAjpAw3vLXIGTFL1OMZH0+yZmYyYFiuE/i72F13FDXS6l
 UDVcPgDcTfgmi/8rFD5ZW5qp7BYTD4L6GZmZmXgWX50+govv6KN2QxilALmwtXfm75BM
 5FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbVRREsh8zZn+CBQ6RQjqfCoQN/6HupmGu/vI+h3Hm8=;
 b=dX/8tGZbXwyelOAhXP3DSea8q0Rdivkexpig7FtVe7bgD07wVRSwI02wemaUjAZpgJ
 7o7Kuew1FWHodjlR6AOsqRqO85q4sN8prpimz63n/eI2XLaz3oruk5/zwAt9PSy29ltP
 yVq5Y4ZqCfy0oKQuJcmylqF+PrCXhOgMYgZMW2p/JrS1EY6MgbLeP6V3IcRBDyzXxaCn
 ZL8spfq7IdnT7pMNnwqrHYKAqQLM6lH/7bUBlaPrsWB3M/VawP3QM69kqqFzWkLflqe5
 B0DbtTEUdzTEBGYvQhfUmAEnvjoHgvNmMJx+YxlFs6WUJ5k2eYucIXTDmI0fQYxfv+Cc
 HEhQ==
X-Gm-Message-State: AOAM533XKEHY7SlpRzIr9AG8MgBIoUmTFwg+giQ3M8GB0sf5IOijHsen
 76muXE5Dqu5vuI5eGo76vb7hlv8BH1DcLQ==
X-Google-Smtp-Source: ABdhPJyV3zYRxsxYU5+mH5RyR06NDDcOAo5DyRZKw63bARSGa4sdFoH38ooer9fjAj48Ia6WHYly0g==
X-Received: by 2002:a05:620a:2954:: with SMTP id
 n20mr10164342qkp.472.1635851471884; 
 Tue, 02 Nov 2021 04:11:11 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/60] linux-user/ppc: Remove POWERPC_EXCP_ALIGN handling
Date: Tue,  2 Nov 2021 07:07:31 -0400
Message-Id: <20211102110740.215699-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


