Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C02AD42E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:57:39 +0100 (CET)
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRLG-0006yt-QV
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJA-0005D8-Fg; Tue, 10 Nov 2020 05:55:28 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJ8-00076n-MM; Tue, 10 Nov 2020 05:55:28 -0500
Received: by mail-wm1-x343.google.com with SMTP id w24so2567419wmi.0;
 Tue, 10 Nov 2020 02:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMLkbND++gt1K7Zl4KpbSPSA3BwNtem6RHLOcEXpTM0=;
 b=UZXneGS73Az2t1QtSK7XhjcvkP31wudDPGzLdKwj50YhMmuDj7fEMo7dV6lzI35fZi
 w2biG0xPaEtuzfOMU7TswNyLjRqq6y3JbYq1O3xAremZXOLJSPrI/lPe3fxxofC12EYt
 uQ2Yg0NI/vEipmyLxmk/bdHbZIu5BjG60Ffo+VNU9JVGBKfIJ937xOMvCf1C/swnk3Jb
 UD6U5HoMnloQenLnk2CZX9vmrM7co3wr+VmwTHfleSE6ZsyFr8gKZlSSfT5by99eqZbT
 cfBPaE/TO0Z+H4kiUs1lZXayrnDNVqfCyosqpXIKM3USmsPn+nhcsIueldTcj9JbbUu3
 S/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMLkbND++gt1K7Zl4KpbSPSA3BwNtem6RHLOcEXpTM0=;
 b=k5WG5cewSyOItB2W6DdJr2TBhveddaeuILTpEz+UjEhKeEEq0oZA6Drfk5+GsVLs87
 jp7OgzE8eA/t7fDJxR6TdHU8qhImG7StsnZxV6bB5WgY8MZJq6Jzu+9vlk7n0NOSGFL0
 IbFuoUNFcnmnjCXcTUmFAIHOzuL+9FJuT7JkqQUnhQxn66wE6RAgpU28csfMPayVcHFK
 oemqQiHImWYG2BpsqdqBQgNg7pbCVuPf/45F6/6mMK2kOObMGkSv5kQbznaIY7I71LK/
 qydPJSQszhk4OrPPH5EQ/bmzYY9f2NmtEQFqyHUDQt19kWmaYIJaM3F/VmYG8QxNeLtO
 ubEQ==
X-Gm-Message-State: AOAM531uRWMPMacP1BPku2FY7EB1/77SqA2qsjGDq34ilFwwEjJeODlf
 kyEbRXSkJJ3v03F8/ORMSX6G6lW8yXcTdw==
X-Google-Smtp-Source: ABdhPJzbubks1pFZxf2Wkl0ijI/lZ7eF8XEJ/qsYLoARpKYGW1TVd2iuIuIb8BY7TSZm8DIg7EmNyA==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr4339432wmh.189.1605005724273; 
 Tue, 10 Nov 2020 02:55:24 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id x6sm2567891wmc.48.2020.11.10.02.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 02:55:23 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] ppc/translate: Fix unordered f64/f128 comparisons
Date: Tue, 10 Nov 2020 11:53:17 +0100
Message-Id: <20201110105321.25889-1-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=thatlemon@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a couple of problems found in the emulation of f64/f128 comparisons plus
some minimal self-contained commits to clean-up some code.

Is it too late to ask for inclusion in the upcoming release?

Giuseppe Musacchio (4):
  ppc/translate: Fix unordered f64/f128 comparisons
  ppc/translate: Turn the helper macros into functions
  ppc/translate: Delay NaN checking after comparison
  ppc/translate: Raise exceptions after setting the cc

 target/ppc/fpu_helper.c | 212 +++++++++++++++++++++++-----------------
 1 file changed, 121 insertions(+), 91 deletions(-)

-- 
2.27.0


