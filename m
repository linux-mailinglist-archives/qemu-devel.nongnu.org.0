Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47152F6A9
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:18:07 +0200 (CEST)
Received: from localhost ([::1]:55622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCoo-0003bZ-R3
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbu-0008B1-UB
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbX-0003zs-Gf
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id f10so9289113pjs.3
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uw4gme9KuFW+TrMXShBM/0VdYE8dR14VXRbCtedKveY=;
 b=GU/lbfN9x+xzTekgN+OiO0SqHqcZnaW9dcvxzGvULP+FF+hrsy4O9e0HlvxK95RZLx
 +eLT+kVA8WdzYymv1EQn93SSBBbVZbsk0tACVVTPAsdRbj8kVyMShJ3fAnctAKjluuz4
 /WH7+RoQE8Vx1gEGB5iRZZGtDPm/Nto3511pCJ6r0/L7x+ONtGTSNtsaJwPvWBlCacLT
 CaPTpRKrYj0OO0RFGzZTBkumtY9f8tlVwJHmiYqRD32AR/c/5OxLDp85kqcgaRGVl9Ja
 mRYzKm7OYjyo0LaiUJTJ9FSDEwkldjFSoKLmj4CFW569sQCIrs8LkDKx/rQv+MczOdME
 WkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uw4gme9KuFW+TrMXShBM/0VdYE8dR14VXRbCtedKveY=;
 b=IPCMLZlkeiAlqTxalBGnIrE02g4ps0brHa7ZuFGtQMgyw1xRhK8VnPSczOt2Yfxt69
 RDcRBTTVBHIqN3aIRBEfaDFJVeMp+rFBb/5iBkQRShqmV+O5V3RXeExPrxvw+H7ZK+Au
 UlD3fWHwc2GcKoG1Q1LFjNjt9XBDdLH2X62PS/4SRkmzv+HDasSve97sXMGnxwMz5Cu1
 efMstwQEhOQ4Fm8rlP/eNwUtPuriEtF20MaSIMcxI003NCzpMHJS8sCFoj8j5T2+pthc
 sYz33fd3mQSZv4jTecQRfQRn5pPHO2T3PAefsBZBHxbO2PDMehabgXVDMVzi/MyAw9go
 Uu4Q==
X-Gm-Message-State: AOAM530jF5SR6rhis+w+WypIRqQ8NCj4tnrQypdo2ySxsAyVTlkGqyti
 qkV5zkd5njaD2NSC0F/2gBwmN8+iRIQAyw==
X-Google-Smtp-Source: ABdhPJybaVfOmVnzMUqn6bHR4BTEhIMNZ3EC4mzgmN9832Y9R5w9N59vOfLxA91HAW6koj49/9SlLQ==
X-Received: by 2002:a17:902:8504:b0:15d:2c7c:ceac with SMTP id
 bj4-20020a170902850400b0015d2c7cceacmr12345284plb.130.1653091458109; 
 Fri, 20 May 2022 17:04:18 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 13/49] semihosting: Move common-semi.h to
 include/semihosting/
Date: Fri, 20 May 2022 17:03:24 -0700
Message-Id: <20220521000400.454525-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This header is not private to the top-level semihosting directory,
so place it in the public include directory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 {semihosting => include/semihosting}/common-semi.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {semihosting => include/semihosting}/common-semi.h (100%)

diff --git a/semihosting/common-semi.h b/include/semihosting/common-semi.h
similarity index 100%
rename from semihosting/common-semi.h
rename to include/semihosting/common-semi.h
-- 
2.34.1


