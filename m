Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E868C450199
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 10:44:55 +0100 (CET)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYXm-0002gL-J2
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 04:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mmYV1-0000I7-Uh
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:42:03 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:33182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mmYUy-0003Tu-9d
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:42:02 -0500
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 6AAEF2E049A;
 Mon, 15 Nov 2021 12:41:53 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 NO1ms1YH4R-frsSttqf; Mon, 15 Nov 2021 12:41:53 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636969313; bh=4RkieWKxF2LbXFjgC/T92iRhv/yynL3iX0yO+ONWLyQ=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=rZJW6tPCjbIg+eeirXK4LJuRe7IDYsVfqiwj+h+r4gC+LuPZdXqoDTUHbuiQ2lPJE
 BNzt7VBX9qbLcAAYf0H/ppApPuQ9lpJEVCKSTloI72ZsHIBBiVxnyZxFUo9CryJBuy
 TUnUmW8DEl+qfOLz9Dm08bsyofcjSX9B1QhhKhdo=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from den-plotnikov-w.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8016::1:27])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 1oVbS2CALn-fqw43wSu; Mon, 15 Nov 2021 12:41:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] vl: flush all task from rcu queue before exiting
Date: Mon, 15 Nov 2021 12:41:41 +0300
Message-Id: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, dgilbert@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v0:
 * move monitor cleanup to the very end of qemu cleanup [Paolo]

The goal is to notify management layer about device destruction on qemu shutdown.
Without this series DEVICE_DELETED event may not be sent because of stuck tasks
in the rcu thread. The rcu tasks may stuck on qemu shutdown because the rcu
not always have enough time to run them. 


Denis Plotnikov (2):
  monitor: move monitor destruction to the very end of qemu cleanup
  vl: flush all task from rcu queue before exiting

 include/qemu/rcu.h |  1 +
 monitor/monitor.c  |  6 ++++++
 softmmu/runstate.c |  4 +++-
 util/rcu.c         | 12 ++++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1


