Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39C6C13D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:44:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFmV-0006Y1-NQ; Mon, 20 Mar 2023 09:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmT-0006X8-Jn
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmS-0001or-2Z
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so2436812wmq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NISlk1vZdvB+f1eUp7+3HHuzYbWQKCVdKec7G0ejZQ=;
 b=HRSBo9QOdLq686/8kQUjmjY3yN+yirMNHdIDFhMOOaglRj+pXTD+KEMl/b71YzK80c
 JQiKGo4gTeWL6m3/jSY0RJja6/wSkewfTq3Rid8LkVKGu+4xvu7pqSWjghPCmUIq8BEu
 TDIc1Oj0zuvcXfL5Ve6NAXpaUOcY8fq9LMOf191sS3sI+0gSfGcI11aoimRqXCkRvTFx
 jn5pJcgrfsUqDkwKvjvLgna1kYv2lMczCLxLsvdC9FEDEA9cB8j4cXBcVZdPIi8yHLgf
 +gCz8mRtb2Jf7HzuT4UEZJWj3RYyNt36luyhGLDw9LXTd3UE17i3IzQtdLVZCvkd0/9G
 4qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NISlk1vZdvB+f1eUp7+3HHuzYbWQKCVdKec7G0ejZQ=;
 b=J7n342iLBZ5D2ZToNoIvNANKAqaTxP5Vl/lQ7gu+vl0Ea4DhrNRVthMf4f6VJHToZ1
 UVUGLnGDY6jJjkeQtBD3Lm+46MNwwLg7F21kVq6NSNNUgK5Evy2FI3KGl56wqaTdcX8C
 vKlUsNHMjZLebjv2y0w5pYzbpV7E2Ic1UTlzg6usAkwhJO6g4BjzEVVQnyFxdQa3CMsR
 7RcFi+9sP8KkHl1tdXEJrVFaiU707H8xltA0EwryfIKdgzIb3m2RSae92D5/mUZU6zg6
 3z6qSCbC4Xo99eezDzBRw2iJFmupN3396bqYRvKvoKNiPaq01ZLzZYaA3asMz5DhzubB
 zeVA==
X-Gm-Message-State: AO0yUKUhYedcOvopIPfRp5fOtjpEKzBYHeCmdxeeC01IoPDv+fj7/E7T
 XA7247WR07AdjQpStoAUjx6tfTgT6xImXlINOZ6dPw==
X-Google-Smtp-Source: AK7set8Yx7ED649qRBhmkib2VCFEaAECLUcNBvfgHWiYMlHTdptXDPDxJebb0XrzRbU8CrzDFqOY3w==
X-Received: by 2002:a05:600c:511c:b0:3ed:2b49:eefc with SMTP id
 o28-20020a05600c511c00b003ed2b49eefcmr21077191wms.3.1679319751155; 
 Mon, 20 Mar 2023 06:42:31 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffb84000000b002d322b9a7f5sm8942325wrr.88.2023.03.20.06.42.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-8.1 2/5] block/dmg: Remove duplicated prototype
 declarations
Date: Mon, 20 Mar 2023 14:42:16 +0100
Message-Id: <20230320134219.22489-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320134219.22489-1-philmd@linaro.org>
References: <20230320134219.22489-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Both dmg_uncompress_bz2 / dmg_uncompress_lzfse are declared
in "dmg.h", included 1 line before.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/dmg.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/block/dmg.c b/block/dmg.c
index e10b9a2ba5..a5d22fb8f9 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -31,12 +31,6 @@
 #include "qemu/memalign.h"
 #include "dmg.h"
 
-int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
-                          char *next_out, unsigned int avail_out);
-
-int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
-                            char *next_out, unsigned int avail_out);
-
 enum {
     /* Limit chunk sizes to prevent unreasonable amounts of memory being used
      * or truncating when converting to 32-bit types
-- 
2.38.1


