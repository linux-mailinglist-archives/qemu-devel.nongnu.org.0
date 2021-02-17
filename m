Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F105331DE9E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:52:25 +0100 (CET)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQzw-00064v-Eb
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lCQyH-0004na-95; Wed, 17 Feb 2021 12:50:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:38946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lCQyF-0005S5-6t; Wed, 17 Feb 2021 12:50:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D78D64E42;
 Wed, 17 Feb 2021 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613584237;
 bh=RTLcxVoqRi9CwgjqTBCMh3/+HomBL+9B9ACICt4c84g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ECjN63Mh8uYP+ytwJFWTgh6/8oIhJ4RBMwGaObZ5AcszqIH5wGxPFNBwZ8glUqqAH
 F25aa6ubQAOw/5vt3gzYZ1NjI/yPRt+e/o0bJ0EWCxWw9bCY08ieielKpc3o6g82U+
 v6vVeSNVx9TPubWKaiPH1sLl54julMwG63QiIM15KX+4RQzpiBc+JYKSYHienEDDs0
 gDuYf89V8/zPUzERZK+rvmICnhbrrTzBPjwaMQvn3wAET949yAw36MUoZ8yin+6q6p
 CUilPcAO9N10JSx3Vx7NUZdXY32ZcAga+7su2UmYtPWNOuVlOVyQCtiWzfIrUgU5Kl
 nQdj8nASS2GDw==
Date: Thu, 18 Feb 2021 02:50:30 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Message-ID: <20210217175030.GA25688@redsun51.ssa.fujisawa.hgst.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210217001950.GH2708768@dhcp-10-100-145-180.wdc.com>
 <YCzcqaCFgupTgByl@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCzcqaCFgupTgByl@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 10:06:49AM +0100, Klaus Jensen wrote:
> On Feb 16 16:19, Keith Busch wrote:
> > The verify implementation looked fine, but lacking a generic backing for
> > it sounds to me the use cases aren't there to justify taking on this
> > feature.
> 
> Please check my reply on the verify patch - can you elaborate on
> "generic backing"? I'm not sure I understand what you have in mind,
> API-wise.

I meant it'd be nice if qemu block api provided a function like
"blk_aio_pverify()" to handle the details that you're implementing in
the nvme device. As you mentioned though, handling the protection
information part is problematic.

