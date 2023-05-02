Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290836F4397
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:20:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovJ-00048Q-0X; Tue, 02 May 2023 08:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oV-Sy
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouV-0003Cu-Km
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso22097155e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029710; x=1685621710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DHMVNnjrsAA53W4gvs9aVVNZXfc1xv/zTYlgk8ZRaqc=;
 b=Z5pN0neyytPgXCwHM3jNMHOJMZBAmrx5Q0Jv7TBMkLxk6jrTWpFkYfdgkwVdN3OgPP
 eNqLfXZDRDiykNqtsumfT3SoGBlUkZxPhJNphWtbtI85VUkyuFHU75lCkrkNkF7Z3Mm4
 nXaudAs19NvrRoeL0iCYrYoGzSS/FO/2w0jXBH42d9bi5J6jexrM9wANQofrEdNkbgx4
 YtYcEToEnRwQCPbM/AlQZ/nA3e2YEkmaNyLKrnkrMe1vqE8pObeIXw1xDEu9pF8xp2Uo
 JUXHDTPMxjgN0D0WvuMxiextwfUoWqpRx2cgcrTmmn8oL8XBrAmdY55ENvWSC3CpBxJt
 iz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029710; x=1685621710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHMVNnjrsAA53W4gvs9aVVNZXfc1xv/zTYlgk8ZRaqc=;
 b=Krr+1XQQYbG/Lm9TyIn6oBrvryvgcXjbBUa5iUnlWVwcFt4LMNYNaBCx10YkRk8zd0
 8Yow3xE3KuPf72ZrQx0kCjFA5YMKCqY0LTZIPTz+is7e+sUbBf+fu03klmfFjVdxuDV/
 VyeFnce+EfNBNJcfPNnH3tOfIQ2xsIzCKez5MZ5Sc8LnKu+pS0NkUnA5qfJm/BKGFoMX
 bCfcALmmqJl8Op0G1dq4SF40t1Yp4mZiCzRtE9JyG+gpol4DtamgsYCpcxIc0l9DDDrI
 ksDtQuNTmICvrVT78vCQJfPlqjdK3gw1qNcC9wrCHu4hBvKFrAmPD2anH3NOCjTapUDf
 V7Bg==
X-Gm-Message-State: AC+VfDzlucdIj9UQ0XaRrpM+8N33lSv0PzbizPctS7/UIcK7x4PNGVZj
 qhdHcBZYUsmiZmvrkJusNjHcdU69p6HkDFsXfuU=
X-Google-Smtp-Source: ACHHUZ7yuoZeT0pUytKoRncZ1duR1zTSainz3Nmaac+jYOEb6UsC74cpAO2J5tIV1KINLJ0/U+Cveg==
X-Received: by 2002:a05:600c:3797:b0:3f1:82c6:2d80 with SMTP id
 o23-20020a05600c379700b003f182c62d80mr12066519wmr.5.1683029710292; 
 Tue, 02 May 2023 05:15:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/35] bsd-user: Add '-one-insn-per-tb' option equivalent to
 '-singlestep'
Date: Tue,  2 May 2023 13:14:44 +0100
Message-Id: <20230502121459.2422303-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-6-peter.maydell@linaro.org
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


