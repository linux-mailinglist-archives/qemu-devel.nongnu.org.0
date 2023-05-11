Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0846FED76
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:06:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1IW-0006KE-HJ; Thu, 11 May 2023 04:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IJ-0006IR-NC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:00 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IG-0000wT-WD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc4b88998so14604008a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792295; x=1686384295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slYlxvey8vS8jO03oI+FfzvDLZXCxhNVbpSrio4xGh4=;
 b=fW01KRHVdU+Ht00iycElVt0trwMiBnNYNnnKWpZKeAWH5aEEBDmipNZpX/LqGNJLMS
 X+eMKZopdEKJbHojZm9ctnK97B4Q2qCY5/cEg5+I/pZclZ+vtLiKy+869xpqfmZSyY+b
 KT8g1+XDks44XsrlTZL0PyiejD+Bck/6PPnV0bMFraLKZsyjQC9BlhqRKiglowOqisHT
 8eVzj0RKtceNtAFUnlgA5cVE+sw0t3434VAYE3TNMXTcTGgKrZrmEW3Fx4g+tgol7Pvo
 Wt7UDbNjnVJ4ED6RNiQzs4NOIM09KYvBxPW7uLpZ0cwS9YbHlCkPe073LDZ/Slr3zdC9
 AASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792295; x=1686384295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slYlxvey8vS8jO03oI+FfzvDLZXCxhNVbpSrio4xGh4=;
 b=BjO0jAMgLbVVHeOdeFjdFgytCF8mp7Fh3MoE5YZs558ps+QnNyilj4Ui5ZE9wxUDuu
 jDdzxxpp9Cpc/pCHfrq+T8KTPnfWMF1qjpsC4Qz4nCYTGnhUm9LMF8nqYI4sX7xPBaBJ
 eYe8SrPYLokYJtjbkHFpd6l3EA3VVoFLPa8U0w3cX8jIvvAZK+Qhi/XCp+QkaMG2fW18
 4fjn5+yZxwVXPgfs+qtLIDHAx7iItGWYzyiVQxaOZQkBgmkh781MOyjl3cFgTRQRClfD
 YC8EKfMWrthzQooR9ifQNvZL+3x15/kB08CwYtLlJlSZs2bdrAyejCh+YIHRxUK8g4ps
 t/dA==
X-Gm-Message-State: AC+VfDwbBlXIVmH9QHsGiDgDlrf6ZAybb+fuHrM4Z0PHBUhdR7LHlPpy
 npgAkWVjZF1dQk1Wct++r+i0VioOzgqcZajEDx4tgg==
X-Google-Smtp-Source: ACHHUZ5vAdjwmtKz9WJ3ov9GJ/E1nj33VuWuIVzMGk9TYtxJh1s6RKstaQJejq58M9Rq1B+Tm79+xg==
X-Received: by 2002:aa7:d8cb:0:b0:50b:d76a:7904 with SMTP id
 k11-20020aa7d8cb000000b0050bd76a7904mr14764431eds.28.1683792295577; 
 Thu, 11 May 2023 01:04:55 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 04/53] disas: Move disas.c to disas/
Date: Thu, 11 May 2023 09:04:01 +0100
Message-Id: <20230511080450.860923-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230503072331.1747057-80-richard.henderson@linaro.org>
---
 meson.build              | 3 ---
 disas.c => disas/disas.c | 0
 disas/meson.build        | 4 +++-
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename disas.c => disas/disas.c (100%)

diff --git a/meson.build b/meson.build
index 5c7af6f3bc..d3cf48960b 100644
--- a/meson.build
+++ b/meson.build
@@ -3153,9 +3153,6 @@ specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
-common_ss.add(capstone)
-specific_ss.add(files('disas.c'), capstone)
-
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
diff --git a/disas.c b/disas/disas.c
similarity index 100%
rename from disas.c
rename to disas/disas.c
diff --git a/disas/meson.build b/disas/meson.build
index c865bdd882..cbf6315f25 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -10,4 +10,6 @@ common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
-common_ss.add(when: capstone, if_true: files('capstone.c'))
+common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
+
+specific_ss.add(files('disas.c'), capstone)
-- 
2.34.1


