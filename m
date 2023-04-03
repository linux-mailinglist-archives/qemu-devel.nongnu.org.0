Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047286D4414
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:04:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjItr-0006z1-8k; Mon, 03 Apr 2023 08:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjItm-0006yZ-85
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:02:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjItk-0005Gu-JJ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:02:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id p34so16952776wms.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680523374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2rVUPa1vFeNwbEYLe3bLLL2iwOgIi+HcJAixXa/7pCg=;
 b=vb7iG0KxTskyv0whxHfeOUrIo83nuF6qyqb7KuS2B4VBnjxjYEctfIsiNKeQGAphcB
 5uld7wzuyIA9RgHw1bpFUNviwk6oiPoDtWwGddeQqvh9OOIuTOCDotsCtJmcYToQ+K5e
 n/d4ii5jfEbB7geYqKZXxDNAUYMpaJpNj6cIunpdu1y3IbD8GY6DnVgvbX7EjMAIU9un
 TurV4vZNCv7b5Zs6R1eVdbMfaDVYuuSDZxcsr3IjUQlPC5BIAGiCDZUXPfWIEt22/krN
 BEXQzh/lvtaDF3vpQn3NmjC8a5k+ETOygtezrBaFs6bsPZFMhGsPZ5Q81+J3RRYW6Ytu
 ZGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680523374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2rVUPa1vFeNwbEYLe3bLLL2iwOgIi+HcJAixXa/7pCg=;
 b=Pt0yssRv0tCJBRYdJxiJSPBALVqvCvzUAaKg7sIdDsDf1vf9AvG09iZg5YewDRtzMl
 yDEDxwPe6ouN58BOp1kv1XGGf8l+4ZFRirO65j+4ttbd11aIFN5z3kdLzU8UmCILROlu
 6lGfs2WmcrfNQ9E6yW0yPnlJxMhOwYIQxDc3YZ/GYHKDF3fXg3uYqxzqCgGnJ2/raTxC
 i6OSAaZst4GrcmwiKASjhWSaIM5gKFh0LJMCsEmv+PdibowW0gMfaYNpJcImj8Tuwb+E
 xcl/n4OHMNGwuGrhy4X30QvejVfKknQxVVr9969oJc9pZmnJiQx/Y6OwW9HcagZkx7fi
 IYuQ==
X-Gm-Message-State: AAQBX9eytzU1fx3YtU69oBVcQi9TgGoTDtSVM1mhRJ4TWA8eiuYAbz/R
 gmAnhT18mHvFt9i7zXYGJwXgiw==
X-Google-Smtp-Source: AKy350aHQruilpL0AO59eHQFKWGxmVVUNxRuib8Oc6l6oeqfyOHmhJAw83SfD2xpQiDOfkcwj1o67w==
X-Received: by 2002:a05:600c:288:b0:3f0:373d:780 with SMTP id
 8-20020a05600c028800b003f0373d0780mr10062524wmk.34.1680523374166; 
 Mon, 03 Apr 2023 05:02:54 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a7bc4d9000000b003eae73f0fc1sm11841974wmk.18.2023.04.03.05.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 05:02:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62D691FFB7;
 Mon,  3 Apr 2023 13:02:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] gdbstub: don't report auxv feature unless on Linux
Date: Mon,  3 Apr 2023 13:02:50 +0100
Message-Id: <20230403120250.2071560-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

The later handler if conditionally compiled only for Linux but we
forgot to ensure we don't advertise it lest we confuse our BSD
brethren.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 2a66371aa5..0760d78685 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1468,7 +1468,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
             ";ReverseStep+;ReverseContinue+");
     }
 
-#ifdef CONFIG_USER_ONLY
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     if (gdbserver_state.c_cpu->opaque) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
     }
-- 
2.39.2


