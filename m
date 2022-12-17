Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7D64F9D8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z46-0003Sm-AY; Sat, 17 Dec 2022 10:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3z-0003SB-O1
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:23 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3y-0005NE-6x
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:23 -0500
Received: by mail-ej1-x630.google.com with SMTP id n20so12652513ejh.0
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=241xuWhhObSETZNdWpk3wWzEiWP/G0ELuzzxSlPjcGI=;
 b=bZbND38KikIhh4+ZlbY40kD2Lk5nBF1Vog7hvwWJ/Va+k1vB0CDlmtB1rUm0mzge5I
 0jAFSzkC/A41rJe/h6XBRMaAiedP0BOAXkUnybg9m5hdrqEtdhz9SotNa6Jv8eSV/oCL
 FWfqmkM/Enl05fbrt9p0P4Kj9HCA7dC31WnmnBGzMb1gWj3wfyTABNyqJZiC0xzwopLh
 kvuLIgawz2sOKKI/rea5TTtA1XooOqH2Hsx1UibdAkgQNJ/Z5dKtezAwPq7hv47AGdI+
 621Q7iZPwvRfozY8aqEolQx554JwfSQPpQoqnCT5/owe8USLJLEK+hpsTVW6O7E7zvm6
 a6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=241xuWhhObSETZNdWpk3wWzEiWP/G0ELuzzxSlPjcGI=;
 b=5IZE9QPOBvuD6rUKXNdKlmsahGlDtd+esHXbGrI4c6msOFdXYUsUX53mrTDEYd4QIH
 y9llJJXGVnTxV7kmsKNcplF50Cuz2CmP46oIrlsWlo3H5DMBjEwJrVrlcweDphG8qQNQ
 wTmZnf83Rb+g2yN2/b2XDfG5Gh7SgYfzASFzioaodnwRdK7MeqHWjMrmsW0GVYAbCM0K
 SkOyhXv8l9a6kvSwndr3VHk7aupK+hOatevmWEZKv9E78qRRr6kfjEUGRqUVs7su474R
 cyU9twE65mOXUUFuAKAJP8kbDCiKtbgyYbLOrpYi/ITzci/A1S1wRB5ZFwYmgE6edPQ9
 NC0g==
X-Gm-Message-State: ANoB5pnJ6DoL5hwTy70N7qqSG3OadT5ryZLK0gNL2iPQ12HxqS3oRleb
 Sw7vV8uWgd0AelRVfsQBxPxgWzOsUvfDb8bZpuc=
X-Google-Smtp-Source: AA0mqf6xxO0WIX8h9GIjjf0wBUlvcfaL81pxQy9KVB796dAAj7HdaR+c711EB5uRoRQEEABoC11oGw==
X-Received: by 2002:a17:907:110a:b0:7c1:4bb2:f62b with SMTP id
 qu10-20020a170907110a00b007c14bb2f62bmr26167088ejb.27.1671290721053; 
 Sat, 17 Dec 2022 07:25:21 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 kx22-20020a170907775600b007c17b3a4163sm2146838ejc.15.2022.12.17.07.25.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 07:25:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 4/5] target/s390x/tcg/misc_helper: Remove unused "memory.h"
 include
Date: Sat, 17 Dec 2022 16:24:53 +0100
Message-Id: <20221217152454.96388-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217152454.96388-1-philmd@linaro.org>
References: <20221217152454.96388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/misc_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 71388a7119..576157b1f3 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -23,7 +23,6 @@
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
-- 
2.38.1


