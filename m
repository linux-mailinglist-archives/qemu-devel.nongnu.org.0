Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F034441FD1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:11:43 +0100 (CET)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbmY-0006QS-Ho
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9E-00081a-6Z
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:04 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9C-0001DO-3j
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:03 -0400
Received: by mail-qk1-x735.google.com with SMTP id az8so6051712qkb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbVRREsh8zZn+CBQ6RQjqfCoQN/6HupmGu/vI+h3Hm8=;
 b=vxu5Sn9KbBVAMZWGRzXQGpwfoZLC6NzqkTiTlVbwW/IOYozD/smljBNqBkFie22ecR
 Vl0ickzmGezIJ5nkixbalCQdyLzbwOzouCxfhHOpKnpyNMygyzuqdyHj90I7/rNuUtVn
 aXsgFwNhXbCjWd8/OWetWl6z0nwWYYUv553xbnU7TqF2zoNPmBAxI6pyD5v1WQ5HLsX6
 RiIhpi3O1vfLP9WprNe7OUVrvAh5aa9BcO2kYoS52sXBtD86CbphMox92V9ITCGNPCy2
 GqZ8jlNIaERhoywEJF4hRngs+SWN5DOs6jnH6wn/HLeHOTmygrhQ9ltBo3ZFV84UPGr9
 6BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbVRREsh8zZn+CBQ6RQjqfCoQN/6HupmGu/vI+h3Hm8=;
 b=vQZM/Z7PTpRDvdqMCyBRack214ls04ZPG6fynCw0czBow5eqES9g7nHwhe/TYG7T4k
 V+vKAezRcenVY3OCHkfpxJ+39J0yqWy/1wJLFQefCmrlnU+SUQ7rhWqw6y1zHX6ZyAlX
 nP4GKQabZ/jXOlsOl/I617JN+kCGuw1i+kc+Yo3OzyCcBSWwtNK7mu95FkZcnUioX9Gb
 UCW8ekHcGNub7vnDsTn80DPBygW0lkbqC7xQNmvEBFj5DTgHB7fW9GNTlgxmNTlDSGFU
 y3l+sAl3jkqNVyfhGpoZDiLNYaBmFoHdPo6JN6KvPzvbIAEiAjnEN5Z1iZkEH6xNmhWj
 lclg==
X-Gm-Message-State: AOAM532mW/Egc3+43np1DtsTrmI5to6wouqBSqRFZLNywDLl7lq0ezHa
 HFInf2K3I3ja7/xvn25YQohBtslauZLS2Q==
X-Google-Smtp-Source: ABdhPJxg5js9RGd/ZY8hC2cTZFJsfD/u95OiNq/WcxKt1JXpDwJSqMiFsKjIAFhiklruBFH4Io6mpA==
X-Received: by 2002:ae9:ea19:: with SMTP id f25mr23885100qkg.341.1635787861192; 
 Mon, 01 Nov 2021 10:31:01 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 51/60] linux-user/ppc: Remove POWERPC_EXCP_ALIGN handling
Date: Mon,  1 Nov 2021 13:27:20 -0400
Message-Id: <20211101172729.23149-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
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


