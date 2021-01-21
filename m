Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A282FF835
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:53:29 +0100 (CET)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ipU-0004vK-DQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l2ioE-0004Gi-HT; Thu, 21 Jan 2021 17:52:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l2ioC-0006q5-D3; Thu, 21 Jan 2021 17:52:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF822239EF;
 Thu, 21 Jan 2021 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611269525;
 bh=GYNAVmxrqGOZE1qrmyitwsibjSDOZRUxOKIi2BHclHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NeZwcLgrZGVWxkzCaUpbdiZAklPtErW17uuUq98LwlXrAbjjZLf2DhGbWIP8TlHp1
 kH9ftL9abueTRl1mzRO+o3TyNCr1Q9Gike+/6dXLdRHgs1xOUvGMEKBdDJR5EHpHLN
 Ajs29G9LytRQs704BVR+ecSciQ+RU+8wrX3VjZ080tcIh41zs/2CCoE+0at/rPkuHQ
 MAAQF25/YPH5gsNGLTSvWfcXIlCkW6QLCi9ewkgk+vsWPmlDqFf5TUs8UKydAMC+eD
 B/QExaUShWm6NKkTulTvinS0U+0lQshcMSMQWtw1KWDX0HyxILo47RX26gZPa32cm4
 +yD/pQjaZtdTw==
Date: Thu, 21 Jan 2021 14:52:02 -0800
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V4 1/6] hw/block/nvme: introduce nvme-subsys device
Message-ID: <20210121225202.GB1727271@dhcp-10-100-145-180.wdc.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
 <20210121220908.14247-2-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121220908.14247-2-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 07:09:03AM +0900, Minwoo Im wrote:
> +static void nvme_subsys_setup(NvmeSubsystem *subsys)
> +{
> +    char *subnqn;
> +
> +    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", subsys->parent_obj.id);
> +    strpadcpy((char *)subsys->subnqn, sizeof(subsys->subnqn), subnqn, '\0');
> +    g_free(subnqn);

Instead of the duplication and copy, you could format the string
directly into the destination:

    snprintf(subsys->subnqn, sizeof(subsys->subnqn), "nqn.2019-08.org.qemu:%s",
             subsys->parent_obj.id);

