Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4BC54518B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:06:34 +0200 (CEST)
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKg5-0005FI-OR
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1nzKSD-0008PZ-7f
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:52:13 -0400
Received: from ssh.movementarian.org ([139.162.205.133]:34150
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1nzKSB-0005Zb-Gz
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:52:12 -0400
Received: from movement by movementarian.org with local (Exim 4.94.2)
 (envelope-from <movement@movementarian.org>)
 id 1nzKS2-005dec-Jx; Thu, 09 Jun 2022 16:52:02 +0100
Date: Thu, 9 Jun 2022 16:52:02 +0100
From: John Levon <levon@movementarian.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqIXIiQr+dpksBh6@movementarian.org>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 09, 2022 at 08:29:30AM -0600, Keith Busch wrote:

> On Wed, Jun 08, 2022 at 10:55:30PM +0200, Klaus Jensen wrote:
> > 
> > Keith, is this a bug in the kernel? If the code here would expect the
> > doorbell buffer to be updated for the admin queue as well, would we
> > break?
> 
> The admin queue has to be created before db buffer can be set up, so we can't
> rely on it. And this is a performance feature. Admin commands have never been
> considered performant, so we decided not to consider it though the spec allows
> it.

It's not just unnecessary, but enabling shadow doorbells on admin queues will
actively break device implementations (such as SPDK), which have had to presume
that driver implementations don't use shadow doorbells for the admin queue.

regards
john

