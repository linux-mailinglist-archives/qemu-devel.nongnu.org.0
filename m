Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E308759A539
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 20:10:52 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP6SJ-0002xS-Pi
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 14:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oP66T-00060Y-T5
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:48:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oP66S-0008Vd-4B
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:48:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso2817073wmr.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=fNw4XUoS3SMyscaHoW11F5ftXMaX5QX6MehHbaw3Mds=;
 b=x4JIpNA4WUjlnB9HOCjoIPl4X3eY5VY6og53AlS93EI+x8ye9TQ8etF5C0M00zdChv
 GAx8p1gdXRe/CdJysUAmzZjG1UqHwmBA2S+K3kUlKNlxgcs6ZzaZp8qH/MyIu6iodXt/
 BDoU2c9MTHHTmytOKXIo5A78WxkFrjVp1tjq5t/YNPlDN+gmp1iioY8FSKzSeTzgSyw6
 MosBSjnuv/mNxrT48edPNaNQCgDYhUVHOy9Uj0e5j2qLDntyroU6MHadCaguoZpQ/r9L
 MefrMczC4ky1E6t0ZiTWF2vTcOtMh2rEIhaGTCBYu4wr0rxL9E9Je1NJyuFPqlo4YlrF
 LVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=fNw4XUoS3SMyscaHoW11F5ftXMaX5QX6MehHbaw3Mds=;
 b=ZmeeQDnGHC1I+l6dpN8yw1RzVyWv27VrmBo/mAktJCJi/P8TMKmniv8q0uDRfVTf2I
 ndKQpkvGDfqWl16sNl8nqdzLs3BtsUiwPrLxe83J1icMSCwLWvokOopHO+I10uPjE3tx
 PLBtYgH6FOeFgL59Ui7a3VB2L4EojuxeMP1LdDPG3Y09vCpGSwXzCqkMpJ2ELzJx7FEj
 EFUoMxKcT3PCks7527HpZbfGqyQ8dsFxVKdgqWEYXuCAwgG+ZE8U4arnmQNqmBBF1Tjo
 SH3B6Ey8pHZXEm2fzK7N/xIpFk51ZpMR665QJUCd9dvDyJng4X8dXD57jTQtEngW/Y+p
 pNSA==
X-Gm-Message-State: ACgBeo2RXvR8l2K/GtdPjZhaMp80pd4/yBrQeIEEAAIH2Nnbf0gELjXF
 SlC1i3svjWuLu/1F3bhUbKxbJA==
X-Google-Smtp-Source: AA6agR55mIzgYBD5WORvSkF86HIW9g8mK15QR8/ynFx46BAms/qeNIiXh3KL8aCU7ei/dhzXTqzVmw==
X-Received: by 2002:a1c:7408:0:b0:3a5:c9c1:f226 with SMTP id
 p8-20020a1c7408000000b003a5c9c1f226mr5346514wmc.47.1660931293967; 
 Fri, 19 Aug 2022 10:48:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6202000000b00224f67bfc95sm4591988wru.62.2022.08.19.10.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:48:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C058B1FFB7;
 Fri, 19 Aug 2022 18:48:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH] qemu-options: try and clarify preferred block semantics
Date: Fri, 19 Aug 2022 18:47:57 +0100
Message-Id: <20220819174757.3551361-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Try to correct any confusion about QEMU's Byzantine disk options by
laying out the preferred "modern" options as-per:

 "<danpb> (best:  -device + -blockdev,  2nd obsolete syntax: -device +
     -drive,  3rd obsolete syntax: -drive, 4th obsolete syntax: -hdNN)"

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..d57239d364 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1105,6 +1105,19 @@ DEFHEADING()
 
 DEFHEADING(Block device options:)
 
+SRST
+The QEMU block device handling options have a long history and
+have gone through several iterations as the feature set and complexity
+of the block layer have grown. Many online guides to QEMU often
+reference older and deprecated options which can lead to confusion.
+
+The recommended modern way to describe disks is to use combination of
+``-device`` to specify the hardware device and ``-blockdev`` to
+describe the backend. The device defines what the guest sees and the
+backend describes how QEMU handles the data.
+
+ERST
+
 DEF("fda", HAS_ARG, QEMU_OPTION_fda,
     "-fda/-fdb file  use 'file' as floppy disk 0/1 image\n", QEMU_ARCH_ALL)
 DEF("fdb", HAS_ARG, QEMU_OPTION_fdb, "", QEMU_ARCH_ALL)
-- 
2.30.2


