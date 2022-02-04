Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E14AA168
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:50:16 +0100 (CET)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5X4-0006r2-Bs
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qp-0006gF-Ex
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:48 -0500
Received: from [2a00:1450:4864:20::330] (port=35447
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qn-0007LF-AR
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so1431948wml.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dWP+twRL5MOC0yeCWZwM8XygbnhyPigiSEVdDfOE8/E=;
 b=KQKMbjoYGnKySgADQZuuqs/pIsNmgWa2P2kxbVfnPyiu27qkLeJciAe1NLXuv3qsT/
 RJaEr2bn1j8bM8yHPTnJoF/yJBWDsuzuNmkWKMdia1Gq+tN9SnRpx8UGQjCWu2WGYy2L
 lj7FfFvZ9meI2fKfOwYKHE7KIp0aqGcsHZfXTtnqHiD6K4vY2fJ3VVc2lOo77RxCwZuH
 hhtw8aWSuZp4QMPDSXQpZ6kZ74ONKDy3HbMfM4ZgrHsLPV3WHSLG/nJVzBPjc10IyOZJ
 /zQQZ5NBBtysGWSl7vDSmwCCXMMFwVTYNw1wgcjAgTqDZxgBU4OnWqzcDxbuBLSI+ESg
 d68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWP+twRL5MOC0yeCWZwM8XygbnhyPigiSEVdDfOE8/E=;
 b=TiRpZOpwMedpo4AmKLlm+63Ig9GveaYKOr9QGrnIuInaI5pksLx3QohvGSC/LTlODh
 OEdWV1PvzDZh1AiQ7RVeaDg06hKYn7LuK7eKsxt0PtPprUM8LhaWhk447VsaEyKRp6e4
 8imEcC9pUhjMwzC3COqkYIwWj9kr3oKJyxiNLDhaQOAhSIDH/oduNKv22KHcnyEj5bqZ
 IAjmiWixooJRxpWIDpUfgznxwgaE2ByaR40smRvzAt/Qgiwsi7TpFQvJkJjXKILc7RIW
 IdsL869iEYHKnpnkbbEFhjBwK+nnl56xFDcbifiBLzeJAguLFP5vw2j6b3J0s3fV/OvH
 xmVA==
X-Gm-Message-State: AOAM530T+7bjQEo4xIMrvfBX9vq1ETHHkTlGL7ibhNieUB3Js4Olrw8d
 O0BYq7Dh6bdbYupdqLAVykJkpw==
X-Google-Smtp-Source: ABdhPJyEcohvP0YDv5WF3bItekarKQYuoW+gMPCmBq6lJUel5nBmhsVA2vDysmMab6FnTcRaVZID8w==
X-Received: by 2002:a05:600c:1c23:: with SMTP id
 j35mr414226wms.138.1644007423565; 
 Fri, 04 Feb 2022 12:43:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm10098358wmq.39.2022.02.04.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 679981FFBC;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 04/26] .gitignore: add .gcov pattern
Date: Fri,  4 Feb 2022 20:43:13 +0000
Message-Id: <20220204204335.1689602-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

The gcovr tool is very messy and can leave a lot of crap in the source
tree even when using build directories.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220124201608.604599-5-alex.bennee@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index eb2553026c..9726a778b3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,3 +15,4 @@ GTAGS
 *.depend_raw
 *.swp
 *.patch
+*.gcov
-- 
2.30.2


