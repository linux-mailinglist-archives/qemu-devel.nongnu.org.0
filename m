Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E5B6D9F73
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:06:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTxt-0000sd-Gc; Thu, 06 Apr 2023 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxs-0000sG-2M
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:04 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxp-0000Zg-HA
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:03 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-177b78067ffso43240288fac.7
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6B4Yi9cz99hxb6U4GBcfHGrnguBE8JWSocGRURZRi4=;
 b=bYoA7swvbP1tjuzF4QdSgpmQyC2BmFzusMxUOpUK6vW887Y0OkMsRU6n86hN39z6VV
 D5oNb2ixVGj1UiSgJD7IHaXSXoVW5BoUsZXXuqxHkdbo/YaOgXJmtO6YCP4I6yrgXfuT
 j72DqIfu2F6hdmwfM5y+gM3hF/l2zKRULZtwLo/BQnRQJu331aggb3mOUTQbcep5PnMh
 xmWn2429o3QnpwPfEUERzmOEEL4Q0ibvMdorE8Ohx8SXYXyW/8/7GEekAWfG8N+nm7dx
 Pesj/TyBL+FsrPaTVvoKMqL9nUuziSc8iByKGHyBnHG1WSRmXdOHRa23SampmLgwFUNb
 0Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6B4Yi9cz99hxb6U4GBcfHGrnguBE8JWSocGRURZRi4=;
 b=wM5mbediJRUWEHNWFDJh64GWC5NL5NNOwiJ/yg+MASzfdylyEP7xw4pWNX5fWcdkVs
 N1lLYZyOXUypRhGi6nQZwKkqczIn7pFrGxmsudmsHiVLT90kVSHm4v09Cldy55WX9rG2
 cMJY3ReWh83OEzoOwjz1fA6FwG8ypa98aat5UUo0DBHqUcQyBdQmOu1Urm2iC3aDBYKl
 nprHqSlRCcrP9ZB3T4gfT3qv8m30wPX81yARYj+dy3DdvU9dC+RHt87NE5N1RgPL5euX
 AgirzQM+1Uvfx8eK1vqRpFWNHN8ddAoR1HukU/1yZLccILZtTp9KOkd8OcOJPvjKoPyW
 ywEA==
X-Gm-Message-State: AAQBX9cYSF22IDvszZIa+6xsFxiXdWJWn3Y69Sm9q8EoSjLvu8nl2+LE
 kzq1sfdwGsGkgdgdbttTlp0kqBC55DRaNNSPyhc=
X-Google-Smtp-Source: AKy350Zu05bXDnkrID7M5d/yBEYvl5h7PwMbDDLz9rNbiaUFfJehRwTGtWUhT5pVTLbw4Ywr+jzC7w==
X-Received: by 2002:a05:6870:c0ca:b0:17a:e658:d954 with SMTP id
 e10-20020a056870c0ca00b0017ae658d954mr41252oad.49.1680804238984; 
 Thu, 06 Apr 2023 11:03:58 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:03:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 00/20] remove MISA ext_N flags from cpu->cfg
Date: Thu,  6 Apr 2023 15:03:31 -0300
Message-Id: <20230406180351.570807-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

This new version was rebased on top of Alistair's riscv-to-apply.next @
9c60ca583cb ("hw/riscv: Add signature dump function ...").

No other changes made.

Changes from v3:
- rebased with riscv-to-apply.next @ 9c60ca583cb
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06911.html

Daniel Henrique Barboza (20):
  target/riscv: sync env->misa_ext* with cpu->cfg in realize()
  target/riscv: remove MISA properties from isa_edata_arr[]
  target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
  target/riscv: introduce riscv_cpu_add_misa_properties()
  target/riscv: remove cpu->cfg.ext_a
  target/riscv: remove cpu->cfg.ext_c
  target/riscv: remove cpu->cfg.ext_d
  target/riscv: remove cpu->cfg.ext_f
  target/riscv: remove cpu->cfg.ext_i
  target/riscv: remove cpu->cfg.ext_e
  target/riscv: remove cpu->cfg.ext_m
  target/riscv: remove cpu->cfg.ext_s
  target/riscv: remove cpu->cfg.ext_u
  target/riscv: remove cpu->cfg.ext_h
  target/riscv: remove cpu->cfg.ext_j
  target/riscv: remove cpu->cfg.ext_v
  target/riscv: remove riscv_cpu_sync_misa_cfg()
  target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
  target/riscv: add RVG and remove cpu->cfg.ext_g
  target/riscv/cpu.c: redesign register_cpu_props()

 target/riscv/cpu.c                        | 412 +++++++++++-----------
 target/riscv/cpu.h                        |  19 +-
 target/riscv/insn_trans/trans_rvzce.c.inc |   2 +-
 3 files changed, 216 insertions(+), 217 deletions(-)

-- 
2.39.2


