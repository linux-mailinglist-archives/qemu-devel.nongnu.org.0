Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B733B33AA9E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:58:00 +0100 (CET)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfIl-0000eD-NA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lLfHG-0007nh-5R; Mon, 15 Mar 2021 00:56:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lLfHA-0004hg-N1; Mon, 15 Mar 2021 00:56:25 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DzPGN1vsjz17JpZ;
 Mon, 15 Mar 2021 12:54:20 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 12:56:09 +0800
Subject: Re: [PATCH V3 1/8] hw/block/nvme: support namespace detach
To: Minwoo Im <minwoo.im.dev@gmail.com>, <qemu-devel@nongnu.org>,
 <qemu-block@nongnu.org>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
 <20210228161100.54015-2-minwoo.im.dev@gmail.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <7001d348-91f7-1728-024d-55a2f5d92628@huawei.com>
Date: Mon, 15 Mar 2021 12:56:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210228161100.54015-2-minwoo.im.dev@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Max
 Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I don't dig into code logic, just some nit below.

On 2021/3/1 0:10, Minwoo Im wrote:
> Given that now we have nvme-subsys device supported, we can manage
> namespace allocated, but not attached: detached.  This patch introduced
s/introduced/introduces

> a parameter for nvme-ns device named 'detached'.  This parameter
> indicates whether the given namespace device is detached from
> a entire NVMe subsystem('subsys' given case, shared namespace) or a
> controller('bus' given case, private namespace).
> 
> - Allocated namespace
> 
>   1) Shared ns in the subsystem 'subsys0':
> 
>      -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,subsys=subsys0,detached=true
> 
>   2) Private ns for the controller 'nvme0' of the subsystem 'subsys0':
> 
>      -device nvme-subsys,id=subsys0
>      -device nvme,serial=foo,id=nvme0,subsys=subsys0
>      -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,bus=nvme0,detached=true
> 
>   3) (Invalid case) Controller 'nvme0' has no subsystem to manage ns:
> 
>      -device nvme,serial=foo,id=nvme0
>      -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,bus=nvme0,detached=true
> 
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> Tested-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme-ns.c     |  1 +
>  hw/block/nvme-ns.h     |  1 +
>  hw/block/nvme-subsys.h |  1 +
>  hw/block/nvme.c        | 41 +++++++++++++++++++++++++++++++++++++++--
>  hw/block/nvme.h        | 22 ++++++++++++++++++++++
>  5 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 0e8760020483..eda6a0c003a4 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -399,6 +399,7 @@ static Property nvme_ns_props[] = {
>      DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
>      DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
>                       NvmeSubsystem *),
> +    DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
>      DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
>      DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
>      DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 7af6884862b5..b0c00e115d81 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -26,6 +26,7 @@ typedef struct NvmeZone {
>  } NvmeZone;
>  
>  typedef struct NvmeNamespaceParams {
> +    bool     detached;
>      uint32_t nsid;
>      QemuUUID uuid;
>  
> diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
> index ccf6a71398d3..890d118117dc 100644
> --- a/hw/block/nvme-subsys.h
> +++ b/hw/block/nvme-subsys.h
> @@ -23,6 +23,7 @@ typedef struct NvmeSubsystem {
>      uint8_t     subnqn[256];
>  
>      NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
> +    /* Allocated namespaces for this subsystem */
>      NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
>  } NvmeSubsystem;
>  
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index edd0b85c10ce..f6aeae081840 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -23,7 +23,7 @@
>   *              max_ioqpairs=<N[optional]>, \
>   *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
>   *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
> - *              subsys=<subsys_id> \
> + *              subsys=<subsys_id>,detached=<true|false[optional]>
>   *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
>   *              zoned=<true|false[optional]>, \
>   *              subsys=<subsys_id>
> @@ -82,6 +82,13 @@
>   *   controllers in the subsystem. Otherwise, `bus` must be given to attach
>   *   this namespace to a specified single controller as a non-shared namespace.
>   *
> + * - `detached`
> + *   Not to attach the namespace device to controllers in the NVMe subsystem
> + *   during boot-up. If not given, namespaces are all attahced to all
s/attahced/attached

> + *   controllers in the subsystem by default.
> + *   It's mutual exclusive with 'bus' parameter. It's only valid in case
> + *   `subsys` is provided.
> + *
>   * Setting `zoned` to true selects Zoned Command Set at the namespace.
>   * In this case, the following namespace properties are available to configure
>   * zoned operation:
> @@ -4613,6 +4620,20 @@ static void nvme_init_state(NvmeCtrl *n)
>      n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
>  }
>  
> +static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
> +{
> +    if (nvme_ns_is_attached(n, ns)) {
> +        error_setg(errp,
> +                   "namespace %d is already attached to controller %d",
> +                   nvme_nsid(ns), n->cntlid);
> +        return -1;
> +    }
> +
> +    nvme_ns_attach(n, ns);
> +
> +    return 0;
> +}
> +
>  int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>  {
>      uint32_t nsid = nvme_nsid(ns);
> @@ -4644,7 +4665,23 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>  
>      trace_pci_nvme_register_namespace(nsid);
>  
> -    n->namespaces[nsid - 1] = ns;
> +    /*
> +     * If subsys is not given, namespae is always attached to the controller
s/namespae/namespace

> +     * because there's no subsystem to manage namespace allocation.
> +     */
> +    if (!n->subsys) {
> +        if (ns->params.detached) {
> +            error_setg(errp,
> +                       "detached needs nvme-subsys specified nvme or nvme-ns");
> +            return -1;
> +        }
> +
> +        return nvme_attach_namespace(n, ns, errp);
> +    } else {
> +        if (!ns->params.detached) {
> +            return nvme_attach_namespace(n, ns, errp);
> +        }
> +    }
>  
>      return 0;
>  }
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index f45ace0cff5b..51b8739b4d1e 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -174,6 +174,10 @@ typedef struct NvmeCtrl {
>      NvmeSubsystem   *subsys;
>  
>      NvmeNamespace   namespace;
> +    /*
> +     * Attached namespaces to this controller.  If subsys is not given, all
> +     * namespaces in this list will always be attached.
> +     */
>      NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
>      NvmeSQueue      **sq;
>      NvmeCQueue      **cq;
> @@ -192,6 +196,24 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
>      return n->namespaces[nsid - 1];
>  }
>  
> +static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
> +{
> +    int nsid;
> +
> +    for (nsid = 1; nsid <= n->num_namespaces; nsid++) {
> +        if (nvme_ns(n, nsid) == ns) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
> +{
> +    n->namespaces[nvme_nsid(ns) - 1] = ns;
> +}
> +
>  static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
>  {
>      NvmeSQueue *sq = req->sq;
> 

