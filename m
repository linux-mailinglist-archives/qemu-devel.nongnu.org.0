Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE383C272F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:00:00 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sv1-0006QS-75
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m1stv-0005Yb-1r; Fri, 09 Jul 2021 11:58:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m1sts-0004F5-Qu; Fri, 09 Jul 2021 11:58:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8C8161378;
 Fri,  9 Jul 2021 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625846326;
 bh=rqhfIh2ehSZziUEuNTf4QumirXmT+uHejImiXmTMvK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGVTwINweRITbDN8KPbpoCj2iG70zNkmkQXkaBXAj3Udh0jYNeNCwbPxbgyyROuhc
 8zTVmrCQb8/cBvY+51RhT39ehGfLrM735HP07DDTkgQxb7+9SeHPvYhCX7SaUfmyMP
 MSc5casVRwMqHRdEku2Ib4NPwszWxscO2dJAcC7BtfSyzs/pokPrWV5orpvzlTpvtd
 nMviVeu/WARR2eDYpOH6gYebz9X9LlTOiho1CbdDUjk0kYXaqZoxmPdi2u7dspaMlB
 jxwCS5JZcicR9o2RYLTExXvj0+Dtr+EO5gtdizSyBpejyspADwSBedWM/CuysGzB5O
 FojmGOJj+Z7ng==
Date: Fri, 9 Jul 2021 08:58:42 -0700
From: Keith Busch <kbusch@kernel.org>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <20210709155842.GA291156@dhcp-10-100-145-180.wdc.com>
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
 <20210709135545.GA11148@test-zns>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709135545.GA11148@test-zns>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infrared.org, mreitz@redhat.com,
 u.kishore@samsung.com, stefanha@redhat.com, its@irrelevant.dk,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 07:25:45PM +0530, Padmakar Kalghatgi wrote:
> The following commands are tested with nvme-cli by hooking
> to the cid of the vsock as shown above and use the socket
> send/recieve commands to issue the commands and get the response.

Why sockets? Shouldn't mi targets use smbus for that?

