Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B112B502B33
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:44:36 +0200 (CEST)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMFX-0002K1-S2
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsW-0007Vi-Cb; Fri, 15 Apr 2022 09:20:48 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsU-0008Uj-SK; Fri, 15 Apr 2022 09:20:48 -0400
Received: by mail-ed1-x52b.google.com with SMTP id c6so9892311edn.8;
 Fri, 15 Apr 2022 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XT/5ko8xXdFB2oZI4c5/NazeRRBkHp1p2r7GLP5NiZo=;
 b=ezU9/d+Tzu03IeCj+ZnoFlNRT6CKORQFLe/xk5ld0YkBt57Yn6e5vxedAVvpc7QmVZ
 A1bF8Et7Z9ttBmKtjIY79Qyum2P6R1Jb822JdlN+Frg4/BDekJcFMH8Gg0mpkiPwp7Fl
 y++xxCoIJyyRFzyWgOUKtooeMNG1iwKnm/vcvyJmpwNRhIMydq9mhe788FdBcTHIqfMW
 j0lhCeMP31JXITrcOiEWSsD1oTDUFa5L7/1yVOJyubRFfPGkI4PbACOcADt6ijKdnjTJ
 xxUsFjlLp39zkSy4cW7E57GuVxPD10OF7Pd65/z9i8Ppqk9YRMfv08RrMhBFDJ9hcyQg
 aNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XT/5ko8xXdFB2oZI4c5/NazeRRBkHp1p2r7GLP5NiZo=;
 b=bAw4caOXHmlaSLBBR9gQ+3L0Xc2Kn1DclAp95A1ujDajFsKhUUXj+ng6Bi/aP9+crQ
 BRR4Yn4bIH6W1dsmQCyH0M6EVdSNS0/PGnW/lxq+RH450EI5MHjTJdATR7HD8bGRzXoR
 1E5rO/A11MxLGF4UZlUZ0qN/TaT3BUgrylaIy9iHar+5gxUZJMnUc1AwRlhR5qDnRYep
 tRqOXfRzxFovC28V4/Sl+mBPK12kOaeihmO5jHk6ddVwrD2o2yz+shoE0TsrOF64FRyw
 6VUIMSRWfqW88NQogKHckWuGAUoxBBNooGoao6kfYq/7h14lOb9K5rAZy+HbP96HSP0L
 TUfw==
X-Gm-Message-State: AOAM533R6M07x6Yws3YrHWyUU9/1QOzQiV2AtV1VFU/cNliNgAenE004
 B8Z0mhulexc2cqTYQDZYNF1RIdy49HRJZg==
X-Google-Smtp-Source: ABdhPJz5yMnu8uf/VrpsOmCgXAq4/c8EiSCCqW0SSNTcFICdT+pgpDtaEb+G4lK9W+UaQ3zJL5JJQA==
X-Received: by 2002:a05:6402:2752:b0:423:f9:f335 with SMTP id
 z18-20020a056402275200b0042300f9f335mr801538edd.22.1650028845224; 
 Fri, 15 Apr 2022 06:20:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/26] job: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:55 +0200
Message-Id: <20220415131900.793161-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/job.h | 2 +-
 job.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index c105b31076..397ac39608 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -436,7 +436,7 @@ void coroutine_fn job_pause_point(Job *job);
  *
  * Yield the job coroutine.
  */
-void job_yield(Job *job);
+void coroutine_fn job_yield(Job *job);
 
 /**
  * @job: The job that calls the function.
diff --git a/job.c b/job.c
index 075c6f3a20..20f0d8b2cd 100644
--- a/job.c
+++ b/job.c
@@ -525,7 +525,7 @@ void coroutine_fn job_pause_point(Job *job)
     }
 }
 
-void job_yield(Job *job)
+void coroutine_fn job_yield(Job *job)
 {
     assert(job->busy);
 
-- 
2.35.1



