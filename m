Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD173669F04
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMJ3-0003VU-1w; Fri, 13 Jan 2023 10:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIy-0003Ts-9U
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIw-0006hu-Jl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so19080206wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZVdtRHUibhT4oL/dM4YU1s3VYsdLibdtjn8WpC22Uc=;
 b=dAPMJp2ZoCyCq8VnIwh+XGpA4o79F15vrPuph8Ecpuvh5MNG39s3vSYke19tL1aKAD
 QtgQCHb4Eg3F+LBxoLgYbklRYCceRSsn4fxeHgRE6eLX7sEII7ad3sf1gzoxDbwZZkPK
 +KpQZ/J5d8mswG7keUduhnMiSt2HBbASUwnjmGqL48DnJ9+Kh+BUJat4Gd3anxBVrK0H
 h9lkSDBDMOCZeUv46m/gvxjy1//HKgtDtcT9jMi6+hPTyc4FsIQBpDqQiKRtGxvm056S
 /iJWXXJZYpaHTntW2rgN/dAOznO2O+Zp2pBRRnQ87/k4YDSiKKFWD0iraBPL4oQDmM9B
 EdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZVdtRHUibhT4oL/dM4YU1s3VYsdLibdtjn8WpC22Uc=;
 b=oARpweK326da9omzJ1eUFw1labWosglKO00OpavYU/iA/se4cU1HpuOoSVRBO0YKME
 7mVDUJsZLjP/EUcEirxlQw90rj2hsUKZJyu3eB18CYd2XQ3NxjYyPRvUKYLgLilzIoad
 WlngKeO4yhC2/Ljo31FH+8YYaLfK3VzM/+FZsHbLGHp50T5z7Ll+a4A/FxUO59V5mFj4
 xyGbX88uK/jXbZOawODVUo1AtWZeCIY1zlu0s+MbWbfEkQAK4Decq4yMZW6K5HaV3O2H
 +gAmRDbQhOYN1YuLUcu2Of1kIhK6Z2/kWRcwAfY0f2dxP2eAUKIrPy4gbAvTyhE+G9Rm
 ULDQ==
X-Gm-Message-State: AFqh2krg6KgtWc+O6hPmlchaMQuERE6fSLBDIzxPyyEvxNxQ9+4CYEOd
 AH6nPbpYPT2g4Ve2+jUU+2IJMTt6YS0bQk41
X-Google-Smtp-Source: AMrXdXto8OsYhlZ+JHuwlXdTtZXBeXT7SgX+hyCAUNYHjyUY0i1SI2AMQ9lt5d8Brl4q5aapBkLnOw==
X-Received: by 2002:a05:600c:3d10:b0:3d9:ee3d:2f54 with SMTP id
 bh16-20020a05600c3d1000b003d9ee3d2f54mr157523wmb.13.1673624956649; 
 Fri, 13 Jan 2023 07:49:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003d9b87296a9sm32823679wmo.25.2023.01.13.07.49.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:49:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 46/46] scripts/git.orderfile: Display MAINTAINERS changes first
Date: Fri, 13 Jan 2023 16:45:32 +0100
Message-Id: <20230113154532.49979-47-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

If we get custom to see MAINTAINERS changes first,
we might catch missing MAINTAINERS updates easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221216225505.26052-1-philmd@linaro.org>
---
 scripts/git.orderfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index b32203b710..8edac0380b 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -9,6 +9,8 @@
 #   git config diff.orderFile scripts/git.orderfile
 #
 
+MAINTAINERS
+
 # Documentation
 docs/*
 *.rst
-- 
2.38.1


