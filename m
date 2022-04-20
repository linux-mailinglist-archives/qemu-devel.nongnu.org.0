Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE315086B8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:11:52 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8FT-0003LG-In
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nh83s-0005mT-NK; Wed, 20 Apr 2022 06:59:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:54870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nh83q-0002Gi-Sh; Wed, 20 Apr 2022 06:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650452390; x=1681988390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q4+comFCTuAVp24Q5pDdfQAuKOWlK6x5PTpUEBTyOK0=;
 b=ZzhxlVwDcpiJj9RZ+MW3530ydXhejhlA5C4C99u4IjWTO6jZ2s3XxnoQ
 4VMlmL/Zl1CoUCu585NKOuO26vjEAMwvJDSy4J+V5DQ2v8Zz2gnepkMGH
 4O9swv4StMsdz9LYSun3LMJkudAsJkQjjwBqa8Wp+cFhrhQEDuhlm0XrU
 tQijyDEKQ0F0HpGq79jEb5YU2jvUwh18JOpw5korxJALb391fcPWpyhgv
 AkCwIQ9IRN9CZBdLEDvZ1arqsv9pKvRaMBEhLrotCLywV5ZN5Z+YYu2+4
 caJpzTHJX1Ft/3Z3B4f/fK8VVMl7oNfaBoGVVOw0MyiZZU9QD7QUbaz6x g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="261602129"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="261602129"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 03:59:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="555147500"
Received: from rshamets-mobl.ger.corp.intel.com ([10.213.19.118])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 03:59:40 -0700
Date: Wed, 20 Apr 2022 12:59:27 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Message-ID: <Yl/niJ2h09naw1ss@rshamets-mobl.ger.corp.intel.com>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
 <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
 <20220331143841.55ae9372@redhat.com>
 <20220404094138.GA15894@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220404094138.GA15894@lgieryk-VirtualBox>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, k.jensen@samsung.com,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org, its@irrelevant.dk,
 hreitz@redhat.com, xypron.glpk@gmx.de, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 04, 2022 at 11:41:46AM +0200, Łukasz Gieryk wrote:
> On Thu, Mar 31, 2022 at 02:38:41PM +0200, Igor Mammedov wrote:
> > it's unclear what's bing hotpluged and unplugged, it would be better if
> > you included QEMU CLI and relevan qmp/monito commands to reproduce it.
> 
> Qemu CLI:
> ---------
> -device pcie-root-port,slot=0,id=rp0
> -device nvme-subsys,id=subsys0
> -device nvme,id=nvme0,bus=rp0,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,sriov_vq_flexible=2,sriov_vi_flexible=1
> 
> Guest OS:
> ---------
> sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
> sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
> echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> sleep 1
> echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
> nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
> sleep 2
> echo 01:00.1 > /sys/bus/pci/drivers/nvme/bind
> 
> Qemu monitor:
> -------------
> device_del nvme0
>

Hi Igor,

Do you need any more details on this?

Best regards,
Lukasz

