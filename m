Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C865869D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 21:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAcks-0003iL-29; Wed, 28 Dec 2022 15:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pAcki-0003hx-VD; Wed, 28 Dec 2022 15:10:18 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pAckg-0007H1-GT; Wed, 28 Dec 2022 15:10:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F2D2B8162C;
 Wed, 28 Dec 2022 20:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4498DC433EF;
 Wed, 28 Dec 2022 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672258208;
 bh=dF6GtH05/NZV6POb54aaosrCf6/eOEOW8VJ/czyptkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1PcfxlbQkIAVGEJjZKpUaUgtyIzZsmHJsdqLuQcj3d3OCq3ZW1AUUzpjCceV1u8z
 mSOpqC75pwokjyP3eRdwpxyBRTZVC+DgXBxl0CQ4lEnttbfFLFrstBjALY2o5DjZHl
 NtE0Fvdq9Re6gTjrRU5Wj5vxhkZQWznr32/03q9vavNizPmSQn6RnhvqTtpIZ4lcP5
 7iVVT3kC7Boq4uTg6HiZt8ti2CHltlnJKiUX1Btrfpf9Hiw2w8JOO8ioc8sv61MfVK
 c17IfJWn9p5z8RZoPA0AW9ZQCJ/GP348JSum/81AY9vNl/DtM0L0P6Ch6WSxt5t1rJ
 voQyHfu6P4QPw==
Date: Wed, 28 Dec 2022 13:10:05 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: qemu-devel@nongnu.org, Michael Kropaczek <michael.kropaczek@solidigm.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 1/2] hw/nvme: Support for Namespaces Management from
 guest OS - create-ns
Message-ID: <Y6yineh/g+qaCTkr@kbusch-mbp.dhcp.thefacebook.com>
References: <20221228194141.118-1-jonathan.derrick@linux.dev>
 <20221228194141.118-2-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228194141.118-2-jonathan.derrick@linux.dev>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 28, 2022 at 01:41:40PM -0600, Jonathan Derrick wrote:
> +static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeCtrl *n_p = NULL;     /* primary controller */
> +    NvmeIdCtrl *id = &n->id_ctrl;
> +    NvmeNamespace *ns;
> +    NvmeIdNsMgmt id_ns = {};
> +    uint8_t flags = req->cmd.flags;
> +    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
> +    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
> +    uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
> +    uint8_t sel = dw10 & 0xf;
> +    uint8_t csi = (dw11 >> 24) & 0xf;
> +    uint16_t i;
> +    uint16_t ret;
> +    Error *local_err = NULL;
> +
> +    trace_pci_nvme_ns_mgmt(nvme_cid(req), nsid, sel, csi, NVME_CMD_FLAGS_PSDT(flags));
> +
> +    if (!(le16_to_cpu(id->oacs) & NVME_OACS_NS_MGMT)) {
> +        return NVME_NS_ATTACH_MGMT_NOTSPRD | NVME_DNR;
> +    }
> +
> +    if (n->cntlid && !n->subsys) {
> +        error_setg(&local_err, "Secondary controller without subsystem");
> +        return NVME_NS_ATTACH_MGMT_NOTSPRD | NVME_DNR;

Leaking local_err. Any time you call error_setg(), the error needs to be
reported or freed at some point.

> +    }
> +
> +    n_p = n->subsys->ctrls[0];
> +
> +    switch (sel) {
> +    case NVME_NS_MANAGEMENT_CREATE:
> +        switch (csi) {
> +        case NVME_CSI_NVM:

The following case is sufficiently large enough that the implementation
should be its own function.

> +            if (nsid) {
> +                return NVME_INVALID_FIELD | NVME_DNR;
> +            }
> +
> +            ret = nvme_h2c(n, (uint8_t *)&id_ns, sizeof(id_ns), req);
> +            if (ret) {
> +                return ret;
> +            }
> +
> +            uint64_t nsze = le64_to_cpu(id_ns.nsze);
> +            uint64_t ncap = le64_to_cpu(id_ns.ncap);

Please don't mix declarations with code; declare these local variables
at the top of the scope.

> +
> +            if (ncap > nsze) {
> +                return NVME_INVALID_FIELD | NVME_DNR;
> +            } else if (ncap != nsze) {
> +                return NVME_THIN_PROVISION_NOTSPRD | NVME_DNR;
> +            }
> +
> +            nvme_validate_flbas(id_ns.flbas, &local_err);
> +            if (local_err) {
> +                error_report_err(local_err);
> +                return NVME_INVALID_FORMAT | NVME_DNR;
> +            }
> +
> +            for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
> +                if (nvme_ns(n_p, (uint32_t)i) || nvme_subsys_ns(n_p->subsys, (uint32_t)i)) {
> +                    continue;
> +                }
> +                break;
> +            }
> +
> +
> +            if (i >  le32_to_cpu(n_p->id_ctrl.nn) || i >  NVME_MAX_NAMESPACES) {
> +               return NVME_NS_IDNTIFIER_UNAVAIL | NVME_DNR;
> +            }
> +            nsid = i;
> +
> +            /* create ns here */
> +            ns = nvme_ns_mgmt_create(n, nsid, &id_ns, &local_err);
> +            if (!ns || local_err) {
> +                if (local_err) {
> +                    error_report_err(local_err);
> +                }
> +                return NVME_INVALID_FIELD | NVME_DNR;
> +            }
> +
> +            if (nvme_cfg_update(n, ns->size, NVME_NS_ALLOC_CHK)) {
> +                /* place for delete-ns */
> +                error_setg(&local_err, "Insufficient capacity, an orphaned ns[%"PRIu32"] will be left behind", nsid);
> +                return NVME_NS_INSUFFICIENT_CAPAC | NVME_DNR;

Leaked local_err.

> +            }
> +            (void)nvme_cfg_update(n, ns->size, NVME_NS_ALLOC);
> +            if (nvme_cfg_save(n)) {
> +                (void)nvme_cfg_update(n, ns->size, NVME_NS_DEALLOC);
> +                /* place for delete-ns */
> +                error_setg(&local_err, "Cannot save conf file, an orphaned ns[%"PRIu32"] will be left behind", nsid);
> +                return NVME_INVALID_FIELD | NVME_DNR;

Another leaked local_err.

> +            }
> +            req->cqe.result = cpu_to_le32(nsid);
> +            break;
> +        case NVME_CSI_ZONED:
> +            /* fall through for now */
> +        default:
> +            return NVME_INVALID_FIELD | NVME_DNR;
> +	    }
> +        break;
> +    default:
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    return NVME_SUCCESS;
> +}

