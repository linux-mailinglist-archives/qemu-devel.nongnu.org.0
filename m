Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF326A6604
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeh-0000EN-Jv; Tue, 28 Feb 2023 21:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeb-0008Pl-5W
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:17 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeV-00036T-CQ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:12 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so12589207plb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3eyuczgIcTR82+7OsUk/8AUE/3umFhzitmX+0QvFRM=;
 b=Yo1cF+6JaQB8KRrrJsEQxwzmbO00eqrhsMlhZXuG51tdLTuTY1K75xd3nvJqsYXQMN
 J9ucwpuQzW0syHBfLipdYAWX1HOgj8f59nowsBWpjELBYjVUVH0AkI6Fofm1tK8S7wQH
 Njzmt2ZWrKJE2AmhhTBU2WU7ZZiyOgTwSsgv1d/bHwdO8hKd7lME7LjRM4zT5o0BmXqj
 zKm8mBNaEmD5RIbKRtUcv/C+T+6uTFnzfMc2tP0GQ6XflyklXtyvBJ+9C2FxVt3U5C+9
 SI5w/NfSZLtAFCNWoKTa2ezOiXCCLFxGgmGCrXcbrbEp3ecxuO+/g+ZjKFNThBmV9E8a
 A26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3eyuczgIcTR82+7OsUk/8AUE/3umFhzitmX+0QvFRM=;
 b=ao/5kJ4v3322KPd6DGVBhF5pFZn7mEnYPmvKnMai4pwFjoAZ3ikU+NI6cRi3uhC4t6
 32apTdlCT5uIzrc4oFAPu3l0iM4YcRtri9ctU4Ew5ozps71OllzqgMevRHtnMGAOkBdj
 hGhPUVMZOwCzudymkvghcaumLA4B7CTDVKf+hOgnUDPnd9IyYd4gBRdao0atbRUWbxbT
 l/8rgo4mYfX9NTHys5c4jY8XURI2YFuqzu1AoATT5rbqUDASL36N6Vcm1dL/zytnpgHV
 xyhRjDpXq1h9SAXZcvb13IWUrcLFf/TDp6WyOCcv4lnDj8fDxC7Vz/+T+YzUR1412Qv3
 Vn+g==
X-Gm-Message-State: AO0yUKXdeenUpRh5SHhgH+E+6674eKUipnhVz4uRZ2TbLXzCzoP8rtoJ
 cRe233QIBUB7LtO9XFXYdGWSlqu9ncTjmadDrn8=
X-Google-Smtp-Source: AK7set8yO76KFv4tRnpca8MB9oR3F/cbfVLecxXfmtfhjPFdW9Bc7br5z47BWkNOkxTooVWIlq1Ajw==
X-Received: by 2002:a17:903:187:b0:199:1996:71ec with SMTP id
 z7-20020a170903018700b00199199671ecmr5692709plg.16.1677639428796; 
 Tue, 28 Feb 2023 18:57:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/62] target/arm: Remove `TARGET_TB_PCREL` define
Date: Tue, 28 Feb 2023 16:55:54 -1000
Message-Id: <20230301025643.1227244-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-10-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 53cac9c89b..b7bde18986 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -31,8 +31,6 @@
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
 
-# define TARGET_TB_PCREL 1
-
 /*
  * Cache the attrs and shareability fields from the page table entry.
  *
-- 
2.34.1


