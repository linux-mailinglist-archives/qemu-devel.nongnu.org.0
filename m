Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D56968C45B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP54L-0000jh-AZ; Mon, 06 Feb 2023 12:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54H-0000hy-2v
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:13 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54C-0001Qs-QF
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h3so3229334wrp.10
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMZp74yJ4afPsnw6Yc/ZceAsQ465N4IhpQ4ktRnsEtk=;
 b=hLHro6a7JUkB6g+l68fFB4zvtMJIaTGCt+1zRswoktGwMtDLg6KV8w+Ypw0SXyllTm
 rj3UFdosRDxj9H2dT8Xhh57d6/kStojs+FhwQIOMQVGrM1NuPmVhpLvDzo4VHLDlyuPH
 4B31g++gdHwTK5GhubeG+b7bFv8uYiGlPiivQBLai4rDjCleEVW0LspsOjOnXSsH8O92
 GODftsepxJU7Pqm+GhPiE1R8pj6ZLqKsZFMvqozhWuA5oU2F2Imc7S7T3Ce30aKdhnrd
 41aSfu0V2/RT+xXkm4oTOW7lHsbMWVEaH31mhTTYFrrPM3j3o0P7L/AfstWwsj93gmZw
 lFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMZp74yJ4afPsnw6Yc/ZceAsQ465N4IhpQ4ktRnsEtk=;
 b=rvXCAC2FMZ8knnYAvxH7JPYsi1fcGcJ234J8clYVn3T6Yy3pd90KN+bSdGDIHZW2qL
 kSyZNoQ4oPtOizvmf8+x7UFtPsQ0c6THqXpXIdRVb61bUQW+17/aHqlsL2sUvyAsNw0C
 cRYnxZ+SEnd656DOX0TMVtGHVjI+lO+q42pk9nqmf5Mh9BT++iCa2QgIgKAXf/9DG09J
 yP6IUcWobG4Km7EHi94FZF29mXwstcpZc3f27fwi114hPfAwyp0oTAYQYmRrPDdfCY0N
 NsOLiG142l55lypEnH3QMNPoUQC2HDq60B2lEncIhqSxPXJAdxOVlsK2DY0WKgCZRJ4T
 0dxw==
X-Gm-Message-State: AO0yUKXbuUzsrCRZ5ca83iwhcMDM3HR1hvxzwoDon7jdSwZxAMyJNvlI
 uShqEDuK1UtFghm0euyAQZgo+w7r1tPqxCI7
X-Google-Smtp-Source: AK7set+BOWSkM+yGV1y+/QJsn+DB9DK64jT1G2RR7tQy+JE0wFEcDVWdEYIpg88IQv4H10qY1qyzBQ==
X-Received: by 2002:adf:ff90:0:b0:2c3:f0a6:43e3 with SMTP id
 j16-20020adfff90000000b002c3f0a643e3mr983048wrr.39.1675703646851; 
 Mon, 06 Feb 2023 09:14:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9529841wry.11.2023.02.06.09.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:14:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 4/5] softmmu: Add '-one-insn-per-tb' option equivalent to
 '-singlestep'
Date: Mon,  6 Feb 2023 17:13:58 +0000
Message-Id: <20230206171359.1327671-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
 softmmu/vl.c    |  1 +
 qemu-options.hx | 14 ++++++++++++--
 tcg/tci/README  |  2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index dbe5124b5e7..61335ec7bc0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2957,6 +2957,7 @@ void qemu_init(int argc, char **argv)
                 qdict_put_str(machine_opts_dict, "firmware", optarg);
                 break;
             case QEMU_OPTION_singlestep:
+            case QEMU_OPTION_one_insn_per_tb:
                 one_insn_per_tb = 1;
                 break;
             case QEMU_OPTION_S:
diff --git a/qemu-options.hx b/qemu-options.hx
index 88e93c61031..184f8cc36d0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4158,11 +4158,21 @@ SRST
     from a script.
 ERST
 
+DEF("one-insn-per-tb", 0, QEMU_OPTION_one_insn_per_tb, \
+    "-one-insn-per-tb     run with one guest instruction per emulated TB\n", QEMU_ARCH_ALL)
+SRST
+``-one-insn-per-tb``
+    Run the emulation with one guest instruction per translation block.
+    This slows down emulation a lot, but can be useful in some situations,
+    such as when trying to analyse the logs produced by the ``-d`` option.
+    This only has an effect when using TCG, not with KVM or other accelerators.
+ERST
+
 DEF("singlestep", 0, QEMU_OPTION_singlestep, \
-    "-singlestep     always run in singlestep mode\n", QEMU_ARCH_ALL)
+    "-singlestep     deprecated synonym for -one-insn-per-tb\n", QEMU_ARCH_ALL)
 SRST
 ``-singlestep``
-    Run the emulation in single step mode.
+    This is a deprecated synonym for the -one-insn-per-tb option.
 ERST
 
 DEF("preconfig", 0, QEMU_OPTION_preconfig, \
diff --git a/tcg/tci/README b/tcg/tci/README
index f72a40a395a..751558f2892 100644
--- a/tcg/tci/README
+++ b/tcg/tci/README
@@ -49,7 +49,7 @@ The only difference from running QEMU with TCI to running without TCI
 should be speed. Especially during development of TCI, it was very
 useful to compare runs with and without TCI. Create /tmp/qemu.log by
 
-        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -singlestep
+        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -one-insn-per-tb
 
 once with interpreter and once without interpreter and compare the resulting
 qemu.log files. This is also useful to see the effects of additional
-- 
2.34.1


