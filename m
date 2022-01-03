Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD5F483638
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:35:45 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RFI-0006ah-3h
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:35:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD9-0004au-Hp
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:31 -0500
Received: from [2607:f8b0:4864:20::62a] (port=43792
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD7-00088n-US
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l16so13226137plg.10
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5gaGDZ+99ggf9ZXPhFh9Enr0XUZOvFdyJRvEuhLCgk=;
 b=gW+H9mMpOQ7xUmG6jUQ9pHc/5dSwbi94lom5aBmw9nUoHdv7CoE9cdLTWuURP8ZtOj
 CeKUZO674+A7Knvql+k9JkOPvIg6GSveq0wH+2DAGxPyvAcRhp4VeViMjLbhsYdYTzvr
 sJJgq2VK+ucrVsgR+a0ApObMnr4Qg4kl7WLFUfgtb5BQ3KxCKX+EjwrtKZNE02dB9hxE
 B7cT2OBSIUpfGEgYequHzZY8u/cSwN4pY4TUS5ZyDfj9FKS9JwmQpfwb6bbONsC9wF3p
 Ufyt8jWmok/hUwH9fEKhbLRmc+r4HukgpCFLWiN7j/xxym5QI79+w+SycqwZpyrgAnYy
 rPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d5gaGDZ+99ggf9ZXPhFh9Enr0XUZOvFdyJRvEuhLCgk=;
 b=lzQfAGlB6jUM15KVm6Pd/0Wgo0Joo4aUP8egLVP/itG7OhBVNNVNv4rGiJFzFzC74D
 YzcrnBRXJzV4tpyV9XxrycRmGMeUxY2fJZ64MS3v5tFnyxzJfKhKyA0XnHrbdKm+VZ3e
 ur1R/Il6vutgP0Xid2uEcPYDjzo8uqS8EAM8bRdXklgbOtByo27CLes8ih0WCmhTWxlq
 hsT13uqZbJlQgKy2bB/Kvt98leCl7hru/rMxpuwkf2Oyr3CBnmrPsrh5ODbABC5rwSuE
 yPbRy9OGMJglJOsxVejXnGOlvrf3JpT2b/l+txYssWwCi/g9r1ph1ZMVRYYpP920nroq
 c53w==
X-Gm-Message-State: AOAM530Nu4jxfK/iilcZ/ejAu0rw2st/zgUhs8C6CpKsNLlOdm2VzZI+
 zJDksYsDHFrBoIjRwgA4GEdbu1YywHeRwg==
X-Google-Smtp-Source: ABdhPJx7tWHiVTcC8aYfe8f6B6fC/Ez76AVdbgQJ6qkIza9Snz8C9kVHrhwi49pf2LgrKKXu8FzbqA==
X-Received: by 2002:a17:902:e0c1:b0:148:fef1:37c9 with SMTP id
 e1-20020a170902e0c100b00148fef137c9mr46266721pla.3.1641231207861; 
 Mon, 03 Jan 2022 09:33:27 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm39348564pfk.171.2022.01.03.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:33:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] meson: Unify mips and mips64 in host_arch
Date: Mon,  3 Jan 2022 09:33:22 -0800
Message-Id: <20220103173326.257152-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103173326.257152-1-richard.henderson@linaro.org>
References: <20220103173326.257152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes the build on a mips64 host.  Prior to the break, we identified
the arch via the __mips__ define; afterward we use meson's
host_machine.cpu_family().  Restore the previous combination.

Fixes: 823eb013452e ("configure, meson: move ARCH to meson.build")
Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 886f0a9343..53065e96ec 100644
--- a/meson.build
+++ b/meson.build
@@ -74,6 +74,8 @@ if cpu not in supported_cpus
   host_arch = 'unknown'
 elif cpu == 'x86'
   host_arch = 'i386'
+elif cpu == 'mips64'
+  host_arch = 'mips'
 else
   host_arch = cpu
 endif
-- 
2.25.1


