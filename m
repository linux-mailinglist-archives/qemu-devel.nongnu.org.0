Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD8F349533
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:18:54 +0100 (CET)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRl5-0000a6-LM
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf5-0002o2-DG; Thu, 25 Mar 2021 11:12:39 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:52072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf1-00021R-Oo; Thu, 25 Mar 2021 11:12:37 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 8CCA12E16AE;
 Thu, 25 Mar 2021 18:12:27 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 hvBGhUTzQj-CRceo6g1; Thu, 25 Mar 2021 18:12:27 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616685147; bh=zicfOvhjNCTdIQpELqa8BGoCFyokXmgGcqu3A5XqVNo=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=M42fqNq04T+p9lYGgeyyeHhaa00BW7+vUk6zwDg/hkoIMsLpGizBLLzG4epWJdLqV
 KA8qHqRcyQhbfC3EDB7RBmoQMyhSfBIqgtxOHgZK9QNrCEYR+bOM7UX5jlmwMhgQVQ
 k3EpYfUgMKlDGGHwJkZcclowZ1+LPavTHUdAFZ4w=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8801::1:8])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ejfhBn90eX-CQpGHsGH; Thu, 25 Mar 2021 18:12:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] vhost-user-blk: fix bug on device disconnection during
 initialization
Date: Thu, 25 Mar 2021 18:12:14 +0300
Message-Id: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 raphael.norwitz@nutanix.com, yc-core@yandex-team.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
  * 0003: a new patch added fixing the problem on vm shutdown
    I stumbled on this bug after v2 sending.
  * 0001: gramma fixing (Raphael)
  * 0002: commit message fixing (Raphael)

v2:
  * split the initial patch into two (Raphael)
  * rename init to realized (Raphael)
  * remove unrelated comment (Raphael)

When the vhost-user-blk device lose the connection to the daemon during
the initialization phase it kills qemu because of the assert in the code.
The series fixes the bug.

0001 is preparation for the fix
0002 fixes the bug, patch description has the full motivation for the series
0003 (added in v3) fix bug on vm shutdown

Denis Plotnikov (3):
  vhost-user-blk: use different event handlers on initialization
  vhost-user-blk: perform immediate cleanup if disconnect on
    initialization
  vhost-user-blk: add immediate cleanup on shutdown

 hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 31 deletions(-)

-- 
2.25.1


