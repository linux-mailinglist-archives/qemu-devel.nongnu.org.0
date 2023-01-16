Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D566CD42
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTNP-0006TJ-2e; Mon, 16 Jan 2023 12:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNM-0006Sp-Tm
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:34:28 -0500
Received: from mail-oa1-x43.google.com ([2001:4860:4864:20::43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNL-0004mB-0q
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:34:28 -0500
Received: by mail-oa1-x43.google.com with SMTP id
 586e51a60fabf-15ed38a9b04so10871379fac.8
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ua2DEWhTSYbOeDX9Z8sLTigQK0JhqYjB/hFbj3gHy5A=;
 b=jSk4UOGPGyJK34h9BSHaT1Xv0wRXgwsW5O/sWyt9KN286zD9yrM0s7bqvTZcXuG0Ds
 MpRF0ANzXV4F/8KAEdR2Z+ZeUKovvHsvyX0P1JGU/ntUygLCOBO3ugHTN5gRy2NTVxzH
 2qw/qmAUbaLsPfQHzPwVVWyTSWaZI6Yuidlf8VSfHdaV45vsV2YWymkfhTm0d1FDSqKw
 plE73M1v1BrFGqKHZR7jlBv709TOtiLi6UNer0VpVgzn0V0tr+HOpezJmEbsvidljsRl
 vYJQqqsdiic6+MLODumuXgw6UqtNN8mZq+xuzwnIXUM82D3U6oRaUpMK302crVbNXzG7
 m+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ua2DEWhTSYbOeDX9Z8sLTigQK0JhqYjB/hFbj3gHy5A=;
 b=q2AKUvkqiielR3U2k7D5Fr5FtAqkRW3kRgpsWg2rZ2OReGvuuhAz3yi2AHwms6ZE6I
 ZJ6PMz8Ed55Jif/17b/zKEF9LAcWXmkC01QxnWVgO832QHWkPJBEinT6YBWPp+yu9Cc0
 Qmpf72SvtSI7MFgiNJmIiOHWSaiQTo9SB7qK0hhiay2/tsk3CjcNIzQXjO5ef67svlbg
 aLPM/pmXbvy+bkg6rNXwqktQZanlgNmiLxqgTQU8wxEX3YANvwjL91onAyQOi/ELUFAK
 tvNw2bK/8uJMa+N7ID6dZyissOAdFQkNr3/dfiQGSzCrr5yaPTPytBcfL1hZnhNnNgI5
 83VA==
X-Gm-Message-State: AFqh2krc1XkoCkDvNbDovzzrdVuFtbsQ/P885katIL4lPXdx5806eTJs
 6nbTZoCNyJHolI16afkDNtUTEtifuAbFS+zzBv4=
X-Google-Smtp-Source: AMrXdXtkHxvzggjf80qyfA6fpbxPt0WD4cM4jJUUlhgwLu7I57oet0CcQjB3NPyQtsKa6Ri1AdrW/w==
X-Received: by 2002:a05:6871:440c:b0:15e:9cf2:5163 with SMTP id
 nd12-20020a056871440c00b0015e9cf25163mr299571oab.41.1673890465427; 
 Mon, 16 Jan 2023 09:34:25 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 f23-20020a4ae617000000b0049fd5c02d25sm1353802oot.12.2023.01.16.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:34:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/6] riscv: fdt related cleanups
Date: Mon, 16 Jan 2023 14:34:14 -0300
Message-Id: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::43;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x43.google.com
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

In this version I included a rework in riscv_load_fdt() to separate the
fdt address calculation from the fdt load process. Having both in the
same function doesn't give us much and can lead to confusion due to how
other archs handle their respective load_fdt() functions.

Patches are based on riscv-to-apply.next.

Changes from v1:
- former patches 1-6: already applied to riscv-to-apply.next
- former patch 7: removed
- patch 1 (new):
  - fix a potential issue with fdt_pack() called after fdt_totalsize()
- patch 2 (new):  
  - split fdt address compute from fdt load logic
- patch 3 (new):
  - simplify the new riscv_compute_fdt_addr() by using MachineState
- patches 4,5,6:
  - added Phil's r-b
v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02246.html


Daniel Henrique Barboza (6):
  hw/riscv/boot.c: calculate fdt size after fdt_pack()
  hw/riscv: split fdt address calculation from fdt load
  hw/riscv: simplify riscv_compute_fdt_addr()
  hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
  hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
  hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

 hw/riscv/boot.c            |  33 ++-
 hw/riscv/microchip_pfsoc.c |   6 +-
 hw/riscv/sifive_u.c        |   7 +-
 hw/riscv/spike.c           |  24 +-
 hw/riscv/virt.c            | 468 +++++++++++++++++++------------------
 include/hw/riscv/boot.h    |   3 +-
 6 files changed, 281 insertions(+), 260 deletions(-)

-- 
2.39.0


