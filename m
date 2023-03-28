Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E66CC76C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:04:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBm8-00084X-Ne; Tue, 28 Mar 2023 12:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBm5-000802-Qh
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBly-0004C9-CE
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ef90adc168so96378wmb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NmsSjup+xEQ0gc2TIeG2hC6j/mKEA8p4JNIyDCKCDnk=;
 b=TXS+Ym0GCybLQ+ER+7Oa64F9rrGVRrgJJHHwtCwuS35WZ4qfoTxmWr9K11Xw/xLIvC
 HyxDht7nCxqWeRQn1c1jnzfl4FIZs5Ue0uZY5GHM0kvyX4ai9P/BjvtiQVoHf+gEuaS+
 vffYGdeuaiGR7ecdBjMu0x0rXTwgv3MukciKmf7Ne52JOIHM8mNxZIDRZ7Gh8ZYeQcWO
 lzeM6dSuSYR1E02pRPkzet5emj1HYJk5xqrlMEhfihx2P1itD0KWD1HlqqDIeVUoMkhE
 pOhST29TgROk1lCDEy6wQ5b9G2A5T/uG2wGWxO/ZDPuPfSBsc7NugKZoE1BAtT8x9K/s
 IXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmsSjup+xEQ0gc2TIeG2hC6j/mKEA8p4JNIyDCKCDnk=;
 b=wyHdyvVwtlYNvH9j5sU3vKoFnb4CWg50MYX1HuKEhkjX/JbbhKOYB23Hv6/nzEj49c
 W+hDvWxteom97LZMDeA2Ul+KBpE0veZg16VBp6sDRszmzEt8LthJMRPrLyt8v9NFDfjf
 4/gP97ZuacCB2iDFT8eHgZPkDeprdHloNnf2vKF9VHY4MbFu71WQJKWWUn6RMEcY1ocX
 BbJCk+qxY8bmncZvZlzJ2N6zty5Tz8Qd4wVe8FrXqn0TIjRKjAqyPLA6lw+OmIeRWPrC
 j9E5jGFoV/1UKwx/zzfXCrEWedz9GJa4cbp6sejMgcA2cod2oB4h741l9FOwYIok9H9C
 4hbA==
X-Gm-Message-State: AO0yUKVdztvLwIQZmO8QavMnY6YVHXxgL2cK4FRcSwfiW7L4w6Dwie8K
 01SEdtkIGwVljvP4smel+ETLrLKoE2krLG7hymE=
X-Google-Smtp-Source: AK7set9QdPz+EVC4C8quH18Yt0Nyoa2yv+ZsJ7j72om3axKiVorYuqs2XM+85Et9x6gjQRM3bWSGKA==
X-Received: by 2002:a7b:ce08:0:b0:3ee:da1:135f with SMTP id
 m8-20020a7bce08000000b003ee0da1135fmr12778012wmc.7.1680019327311; 
 Tue, 28 Mar 2023 09:02:07 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b003ed793d9de0sm2937626wmb.1.2023.03.28.09.02.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 09:02:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/3] softmmu: Restore use of CPU watchpoint for
 non-TCG accelerators
Date: Tue, 28 Mar 2023 18:02:00 +0200
Message-Id: <20230328160203.13510-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Commit 2609ec2868 ("softmmu: Extract watchpoint API from physmem.c")
restricted CPU watchpoints to TCG accelerator. This is wrong, as
other accelerators such KVM do use watchpoints. Revert (partially)
this commit.

https://lore.kernel.org/qemu-devel/4784948c-1a92-1991-d6a2-b4d1ee23136c@redhat.com/

Philippe Mathieu-Daudé (3):
  softmmu/watchpoint: Add missing 'qemu/error-report.h' include
  softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
  softmmu: Restore use of CPU watchpoint for all accelerators

 include/hw/core/cpu.h         | 39 +------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 softmmu/watchpoint.c          |  5 ++++
 softmmu/meson.build           |  2 +-
 4 files changed, 50 insertions(+), 39 deletions(-)

-- 
2.38.1


