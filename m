Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038842E9A7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:06:31 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHIU-0004QS-9E
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHFZ-0000go-4Q
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:03:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHFQ-0003hA-1W
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:03:23 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so8709399pjb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2hNgHe2zrYnXrWBqU9ypyVobvQIL0khbdmY2tayyX4=;
 b=ZOhSlcJXbMBJEqDwT2gjoMLuzpI/llR9nmoRF3Uwf4XqQ7oteT9QXTjG3qdnQE9LPy
 F7ic0Zq5NIPbtL8OwBqHV/7okIQU78SMEn40tNOeQyMH00HS6b4SFsyrYbGyhfWp+ig9
 bF47icFVLDR2UZfEgGsTxkAouFcKSTsLJEppbG01OOlp5kEkCyt2pw/NO5eMhkRdza0D
 TvWLY9wLEsLvVBQqgYxYpVVq7EmQOx5EzcevAtdzUb98sWRaU2uM+lpYyezx7OCaPsyN
 Ri+hztgnzmSk1mK+9cF/QcxtS+nRKnnjOVG72BxOG27h+iXLXknbFtXXD1bWKTW4gEZ+
 zuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2hNgHe2zrYnXrWBqU9ypyVobvQIL0khbdmY2tayyX4=;
 b=T26aHSV1dijGc8L4qOTPcKuPch6AoCkMJQZykDB8chiWSqFS3PPKehuLurhjhIogBc
 Xt8s+goJQSxW+IeD7/bZnBxYowan7IikCV0kyk9U+bg9YVCxb26djvem/zX2KrBd0J/a
 OmbOPEKtaFFFFG7L7xrwun7Qj5suhKTtCg5hD8+ysSA4QY08kpEs1TTDgQqtpdFwMepo
 th6HctEtP5bxT1euVCCSkCRhki09340eoGC7ZFrFosgfV5tMAKFK+ZRpXlbSE+0TZ34H
 jZaaAJ0ChcCEna4kPnbH/pJcu5s3vah7ii1LiH2Lwnzml48oSnjfCPLnuhB1D0lg8B9J
 Jvsw==
X-Gm-Message-State: AOAM5310FzV1L7gM/AIVX85J9LCMPp19TwI3dmL8XAYitbguEmeNerP8
 /Vjnt8surKxtmYvvTlJ5y37V0aI7dWmbxF9q
X-Google-Smtp-Source: ABdhPJw8uRRrKdXmfxZSZ7+oMumUDV4dsNmxE2zx7Ezz0kQl+8fmLh4A88n1y9SiZE+SbXdHlzxe5g==
X-Received: by 2002:a17:902:9b95:b0:13e:c43:2b57 with SMTP id
 y21-20020a1709029b9500b0013e0c432b57mr9650074plp.42.1634281397579; 
 Fri, 15 Oct 2021 00:03:17 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id w15sm4209553pfc.220.2021.10.15.00.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:03:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/6] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Fri, 15 Oct 2021 15:03:00 +0800
Message-Id: <20211015070307.3860984-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
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
https://github.com/sifive/qemu/tree/zfh-upstream-v2

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v2:
  * Use {get,dest}_gpr APIs.
  * Add Zfhmin extension.

Based-on: <20211015065500.3850513-1-frank.chang@sifive.com>

Frank Chang (1):
  target/riscv: zfh: implement zfhmin extension

Kito Cheng (5):
  target/riscv: zfh: half-precision load and store
  target/riscv: zfh: half-precision computational
  target/riscv: zfh: half-precision convert and move
  target/riscv: zfh: half-precision floating-point compare
  target/riscv: zfh: half-precision floating-point classify

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 176 +++++++
 target/riscv/helper.h                     |  29 ++
 target/riscv/insn32.decode                |  38 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 535 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  20 +
 8 files changed, 818 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

--
2.25.1


