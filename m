Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5067A4E8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:23:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQke-0004Qd-5c; Tue, 24 Jan 2023 16:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pKQkc-0004QN-Ln
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:22:42 -0500
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pKQkb-0006sn-0f
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:22:42 -0500
Received: by mail-oa1-x44.google.com with SMTP id
 586e51a60fabf-16323754f81so2107773fac.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2a6Ii3+/fNqTRusHknv7wUakA1g7otz+I/pIaSQxpHM=;
 b=ATcSaoyPGCuf+L3nLfOGsmFlc3TSdsifLX6d1gcel9/6P6XNxORjeL/6hsq+JeMzdC
 2Lq01//641yFgK2B6VTQO9uTiBQ56GHdfOmAqcYEYXNkOG62O678WzNIiCXeE5ra7ZdS
 JAcXf4rra/rl6araULA9ZRtonL+rzPbGjmoWrz6rx56eNTS7R1IVBwbXPqvj8W4E41zL
 5TbUDCxxmN/kcnjIQETiem7a0VsKqxtiATeAISCoYXpXno6+LxnRAm0BpaxQ60mr+WcM
 cubPcpEG7kw98v4TjWZzAnWP/2k/7wKv/o2pWh0awA/O9vJy2UOGO1IJqFnwxdMy8S5Z
 hsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2a6Ii3+/fNqTRusHknv7wUakA1g7otz+I/pIaSQxpHM=;
 b=UkxpBmyeJHsKyqKR4SzWSkdKYKy+BxZAkCjf3cmCRChpNXGxgFEvbOotOSk93qIpY3
 N+RFgLr42ez/yCZ2dfeCzeURKhFstkVcgvYOqxxao1P1Bqtm+vTSuMx5sRwJS6RigrK1
 dyJSS8KCxgzmfE2QG/XLqAInBNe7W/rLRa8l3iAWfXJdveTyMpKdCfVnCH61UQ0C+PWp
 wV1rzXBW3MYbTpdlU6vA4EgQSiJltnY6I2Zy//J9Rbyi8Jo2cWi/3ZGRSya7fkscU5ax
 b9q+EYji52GRq3w1/Yy2tGVBzjIdHU4ICyhayG/saDLdQW1VMFfEs5IEJMHmb0ZDPTH7
 5iCQ==
X-Gm-Message-State: AO0yUKXTjjYvEuLhI+nJJ6i7o/0hU5IWrI+q+coprlPKEuOxAcqzima6
 jvRbWhaNr1LL7CTaodLMM0ICiWd2Gx9SRSrZQPs=
X-Google-Smtp-Source: AK7set8tE7rqJRIpA65NvxCdOFAqlUBWJOBmrRKsEpBtABl/P3+SDOypaph9NDrVasEZWCx4VvoiYA==
X-Received: by 2002:a05:6870:d796:b0:163:1b4d:d58a with SMTP id
 bd22-20020a056870d79600b001631b4dd58amr1445697oab.33.1674595359107; 
 Tue, 24 Jan 2023 13:22:39 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 go3-20020a056870da0300b0014474019e50sm1212306oab.24.2023.01.24.13.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 13:22:38 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 0/3] hw/riscv: misc cleanups
Date: Tue, 24 Jan 2023 18:22:31 -0300
Message-Id: <20230124212234.412630-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::44;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x44.google.com
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

Hi,

These are the last 3 patches from the series

"[PATCH v3 0/7] riscv: fdt related cleanups"

That can be sent in separate from the fdt work. Patches are all acked.

Changes from v3:
- patches 1,2,3:
  - former patches 5, 6 and 7 from "[PATCH v3 0/7] riscv: fdt related cleanups"
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04464.html

Daniel Henrique Barboza (3):
  hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
  hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
  hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

 hw/riscv/spike.c |  18 +-
 hw/riscv/virt.c  | 462 ++++++++++++++++++++++++-----------------------
 2 files changed, 242 insertions(+), 238 deletions(-)

-- 
2.39.1


