Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6FE59180E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 03:12:25 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMfhQ-0000UW-4c
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 21:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffk-0004ri-2h
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:40 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:37483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffi-0003EV-Ka
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:39 -0400
Received: by mail-pl1-f181.google.com with SMTP id m2so2094736pls.4
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 18:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=aFjqM+75xe8JTbG4L4Tsyj4ASkTpwhBNYS9QcoG4Et0=;
 b=qHmC25As+ZARseFHk5BCu38GSV3T4BnI6sS49UT7iY+JcqeJEcSK18RGWh/LUUqzKS
 tNM5UPCAjfwzm4XYliSuuOqrFJ9UPSOPBBwhvSeWf7DksvOqJe1mdedgESUuLN3QU5Zd
 YbJEuJE1bOe3R/TFB7h0dyv6MmA+fwYIiLWoTUOpzr6aaddiJwwswkfnwqTpsYuQciiF
 ZWOXUDpGc6hntQ00/WpBRcGwUOY12wJQHkhj5iY65Dp+G0iGV+S4ucp+QfPTf2deHO/p
 ZM13RbLQCjEbiMC97toZ7Xj86QdRq1cdN9o/8YRiNwJafdKT/sEwN/BQztWnWWFIbRKD
 s/Kg==
X-Gm-Message-State: ACgBeo0+S+Xxqeba7tYiHtpTXS/dosvLt/9Uc59ezJxJ8qZIr13zdfi9
 h9Q5UEtGQnibJ3sVC2rOMHuqbnYjswM=
X-Google-Smtp-Source: AA6agR6cS0P4N5I1h8a9ksnYVv3CRI3ebxinlsFXi22T0y6dQTnbhkypztx/xBM+ihX7DwDvHjlTZA==
X-Received: by 2002:a17:903:492:b0:16d:d562:42d6 with SMTP id
 jj18-20020a170903049200b0016dd56242d6mr6477345plb.47.1660353036662; 
 Fri, 12 Aug 2022 18:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c09:6206:ddeb:f971:2f4c:7f03])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170902c94a00b0016dcfedfe30sm2440976pla.90.2022.08.12.18.10.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:10:36 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Set runstate to RUN_STATE_RESTORE_VM when started with
 "-loadvm"
Date: Fri, 12 Aug 2022 18:10:28 -0700
Message-Id: <20220813011031.3744-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.181; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, there was a bug in usbredir which prevented "-loadvm" from working
because libusbredir's usbredirparser_unserialize() fails when a HELLO packet is
sent as part of the device's initalization.

The fix was to not send HELLO when in the RUN_STATE_PRELAUNCH state. However,
recently we found that this breaks when QEMU is started with "-S" because it
is in the RUN_STATE_PRELAUNCH state while halted before boot as well.

This patch attempts to re-fix the issue by setting the run state to
RUN_STATE_RESTORE_VM when started with "-loadvm" and recognizing that state
in usbredir's initalization.

To make sure there's no unintended side effects, we searched for
"RUN_STATE_RESTORE_VM" in the code base and found only references in
migration/savevm.c, monitor/hmp-cmds.c, and replay/replay-debugging.c. None of
these seems to be affected by RUN_STATE_RESTORE_VM before RUN_STATE_RUNNING.

Joelle van Dyne (3):
  Revert "usbredir: avoid queuing hello packet on snapshot restore"
  vl: on -loadvm set run state to "restore-vm"
  usbredir: avoid queuing hello packet on snapshot restore

 hw/usb/redirect.c  | 2 +-
 softmmu/runstate.c | 1 +
 softmmu/vl.c       | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.28.0


