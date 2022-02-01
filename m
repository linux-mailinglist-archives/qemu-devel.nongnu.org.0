Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65B4A5B19
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:23:35 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErG2-0008Rp-Gs
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7n-0004vu-O8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:03 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=34396
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003XK-CI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:03 -0500
Received: by mail-io1-xd2d.google.com with SMTP id i62so20729526ioa.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iheEFnm845woGCplflIornHtpf/6w+qx7f7V6lapN5M=;
 b=aqhMsiiQ/oOqRrbnZA02xIWkFzZAAa5Q/JHzfj8yZztIHnn6U0cDpp7giKOhjktXme
 GuUnq2Y/Kdz4P2Wt/7ugCYeKDNaAdzJ8xMKIk10/CZj9d+JlsasmJ0ove3VYjYb0ep3n
 2ZJMgT5Lb9JUvfjZR/LbGB0+XzbJef3dHBF6cm7iB+M2yySXt01G9pXXsR/GoT0e0BBh
 MXArv801oC1Mdqi97z9DhbEAtYV+BMSQanD37CSY5qR/mOVij/7TfZnvPap2LyFQ3XSg
 1URkxTysj4FqUjZkKX9vtT5nTfTGNyKWVr02xZe8fkWpcmxfu44OGbFdlsqCL3oxHPq1
 4yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iheEFnm845woGCplflIornHtpf/6w+qx7f7V6lapN5M=;
 b=IKSY4UuGVn+gN+gAjsi+cX0cZf4Kv8mO3SDMainaEbkQTsUr4AoR2rf0hwxry49iag
 JtL8sR0O2mNxnyhAxnGkIEZ9cYK7MnJLPRClvkkOaJr35XVJXwC5xZH3yKJrC5H5cc8p
 szZ9ERzrQD8sPbBk9jHLyaGk3w94iGq08tSC+tXXVAI5ey0rtSXuQf+igHCg+2IwZ7/I
 mjrHZ+r3eAK+6yItUFUf0vZVsyTfCQDEZeN4ANaFdAjWn3mD8o8PBDtpkrtYtxjTt1gr
 miSmeMyBr61FERrT8MIiE8rZHZKAh3Yl2CeQgkTozSySppfEC+21CNYTVv2yEPE5ibUD
 K5Rg==
X-Gm-Message-State: AOAM532Sbn5lTpAJ2aWIeZz4n/Wj1LJlc9ng0fUowNr2WNN0GBMjI19l
 X1BLj5BWb/9sOkUgzdad7VGHUoO0CV9TgA==
X-Google-Smtp-Source: ABdhPJwiAj0b2ke46Cz39c3ids14KnovdI/bRXhHIjmofa3WRbvJeReHSx3DYuaUEY2YFpf1Z/IQ5g==
X-Received: by 2002:a05:6602:2c8d:: with SMTP id
 i13mr13830320iow.181.1643714095303; 
 Tue, 01 Feb 2022 03:14:55 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:54 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/22] bsd-user/x86_64/target_arch_thread.h: Assume a FreeBSD
 target
Date: Tue,  1 Feb 2022 04:14:40 -0700
Message-Id: <20220201111455.52511-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can't run on anything else, assume for the moment that this is
a FreeBSD target. In the future, we'll need to handle this properly via
some include file in bsd-user/*bsd/x86_64/mumble.h. There's a number of
other diffs that would be needed to make things work on OtherBSD, so it
doesn't make sense to preseve this one detail today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_arch_thread.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_thread.h b/bsd-user/x86_64/target_arch_thread.h
index d105e43fd35..b745d7ffeb7 100644
--- a/bsd-user/x86_64/target_arch_thread.h
+++ b/bsd-user/x86_64/target_arch_thread.h
@@ -32,9 +32,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     regs->rax = 0;
     regs->rsp = infop->start_stack;
     regs->rip = infop->entry;
-    if (bsd_type == target_freebsd) {
-        regs->rdi = infop->start_stack;
-    }
+    regs->rdi = infop->start_stack;
 }
 
 #endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.1


