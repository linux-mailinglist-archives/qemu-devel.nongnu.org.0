Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7DC3474DC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:41:56 +0100 (CET)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP01T-0004N8-CM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lOzyZ-0002jr-SV; Wed, 24 Mar 2021 05:38:55 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lOzyQ-0003sA-Pf; Wed, 24 Mar 2021 05:38:54 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9F8122E2019;
 Wed, 24 Mar 2021 12:38:37 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ck81ckoiXK-cb0uUjlI; Wed, 24 Mar 2021 12:38:37 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616578717; bh=gwpMU+ytMs5XwfIn4l834BSNQ35iKWviwaU/oszBX5I=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=Z1G0jI2GioUF7RwFMGc5yZEPV4eK9jLpif+XJBOdXPdr4/z+YO1euc73Lm85iNQtp
 2D+SseGpTTtVd93m/B/nTCePoSsujx3MLDYIV0qWVQ4ylKRm0y1RFNnduDjGMq6iKv
 9CWTNDZB7u1nFXwbUPGxuUT6oY/6Hg+1bh0TeoO4=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8814::1:7])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 80H52jY9gi-caomo987; Wed, 24 Mar 2021 12:38:36 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] vhost-user-blk: fix bug on device disconnection during
 initialization
Date: Wed, 24 Mar 2021 12:38:27 +0300
Message-Id: <20210324093829.116453-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

v2:
  * split the initial patch into two (Raphael)
  * rename init to realized (Raphael)
  * remove unrelated comment (Raphael)

When the vhost-user-blk device lose the connection to the daemon during
the initialization phase it kills qemu because of the assert in the code.
The series fixes the bug.

0001 is preparation for the fix
0002 fixes the bug, patch description has the full motivation for the series

Denis Plotnikov (2):
  vhost-user-blk: use different event handlers on initialization
  vhost-user-blk: perform immediate cleanup if disconnect on
    initialization

 hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 31 deletions(-)

-- 
2.25.1


