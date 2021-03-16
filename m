Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC9B33D94C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:24:44 +0100 (CET)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCUt-0005Fy-Ll
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lMCPI-0000Yw-K7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:18:56 -0400
Received: from mail-co1nam11on2052.outbound.protection.outlook.com
 ([40.107.220.52]:53473 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lMCPF-0001u7-Ns
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:18:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNsyFA7GTSZZuhrC+hXaZWxTZhQo26eLAOgZS9MTNHkCSjKsErOiwoDoZBf736WP5PanOqZuevEAX5UTH5zugdzYwbQG3uwNQNLuT8bsiUYjhDdS5ygefHQj5HnV8IhBbb6dgO2/U0WMdWN2PhDMJM+aA06GB5mRjBw8j0GsGpu0PWytWqJUcmixRy2pYSNAv0+j/AMb3Kl6sG0hm2utDNOkwDLgNQnw7qZO1g6P+J++rbFM/6RBXcEcHxMkVQTdYWT12yMiV/kMMbz6X60kAMNtWwkl09OLnCqcUy7jFwOrNBFa1lFQD/bWvoLoYAcwinEgQ42Orch7iiqRhlFomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zKkksmft27ehsU2HfwY0mx88IRMG58Yi1NdQmweRSA=;
 b=DIQ06cXh/UumqIqcemdtrsCl91rRFXnb19HJhQtwdqfbuGdiXH3EAM0nEcOsnwBG9Oc5kiYVrLjJjco9MLbnCpJIq97lP/HmnXUgddiUiqDwR5y+FNeTCdJf3Ziceseo/in7l7nl5BdsxALto2JkhN/uI+L36BUTtrXQZhSZbwCAxTIz3A6MpbVN0cccTXC8CB0Etd8GJfU7N/csetSkaQak1vont5kQuM+XSr/Z656AJM2IY/OaC+Ykm+sjDZc+0ITJZqZ3BC/0vfTpozwHwd+Bl0yp/4++/R8v4KeoRpwn1BfpQP2ZI/FmDC8qUSypAsOIjBEkYghflo3cVFna8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zKkksmft27ehsU2HfwY0mx88IRMG58Yi1NdQmweRSA=;
 b=cdG4oUZhGnAa9rQoKmUCgDJQovqJMaM0Qsqa5iDddVy53GPb0AzZllZP683MovA0JLQpXLJtfx615QmwmL2NkqAE4CzkWmqLrnx0zSNx4c6UP3aK2xi+BIjWSxEveousdUWGaPPITg/bKaFWPU+AHajvjuKHZS3y3URzrRkgajBRSarPkJ0suvPtVY90WwCh8WyGFKLieHV+d3+mXmrulsPPSeXj9xNWwhx0x2plSopwajmVB2lvnL2MC0sJIgfVK/O9/4Hkekn3o7/U3sng8b03c7YSiujySY+wO3br1tylTNWe21U7KKJNHoV7JYiZeGbOutBQCHy8Q+vDynAq8g==
Received: from DM5PR16CA0037.namprd16.prod.outlook.com (2603:10b6:4:15::23) by
 CY4PR1201MB0167.namprd12.prod.outlook.com (2603:10b6:910:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 16:18:47 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::9a) by DM5PR16CA0037.outlook.office365.com
 (2603:10b6:4:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 16:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 16:18:47 +0000
Received: from [10.40.102.167] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 16:18:42 +0000
Subject: Re: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
To: Cornelia Huck <cohuck@redhat.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <20210315182258.586dbf23.cohuck@redhat.com>
From: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Message-ID: <c01589ee-d007-77da-83d1-fb6096f6f144@nvidia.com>
Date: Tue, 16 Mar 2021 21:48:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315182258.586dbf23.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f9a312-b4f1-4c18-97bc-08d8e8972d82
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0167:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01677E4B06349C2CD2A30945B86B9@CY4PR1201MB0167.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a79zf+x4fgQ6ItS5K5sXqmyMaee1L/4Qc9xX39UQo+iBqZphitV9j8JiM739RcC2B8oncDKUSL1u3TbolvS8pvDtrK6OzFb8sSUEXuIdLYdaLG2TgyzSLQg0AlGzSlJvXXMwfoDpRjZAp6rTIjLOcMwQser4SpzAwF/iQLuMDJHPdyNyMD1vH4XoI62V6nR20N7f2fPEWOFLA6FJ6YXqUmhZw9OKlv8piy4Z0ZHy72GHYfIk8r5/f0RVtKhw5NrewG3WMq4lCcMds1ifxz9F9zppgTF/uZAZ5u0z+yE0biNEwyifQMme5IP54vkhdTf9NBLwFe8z3T2/0E+MYCdYKDcA+dwKzVBg8FFwmKDxIlVa3NK/YN6n9NJvz1mZcHV7OlACWKiHo5yocF9fpzEl9e3zPdX5n61oI4XKvaFIUf7N41tZ6fxKu4jU/1xIe2AuWyBagkzJMnqz7nUPd2qjBSvuLr3RLKar4T+K9YQoWWsWvveIeJONrJ0kFxL9RDTfnBac4Xu8c5nVVoNTU5egI7VkNOiKdEdX3GGWjzKew+6cXreeGofAfIC5024Dut4TgGOv3IHJrQPhI5N7c9SKnDO1RQOFZWxajkm+u0nGZdlF75fiQgBeXMZDBmvSDvRaM0ciWWhynvmd1QQR9zW9ifcyukFw3apsyy2QEe3Dp2SHtZHpmEqTC/dZ/5/YS2ZGq9H0YOVHzCmOq++uWnXhCRk0rXCANbW1zfPLnslGcWE=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(36840700001)(107886003)(2906002)(26005)(7416002)(31696002)(336012)(8676002)(83380400001)(36906005)(82310400003)(86362001)(6916009)(82740400003)(186003)(356005)(31686004)(36756003)(7636003)(478600001)(16576012)(84040400003)(16526019)(34020700004)(6666004)(316002)(70586007)(36860700001)(426003)(4326008)(47076005)(2616005)(8936002)(53546011)(70206006)(54906003)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 16:18:47.3054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f9a312-b4f1-4c18-97bc-08d8e8972d82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0167
Received-SPF: softfail client-ip=40.107.220.52;
 envelope-from=targupta@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dgilbert@redhat.com, yan.y.zhao@intel.com, lushenming@huawei.com,
 alex.williamson@redhat.com, dnigam@nvidia.com, berrange@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/15/2021 10:52 PM, Cornelia Huck wrote:
> 
> On Thu, 11 Mar 2021 00:50:09 +0530
> Tarun Gupta <targupta@nvidia.com> wrote:
> 
>> Document interfaces used for VFIO device migration. Added flow of state changes
>> during live migration with VFIO device. Tested by building docs with the new
>> vfio-migration.rst file.
>>
>> v2:
>> - Included the new vfio-migration.rst file in index.rst
>> - Updated dirty page tracking section, also added details about
>>    'pre-copy-dirty-page-tracking' opt-out option.
>> - Incorporated comments around wording of doc.
>>
>> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> ---
>>   MAINTAINERS                   |   1 +
>>   docs/devel/index.rst          |   1 +
>>   docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 137 insertions(+)
>>   create mode 100644 docs/devel/vfio-migration.rst
>>
> 
> (...)
> 
>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>> new file mode 100644
>> index 0000000000..6196fb132c
>> --- /dev/null
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -0,0 +1,135 @@
>> +=====================
>> +VFIO device Migration
>> +=====================
> 
> Maybe add an introductory sentence or two describing the general
> approach? I.e. we have a general framework, and specific support for
> devices needs to be hooked up.

Ummm, the below paragraph does describe the approach we're using for the 
migration framework involving pre-copy and stop-and-copy phase.
Can you help elaborate more on the general approach you'd like to have?

> 
>> +
>> +VFIO devices use an iterative approach for migration because certain VFIO
>> +devices (e.g. GPU) have large amount of data to be transfered. The iterative
>> +pre-copy phase of migration allows for the guest to continue whilst the VFIO
>> +device state is transferred to the destination, this helps to reduce the total
>> +downtime of the VM. VFIO devices can choose to skip the pre-copy phase of
>> +migration by returning pending_bytes as zero during the pre-copy phase.
> 
> What about something like:
> 
> "Migration of VFIO devices consists of two phases: the optional
> pre-copy phase, and the stop-and-copy phase. The pre-copy phase is
> iterative and allows to accommodate VFIO devices that have a large
> amount of data that needs to be transferred. The iterative pre-copy
> phase..."
> 

Thanks, this looks better. I'll update it in next version incorporating 
the other comments too below.

Thanks,
Tarun

>> +
>> +A detailed description of the UAPI for VFIO device migration can be found in
>> +the comment for the ``vfio_device_migration_info`` structure in the header
>> +file linux-headers/linux/vfio.h.
>> +
>> +VFIO device hooks for iterative approach:
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
>> +  copies the remaining data for the VFIO device untill the vendor driver
> 
> s/untill/until/
> 
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
>> +
>> +Similarly, a migration state change notifier is registered to get a
>> +notification on migration state change. These states are translated to VFIO
> 
> s/to/to the corresponding/
> 
>> +device state and conveyed to vendor driver.
> 
> s/to/to the/
> 
> (...)
> 
>> +Postcopy
>> +========
>> +
>> +Postcopy migration is not supported for VFIO devices.
> 
> s/is not/is currently not/ ?
> 

