Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3050E3B3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:53:03 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj05G-0007ng-GR
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nizml-0000KW-Dc; Mon, 25 Apr 2022 10:33:56 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:36598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nizmj-0005kd-Ku; Mon, 25 Apr 2022 10:33:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40D8F61662;
 Mon, 25 Apr 2022 14:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50544C385AB;
 Mon, 25 Apr 2022 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650897228;
 bh=U/pLw/jJ996syogjw0CM72aHqAgTtDil0ukpTpGw7MQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=llH7vR9XsRLV28DMXA4FIRV8SZ1aVctngt03fudtj2VVcP59rPu5rGuHfRfB1uibq
 OTJnC3ZiippJjEDRMNPSod75xPXDH+8UXG8pgyuwW4S3DM2sarKwXiEJgqaVZoFs1D
 JcCam6mAYj4NUAzdWr49yRj+bKOCbOzUyjjGDTfoE287fKEMsQiIKhZVB/NtppMaiL
 LUS5VM6FTmzA8ojhaOD/AFPLxiukwR5DQpukO3EL+rTiWq0zvdRNVkkMJQKEQXEdra
 4i/4Zc0E9dfbt6RXAaK6YuvlMN0WydlYtsI+KKJ+b8AT4CAyx1mMP82cKKoLyXNRYD
 Dpch9PQDtOvZQ==
Date: Mon, 25 Apr 2022 08:33:45 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] nvme: fix bit buckets
Message-ID: <YmaxSUmENF1jAcag@kbusch-mbp.dhcp.thefacebook.com>
References: <20220422163721.3392373-1-kbusch@kernel.org>
 <YmZxApttNqy6SNLi@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmZxApttNqy6SNLi@apples>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kbusch@fb.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 11:59:30AM +0200, Klaus Jensen wrote:
> The approach is neat and simple, but I don't think it has the intended
> effect. The memory region addr is just left at 0x0, so we just end up
> with mapping that directly into the qsg and in my test setup, this
> basically does DMA to the admin completion queue which happens to be at
> 0x0.
> 
> I would have liked to handle it like we do for CMB addresses, and
> reserve some address known to the device (i.e. remapping to a local
> allocated buffer), but we can't easily do that because of the iov/qsg
> duality thingie. The dma helpers wont work with it.
> 
> For now, I think we need to just rip out the bit bucket support.

Ah crap, I think you're right. Not as simple as I thought. The idea was to have
a dummy DMA-able region. We can have a controller DMA to another controller's
CMB without any special handling, so that's kind of what I'm trying except the
region doesn't need to be tied to any particular device.

And now that you got me thinking about it, there needs to be special bit bucket
handling for local CMB as well.

