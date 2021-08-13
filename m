Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D93EBA57
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 18:47:22 +0200 (CEST)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEaL3-0001AP-Nw
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 12:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mEaJi-0008Vd-3X; Fri, 13 Aug 2021 12:45:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:43168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mEaJf-0005ZI-Kt; Fri, 13 Aug 2021 12:45:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7CA5610A4;
 Fri, 13 Aug 2021 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628873152;
 bh=z8zsNkYA2AJX76w4oA0E7Lb62DHf0hifmBag+OVPBlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KhSWxIQAdSsoP3W2SWxihajKkoUO1Ag4eupbbze/aaMo2TY0cMkujpVlfCx5GLRkt
 MbOsWtnARMXkdS3fLnN4q4e2H/zBtnlTXe9Bram9haFGhK9ii4INshwLgLmGfj47wg
 zAS3E61pXz39Gz15TWr98JWZl1SnxN4VywFmi2T655pC77wpYPqRGG34WafXbLiU4y
 ZsUkx/DsOXrcg6+oGTzFQO+F3Krt1a037AXEt7Pd8s8FFE3xL0viC2au1NfobgH9qL
 abxvjXs5IPVpLLd4R8gnySjmhZM7idrRrVk0AJxRXFLsOV5oLOWxvmE7KNRHWPV+7N
 3weUZKMyvdrlg==
Date: Fri, 13 Aug 2021 09:45:47 -0700
From: Keith Busch <kbusch@kernel.org>
To: Naveen <naveen.n1@samsung.com>
Subject: Re: [RFC PATCH v1] Adding Support for namespace management
Message-ID: <20210813164547.GB3138953@dhcp-10-100-145-180.wdc.com>
References: <CGME20210813101459epcas5p19cf9edbb414726886b9d3a5a140fc706@epcas5p1.samsung.com>
 <1628847142-24943-1-git-send-email-naveen.n1@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628847142-24943-1-git-send-email-naveen.n1@samsung.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 anaidu.gollu@samsung.com, d.palani@samsung.com, qemu-devel@nongnu.org,
 linux-nvme@lists.infradead.org, mreitz@redhat.com, stefanha@redhat.com,
 p.kalghatgi@samsung.com, its@irrelevant.dk, prakash.v@samsung.com,
 raphel.david@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 13, 2021 at 03:02:22PM +0530, Naveen wrote:
> +static uint16_t nvme_identify_ns_common(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeIdNs id_ns = {};
> +
> +    id_ns.nsfeat |= (0x4 | 0x10);
> +    id_ns.dpc = 0x1f;
> +
> +    NvmeLBAF lbaf[16] = {
> +        [0] = {.ds = 9},
> +        [1] = {.ds = 9, .ms = 8},
> +        [2] = {.ds = 9, .ms = 16},
> +        [3] = {.ds = 9, .ms = 64},
> +        [4] = {.ds = 12},
> +        [5] = {.ds = 12, .ms = 8},
> +        [6] = {.ds = 12, .ms = 16},
> +        [7] = {.ds = 12, .ms = 64},
> +    };

Since the lbaf is a copy of what's defined in nvme_ns_init, so should be
defined for reuse.

> +
> +    memcpy(&id_ns.lbaf, &lbaf, sizeof(lbaf));
> +    id_ns.nlbaf = 7;

The identify structure should be what's in common with all namespaces,
and this doesn't look complete. Just off the top of my head, missing
fields include MC and DLFEAT.

> +
> +    return nvme_c2h(n, (uint8_t *)&id_ns, sizeof(NvmeIdNs), req);
> +}
> +
>  static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
>  {
>      NvmeNamespace *ns;
> @@ -4453,8 +4478,10 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
>  
>      trace_pci_nvme_identify_ns(nsid);
>  
> -    if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
> +    if (!nvme_nsid_valid(n, nsid)) {
>          return NVME_INVALID_NSID | NVME_DNR;
> +    } else if (nsid == NVME_NSID_BROADCAST) {
> +        return nvme_identify_ns_common(n, req);
>      }
>  
>      ns = nvme_ns(n, nsid);
> @@ -5184,6 +5211,195 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
>      }
>  }
>  
> +static int nvme_blk_truncate(BlockBackend *blk, size_t len, Error **errp)
> +{
> +    int ret;
> +    uint64_t perm, shared_perm;
> +
> +    blk_get_perm(blk, &perm, &shared_perm);
> +
> +    ret = blk_set_perm(blk, perm | BLK_PERM_RESIZE, shared_perm, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    ret = blk_truncate(blk, len, false, PREALLOC_MODE_OFF, 0, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    ret = blk_set_perm(blk, perm, shared_perm, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +static uint32_t nvme_allocate_nsid(NvmeCtrl *n)
> +{
> +    uint32_t nsid = 0;
> +    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
> +        if (nvme_ns(n, i) || nvme_subsys_ns(n->subsys, i)) {
> +            continue;
> +        }
> +
> +        nsid = i;
> +        return nsid;
> +    }
> +    return nsid;
> +}
> +
> +static uint16_t nvme_namespace_create(NvmeCtrl *n, NvmeRequest *req)
> +{
> +   uint32_t ret;
> +   NvmeIdNs id_ns_host;
> +   NvmeSubsystem *subsys = n->subsys;
> +   Error *err = NULL;
> +   uint8_t flbas_host;
> +   uint64_t ns_size;
> +   int lba_index;
> +   NvmeNamespace *ns;
> +   NvmeCtrl *ctrl;
> +   NvmeIdNs *id_ns;
> +
> +    ret = nvme_h2c(n, (uint8_t *)&id_ns_host, sizeof(id_ns_host), req);
> +    if (ret) {
> +        return ret;
> +    }

Some unusual indentation here.

> +
> +    if (id_ns_host.ncap < id_ns_host.nsze) {
> +        return NVME_THIN_PROVISION_NO_SUPP | NVME_DNR;
> +    } else if (id_ns_host.ncap > id_ns_host.nsze) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    if (!id_ns_host.nsze) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    if (QSLIST_EMPTY(&subsys->unallocated_namespaces)) {
> +        return NVME_NS_ID_UNAVAILABLE;
> +    }
> +
> +    ns = QSLIST_FIRST(&subsys->unallocated_namespaces);
> +    id_ns = &ns->id_ns;
> +    flbas_host = (id_ns_host.flbas) & (0xF);
> +
> +    if (flbas_host > id_ns->nlbaf) {
> +        return NVME_INVALID_FORMAT | NVME_DNR;
> +    }
> +
> +    ret = nvme_ns_setup(ns, &err);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    id_ns->flbas = id_ns_host.flbas;
> +    id_ns->dps = id_ns_host.dps;
> +    id_ns->nmic = id_ns_host.nmic;
> +
> +    lba_index = NVME_ID_NS_FLBAS_INDEX(id_ns->flbas);
> +    ns_size = id_ns_host.nsze * ((1 << id_ns->lbaf[lba_index].ds) +
> +                (id_ns->lbaf[lba_index].ms));
> +    id_ns->nvmcap = ns_size;
> +
> +    if (ns_size > n->id_ctrl.unvmcap) {
> +        return NVME_NS_INSUFF_CAP;
> +    }
> +
> +    ret = nvme_blk_truncate(ns->blkconf.blk, id_ns->nvmcap, &err);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ns->size = blk_getlength(ns->blkconf.blk);
> +    nvme_ns_init_format(ns);
> +
> +    ns->params.nsid = nvme_allocate_nsid(n);
> +    if (!ns->params.nsid) {
> +        return NVME_NS_ID_UNAVAILABLE;
> +    }
> +    subsys->namespaces[ns->params.nsid] = ns;
> +
> +    for (int cntlid = 0; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
> +        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
> +        if (ctrl) {
> +            ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
> +        }
> +    }
> +
> +    stl_le_p(&req->cqe.result, ns->params.nsid);
> +    QSLIST_REMOVE_HEAD(&subsys->unallocated_namespaces, entry);
> +    return NVME_SUCCESS;
> +}
> +
> +static void nvme_namespace_delete(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
> +{
> +    NvmeCtrl *ctrl;
> +    NvmeSubsystem *subsys = n->subsys;
> +
> +    subsys->namespaces[nsid] = NULL;
> +    QSLIST_INSERT_HEAD(&subsys->unallocated_namespaces, ns, entry);
> +
> +    for (int cntlid = 0; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
> +        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
> +        if (ctrl) {
> +            ctrl->id_ctrl.unvmcap += le64_to_cpu(ns->size);
> +            if (nvme_ns(ctrl, nsid)) {
> +                nvme_detach_ns(ctrl, ns, nsid);
> +            }
> +            nvme_ns_attr_changed_aer(ctrl, nsid);
> +        }
> +    }
> +}
> +
> +static uint16_t nvme_ns_management(NvmeCtrl *n, NvmeRequest *req)
> +{
> +   uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
> +   uint8_t sel = dw10 & 0x7;
> +   uint32_t nsid = le32_to_cpu(req->cmd.nsid);
> +   NvmeNamespace *ns;

There's no check for CDW11's CSI field. Since we support NVM and ZNS
command sets, you have check this.

