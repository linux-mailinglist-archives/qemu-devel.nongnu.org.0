Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DD2DA5B1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 02:41:05 +0100 (CET)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kozKq-0006Z0-89
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 20:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1kozJ6-0005qz-LX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:39:16 -0500
Received: from mga03.intel.com ([134.134.136.65]:27915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1kozJ3-0003zN-Rc
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:39:15 -0500
IronPort-SDR: Zs0C8IGpIy09e+MmFIhVXibuXysRsGiDHNUPGw4ITl5JeWIKbox0q0gWZgmW3xZM62qt8zmG/i
 CtZCwPVkTwOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174920669"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="174920669"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 17:39:05 -0800
IronPort-SDR: xgR/qEL0c6D29CX9nUFPs0VioUUL8C7mVrLlYFidKq4I4V6sSH8wl9jnH2wT3YuUZuvha6OLQC
 kYYYpZWZprVg==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="335752305"
Received: from unknown (HELO [10.239.13.2]) ([10.239.13.2])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 14 Dec 2020 17:39:03 -0800
Message-ID: <5FD8157B.7030202@intel.com>
Date: Tue, 15 Dec 2020 09:46:35 +0800
From: Wei Wang <wei.w.wang@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Quentin Grolleau <quentin.grolleau@ovhcloud.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, samuel.ortiz@intel.com
Subject: Re: [raw] Guest stuck during live live-migration
References: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>
In-Reply-To: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=wei.w.wang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/2020 05:36 PM, Quentin Grolleau wrote:
> Hello,
>
> In our company, we are hosting a large number of Vm, hosted behind 
> Openstack (so libvirt/qemu).
> A large majority of our Vms are runnign with local data only, stored 
> on NVME, and most of them are RAW disks.
>
> With Qemu 4.0(can be even with older version)we see strange 
> live-migrationcomportement:
>     - some Vms live migrate at very high speed without issue (> 6 Gbps)
>     - some Vms are running correctly, but migrating at a strange low 
> speed (3Gbps)
>     - some Vms are migrating at a very low speed (1Gbps, sometime 
> less) and during the migration the guest is completely I/O stuck
> When this issue happen the VM is completly block, iostat in the Vm 
> show us a latency of 30 secs
>
> First we thought it was related to an hardware issuewe check it, we 
> comparing different hardware, but no issue where found there
>
> So one of my colleague had the idea to limit with "tc" the bandwidth 
> on the interface the migration was done, and it worked the VM didn't 
> lose any ping nor being  I/O stuck
> Important point : Once the Vm have been migrate (with the limitation ) 
> one time, if we migrate it again right after, the migration will be 
> done at full speed (8-9Gb/s) without freezing the Vm
>
> It only happen on existing VM, we tried to replicate with a fresh 
> instance with exactly the same spec and nothing was happening
>
> We tried to replicate the workload inside the VM but there was no way 
> to replicate the case. So it was not related to the workload nor to 
> the server that hosts the Vm
>
> So we thought about the disk of the instance : the raw file.
>
> We also tried to strace -c the process during the live-migration and 
> it was doing a lot of "lseek"
>
> and we found this :
> https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html
>
>
> So i rebuilt Qemu with this patch and the live-migration went well, at 
> high speedand with no VM freeze
> ( https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601)
>
> Do you have a way to avoid the "lseek" mechanism as it consumes more 
> resources to find the holes in the disk and don't let any for the VM ?
>
>
> Server hosting the VM :
> - Bi-Xeon hosts With NVME storage and 10 Go Network card
> - Qemu 4.0 And Libvirt 5.4
> - Kernel 4.18.0.25
>
> Guest having the issue :
> - raw image with Debian 8
>
> Here the qemu img on the disk :
> > qemu-img info disk
> image: disk
> file format: raw
> virtual size: 400G (429496729600 bytes)
> disk size: 400G
>

Could you share the migration options that you use and "info migrate" 
for both stuck and non-stuck cases?

Best,
Wei



