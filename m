Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397134C778F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:23:11 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkfu-0003BZ-Aj
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUy-0008If-Id
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:52 -0500
Received: from [2607:f8b0:4864:20::12d] (port=44977
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUx-0006aD-3R
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:52 -0500
Received: by mail-il1-x12d.google.com with SMTP id 9so10621911ily.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TkBhosKWDfacU7putxgRWL5fb9CqDgt1oqt0mYy2nvk=;
 b=YUeuatqdsuzl28UADvUu7KgYi1D6B34H5xVb1a/pohSk3Z1uenphHGj1WvFbV92z1W
 Mqmqc7TVa6N9DkN3TxDtV39eHEbdPx6sQLv7gQgj26mLfd7uxiR+ySPZUFeOk2cffkXs
 kHm2k+veg62C2e6yCaAPEojCtS98mNHnmTyiM82XoM6+T7tT41Jz80Qldfrj2HQUoUrq
 5HmphSWVAbfJnbxHrNb4aaLzT22coOo8eHMA8BB9Mr1QFPRaf/FIHYHMsFLBnFzgWiO7
 4xXNjLkX1RkcMDIEfFvRM2InXdtb1MC+hs1ij8+3Z+wDHGnAS8us8z8o8QHlQzWBOxUy
 gU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkBhosKWDfacU7putxgRWL5fb9CqDgt1oqt0mYy2nvk=;
 b=AaydptwF7c1u47C/rZox2LAsYdHZy19qesdKu7I1g2EAg6TrUScoHzD96NkoPA2ump
 QnT3rTmsYo5nZJPyPAfs7q7zZFzYeaZQWuek5e3C6WkNWESCXCltBB7Y9yJ6maRM5MoW
 BhFwQABBBvOz++302PGxVhEvQnGSERvNih1nRiiFTQDqbsgBniTCPv876E36UWvDvCVJ
 0yWbbcIUIuo2rcxgUyvxflVc3xxPR7sWgmnKI94g+mObfrJzsdig0oUWiz+0GbqhiYQb
 rU3QgUsVpyrvDZ89CilL7GGoqTyK/9P09sevwpoFjrcinyiX8hck77wgv0QoPA1ItEPt
 z2vg==
X-Gm-Message-State: AOAM533/JSFC6CdwTXCy95W+gFK5wnS8sYIvm0N6qgSdE1J/3bODqVDr
 xQKKD9ffwZxpd2F4IP5UXvq336ptuF3OLw==
X-Google-Smtp-Source: ABdhPJyaOu3UOy7KJxzlPHe/G1hKS13AGOnBLy/x8X/GRzWYP0CY+4CSs1M3O4DQM8KAj3KKXrRIOQ==
X-Received: by 2002:a92:ddc7:0:b0:2c2:91f5:146b with SMTP id
 d7-20020a92ddc7000000b002c291f5146bmr20354020ilr.21.1646071909890; 
 Mon, 28 Feb 2022 10:11:49 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:49 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] bsd-user: Remove bsd_type
Date: Mon, 28 Feb 2022 11:12:06 -0700
Message-Id: <20220228181214.2602-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove keeping track of which type of bsd we're running on. It's no
longer referenced in the code. Building bsd-user on NetBSD or OpenBSD
isn't possible, let alone running that code. Stop pretending that we can
do the cross BSD thing since there's been a large divergence since 2000
that makes this nearly impossible between FreeBSD and {Net,Open}BSD and
at least quite difficult between NetBSD and OpenBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 2 --
 bsd-user/qemu.h | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index bddb830e99b..88d347d05eb 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -96,7 +96,6 @@ unsigned long reserved_va;
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
-enum BSDType bsd_type;
 char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
 
 unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
@@ -284,7 +283,6 @@ int main(int argc, char **argv)
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
-    bsd_type = HOST_DEFAULT_BSD_TYPE;
     char *argv0 = NULL;
 
     adjust_ssize();
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 02921ac8b3b..e5742bd6c03 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -29,13 +29,6 @@
 
 extern char **environ;
 
-enum BSDType {
-    target_freebsd,
-    target_netbsd,
-    target_openbsd,
-};
-extern enum BSDType bsd_type;
-
 #include "exec/user/thunk.h"
 #include "target_arch.h"
 #include "syscall_defs.h"
-- 
2.33.1


