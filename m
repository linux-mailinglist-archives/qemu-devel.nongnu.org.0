Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF257233D78
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 04:48:51 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1L6I-00025Z-5A
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 22:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k1L5N-0001GU-Me
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 22:47:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k1L5I-0003oj-Cq
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 22:47:52 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t15so6398110pjq.5
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+Ve18ryrBZm3ej+tqfAtVJOqiNP/aMp/Y358iAXxN+0=;
 b=dEGoLJVSbnDcPNFN3SXrM/uIqIoTDom1kH8qo1a6HDcmgkakZv/yaoWwzSi0Tr9ytF
 ixgDBXopgFSDTw3BqPA/kK0rKvyatR40EThaFbKsvwtBReL6ls6iqsSiD5gVmaoIDjYr
 KpaAHRTtC1S0mf2ESlT0jNuFU1+SCJAprsaSiBTEvuemERtXkrmVdcbyi6NvwSSGR3OX
 eRjPh+nRqI3RuryUawhFKkybaeYK1QVOK9VEpdTKFv33QLM9NB/t1w15D/xqwsA/u/7K
 9hcgOGZ499jjSyBa7wgFpLyEgK8rvkI/2Ki3erXBgtQzmapHpOXWTZ+2c8IvQ72PMkfJ
 0VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+Ve18ryrBZm3ej+tqfAtVJOqiNP/aMp/Y358iAXxN+0=;
 b=jMDALUzLr9jqbYPIZPSzj3YJDCaik2lBChv+GRe16aOZeo2EO4Z2Skqzeq6/pKsH9B
 cwfVsTix8p8dX4000f3iadZPfbbfME3/CjZYs94e3NDyQsi84pRMiVTsx63EaFQVDfzK
 hE+Mqil279jbD+GMyzHvIa2kS/SHNZReX315taaU3Zq+WWgbth3+1CK0Op10OOrkUok3
 fbOVQNnwaoxj8f+t9nEyKqKo/QHo7Z/b2HtdDHgDMK5X78406WONvZhQRshhALQghTk/
 sLjSN/kPKFfqX58cqLa8GgjYKRX64e+W7BsjsxMEW74mwNl9HnhJkFS6jhD/MVubNrBG
 rtVg==
X-Gm-Message-State: AOAM531fsZBgshjIiOd+Jj1nXxtmkswOSDIUUgZuG6eSI2Goq/l33IJz
 Hr6+ai+VyvGfrgheynoih3OVxA==
X-Google-Smtp-Source: ABdhPJxlZirf0thx/sT37MRy0KAh5NyqL2F1ZtoVTK+20RG/ztp7QoYvSW5TLCQKuDYUGI0i6EPGpw==
X-Received: by 2002:aa7:83cf:: with SMTP id j15mr1643425pfn.251.1596163666047; 
 Thu, 30 Jul 2020 19:47:46 -0700 (PDT)
Received: from localhost.localdomain (111-243-189-249.dynamic-ip.hinet.net.
 [111.243.189.249])
 by smtp.gmail.com with ESMTPSA id c27sm7578483pfj.163.2020.07.30.19.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 19:47:45 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Subject: [RFC PATCH v2 0/2] Add write-once and file-backed features to OTP
Date: Fri, 31 Jul 2020 10:47:06 +0800
Message-Id: <20200731024708.32725-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=green.wan@sifive.com; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Green Wan <green.wan@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First patch is to add file-backed implementation to allow users to assign
an OTP image file to machine. Users can assign the property, "otp-file",
to machine to enable it. File-backed feature is set to "NULL" string in
default. Any filename other than "NULL" is used as OTP image file.

For example, '-M sifive_u,otp-file="otp.img"'

To keep data up-to-date due to an unexpected crash or CTRL+a-x exit, every
read/write command to OTP memory involves file open, mmap and close
operation to the image file.

Second patch is to add 'write-once' feature to block second write to the
OTP memory. Only keep the 'written' state for non-control register range
from 0x38 to 16KB.

Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/riscv: sifive_u: Add file-backed OTP.
  hw/riscv: sifive_u: Add write-once protection.

 hw/riscv/sifive_u.c             |  26 ++++++++
 hw/riscv/sifive_u_otp.c         | 103 ++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u.h     |   2 +
 include/hw/riscv/sifive_u_otp.h |   2 +
 4 files changed, 133 insertions(+)

-- 
2.17.1


