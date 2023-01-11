Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A576665EE5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcqf-0004yl-Hc; Wed, 11 Jan 2023 10:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqd-0004w1-Db
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:03 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqa-0001ON-EZ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:03 -0500
Received: by mail-il1-x132.google.com with SMTP id x6so3415604ill.10
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2T9PH4pJZ9eRkBl3md21WXq4XJ379Vi9ay+aelpYvo=;
 b=V9VbEq1o0Nif0/J3SG+QsOqnpHFRKKAxKMhTtjMjRZciYez5TwRZRMO0HCwvmxyzWg
 eg2Alem8MpAKeVmZQN8wiKhI4TKRgmhaJTkjWxjCUvvSUvn5eVhHWByoAHK7Wtvvp7xW
 gwXIH57uUQpjER86u+tbNR99AhvBzR8dj3pTtz+8tzqZaxwSlRglac9m3xSzUjHSzgw1
 xjKh6GbY0n2M3t3IwykFHz6FQ1Ck6lQWvAoLXpHV3nMnN+3ksZV9MAISbc7v7t8Hr/yU
 cwCJjyfUApokgSjoJl/8viSFnAq+F+WSjUqz10wNMj3nSyINgLSL2bT9n0fjpNzrAl2M
 i8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2T9PH4pJZ9eRkBl3md21WXq4XJ379Vi9ay+aelpYvo=;
 b=fEUs51dLxSEbJnfluYo5awoZLNLK+tkwmvSGdhMQvky2c4ZhpdfV5ak0kKI4qQhS0c
 gUBA5C0yfP/UADec2/fQGZeybwwM/iup9/G+l/wOnlX4ZQQyuHdBbs+ZAR0Hx/yZpdKK
 mNcQ/LHdVcdYVVhSJUpDgQs+oQkI7WtNYkzzDGtXNTfWmjlueWoxVeVu+XP5GArJBbIh
 Jvh6rQuIJTpRpOjieeGTlRAsvIPi3cdI+6XtuyyAr5WHjbsiHht78eraOfz+onqTFMb0
 p13MaOlluBAc/IB3v9YFugQqx9tp7A5qBUoVeMWJDRJOkmdVKYB34Pxez68LhPajWRb7
 JdzA==
X-Gm-Message-State: AFqh2kq31wWfaOKobH990ggZCQPM9fFa3HWVW15uOVmwRO0GKbGsl4bm
 ZDYxL7udaJ+mo9UIH9HVgU7lADeYxoKfyhTPzLA=
X-Google-Smtp-Source: AMrXdXvIYL9qrcWCtoR0sOt4nj6/JUZg8PBZYJn8x8LOdtv5C17PKTrlWOKsBnFqQhiR0GFmmbvAnw==
X-Received: by 2002:a92:ab05:0:b0:30b:c4f0:f7f2 with SMTP id
 v5-20020a92ab05000000b0030bc4f0f7f2mr44070925ilh.11.1673450218839; 
 Wed, 11 Jan 2023 07:16:58 -0800 (PST)
Received: from localhost ([37.19.210.30]) by smtp.gmail.com with ESMTPSA id
 j21-20020a023215000000b003748d3552e1sm4545772jaa.154.2023.01.11.07.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:16:58 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v3 2/5] util/qht: add missing atomic_set(hashes[i])
Date: Wed, 11 Jan 2023 10:16:25 -0500
Message-Id: <20230111151628.320011-3-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111151628.320011-1-cota@braap.org>
References: <20230111151628.320011-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::132;
 envelope-from=cota@braap.org; helo=mail-il1-x132.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


