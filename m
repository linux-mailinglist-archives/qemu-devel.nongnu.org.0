Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D7686C8D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 18:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNGep-0006am-JQ; Wed, 01 Feb 2023 12:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGel-0006a0-9Y
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:12:23 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGej-0004Ic-J6
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:12:22 -0500
Received: by mail-oi1-x241.google.com with SMTP id p185so16304664oif.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 09:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tlxJUvpOH7ACdoEORStwCyXU2J/yxPAjUz2kS57Cd7s=;
 b=g+j3YkHVdHVXmFuloeLO5JvW4wLOS11uPXpNLcu755g/M8cR7ydqgBX1dInBSgP73Q
 cFPttIVxEDt+GxYTBiLN0M1CBkAqWfVIvnXyVNkVJm2j13zAISv2dohYSYXOnivaKjLn
 4QiZ+Urf87miO2Ht3yMNRVw7XV0qJeVsd1NNf/xmfy8lXQLYpC/u/6QwRWmFpCLqnWuI
 UwZtttLjcYNdRQWTKfcwpL8j/0ieTC5AFNXUF5Vn/T3ehsTlj7KV4iCNNytuS9ObN3X3
 L6XiHWT55XcC+qtRKQYjZlPymuATDHAjs8nwaUokNE26vSOOkT7LX+qAnyHmz4L62+1h
 E3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tlxJUvpOH7ACdoEORStwCyXU2J/yxPAjUz2kS57Cd7s=;
 b=4PtjzAUU35qgkmYM3e9ALTQ9eEOgUz+sA8dIMEdIyEf02OaBR3cZn9BAFTgikeFvXk
 gVftxBSNHLEwZ/gSd5s8wDHy4zC+RtJHco6wYDiQ+JSdR+CZKK4O1a+yEFr6Xg7HZp3d
 FBuWt7pKUltubLt0WCb9N5A2VQVzXL4rrSTultJWuGFcM/DMY9cZ0fqAX2KDWZrqi6nl
 2CYQXMmGWF3iTtPH5SOtnXf7h7ifHb3u6SLWnH1kwUqkcXkT/I2tBSDN6Zz4SIiMiXm5
 KJTgUFv8v1TGNvSVvQvOPe9rQREshJKSkp9OfNRUU4Su5a24ZenwkQB5EuWcraWNuDdP
 DpTA==
X-Gm-Message-State: AO0yUKX1J2fjnpJrpeyP0CtDqf3zvzAV8oxErGt2cLhF1TFk0ogMbo65
 Q/RkSyNXdO0oI6ziQ0nlt1sV+aqayEFRVUZWl4M=
X-Google-Smtp-Source: AK7set9/arM2Bahwr92fXpvWB4xy04hV+7ys3r15UpoZKelLhoTWAr476VF69cEjGUcsYc4HlFd4ew==
X-Received: by 2002:a05:6808:164b:b0:365:7b1:d1a9 with SMTP id
 az11-20020a056808164b00b0036507b1d1a9mr1525062oib.15.1675271538489; 
 Wed, 01 Feb 2023 09:12:18 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056808068c00b003749e231db7sm7100627oig.30.2023.02.01.09.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:12:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 0/3] riscv_load_fdt() semantics change
Date: Wed,  1 Feb 2023 14:12:09 -0300
Message-Id: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x241.google.com
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

This version contains changed proposed by Bin in the v4 review.

Patches are based on riscv-to-apply.next.

Changes from v4:
- patch 1:
  - remove the fdt_pack() related lines instead of letting patch 2 do it
- patch 2:
  - make riscv_compute_fdt_addr() return an uint64_t
- patch 3:
  - do not change riscv_compute_fdt_addr() return type to hwaddr
  - fix comment typo
  - use a ternary instead of if/else in dram_end
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg05828.html

Daniel Henrique Barboza (3):
  hw/riscv/boot.c: calculate fdt size after fdt_pack()
  hw/riscv: split fdt address calculation from fdt load
  hw/riscv: change riscv_compute_fdt_addr() semantics

 hw/riscv/boot.c            | 53 +++++++++++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c |  7 +++--
 hw/riscv/sifive_u.c        |  8 +++---
 hw/riscv/spike.c           |  7 ++---
 hw/riscv/virt.c            |  8 +++---
 include/hw/riscv/boot.h    |  4 ++-
 6 files changed, 65 insertions(+), 22 deletions(-)

-- 
2.39.1


