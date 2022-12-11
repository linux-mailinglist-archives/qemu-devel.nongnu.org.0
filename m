Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32696494F1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:38:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG7-0006a3-HT; Sun, 11 Dec 2022 10:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFo-0006Rj-Hn
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:36 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFg-0007kM-0G
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:36 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so5859162otb.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHP2OeuMx3QS+Hc+EMNNXZmVyNHjtf95ORFV/MSLczs=;
 b=arRSB5wYDbKJetGre27wb7JkJGS+cXilxzutuXHPJpSgwCznxY1lGzE+S/pr1AftDr
 yrKu0n1jf/xAoVGSWIrYO7V2xUuY8c7LkjcgAv3UG1ulPxPREGwLpLFfv2MhlPuklv6b
 BWhmZ+WA4gBkX+lTIkybDm3jGu+RD/nsnqwYFeB8/6h3r6MjXX196XaWFRj1F5pIHVBk
 SneyzbBgOuJ5kIceHuNnJXZdXzKkg4YGYzQsxj7pi35MoDyRtQekjX1bjfVhv+0lLF28
 uBGAJI7yZduiPDkJzOdrehXDNj3Rbt7atvoHJvUFpqPv11Scor9JpgvVZrKIv3d6k+UT
 sF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHP2OeuMx3QS+Hc+EMNNXZmVyNHjtf95ORFV/MSLczs=;
 b=gRmOsmjgtxBg+USVCxAN8NPeJ0IZtydwpjg59MVfRTxtfWOuagrJDHlA6i55dtvURW
 LHd5qsl18t+tm1T2eSNKXYwGRdYWXRD9Xf4/W8JEuqM1QktbAntl/4CrnLPGK1ZmW7Cq
 dFyyTJeKKVEfq6sitHZ3QqDmbjgi1F/iWpBErjP6WaCrMpRYjr1vdLxMkviHqVkG190w
 tIIF3JF3wzvplUi6LbPFDBX3yCHpkwIPvsN9FXJy97Sniv+/pMAZEJDq/uY8DMewicVi
 wFAEGkCerDj6LjCJ3V2LzfnppM/4vOiAr5PsZQsoRrUSPCWP0Xgy/iTOPvTZtiAmLWAz
 6b6w==
X-Gm-Message-State: ANoB5pkSo116CMGS81OyvGuf2enmvDcPNWN6NWrOy8SCMC0l/E9LD00R
 p570FBepYdLsmHFZC2zzG4wJJ9/+TAdeAizkaWE=
X-Google-Smtp-Source: AA0mqf6xqMAPFQWGXMnZsiF/gjFCZOYzev3oZaoBoL3jabaI24CvD7DIEJWTP0AQ+dwavoKVoNqw6Q==
X-Received: by 2002:a9d:6455:0:b0:670:8cc8:3a02 with SMTP id
 m21-20020a9d6455000000b006708cc83a02mr1248692otl.12.1670772503675; 
 Sun, 11 Dec 2022 07:28:23 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 16/27] target/s390x: Don't set gbea for user-only
Date: Sun, 11 Dec 2022 09:27:51 -0600
Message-Id: <20221211152802.923900-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The rest of the per_* functions have this ifdef;
this one seemed to be missing.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index c7adf0d72a..5842a13a97 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -384,7 +384,9 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
 static void per_breaking_event(DisasContext *s)
 {
+#ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
+#endif
 }
 
 static void update_cc_op(DisasContext *s)
-- 
2.34.1


