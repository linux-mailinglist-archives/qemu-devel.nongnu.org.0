Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B34F1246
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:45:12 +0200 (CEST)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJGp-0002Zq-4w
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:45:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nbJDk-0000cs-Bi; Mon, 04 Apr 2022 05:42:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:32693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nbJDi-0001lc-5L; Mon, 04 Apr 2022 05:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649065318; x=1680601318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KZtVoL7Cf7YjBTL1hdQtk2eXAqsIA6c7jEqKVrjgBEA=;
 b=gZrALNmG5+063XqGXyX6lSeIVkik6uziYwv4cWxEApHuq6wpUjSDDT6+
 UbRDNn8aIVczo3Fdp7siVJXx5QKaPH5l5Vpge7UMIySYIg6fId1RJdkD1
 bei8/Qfb2MGTVUDN+O2W5zBFo78E62JghSyYVGzDRMj85UHCNNvrFYZTf
 H7kV8sHQZXswq9ngYYyD5mxiTlwEDuf8tQljEtyCvlcSTubAw0z1k6rrt
 MKzmx2abNGB3WplS8H/v2aKvDPsWweGMw9ms0igWFtEZiU5L7VpKaDIzo
 pnkdy5XwoexpWQ7ec0N+RSyKT6lqM/vF+HNzPrPk+ifTCF1hQIiK3SAs1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="321172254"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="321172254"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 02:41:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="569315578"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.40.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 02:41:49 -0700
Date: Mon, 4 Apr 2022 11:41:46 +0200
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Message-ID: <20220404094138.GA15894@lgieryk-VirtualBox>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
 <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
 <20220331143841.55ae9372@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331143841.55ae9372@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, stefanha@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
 k.jensen@samsung.com, armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org,
 its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 02:38:41PM +0200, Igor Mammedov wrote:
> it's unclear what's bing hotpluged and unplugged, it would be better if
> you included QEMU CLI and relevan qmp/monito commands to reproduce it.

Qemu CLI:
---------
-device pcie-root-port,slot=0,id=rp0
-device nvme-subsys,id=subsys0
-device nvme,id=nvme0,bus=rp0,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,sriov_vq_flexible=2,sriov_vi_flexible=1

Guest OS:
---------
sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
sleep 1
echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
sleep 2
echo 01:00.1 > /sys/bus/pci/drivers/nvme/bind

Qemu monitor:
-------------
device_del nvme0
 

