Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06EB68C45F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP54K-0000jB-CS; Mon, 06 Feb 2023 12:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54H-0000hz-2y
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54C-0001Qj-Pg
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so11061042wrv.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvKv8MeGCedu3b+fClY2dUyPUXygqJQqulbvcZ7fvCk=;
 b=xyx4TEweFZbZdgM6BDOmxM4v8aaRMGRjatJWgrY6jwgoKnpgjPelPI/MrOvhZpBLVv
 0vlMPSTRwQ9jq++rasLvCD/MlFZyYoXS1QRR+LbcHFCrPegm3PJtmui8xTmN2EETgtUL
 +fTDLkMdTMbFj1TwHbzj7ZqC1L1MQ5tfrzmpKklwE11m9CTbyPKtXs6iubEitLLFczLv
 GMrf3Esb4KeYRH0KMO8sQI2+tBKVEfQ2ewlyuQDIyEN9nAhXf/Zu34ens6WmOMcKieUM
 yMeZ56hQyHuV4L0qqEO1gD9xu8pJtN1gs8+nzNExXEO+raxG9YT5ecEJUPNxlK7NA3Un
 z1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvKv8MeGCedu3b+fClY2dUyPUXygqJQqulbvcZ7fvCk=;
 b=YlrFZd7/ndqJRsCC54w63CvRB/9jnwZ/xbStPGLtsf+3tMa2y9dDvGIH/gFr2N9Tbn
 SD4RzAtVIh7cCdVjlWjIbMvuKrsF4GXXV7qv99qVQH4/qswNolR3Ztw0Fcu35xessrC5
 9Rjpuv5amhnb/XEm/V+66CkX9auwqw7yCWrqY0iVPtjB/e5RgABEhuqpAPWLN6Zq7Fi6
 c5qERM7hKkmW9NR+p+mcOiZ53K3szP8d0FijpWhjLbmL1TIMncGjQDSSoNlIrRq0Ezfw
 51LF//1ATkQEC7/D/tPz6g+wVYLa3xcIuJqJlWoMcOtLycN4cy0rugFZ24HBt8GXgkMU
 obrQ==
X-Gm-Message-State: AO0yUKXhJo6ibzhcISeWTiApd107CzOtN4w4TsaDP77KspYdehg1094r
 AZ2M92IOn+615Ig/8p0JSk4WXfBntBmJG2L8
X-Google-Smtp-Source: AK7set9PYMns/sjMGG+I0GtYbSF1mHqpnPErgzGNGSY3CGWVQi/iUm1yJMRfoWtkYzN8jZc2z4Klhg==
X-Received: by 2002:adf:c788:0:b0:2bf:b7cb:d2ef with SMTP id
 l8-20020adfc788000000b002bfb7cbd2efmr19666371wrg.9.1675703645835; 
 Mon, 06 Feb 2023 09:14:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9529841wry.11.2023.02.06.09.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:14:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 3/5] bsd-user: Add '-one-insn-per-tb' option equivalent to
 '-singlestep'
Date: Mon,  6 Feb 2023 17:13:57 +0000
Message-Id: <20230206171359.1327671-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
NB: not even compile tested!
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
index a8de6906ed5..8ede40614ec 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -167,7 +167,8 @@ static void usage(void)
            "-d item1[,...]    enable logging of specified items\n"
            "                  (use '-d help' for a list of log items)\n"
            "-D logfile        write logs to 'logfile' (default stderr)\n"
-           "-singlestep       always run in singlestep mode\n"
+           "-one-insn-per-tb  run with one guest instruction per emulated TB\n"
+           "-singlestep       deprecated synonym for -one-insn-per-tb\n"
            "-strace           log system calls\n"
            "-trace            [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
            "                  specify tracing options\n"
@@ -390,7 +391,7 @@ int main(int argc, char **argv)
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
         } else if (!strcmp(r, "seed")) {
             seed_optarg = optarg;
-        } else if (!strcmp(r, "singlestep")) {
+        } else if (!strcmp(r, "singlestep") || !strcmp(r, "one-insn-per-tb") {
             one_insn_per_tb = 1;
         } else if (!strcmp(r, "strace")) {
             do_strace = 1;
-- 
2.34.1


