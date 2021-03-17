Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5433FBDD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:37:27 +0100 (CET)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfjB-0007j3-VZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff8-0004O5-NY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:33:14 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff5-0001uF-UC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:33:14 -0400
Received: by mail-io1-xd2b.google.com with SMTP id j26so378672iog.13
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 16:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=DShY2OX7+CmpIs9ptXGSZ7ZKm5RRIVQQgd7ECvdiluNjj2N30+joFUYTgnkT04Xh6X
 JFCOwfQ3YeuRwnoehRDVCuVVja9Udjb8l9y2YWNBoUCo3rjT+mxUxlz0W6UAB9PWOBqd
 hHwqPAx8hnzhe7Zsvo4AErKkkucqRmZDKglkZa0gnYCqK6rDqz37C6UwLxO0P9ZUmNHy
 TtUP4NasdndFbuFJR7tX1qX0ynAlSKh0135uiYDPVsPTYgRAkK/SaM3A4QloCwhGS4T8
 Mqxm4Hh3j0UbAvM3nFNOMNmIpN+ufuqxjYy3gCCrzBRRp/E54yP9lVZfZ83Ucbs+to2R
 p/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=q9sII8f/q/RMbLfRBiEd/gR75XoFi5Ax0TyRPwmUFv17g5hQ77gBsN7Dd5WxIBJxIN
 bKZ3E9EbbqjNpoiF1pOlmbV/rjmdOOl497CVFOk1ieGymkttSRgun1p0EVnYUrrZgmRA
 fFtEFeTuvuxHF64KF0rqMylvz6/0uURJm0lUrKVUWVZgr2YHFz6rNfdJ0GnNr9DQ3oor
 kVVm97JNkC+XHEqqLTYsnYmXQyP1/sYiEQwREvj7IhTihat6UrOvKWjlPWXNnGvRx8hD
 bv53n0edcY1TpFjwbNmXoZJ4WAQJTH1fHPWk35aSfVHKxIbrhhXxQjiFkKuSFriPOkm9
 gfVQ==
X-Gm-Message-State: AOAM5332Am4F5hS9PDMMl+HNUGrPhk65Yb9XaqGo1h4OkOz02HZTOZGV
 qd0I9mJat7gjUdWMjP9+YU92CQ==
X-Google-Smtp-Source: ABdhPJxLnanXngGx6RqZ4dR2s7IGwTgICzVF4tXZEop0am+Bjjin48ewAj7klxnP+mvdUjrPiRe3yA==
X-Received: by 2002:a02:c017:: with SMTP id y23mr4836204jai.3.1616023990989;
 Wed, 17 Mar 2021 16:33:10 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k12sm235183ios.2.2021.03.17.16.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:33:10 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed, 17 Mar 2021 17:33:01 -0600
Message-Id: <20210317233301.4130-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317233301.4130-1-rebecca@nuviainc.com>
References: <20210317233301.4130-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2


