Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2362652E30
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7v1U-00006t-1W; Wed, 21 Dec 2022 04:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1M-00006Q-D5
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:16 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1K-0000Dt-Ff
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so10664800wmb.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etP2h5UOgxyD1g2PWXehDiF8c3xFUHhjjtIkvhRulcs=;
 b=hXHgtb5ez0wRnqQiZ9aT4kJ594Uncy8L7tV2J/pkDVcwSgh6mPXsfyhzY2jufoCeuf
 OY4rNGhkW9r/two6Zi9C1a4fq7gS83xPC0NMhu0YYQM52SodSMSOczMAFMuxrHkGG+g1
 svoZtB6VPTNGEMrRmxn0SqJHLTfvH72his8CNsEz6fJAtck+OwXuir+GsH/Qf83Nak5P
 UT5bIksNM+hFRLRscsJ4kNppdJDJaUZPPMGDSj1p+L75PJWFLzqcaqLZpXgcaztQ9+QE
 5YCi2NY5rsfI6qzxA/DFtpyDfeSh+PGIjfO0ilZS7W8ICW+DNe1YzS9nYbizQ3LGTgkX
 Qdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etP2h5UOgxyD1g2PWXehDiF8c3xFUHhjjtIkvhRulcs=;
 b=Ncc8FtDEmtczkF7LBJ4ccl/SfsthJCnS0cP6kwzc+FLWaZzxdNJEa6uqJjfHJphjKz
 TwEPwNFiKzHO5nMtqgxuGfJLwOoAPJNs5AVvMJSoZgCml9f2F027OntMtt7wUEBsMsx8
 hX8O9vduxNnXJwoigDngYK7cXBTfNyKqTmuzHxkpnzYHc1VxS1W71S43+axqA40gEFWM
 5/pmP/kXFGNogFlCE070/hI1UeHAHSVc9sm01XKWq5+8SB0pP+aVGBInyzbwH0e9F+Un
 4tFJymofDwo/e4scF++O4cyj8lizNzL0ipYVRr9+8VgW6r9gfLmFWtzJcr7G0IRL9z19
 Obow==
X-Gm-Message-State: AFqh2kpaQwXSc/wd8FqfeWTqy6jx63WlZOvwphABBQJbV0ElXu5rK6yF
 H3J1yDzofKXA4z91xq2YPbcEcw==
X-Google-Smtp-Source: AMrXdXvFgMbyEKURK32QoGAhjqaZmJRI7UEhrTvxq0vn5sGdRhI2oBFapLIdyfZLVRXTzCwvBJtIXg==
X-Received: by 2002:a05:600c:4f48:b0:3d6:8570:1239 with SMTP id
 m8-20020a05600c4f4800b003d685701239mr1284152wmq.16.1671613452872; 
 Wed, 21 Dec 2022 01:04:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm1714567wmq.8.2022.12.21.01.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 01:04:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF3DA1FFB8;
 Wed, 21 Dec 2022 09:04:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/6] configure: Fix check-tcg not executing any tests
Date: Wed, 21 Dec 2022 09:04:06 +0000
Message-Id: <20221221090411.1995037-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221090411.1995037-1-alex.bennee@linaro.org>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>

After configuring with --target-list=hexagon-linux-user
running `make check-tcg` just prints the following:

```
make: Nothing to be done for 'check-tcg'
```

In the probe_target_compiler function, the 'break'
command is used incorrectly. There are no lexically
enclosing loops associated with that break command which
is an unspecfied behaviour in the POSIX standard.

The dash shell implementation aborts the currently executing
loop, in this case, causing the rest of the logic for the loop
in line 2490 to be skipped, which means no Makefiles are
generated for the tcg target tests.

Fixes: c3b570b5a9a24d25 (configure: don't enable
cross compilers unless in target_list)

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Link: https://patchew.org/QEMU/20221207082309.9966-1-quic._5Fmthiyaga@quicinc.com/
Message-Id: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 26c7bc5154..7a804fb657 100755
--- a/configure
+++ b/configure
@@ -1881,9 +1881,7 @@ probe_target_compiler() {
   # We shall skip configuring the target compiler if the user didn't
   # bother enabling an appropriate guest. This avoids building
   # extraneous firmware images and tests.
-  if test "${target_list#*$1}" != "$1"; then
-      break;
-  else
+  if test "${target_list#*$1}" = "$1"; then
       return 1
   fi
 
-- 
2.34.1


