Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2669B23E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5Fj-0007W4-Ne; Fri, 17 Feb 2023 13:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pT5Fh-0007PI-4I; Fri, 17 Feb 2023 13:14:33 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pT5Ff-0002xJ-Bd; Fri, 17 Feb 2023 13:14:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4435061EBC;
 Fri, 17 Feb 2023 18:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ED0C433D2;
 Fri, 17 Feb 2023 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676657660;
 bh=RYGk4IBup8TVaRUvbcuDg0zVP81zbrgdV7xaHKQ3iuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O+0jDYeHlLnSHHp8Ly/a/ZKeSt7JhJdF5I9+sF3F661qCXBF5AC/YW3QblEcDLusD
 CsIiOUvtCsuCDheO0nbqzwZF9Jrzj3y8Gp4uIaGOhGXH1N+9qaGiSh8CobWFg5pIS9
 eteo/DRwi97ZJYkaR6QmmG3669OsFItAqb/g9EbFvJQUN+3ymvpOncu4xPGMROFsna
 rYSjK1WjZhtj9ITrH72S1YFwPALHRXGh0PFBQoO7nIxvmtfpnhSXI+pbb5tvzNvZXP
 kMgh/Mjhc7jM5b4AZeIqlJz0/Bk0lOJrUlaF2melnh4Rp4Y4EIXPpiXrUW8oTgMobj
 AEtdtJwIcpFhg==
Date: Fri, 17 Feb 2023 11:14:17 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jesper Devantier <jwd@defmacro.it>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jesper Devantier <j.devantier@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 5/5] hw/nvme: flexible data placement emulation
Message-ID: <Y+/D+WkGXh+CM40y@kbusch-mbp>
References: <20230217120743.308632-1-jwd@defmacro.it>
 <20230217120743.308632-6-jwd@defmacro.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217120743.308632-6-jwd@defmacro.it>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 01:07:43PM +0100, Jesper Devantier wrote:
> +static void nvme_do_write_fdp(NvmeCtrl *n, NvmeRequest *req, uint64_t slba,
> +                              uint32_t nlb)
> +{
> +    NvmeNamespace *ns = req->ns;
> +    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
> +    uint64_t data_size = nvme_l2b(ns, nlb);
> +    uint32_t dw12 = le32_to_cpu(req->cmd.cdw12);
> +    uint8_t dtype = (dw12 >> 20) & 0xf;
> +    uint16_t pid = le16_to_cpu(rw->dspec);
> +    uint16_t ph, rg, ruhid;
> +    NvmeReclaimUnit *ru;
> +
> +    if (dtype != NVME_DIRECTIVE_DATA_PLACEMENT
> +        || !nvme_parse_pid(ns, pid, &ph, &rg)) {

Style nit, the "||" ought to go in the previous line.

> +        ph = 0;
> +        rg = 0;
> +    }
> +
> +    ruhid = ns->fdp.phs[ph];
> +    ru = &ns->endgrp->fdp.ruhs[ruhid].rus[rg];
> +
> +    nvme_fdp_stat_inc(&ns->endgrp->fdp.hbmw, data_size);
> +    nvme_fdp_stat_inc(&ns->endgrp->fdp.mbmw, data_size);
> +
> +    //trace_pci_nvme_fdp_ruh_write(ruh->rgid, ruh->ruhid, ruh->nlb_ruamw, nlb);
> +
> +    while (nlb) {
> +        if (nlb < ru->ruamw) {
> +            ru->ruamw -= nlb;
> +            break;
> +        }
> +
> +        nlb -= ru->ruamw;
> +        //trace_pci_nvme_fdp_ruh_change(ruh->rgid, ruh->ruhid);

Please use the trace points if you find them useful, otherwise just delete
them instead of committing commented out code.

Beyond that, looks good! For the series:

Reviewed-by: Keith Busch <kbusch@kernel.org>

