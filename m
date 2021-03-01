Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4932774D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 06:58:54 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGba1-0000mj-6b
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 00:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lGbZ4-0008Qs-Jy; Mon, 01 Mar 2021 00:57:54 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lGbZ2-00031H-Hu; Mon, 01 Mar 2021 00:57:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603c82590000>; Sun, 28 Feb 2021 21:57:45 -0800
Received: from [10.40.102.108] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 05:57:31 +0000
Subject: Re: [PATCH v3 1/3] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Shenming Lu <lushenming@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210223022225.50-1-lushenming@huawei.com>
 <20210223022225.50-2-lushenming@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <6e88241a-3d4e-9e8b-ed10-a8f2ba7179b1@nvidia.com>
Date: Mon, 1 Mar 2021 11:27:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210223022225.50-2-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614578265; bh=3QbhSDux7NC7EWfd6bApbwNgJ5uePxGuBz1403G956w=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=jjIN4nXdzhYQKObuLh3VROAYSOJxS907UaOqRWWCXCsVauIKZi/xv03fq3sy8qJp/
 Wu62Fnl4bwXssHHQFRA6zneoVHuoI3mM1tuQL7AgqkOlxpY9xc3lljXNB8wO9dDoQ0
 OtTvKrrf/So8PrqAooxTvkHqGtJCoQY7EYw6PsMmDCiLun/ItuKgL4nJHefi+vefoP
 i4AV/WsoErsBXlI4ZKCUbyUcWqc1LyAs11q2h4cDI4A1j3OkpTfsiUNQPtO9lmjcmF
 BPt9ZS/FM619J33FNXhtBvP5TfT1FT8WgOj+3PepWaCCNJJcjdtPahBZmBRtxKuYH6
 d4i6FfWvtPCVA==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

On 2/23/2021 7:52 AM, Shenming Lu wrote:
> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> setup, if the restoring of the VFIO PCI device config space is
> before the VGIC, an error might occur in the kernel.
> 
> So we move the saving of the config space to the non-iterable
> process, thus it will be called after the VGIC according to
> their priorities.
> 
> As for the possible dependence of the device specific migration
> data on it's config space, we can let the vendor driver to
> include any config info it needs in its own data stream.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>   hw/vfio/migration.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 00daa50ed8..f5bf67f642 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -575,11 +575,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>           return ret;
>       }
>   
> -    ret = vfio_save_device_config_state(f, opaque);
> -    if (ret) {
> -        return ret;
> -    }
> -
>       ret = vfio_update_pending(vbasedev);
>       if (ret) {
>           return ret;
> @@ -620,6 +615,19 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>       return ret;
>   }
>   
> +static void vfio_save_state(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    int ret;
> +
> +    ret = vfio_save_device_config_state(f, opaque);
> +    if (ret) {
> +        error_report("%s: Failed to save device config space",
> +                     vbasedev->name);
> +        qemu_file_set_error(f, ret);
> +    }
> +}
> +
>   static int vfio_load_setup(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -670,11 +678,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>           switch (data) {
>           case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
>           {
> -            ret = vfio_load_device_config_state(f, opaque);
> -            if (ret) {
> -                return ret;
> -            }
> -            break;
> +            return vfio_load_device_config_state(f, opaque);
>           }
>           case VFIO_MIG_FLAG_DEV_SETUP_STATE:
>           {
> @@ -720,6 +724,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
>       .save_live_pending = vfio_save_pending,
>       .save_live_iterate = vfio_save_iterate,
>       .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_state = vfio_save_state,
>       .load_setup = vfio_load_setup,
>       .load_cleanup = vfio_load_cleanup,
>       .load_state = vfio_load_state,
> 

