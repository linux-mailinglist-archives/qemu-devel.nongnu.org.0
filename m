Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB18663453
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0yY-0005jG-P4; Mon, 09 Jan 2023 17:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yF-0005gJ-PS
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:24 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yE-00077a-DI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:23 -0500
Received: by mail-qt1-x835.google.com with SMTP id c7so9396339qtw.8
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3a1hVR1tfeFDYLy7M6VisZhyTtrl3sivRfIGgYuupak=;
 b=M9GYJKWmf6W7sVLpYK4fc1KlCvVgw+xaFzt8J059ylUcS5P1hqyf0qes1StNU8RYEs
 dB/UJxkFw0mCl6hZDudgUKryz4jki7vjTjX3d7yhwsI16tIrHar75F3MO4ZgY7TEInGC
 LpLyYGgizMLfi6cw4o8sGY49+4RRjFaGhLK0oHedyEd6JyHMfRx4CsgtkASq7kgNQnxm
 Wb+4zafexMxJql/qhapNP2Lc+zqi9hP/Ga1wj8DZvvKqf+ZsGDcR9sfDxgn2VlUNATb1
 e3TspFKw2zDi7a4sFaFT6b4cCU40LZ/gicQwc6UQIptGoLJru/F8+ctih3ET/rL3fd7U
 sXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3a1hVR1tfeFDYLy7M6VisZhyTtrl3sivRfIGgYuupak=;
 b=Rpu8OjcM4GvNb8doXNLMlzhodlh9EN6c5RkoZmN/lX7/X7+rjo27R+OXm0nMHaNQ5X
 EJv1DnP7sVcai1Ew1Q3aqoBBL6ztM0GCcqjTh8YwPOTVgFt0r+WoUlKtUvi+SbVYUgo8
 4vQoRI3CKdFSwpPdVb9Gbze+KdlUbS2RqzLn4HWND945mGO1r/0v3NT9hcmUbDcLQZt3
 1OXFu5u3kQZelAArwuxKC1kiSFsdZsD5JkojNMGmVmjvuiGydXIV0Z91ZrL1TpeNNZ4w
 qTXsURAPuQKrtuRnUv923hBGHglA8ADvVGXPK4d1zjiI5n1kZZ/K3yBjz80bvKVRhfu2
 jPBA==
X-Gm-Message-State: AFqh2kqMQDJ8zIh/Wc/34XEF586saLyyrNAN6JakcXJZIn8tCHwwoaqH
 NcCLIhwfRXO5EWLkBuP1VRBNcvFVmBd9X4Rhiuw=
X-Google-Smtp-Source: AMrXdXuWFa+BukYL+cmPTSJwYwNfKi94Nz0UQToi/pguMiFgroeQGvJNAvAssZ4Bsuc+oSfQd0Jbfg==
X-Received: by 2002:ac8:58cc:0:b0:3ab:85d2:5c61 with SMTP id
 u12-20020ac858cc000000b003ab85d25c61mr79973192qta.61.1673304621246; 
 Mon, 09 Jan 2023 14:50:21 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 bs25-20020ac86f19000000b0039cb59f00fcsm5237182qtb.30.2023.01.09.14.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:50:20 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 2/5] util/qht: add missing atomic_set(hashes[i])
Date: Mon,  9 Jan 2023 17:49:51 -0500
Message-Id: <20230109224954.161672-3-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109224954.161672-1-cota@braap.org>
References: <20230109224954.161672-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::835;
 envelope-from=cota@braap.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".

Detected with tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
---
 util/qht.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qht.c b/util/qht.c
index 065fc501f4..15866299e6 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -688,7 +688,7 @@ static inline void qht_bucket_remove_entry(struct qht_bucket *orig, int pos)
     int i;
 
     if (qht_entry_is_last(orig, pos)) {
-        orig->hashes[pos] = 0;
+        qatomic_set(&orig->hashes[pos], 0);
         qatomic_set(&orig->pointers[pos], NULL);
         return;
     }
-- 
2.34.1


