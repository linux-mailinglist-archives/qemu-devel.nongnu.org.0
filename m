Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B3664B6E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:44:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb7-0003Wt-Ix; Tue, 10 Jan 2023 12:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb4-0003UX-V7
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb1-0001Gh-5H
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id v2so1584590wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXFxyJRI2iR/xunMULJui4KM0BQsyU2Vc+mAIPXoOSM=;
 b=Q9FXpp+LMQLJXSxBjuap6LoOG11HDSKTDs6+gotY7/qiJySt0pxepIoHKpTXpHATP3
 GIhv1cqEb5DmeWuCJY8rMbHJLGYDwiR2f1QSRSYmvRVqDd9vuy0jpBQarZs9y08S6Yq5
 IkUOnHntASQRzK7T6vy6Y/WdZodftWcE1BoBguvw2r+qHCMxj61U5gYbZpA5MNMwfjGe
 Ib1obRxtofIpx+AxcsOO9ClJk9TyZfehlgsBX2uaNWM+sPewF406WU7z/L18vSBupsGm
 8460NuVzrAG3yYegyMpNxDbusLAs+E++okQIwz1/8+bbezPGlVHq/mjCwsf3Vx5VyAX2
 R7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXFxyJRI2iR/xunMULJui4KM0BQsyU2Vc+mAIPXoOSM=;
 b=dhbfIqKdLWEOrSQGMWnegzVwrQgXYg6IjLkJDwXxd1zzqevas0JWRUtCF4G7u2iRF1
 fs7kfNpqIgrbhkJpE0CtxW4CTu8+rOJvF9gKH66ZF6bNmr9mrmV48wscwrGD3nfrr4Ev
 22RBibncg09dC3hCTZbOIGCbvIOuhlaJsFZAGIqVRQIzwV1iBF8bDQELbBakfLYOaE0p
 zQDSPVbxzPT54PZZu6I8y4GiEhf/nBSvDgZKm7R8pgOFKVSjBZCI+wmwhQS44YH/o+AS
 E1Mn9Gg/b8oY8EIS2NNKx8pCAb+PbZEgR5+QaiwehdyHoGEN4KQ2xqllygwB6fE7bxaC
 aDkA==
X-Gm-Message-State: AFqh2kqjk+YTsxmUQT9OTsXi4ctefxz7ybmIsBKYqQS+mHgAUjKMvGpH
 xdlJqcXZZEhCjlIvInbaR1lGlQ==
X-Google-Smtp-Source: AMrXdXucUtTQ/RuZ+GO6N1CwMWOshR5t4BJN/1buLLw/Q8YSQNbgHC3FgTlbxNiHVRfu7ayxEqvmKQ==
X-Received: by 2002:a05:6000:705:b0:273:7d1b:7337 with SMTP id
 bs5-20020a056000070500b002737d1b7337mr40397725wrb.7.1673372373543; 
 Tue, 10 Jan 2023 09:39:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r10-20020adfda4a000000b0029a06f11022sm11796931wrl.112.2023.01.10.09.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5EBC61FFBB;
 Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 19/26] util/qht: add missing atomic_set(hashes[i])
Date: Tue, 10 Jan 2023 17:39:15 +0000
Message-Id: <20230110173922.265055-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

From: Emilio Cota <cota@braap.org>

We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".

Detected with tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230109224954.161672-3-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


