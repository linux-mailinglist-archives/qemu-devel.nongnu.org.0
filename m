Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E53B4593
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:30:20 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmqZ-0006iZ-95
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfP-0003dd-IQ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:48 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfO-0003IX-3s
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:47 -0400
Received: by mail-ed1-x531.google.com with SMTP id c7so13614066edn.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BevMjojoz4Zbbmnx7q+o91aCSPbNgcWVWrT6Beq1/n0=;
 b=j/t3NaFlb05cyTxwmTLGxPUCyPxVg3ekrPPBddyaXECjzmUvvO687mw9T5Goc9jtsK
 Lwp4IBmaEjzDD2otZtNLyMsBF8rpOVqe2clDb8ST8yQ8C67LkHuYhtB2J1SCgsENtWaJ
 xN46pyITVLL+GPej/u4C3qAFAOTdlReEpu9IsFSXVpeqT1k350xILAmXZp8gX7ZnfNl7
 xlBS3QAoxfHr9qd2OSsLfiUsEY9xOgeJkcMh/iis/SGkBrgsNYSgMo2SjXS1Db5BrivW
 gBTehwffXK4rbjdtmGclK/YqDyA9k1SnX+XcOJXS/4EFodZ+KL5WWk5TDDHs4zENWk+y
 rkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BevMjojoz4Zbbmnx7q+o91aCSPbNgcWVWrT6Beq1/n0=;
 b=WrW84vO/14uKuY8AfDN74op7NUlsE7ZsECK/AfCZqUR9mal5l+WNaWivfARujAL+ky
 1fEnJtn/UHqil5+0D/CoxJjbuJnFMhVfAIDcRh/IauBjMbuB3l02l6AI8wrnCFKp+2b2
 oWsWVq7PwBDXujqYUC2epP2suCFUPlEzs/mzFLlw0DIOwnzLrkuLnL71MNXf5oZPcLw0
 5K3qCo8Fh/YfpTqa0fpkoKktvwTPj2O2UuQPqGgUK2l/ZN0Jlal/YLAJng69Qusf5o6p
 jvzHEEuCrLMOG+ctZKJz5y3FTvhjCFZvCoAjTpGSjWafqKXlfiuzCBz1GqkJ8F6uebsq
 cSrA==
X-Gm-Message-State: AOAM533I4v2ukpF/M4KiuHoFuFt9Kp9T4NbGGHEvhu3JnEnh2gwe/Kem
 KPZl/Bb/KiAVGuzhd5RZnSIj96psb98=
X-Google-Smtp-Source: ABdhPJw6N3SrpKNEWIoWBnGldEAK/UyFPWmCJN8qgE3kbV7bpI3V6oOKii9bgxGkCzkXVWPFyJntMw==
X-Received: by 2002:a05:6402:348d:: with SMTP id
 v13mr5633568edc.119.1624630724868; 
 Fri, 25 Jun 2021 07:18:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Fri, 25 Jun 2021 16:18:16 +0200
Message-Id: <20210625141822.1368639-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Joelle van Dyne <j@getutm.app>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

iOS hosts do not have these defined so we fallback to the
default behaviour.

Co-authored-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index f16d987c07..74b8216077 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2341,7 +2341,7 @@ again:
             }
         }
 #endif
-#if defined(__APPLE__) && defined(__MACH__)
+#if defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)
         if (size == 0) {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
-- 
2.31.1



