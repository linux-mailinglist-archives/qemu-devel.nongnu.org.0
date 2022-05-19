Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1185652D585
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:04:34 +0200 (CEST)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrglU-0005VH-TZ
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggV-00026b-6v; Thu, 19 May 2022 09:59:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggT-0001Yj-Gu; Thu, 19 May 2022 09:59:22 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y41so5222126pfw.12;
 Thu, 19 May 2022 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCiNpbkkCskOZ57GztSJUIweuB6uleQWQQ4snqYogPc=;
 b=L7Pa9zjaKGj9/BWtFL5vn7fF4ZrR0ZWGuKoUad2jhqKxi3VBVyLVhR3XrJD2IVpKKV
 CUSzFP0hTiuC0SSdzi4fXOwcCn3hhzNC1k9diU+30FPeXFtMhqRE0C4GjDhN9+SIy/KK
 HrcaHsdUsdxFuln+JXUVb0+0q+BR9wyhjaaUnYgpm+/syHLQdjkXclRZnaAiGOBZcY7P
 Kx4Kl+CKbcVQgKXGf1SEA3FjdOGewnWRYRjYICDKUfx2qkC0lyfqSP9sfR43HRd5LiKZ
 QKSS4MbnjF888nV7kQBI0SD/l/C1I+Db6MUMgZERYsryfnNQMKHITnibC+f+hIA2KJGU
 0hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCiNpbkkCskOZ57GztSJUIweuB6uleQWQQ4snqYogPc=;
 b=qlwC118CxH9zpw//RE/CSvzibPIFtodiq+qRzN0NftTTo1rmjDbBMzxRD83IUfkXvM
 J/4CpewW7t0YBP5nFbUY/WxrwV4XJK++Hjkh9tx1cOE7ojVSLg0p81eXUo20WsG+TdwB
 ONXkHGWds8Nd4+AZ7b7awrUG8AD2+87cyeDKwEHjDUmXcpaqNWnZkLRrXSSmd6V5eZgl
 i3aSpFgZd/o+KEelaSiuESpeQBLqxP5SLsd0IksgjmOdoqhHoynXNG6m1/0UJeCmCoMc
 ig99rYi7AbHFq7t/2/L70zEMfhCrECxw0BfLz0hQcfuOILSeC0pym7zJoy+ZTWATEHhx
 7mLA==
X-Gm-Message-State: AOAM530iFp+zU6zkW5uZM8Irn5AVo2/7qvaCEgNY23K7IPProUqtQXKc
 OVH8Njf+jKRK5o3rN0s4uzTq4W4TTVuNPw==
X-Google-Smtp-Source: ABdhPJwrrXTAG/upgCtuKE44PzytWXs+UAf5czj6GAoBM2xDJ6YngidPIH6nGArIQ6p6hsqibvVmUA==
X-Received: by 2002:a63:d842:0:b0:3c6:ab6b:5f3c with SMTP id
 k2-20020a63d842000000b003c6ab6b5f3cmr4159558pgj.148.1652968758990; 
 Thu, 19 May 2022 06:59:18 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.131.68])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090b078800b001d9927ef1desm5603817pjz.34.2022.05.19.06.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:59:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/4] ppc: improve some memory ordering issues
Date: Thu, 19 May 2022 23:59:04 +1000
Message-Id: <20220519135908.21282-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since RFC[*], this fixes a compile issue noticed by Richard,
and has survived some basic stressing with mttcg.

Thanks,
Nick

[*] https://lists.nongnu.org/archive/html/qemu-ppc/2022-05/msg00046.html

Nicholas Piggin (4):
  target/ppc: Fix eieio memory ordering semantics
  tcg/ppc: ST_ST memory ordering is not provided with eieio
  tcg/ppc: Optimize memory ordering generation with lwsync
  target/ppc: Implement lwsync with weaker memory ordering

 target/ppc/cpu.h         |  4 +++-
 target/ppc/cpu_init.c    | 13 +++++++------
 target/ppc/machine.c     |  3 ++-
 target/ppc/translate.c   | 35 +++++++++++++++++++++++++++++++++--
 tcg/ppc/tcg-target.c.inc | 11 ++++++-----
 5 files changed, 51 insertions(+), 15 deletions(-)

-- 
2.35.1


