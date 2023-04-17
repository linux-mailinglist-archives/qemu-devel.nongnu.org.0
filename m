Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1AC6E4E79
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuO-0002LB-IN; Mon, 17 Apr 2023 12:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuL-0002J7-2i
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuJ-0001MK-99
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso792557f8f.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749646; x=1684341646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zh6XCv4IvteabEjdIcioL96syD6sHRMrwiuxQ8bgkY=;
 b=EkUhrN+JV1cwTljHehURUKFLzN+WuKNrB+qRRFm6mDJbgx9DKlMDh+i4fqzmPe4ek3
 KVjrKYbHQ2uC0VRq4phi6+uONETSzXEiHvTyiUqs75k9+Z3XN92tF5kvdGvlH8o/rW7s
 LjG3NCutM/Y3p3J2SsjUTEk5lAvaKr7ZMArNuJN9y3qsKWCaAwemJP1WZu7n42bss/b9
 B3IHEl5Gk+98991UFL13eHMsA62uB5wi0JL10ilffLMd2XFvShY6xyQeL9UbrjjxLSQJ
 2TYGxUEUgcBMFBKN2jDBywWgX5Yn2/rZ6e0qaYV/b7XxsGP+YK41VPIT4z09+hYomWC0
 oo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749646; x=1684341646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zh6XCv4IvteabEjdIcioL96syD6sHRMrwiuxQ8bgkY=;
 b=ll5Hg1b/GZWxulEfsRmPfDjEA0qamax38etVkOVHbVXvs8fBmN/xsmq22D+UZYChyg
 q07ThXGzKLI5ypFJ586OI4+WUNWIKskTBkmQE11rP8Md+3WnPmF7sb/UqaWnHmSESeAw
 sRqCDfYzy+d9Tt/C0POJtqEJ9UWcBOa9GzWeQRaT3nRkZhJTYD04uxtrAvhi4AuqJoQm
 du/9RBgOAQWcURnnVjvgvPiTdnwwAc7vpDmmsoRAswbZkTSBrAv4InBL03zf+V/rkU1N
 vnBXLc5xFuAiZy7WtX6jlHuCMkXdpf0mQsZk7jvPmX3KdzqWWGidjFQMIw5ffRNUnERg
 5bSw==
X-Gm-Message-State: AAQBX9dYnFmg2KIsyk1t42tTsAXq386aMvIcuNF5TH6l3KzIfA/rupia
 XIsj+oZx4UJgaXYR6Oz+tliNOtYRmMcQJARDCDo=
X-Google-Smtp-Source: AKy350ZSCvlul7ydxNf8i2U6Q1/TVebnnqnFUXR1MvNIelFMCOJXbNQyMsNepr0TRE9YXygbv7560A==
X-Received: by 2002:adf:cc81:0:b0:2d5:39d:514f with SMTP id
 p1-20020adfcc81000000b002d5039d514fmr6574853wrj.65.1681749645865; 
 Mon, 17 Apr 2023 09:40:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 05/10] bsd-user: Add '-one-insn-per-tb' option equivalent
 to '-singlestep'
Date: Mon, 17 Apr 2023 17:40:36 +0100
Message-Id: <20230417164041.684562-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The '-singlestep' option is confusing, because it doesn't actually
have anything to do with single-stepping the CPU. What it does do
is force TCG emulation to put one guest instruction in each TB,
which can be useful in some situations.

Create a new command line argument -one-insn-per-tb, so we can
document that -singlestep is just a deprecated synonym for it,
and eventually perhaps drop it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/user/main.rst | 7 ++++++-
 bsd-user/main.c    | 5 +++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index f9ac701f4b1..f4786353965 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -247,5 +247,10 @@ Debug options:
 ``-p pagesize``
    Act as if the host page size was 'pagesize' bytes
 
+``-one-insn-per-tb``
+   Run the emulation with one guest instruction per translation block.
+   This slows down emulation a lot, but can be useful in some situations,
+   such as when trying to analyse the logs produced by the ``-d`` option.
+
 ``-singlestep``
-   Run the emulation in single step mode.
+   This is a deprecated synonym for the ``-one-insn-per-tb`` option.
diff --git a/bsd-user/main.c b/bsd-user/main.c
index a9e5a127d38..cd8b2a670f7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -162,7 +162,8 @@ static void usage(void)
            "-d item1[,...]    enable logging of specified items\n"
            "                  (use '-d help' for a list of log items)\n"
            "-D logfile        write logs to 'logfile' (default stderr)\n"
-           "-singlestep       always run in singlestep mode\n"
+           "-one-insn-per-tb  run with one guest instruction per emulated TB\n"
+           "-singlestep       deprecated synonym for -one-insn-per-tb\n"
            "-strace           log system calls\n"
            "-trace            [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
            "                  specify tracing options\n"
@@ -385,7 +386,7 @@ int main(int argc, char **argv)
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
         } else if (!strcmp(r, "seed")) {
             seed_optarg = optarg;
-        } else if (!strcmp(r, "singlestep")) {
+        } else if (!strcmp(r, "singlestep") || !strcmp(r, "one-insn-per-tb")) {
             opt_one_insn_per_tb = true;
         } else if (!strcmp(r, "strace")) {
             do_strace = 1;
-- 
2.34.1


