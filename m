Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B198671854
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5Co-00026l-Hc; Wed, 18 Jan 2023 04:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5Ck-00026P-Ss
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:58:02 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5Ci-00061H-Vv
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:58:02 -0500
Received: by mail-wr1-x432.google.com with SMTP id z5so32290012wrt.6
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R8QT77dZ3pfw4hKA04pOHMh+Jd40UJVbAfmQY4bgqJo=;
 b=YJMg8rGiwaj/K7BSuZifWIQ6qLRNaUv8cfKO7i6VgsxBSN8IwT+/HILZN+09FcTTLj
 kyEo0das/uZvy2Lrh04YoMXcAzHLG+ahjk+oltXh5pv+78NIs57HDJN28UroXVRWwuQN
 Lr5q5jIDA9c0zRkRAoeKFOm70Yvt7tQlSL8kvUZsifNgp2BaH0CDDn335/SgiWec2sXP
 eehJDDOh0D0J/u0GMQw1Lipgl2Psn3+cDfWhJj4wGYpbdCRn/d1Ng6LI8KEt6TgW9JW6
 kK1oDlhmx9iN4SYO+1nIWXfk6MkF4TElFT7HHeqM8gyPxaMUSIJ25ZtN6ybckNGwgnS6
 SWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8QT77dZ3pfw4hKA04pOHMh+Jd40UJVbAfmQY4bgqJo=;
 b=dusWETEPQI2vrezTc+3XsSZqN43GspwDxHJAz3b2nPwhwo0RHf18RhrFtb4ODPd2Jm
 9tn0+LccP63HOaEodVcxaKycjMMYDsHApnLzYsI1R3R+Q82JzyqhJQOUWw9cmetKbHNb
 tdLUrKo1O6oc6jKWp/aJnlNh6oxMajJPnfX6fx2d3enGj+pHFLcqKzyFWrB1DIpSV045
 fr5j/Ohp7xamLoRUxYCuExXVgojvclPweeEy4Tu3lqegrRDnv+mz9iGUt2shqPD8I6Ml
 k664tX1Pq98CztHQQmVDZ5hIuGnUS9jrLM1cbwOjiIpdjK6VaVl1AlUNwFm2S9FLYUBC
 akUw==
X-Gm-Message-State: AFqh2kpRx/t/+SG/tBwTRMPQ2LEkCOTLqmFw2om1AZry6l/bAwCsWdvF
 AOEWfFIRbOvjgtXTz4xY9OSi9CksDsDbbulm
X-Google-Smtp-Source: AMrXdXuKb996DwmjPV/72jCQKSF639awnW+n1w2ke7vX3Nk9j/ksE5yuyKWvzMjeTIoyrJ6Xog1TTA==
X-Received: by 2002:a5d:4591:0:b0:2bc:7dec:9588 with SMTP id
 p17-20020a5d4591000000b002bc7dec9588mr5977591wrq.54.1674035873603; 
 Wed, 18 Jan 2023 01:57:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b002bdfb97e029sm8903616wrq.19.2023.01.18.01.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Jan 2023 01:57:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Klaus Jensen <its@irrelevant.dk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 0/2] hw/pci-host/gt64120: Fix regression on big-endian
 targets
Date: Wed, 18 Jan 2023 10:57:49 +0100
Message-Id: <20230118095751.49728-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Klaus reported a regression on big-endian targets, introduced
by commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
PCI_HOST_BRIDGE MemoryRegionOps"). Fix it and add the Klaus'
reproducer as Avocado test.

Since v1:
- Add Klaus Tested-by tag in patch #1
- Add parenthesis in "(v & b) ? x : y" expression

Philippe Mathieu-Daudé (2):
  hw/pci-host/gt64120: Fix PCI I/O config register endianness
  tests/avocado: Add test accessing NVMe on big-endian MIPS target

 hw/pci-host/gt64120.c               | 25 +++++-----------
 tests/avocado/boot_linux_console.py | 44 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 18 deletions(-)

-- 
2.38.1


