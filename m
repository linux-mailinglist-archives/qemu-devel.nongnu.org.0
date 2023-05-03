Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317866F524A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tr-0005b1-Jl; Wed, 03 May 2023 03:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tc-0004uE-Nn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tb-0005cO-1D
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29636095e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098846; x=1685690846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOGh1Ai7brle/ORoosrr2+HdvM3iQHXrRRlmdgEhTsw=;
 b=bCtIhJgqU4LcUA0h+Es9DUCkFBLgtYE4CcJEXmhb2aBeCF6qcRkB8DMiP+vuEhP1in
 ZdnOama29AWOd3fCPpcyii30G0M7Rc/hKhvN38ofiJ5CdimJDYdhgcHqtjKOZMKz9kjc
 XHMJc5Eyj9gHrpNW3FylUQ2BDglpxatatf9cxi8QbkYzL0tSsdlT40JjeUxHTnP6OHtt
 LBHvlZyerXWxJRxiDqhJ0AMyfFp+nVWmW8KyTk3Fbplkvm6i4ZXo8uZIt5Q05YyrI9N1
 PcSTTgHGGzvWyleILl0CkhdT+7MS5FVhMGsnvw7f/qkk4106uOduh+A1Q5uVJ8hYurV4
 vJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098846; x=1685690846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XOGh1Ai7brle/ORoosrr2+HdvM3iQHXrRRlmdgEhTsw=;
 b=DPjLdAH6/6DNu5uwCVnEDNEbWbhC075M2wvDjW9o0bc6lb8eDIluDhqPKp2U9JaKBt
 Hg/ECtw8vT6+D0RuUl2yJKgiSlLrkXGq4r/GzDqAl3u+aydt7o2hDR8sv5ZMrycfHb/E
 +Vi4nyBuvLkDkYdSUnUZPw8iYyCzQYv2dbGhzCATQVRnKEo6e17pN9PEl9zl0RBWXHBH
 qMTbhu/eOM+H50P2PcGMCyrUsKRScTuciWqrOIll8zStnlkvL7I4+olu3Fftr7tzUlwm
 wSrWuK2P2itPIMVs+FWG1gtF82xnTPE718u7Uvn9Ao1Qf8DG9PSc/4hCqXFbXT9Sjkp/
 Ly4Q==
X-Gm-Message-State: AC+VfDx/B9oXHVzGlVPb/4mPsV9NZalx/rqt+8K92SK9n/ijpBRUL63G
 jUxWEEYcL8UXuJsHrL4a/HsQFxIC13/hqTcI5ZyGMg==
X-Google-Smtp-Source: ACHHUZ5MwNyevcAtCOWzvUZKBPZEU64G0Lvj1Y2r54Om8McKElwJOnrlDqXKdycQm/Si1L0wGcTAKg==
X-Received: by 2002:a1c:ed0e:0:b0:3f1:800f:cc61 with SMTP id
 l14-20020a1ced0e000000b003f1800fcc61mr13830866wmh.13.1683098846304; 
 Wed, 03 May 2023 00:27:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 71/84] *: Add missing includes of exec/exec-all.h
Date: Wed,  3 May 2023 08:23:18 +0100
Message-Id: <20230503072331.1747057-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

This had been pulled in via exec/translator.h,
but the include of exec-all.h will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 9179521b88..7be3d25b35 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -4,6 +4,7 @@
 #include "cpu.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
+#include "exec/exec-all.h"
 #include "exec/translator.h"
 #include "exec/helper-gen.h"
 #include "internals.h"
-- 
2.34.1


