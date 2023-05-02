Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040D6F47FC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:09:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYu-0002pF-2Y; Tue, 02 May 2023 12:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYg-0002lp-As
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYd-0000bE-JH
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315712406so176606745e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043729; x=1685635729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swNKPZEVj6WtYC73JG1+6YoXeoe7hSurM9orzPiUbwo=;
 b=lU1/ibpnqpfJiYuMWerOE9tpSd8zNGHKudFU1bHPdm5Yq0ZAH5q+/kTAtZYLJKeW/A
 3tN1cEI9x9n4Ee+KL0szoCml1syXB55ug40QovzmfZOn2hFCnVimZyNGxyF00nCcZtBl
 e9gG1/mSFYl6Sx9vP9emyWvdeOenGrjaM/nFhiOhHcerE+Zs19hymlDOkGFDLtM5AbI7
 D6N84vncxkvgxfH6rnXrFMwDCEvTEMDk4m2lWk42HyvGjlYZ6VZHYxBBidXUCns+swHo
 L8wCjay3CPJK0VWfbnMiS1c+Uji0YivIuomjdxiVVzY1XRyvX3Gm5rJN42q236hdjTqc
 rqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043729; x=1685635729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swNKPZEVj6WtYC73JG1+6YoXeoe7hSurM9orzPiUbwo=;
 b=kxWKfqX7J808a4qtjdvBjsEi/VHmYuRVvmJ78YlXODC61SBAam4Jx4UkjrI/fUzpt9
 NUSmSiG3IFurfWGSrcTsUSw7ApMow1kp0B0GCHLWZYF1ULr6cdKzORN/nl16wUbr/2sQ
 5vGjAdJZ2+DY6ruLCQHemTVXFiZ+bEGCvYpGQgg4KmjvQfgZzyTa+qkWVmoejEgpYFB1
 l0GDIMK4xLIYntG1MtePRn4bTe5/HloPlbxQtJhxi1U5DEAPuYTBBX99+X/JsOoPuAXJ
 Phoq5CfoCHQKPCkDye45zL0RE1NvxIs5ams+eGEJkDrcrmjMUnxu1jXeTHTaeb0UjTW3
 goqA==
X-Gm-Message-State: AC+VfDyVO24raCJj2Ksi7x+UejuxNM52aGhpxJGPYI2g9lDTD4UnrJsT
 bM9q0hKEOZ11NKW4pcHXNPcGTu631KD7v+e3jmPDCw==
X-Google-Smtp-Source: ACHHUZ5ZJJfS/GzEMIgdUg0EhdR+axpXhnHzMrZNjmdgXgZbK+exsU2rMnalcth/aHsG+wKe3aGQ2g==
X-Received: by 2002:a1c:4b12:0:b0:3f1:70d5:1be8 with SMTP id
 y18-20020a1c4b12000000b003f170d51be8mr13425364wma.15.1683043729603; 
 Tue, 02 May 2023 09:08:49 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/16] target/alpha: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:33 +0100
Message-Id: <20230502160846.1289975-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/alpha-linux-user.mak | 1 -
 configs/targets/alpha-softmmu.mak    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/targets/alpha-linux-user.mak b/configs/targets/alpha-linux-user.mak
index 7e62fd796a..f7d3fb4afa 100644
--- a/configs/targets/alpha-linux-user.mak
+++ b/configs/targets/alpha-linux-user.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=alpha
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/alpha-softmmu.mak b/configs/targets/alpha-softmmu.mak
index e4b874a19e..9dbe160740 100644
--- a/configs/targets/alpha-softmmu.mak
+++ b/configs/targets/alpha-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=alpha
-TARGET_ALIGNED_ONLY=y
 TARGET_SUPPORTS_MTTCG=y
-- 
2.34.1


