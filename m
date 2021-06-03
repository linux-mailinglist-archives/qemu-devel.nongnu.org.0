Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB839A340
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:33:09 +0200 (CEST)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looPD-0000Mf-MN
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJd-0005ie-E1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:21 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJb-0000J5-Rk
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id og14so4230708ejc.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eiNYKdEymzNvK37Wm5/uHgaRQxlBgWOvTJMeH6EfWJI=;
 b=pXv9TyuhdBwI4/dhVffFBp8GzmauTf896baQ9e71K7sEsoo3K6DLbD8apTcOgYsmya
 XxgV3qdQ0aStrqfRIotbwmek6jnyGJHRD1hifFkwaSRT0wxmOSr/iJsgE7yvKFJAsgZX
 lb2Bwi1VBrqwvzlW3n+zWxVhaRe3admwBREGoS/gbntf2djtc9poJwZPSACsoXcffMyO
 4gjp8opQ/L4OFKD/+AK8EYhiX4gcVKYn8gEzYjq+qMPq0Ki3qHq6YtpsjmptXT0AZRX2
 WQcyyJHSp2G6wcUYQnGNV+yMSGwhI69Ahws0quwR05TisPzaalvBEpyMGTXAY7bz5YYN
 ArtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eiNYKdEymzNvK37Wm5/uHgaRQxlBgWOvTJMeH6EfWJI=;
 b=OovpeIq+AafrHLTLMTaCh+MnS/NcCaMgGDYw6g0n1++eoBA8k94PSxwRik0wJQWNRK
 rS5ALr3BvKEt5GPiiYeF+imbjd1/xbhM7tUui6YvfLOpgHP6DgQBTdMq5xGJvvc2tFWy
 UIF86DaqAOnpgVEOspJpDbcRdosjdkdrZI+QUHHBG24r/twrjgWHPC/ERdv8XKCMxeCL
 Mu5AfiNrwdlaIkJYIwrH4/ubynl4CmC4PnF8XQ+18gMUxnymBDv39DI7hqJ1YyW4CpKd
 ZDuA2Gjg4sZY1xqfDAFft/pL2lEAwAxgzEe1xgPp3chmAVyiAeNrkWsw6LrUnl0AMudO
 Ub9w==
X-Gm-Message-State: AOAM531L5B01M8Pt32zoDk6a9KvHTPg1B4Gw2FArD7OmKqhOO3TuUtfy
 9Vrv/ZL2IYoe9KxIbAndL+EIfirtpiSpKA==
X-Google-Smtp-Source: ABdhPJyklr70PpOmSHAo2yJ6lPy0AvlXFQJWl91Ct/7TgpPdqgvNjLLtCNzhubNnBNjNo57YWmtXzA==
X-Received: by 2002:a17:906:2612:: with SMTP id
 h18mr22979668ejc.417.1622730438622; 
 Thu, 03 Jun 2021 07:27:18 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p13sm1562747ejr.87.2021.06.03.07.27.17 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:27:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/i386: tcg: fix switching from 16-bit to 32-bit
 tasks or vice versa
Date: Thu,  3 Jun 2021 16:27:14 +0200
Message-Id: <20210603142714.224210-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603142714.224210-1-pbonzini@redhat.com>
References: <20210603142714.224210-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The format of the task state segment is governed by bit 3 in the
descriptor type field.  On a task switch, the format for saving
is given by the current value of TR's type field, while the
format for loading is given by the new descriptor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 2112c5fc51..3ed20ca31d 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -319,7 +319,7 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
     }
 
     /* save the current state in the old TSS */
-    if (type & 8) {
+    if (old_type & 8) {
         /* 32 bit */
         cpu_stl_kernel_ra(env, env->tr.base + 0x20, next_eip, retaddr);
         cpu_stl_kernel_ra(env, env->tr.base + 0x24, old_eflags, retaddr);
-- 
2.31.1


