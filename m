Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74FD66DECF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:29:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHm0X-0004wZ-5Q; Tue, 17 Jan 2023 08:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHm0V-0004vM-2I
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:28:07 -0500
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHm0T-0001TB-EB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:28:06 -0500
Received: by mail-oa1-x42.google.com with SMTP id
 586e51a60fabf-15ebfdf69adso14496284fac.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4n65378I5YCGAsx+NpJSY6yYQgLn44xVvIo06jk9QYw=;
 b=aXYRHDcZRQq/nWEq8UowiHfSPlV2In/nDw+qtMoE7IiHpP8idB1giY69EQwS0qq9SL
 8NHCiVly/0JR72dYoclLakfaXvvLW8CsncUMFhhjWqQ4czaa54TjW/gPnfkt42sUNVke
 Dez0MTGMEFiE6JXL5byiC5AAbY18AN36ihaT7xVwt89jI3yFIq1McoSv7k/EUm4Grvnj
 gnruLArKmNoSlw4K60ZgrqR9WzSzoqLlQNOc7nam2C8I+R9AGIIzfY1X50R8sc5iOH+m
 il4cwvDmWX285D4h635P97+0K/MEKZCi/UrRRmYMwJNeaEg2aZGEFo9J7wVc27zCPMxg
 PrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4n65378I5YCGAsx+NpJSY6yYQgLn44xVvIo06jk9QYw=;
 b=jpl1k2gr7xDe9zKHdaC15D1DD4/YMptRHHfB2QHVqDLmi8pESrKh74X19ItKAv1OTJ
 c2Ub0jEfj3FDwZvVG5Pb92Rf4WKLy4K4PBhj4J/AMCcg41EkdLEzUX6CIiFn+e1v3mjJ
 MZP0vt7eDot8KpSKedMBhiBtXR5tnTLLrvODpJYTC5LVbdsqi6xja4nB5A1jnFqgP0CB
 NsDV2250ECJFLDF+CbCl03Vdzyl8NDbAXqv2XRQb2I7uGyJnSSpXDHiZRRc3Ipb+n4dM
 EAJxs57VHE5CLyfXHvrEN5HkkHiXLejKBR0ABl9KhPdudZNZhrCfRybkshczQiTwbFZO
 MAJw==
X-Gm-Message-State: AFqh2koFFqMken0wwyMW6xJvSd9ggzKdvfgbRKCUJQoa0gXCxA5hi4aQ
 9IR81YjwfSEgn27CVs63WVKxYGQ3HFb1X49PJ+E=
X-Google-Smtp-Source: AMrXdXsF9KaJ4E/Y7pU0AkbpiyiG62J0xwwsMzq3yYHRrawVFpdpZMTnQ6H2ExjrVx9bVAMcATZa8w==
X-Received: by 2002:a05:6871:4599:b0:154:210:aab8 with SMTP id
 nl25-20020a056871459900b001540210aab8mr1601480oab.43.1673962083352; 
 Tue, 17 Jan 2023 05:28:03 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 v12-20020a056870b50c00b0014fc049fc0asm16538270oap.57.2023.01.17.05.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 05:28:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/1] move create_fw_cfg() to init() (Gitlab #1343)
Date: Tue, 17 Jan 2023 10:27:50 -0300
Message-Id: <20230117132751.229738-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::42;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x42.google.com
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

Hi,

This patch fixes a regression introduced with 1c20d3ff6004 ("hw/riscv:
virt: Add a machine done notifier") that is preventing
qemu-system-riscv64 to use the ramfb device starting in QEMU 7.1.

Fix is based on top of Alistair's riscv-to-apply.next:

https://github.com/alistair23/qemu/tree/riscv-to-apply.next


Daniel Henrique Barboza (1):
  hw/riscv/virt.c: move create_fw_cfg() back to virt_machine_init()

 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.39.0


