Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79327151E69
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 17:39:20 +0100 (CET)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz1EM-00086z-Cz
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 11:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kbusch@kernel.org>) id 1iz1B9-0004ud-05
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 11:36:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbusch@kernel.org>) id 1iz1B4-000214-4E
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 11:35:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33996)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbusch@kernel.org>)
 id 1iz1B1-0001Nf-92; Tue, 04 Feb 2020 11:35:51 -0500
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44DBB2087E;
 Tue,  4 Feb 2020 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580834150;
 bh=ux+KKGQ4e5NIOuWZQdbzTkCUiLkkVpxYOMORsFa4CPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1F6IB5WisSvp7tXa2K5GoSTTx0GlVVeaQCGSh8uLcoMVk9k468w2EDUXGlryX3Zn
 VRydhaihseCiTUS8NqdWqolkkKoDRFTzQDLUjtrnpQWUZ68VAAMC5cQj4Pg96JpI82
 Qhen4n/BFOh7Hf44x6RwTiU/oi4PEykSMqUUuKCo=
Date: Wed, 5 Feb 2020 01:35:47 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v5 24/26] nvme: change controller pci id
Message-ID: <20200204163547.GB6823@redsun51.ssa.fujisawa.hgst.com>
References: <20200204095208.269131-1-k.jensen@samsung.com>
 <CGME20200204095231eucas1p21019b1d857fcda9d67950e7d01de6b6a@eucas1p2.samsung.com>
 <20200204095208.269131-25-k.jensen@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204095208.269131-25-k.jensen@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 04, 2020 at 10:52:06AM +0100, Klaus Jensen wrote:
> There are two reasons for changing this:
> 
>   1. The nvme device currently uses an internal Intel device id.
> 
>   2. Since commits "nvme: fix write zeroes offset and count" and "nvme:
>      support multiple namespaces" the controller device no longer has
>      the quirks that the Linux kernel think it has.
> 
>      As the quirks are applied based on pci vendor and device id, change
>      them to get rid of the quirks.
> 
> To keep backward compatibility, add a new 'x-use-intel-id' parameter to
> the nvme device to force use of the Intel vendor and device id. This is
> off by default but add a compat property to set this for machines 4.2
> and older.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Yay, thank you for following through on getting this identifier assigned.

Reviewed-by: Keith Busch <kbusch@kernel.org>

