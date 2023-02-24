Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F31C6A23EE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:42:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfom-0005bu-V4; Fri, 24 Feb 2023 16:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVfoh-0005Yd-Dh
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:41:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVfod-0002WR-If
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:41:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id c18so560033wmr.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hVUZ0IWcFHXOjNHYU1SUstAUfNsf+5f3J5wbL9rFS8M=;
 b=c2G/RpQLbf7VSyFE9CQUiBIiDRiSsvxaRoOiC9HFBel/AB3hjKmghW89Q9BQxiiEJD
 5VwUa4L4UcvWNjTuVOnDnGL+bYsaBhNOMp0+176USrCjIIdMmFIdrhBxt5XIgrN1lpce
 eMI0iqRTWbAw66zOshUP1t1NgOfs1Zhn87yQ3QhRcbWmyRtT0wVFx3iUt1x1QeorrLah
 Q9AOl6INWAZdAbFxkAZE9ocaQINVBK/hephF1nBc8nY2+b7CLFh+/ODuVe17A8Mk7hK7
 OD6zYg2VT91ZN/BGRdC4mnjZ5FFzkYSCaepifRtZVH064TIh7aryYlP/IA+FjIvApEbW
 7moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hVUZ0IWcFHXOjNHYU1SUstAUfNsf+5f3J5wbL9rFS8M=;
 b=iKySttBmgdx65tFvUrsHk8mLRMdCNS0GB4hdJ+jAmkpS2el3EHb8lJwarHh/MfXNs5
 8zOXaFDG2HoheyVbrM+Ccw/FPg3RfV4oAM6A3slFxoGqRpQuJ3+6uBYHoSdZ0BnpluU8
 jq8zI25jWgVvvRC3CpYW+0zpmVTb+3re9o+8neYOuqlXfakmVeJvlQiE6Z28FuQW+Jdq
 iXqmCID0vKLequfrplMWP9csf2UjPFPgjREHcWgVTEyHFnFsG9ixTdl2zxNRi916iks6
 DrSFfiFYNvguHzSEpK7MkaIKSHxrHQKZfm27hCBxBzY/7WocqcByzWqJlRCjjsYIZIAD
 iqew==
X-Gm-Message-State: AO0yUKWcWIxNm3M3Q6PtI3C8ApnbvUXCQkZS7V8FF+EJ7NtAtipIEeKU
 iIicgypyV7F4rx63VDt8AgqRuVPoodtuTyaX
X-Google-Smtp-Source: AK7set/x9LJ3onGA5i7nZ1QzKDRmvVrsEXTNHkSuFQ8r4HLMwfA7VzgeepePkkSSewDcvPw4FyUOyg==
X-Received: by 2002:a05:600c:181b:b0:3eb:2e66:8 with SMTP id
 n27-20020a05600c181b00b003eb2e660008mr684035wmp.35.1677274876404; 
 Fri, 24 Feb 2023 13:41:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003daf672a616sm423533wmi.22.2023.02.24.13.41.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 13:41:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] scripts/git.orderfile: Display QAPI script changes before
 schema ones
Date: Fri, 24 Feb 2023 22:41:14 +0100
Message-Id: <20230224214114.26464-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

When modifying QAPI scripts and modifying C files along,
it makes sense to display QAPI changes first.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Failed example:
https://lore.kernel.org/qemu-devel/20230224155451.20211-3-philmd@linaro.org/
---
 scripts/git.orderfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 8edac0380b..70adc1a74a 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -22,6 +22,8 @@ Makefile*
 *.mak
 meson.build
 
+# qapi scripts
+scripts/qapi*
 # qapi schema
 qapi/*.json
 qga/*.json
-- 
2.38.1


