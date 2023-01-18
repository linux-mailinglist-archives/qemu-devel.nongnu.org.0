Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DE672B45
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 23:28:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIGtD-0001ZQ-JQ; Wed, 18 Jan 2023 17:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIGtA-0001Yd-BD; Wed, 18 Jan 2023 17:26:36 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIGt8-0008Nz-MH; Wed, 18 Jan 2023 17:26:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7037A61A1E;
 Wed, 18 Jan 2023 22:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A592DC433EF;
 Wed, 18 Jan 2023 22:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674080792;
 bh=S55Sz8gIGLeBZ0gKVGFlmm2cwRoTnLsEEPBC36F1WPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hpvmf94AB9ewKF6hBBIlNOp68MKy0T25hi2gPzJsbROrYtx/cVPbepBfSra3HqgJF
 pTflNafLTv4jwnESlZBh6yzbgDOd5RVk2ElzXvZisZ5gVR9vO+toC/vN/eXj5WDaGb
 +kHZyp1gjXn6k9DdHuJdVLkUE5kLeXnSYQBcJzrnc297YdZf+Gw7mL6k9/GVhVa8Rp
 1xJXvVlsPKwdoRN3jo64BsQi9eeQV2Jjr9/Ls1+PPMNu1+tUZEsNZEYr3TMyfJuQ8q
 qVgako9WraMux2iq8NfTc0Wi4YaZA5zwHljInvPprUF28MN/iJfmgzGZulmkWl52Bh
 Oq0j+95sWJUVg==
Date: Wed, 18 Jan 2023 15:26:29 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8hyFcsYbvLOQ+XJ@kbusch-mbp>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8AG21o/9/3eUMIg@cormorant.local>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Klaus,

This isn't going to help your issue, but there are at least two legacy
irq bugs in the nvme qemu implementation.

1. The admin queue breaks if start with legacy and later initialize
msix.

2. The legacy vector is shared among all queues, but it's being
deasserted when the first queue's doorbell makes it empty. It should
remain enabled if any cq is non-empty.

I'll send you some patches for those later. Still working on the real
problem.

