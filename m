Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B52403081
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 23:56:37 +0200 (CEST)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNj52-0000bB-EF
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 17:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2L-0005iT-8u
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:49 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2J-0000lr-NZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:49 -0400
Received: by mail-il1-x12c.google.com with SMTP id v16so150492ilo.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GiaQIIYvzMX3kBsTWafB+XsF4D6nhHn7w46Aapsrz8s=;
 b=cBEe+ihCDlFBfUGAmrSyLq40+gG5F2opVrXyU8kqo0AxxTTpzRhEDBRzu0RZOrpyTJ
 Kcx8ZeG07Ey6aaN9/yNTBK6nffQwaXuEjkAm2bgLpUvZiY5j+9wvBs3iN8lBvzF/nSPb
 gnFhu9MyVspPtKMim4BiQTYsTB63EtyjA+2Q0PFXqU2fYuxvrTWWtaSMgqfMfHQOksgn
 JFU1p37wIyjGH8PLdVhU0O/67NIr0VSquNnCHlIdRmpa0+ZCo23zkCav9/TQh9XWF/Bo
 9Ccdluea2whzdEm4p2So+r/i2VkA3PZ26xyqeOwOuvdKyNOlXCKo9HU5PR6cuoooP312
 K7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GiaQIIYvzMX3kBsTWafB+XsF4D6nhHn7w46Aapsrz8s=;
 b=gIZcU80JjL+94nFc6+3yo7Vhqblz7z3C4HbAeHtz3vzZJIUajnVGkeP2erlevtgETO
 J81xsF/zimp1xFrK1dkOFq0djUB0b7YQ4ilYVDc3pErukYKsibhzayRpf3lrragh/34R
 GnEUy+VqcIEHDmCxm4fQHTEq7Vg7xyxvXc5sbEuuOp0EgtM9mZh7wITXjG2KdrVCezBa
 AcL3s7XjO3y2fO+19opSIcyZ5Ao62ZjjMCRoTEWPL09G0FsL1+9kyKBgjdjJ8WY7z2yu
 yy/MOpxAWb7+9lZCuMwT8CE0Ac3TMgjlSOUNIkAnHnXOgB0huDqCbCc5ssSqA28Uw1a5
 RU5w==
X-Gm-Message-State: AOAM530CZUa24S/DaH7MfEHCk7cDjMTSo7zZ6JGrNY3zYdqYFLMnZeEU
 SEzc1YJWeiJWKhNRs+a2+Arp9ksPRNDvyESMors=
X-Google-Smtp-Source: ABdhPJynLcqyGFc3ugFjcwsnM1ZQkxTDEzZwy8MmySqYO4T3rzAWvTyMVX9uriL7nda+PEEAsvRHjw==
X-Received: by 2002:a05:6e02:12c2:: with SMTP id
 i2mr287565ilm.261.1631051626474; 
 Tue, 07 Sep 2021 14:53:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:45 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 09/42] bsd-user: Fix calculation of size to allocate
Date: Tue,  7 Sep 2021 15:52:59 -0600
Message-Id: <20210907215332.30737-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
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


