Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9DC11C4B6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 05:13:44 +0100 (CET)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifFrD-000072-09
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 23:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFex-0000uI-KH
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFew-0004CO-Hw
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:03 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifFet-00043l-P9
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:01 -0500
Received: by mail-pl1-x644.google.com with SMTP id bd4so444084plb.8
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 20:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eyI58KOw8f6KjHd513cv2CHH4iBrq42PUmdQAMssFYg=;
 b=yU7qj1XNPXvU2aK0pxXWNBjDcqxCt8gSjhGqkbLmUYjZzt14lFVB5uyDIN+MmYDjlJ
 S/sdqZw3de50hJbaptVKpOUIYvO0mam0o8VZTbshL+sE1UA5tsZfvOETvvWiiJB9E9hN
 3Hd+ydtwdahyHdhdYEUyD8UEnpAYF2Q73twN5f+DxGX9Ynn9+zjK3o8rzatKxX8gupUD
 XgOmiL1JpaN5nwgaSa3ym70/7l5tlEHEzoL2fKzzSEyITMY8cQ4MYSdcdo08kmYtwV/f
 lizTHrd7oYxzlfbwYV8qvTjr8CrUAI5XN3GDxg0rMfT16GdQwA5xxKqMyyhF6R0h9RJ0
 70TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyI58KOw8f6KjHd513cv2CHH4iBrq42PUmdQAMssFYg=;
 b=m2gR4A/Uu9Z244jyuq5ZYF+LNJPopa+oxHDdQjB7KzcMVmQvbJn63tfAtV9z/+GThT
 aA0hppjj6djX3pv0MEZkfy+0en5FJCWOuDNsQ8Dj/VfzPuEp900dJphejWvOH5mqOXAe
 /1aKsRltb70ypvoEwZKtxkLTdaM0adGQdzQ8i4blXnzvFgsmpatf80ASUbHpRRROfFj4
 LYbG/KGSkO2vGFrD5Qlfh7NYBHO0DMru7HvTQzTR5KWgL5tsZyOBv2KnaEIumLXfMKGe
 WNC27EQzkXndeIsgflme431UUuKXduH5n6AKvPNj8qBJz0fKOEUY60WkWtnF//Y16IoW
 O4hQ==
X-Gm-Message-State: APjAAAUtSZvZV2LoFf7YpP8SOSklcTnfFfuwBJ1bJsI/jIe94DQ1nqt/
 uJBOOwz+jMmycDxYl7yMxTWAARfxruA=
X-Google-Smtp-Source: APXvYqwjlALn333oE2jlKifjQIXUM5rWtYcGOWHuLWntj/gC6WUKGfGPIn4jmCg4F42apuDu8C4s7A==
X-Received: by 2002:a17:902:9a04:: with SMTP id
 v4mr7382327plp.192.1576123256006; 
 Wed, 11 Dec 2019 20:00:56 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z130sm4666391pgz.6.2019.12.11.20.00.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 20:00:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/28] linux-user: Include tcg.h in syscall.c
Date: Wed, 11 Dec 2019 20:00:23 -0800
Message-Id: <20191212040039.26546-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212040039.26546-1-richard.henderson@linaro.org>
References: <20191212040039.26546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Code movement in an upcoming patch will show that this file
was implicitly depending on tcg.h being included indirectly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 171c0caef3..34825f15bf 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -115,6 +115,7 @@
 #include "user/syscall-trace.h"
 #include "qapi/error.h"
 #include "fd-trans.h"
+#include "tcg.h"
 
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
-- 
2.20.1


