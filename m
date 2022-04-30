Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBD2515FB2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:56:03 +0200 (CEST)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrK5-0007Ia-Vm
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHx-0004Xb-UP
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHw-00081D-5i
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso4384580pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1b49PBr+T1730mSFSrp1OrknmNb0ysNKYnsC6xH7ni4=;
 b=cojVkoZ/G4KKCo3PbhnBDWjuxknpQclBP8uqcl04Q/gV8LgNzofrMGJPP3QSvfk42A
 w866+5oSGKhmR82gvqsmEJqwn9atPVmcam40JjcLxNH77RCOW8wmLyQAby2cmpmcjmYC
 SueQ0bzXuTs/+eVuZRd11PC6tmdmlnhpm8V3BzwQZHizN+CN85K/lYbaH1tKTuAg5pjV
 2lS7yQD9nyLvRGE5OSYbPpfFtv9awVYTWbT+bpbles5j9dqVfQbqDLtdG/xfCpyeEVJ6
 nm6uhHJ+r0lpGnuWQto0wT8OWoW/1JrEA/7D2sUUw91ErOykrWTPidy0LhCryNulIp26
 NcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1b49PBr+T1730mSFSrp1OrknmNb0ysNKYnsC6xH7ni4=;
 b=4guE2By2GGqPZdZ2kpb8vlGpUurHl4JK/4RQa5lgSlJhfxRG0kRLFYiPk1rHQJYCBQ
 SmONsboyyPQQCByEI25LqmeSzUeQnFbywWQhT6SD+z1BYu9YRE5fRe1GNbCYj9+VG3Za
 KbojlmdrrVQ8zgHdl0ys0EM64SQjT3kg00KbBOXVL3JVIXU29yvsropF/HhkJFX3inAY
 UkQPqBps+zVgLgAVBAuKIkcz90LdggvYbyK2Xv/1iQ/77c4KFFrUz6KcdyaB7Dm+w/H9
 2wlJuZ+X16B1kJO7SfYcwbj0fbU4WTywqAQKjPQp9x44E7AQJ6brmmuqpXbC6jJxjN0v
 ONMw==
X-Gm-Message-State: AOAM532EfKMv3xR74M7Dgwfsv+001zkomNGdDbJ9zfHWbd0ZF12YPzop
 YkR62zlEtXBOWYPJy3+rhCjtkTBPyS7VAQ==
X-Google-Smtp-Source: ABdhPJzmWDMDkKD2x8yRpI3zVld06ZVUim95zLAGwdqJIM5tdNCz3ZhuMfSUT3wRet7/AkkBlpSStA==
X-Received: by 2002:a17:902:db0a:b0:15c:e8bf:f9d with SMTP id
 m10-20020a170902db0a00b0015ce8bf0f9dmr4731231plx.103.1651341226881; 
 Sat, 30 Apr 2022 10:53:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/17] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Date: Sat, 30 Apr 2022 10:53:29 -0700
Message-Id: <20220430175342.370628-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are raised by guest instructions, and should not
fall through into the default abort case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 56417f7401..6ca3e1e63a 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -44,6 +44,7 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
+        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
@@ -76,6 +77,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
+        case EXCP_TRAP15:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
-- 
2.34.1


