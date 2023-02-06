Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6868C45A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP54P-0000jx-Rh; Mon, 06 Feb 2023 12:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54G-0000hw-2W
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54A-0001Qb-Ln
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id ba1so7006259wrb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0Jr8DH9OG5vGfeN7iONeP5ImzvUd60F7hUAYLN+I10=;
 b=HFsfwTlVS7H36hlbk8MGiLGB9AeDrGhw49moEB2O1/KNJCDnke7PG0oDF0fAQld7ao
 63r4E7GVs+Rs/rZc6avvuTrQ/z18vQTrCGrVCRlbzZff+9n/WaYo3hPZ0ePF6q+0VBPr
 wBCOOkNAYKnPl1KfzTGVE6FtIAMDdtNQ9LYgyr20HMBSVtfDlyHf50JZVxnoU8aq9ORW
 ny0JWkpcs5kHNxpc49etfcFOSg5skPZFn6LBbmG2mDq6cHL9C1n5qRRPwGmPrE0nnAhv
 85EY28fGvfcxoGp6xDt0plKJn4cXrYcAhBEwFu3iCtKcA4Ryu21zscIjhVagTdwASym+
 bYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0Jr8DH9OG5vGfeN7iONeP5ImzvUd60F7hUAYLN+I10=;
 b=t3ZMJUR1w/H2pqRC1lSXNKhXX/TeqZ0zRFNJYWsdTXIIWFx39a9unX60YtRuAnl2+T
 hg+Szc/V1eY5dXBS48nildHNYkT3LK2cndtBdYSFLJQZ7jDQzArE6/Zg/lyvjfFGrAAC
 AGteauRK0wQK1v6svr3E1metpw3LvzEBjBU2tcn4GIdnpiQDcmuuQEX7mrEqhhiQ2Ikn
 skpRicvL16bCwJ8/tiS0axemDyUNl6d1T0vyMtnAJHPCzL/pI4uz6cgvAmjG4VgKQ/gU
 0n0tDS1qVqmzjDKEXyNdCjgDxCltoJEv+vWl5+7ez41FvyedwrwGHZO0qktTZsbjv/ae
 FNSw==
X-Gm-Message-State: AO0yUKU6LJseSA7VSPLOx49wZ6SbqwzVgIAQcaRyotgMKd9KLMGuK1JO
 Dko1RIvp15Ge+k2w49BCjTnRK/LRvCjPKG95
X-Google-Smtp-Source: AK7set8Rd6K3n4+7KfU93a6MPHZUE4BOi6hx09WTRJ+IocEkGbF3v8dPVQm3avFgZUkQalIdzCaJTw==
X-Received: by 2002:adf:ec06:0:b0:2c3:ea95:4726 with SMTP id
 x6-20020adfec06000000b002c3ea954726mr3419106wrn.34.1675703644879; 
 Mon, 06 Feb 2023 09:14:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9529841wry.11.2023.02.06.09.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:14:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 2/5] linux-user: Add '-one-insn-per-tb' option equivalent
 to '-singlestep'
Date: Mon,  6 Feb 2023 17:13:56 +0000
Message-Id: <20230206171359.1327671-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
 docs/user/main.rst | 7 ++++++-
 linux-user/main.c  | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 6f2ffa080f7..f9ac701f4b1 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -93,8 +93,13 @@ Debug options:
 ``-g port``
    Wait gdb connection to port
 
+``-one-insn-per-tb``
+   Run the emulation with one guest instruction per translation block.
+   This slows down emulation a lot, but can be useful in some situations,
+   such as when trying to analyse the logs produced by the ``-d`` option.
+
 ``-singlestep``
-   Run the emulation in single step mode.
+   This is a deprecated synonym for the ``-one-insn-per-tb`` option.
 
 Environment variables:
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 99bcd542b42..41089e51cea 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -395,7 +395,7 @@ static void handle_arg_reserved_va(const char *arg)
     }
 }
 
-static void handle_arg_singlestep(const char *arg)
+static void handle_arg_one_insn_per_tb(const char *arg)
 {
     one_insn_per_tb = 1;
 }
@@ -486,8 +486,11 @@ static const struct qemu_argument arg_table[] = {
      "logfile",     "write logs to 'logfile' (default stderr)"},
     {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
      "pagesize",   "set the host page size to 'pagesize'"},
-    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
-     "",           "run in singlestep mode"},
+    {"one-insn-per-tb",
+                   "QEMU_ONE_INSN_PER_TB",  false, handle_arg_one_insn_per_tb,
+     "",           "run with one guest instruction per emulated TB"},
+    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_one_insn_per_tb,
+     "",           "deprecated synonym for -one-insn-per-tb"},
     {"strace",     "QEMU_STRACE",      false, handle_arg_strace,
      "",           "log system calls"},
     {"seed",       "QEMU_RAND_SEED",   true,  handle_arg_seed,
-- 
2.34.1


