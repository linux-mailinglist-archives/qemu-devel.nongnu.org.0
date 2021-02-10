Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A93170B2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:55:14 +0100 (CET)
Received: from localhost ([::1]:42466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9vZx-00040s-DW
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9vY7-0002pN-Bj; Wed, 10 Feb 2021 14:53:19 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9vY5-0006cc-PW; Wed, 10 Feb 2021 14:53:19 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s15so1799837plr.9;
 Wed, 10 Feb 2021 11:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Pue+0K1oLMQw9rgXsUOZuOZivs3tuTIj28M/Wnws0fQ=;
 b=XYO/OT2X9FDFCRBnFDfRvMzrsTnu/h6eUi83dC3YiURB94PtCR0rAkTC1A9U35Gqtf
 kimEbXWgGJX8eZrNNZPOKkHzRkEezTbNj7HtwlLHO7Ex93OYkBIsB+gSvOTxHmDuj/gH
 5jfbm9I1Pi7PekjXLBrBd8Ufr8mOqyWlcuvV3DU6YZ4YV4CKpXcQlgC5llzCp0zCbmEo
 hgW4zaaBkIP3bxQIfhrRJi0JpmiPKuBMrZINA8FORWoL+4hzs8mUyjH78V5qxUa0CMm+
 cCBM+XAcqE5TT6ZSjanCvqfik4ZR1+8q0WvZktXq+CWEppxF5XmA+n6+AAgwSKNFoij0
 Uewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Pue+0K1oLMQw9rgXsUOZuOZivs3tuTIj28M/Wnws0fQ=;
 b=N3Bos1Yfl3kncBjDa2Sq1qb5rLkR8jzKh3REq/l0FRRWI7mGHVE/GcpnYV4pteNtyb
 9VJ9Gh1sz8+1gX4ao/O7gbDV9o5lOpUXqc/riHX4TfJjQjtB0heIYimM4NKJRRVKhvHt
 DN/mBdSRRHisuTBxieyjBaRuLHMH+dqLBX+RRLtLpjOOaUUKc+io0IN4udQllTkhNV9C
 177qWng6/Bgq1onllzxEbe8EeuBoze9/kmC2l0lynW4QEmwcOnXcVJ6OWZMDhIJYAUxf
 9feptqylIuIHrnQRc6UyynJQ0T2lhqKuDXHyXDSaxgXJkikaoV7lRMhnKide646R2IT3
 Ulzg==
X-Gm-Message-State: AOAM532+rs1W4CTq/BGt06r1rohXpZT29AUN7secKu4PmnQfp28yCeNt
 59yPKFYvgZQ/+0CPxntv9V+sUBOh5hrxMg==
X-Google-Smtp-Source: ABdhPJyNWmUIfwo+4mqLG5UwpMkYgN4BYzSs+rw2IYtUTp+fyqz3sqHA/1U9CVA+FOp371QVgD2EwQ==
X-Received: by 2002:a17:902:ee85:b029:e2:9754:a768 with SMTP id
 a5-20020a170902ee85b02900e29754a768mr4466431pld.23.1612986795482; 
 Wed, 10 Feb 2021 11:53:15 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id e26sm3221773pfm.87.2021.02.10.11.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 11:53:15 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 0/3] support command retry
Date: Thu, 11 Feb 2021 04:52:49 +0900
Message-Id: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series is RFC about supporting command retry feature in NVMe device
model.  The background to propose this feature is that in kernel
development and testing, retry scheme has not been able to be covered in
QEMU NVMe model device.  If we are able to control the retry scheme
fromt he device side, it would be nice for kernel developers to test.

We have been putting NVME_DNR in the CQ entry status field for
all error cases.  This series added a control for the command retry
based on the 'cmd-retry-delay' parameter which is newly added.  If it's
given to positive value, Command Retry Delay Time1(CRDT1) in the
Identify Controller data structure will be set in 100msec units.
Accordingly, it will cause host to Set Feature with Host Behavior(0x16)
to enable the Advanced Command Retry Enable(ACRE) feature to support
command retry with defined delay.  If 'cmd-retry-delay' param is given
to 0, then command failures will be retried directly without delay.

This series just considered Command Interrupted status code first which
is mainly about the ACRE feature addition.  nvme_should_retry() helper
will decide command should be retried or not.

But, we don't have any use-cases specified for the Command Interrupted
status code in the device model.  So, I proposed [3/3] patch by adding
'nvme_inject_state' HMP command to make users to give pre-defined state
to the controller device by injecting it via QEMU monitor.

Usage:

  # Configure the nvme0 device to be retried every 1sec(1000msec)
  -device nvme,id=nvme0,cmd-retry-delay=1000,...

  (qemu) nvme_inject_state nvme0 cmd-interrupted
  -device nvme,id=nvme0: state cmd-interrupted injected
  (qemu)

  # Then from now on, controller will interrupt all the commands
  # to be processed with Command Interrupted status code.  Then host
  # will retry based on the delay.

Thanks,

Minwoo Im (3):
  hw/block/nvme: set NVME_DNR in a single place
  hw/block/nvme: support command retry delay
  hw/block/nvme: add nvme_inject_state HMP command

 hmp-commands.hx       |  13 ++
 hw/block/nvme.c       | 304 +++++++++++++++++++++++++++++-------------
 hw/block/nvme.h       |  10 ++
 include/block/nvme.h  |  13 +-
 include/monitor/hmp.h |   1 +
 5 files changed, 244 insertions(+), 97 deletions(-)

-- 
2.17.1


