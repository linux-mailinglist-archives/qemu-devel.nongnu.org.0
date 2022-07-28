Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449255840F8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:22:05 +0200 (CEST)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4Oq-0003WU-4L
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yx-0003js-B5
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yr-0000Nd-Hm
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id d8so2287120wrp.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUkhY18ZOZqws4iwRAUQlpmYMnLQb7oeFEI6PuF4J2U=;
 b=JShtyA+H99Bv0RSoEIbVEDb6MvVd9plycQLJ5otaro/bdfTLhaTuNDLvdZ86/p9L9C
 gEfublKnoXa3UqdowV7qbH66+i3/ZJrWDJTG25JTNiH/o/78F7K2dLiTcaQDwjLZGwr3
 0GDJnn+U9W5Ur6NvYK7E3NdL6U9TPt7BmgCknT28FAVb5KDT7SF8clQpUNabewRVIo8x
 Z7p+akTOYbrd02W7znWYUUonNafkOYIYk5o2QRz1EcfHFKmMYJUR4vpmKCvzEWQ3BT+d
 NLMM3bQbjzFH7XjJEuAd7qljRf9SbthgDe2kTwgSOgMgDS91zpKSAIJd/xHZX+mqNRUl
 XzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUkhY18ZOZqws4iwRAUQlpmYMnLQb7oeFEI6PuF4J2U=;
 b=bBdF4nCVsTBSb4Oc65GxxMoE7MAC+bewhzR0EWaMiCJQPKRE0055w13gHcoGFIU3hn
 QwrHbrYYe1DnIyhwSQbRnpho8ZhUJrQYzLd7szAwOSC4a8oCgqNAFJeVZguIFaXxKVXq
 k171bCZq3XW9WRpM//GFitlRmHcxm5s7cxmAM8/dNqcAZI3NI7wVeSjNAkVYvofPPsta
 UlwHIJU8pkuDsFttqKt/gZ/7sDX63M/emOcGA8QGPkoItAwU0gPLm9sepjUQfAivGJCX
 lhlZuVaE7pWA+VLtG1eWfIk1dHE/FtWgtO1YoaaBjHUBHPVGMmoh2D1q69ID2bxR0LZT
 NtUg==
X-Gm-Message-State: AJIora/1jKti0woLtVzhXJbkZ2I8oW5qd6jlaRXkZZ5pSMc/bzswH0xc
 Ea/Ou6YSTBpm+t4uvDVl7zQcdA==
X-Google-Smtp-Source: AGRyM1sdfPqtInc7x5LZHI9dEtLYlKSpcHPEESladbp2Rn5PMl/AQRE1FDExK7jve/IcIeje4g7uYQ==
X-Received: by 2002:a5d:6512:0:b0:21e:cdab:1598 with SMTP id
 x18-20020a5d6512000000b0021ecdab1598mr5322176wru.687.1659016505112; 
 Thu, 28 Jul 2022 06:55:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b0021d63fe0f03sm1072788wru.12.2022.07.28.06.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:55:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1E521FFB7;
 Thu, 28 Jul 2022 14:55:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.1 v2 0/4] virtio fixes (split from virtio-gpio series)
Date: Thu, 28 Jul 2022 14:54:59 +0100
Message-Id: <20220728135503.1060062-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

This is just a split out series based on:

   Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cleanups
   Date: Tue, 26 Jul 2022 20:21:29 +0100
   Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>

with the patches identified by mst:

  Right. Still I think some are fixes we should merge now.
  I am thinking patches 5, 7,8,9 ? 6 if it makes backporting
  much easier. WDYT? If you agree pls separate bugfixes in
  series I can apply. Thanks!

but I've dropped the first patch as that was actually a backend and
I've added one of Jason's acked-bys.

Alex Bennée (4):
  hw/virtio: incorporate backend features in features
  hw/virtio: gracefully handle unset vhost_dev vdev
  hw/virtio: handle un-configured shutdown in virtio-pci
  hw/virtio: fix vhost_user_read tracepoint

 hw/virtio/vhost-user.c | 13 ++++++++++---
 hw/virtio/vhost.c      | 10 +++++++---
 hw/virtio/virtio-pci.c |  9 +++++++--
 3 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.30.2


