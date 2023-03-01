Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8D66A65DD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeJ-0007tw-88; Tue, 28 Feb 2023 21:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeH-0007tb-Ng
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:57 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeF-00032C-WE
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:57 -0500
Received: by mail-pj1-x102a.google.com with SMTP id oj5so7939319pjb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ft8WH+FuBF8I8ueEJPXs4vslDKFeqOJg8UxKh9LKx00=;
 b=YtN/g0ajufLv125i4RT/4WCgIQmRcDCE3oP96gf0ERIlMkdgx5lJisWOkH6xwqic3j
 nGrYFcpJGMqYdG2k1awJdjqBwTEKd4NaKmaZjmzbNM25XGCbFNuXrqhoUad3B7P+CsBn
 JDxJ95T/Drv/DoCyk3fBl0YITXg3yii+xFi9fwccpyk+xCCqjrsulnEJ8trKoPu8aPvG
 4VJTzeyLaZfi3i/M8kdApCMvS2C2KjhwADoBmeqeOEBopSQodw3rJJTMhDfr5QBAjILz
 jVAZnAI/cBiSTR5gHXbBx3NkEzx2ZkLrIT9uRuXUCnOyEKseDm7qwerUFuh5rGNY97C4
 P5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ft8WH+FuBF8I8ueEJPXs4vslDKFeqOJg8UxKh9LKx00=;
 b=h0HS8dcTR99p8sHG36vbjTs2PpL+1EjJUEKQ21qriO4sXD9DcsMz8+AsY2X72bGY4g
 JdyPi4Ye/wS14F1tGJ2rV3RLAaw54F+kSvYqCy2qy6ccXaeipp2gfal6WERPoszfWJJa
 56F09GJ/uSdOo2Oyi/OcyPfA1KGzXakdsDhCvbG7WGDfCcoWEb7+L2YeAdF8zZpUPQrm
 QTFNmkWLO/EPnrjDxh62qRAfig5dKfngejKxIZ21mUtcfMJsW7ZiEU52RM2aEDMhlKzQ
 4MxrOY8F+AXW8oTqXigFA3X4JgLXdZbxFM9QzSVCEa+I+jEydgZg0aThpxOXie2drMN/
 mAAw==
X-Gm-Message-State: AO0yUKXdRfFWwd5IL2GhCzjn7VK31xxPGvI3PZQYn/zPtPZecgYwSbGW
 xdFwmO8rEeo5DHtqFsfSrNg4Rxn/wN4SvOIyeUo=
X-Google-Smtp-Source: AK7set8Peyye9WeZ/acQ8gYahYVJ1SoG7I7xw947fMYvLeWtPwhWQU+ZSH67G4VKRlCSkpEM6Uczmw==
X-Received: by 2002:a17:903:2308:b0:19d:16ed:3e34 with SMTP id
 d8-20020a170903230800b0019d16ed3e34mr6258849plh.26.1677639414638; 
 Tue, 28 Feb 2023 18:56:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/62] include/exec: Introduce `CF_PCREL`
Date: Tue, 28 Feb 2023 16:55:46 -1000
Message-Id: <20230301025643.1227244-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Adds a new field to TranslationBlock.cflags denoting whether or not the
instructions of a given translation block are pc-relative. This field
aims to replace the macro `TARGET_TB_PCREL`.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-2-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index b631832e17..1574eabac8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -546,6 +546,7 @@ struct TranslationBlock {
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
 #define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
+#define CF_PCREL         0x00200000 /* Opcodes in TB are PC-relative */
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
-- 
2.34.1


