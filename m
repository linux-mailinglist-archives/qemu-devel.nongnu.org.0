Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA86717F5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:41:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4vn-0000RN-OJ; Wed, 18 Jan 2023 04:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4vl-0000Lt-0e
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:40:29 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4vj-0003P7-CL
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:40:28 -0500
Received: by mail-wm1-x331.google.com with SMTP id q8so12397665wmo.5
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hMx4ObyQZvfXNHVXseA6sfMXGxrN1K9oubpKC+KJIoc=;
 b=H8azJ0z+PQE5pfP4mjTXkIIextd+N+pFWZQ/3X6fs9UhSSxyXEZa/25TqVAgBrB9Qa
 yh14bY6M2lYVc/woPNNa+3tKBqJKwIpNVqg8xcMzxW9QsHr0Z0fr2PpL2iZey3b3od3d
 E2rKDKswgHfnDddf2FM9JdFFiFlQiHiqhP44B/1UytUj3DWnrkSaOafYKvWATcwnUz0K
 J76Uf/yc3E00wBvBo2QNdOFsA5CS112LF+PXr2bBg8JBxVhWeFd3cQIKCknetUKqgWam
 B5nFtUiA60o+hidPB2py7ucZJMRoNoBKvf53UmY1vNTZHV/XylMUqiBYwyprv6fl2aDV
 aTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMx4ObyQZvfXNHVXseA6sfMXGxrN1K9oubpKC+KJIoc=;
 b=intek+8seuO2Z2XaN3bceFoInxPeG1dGIOy6VZr7DAhPiscnAOTtj6FMgTqsV1VQDH
 eLbodzhWaBBRGjiKIpkeWI/rMsfd0rP8x8sV3xcT2X0XJMEJPEWqlDm87TsbbCRXfAD3
 ZcrVPQIC/URSpp2xXsR1jaBmI0s1sAKA55BCWzn+NuiBRVYmtBuxUmjgPqwNeY4yrdAw
 d2Gxvbvlqz+yn63/fmlxvFuTlGAY+1ST1wZUmRBR34fqPteMimOublDZo77WELUqA4Ju
 3WPvieN+aTi1k8Um/zBLmrFsNL9J4JUc+zCwa7a2ml4zZtZYpxXG3S+D8KoyuKNqQAfb
 aFmg==
X-Gm-Message-State: AFqh2kpL4XXpxUqnlWB58PqH/8+67Wq3o6Lalen+kR2v07a7GmNuvH9J
 reskdluOurb88D99x7QIHR/9vjkcUwMEuGCF
X-Google-Smtp-Source: AMrXdXsHO7znO05NE/svbC1PCZ0U5CC5uYPLDliRbpduGgyHG35gGHJ1FsWquFKuYQiQRM7T081q7Q==
X-Received: by 2002:a05:600c:444b:b0:3da:fd06:a6f1 with SMTP id
 v11-20020a05600c444b00b003dafd06a6f1mr5842289wmn.31.1674034825567; 
 Wed, 18 Jan 2023 01:40:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a1c2b06000000b003a6125562e1sm1319554wmr.46.2023.01.18.01.40.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Jan 2023 01:40:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Beraldo Leal <bleal@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 0/2] hw/pci-host/gt64120: Fix regression on big-endian targets
Date: Wed, 18 Jan 2023 10:40:21 +0100
Message-Id: <20230118094023.49517-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Klauss reported a regression on big-endian targets, introduced
by commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
PCI_HOST_BRIDGE MemoryRegionOps"). Fix it and add the Klauss'
reproducer as Avocado test.

Philippe Mathieu-Daudé (2):
  hw/pci-host/gt64120: Fix PCI I/O config register endianness
  tests/avocado: Add test accessing NVMe on big-endian MIPS target

 hw/pci-host/gt64120.c               | 25 +++++-----------
 tests/avocado/boot_linux_console.py | 44 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 18 deletions(-)

-- 
2.38.1


