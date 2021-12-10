Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E446FC0B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 08:46:54 +0100 (CET)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvacH-0004i1-9n
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 02:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZ8-00029y-C3
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:43:38 -0500
Received: from [2607:f8b0:4864:20::529] (port=33783
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZ6-0007pR-4x
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:43:37 -0500
Received: by mail-pg1-x529.google.com with SMTP id f125so7414814pgc.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kTvaMGold7nK22Vtdg40hzt8dArwbjIZtLkagnScic=;
 b=OXCCRS6iDa4aDIIeyHziQgp/Hx+HdmaRq5bGqKubquMDya5ws/CPmNF1t5H4uk84yr
 GnZge/fYkPoWJnoTWlnmEJMOO5iyCHRxRtBtuffj3Dos0tOs5tTWEov4B/YCSHyO3MWy
 6GJMK2pntLpfOcu7G5Y/dVwfj2AUC67PHSCUVqy8m8pQacg1e+4XftUaP+4AeNf3vi//
 iUXNj31KkQHPywYbJWyIPz2lrUj+JElS1A0M+zaXPqXHBnyqLQi92+vhWzaWQCViyKQC
 Wer3APZuBCw4K81aH+2iXymR/midAl9LruF50DgQNscrZaJTem9C4JG7ykQOfMaRkt+d
 abwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kTvaMGold7nK22Vtdg40hzt8dArwbjIZtLkagnScic=;
 b=4INEdhJTYvkMZ2unw+RA+ZY00Qq36KBMc2qEF06n8p379RWZrEAdWcxgh5ipNCY/8b
 oqlL0XJCkdv0J/Pi2QppCoj1AF5yzVADp2VMVexlVYz55UaWnBS30vazI0IWQqrxwgl2
 Yw/APHWUwrdqDtNd29Wn/EGtJ40WJ1agErR5odVHJFds7yFR5xIoabfzMBZkqt3jOijb
 IPqFfj+K7ASvrzcyawcfimyc6610p06zYeyMtUqEJ/+qhR9mTzG0HAyLsq/dYdUtQ2bp
 3C06SxBuiX+RQz3DxqSM1Zu+H72mhJzWX5LkBW/5M2TbeqOhD6oU+SED28fxIO6sHRLP
 Gclw==
X-Gm-Message-State: AOAM5311iSZSUYyCXM3rrqDUdlSegkehPoUG2zqBQMb3FM3v2J/kTHdP
 tSNns9UZKUabArA0ObjVklvAb7C7OS9PPfBV
X-Google-Smtp-Source: ABdhPJzlltgub8N10iz+xw1UaA18Gd4fpwVBGzuTJsgDE7n2wc7oBwU3Oki1/yXrP79rv+iFz6cHXg==
X-Received: by 2002:a62:780f:0:b0:4ac:df3f:dad4 with SMTP id
 t15-20020a62780f000000b004acdf3fdad4mr16562221pfc.14.1639122213583; 
 Thu, 09 Dec 2021 23:43:33 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:43:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/8] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Fri, 10 Dec 2021 15:43:19 +0800
Message-Id: <20211210074329.5775-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Zfh - Half width floating point
Zfhmin - Subset of half width floating point

Zfh, Zfhmin v0.1 is now in public review period and is required by
RVV extension:
https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ

Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
respectively.

The port is available at:
https://github.com/sifive/qemu/tree/zfh-upstream-v6

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v6:
  * Rebase on riscv-to-apply.next.

v5:
  * Rebase on riscv-to-apply.next.

v4:
  * Spilt Zfh, Zfhmin cpu properties related changes into individual
    patches.

v3:
  * Use the renamed softfloat min/max APIs: *_minimum_number()
    and *_maximum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.
  * Add braces for if statements in REQUIRE_ZFH() and
    REQUIRE_ZFH_OR_ZFHMIN().
  * Rearrange the positions of Zfh and Zfhmin cpu properties.

v2:
  * Use {get,dest}_gpr APIs.
  * Add Zfhmin extension.

Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>

Frank Chang (3):
  target/riscv: zfh: add Zfh cpu property
  target/riscv: zfh: implement zfhmin extension
  target/riscv: zfh: add Zfhmin cpu property

Kito Cheng (5):
  target/riscv: zfh: half-precision load and store
  target/riscv: zfh: half-precision computational
  target/riscv: zfh: half-precision convert and move
  target/riscv: zfh: half-precision floating-point compare
  target/riscv: zfh: half-precision floating-point classify

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 180 ++++++++
 target/riscv/helper.h                     |  29 ++
 target/riscv/insn32.decode                |  38 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  20 +
 8 files changed, 824 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

--
2.31.1


