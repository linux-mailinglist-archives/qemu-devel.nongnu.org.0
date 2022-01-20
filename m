Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE449554A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:13:38 +0100 (CET)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdoP-0006z6-6Q
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:13:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nAZ4r-0003NW-RJ; Thu, 20 Jan 2022 10:10:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:57240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nAZ4q-0007dD-2q; Thu, 20 Jan 2022 10:10:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2881B81D7F;
 Thu, 20 Jan 2022 15:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE31C340E0;
 Thu, 20 Jan 2022 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642691410;
 bh=d2IFSoEBO2lAnDV+jUOEWP/go8Yup/H23WBqYV2nDJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ux3kcdrh1DlTgA2vRkA4yW1tsaGsPaL/np3OB6N49RuZIESMXFdtZ3QUe+8O7K8hC
 s+dOc8mjBqpIy5dZQPPT5FDjBVx//K3pX09xZgp3G7BKD3/fMsEty5HkaYlNyv7g54
 71LJQ+Lhsa/BX81RlnLBLXhKWXTb2Bwk3rp45l9JpltzXbvqkYx4kZwSCL4KX0mLs/
 3c/1AIaig3sC3Re+ebhJek3qFXV7faWUAvjs4yCBPcBCq7QpDITJpCFPmnTzN39KK8
 lmgrVGN5CZ9KlFxOUKW600GHt99gHEvsyfMVPFh2uUXDC/345WTssymKkZ9qzziUwD
 DgSD5jWEVofHQ==
Date: Thu, 20 Jan 2022 07:10:08 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: fix CVE-2021-3929
Message-ID: <20220120151008.GA383746@dhcp-10-100-145-180.wdc.com>
References: <20220120080155.227246-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120080155.227246-1-its@irrelevant.dk>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 09:01:55AM +0100, Klaus Jensen wrote:
> +static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
> +{
> +    hwaddr hi, lo;
> +
> +    lo = n->bar0.addr;
> +    hi = lo + int128_get64(n->bar0.size);
> +
> +    return addr >= lo && addr < hi;

Looks fine considering this implementation always puts CMB in an
exclusive BAR. From a spec consideration though, you can put a CMB at a
BAR0 offset. I don't think that's going to happen anytime soon here, but
may be worth a comment to notify this function needs to be updated if
that assumption ever changes.

Reviewed-by: Keith Busch <kbusch@kernel.org>

