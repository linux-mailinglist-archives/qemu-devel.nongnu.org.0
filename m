Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F162E2FA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:26:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieF-0006Qa-OE; Thu, 17 Nov 2022 12:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidw-0006Hm-Ht
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:42 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidu-0006E1-RI
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5640244wmb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tqH/LJ8p6IB5IgfabSHUA1BeTb2LXLwtHowvhXmA9sY=;
 b=cAwayni7W2Reiyq1nU2mig5YDDVjYgCQiYSm3bY7mBuktSZPTvRg4y1AaC7DGioKzK
 WV8aZz8omzIFVFVnK0fgsJr4781hhvQfLOTWHRXmplqELWslFl53Ii7T+ioLRQtq+qBq
 HQ+HeYK2TZ8tmuJXKiWX7ENgnYm8jY/2EZwlyrfb6mdpiuk8nJ5Psy/2ankF1G9Bi8hl
 v77MRw0w/8DWtsTbyV6Knj4LFGIJy9Qfdgby+dGpUR/HrGglEEK91vUklO0wIOz2ufWA
 lTb8m1SWkBak94a2Bt9z2n3lqzfCG1k/hPIC0ch+qGcwMI7CxIQoIKWhX2hRWFCbZK3u
 Cw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tqH/LJ8p6IB5IgfabSHUA1BeTb2LXLwtHowvhXmA9sY=;
 b=fEqQz0xgEvT6vpxW5pUpuI5hNdPHuGW/AQJ4wGvDK8bEkizp/w+y0ArHM/ImhVByuz
 rn7xkhtBgoVNAxxCxQU5UCk0/EthlGpj8RDJItiorf4L9WZTX1yevPT/ZocS9M7id2sK
 v5rRIu/gjUNyeD1h7vi6OO+Jp7G8hxBoLdFgv8lXUng1UUKXCW/tx4wL+NbSIoW8lf51
 7l5gUVM8A0ZvzBY80iuhw8rgpREuxof+xOHKXJdUeRS4HjrAz3sP5ccvMl3BELsIUoHE
 Cr6CCixh0e+/o9itDj+1QdpUE+9zabwpPZJcOg6+nQx9+U6jCAN5r7/svrGQLJyg4+sp
 ezpA==
X-Gm-Message-State: ANoB5pmY/3ZrVIDr7spNNWCw1mnCuBn06INyV+FgbvJ2jP18CdgYgcuJ
 ClVgcCntJt9YrayjMmqzIRlvkg==
X-Google-Smtp-Source: AA0mqf6ALdOURewTTGYyEvtxLK86qiLjP4P5PqKO1lVRufYO2gv0CyhNQh5g/jERZIgG3LeH0i1ShA==
X-Received: by 2002:a1c:1907:0:b0:3cf:91fe:25a2 with SMTP id
 7-20020a1c1907000000b003cf91fe25a2mr5930378wmz.69.1668705937184; 
 Thu, 17 Nov 2022 09:25:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a5d61c5000000b002362f6fcaf5sm1543746wrv.48.2022.11.17.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 579C61FFBD;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 05/13] docs/devel: make language a little less code centric
Date: Thu, 17 Nov 2022 17:25:24 +0000
Message-Id: <20221117172532.538149-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We welcome all sorts of patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221111145529.4020801-7-alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..9c7c4331f3 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -3,11 +3,11 @@
 Submitting a Patch
 ==================
 
-QEMU welcomes contributions of code (either fixing bugs or adding new
-functionality). However, we get a lot of patches, and so we have some
-guidelines about submitting patches. If you follow these, you'll help
-make our task of code review easier and your patch is likely to be
-committed faster.
+QEMU welcomes contributions to fix bugs, add functionality or improve
+the documentation. However, we get a lot of patches, and so we have
+some guidelines about submitting them. If you follow these, you'll
+help make our task of code review easier and your patch is likely to
+be committed faster.
 
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
-- 
2.34.1


