Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2B699D06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:33:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSk05-0006ax-S5; Thu, 16 Feb 2023 14:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pSk00-0006aO-SY; Thu, 16 Feb 2023 14:32:57 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pSjzz-0003Dg-39; Thu, 16 Feb 2023 14:32:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47E43B82953;
 Thu, 16 Feb 2023 19:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078FFC433D2;
 Thu, 16 Feb 2023 19:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676575970;
 bh=2paq86sFcqBBLX+JAcHH19JByZ3jpCuesIPgLRIrS+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I37SfqYpIssjwVrWZYGJM80oBJK/QLmf35Z/6LOm5q4ZIq1Yd7fyT6GkqjKNLRV6n
 VmpzN0RtvyC7K14fQL/ewRaH9P4fsgIc1FsUPXiCNZvMXpJnoKYNEkZ1soeo+QajPx
 VBndpDTnhmM2g7RSe1/gLz/C7GmZbR1drIn4pYNRDi2OL0EDQK3O+Mqg/zLKYm745n
 cwIgTPtI5orjpd2fyTzuOyQ+HQvawyo1mBXcLkKVcNy4B0lesPP9NEmH1hcWSMB16X
 7pRwaTpJf/J+DumM/lcbuc0kBBM07p6T14lcYzBLW77hhOl57lSBeIBlIgVDLq/H9o
 n+dNYW5GGjNNg==
Date: Thu, 16 Feb 2023 12:32:47 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jesper Devantier <jwd@defmacro.it>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jesper Devantier <j.devantier@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 5/5] hw/nvme: flexible data placement emulation
Message-ID: <Y+6E3/QzR6g5PlrB@kbusch-mbp.dhcp.thefacebook.com>
References: <20230216164806.233533-1-jwd@defmacro.it>
 <20230216164806.233533-6-jwd@defmacro.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216164806.233533-6-jwd@defmacro.it>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
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

On Thu, Feb 16, 2023 at 05:48:06PM +0100, Jesper Devantier wrote:
> +static bool nvme_ns_init_fdp(NvmeNamespace *ns, Error **errp)
> +{
> +    NvmeEnduranceGroup *endgrp = ns->endgrp;
> +    NvmeRuHandle *ruh;
> +    uint8_t lbafi = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
> +    unsigned int *ruhid, *ruhids;
> +    char *r, *p, *token;
> +    uint16_t *ph;
> +
> +    if (!ns->params.fdp.ruhs) {
> +        ns->fdp.nphs = 1;
> +        ph = ns->fdp.phs = g_new(uint16_t, 1);
> +
> +        ruh = nvme_find_ruh_by_attr(endgrp, NVME_RUHA_CTRL, ph);
> +        if (!ruh) {
> +            ruh = nvme_find_ruh_by_attr(endgrp, NVME_RUHA_UNUSED, ph);
> +            if (!ruh) {
> +                error_setg(errp, "no unused reclaim unit handles left");
> +                return false;
> +            }
> +
> +            ruh->ruha = NVME_RUHA_CTRL;
> +            ruh->lbafi = lbafi;
> +            ruh->ruamw = endgrp->fdp.runs >> ns->lbaf.ds;
> +
> +            for (uint16_t rg = 0; rg < endgrp->fdp.nrg; rg++) {
> +                ruh->rus[rg].ruamw = ruh->ruamw;
> +            }
> +        } else if (ruh->lbafi != lbafi) {
> +            error_setg(errp, "lba format index of controller assigned "
> +                       "reclaim unit handle does not match namespace lba "
> +                       "format index");
> +            return false;
> +        }
> +
> +        return true;
> +    }
> +
> +    ruhid = ruhids = g_new0(unsigned int, endgrp->fdp.nruh);
> +    r = p = strdup(ns->params.fdp.ruhs);
> +
> +    /* parse the reclaim unit handle identifiers */
> +    while ((token = qemu_strsep(&p, ";")) != NULL) {
> +        if (++ns->fdp.nphs == endgrp->fdp.nruh) {

Since a namespace can't have more than 128 placement handles, and the endurance
group can have more, I think the 128 limit needs to be checked here.

> +            error_setg(errp, "too many placement handles");
> +            free(r);
> +            return false;
> +        }
> +
> +        if (qemu_strtoui(token, NULL, 0, ruhid++) < 0) {
> +            error_setg(errp, "cannot parse reclaim unit handle identifier");
> +            free(r);
> +            return false;
> +        }
> +    }

