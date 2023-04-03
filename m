Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2E6D4A85
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSR-0003rj-QO; Mon, 03 Apr 2023 10:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSL-0003qD-LW
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSJ-0001AK-0h
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id n19so17286903wms.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytKjnDvRMIcS4Sr4naIJJlunrHtq0dhvkTa6XH1ctRc=;
 b=LTVnL2XRCSFExyuGXBgG3MFp7L+ilc6vw7DcmBZLVw//qjEsSrU6btOlKD6/G66T1l
 d5GGAibt4eSdgd3HKmvpemnM9ycqlgRPbihpRs2mA0B+wCGT2rJDWAsR2/OfythVyHNv
 PmBwlGGvoGU8bkki5HRW+s29c1cS4PJS9hv9O47SqZM4zfLlhxkCSH5G5rZ2R1JklagX
 iqBwl4s2oGkx0NcFyO2+Rn7CEpRwCysO1VlOFir4Yc5qqIB4q3/84EoU+AiX307U0M/Z
 5F1WJwN5R2zRMkhT+z+HoeuxnFdytU4KNoNFj6ggZOgTBrqVvU1gwspP3VIhTGFevZnr
 he9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytKjnDvRMIcS4Sr4naIJJlunrHtq0dhvkTa6XH1ctRc=;
 b=m3gZVEl9YhQAiD+kWMhS13iRKcbA+3zW2vQLK3IsM39TJhs5I8HFp9MSRzPHKC0Xj1
 qGgwbWo2f7tADUBNP09TzdWesRIfmCCDwf+UwntZUhGMlUDNeSJCr4o1fo7MertNx7dE
 8Skxabr0MenosWs3o6Y9TCdN7mFtDrVrF6UDjtFFE6uDQa0BzG2rEjV6KQGTXWF+3l2j
 RBvmRexfZqU1IdgbyUabRPSSVt8M9RTBswuE29QpGf7uCRH2W0Z2rbjbYw3dFYAV56+Q
 5+6UZsUT9lvwF5qYpmxSjcolOWr+c73kZd25fGNhSiA0b1Rc5qKocAMF5OFBvqBD2mal
 9jkA==
X-Gm-Message-State: AAQBX9cjtcdCSpm36R4ETvCE2pgyBz44zzRjO2JNTLlxk6LkQXee/NEq
 nkEyqKMIN82DPaH1yPVE96an+zDA2jXfRzSXX0U=
X-Google-Smtp-Source: AKy350Yp7N8ogtuOZqiTAGunYQd+s39ZLj4ezT4aE+khT8n3+CJADjOaMjL0REsly8SuMQXGEw+agQ==
X-Received: by 2002:a1c:ed15:0:b0:3f0:39ab:347c with SMTP id
 l21-20020a1ced15000000b003f039ab347cmr10847848wmh.23.1680533202308; 
 Mon, 03 Apr 2023 07:46:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 05/10] bsd-user: Add '-one-insn-per-tb' option equivalent
 to '-singlestep'
Date: Mon,  3 Apr 2023 15:46:32 +0100
Message-Id: <20230403144637.2949366-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
index a9e5a127d38..9d604a670b7 100644
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
+        } else if (!strcmp(r, "singlestep") || !strcmp(r, "one-insn-per-tb") {
             opt_one_insn_per_tb = true;
         } else if (!strcmp(r, "strace")) {
             do_strace = 1;
-- 
2.34.1


