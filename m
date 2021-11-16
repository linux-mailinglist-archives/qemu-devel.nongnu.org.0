Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E84B453BA5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:29:39 +0100 (CET)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn61K-0005LK-1A
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mn60A-0004Vl-KA; Tue, 16 Nov 2021 16:28:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:38358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mn607-0002SI-JO; Tue, 16 Nov 2021 16:28:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84F7C63217;
 Tue, 16 Nov 2021 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637098102;
 bh=S9lybgFTX6oOw5rilcAQPGJXIcQJ6un5SViZ0FtxLGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fq+VlV5U3WX1RTHN7jtERNZBrXJCfBS5Jp/taBUwCfPXEmVxEbRBF++G3bsZZ/sMw
 iy9wxE15VwInZ+bUeTsfuMp8Jw0QtH0WtRSnsn5HEBV+oleWF/UeVvCUgU+tL0lkc6
 jZtE2HlXPFxc5PAfoyJIqsb3F0sdhP79+0gxJ31rcn/mnseaWK/x4Hu/pADDpsGcPy
 SZICghKIYc/gzNJfTHI1ZgoNNvg6rGqeMu54bKBeqEJiduv6rE4QQTbGZa/bh9/n34
 OYy+bW+6Dx61QaW89H0RzxrsIQ58pWCqiMicvC+Oo3yH51jSncbS7cHfKcIFqPpd/Q
 xPiQQOpRW/Qqw==
Date: Tue, 16 Nov 2021 13:28:19 -0800
From: Keith Busch <kbusch@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v2 08/15] hw/nvme: Implement the Function Level Reset
Message-ID: <20211116212819.GA2987582@dhcp-10-100-145-180.wdc.com>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-9-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116153446.317143-9-lukasz.gieryk@linux.intel.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 04:34:39PM +0100, Łukasz Gieryk wrote:
>      if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
> -        pcie_sriov_pf_disable_vfs(&n->parent_obj);
> +        if (rst != NVME_RESET_CONTROLLER) {
> +            pcie_sriov_pf_disable_vfs(&n->parent_obj);

Shouldn't this be 'if (rst == NVME_RESET_FUNCTION)'?

