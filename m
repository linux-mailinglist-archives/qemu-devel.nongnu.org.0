Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543E5A2C14
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:14:06 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRby8-0003am-T5
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oRbLk-0000xR-K3; Fri, 26 Aug 2022 11:34:24 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oRbLe-0000V5-HP; Fri, 26 Aug 2022 11:34:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 681C261F20;
 Fri, 26 Aug 2022 15:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543A5C433C1;
 Fri, 26 Aug 2022 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661528048;
 bh=UZVH/1VuVW+ylRxDUs4gQ7AIecIGq2ElmU9sYVWsDcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6w/q3T6c9XnWbo3IDJXUDV8dKa85AQSA9nPexcvXwi7AgqxYFI4rwifNBsBPZ/L6
 rjWn71AIPzwlwZhGUGszeEU5E+gLcW7fntzkWay0+DhCYdxwXulpRz/07s2rSjunl5
 LDJz6fqsW69ZT1zUtPq1R+jzMXkMfYWBKypMJtKoqhoSia/IcBAEwJ23m7P/2CuvBh
 S0QP1EjNFX4VZto02AgauOq9vErBEQ0IOQ/0l5GIq69iQFNb8GTuzXJ/q6bCylUa/q
 eDt2asquizK3L6FS84i55N6EvwF7LbC+4dn1uc5BKBnWMaVx7HCkf8R8idtnE20WXY
 vTWQ7mPs0cXOg==
Date: Fri, 26 Aug 2022 09:34:05 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk, stefanha@gmail.com,
 Klaus Jensen <k.jensen@samsung.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
Message-ID: <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
 <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 11:12:04PM +0800, Jinhao Fan wrote:
> Use KVM's irqfd to send interrupts when possible. This approach is
> thread safe. Moreover, it does not have the inter-thread communication
> overhead of plain event notifiers since handler callback are called
> in the same system call as irqfd write.
> 
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

No idea what's going on here... This one is causing the following assert
failure with --enable-kvm:

  qemu-system-x86_64: ../accel/kvm/kvm-all.c:1781: kvm_irqchip_commit_routes: Assertion `ret == 0' failed.

I find it calls KVM_SET_GSI_ROUTING ioctl with gsi set to KVM_IRQ_ROUTING_MSI,
and linux kernel returns EINVAL in that case. It's never set that way without
this patch. Am I the only one seeing this?

