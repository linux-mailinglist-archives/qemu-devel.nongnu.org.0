Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69D66A3D6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:04:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQFP-0003Xk-DI; Fri, 13 Jan 2023 15:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFM-0003Xb-9g
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:01:53 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFI-0006lo-Fh
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:01:50 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1250662wmb.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3xrrNRp0/omZTUi+2E7NdYj0ZRdClls5k9S0IjFHIM=;
 b=dL7snLgqGB1px0xv/nW0v144lD88hT2heYtyMZH3cF8I+rRna0VGx4fCu4RPGw7rMN
 f7mJ9PeX4f/HsSVT+0Rcm2ePV7Vg879V8cmdZH984fMf6tz8GrisO8YUUgc4h/vkP78g
 QKEBdHI0dm6zFC9lAkWbRi64YSndf94UzF5XXCiFiqTPkFfeBg7qnOOYi2eU516l37nF
 RM9e9BVt/6MZ6uLIic9aNkDn0V8Uus9krZhv/g9fsybV7IVkxbLf4ZohHqZ6Y6G6vbHk
 Jh1EYGNgP60d1qzRAEJBapruB1KUh0NAf7mjnYC4GkPURT6DCxHVCwbZCAjA17DS+ZTi
 rCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3xrrNRp0/omZTUi+2E7NdYj0ZRdClls5k9S0IjFHIM=;
 b=g0GwIgJPpfwXKwV5XXx/DAf3CWb3aBjHDC+/5O08s8HTy6K9ECsTkmc3DIu+lUuINp
 i/UBZeJllADHXjU3QMgdmXlplV14RDmz7oshQG4trf4JAEQ4wsgS9cW4VVp95CEeNzUf
 UYoVh735UPlB5HMKdun+jmxI/777x5tEr9zKY538+ZloVeZnbB6+24WIEBBFpx7ReRSX
 k7OIMKXi0PXxJypLklH4G7QR8unRdjOzdZ2DSYTAYIeN/01xG9qYzK+dfAneNtDkL+B1
 DUwfkTHXQwmSXtkMVYVMsuWZjBUY1s8FJA/fchDBQ9wHvkl+YpFJiYeX2pJUrPQX1iLX
 /dZw==
X-Gm-Message-State: AFqh2krMh9pl9MNhXoeH0hZ9RQXPoKVFioWdsiYQEajmr8iXJDPgdJoj
 V8pBK7FfXMZgwPThHtru2PpLIU2PABodQlQD
X-Google-Smtp-Source: AMrXdXsClAjv90TsAEJtLh9++oWB/tPaJcj1hc/oDfcgp95JbwCn4wcCJWRtax3MpTugEAi6eaQ0pg==
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id
 z18-20020a1c4c12000000b003c6e63e89a6mr59510328wmf.2.1673640107016; 
 Fri, 13 Jan 2023 12:01:47 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bi6-20020a05600c3d8600b003d9df9e59c4sm23162459wmb.37.2023.01.13.12.01.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:01:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
Date: Fri, 13 Jan 2023 21:01:35 +0100
Message-Id: <20230113200138.52869-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since commit be8d853766 ("iothread: add I/O thread object") we
never used IOThreadClass / IOTHREAD_CLASS() / IOTHREAD_GET_CLASS(),
remove these definitions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 iothread.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/iothread.c b/iothread.c
index 3862a64471..b41c305bd9 100644
--- a/iothread.c
+++ b/iothread.c
@@ -25,10 +25,6 @@
 #include "qemu/rcu.h"
 #include "qemu/main-loop.h"
 
-typedef ObjectClass IOThreadClass;
-
-DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
-                       TYPE_IOTHREAD)
 
 #ifdef CONFIG_POSIX
 /* Benchmark results from 2016 on NVMe SSD drives show max polling times around
-- 
2.38.1


