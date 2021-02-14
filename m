Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056131B032
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:26:54 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFYC-0007X8-ON
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBFVc-0006JM-G0; Sun, 14 Feb 2021 06:24:12 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBFVa-0005Zo-Up; Sun, 14 Feb 2021 06:24:12 -0500
Received: by mail-pg1-x535.google.com with SMTP id t11so2611598pgu.8;
 Sun, 14 Feb 2021 03:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9YFm4UhfZK2ZB3exhmFWkb03UDQ939ZUttahTpDxj0Q=;
 b=TXqwUnhMI5Ncmo7qMN7/ZVblFG+ST0srEaI3UPYk7OBtpILN1iwX545ehk/YkJPFEq
 otuXwWAxGjCDuzDljVSITEZO/+HmEA/IarowqogEwiTUxPEz2WCXFhMy0f5x1b7P9nCs
 yNugA5AnW2ITTivxOmMt4DMLVlIRvX8HIoY1+h4s2ugqd2gjLDpzhk5jHkJPKxtrcq0I
 J1qZ1r5IaYMCC84vXHwC1TfQVGiwsiV4IeFyrGB2LJwdcih73ydH60H3u+WOR4YDu7wq
 ipBgMqERnOPvS/H8aVNTvJR6Qlf+B73cBpugDn9h6yNpP141/WPTiouIrFKvNG0c20YJ
 unEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9YFm4UhfZK2ZB3exhmFWkb03UDQ939ZUttahTpDxj0Q=;
 b=G1z9R8jbvSGZG6saaru8HjdM3+7v/i8/O1vlzP2yuM1fx7xxypuqflIY4Wjvj8V2Ra
 lzeXnWO4fjZU35ljuZb9igwJHVXKZhTZodkbbcHVMnMNCjM+uA5UJDHb4OH1zWGkfXz1
 mXzjw3MdA3SJ39yafXQegvb6vIlxA51l/6jYjB5p8cPNti81sq9vmVgVZ4U2z5rliGQM
 AV1csohimmSqv4mDu3j5gdphtsZNoiagfzeuN1gujn4MbjB8KNYo+nZUstvmrdqrbEB7
 6ol+71zaG7rdR+y5+lSmN7ssIIPoRHVKT2MaOu042lmVFTvbWDF9w+hk5mODd6s0hLOx
 RR2Q==
X-Gm-Message-State: AOAM531FC/yJsrWCqrgXkeQct9y4Nst4Lz+3Gvu4c6Y5fVcYHvSxPFoc
 0kqV1hLzPG32NlZDGhpG6+IC8I/SYLG9vA==
X-Google-Smtp-Source: ABdhPJy4EjKxdKe26GxtTRW9v77ZczrEs8uT1SBVC1r3wDCTLf3Arnqp13emCdQWMoWbrQNum4RhJg==
X-Received: by 2002:a62:30c2:0:b029:1c5:242f:c925 with SMTP id
 w185-20020a6230c20000b02901c5242fc925mr10967529pfw.7.1613301848722; 
 Sun, 14 Feb 2021 03:24:08 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k24sm14802181pfg.40.2021.02.14.03.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 03:24:08 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: support ANA
Date: Sun, 14 Feb 2021 20:23:58 +0900
Message-Id: <20210214112400.26956-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series is to support Asymmetric Namespace Access(ANA).

`ana` parameter to the `nvme-subsys` device will turn all the
controllers in the subsystem to support multipath I/O with ANA.  Once
ana is enabled, `nvme-ns` device can have `ana.grpid` for the ANA group
ID.  All this information will be reported as a log information via Get
Log Page command of ANA page.

But, this is just for ANA state considered, not including any
transitions for ANA states between controllers and namespaces.
Therefore, the second patch introduced an interface to transite the ANA
state for a given ANA group via HMP command.  `nvme_ana_inject_state`
command will inject a given state to the given ANA group.

The following example breaks the path to the namespace(nsid=1) by
chainging the ANA group(ana.grpid=1) state to INACCESSIBLE.  Once this
state is injected by HMP interface, Asynchronous Event Notifier(AEN)
will be reported to the host for ANA change.  Then host will read the
log page again and find a path to the namespace(nsid=1) not through the
`nvme0` controller: `nvme` controller will be taken.  Then all the I/O
heading to namespace(nsid=1) will be routed to the `nvme1` controller.

Example:

  NVMe subsystem topology

    -device nvme-subsys,id=subsys0,ana=true \
    -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
    -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
    -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0,ana.grpid=1 \
    -device nvme-ns,id=ns2,drive=drv11,nsid=2,subsys=subsys0,ana.grpid=2 \

  ANA state transition (HMP command)

    (qemu) nvme_ana_inject_state nvme0 1 inaccessible
    nvme0: ANA state inaccessible(3) injected

Thanks,

Minwoo Im (2):
  hw/block/nvme: support Asymmetric Namespace Access(ANA)
  hw/block/nvme: add 'nvme_ana_inject_state' HMP command

 hmp-commands.hx        |  13 +++
 hw/block/nvme-ns.c     |  26 +++++
 hw/block/nvme-ns.h     |   3 +
 hw/block/nvme-subsys.c |   6 ++
 hw/block/nvme-subsys.h |   6 ++
 hw/block/nvme.c        | 240 ++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h        |  26 +++++
 include/block/nvme.h   |  51 ++++++++-
 include/monitor/hmp.h  |   1 +
 9 files changed, 369 insertions(+), 3 deletions(-)

-- 
2.17.1


