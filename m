Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A8F6737D7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:06:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITfr-0008C2-Qo; Thu, 19 Jan 2023 07:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfV-00089i-9q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:22 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfT-000265-H3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso1088143wmq.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rM58/sz3nTsoLiNd5f5AuLvT0Y9GfpQBj8pe5RJ/feY=;
 b=umQ1YDnxex7d/Amaba5Z53KFLuXZJgYeKbzOnhy9o+Cpv7b4iuXvhTije9DXkj3H0R
 1yeMpe63M+zXMx7y81zxEbvSJ5vrgyY1dV4L5tl/OedAcXhi1GNRuUWJXJTJM56vupcz
 S2zqDEOZQO1dSyC51zg6f4HZqBesj3/DiPzEzTrlu9wGGyC/KB0gfPqV+GRPD71/AZ3A
 /bLj8ux7DiFlLeS+quY4/z2xNs7KOBPqcEbvDebOfQ6mr9aQAZo9TngXIKlAT5dnd+Wq
 qF3WEm65EcUxDl9JQoadw4IfQP52EUGkIRJnIgfhFZ3d+JjUp9EbUXLh07Cs/Cfi0Q9K
 Mvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rM58/sz3nTsoLiNd5f5AuLvT0Y9GfpQBj8pe5RJ/feY=;
 b=FQDNbXQ0g+J8JXG+glrj4aaDkVhPgM6JuREXUbxSvVls1gozSkhUmLwsJ0DrFAbTM+
 0eRCsH57etOH+izQ33mBYo3vf/bH63hym2WiQZSXoVeKv8Hl2BNoNVKPNPjRDJtILao6
 4SUcVpK0UZ+B47/OAUoUQjTOSJ8qOok0xAzDn4G+mfHYSLpi1FLHV7RUxJeaQVNNRHHI
 e3HXGozMiZHKfV92L0HCvckPBCJhxXrE46rh4nRNvPnlfsxk1kBMruBWA4vifExBXTuU
 OEWuHPr1MbyneNkKxMnF5QYtTW5mQ55SNKmmjEq6onZTkAc2ib57aiK0GTCgc+5ad/Qz
 c4Rg==
X-Gm-Message-State: AFqh2kr0Eeinm+YYEtJE5Rxv2iNL9FLnzmZ37nA0WZoLIS95FRMXcIgs
 1ZOrR9MbTuDdQ/VUjdJXYm9kzVGZypOLL4RY
X-Google-Smtp-Source: AMrXdXvdOsyKET0JpZIpARdRX/xP2YXdeb1/xf5JjmHKw+ybtoCgBPigM7ORf77SmBR8fkHjd6VWyQ==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id
 fk8-20020a05600c0cc800b003cf497cc59emr6229987wmb.6.1674129916322; 
 Thu, 19 Jan 2023 04:05:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j15-20020adfd20f000000b002be2a4b521fsm5782505wrh.45.2023.01.19.04.05.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 04:05:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] tests/qtest/vnc-display-test: Silent warnings & explicit
 machine
Date: Thu, 19 Jan 2023 13:05:11 +0100
Message-Id: <20230119120514.28778-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

- Silent warnings on Windows
- Explicit the 'none' machine
- Disable on Darwin Aarch64 host

Philippe Mathieu-Daudé (3):
  tests/qtest/vnc-display-test: Suppress build warnings on Windows
  tests/qtest/vnc-display-test: Use the 'none' machine
  tests/qtest/vnc-display-test: Disable on Darwin

 tests/qtest/vnc-display-test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.38.1


