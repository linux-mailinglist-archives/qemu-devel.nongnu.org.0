Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24C31D2F0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:09:36 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9TL-0007Vq-Vb
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9Sa-0006pE-Qn; Tue, 16 Feb 2021 18:08:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9SY-0007Xp-Qm; Tue, 16 Feb 2021 18:08:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA33964E79;
 Tue, 16 Feb 2021 23:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613516922;
 bh=FuaNp1Kd588a9HHc6BAHac6oLVtBPXfpcIm2uY+Dxgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iv3HdeDMEW85Lmpto/+r2wfF3wib4Ys6Z7HztFScmk1XN8tVNLtD9+Xp7eJohQ5og
 VoykcLjwSq6hz/Ko3ZB5NP2IPVTB2vAvVfaduPYVSnqfEX6gJRDRjELaGx+kv0aMTr
 xsMR8LZjPhkpvnxKV4XYRQqOotYJdsCz/NKS2lv1Vb+OSjTQcBSX7YnEhZPOMiQamg
 K2wCZn4QWYyPmDw0sNSEU3x0Z0LscMiYkUCeso4Q2dYWIajmo/GgqwDt5C+bbY3JTU
 V037cGcOm4e7PNGYrkkfrU06iKp0EM7NybJ+Qs+VApxk3WWmYf9U1obnzRl9/EJ9cg
 8wZHhbnrvqMOQ==
Date: Tue, 16 Feb 2021 15:08:39 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 08/12] hw/block/nvme: end-to-end data protection
Message-ID: <20210216230839.GD2708768@dhcp-10-100-145-180.wdc.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-9-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214230240.301275-9-its@irrelevant.dk>
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

On Mon, Feb 15, 2021 at 12:02:36AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add support for namespaces formatted with protection information. The
> type of end-to-end data protection (i.e. Type 1, Type 2 or Type 3) is
> selected with the `pi` nvme-ns device parameter. If the number of
> metadata bytes is larger than 8, the `pil` nvme-ns device parameter may
> be used to control the location of the 8-byte DIF tuple. The default
> `pil` value of '0', causes the DIF tuple to be transferred as the last
> 8 bytes of the metadata. Set to 1 to store this in the first eight bytes
> instead.


This file is getting quite large. I think this feature can have the bulk
of the implementation in a separate file. For ex, nvme-dif.c. But like
the linux implementation this is based on, it isn't really nvme
specific, so even better if t10 dif is implemented in a generic location
with an API for nvme and others.

