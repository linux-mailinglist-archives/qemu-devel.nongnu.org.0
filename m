Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A7439470A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:29:57 +0200 (CEST)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmhF6-0003uQ-6A
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lmhDR-0002R3-5o; Fri, 28 May 2021 14:28:14 -0400
Received: from mail-dm6nam10on2057.outbound.protection.outlook.com
 ([40.107.93.57]:40737 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lmhDK-0006hY-UV; Fri, 28 May 2021 14:28:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+Y8QpZTsSEXWWDLMCqDP/OdiD/dFetFy8AwEPkSqwmvp9gk4xdGJXpLex/xsKdRZJbJpP+6YVx+naDKquiE9V8iEC73AnNHRb0loqNFEXw0meWXq6EIzWgNYKh6bKgIlTuBBdgLIF+ld94PN2benuKQorW2haxEsJr1VKIFxky7V8hBJvdHCk7Tt8Edewbxcrzpa0nu8WNXpPF2pQ5RnbcWG9Dfi9MpDkMqT0YbY/ratIiJRftImZjU0C+3yud6f+k5NZCc4Jwqge8CsR3/VB8tBRtROcaK6ZWLTddWDS+hbdz+gbN/Zo/5sqk9BJEKilIIlx5gGeQXU5OiWERWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQXSic6K0R70rw07nXX9vvD33308Qvup+pb1uici9Yc=;
 b=WWtPGgirUTCy5QHLzO9PpzrgqkAU3cI6Qje0u9d6RGGmiUtxJuerz3aw0EpbBasIBCqeLioDMHQKNI++FSYlByCtiKdY3H0jmnJ+b3dk8vXciK/DRwY+glXNc31ntTqU5ATyQ+e19VhxZQB4vcLCw3eQsDd2D208R/iA2GB4s6CEgpjyeiv4OTGCcULm8KQ2NtayDgTXjjbkPJnbxVnYDn7CCHFiRmqMkZVdzQRTQHs6aYNi6wbRqn19Ook/54Jn301MsthSLQO24cBUpwrHFIcZKz2i5BOaMNp/stxp5NVr5K5J34Z2sTL24hBnlMTr0t/JgaLncS/Ifdqnxw0q9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQXSic6K0R70rw07nXX9vvD33308Qvup+pb1uici9Yc=;
 b=lTn9tCCGuf1tNOZCx+1sW1qMaRn2Cb8ZYp9L4/QrI0vQcuOLik4gXp0oNa3tt/tM2n3dKp/T1BnAcDgAox5AwOfQ0imLJZa/qEWxp6StFGc9qWblpdtKFFfPJqYBKQHy4lnChK/28lcx5xX0dQpBcuZUjZMwov1+7vPHqDGZYk421LsNNtz2YpKCIlEVjwhNes6ZkJyf6a/hpsR3qiHBJbQS118Hi1W0W2D8o0fB5Y/iYMx9mYz676IMbtSphEj2gmUFBV3Sp3+aQxjGsZbfNsgl1FnsnH5cG0eQysa2KTLx9IlVpuZvnuHKLJP9ueNF2HqONlDpMuXSi/hUTenJRw==
Received: from BN9PR03CA0511.namprd03.prod.outlook.com (2603:10b6:408:131::6)
 by DM5PR12MB1898.namprd12.prod.outlook.com (2603:10b6:3:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 18:28:01 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::f5) by BN9PR03CA0511.outlook.office365.com
 (2603:10b6:408:131::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Fri, 28 May 2021 18:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4150.30 via Frontend Transport; Fri, 28 May 2021 18:28:01 +0000
Received: from [10.40.101.187] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 18:27:56 +0000
Subject: Re: [PATCH] vfio: Fix unregister SaveVMHandler in
 vfio_migration_finalize
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210527123101.289-1-jiangkunkun@huawei.com>
 <fcfa0ad2-4819-8ea3-b69c-01b4d1e97269@redhat.com>
 <c9c94ef3-cbb6-3b0c-f67f-94f3d5422910@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <82aee4c3-13d7-dfd2-4ec9-f4c06c29ea64@nvidia.com>
Date: Fri, 28 May 2021 23:57:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c9c94ef3-cbb6-3b0c-f67f-94f3d5422910@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8abc5490-c840-4a89-db5a-08d922065360
X-MS-TrafficTypeDiagnostic: DM5PR12MB1898:
X-Microsoft-Antispam-PRVS: <DM5PR12MB189840450F5D998211534FB7DC229@DM5PR12MB1898.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DNCJL963ehfP/1MaimZK5db3Nk6I2reYQsuhQ8/yuLHxUezpvvpIJZTFmWAyBRU53EyEPIm57LnwOdF8A5OkJN2KDxCyeJc2fy0acGtImNYmhV5UOEgKUW8Dil9RRw2tdxghXJ6patEEF3k9FoOWUdD1GLzEQJqAvIUI2W1ElASNlD1OhTVzWrZZhOubk9viBWmJCUEg4cbcWb5VCcNM3tC3llYErdL2+lU6uzxiVn9V66xSOvolkvMfCqQCy0CofNOals/d2m+CGmiFVmvZcNS+WH5bvPEnD0JOS9T8kcpoEPGixSyw0Vdaq0n1NVXrw+W5mk0i53XAbTqWr6bzfu6vfa/iYPkWXL7VDWj7O4xjN3eozjXykCGmD6GNUYKOSuZZieuf2JTroMn7/TccY4p5F+KfT+PMAXzCpj4z6BCdpRzDc4oxtSx7SDXjjgbJAj/tgY6qOC8Rl3BrQ4IGW05pZ6/II8T6KY8uKRyU3vFnvgN4rRiGLW3nhYpp1HXU/OshERp0rk9CTz+7bFg0IBq7P9yaLgPSoXyiT/LpUeF+Qm+ee6Bn0mrPg46XBXgnQW7Pv3v5d8E6AScdvocx63e/3vL3AV39+acF0BMHtRAiPbRQmwiGe5eR25fzq4ZoF3/tvwLuCNwZi8vKFRRJAlbPCoXbevor/mclWTnjjHjEtgNC9vgBlgeSRKuN8l08
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(82310400003)(4326008)(6666004)(110136005)(54906003)(31696002)(47076005)(86362001)(36906005)(31686004)(26005)(36860700001)(16576012)(53546011)(478600001)(186003)(16526019)(316002)(336012)(7416002)(2616005)(36756003)(2906002)(5660300002)(83380400001)(356005)(70586007)(7636003)(8676002)(82740400003)(8936002)(70206006)(426003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:28:01.1951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abc5490-c840-4a89-db5a-08d922065360
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1898
Received-SPF: softfail client-ip=40.107.93.57;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org,
 ganqixin@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/28/2021 7:34 AM, Kunkun Jiang wrote:
> Hi Philippe,
> 
> On 2021/5/27 21:44, Philippe Mathieu-Daudé wrote:
>> On 5/27/21 2:31 PM, Kunkun Jiang wrote:
>>> In the vfio_migration_init(), the SaveVMHandler is registered for
>>> VFIO device. But it lacks the operation of 'unregister'. It will
>>> lead to 'Segmentation fault (core dumped)' in
>>> qemu_savevm_state_setup(), if performing live migration after a
>>> VFIO device is hot deleted.
>>>
>>> Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
>>> Reported-by: Qixin Gan <ganqixin@huawei.com>
>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> Cc: qemu-stable@nongnu.org
>>
>>> ---
>>>   hw/vfio/migration.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>> index 201642d75e..ef397ebe6c 100644
>>> --- a/hw/vfio/migration.c
>>> +++ b/hw/vfio/migration.c
>>> @@ -892,6 +892,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>>>           
>>> remove_migration_state_change_notifier(&migration->migration_state);
>>>           qemu_del_vm_change_state_handler(migration->vm_state);
>>> +        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>> Hmm what about devices using "%s/vfio" id?
> The unregister_savevm() needs 'VMSTATEIf *obj'. If we pass a non-null 'obj'
> to unregister_svevm(), it will handle the devices using "%s/vfio" id with
> the following code:
>>     if (obj) {
>>         char *oid = vmstate_if_get_id(obj);
>>         if (oid) {
>>             pstrcpy(id, sizeof(id), oid);
>>             pstrcat(id, sizeof(id), "/");
>>             g_free(oid);
>>         }
>>     }
>>     pstrcat(id, sizeof(id), idstr);

This fix seems fine to me.

> 
> By the way, I'm puzzled that register_savevm_live() and unregister_savevm()
> handle devices using "%s/vfio" id differently. So I learned the commit
> history of register_savevm_live() and unregister_savevm().
> 
> In the beginning, both them need 'DeviceState *dev', which are replaced
> with VMStateIf in 3cad405babb. Later in ce62df5378b, the 'dev' was removed,
> because no caller of register_savevm_live() need to pass a non-null 'dev'
> at that time.
> 
> So now the vfio devices need to handle the 'id' first and then call
> register_savevm_live(). I am wondering whether we need to add
> 'VMSTATEIf *obj' in register_savevm_live(). What do you think of this?
> 

I think proposed change above is independent of this fix. I'll defer to 
other experts.

Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>

