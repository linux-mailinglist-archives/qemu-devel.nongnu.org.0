Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A12D3609
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:19:00 +0100 (CET)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlJy-0001cH-Pz
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kmlEl-0007W1-Sk; Tue, 08 Dec 2020 17:13:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:53968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kmlEh-0006HI-M6; Tue, 08 Dec 2020 17:13:35 -0500
Date: Wed, 9 Dec 2020 07:13:27 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607465609;
 bh=ZMzTn1vrpeGTc0Wwki4I0oe6BP0vhc0k/tHzrdRR5kI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=AM9mxFe6Hwz31Tfz8wROZvoAyDsHHtzY5B9OvBQJB3DtxgXo2oolUmGdo1BCKypeN
 MaRd0QVDm2DG4uhQiC6BQXVd7Q/Suu02wlwOF4vK1OpBUhfuHASKMXik2KJPuDoY3n
 G4xVNtI8d5UwpJyzIuYdhl6Y0VyVdLexRYkJnfzadokP11qSgziaXWUROVkWqVSv/x
 n5orV1N0LcXNorqMDWHCaMuvi3OBfeh0MwN00Rrmo7dbFISs3fk+M8xFPkGeg+ZEmn
 cWR90UsFKZdbSKoL2W7RAWnKUz4qWzqnulMFMNz+AaM9VDdZ5ZfiJZIoBniNNWoLoq
 /19GY/VAm6asQ==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 2/2] hw/block/nvme: add simple copy command
Message-ID: <20201208221327.GH27155@redsun51.ssa.fujisawa.hgst.com>
References: <20201208083339.29792-1-its@irrelevant.dk>
 <20201208083339.29792-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208083339.29792-3-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 09:33:39AM +0100, Klaus Jensen wrote:
> +static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
> +{

<snip>

> +    for (i = 0; i < nr; i++) {
> +        uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
> +        if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
> +            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
> +        }
> +
> +        nlb += _nlb;
> +    }
> +
> +    if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
> +        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
> +    }
> +
> +    bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
> +
> +    for (i = 0; i < nr; i++) {
> +        uint64_t slba = le64_to_cpu(range[i].slba);
> +        uint32_t nlb = le16_to_cpu(range[i].nlb) + 1;
> +
> +        status = nvme_check_bounds(ns, slba, nlb);
> +        if (status) {
> +            trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
> +            goto free_bounce;
> +        }
> +
> +        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
> +            status = nvme_check_dulbe(ns, slba, nlb);
> +            if (status) {
> +                goto free_bounce;
> +            }
> +        }
> +    }

Only comment I have is that these two for-loops look like they can be
collaped into one, which also simplifies how you account for the bounce
buffer when error'ing out. 

