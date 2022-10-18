Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE212602073
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 03:29:06 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okbPl-0003wi-8m
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 21:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1okbNd-0002DA-NH; Mon, 17 Oct 2022 21:26:53 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1okbNc-0006Ci-0F; Mon, 17 Oct 2022 21:26:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E180612F4;
 Tue, 18 Oct 2022 01:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF227C433D6;
 Tue, 18 Oct 2022 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666056407;
 bh=T68CN2SGOaBpQNuMZfn7mBL9Zq41PiKYwHxZzpuuZRQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fWMyBqNDPxEMfzKCer3hc8hnYg8Lk9xRepw33WRjRSobJS3ZkNy4j2M+ytM3AHPgO
 8nZX2q7JSxnhFwjUi29UzhNw/w0Ezeu5OHNVTajm2KF26i3cvC6kbUBPQWX/FPvITg
 cPLO+kkx5cQmScEmOd1SbvFJT+YJjYs1eri2HUQaKpnhdjniSUGPOAtGT0EBIlo9E1
 nMXiMDKfwdXP2NJQNgVLbVPOzba119X1a+s0A1Mwl1T94WMaHJ3Sm06Ca7+2Dv5L7k
 SN3dVcGoAT8e4MbCyFnz93pRYPWwA2ycmdgh5DuUwQyGmJ4z6w1iybe3J4woIuGQus
 1RjqNpjcKcrzw==
Date: Mon, 17 Oct 2022 18:26:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
 stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 Oct 2022, Julien Grall wrote:
> Hi,
> 
> There seem to be some missing patches on xen-devel (including the cover
> letter). Is that expected?
> 
> On 15/10/2022 06:07, Vikram Garhwal wrote:
> > Add a new machine xenpv which creates a IOREQ server to register/connect
> > with
> > Xen Hypervisor.
> 
> I don't like the name 'xenpv' because it doesn't convey the fact that some of
> the HW may be emulated rather than para-virtualized. In fact one may only want
> to use for emulating devices.
> 
> Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen' to
> select a Xen layout.

The benefit of 'xenpv' is that it doesn't require any changes to libxl.
It is even backward compatible so it could be used with an older version
of Xen/libxl. Backward compatibility aside, if we come up with a
different name then we'll need changes to libxl and to manage those
changes. For instance, if we use 'xen-arm' that would mean we would need
to handle per-arch QEMU machine names.

