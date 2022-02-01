Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793194A5B16
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:23:31 +0100 (CET)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErFy-0008GG-KC
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7m-0004sC-9g
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:02 -0500
Received: from [2607:f8b0:4864:20::12a] (port=38664
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003XQ-6j
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:01 -0500
Received: by mail-il1-x12a.google.com with SMTP id i1so13977529ils.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4kADzTN0Wer67ApqMOj+RmImF1jg1CJ8Ks/jZVYJzOM=;
 b=RLzhsyBwgZPNo0G4sAGZ5ac2WuVtnyb8W2jy9gcjIoN6l+KLgTQQbar6LRliXrmw1R
 Ma/n9bqaPdEaOo6xzXnpq+E6eRywGT8nRtubGszR8JFePwXDnULs+PODkAHLlRSdcXPh
 fqk3sLIDQOVaBZmVIyXIGDcSF0o5DlMN36kX3+vxbHe0Dra3Rq0tpuDJaeZPD1vtEHYm
 gWr1YFcrPd5MqQFK5QlFTvNflcfJjwj4WNwWt371teDbhyyTWLQHHJUT064eHVXfBDAx
 EnsTGt7kAwTXG2tkGfD6vephUI7Uh1D9nmwKvoHo9Ix0qIipWGSoHN3Op++8ZTAlCB42
 d1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4kADzTN0Wer67ApqMOj+RmImF1jg1CJ8Ks/jZVYJzOM=;
 b=i0KnHEMzjIQvvgTUcHrR1JTT7qVwXPA+HwEo9NLLX+zgRsXjfZE6TEHVKl7ofculhk
 7pbFXTkc57nyrTBWx+bvVjUYg49sBlvzFhl2I5QksuTpgeZFp2a03lcVkvQVM6uZ6Hwm
 i9EDMwcqKpP03xSGV9p6oaXV6acHNqIebJHhh13dHcyADhLxaCfjqXWq99/4H486cqpC
 Bv8+spT/YaVkvGLo6GVaACJs3vvzFFWZM1PeFkOoDBzrfaEdJ7oJBp49KvGsoh3bYbw6
 huFxWq9/3vHGx8YrQWZsdYoadkih39lS5ocrsvoDDheVKIhck25WhYtzTcRFoyQCPg5X
 TXoQ==
X-Gm-Message-State: AOAM531Cd3AuZGONBLGIu7yjnYjaNBVhjU96G2xaKw/feOPj1zprHQU+
 Ysl0Q1u5BZStx3kjWbfAc5Z6n4fX0cnpXA==
X-Google-Smtp-Source: ABdhPJxK6qLLkJj5GNrGpHLOIAv7e/38sEYxWdfLPf/ErrqegGVTz5k9jXvlNBnTxCw25yJei9lH3g==
X-Received: by 2002:a05:6e02:1aaf:: with SMTP id
 l15mr14127213ilv.31.1643714096235; 
 Tue, 01 Feb 2022 03:14:56 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:55 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/22] bsd-user: Remove bsd_type
Date: Tue,  1 Feb 2022 04:14:41 -0700
Message-Id: <20220201111455.52511-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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

Remove keeping track of which type of bsd we're running on. It's no
longer referenced in the code. Building bsd-user on NetBSD or OpenBSD
isn't possible, let alone running that code. Stop pretending that we can
do the cross BSD thing since there's been a large divergence since 2000
that makes this nearly impossible between FreeBSD and {Net,Open}BSD and
at least quite difficult between NetBSD and OpenBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


