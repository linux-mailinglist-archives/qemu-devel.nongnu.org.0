Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641853545ED
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 19:19:39 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTSt0-00027C-1V
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 13:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lTSrX-0001fT-4R
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 13:18:07 -0400
Received: from mail-co1nam11on2065.outbound.protection.outlook.com
 ([40.107.220.65]:1185 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lTSrU-0002Sv-Kc
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 13:18:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvgPMnh/Mq2PwxvyTTdpQu5wUUyXPaRYemwdN/3hgd6zuQlwBTp1WYDA1oP90wsR7sRv09mPTEFQS+NnLai/W1/DAzqWWohOEP7z22FmnJmtQu+fxLh7U/vD1Ak8XIp1Rk/CDEbDzzhq0hMclgEzdxo5UMYgs4MYkBamWn9b0SmSWIgrbQtJcePWv9vTrpEeMblfxbMJq9v64RpULghq8zM68xn/ot9u5Zhwg1Eze6JPKdSW9ayjHY7VysWramAdD20IoEbkpeJXNeCXlx1P9fNpElUPyLqAYLHu5FLo6S3QtA+EK/UjodDsRNn3og1lhiU+lcSpBgih1CpWM/AjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5VULXCX1GirWMbKJxSnhiCRbcgFTkjvmKeQrUObnZs=;
 b=j1aJhq2W1xSp+Aq4WiWyPzev9Wv4PULghRE1K/rBVuv3/2O/fSVHz7aZr4rYWq47lCRTC9Z3ZwHhGxcJOf2ATmusn3ieflRkwMFCpl4Fv6RXKQ5VZFj7Gs0XeLKGeQuUz2WOryCecyc/AP0sx1d0tDzYD6uPOuI2OL9vlXHMV+zUfTu4Bk6KVJEuxu37q3kHAjAzt4ALRuS+sEEg2I8vE5n3T0PvOgMz+KjM0MjlbXyKPun8iAhgwKVv3t+zY87yWmcuFWGPeEqi24rzhzA1004ax7KXAu4pFaY1DnXfCfq9cyH23/bHI48MRprG3xrMg056DDPWLK2qNyzsS9EArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5VULXCX1GirWMbKJxSnhiCRbcgFTkjvmKeQrUObnZs=;
 b=nqg9FDFw1AN/4QM6ut4pLu3GvKKjyRVYzfi6yBcEq8gr8iPIVtfL2M+x/ztB4Ko3ohWb7TJ43Uv++1r2jhkS+Ffuu7x17MYUGjUbNvfIYsd9fmii+vljFB3vq7KrCLP9MPxwM526EeSXD+gEqripm2octtwnuqpDXzLXcUiWxvhLoTdw2Lq1Fli7LqzM0knt78S98rfbdxCbJgF8aMcdAGS1itqqaDPyd0Ue/WRkFXcNFM41W8XruTV8cepeZ1xu5U2yysQYoxHk9vZYbGWgeXYk5uX8cVEQgkKMbQ5M9CHbCzrGrC5716XsiqF05PS/18eBtVzo6sNeK1xC2m6zSw==
Received: from BN9PR12CA0027.namprd12.prod.outlook.com (2603:10b6:408:10c::30)
 by CY4PR12MB1687.namprd12.prod.outlook.com (2603:10b6:910:3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Mon, 5 Apr
 2021 17:02:57 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::ce) by BN9PR12CA0027.outlook.office365.com
 (2603:10b6:408:10c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Mon, 5 Apr 2021 17:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Mon, 5 Apr 2021 17:02:56 +0000
Received: from [10.40.102.251] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Apr
 2021 17:02:51 +0000
Subject: Re: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
To: Cornelia Huck <cohuck@redhat.com>
References: <20210326131850.149337-1-targupta@nvidia.com>
 <20210401130522.1e9c2871.cohuck@redhat.com>
From: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Message-ID: <178048b3-8197-856e-af81-66920e60a4d1@nvidia.com>
Date: Mon, 5 Apr 2021 22:32:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401130522.1e9c2871.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1dd7223-0551-498e-47fe-08d8f854a907
X-MS-TrafficTypeDiagnostic: CY4PR12MB1687:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1687AA7DAB5FF1A92C974739B8779@CY4PR12MB1687.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXSlNApaRpEW64cAFBTVeFu5bjLFLftNwCDverxnz6PApBqteemL5eMc1cNbyuOnZeVdF4SRRVPjfghYFaM45RTdA2MFAESKx7JApKM58WXJPsey9aOASYhULLUBDd16AVSkcjYfxdRP4BLHghJhRUMaHR39hRKhpITDT/6ovQIoU+2HR7dJ66oPoreXTkps1nN3XLoXGOIZzfdsBDR1tgVBG5x1jw7RFtzAHNhvxeO4z6pkULhOj9HQJSwg05/o8sKMtTh8PiRRgdsp3EMkrlW5hkwTlGdX4GgMSwdW2VOQqjhzm5bOaAgO85YIrIKKR4ngQeLEUHkuQ5j/Zp+yEe1srbqeFakHgGlu6Dn07ASvHaDeLoZhDjkt4zRFQOnMBDikGdas1C6v937WNMh3UzOyCjgxyR+RkAk7i36IAgJnrLXZVrZWLCEmKFWdi+hKnrh7anDXjX+Ggbh3h3BKJsKhR7myxSOvXnHaehBCvXNT84bvew3CuBayVsJIZOlpxOGSGcia/ncepAI4uDGLScG42mrCX9JDiHf1BqVwnNPUJzE6K2ZTtCiZta7BzoNdXC0/LAyjN0II5zEBRNGRJOcsnb3l5VZWIi4UPk+ylBWt7eijIB5tZ+uO/2qCU7riMsZYWxpI9vW6dqyjC6uEpMxzryTvLVsH7n6JAgCZgE2gnFMkTUmC95+UALCmyVvO
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(356005)(2906002)(83380400001)(336012)(16526019)(7416002)(36906005)(6666004)(2616005)(31696002)(82310400003)(426003)(31686004)(47076005)(7636003)(86362001)(36756003)(186003)(70206006)(70586007)(16576012)(478600001)(107886003)(8676002)(316002)(5660300002)(8936002)(53546011)(6916009)(36860700001)(26005)(82740400003)(54906003)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 17:02:56.8074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dd7223-0551-498e-47fe-08d8f854a907
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1687
Received-SPF: softfail client-ip=40.107.220.65;
 envelope-from=targupta@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kevin.tian@intel.com, cjia@nvidia.com, quintela@redhat.com,
 alex.williamson@redhat.com, qemu-devel@nongnu.org, yan.y.zhao@intel.com,
 lushenming@huawei.com, kwankhede@nvidia.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/2021 4:35 PM, Cornelia Huck wrote:
> 
> On Fri, 26 Mar 2021 18:48:50 +0530
> Tarun Gupta <targupta@nvidia.com> wrote:
> 
>> Document interfaces used for VFIO device migration. Added flow of state changes
>> during live migration with VFIO device. Tested by building docs with the new
>> vfio-migration.rst file.
> 
> I don't think you want to include the test state in the patch
> description; that should go into a --- section that is stripped off by
> git am.
> 
>>
>> v3:
>> - Add introductory line about VM migration in general.
>> - Remove occurcences of vfio_pin_pages() to describe pinning.
>> - Incorporated comments from v2
>>
>> v2:
>> - Included the new vfio-migration.rst file in index.rst
>> - Updated dirty page tracking section, also added details about
>>    'pre-copy-dirty-page-tracking' opt-out option.
>> - Incorporated comments around wording of doc.
> 
> Same for the changelog; this is interesting for review, but not for the
> final git log.
>

Will move these details in --- section.

>>
>> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> 
> This S-o-b chain does not look correct. Your address should be the last
> one in the chain, signing off on all of the previous ones. (Maybe Kirti
> also needs to be listed in a Co-developed-by: statement?)
> 
>> ---
>>   MAINTAINERS                   |   1 +
>>   docs/devel/index.rst          |   1 +
>>   docs/devel/vfio-migration.rst | 143 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 145 insertions(+)
>>   create mode 100644 docs/devel/vfio-migration.rst
> 
>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>> new file mode 100644
>> index 0000000000..24cb55991a
>> --- /dev/null
>> +++ b/docs/devel/vfio-migration.rst
> 
> (...)
> 
>> +VFIO device hooks for iterative approach:
> 
> "VFIO implements the device hooks for the iterative approach as
> follows:"
> 
> ?
> 
>> +
>> +* A ``save_setup`` function that sets up the migration region, sets _SAVING
>> +  flag in the VFIO device state and informs the VFIO IOMMU module to start
>> +  dirty page tracking.
>> +
>> +* A ``load_setup`` function that sets up the migration region on the
>> +  destination and sets _RESUMING flag in the VFIO device state.
>> +
>> +* A ``save_live_pending`` function that reads pending_bytes from the vendor
>> +  driver, which indicates the amount of data that the vendor driver has yet to
>> +  save for the VFIO device.
>> +
>> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
>> +  vendor driver through the migration region during iterative phase.
>> +
>> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
>> +  VFIO device state, saves the device config space, if any, and iteratively
>> +  copies the remaining data for the VFIO device until the vendor driver
>> +  indicates that no data remains (pending bytes is zero).
>> +
>> +* A ``load_state`` function that loads the config section and the data
>> +  sections that are generated by the save functions above
>> +
>> +* ``cleanup`` functions for both save and load that perform any migration
>> +  related cleanup, including unmapping the migration region
>> +
>> +A VM state change handler is registered to change the VFIO device state when
>> +the VM state changes.
> 
> This sentence is not very informative. What about:
> 
> "The VFIO migration code uses a VM state change handler to change the
> VFIO device state when the VM state changes from running to
> not-running, and vice versa."
> 
>> +
>> +Similarly, a migration state change notifier is registered to get a
>> +notification on migration state change. These states are translated to the
>> +corresponding VFIO device state and conveyed to the vendor driver.
> 
> "Similarly, a migration state change handler is used to transition the
> VFIO device state back to _RUNNING in case a migration failed or was
> canceled."

I wanted to keep the statement generic because the VFIO device state can 
be _RUNNING, _SAVING, _RESUMING. I can use your statement as an example 
as to how the migration state can be changed back to _RUNNING in case of 
migration failure or cancel. Does that work?

Thanks,
Tarun

> 
> 
>> +
>> +System memory dirty pages tracking
>> +----------------------------------
>> +
>> +A ``log_sync`` memory listener callback marks those system memory pages
>> +as dirty which are used for DMA by the VFIO device. The dirty pages bitmap is
>> +queried per container. All pages pinned by the vendor driver through external
>> +APIs have to be marked as dirty during migration. When there are CPU writes,
>> +CPU dirty page tracking can identify dirtied pages, but any page pinned by the
>> +vendor driver can also be written by device. There is currently no device or
> 
> s/by/by the/
> 
>> +IOMMU support for dirty page tracking in hardware.
>> +
>> +By default, dirty pages are tracked when the device is in pre-copy as well as
>> +stop-and-copy phase. So, a page pinned by vendor driver will be copied to
> 
> s/by/by the/
> s/to/to the/
> 
>> +destination in both the phases. Copying dirty pages in pre-copy phase helps
> 
> s/both the/both/ ?
> 
>> +QEMU to predict if it can achieve its downtime tolerances. If QEMU during
>> +pre-copy phase keeps finding dirty pages continuously, then it understands
>> +that even in stop-and-copy phase, it is likely to find dirty pages and can
>> +predict the downtime accordingly
>> +
>> +QEMU also provides per device opt-out option ``pre-copy-dirty-page-tracking``
> 
> s/provides/provides a/
> 
>> +which disables querying dirty bitmap during pre-copy phase. If it is set to
> 
> s/querying/querying the/
> 
>> +off, all dirty pages will be copied to destination in stop-and-copy phase only
> 
> s/to/to the/
> 
> (...)
> 

