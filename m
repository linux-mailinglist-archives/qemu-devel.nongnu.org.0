Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050CC3F8FDD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:23:49 +0200 (CEST)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMqi-0002S6-0m
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfp-0005io-OU
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:33 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfo-0006n2-Ah
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:33 -0400
Received: by mail-il1-x129.google.com with SMTP id j15so4765943ila.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GiaQIIYvzMX3kBsTWafB+XsF4D6nhHn7w46Aapsrz8s=;
 b=LAs8+ToliEcKEEyZjdCYGge8+7qLiaCSgX+Hi0Qv0lax1Phnwyx7I15w/TUGoQcjxi
 psMe75OhLT9PimifkAEEZ+RzJGA1rsD4Pc04zU/TXgprcIM540FQBycywBDo/IuVjHHg
 by3yi8ydt7QpgAYqemIAhG+BMfz00RzX0i8LBSiK6cCDOef69nkoOJXouR3TlJtPR5Ju
 wZF9SYX4pYwZWrpqFBWVVKrsKXu7nFgwFMMNoNbORShEoNfIFDwiweL0PpGxSDoNjeEe
 sEXLaQsp2e8WDs2wY/JSoUAQRWUZnjbwqGrZ/tXMMsNizb9Fa7GLPGqnoJFtprTwYHYC
 gHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GiaQIIYvzMX3kBsTWafB+XsF4D6nhHn7w46Aapsrz8s=;
 b=MOH03LjfiiY6fIxa5lUvb1pyxgQe2A3PDef3vq6KGVvXhW3kdmC0m32k1b+BPCmxrV
 AwXLyMxMd7k/kCrOx2zU6egCqBNL/WLvYI6fketGldqIq2w0/kKXk8Q7WbrjT6a+IquM
 d3fCvGf34SQmhRC92/T69mEQTj+UEWKuZCI880AXUZ5PP5AaSOV8Y6d6oPFzXVDHO7LL
 jGS19bdCytH4H+ppQK3pptpjUSIL23C7sY3rCJE/JMIbIh9LkufVNXA3ghWFdGeDQenb
 csMttdDfy+wLbA3FAoP5gQxKDA+3EpNC5Jn4C/MtUz1hwW6nzXHuf6HbmnemGofULicc
 eORA==
X-Gm-Message-State: AOAM533D63Rltw6yqpdRy2IkMUkWw9Y8aFUpjPjwEbGbpfx2RhSDTrkp
 B1zlAewDPxmSY4PrrByTnWqI7SzZhczCf8x7
X-Google-Smtp-Source: ABdhPJwzwuWJu1oTzjvrW/C9RPghQwIZytYNS9miCoUQaTzif89Ia7GPGdt2VcwgPKaETZj0V6UYjw==
X-Received: by 2002:a92:c808:: with SMTP id v8mr4090340iln.110.1630012350963; 
 Thu, 26 Aug 2021 14:12:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:30 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/43] bsd-user: Fix calculation of size to allocate
Date: Thu, 26 Aug 2021 15:11:27 -0600
Message-Id: <20210826211201.98877-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

It was incorrect to subtract off the size of an unsigned int here.  In
bsd-user fork, this change was made when moving the arch specific items
to specific files.  The size in BSD that's available for the arguments
does not need a return address subtracted from it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 5282a7c4f2..379015c744 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -143,10 +143,9 @@ int loader_exec(const char *filename, char **argv, char **envp,
                 struct target_pt_regs *regs, struct image_info *infop,
                 struct bsd_binprm *bprm)
 {
-    int retval;
-    int i;
+    int retval, i;
 
-    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
+    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES;
     for (i = 0; i < MAX_ARG_PAGES; i++) {       /* clear page-table */
         bprm->page[i] = NULL;
     }
-- 
2.32.0


