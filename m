Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B506397900
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:24:57 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo88N-0005CA-Vj
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lo83K-0004R9-WA; Tue, 01 Jun 2021 13:19:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lo83J-0003tC-9v; Tue, 01 Jun 2021 13:19:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26B28610C9;
 Tue,  1 Jun 2021 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622567978;
 bh=XR8I5BGjIXubXvGqYwH4E9WTzx7TT0CvcyUDmc02NhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROt0xStF44PWGKq8C8qJ3fF1HmqP93X08GWhTNv/piunO/Vd+WP9zIAaaer+tj2bS
 +OvqxmM/2TwXOR1fjCv7JW7H3Ip496sL4/LiQBz8hW8v+2usV2qRydPg/hu5Hw2mOQ
 2FhYziRdjFGqilC0mJ6P9MM/6T8arp5wxSYFM7dz9azdVz9iqxxc32IpZYllSK5Mxp
 D6Gbpqc9HENFA4VKlWxmw/2zHxBR04AI4kjF5YWEY8WUumKQXJNnVdBLAP+jkCryqH
 F5MjU/Ks3Q+a7oyR+Uql7DeEBTE6Vt1RwWACBfXIkezUt9s/Ycoj0wHwWS8fyFQEvx
 I43PohEqhNhew==
Date: Tue, 1 Jun 2021 10:19:36 -0700
From: Keith Busch <kbusch@kernel.org>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <20210601171936.GB4506@dhcp-10-100-145-180.wdc.com>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601143749.1669-2-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
> NVMe Boot Partitions provides an area that may be read by the host
> without initializing queues or even enabling the controller. This
> allows various platform initialization code to be stored on the NVMe
> device instead of some separete medium.
> 
> This patch adds the read support for such an area, as well as support
> for updating the boot partition contents from the host through the
> FW Download and Commit commands.

Please provide some details on what platform initilization sequence
running on QEMU is going to make use of this feature.

