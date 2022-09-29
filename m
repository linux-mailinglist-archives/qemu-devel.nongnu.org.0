Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64B5EF791
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:32:29 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduaS-0002F5-OH
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3Q-0000fd-TA
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3K-0002NK-0H
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l18so1768582wrw.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iXjhbGFiizhYgxb67PGBdW+eyz6XqT6azX1gHARCrNQ=;
 b=ld3QHLog7HE/sJ7fEbxfh9V7wvcKor0nicTUo7Gpe+N6No5Jhbs3uvCvZEQjYeom+X
 A+zBwA7N57e0ucbYWqGVe5enOghIyJcK3FmOlKbOHyeaocQDGwYSV6nCmDYwdNQZKrwj
 XNknr4lernKuBTduMdlFk+1ekyA27bFOSm4h1Xvk92wgyffFWnUFe4mIBJ1CXteePKZu
 PPjLUSPU6rbdfIcjGUKpj/eWLl3l+bPmcf5MAldUhGGdxtsJ8Rw4ybeOn3e1faQpiGQM
 glRaJ95dAe07E6yrtglDYgHIiajXxQLQ/FfB+kFJ3oGEX1zUNnE4fjp5R8ZGugc82xHg
 +DSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iXjhbGFiizhYgxb67PGBdW+eyz6XqT6azX1gHARCrNQ=;
 b=awOl+BF4JPo8Vr3ZgtoC2eAXTc5fWVF4Kkffbsjdi9zD3zwWXrbOuenh60njbu1egt
 DUAFWUAc4ogWSl3dj0swrGfdQzH1dA0yeJX/+dbmlvnBOIWPHXFckOCokv/VPk/3hI7B
 T7zPaLea6O1zb4CfhgovutAd3AUsXiFcvI1Dl9WwE+zfM/L4E4TmHEIQjF+cLh8vbv8m
 ndBQDasBZTT9j1mIUgnWPlryjIyuwTfE+vSvDqPLssZxFKDOVJC8K+FnyrPq5QMAltlD
 x02FTEbhUBhRw+H+ZFu2XMwCFXjokoRQBxZA06u0SmT4laUZ4qpFYafLtlhboh9KISUU
 rAjQ==
X-Gm-Message-State: ACrzQf0JflmMfL9zh/Apieg1LPy/cf6YhiOr0xlZHLd0whCpG9L6TUiT
 GA9MZkwcqVwgBEyBJ9amKsgVAA==
X-Google-Smtp-Source: AMsMyM5EYFV+ghKOhXwUQxZ4Z6Kw3T5bxszuwaZgiRGC+QWhuRubozBKR5ghLeSmhAd1rGNPrVuJIg==
X-Received: by 2002:a05:6000:184e:b0:228:bb9d:f98a with SMTP id
 c14-20020a056000184e00b00228bb9df98amr1858327wri.479.1664452201095; 
 Thu, 29 Sep 2022 04:50:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b0022cc0a2cbecsm6154159wrv.15.2022.09.29.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F23771FFE5;
 Thu, 29 Sep 2022 12:42:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Brook <paul@nowt.org>
Subject: [PATCH  v1 48/51] contrib/gitdm: add Paul to individual contributors
Date: Thu, 29 Sep 2022 12:42:28 +0100
Message-Id: <20220929114231.583801-49-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also map his old codesourcery address to his canonical address.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paul Brook <paul@nowt.org>
Message-Id: <20220926134609.3301945-4-alex.bennee@linaro.org>

---
v2
  - also .mailmap
---
 .mailmap                            | 1 +
 contrib/gitdm/group-map-individuals | 1 +
 2 files changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 8c326709cf..1f7319b70b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -65,6 +65,7 @@ James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <quic_llindhol@quicinc.com> <leif.lindholm@linaro.org>
 Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
+Paul Brook <paul@nowt.org> <paul@codesourcery.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
 Paul Burton <paulburton@kernel.org> <paul@archlinuxmips.org>
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index f816aa8770..6322b3476d 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -34,3 +34,4 @@ bmeng.cn@gmail.com
 liq3ea@gmail.com
 chetan4windows@gmail.com
 akihiko.odaki@gmail.com
+paul@nowt.org
-- 
2.34.1


