Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F633D2F7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 12:25:45 +0100 (CET)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7pZ-0001mu-08
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 07:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e4fd889f51094a8e76274ca1e9e0ed70375166f0@lizzy.crudebyte.com>)
 id 1lM7oc-0001Lf-IF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:24:46 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:35495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e4fd889f51094a8e76274ca1e9e0ed70375166f0@lizzy.crudebyte.com>)
 id 1lM7oa-0004bx-LB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=Xdj0QkHHlpaPPuoviEf4BkaDjWs/nRFeD8gPt0eYuy8=; b=hSCrx
 ZUQILPvLXVf2ulK3UhRDsdXhkx+QoR0Q613iFfmFXoxxR+8oV3OfOXXodLcHmSSmAbR/pwVdtjHgC
 Z7/zQipJC+yzE2cYPLK8lrMmFg1HodWdzVOXSP1SGKZ2L2btlg66KsKmgr+qHypj9aMFwogpDL0zz
 zT1+NdwHwqWZ1KPirwVRO0k8qBmT0hsuqthSbv2mDKmxtcwVaH25R5MXM/IyzltaA5CP+qey/UwSx
 MECvKwadNXEfkui3lPYLaoOvfAj4bh26CGsQT1Omz6zeQhfOM7c7HuiRMCYuomLRUufS1M9dI2HKB
 ReM/eTW8NxJb7K2THf3LQ5N/GrBHw==;
Message-Id: <cover.1615891769.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 16 Mar 2021 11:49:29 +0100
Subject: [PULL 0/1] 9p queue 2021-03-16
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e4fd889f51094a8e76274ca1e9e0ed70375166f0@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-03-15 19:23:00 +0000)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210316

for you to fetch changes up to e4fd889f51094a8e76274ca1e9e0ed70375166f0:

  hw/9pfs/9p-synth: Replaced qemu_mutex_lock with QEMU_LOCK_GUARD (2021-03-16 11:41:49 +0100)

----------------------------------------------------------------
9pfs: code cleanup

* Use lock-guard design pattern instead of manual lock/unlock.

----------------------------------------------------------------
Mahmoud Mandour (1):
      hw/9pfs/9p-synth: Replaced qemu_mutex_lock with QEMU_LOCK_GUARD

 hw/9pfs/9p-synth.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

