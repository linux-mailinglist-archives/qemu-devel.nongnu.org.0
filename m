Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E02368669
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 20:14:46 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZdqf-00035b-Rn
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 14:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZdkc-0008NQ-1E
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:08:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZdkU-00043v-O8
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:08:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso1419411pjs.2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bJ5I9s7dg9qHK409QJoe2gt4MUYWY6bp4k2kmR2aZJw=;
 b=vWJIpnZE4OqA5Q00aBnKbQrGNq4BC+6iZzDdhR8a+2h04d/sslbUJ2AJDjbU21pErQ
 ahnYBac/r0SrdEfQwgiAhBURS/h9u/0MJXL7eA47Qp/fUVkEtcgDp7C24psPN8f7K3km
 tdWWLu67AV7tPmMAr2311nVxiO3uIbKsWMesQyYiC6kQi379G6QuMhUr1QWp5D7fTmL7
 5oJtTYSS07ULyaET0IqgRoOsJYpCTW9cg/cgUwH5Nd8MpUs4f9i4nukdyYBiqzEX6emd
 7D2RWOw5Hvm9FmrPNtVDbb1us2Yg+8qvgt4ovOr3eDDknyFVCLn8YUz2+fr7XB6calCh
 ftmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJ5I9s7dg9qHK409QJoe2gt4MUYWY6bp4k2kmR2aZJw=;
 b=AWy89YOp86I5pbe0Q9QowNBEl74fZ8jTg5pMnuwewxW80gl56mb0kgSo/NB9jFdFln
 kMd2iFQcD+gozCiXBiFFRwh35FkZNVBlZoZ3P8Gsy2cGjfrY+/EGF2ABMJYB/OKYeP/0
 NSeqonFcFBQgcPeoVHSOIoxwCngpvBc1k+3B4e4WHQeyBe5kMh9o54+bj8slKGM3DINs
 +iR4EpNqnSJsfz80p+wFs5aYxFHhIV2SUNey5NQFDcHhcoYpA0koaCG1Zvp1clL9DtY0
 tccJsXbuBoNuYiNNGVr1zw30xG+ZJ48e9XDfZUl2PEPsKCyVQnloXjrNkRMSxSiPJe3O
 APhA==
X-Gm-Message-State: AOAM533Vgu8Ib/OJD7gM197a8GzN2J2Nv4+36rWAwEOOauCG7FeJ07YG
 ldOe/as9TxGeidDmX4tOP45O9kkI3irxkw==
X-Google-Smtp-Source: ABdhPJzvYzMkXhQLiLhjdHg/J/1sksJf2yZ9rh275SPvMNdquqCrKDRhOjDwg7Dgl4YPT9UkHe4rog==
X-Received: by 2002:a17:90a:d48a:: with SMTP id s10mr6491pju.184.1619114901097; 
 Thu, 22 Apr 2021 11:08:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q6sm2606508pfs.33.2021.04.22.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 11:08:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user/alpha: Fix rt sigframe return
Date: Thu, 22 Apr 2021 11:08:18 -0700
Message-Id: <20210422180819.252121-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422180819.252121-1-richard.henderson@linaro.org>
References: <20210422180819.252121-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We incorrectly used the offset of the non-rt sigframe.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index c5c27ce084..86f5d2276d 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -200,7 +200,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                    &frame->retcode[1]);
         __put_user(INSN_CALLSYS, &frame->retcode[2]);
         /* imb(); */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
     }
 
     if (err) {
-- 
2.25.1


