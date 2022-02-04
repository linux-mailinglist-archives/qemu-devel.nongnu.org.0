Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11B4AA15F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:47:29 +0100 (CET)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5UO-0001Gg-It
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:47:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qo-0006fr-Vq
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:48 -0500
Received: from [2a00:1450:4864:20::32d] (port=45817
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Ql-0007L6-Gk
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso4441094wms.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLdaq4nPs26ioB8IxHlRj4MYiTrVXXpGcD6fwPTNScM=;
 b=hue3tg/rpwlhRHUHqIGH47ep7HTVMqN9NKHPyJCTSulkmBb1/5LpO9AJLmRVpOb4tK
 WlZh8lg4+1lFx3LqfBZjGAZs+NLPS7Iz9V3yFgujpTLRr+IAv/5MCs2x8TXJcw5u/9C7
 kILRhBV6vPPLmEhLFtj2h8xo9OQ1AW61CZ0izrg+RCFMbr10dikgASBZWDPJHxUqIkKy
 ZEHKbn1doBLmrE7GGvkUQjp3bCSeLa22JWNy0Ic3EHuWKqesw58dtHqj+KSArbGc6z6l
 mzyffv4lkp/LisDosi39x+r3FzHN25BEUTINsrV1moci4/XpWe15TjdSnTGYbJph7+or
 qwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLdaq4nPs26ioB8IxHlRj4MYiTrVXXpGcD6fwPTNScM=;
 b=hdNo8zzdU23EYPePTXX/dFFQwdfQrGyHWbcEQtqhL61Z3fHLHyzkkud3sYOKO0ULlF
 sWc4cX3HBZnRkuM7+jDZHCk/jgbgoEYSklDNRpY+DyY1FBGwfKjQmGcKqaNrMXd7MpR6
 2XvbARPIv8SkhWZiUnC6FVG7Rlspc4aFj1eujWwUUkvqQez/ZOK8rs3DVPCFC1rEgCLN
 QjeShXQcFrzbfhoqO56LcIysvIgVWl2u3v4aLZYntjkvk1nZnRM4p7NxYdrKqPXtQwWS
 ZznxGeXs9pUAajoQQdMC0fKJIb8J9ZDibrmTblBLiav32wWFl0NZloAJNbJeEgu1fEpR
 JoNQ==
X-Gm-Message-State: AOAM531Yv0/fMBDhENIfztT4xS6gXAW4rNmjeQHXHenLW04UsEEfo9L0
 h33/icB213Gk/irZQL71cUB1og==
X-Google-Smtp-Source: ABdhPJwDxsmrYulY6UnVwHB+E9NUPxA3kIx5XZ6PB6p+S7ogAbwvibhYi5dnVJL7LPX/gljPzjANcg==
X-Received: by 2002:a05:600c:19ce:: with SMTP id
 u14mr3702860wmq.92.1644007421490; 
 Fri, 04 Feb 2022 12:43:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n14sm2904247wri.75.2022.02.04.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C04D1FFBB;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 03/26] Makefile: also remove .gcno files when cleaning
Date: Fri,  4 Feb 2022 20:43:12 +0000
Message-Id: <20220204204335.1689602-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Left over .gcno files from old builds can really confuse gcov and the
user expects a clean slate after "make clean". Make clean mean clean.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-4-alex.bennee@linaro.org>

---
v2
  - fix whitespace damage
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index db9a788601..e5fd1ebdf6 100644
--- a/Makefile
+++ b/Makefile
@@ -206,7 +206,8 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 clean: recurse-clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
-	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
+	find . \( -name '*.so' -o -name '*.dll' -o \
+		  -name '*.[oda]' -o -name '*.gcno' \) -type f \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
 		-exec rm {} +
-- 
2.30.2


