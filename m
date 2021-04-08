Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215E358A69
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:00:13 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUY0q-0007z3-Kd
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUXyc-0006vh-V2; Thu, 08 Apr 2021 12:57:54 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUXyW-00080K-KG; Thu, 08 Apr 2021 12:57:54 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 9C5FF2E1597;
 Thu,  8 Apr 2021 19:57:45 +0300 (MSK)
Received: from sas1-9d43635d01d6.qloud-c.yandex.net
 (sas1-9d43635d01d6.qloud-c.yandex.net [2a02:6b8:c08:793:0:640:9d43:635d])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 gp96tY83Op-vj0aUYZW; Thu, 08 Apr 2021 19:57:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617901065; bh=5ELpnT6CUYrPeGjp5Y6DnPlA9lx81ZB0tZaChvu8A1E=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=MeER0AXazOWsOTDynCsJ8XgRH7Uby9v9d63WUN0aBUWxjPqnnFEJ0LDEed/t7xfik
 pmo6APQg2gpver/gDotms0HQ7U/09DdJTSCVS/7Tuju+6v1DcGQmLlEEhO1YuXPuHe
 l63rSFnom2SjNHrGXwpFTfT3puPIu82K0z81+Y40=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by sas1-9d43635d01d6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 DcMqkdzKJu-vio8F0CN; Thu, 08 Apr 2021 19:57:45 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 19:57:41 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 09/10] block/nbd: introduce nbd_client_connection_new()
Message-ID: <YG82BSpevYRs0dUp@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-10-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-10-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 05:08:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> This is the last step of creating bs-independing nbd connection

s/independing/independent/

> interface. With next commit we can finally move it to separate file.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

