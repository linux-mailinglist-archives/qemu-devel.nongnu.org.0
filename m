Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A794621BE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:09:37 +0100 (CET)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmy0-0006us-ED
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmty-0003Oq-W8
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: from [2a00:1450:4864:20::331] (port=55074
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008Co-Bi
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id i12so15638636wmq.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 12:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTo77hPRZPJCGOc5lQV7xcrmA1XxlNOYWfSFKOfnGds=;
 b=aAzoGrNoqXqMNypiP5U/kE0CsU0QtfRtwkYpevgOcyzVCTVlv2cxqxXzo68x9rFerP
 LDOc0klBji4OqtegXIQpC25bULBnOXLZ+21TdLWCXLghRpzFWTIcAKDHaVpof9MYya2b
 9C4DgLLCZPj/QYW14QLkeUUEnJzt2QuX7MSSyEqnB8SmlaNlQcmbIlphAPT4mEuzGKtg
 EXHjj42xnl9OS+3hFFteS+XQ1C8kOvhIA183CUP2MdB8t3H27qe9BlrhTHwMXzxuOzRf
 Ih6qPkfn3hCzFDWBGmnw/3wMNZgW4kZKunOu1IEiG2jFUjWXS3zzkcdaTBkrwFHJpK0w
 FOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTo77hPRZPJCGOc5lQV7xcrmA1XxlNOYWfSFKOfnGds=;
 b=ldXPXIIGaSeGrKl89yNmQvYZqPgzxXA5g4SmeXu6b5zAwuZw89od8FN3oV2XCP5aGj
 1A5SgrBaknVBIsUrPj3RerjYhqhZqFkRZFIJtgsy2NYDZ0GBcba1bGOV987O+zfM3aOB
 qoXeFfvAytoDY3X3brPXPzgFXJeieFHsBLs0cpnUk0ZmG3jzMv2FTC1xnpxRNt2wKnZ9
 44ZFzrmlRBA01ZqO8HpCJn+aqOmzpynAMGSH3OqCfrll/67Z+Wqo1X52BoV6b7cbbAHx
 q7+WLscqlQ8Dl1w3vpYDxRT94cwI/1FueWhPYpcRiO05rGICoEQsNsfPlKS6z91kaiJn
 PYGg==
X-Gm-Message-State: AOAM530kdPgLGhLXpuZe7xslc5OKiifUdGChzsqZeGsSoEzHHtFDgTeq
 bnyumfydJACS8TdEaK8RSoydFQ==
X-Google-Smtp-Source: ABdhPJzhxN1TjkT5GjrpIiZ7vZrdv5AbQa1QF+p5SIVCkg7XmUEf3BQD/qeNWo7bLeckArD9JWziYQ==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr163020wmq.195.1638216315776; 
 Mon, 29 Nov 2021 12:05:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 3/4] target/rx/cpu.h: Don't include qemu-common.h
Date: Mon, 29 Nov 2021 20:05:09 +0000
Message-Id: <20211129200510.1233037-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

Nothing actually relies on target/rx/cpu.h including it, so we can
just drop the include.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/rx/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 4ac71aec370..657db84ef0a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -20,7 +20,6 @@
 #define RX_CPU_H
 
 #include "qemu/bitops.h"
-#include "qemu-common.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 
-- 
2.25.1


