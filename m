Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46899621BF8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTQF-0005F6-UE; Tue, 08 Nov 2022 13:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQ6-0005ES-Dh
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQ4-0001tr-NT
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:33:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a14so22393058wru.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JAIXAc5yx7Janb9V19pGhZsThYiXLEelpbY1OVExkgc=;
 b=nvefmbcPtgNIBWQy1vV2dIs6OuA0cdOYxjMyMBFSo4nfbX2wiKXl7lewx9B2ryLcOL
 Qied180fLRm2hJ+Yi23y61zEMcNTGadcMrGrh4L/C/XcVjvp5+5htjp37ywf7uvfoH43
 Yj7Zv96iyW+n58WSX1h7R/y9vWBnvcMO/BjNlpqPgH936L7nuVjHVlHJeihcM2+jjWZP
 vY3h1HpxAmdW05z5QKHRjloI2cjA1P60xSWSNaZ0yMgGoO6bysvfKiLCpzEH1M72/fBe
 4oSpZXXmh5LldTZkWU7BlE/1xOWpR1ZIQY+2h2xJsMKaSRI4FPHdT7Ujru2JU/QVRZtx
 AqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAIXAc5yx7Janb9V19pGhZsThYiXLEelpbY1OVExkgc=;
 b=d7cCMawd+SCZWBiN8+i8OIKqY+G/S114q++ASNNTlV5/DkDvd7w7ajuHgGpaCD8LVR
 Ass7nf+joAVyrLRjGVR+Haz345Z36HdJAd0mOu4fUxQbyaOPtQWh3xkEWroqbBUHtVtw
 wu5QztrRHnBN2/nWiWHK2/VK2/cN0RBG7Qpj/eGDK9CV8iJLBA8a5J0R0BbcW/s7nXs9
 leIhl3146ISlwWIP21a1Z0llu27SfP4jDIwqjKDrSW7HjN9JIK8Q7xBhJw1fxXDxOpX1
 WO6lUrNavPE+qLGrfqAk+KbCyj9in0WrnYJoy9IpjtEeGbHw2aht73VVhhZzobR/j53R
 AxUw==
X-Gm-Message-State: ACrzQf0ePk6fp7GO0Jn9NprjEAwY0JPX02UunY+IGErB3MGMOIkR+hDt
 s9slx4XVM43tCZ2LCP6z6J4PBHbkddmhPQ==
X-Google-Smtp-Source: AMsMyM48Q9f+baf4ih+ZTK1RG35KBB4cpwpltfc5jiOB+oQ3/1OZgO2o1glprCNgHxKVaCMvouUbyA==
X-Received: by 2002:adf:e804:0:b0:236:657e:756e with SMTP id
 o4-20020adfe804000000b00236657e756emr37011960wrm.452.1667932434456; 
 Tue, 08 Nov 2022 10:33:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003c6deb5c1edsm12651621wmb.45.2022.11.08.10.33.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Nov 2022 10:33:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 0/3] Memory/SDHCI/ParallelFlash patches for v7.2.0-rc0
Date: Tue,  8 Nov 2022 19:33:49 +0100
Message-Id: <20221108183352.9466-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

The following changes since commit ade760a2f63804b7ab1839fbc3e5ddbf30538718:

  Merge tag 'pull-request-2022-11-08' of https://gitlab.com/thuth/qemu into staging (2022-11-08 11:34:06 -0500)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/memflash-20221108

for you to fetch changes up to cf9b3efd816518f9f210f50a0fa3e46a00b33c27:

  Revert "hw/block/pflash_cfi: Error out if dev length isn't power of 2" (2022-11-08 19:29:25 +0100)

----------------------------------------------------------------
Memory/SDHCI/ParallelFlash patches queue

- Fix wrong end address dump in 'info mtree' (Zhenzhong Duan)
- Fix in SDHCI for CVE-2022-3872 (myself)
- Revert latest pflash check of underlying block size (Daniel
  Henrique Barboza & myself)

----------------------------------------------------------------

Daniel Henrique Barboza (1):
  Revert "hw/block/pflash_cfi: Error out if dev length isn't power of 2"

Philippe Mathieu-Daudé (1):
  hw/sd/sdhci: Do not set Buf Wr Ena before writing block
    (CVE-2022-3872)

Zhenzhong Duan (1):
  memory: Fix wrong end address dump

 hw/block/pflash_cfi01.c | 8 ++------
 hw/block/pflash_cfi02.c | 5 -----
 hw/sd/sdhci.c           | 2 +-
 softmmu/physmem.c       | 2 +-
 4 files changed, 4 insertions(+), 13 deletions(-)

-- 
2.38.1


