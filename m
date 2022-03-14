Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61124D7EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:43:12 +0100 (CET)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThEN-0006zx-TO
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:43:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3l-0007uU-JA; Mon, 14 Mar 2022 05:32:13 -0400
Received: from [2a00:1450:4864:20::336] (port=40799
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3j-00083e-QL; Mon, 14 Mar 2022 05:32:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so5150981wme.5; 
 Mon, 14 Mar 2022 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rUBWDQ1MHU3Pn3HW3FwHGboOdfSq/DM6oeM/jIcjVcg=;
 b=mfzAQVuBUl2Z9DRMwbtL2vr5ZYMW+o6eS43a2yvv2ISDTSqSUFOMP8xNMUiFVvTsIx
 8iz3viyDPl13cxaymkTZ4VgnJcdzpZHZXwtYDfanoScZ0RB3wokEWvC2saoNs41mt+I2
 xf9BuQN2XlEhIo0J7DGgsNXVzVYrvi2zfVs0YcQr42myJ7B+d9jpLYIbhYZQVY51yokp
 jRSO2/0G4mKnK6gjN2sAwnNtKtHpj9UiME0eom5obDiViIPJCuYzIH3CUr7IMcWYlGsS
 62KgXaAzAkKebG4/PO6pbPkTTFpuajLOAn2Z4IeMZ3OH2V3cL6lq4ebwXwsVGjI4HKsN
 zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rUBWDQ1MHU3Pn3HW3FwHGboOdfSq/DM6oeM/jIcjVcg=;
 b=eYbrSMFwsLZTAqYCoonshtU7ugwXB6u/WMyPUXH+Zn6g2yOVsfPCqM1wdt76fypt/h
 t4IBrcBy8JGvencAMS58Xi1C1H75TUwQtBWiVjcm9WAJ1J7rJ1WEBs/RS1UIvmQkGPHV
 iHL2Fr5gAAIdixR42li5DSk6G6FjYQAT1QbhiImun83ZIltT0VRxekD+3Sw+kzMLExxt
 AY22EczYj5PB2mAu/fe2mb1iHoXlw8TL4ZPviEOKL42PnYm2sPQPuqJ6bdOl1n79dJGn
 l66SLQB03Byu7nVfTwjoaEIcikITilGIcU9CMbyD0E4kJ5ghJJKG4rHZbXp2PMIfuQ+T
 01sw==
X-Gm-Message-State: AOAM530PpK6Rwoj1SvR4aXdSzaZKnq1tIuVf1/c+NAdlQRbHUuCkbyMh
 0N0X6WLYrjQLZzciBcEFB3E5i0t2fH8=
X-Google-Smtp-Source: ABdhPJwNZVW1x3zeBJCGK6iCZOLufI1tMaRo0XdAFJEY5vdGbsqjxVSoAtMUW0GkCH25vNJREigNLg==
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr25065840wmc.148.1647250330113; 
 Mon, 14 Mar 2022 02:32:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 06/16] use g_new0 instead of g_malloc0
Date: Mon, 14 Mar 2022 10:31:53 +0100
Message-Id: <20220314093203.1420404-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Casting to/from void* must be explicit in C++.  g_new0 takes care of that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/timer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 88ef114689..ee071e07d1 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -520,7 +520,7 @@ static inline QEMUTimer *timer_new_full(QEMUTimerListGroup *timer_list_group,
                                         int scale, int attributes,
                                         QEMUTimerCB *cb, void *opaque)
 {
-    QEMUTimer *ts = g_malloc0(sizeof(QEMUTimer));
+    QEMUTimer *ts = g_new0(QEMUTimer, 1);
     timer_init_full(ts, timer_list_group, type, scale, attributes, cb, opaque);
     return ts;
 }
-- 
2.35.1



