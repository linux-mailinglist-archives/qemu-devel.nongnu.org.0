Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9EB1339CC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 04:53:44 +0100 (CET)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip2Pe-0004xC-Ms
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 22:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2IU-00047L-Et
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:46:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2IS-00038G-F4
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:46:17 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37082)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip2IS-00037w-9F
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:46:16 -0500
Received: by mail-pf1-x441.google.com with SMTP id p14so910226pfn.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 19:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gm7iqEPQvMunngBh30eboJwTun7O9zyL7QzovpYUrMw=;
 b=eY64CS/x8vqqpGODjIbhdlctW11cdkwbebZ3J8VMDo0UAOoiH+84cDz2+Dovq8Hlsu
 fH0RYW62qZjR6sr03dvz/Ox9UYJeBJlPzaUC3BrLlgB2PXB4e2P4ydrVHCcqnW20XUym
 zgI96zJMXQQ8NEVDSBhvzHsByQJ7QR2yxIw4scOHkahUREhIINEdXwX5Bgwz1ogAeUO5
 vs1wYgdZ3hmahCfg3qDHvpUlyABAjl7Ml7pvOuiU2Rf2jC49nTis+98bSC4vuNX98R6K
 5QvYMzJXiq8YBbiD9cQa4LM7wSCRb4BFjKGo/euD1atdtg/F1WYS+Z3pUMeqLTUk9DgD
 YKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gm7iqEPQvMunngBh30eboJwTun7O9zyL7QzovpYUrMw=;
 b=OCafFRfejkHgq8BnQSPDQpzIHUOe62AHzvYWWxuBLKvGSoZ5+2AOa9kN5CoTiScZ1S
 98ZwH9qja8mExFt8VBSE5OZDwih7tu6lOa2eBeEQbdqfJWf3zeRi84u/hRvtGA4wyi8W
 nzO/+vfZQ5q5foIzH75q5Ix+EQOMhTdq8o94d+2j8mpkGL5uJI2QEfsnLrBdlbTy+QfP
 FclR0me2q3oAIfWqjfm1FuYxcGn+qm7u7oA8XCb/4vQzWAo1J9ACkyaqRUzyEjUd7inO
 4vt2ZNOqH6AxBUqKEYa2fjD9XdUwIXwBphAM+DUvW6gyjJMS7yFa48Qz/xliRtyo9J8l
 sZHg==
X-Gm-Message-State: APjAAAVqh4oE37SA7BJKJ0llc8Kda3J2cI6IwCJSrpSKHivnX4c/ln/r
 cTQlTH9LU3nL9ZiZBq/COJXwBMwzsm1fDQ==
X-Google-Smtp-Source: APXvYqzeh1hjbbczbyn55W+1yjMGPXk6CD2zgszBVKK2dOGlOL5VG46bvpB47VgrXoP95kW4EmFXgA==
X-Received: by 2002:a62:5216:: with SMTP id g22mr2941566pfb.196.1578455175143; 
 Tue, 07 Jan 2020 19:46:15 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id f23sm1198433pgj.76.2020.01.07.19.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 19:46:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/41] linux-user: Include trace-root.h in syscall-trace.h
Date: Wed,  8 Jan 2020 14:44:57 +1100
Message-Id: <20200108034523.17349-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108034523.17349-1-richard.henderson@linaro.org>
References: <20200108034523.17349-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code movement in an upcoming patch will show that this file
was implicitly depending on trace-root.h being included beforehand.

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/user/syscall-trace.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 9e60473643..79fd3e5aa9 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -10,6 +10,8 @@
 #ifndef _SYSCALL_TRACE_H_
 #define _SYSCALL_TRACE_H_
 
+#include "trace-root.h"
+
 /*
  * These helpers just provide a common place for the various
  * subsystems that want to track syscalls to put their hooks in. We
-- 
2.20.1


