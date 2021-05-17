Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDFC383B2F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:23:18 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligxZ-0003k1-Qe
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1ligTD-0003S8-KF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:51:55 -0400
Received: from mail-dm6nam11on2061.outbound.protection.outlook.com
 ([40.107.223.61]:39998 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1ligTA-0005yJ-Jr
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:51:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPTruUmu/HJqUEUj/87KqsJ+1f8PaM/XRRkqnUH6dgkop/Qw7Oz66oboLPzRYW5ncFzz8+TBGJR0KSglJcn/chEpL+qWVOX7DKt5e8VTlwkCASu1KRVsXXAuzcsdGp9GRIDDlaSH7DBdfoFXyHaa71Ox7ya3GHaGv2DqNuh1jtaMZl8z7pO1W2UvZItopO1G4NeeFdZ6gkwhkgIxkzTdVWI3jvMAuy8GvL294PRMzGJxai7NDO6lQ2eAooxzEFWQZQA3vRnJHQgmn8mLkXmu9p9F+B3MYmeqfhl7/JpGnvGCjWdb4XF539FrVascK78izeoB3lKdmZUK7/rNrhSsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMlr5KUQhgAXXPOZGhjdmHtW/1qd7EI8ND2lCtNYsvE=;
 b=m7+Ktu/fKDdD8hIMXZ0dJyLqqWj6ZDXsHDRBJmXiL3NPTWlohRs1QwXQDkXXPfOKgHR8+R7IzMtyv4/faEEMZG0zS+85U4vsQuwen3HlT/aV/m1/UpWBYwcWPCUNADgen4sH3uMT9IVxD/KjOluXw6EvB5Nc0hzEg0GgGaV68yMr2nakHChHkPb2n4nzLjhvPxGWjnxOTJixyoGYKLnj836kttB9eZsGyfAn89RW9hpCrqUA8w7hcK6QKm5uTAARqBd4bt9myTJvnvaGae/Cf52JNJz92MEZKaBipc1Q7JaNs4vnDj2adaYgPoG3pcrPrngg6AoSa9e5oei02+fgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMlr5KUQhgAXXPOZGhjdmHtW/1qd7EI8ND2lCtNYsvE=;
 b=DBDtylxMfa/yvAIj3pdY5360EuCHhLy7ZporUH7rKYmacG/XiYXfsBMLthBPHH1T9pQdRXzB7S2Py9FaZHCg8vWMTT5hXb5Vb1rwsN3CNY7eyxGgMionsTmrxELchTQT71aDwMhX9aoYFzAK+8VgGPOT+9xX+oxtpMW3V7nXXGl7NIhWSdTFi4u80VhTMj/C4Tl88w1BDPB1pxJBADNGL0FUeA5nxhu2wdBL6QJzYhtGYHpYZyy/FgmGvf6n6U8YkiLL1QjMWshuWy/J7iyqcxtA5cyPNDy0ValdudPkbRQ76EsN2MpFr8NEbTct7uUeNZCNmawd3UzxypoTsY85qw==
Received: from BN6PR1401CA0011.namprd14.prod.outlook.com
 (2603:10b6:405:4b::21) by CH2PR12MB4200.namprd12.prod.outlook.com
 (2603:10b6:610:ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 16:36:46 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::a0) by BN6PR1401CA0011.outlook.office365.com
 (2603:10b6:405:4b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 17 May 2021 16:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 16:36:46 +0000
Received: from [10.40.102.59] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 16:36:42 +0000
Subject: Re: [PATCH v5 1/1] docs/devel: Add VFIO device migration documentation
To: <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>,
 <alex.williamson@redhat.com>, <cohuck@redhat.com>, <kevin.tian@intel.com>
References: <20210418122251.88809-1-targupta@nvidia.com>
From: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Message-ID: <14482878-2092-96e8-4959-8db73b06de99@nvidia.com>
Date: Mon, 17 May 2021 22:06:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210418122251.88809-1-targupta@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29b4f410-9b0e-4b42-2df4-08d91951f684
X-MS-TrafficTypeDiagnostic: CH2PR12MB4200:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42004B9E58C7CFB592C615CCB82D9@CH2PR12MB4200.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CTegO/sarmL1S+MPLxlp2N0ZFa6pMxTOuhTDAlb8iM0RewRM9KAonz85sXRPl7iPC2jXqmUI+zO8CkjwC3lOD6GXBIScBJ/8hJFJH0Mn/jYD8kQutgy5Sz5f64QAL3U/QimppustmypynRgk/+nqj0muNy/GYbzV57MbbWRSHLB+61eyB0FSiHM1+Z1MLYY9MTMP2jBapO/Jun3yMLgW8qSr1Y++0yXem7N370rHJRgVhSjyHocbqa2gkDPyxz/K44ixYPCxviKf2tgIhA6Lo9VpR3eaJuJ5wog2dxZIn+aSDWzgC0OccQA53azhl9ffOQ8xIYFb7/g61i6jk5xen4nI2qdyQhtdqwqw/lKsaVrqATt4w+aHK2gN+SNZugQU0cJT7NHXnZUSOR0UlWRj0AvX119JxXxOSUgSkSPABNuqp9tpskvXVJm3l+tegD/IgIs8rGEe5GfnX1DN6R0n7CtrITNt26C42rhaC4n+uYPvKXqZ09yeDS2b+ZmfRq9WU1Q70DV641zikWp7NvwoGCW1pVAtv0bngjIOkXIKNYYAg/ZbpUX+m0S5W4bhnUGzzQDDj4JNQhMGZMkq/Xu4wvZ1GGcgLODatNnBAg+ICeGECs4akOHt2eu8NmK44hsj8tG2mFIDz9pfqzqoTrTa0Gy7VwATkHBdpADfqzZVZ+F2af7d61tQBkfNqbQPp5Hs
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(2906002)(70586007)(70206006)(54906003)(7636003)(426003)(16526019)(110136005)(356005)(2616005)(336012)(36756003)(107886003)(53546011)(478600001)(5660300002)(36860700001)(36906005)(316002)(16576012)(82740400003)(186003)(83380400001)(31696002)(31686004)(86362001)(82310400003)(47076005)(7416002)(26005)(6666004)(8676002)(8936002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 16:36:46.6669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b4f410-9b0e-4b42-2df4-08d91951f684
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200
Received-SPF: softfail client-ip=40.107.223.61;
 envelope-from=targupta@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cjia@nvidia.com, quintela@redhat.com, dgilbert@redhat.com,
 yan.y.zhao@intel.com, lushenming@huawei.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex, Cornelia,

Just wanted to confirm that this patch will be pulled in QEMU 6.1, right?

Thanks,
Tarun

On 4/18/2021 5:52 PM, Tarun Gupta wrote:
> Document interfaces used for VFIO device migration. Added flow of state changes
> during live migration with VFIO device.
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Co-developed-by: Kirti Wankhede <kwankhede@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> ---
> Tested by building docs with new vfio-migration.rst file
> 
> v5:
> - Fixed meta issues in commit message
> 
> v4:
> - Added info about vfio_listener_log_global_[start|stop]
> - Added info about `save_state` callback.
> - Incorporated comments from v3.
> 
> v3:
> - Add introductory line about VM migration in general.
> - Remove occurcences of vfio_pin_pages() to describe pinning.
> - Incorporated comments from v2
> 
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>    'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.
> 
> ---
>   MAINTAINERS                   |   1 +
>   docs/devel/index.rst          |   1 +
>   docs/devel/vfio-migration.rst | 150 ++++++++++++++++++++++++++++++++++
>   3 files changed, 152 insertions(+)
>   create mode 100644 docs/devel/vfio-migration.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c5..dea85faccf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1823,6 +1823,7 @@ S: Supported
>   F: hw/vfio/*
>   F: include/hw/vfio/
>   F: docs/igd-assign.txt
> +F: docs/devel/vfio-migration.rst
>   
>   vfio-ccw
>   M: Cornelia Huck <cohuck@redhat.com>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 6cf7e2d233..e6e4f7907e 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -42,3 +42,4 @@ Contents:
>      qom
>      block-coroutine-wrapper
>      multi-process
> +   vfio-migration
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> new file mode 100644
> index 0000000000..9ff6163c88
> --- /dev/null
> +++ b/docs/devel/vfio-migration.rst
> @@ -0,0 +1,150 @@
> +=====================
> +VFIO device Migration
> +=====================
> +
> +Migration of virtual machine involves saving the state for each device that
> +the guest is running on source host and restoring this saved state on the
> +destination host. This document details how saving and restoring of VFIO
> +devices is done in QEMU.
> +
> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
> +accommodate VFIO devices that have a large amount of data that needs to be
> +transferred. The iterative pre-copy phase of migration allows for the guest to
> +continue whilst the VFIO device state is transferred to the destination, this
> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
> +the pre-copy phase of migration by returning pending_bytes as zero during the
> +pre-copy phase.
> +
> +A detailed description of the UAPI for VFIO device migration can be found in
> +the comment for the ``vfio_device_migration_info`` structure in the header
> +file linux-headers/linux/vfio.h.
> +
> +VFIO implements the device hooks for the iterative approach as follows:
> +
> +* A ``save_setup`` function that sets up the migration region and sets _SAVING
> +  flag in the VFIO device state.
> +
> +* A ``load_setup`` function that sets up the migration region on the
> +  destination and sets _RESUMING flag in the VFIO device state.
> +
> +* A ``save_live_pending`` function that reads pending_bytes from the vendor
> +  driver, which indicates the amount of data that the vendor driver has yet to
> +  save for the VFIO device.
> +
> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
> +  vendor driver through the migration region during iterative phase.
> +
> +* A ``save_state`` function to save the device config space if it is present.
> +
> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
> +  VFIO device state and iteratively copies the remaining data for the VFIO
> +  device until the vendor driver indicates that no data remains (pending bytes
> +  is zero).
> +
> +* A ``load_state`` function that loads the config section and the data
> +  sections that are generated by the save functions above
> +
> +* ``cleanup`` functions for both save and load that perform any migration
> +  related cleanup, including unmapping the migration region
> +
> +
> +The VFIO migration code uses a VM state change handler to change the VFIO
> +device state when the VM state changes from running to not-running, and
> +vice versa.
> +
> +Similarly, a migration state change handler is used to trigger a transition of
> +the VFIO device state when certain changes of the migration state occur. For
> +example, the VFIO device state is transitioned back to _RUNNING in case a
> +migration failed or was canceled.
> +
> +System memory dirty pages tracking
> +----------------------------------
> +
> +A ``log_global_start`` and ``log_global_stop`` memory listener callback informs
> +the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
> +memory listener callback marks those system memory pages as dirty which are
> +used for DMA by the VFIO device. The dirty pages bitmap is queried per
> +container. All pages pinned by the vendor driver through external APIs have to
> +be marked as dirty during migration. When there are CPU writes, CPU dirty page
> +tracking can identify dirtied pages, but any page pinned by the vendor driver
> +can also be written by the device. There is currently no device or IOMMU
> +support for dirty page tracking in hardware.
> +
> +By default, dirty pages are tracked when the device is in pre-copy as well as
> +stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
> +the destination in both phases. Copying dirty pages in pre-copy phase helps
> +QEMU to predict if it can achieve its downtime tolerances. If QEMU during
> +pre-copy phase keeps finding dirty pages continuously, then it understands
> +that even in stop-and-copy phase, it is likely to find dirty pages and can
> +predict the downtime accordingly.
> +
> +QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
> +which disables querying the dirty bitmap during pre-copy phase. If it is set to
> +off, all dirty pages will be copied to the destination in stop-and-copy phase
> +only.
> +
> +System memory dirty pages tracking when vIOMMU is enabled
> +---------------------------------------------------------
> +
> +With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
> +phase of migration. In that case, the unmap ioctl returns any dirty pages in
> +that range and QEMU reports corresponding guest physical pages dirty. During
> +stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
> +pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
> +mapped ranges.
> +
> +Flow of state changes during Live migration
> +===========================================
> +
> +Below is the flow of state change during live migration.
> +The values in the brackets represent the VM state, the migration state, and
> +the VFIO device state, respectively.
> +
> +Live migration save path
> +------------------------
> +
> +::
> +
> +                        QEMU normal running state
> +                        (RUNNING, _NONE, _RUNNING)
> +                                  |
> +                     migrate_init spawns migration_thread
> +                Migration thread then calls each device's .save_setup()
> +                    (RUNNING, _SETUP, _RUNNING|_SAVING)
> +                                  |
> +                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
> +             If device is active, get pending_bytes by .save_live_pending()
> +          If total pending_bytes >= threshold_size, call .save_live_iterate()
> +                  Data of VFIO device for pre-copy phase is copied
> +        Iterate till total pending bytes converge and are less than threshold
> +                                  |
> +  On migration completion, vCPU stops and calls .save_live_complete_precopy for
> +   each active device. The VFIO device is then transitioned into _SAVING state
> +                   (FINISH_MIGRATE, _DEVICE, _SAVING)
> +                                  |
> +     For the VFIO device, iterate in .save_live_complete_precopy until
> +                         pending data is 0
> +                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
> +                                  |
> +                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
> +             Migraton thread schedules cleanup bottom half and exits
> +
> +Live migration resume path
> +--------------------------
> +
> +::
> +
> +              Incoming migration calls .load_setup for each device
> +                       (RESTORE_VM, _ACTIVE, _STOPPED)
> +                                 |
> +       For each device, .load_state is called for that device section data
> +                       (RESTORE_VM, _ACTIVE, _RESUMING)
> +                                 |
> +    At the end, .load_cleanup is called for each device and vCPUs are started
> +                       (RUNNING, _NONE, _RUNNING)
> +
> +Postcopy
> +========
> +
> +Postcopy migration is currently not supported for VFIO devices.
> 

