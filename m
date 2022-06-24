Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1A559A2B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:15:34 +0200 (CEST)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4j9p-0007GH-QG
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o4j6Y-0004Um-0B
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:12:11 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:36568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o4j6L-0008I8-Ls
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:12:00 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 828F22E1ED3;
 Fri, 24 Jun 2022 16:11:50 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 NGQBJJyvPr-BlKivPuO; Fri, 24 Jun 2022 16:11:50 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656076310; bh=Wt2+UV5W271styxtIbW/UyuTncdxA9xqFDsMHH2LREc=;
 h=In-Reply-To:Subject:Cc:Date:References:To:From:Message-ID;
 b=GTAvm+XP1ZeGLWI2fzWnVwK1RDuIxBfJto+f9RLV21pOFs3f82BJuTyFrDHLmSCxm
 MIu/QZMkyN9r9ErDbIxvzRKAvdw1MRmK+FGc+S04nxkKe236kE6aMWxvWSkDmqUpel
 3S1qjDLXFczgbsF2nKj86ceox7y7cg0P6apifXsQ=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb (unknown [2a02:6b8:b081:b584::1:32])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 qYQgUPJcyC-BlNCPlC1; Fri, 24 Jun 2022 16:11:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 24 Jun 2022 16:11:46 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: Re: [PATCH v2 2/2] vhost: setup error eventfd and dump errors
Message-ID: <YrW38ZzJs3W1+aDP@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, mst@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
References: <20220623161325.18813-1-vsementsov@yandex-team.ru>
 <20220623161325.18813-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623161325.18813-3-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 07:13:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> 
> Vhost has error notifications, let's log them like other errors.
> For each virt-queue setup eventfd for vring error notifications.
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> [vsementsov: rename patch, change commit message  and dump error like
>              other errors in the file]
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  hw/virtio/vhost.c         | 37 +++++++++++++++++++++++++++++++++++++
>  include/hw/virtio/vhost.h |  1 +
>  2 files changed, 38 insertions(+)

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

