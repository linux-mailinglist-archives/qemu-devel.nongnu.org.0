Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D412BF95
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 00:20:27 +0100 (CET)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilLNg-00055g-Oa
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 18:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFb-0004jo-9L
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:12:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFa-0005eZ-5o
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:12:03 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:54440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilLFZ-0005ZW-VF
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:12:02 -0500
Received: by mail-pj1-x1041.google.com with SMTP id kx11so6311685pjb.4
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 15:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hxKYSXHgHM/lVQxEfqAqj7RCUsAoWe3Z31+krFCY/w=;
 b=NPBp5fEZvwe5ZrOc3TkWJHAbcoatj9rcxYbxIpS9paPDFePJPNQ53B7gMYgFRaDATv
 kJmAYBRRADhBP7CgO+WI69BRBD08Ss0YXdPUX7oiWRHxIYOvtChOfb/RhCUCOlSKK7mT
 x+EGc24w1tgeqNZ9zRTJ3SinVwzQT2k8ADM5GA2feXkLW8Uv1YkSB+XOtIK/Twe19Vnb
 Vs2jgc1l2VWrxUBUOCOQEECPkWz1xQeX18JozZTEj1qHErOseidNkMqIq2F26P03pdO8
 yWsJZGQCe3NEo9iFXcnTI2AiS+W8SMCpavz6tXN3qlXYQ6rzTwJMkIEjmAH0d1QSm1kK
 5IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hxKYSXHgHM/lVQxEfqAqj7RCUsAoWe3Z31+krFCY/w=;
 b=OpOmbRE41lmq7JO3vwWVaiImhpdA+EkMrWqFrjdSYoC6qzN0jGplqEeEBQNP6zgc/Z
 RLIaB6BBytJpyxuadQwWdzIjLdEYbtcWTSavxR2obiSj51hPlVqaVgtbro7KA3nsiYb2
 ZIfRgnQk5akKfQvQk48JBLuDVEQH+UdkxC9H96KOJ6Lcc2YI9lIkLMC1IUEBKHnF4+Mm
 tYAWQJABUfltNbA0ytqXCgeHkqWx3ePZ4w5SkaBItIwv/IMbRv+KDqB3xsCDWWV7qQC1
 SgSeqq1LgbRRPF7DdRK4BjFOC0X9V7yB/AzcgoK264yvflzh08/z4BUfoioDjZj18mhT
 oeOg==
X-Gm-Message-State: APjAAAUiugnPwgP8A4mUDnRxdLKz6Ntmob1zEsTuOb4s9DicIvErx4IQ
 iVzotMztk8LtgO4dnta3JZYEjsSjCew=
X-Google-Smtp-Source: APXvYqzOmNS40DX4a47sSfiB71NH98Z8wlRQ8bdpU/pxK/XnFpFouWoVj79fRWOLEZSjGPrnBX6Kpw==
X-Received: by 2002:a17:90b:1243:: with SMTP id
 gx3mr35894855pjb.117.1577574719888; 
 Sat, 28 Dec 2019 15:11:59 -0800 (PST)
Received: from localhost.localdomain (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id c18sm21077186pfr.40.2019.12.28.15.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 15:11:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/29] plugins: Include trace/mem.h in api.c
Date: Sun, 29 Dec 2019 10:11:04 +1100
Message-Id: <20191228231124.18307-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191228231124.18307-1-richard.henderson@linaro.org>
References: <20191228231124.18307-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code movement in an upcoming patch will show that this file
was implicitly depending on trace/mem.h being included beforehand.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 plugins/api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/plugins/api.c b/plugins/api.c
index fa1d9f276d..cb7098ce79 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -46,6 +46,8 @@
 #include "qemu/plugin-memory.h"
 #include "hw/boards.h"
 #endif
+#include "trace-root.h"
+#include "trace/mem.h"
 
 /* Uninstall and Reset handlers */
 
-- 
2.20.1


