Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681993266A8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:03:49 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFhSu-0007Wq-6J
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lFhP2-0005ay-24; Fri, 26 Feb 2021 12:59:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:34524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lFhP0-0003j9-1T; Fri, 26 Feb 2021 12:59:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D5F464F17;
 Fri, 26 Feb 2021 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614362382;
 bh=fRIwT1P9mmFxFBfaL3x9LD8R+AkENyzNvUu9hV/Fd70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsCIGtgheMVaxUz3Ugtb+IARfI5so7IuFMO+FGK8hK5xgnZEl+sYOzprBYNxEzWoO
 SStgw5tt8wV+rwZC8vmeXfiP15vDABjE+hF64/Dv/Gd9riSAbXjkP26UhNdW4TbYvO
 zfIccSuKpXeE5kKmTlFiyVgzekNhFuGANZxv6WYVhkHjNBoQ84HJ91UqbS8QppKOHw
 7PQMhQQZuGcU5FOXnrGTF2gtPcYyg7jjEMMcyKw0S27h+XS4q60ufLdw35HqWcGrqV
 TZJtLxXtYo6lCzmoVeD88+2RXRxUi/gIFeIztDtl2q/9oCApMce+Xke9pKutKyHjqz
 jc0/ddxUHDyjw==
Date: Sat, 27 Feb 2021 02:59:35 +0900
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V2 6/7] hw/block/nvme: support namespace attachment command
Message-ID: <20210226175935.GB3949@redsun51.ssa.fujisawa.hgst.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
 <20210210160937.1100-7-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210160937.1100-7-minwoo.im.dev@gmail.com>
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 01:09:36AM +0900, Minwoo Im wrote:
> @@ -183,6 +183,7 @@ static const uint32_t nvme_cse_acs[256] = {
>      [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
> +    [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP,

Missing NVME_CMD_EFF_NIC for the attachment command.

>  };
>  
>  static const uint32_t nvme_cse_iocs_none[256];
> @@ -3766,6 +3767,62 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
>      return NVME_NO_COMPLETE;
>  }
>  
> +static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
> +static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeNamespace *ns;
> +    NvmeCtrl *ctrl;
> +    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
> +    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
> +    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
> +    bool attach = !(dw10 & 0xf);
> +    uint16_t *nr_ids = &list[0];
> +    uint16_t *ids = &list[1];
> +    uint16_t ret;
> +    int i;
> +
> +    trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
> +
> +    ns = nvme_subsys_ns(n->subsys, nsid);
> +    if (!ns) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    ret = nvme_dma(n, (uint8_t *)list, 4096,
> +                   DMA_DIRECTION_TO_DEVICE, req);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    if (!*nr_ids) {
> +        return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
> +    }
> +
> +    for (i = 0; i < *nr_ids; i++) {
> +        ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
> +        if (!ctrl) {
> +            return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
> +        }
> +
> +        if (attach) {
> +            if (nvme_ns_is_attached(ctrl, ns)) {
> +                return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
> +            }
> +
> +            nvme_ns_attach(ctrl, ns);
> +            __nvme_select_ns_iocs(ctrl, ns);
> +        } else {
> +            if (!nvme_ns_is_attached(ctrl, ns)) {
> +                return NVME_NS_NOT_ATTACHED | NVME_DNR;
> +            }
> +
> +            nvme_ns_detach(ctrl, ns);
> +        }
> +    }
> +
> +    return NVME_SUCCESS;
> +}

Every controller that has newly attached the namespace needs to emit the
Namespace Notify AER in order for the host to react correctly to the
command.

