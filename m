Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32834E6EBE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:21:36 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXeGN-0004p3-QI
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:21:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2W-00081T-Qi
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:18 -0400
Received: from [2a00:1450:4864:20::62f] (port=35798
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2V-0000YZ-8w
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:16 -0400
Received: by mail-ej1-x62f.google.com with SMTP id yy13so13566111ejb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOXukSeGvKPa/jn/RHjHjBTNJmqDlyXvTERfCqrhePE=;
 b=IKZjaEZD6yk2Tfm6RtJoMOnOxP/xk9yrOi4hAQYY3UNLMaYBxivVsZ62Wrj0h2hxyl
 wSY3Zh9Uf6WnUIzqf/EruI8sCCqruJSvyb4K5L5QyOvoj45tF3XWNYAtHTvzaIzB4Ip2
 k9zb15zJTyWj6ab7pbX8cCHasdA8OBawulZXyxfxcN/lfX+e7ZkM5lb1iJMeOoP4Z3F4
 hugev2ub2VTWReqvg+xStgZND04Gp0FvhSeZLOoWVaoYLtM4j2l+DAD0Zb1V4Iil3Yab
 xD7biuKNsczjj2Xxi76Yoib6RBqVsrJBlMkYLFFv2Vs0i8uuvGUtU8Nu7DdTkZEbI6Ri
 dGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KOXukSeGvKPa/jn/RHjHjBTNJmqDlyXvTERfCqrhePE=;
 b=LCmAc0GA3jeCCXK6+HfQd/jQ6adpcyqO66ZEFLXfnVWnC/ST0us1bZz2Rd9HZ2RuLI
 26N1uX7DWMeNpdPXI15sIvuFGsFZ0QSxLd6KSWXLwo2qng8gvTbKcS4fdbNtva2shgVM
 ++3YWCkNuJYbDLa+IKa5d3ur8D2d7uHahroH0OW5wL8/Slc8VX7B2VQawkWYIkW74x9G
 AjhihU3ZNnww1VCdkoQp4fjrqjoxPOAVV+2hLv2LeDi4oB7Ede5IdNItucsRKix7dGGX
 ZYrwBhKMkz1eUCQ4D2y9fQ4QFN/Mb8Fmq6WWpR9DImGP4T4fVd8/wuzTRP/sIz3ljxKQ
 Hi8Q==
X-Gm-Message-State: AOAM532xLzapRkMa+x8svNvP5gwb2TQm3oGNUrXfsYoWurhbgHqlI2Qe
 GYkLiSlvQEqvmM43P31oOH/LFpLMpQo=
X-Google-Smtp-Source: ABdhPJx18cqf+GTCRxuKcCGFJitzFmHvUT9z1wPc1YNbBbwhOSTOT9MX1SFydTbMPXG1Y+vMMX7itg==
X-Received: by 2002:a17:907:1c29:b0:6df:f779:f122 with SMTP id
 nc41-20020a1709071c2900b006dff779f122mr9904802ejc.637.1648192033896; 
 Fri, 25 Mar 2022 00:07:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] build: disable fcf-protection on -march=486 -m16
Date: Fri, 25 Mar 2022 08:07:06 +0100
Message-Id: <20220325070706.271291-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
References: <20220325070706.271291-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Ehrhardt <christian.ehrhardt@canonical.com>

Some of the roms build with -march=i486 -m16 which is incompatible
with -fcf-protection. That in turn is can be set by default, for
example in Ubuntu [1].
That causes:
 cc1: error: ‘-fcf-protection’ is not compatible with this target

This won't work on -march=i486 -m16 and no matter if set or not we can
override it to "none" if the option is known to the compiler to be
able to build reliably.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889

[1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection

Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 5d55d25acc..f1ef898073 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -14,6 +14,10 @@ cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
 
 override CFLAGS += -march=i486 -Wall
 
+# If -fcf-protection is enabled in flags or compiler defaults that will
+# conflict with -march=i486
+override CFLAGS += $(call cc-option, -fcf-protection=none)
+
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
-- 
2.35.1


