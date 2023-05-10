Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3806FE14A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:11:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPG-0006sz-7z; Wed, 10 May 2023 11:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPE-0006rM-46
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPB-0001Vb-HY
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315712406so251112255e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731220; x=1686323220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hip+YGE5pxFrA4N2S9fipS+cB+XrCAPV4NMoBvIAnw=;
 b=HbWW3eV4bmsvXJxTyYVr7SmhdeAo2LcDE30/sXdotGKWG6hqVwSg5JmR8ITfjKf/Ho
 dTE9NGUSfK7Vw4dXba2mbjuhd/Lz5e2xtCBtJMtn9iY9xg6tlGK6uzR1SWtGseqVouME
 WKiJ2k51jGEDKRk/31n3UHR3a/Ty4HpPa/2+NzQHEfdN2zXR3jVn0IXu4d2M3JppmNAt
 xnbZWACy5+xQcFPgiANvoSLHqNlnkQ3r241YmI87XQ8Z1mKHDY5vMizP/j7xbZwPJxUU
 HmRi50ZiIfKjJrEdcHky3CPPeI8g6Hd5vDJbtRKhpnmwpjILZF8QQ5JlHDG8GcwlP0rL
 dZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731220; x=1686323220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hip+YGE5pxFrA4N2S9fipS+cB+XrCAPV4NMoBvIAnw=;
 b=JgEHgtopNuOF0eZDF3uWu/eNRJvQ6QyDIOA5ft17nOXPE/GNi7KHZfLVd2vvqacW/4
 FXJmeAhEKJaxbq2xI9/AUSbBPrvMfgxb90GZ3gtt6Qunh/7NKGXZbKhoAGElB2720Nrj
 BtGjSB/a2jgt4ymRPSfPm80NK8wT/VeE2emomqcD/IQs6tSkdJSVxxRNTJORaI1jOro/
 G0CVZ5cBhdI+xu7kPKtrONJYTiq86Aav2jCZ3c50quTHitcKrO4GK5V47F3k4r5/YBeR
 V7wTDfNI09eaUNw5eGsdzcfC/gjIMDLvLVe1gw62KlZRgZ7Oq2zZS7JXs8n5rcXUD/qU
 ZO+A==
X-Gm-Message-State: AC+VfDy4RrGOsci00S64dUoEgfI1226M8nRLqJplKdbOwtBNa0lw3zb1
 p+XnDZUf3Ci25k5TUcmyFrJlHA==
X-Google-Smtp-Source: ACHHUZ4Jhj/KGpx0Bsf6tLItdUIJuEUPx54CaXwOuB/yCjCV8bC1hLnEnqaETpTzsosvlIugYHjHQg==
X-Received: by 2002:adf:e948:0:b0:306:2c20:c4fb with SMTP id
 m8-20020adfe948000000b003062c20c4fbmr17446831wrn.2.1683731219922; 
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d694f000000b00306415ac69asm17588677wrw.15.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D8BA01FFBD;
 Wed, 10 May 2023 16:06:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/8] docs: document breakpoint and watchpoint support
Date: Wed, 10 May 2023 16:06:52 +0100
Message-Id: <20230510150658.1399087-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This varies by accelerator. Also mention the modern bear trap that is
ASLR.

Message-Id: <20230503091244.1450613-4-alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 453eb73f6c..7d3718deef 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -46,6 +46,28 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
+Breakpoint and Watchpoint support
+=================================
+
+While GDB can always fall back to inserting breakpoints into memory
+(if writable) other features are very much dependent on support of the
+accelerator. For TCG system emulation we advertise an infinite number
+of hardware assisted breakpoints and watchpoints. For other
+accelerators it will depend on if support has been added (see
+supports_guest_debug and related hooks in AccelOpsClass).
+
+As TCG cannot track all memory accesses in user-mode there is no
+support for watchpoints.
+
+Relocating code
+---------------
+
+On modern kernels confusion can be caused by code being relocated by
+features such as address space layout randomisation. To avoid
+confusion when debugging such things you either need to update gdb's
+view of where things are in memory or perhaps more trivially disable
+ASLR when booting the system.
+
 Debugging multicore machines
 ============================
 
-- 
2.39.2


