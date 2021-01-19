Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A62FC055
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:52:13 +0100 (CET)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x2y-0001pO-I7
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wAX-0006jE-JS
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:55:57 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wAS-0004MX-CW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:55:57 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 30so13527136pgr.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILftOczXIkw2t0No3bY67GjAZBmVmXQbiK17IQ4lqQc=;
 b=HcDNksczI0GQQ1TLcBLkS01tq1vUYdzIupeKxsqAhBcHwDk056hUAot3G64peHhSmA
 ZJ78IYOaOP6Ee7y93N/zQsZBFxace+/N+1XCyoU7z+ynnAXiFccP09epCWpEc/GHQ6Ef
 mvCH3vm7GJKt+Z+ajPmiAvii4+HUtkI4YGB2kr7+Npkwku5CyufC77d0cutpbjgDg3JV
 Q5nowd6yYP+hovroDItPR1c7n4zcR4cOy2VanD6eN6vovmFqq9cXvm8jmgqKBfbwhAV8
 mMAzF21gxBVH+BPkTRA84RndIY2/2llBIIEXzoNDwx085AoSeThjnwU6JUXwl0RCtBuY
 sH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILftOczXIkw2t0No3bY67GjAZBmVmXQbiK17IQ4lqQc=;
 b=Yp1C1z4uyqB5WvaewJNy52J6MLBCmn+iItF8m5v7SEfnfzyHP6YQcrYgZuiN9pcpZ1
 VqCYo15FfZEtMKgz+ePjzOV90pitMvqB69Qej+tIpdlxguMjETGOTaM6J4edoLy2mdzq
 5KgdBlBEd5Dx8WGFmHBrJ3xoV9nCpaq61sjVg+VNrVKLKqzSd+tqhI+XHvfL3/dcGcPZ
 +58zimBtKc5sJ0Dsq9Qg1Z0KNTuj+ogDqHkGZ/4qJFzjXrGrVuKpuJZmoNbgsydfkBJq
 stArJJUymPvZZUyygR3aR3baIztao+R+tOdW4DRp88nn8zLUN3UpuxgVCghXCdWHySpH
 cCWQ==
X-Gm-Message-State: AOAM5318RSm1QYcwGTw2kZghQOt8osysEw2hole41ZY3bxNLfIvGWZDa
 0nbga70WL4OU+XT/GEXrApj3CcbbU5HMPg==
X-Google-Smtp-Source: ABdhPJxtfcCP9ziLO3qybKSniWUae94o1BW92cmqPBo9BVVow6oj0VAJjIsV3bsFfPchlbHiS1RHZw==
X-Received: by 2002:a63:1446:: with SMTP id 6mr5587394pgu.313.1611082545630;
 Tue, 19 Jan 2021 10:55:45 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b203sm3209624pfb.11.2021.01.19.10.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:55:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tcg: Optimize inline dup_const for MO_64
Date: Tue, 19 Jan 2021 08:55:40 -1000
Message-Id: <20210119185542.628456-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found this hanging about in an old branch, and updated it a
bit for mainline.  IIRC, there are some cases in target/s390x
where (via cpp pasting) we "dup" a 64-bit value to itself.


r~


Richard Henderson (2):
  qemu/compiler: Split out qemu_build_not_reached_always
  tcg: Optimize inline dup_const for MO_64

 include/qemu/compiler.h | 5 +++--
 include/tcg/tcg.h       | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1


