Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D65D6625A8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqqv-0005qK-9i; Mon, 09 Jan 2023 07:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqn-0005lZ-7Y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:06 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqk-0001tX-DN
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:01:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3983556wma.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eaIo71wEppzNboWDo3gtAwm6cZm3yvCPLcZVHzqS25Y=;
 b=ayJskYNSaDbPJ0euc2Un9EOqYuLniLzE5XB2d0fBnVPso5PxkNR+swIvy6mExvtGMg
 jWdieOTXFdWZa+z66eZegZviNegriJeRCT4llpdBAXkRZ/NtHkxFq0lrYia3TyJSmKpw
 vMJBgSod2aOdJKeXMpUJaPIus/PQ2F3WVv0yhgphaK55eSVP/PE/tSAkc0fuYRRmDQjq
 mwCstvNSD8fYteT3dXAVvNIQ+pB4Zy5iISanJlo66V5BffuB8WUxRbVFlc9S4sJzfv97
 78yn1LmaFYfyrRG4R3I2ps7zfoIL6+Mbpx8AwVK7FoNh5kGAGn3xGIhdAYyNt0bpL/qp
 oeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaIo71wEppzNboWDo3gtAwm6cZm3yvCPLcZVHzqS25Y=;
 b=BDRCL+RN9uHQioG/UspI825z5wJoIQhADtm/Ay1tQXeJgQ49sMsMNr1DlwUKXaCEtl
 Sj6BY49J9UkVX65QSVJKA9NVAFKgjKoepj/5vrmq4iRBkfgVOasNGZX0H2AMxRax7HdS
 lfwerfae754xQkq73CPIpFnXCu/xVzZCteREHTZV7y0N1Kew1I/ve2M3/2KoBvHti+iy
 XyZcN2iTv5+8iIjByrZqZ0BYEn73sOcEu4oUreJ9iO2f578OAUhTttSh2lT56Mojv70O
 9NAhDal21UQ9mtctqSfUwUQbxotA7x1d6K7sbBPVLIHeIiI2Wzsr802YfEB01qmlyAR3
 U8Bg==
X-Gm-Message-State: AFqh2krGk2o9Y6Ma+Q9V7rl8OBQKFp7zq4m14vB/wHC+8vktCg+qkBsu
 NwcY1xJ0LaqSeovLvPspMHD1cSsOjuSScBE+
X-Google-Smtp-Source: AMrXdXt1RNMmaR3KbD+2mnm60LV3BGnlNUAa2FIB0T5kpey8gqhlhgeG/ScWUIdUFcyY4kNPcmAO5w==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr49167302wmq.33.1673265716615; 
 Mon, 09 Jan 2023 04:01:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b003d01b84e9b2sm12263482wms.27.2023.01.09.04.01.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:01:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/5] hw: Cleanups around PFLASH use
Date: Mon,  9 Jan 2023 13:01:49 +0100
Message-Id: <20230109120154.2868-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Trivial cleanups before PFLASH refactor:

- Remove unreachable error path calling pflash_cfi01_register()
- Add FLASH_SECTOR_SIZE definitions
- Use more IEC binary prefix definition

Philippe Mathieu-Daudé (5):
  hw/ppc/sam460ex: Remove unreachable code calling
    pflash_cfi01_register()
  hw/microblaze/petalogix: Add FLASH_SECTOR_SIZE definitions
  hw/mips/malta: Add the FLASH_SECTOR_SIZE definition
  hw/sh4/r2d: Use the IEC binary prefix definitions
  hw/sh4/r2d: Add the FLASH_SECTOR_SIZE definition

 hw/microblaze/petalogix_ml605_mmu.c      |  3 ++-
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  3 ++-
 hw/mips/malta.c                          |  5 +++--
 hw/ppc/sam460ex.c                        | 12 ++++--------
 hw/sh4/r2d.c                             | 13 +++++++------
 5 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.38.1


