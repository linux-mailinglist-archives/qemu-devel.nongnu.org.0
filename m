Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A8356B88
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:49:27 +0200 (CEST)
Received: from localhost ([::1]:39538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6gY-00062J-G4
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lU6fP-0005Xu-KO
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 07:48:15 -0400
Received: from mail-bn8nam12on2044.outbound.protection.outlook.com
 ([40.107.237.44]:64993 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lU6fN-0003dG-5U
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 07:48:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyaTNMv9vIeZnoBrRkJELpu56YLo9BBXNvi3oVfMAuQX1vrnJXeYbaz23gwMYobWG0p+mwHtgNCa3DuxpEziMoPxTNP56lu4iU8EFYug3/8+ieZmV+gN8Fck6D8xjMk53FnSwBcpEOxLRH02+oH6aUCL005OWdpJ9CKEg4McXiYjr271Kn38H5Dm/qeipdYFN1sN54PSs/dWETCSJkIfmmoBc9JPlW1XS6rqpoyICk4P7PoLkQ6NSpxrr9+DSiBE6tEE898IHHJ/tzxMOyqqaslr0mY4tAAEzgtTnQyQhobcATi+wDf2dJs3wuiXB0d6Mhb+LK9vg2R0U05yOa4duA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuv+u55UEndF20slTG1KpMKIYxy9nIDuDnXd8+QIlj0=;
 b=mSrgpNLm8sPQq3hSExEM7VjKCb/4B7DS/0nK6NuqP5C9WdzzzrgTD96coH6txeXgbiLwXkRMYfd9hQuWqkI4lEnKYEK5xqHYAb9dmErtwLMXB5z456DGLnzzJgs8Z7SzNolQS1i0W0NC1S7q3kB748sMsEw0/Jm8GrZ5Y0FEvy4QBd+HQ4Ql0Sf1UD4NCTq4MJ4VhOfqkplBgfJ3PhttSvpYp9Vc/Rz6n/c9qezVquWEplde7iz8JHaXpHe+VQJkQxNokU/sCR5HyIwVsZx+Grj/Y7Cdinez6mxd99ee3Tmvo+C/ULBzketCD5HaJI5bp2k9nXqTLHaZ/QcQdyi9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuv+u55UEndF20slTG1KpMKIYxy9nIDuDnXd8+QIlj0=;
 b=uSUA0rO1Izirft2/lCQXqOtVwXmwL+7tUNIJ3mUETjOyl0fzu5jprty8t7q8r23AwEN2dplh1msPAOTgp6n16ZiuQR5iQ5++SNYX7XCuZEFDEt1breETe5iSu4Jm1FSBM4gxLO9HkXkYL6U/WKsGpIkFs6+j7CmGDLfI14yx59Thy2S+x7dO7ckfG5N6FWynbAhW+QvGNKXHJ5jrZLduji4V+r9KgTW6Vt1JyAqMehZW/aSTgA9IALXV3HDRMEHMAe43yyCAyok5EwlfPRZUkDUW+f0Da2ENrs7B32f/1e3bCcYg/RnY5l08cUfX1BkHy8QY3LFHGqEtdO9rQmviGg==
Received: from CO2PR04CA0075.namprd04.prod.outlook.com (2603:10b6:102:1::43)
 by DM6PR12MB4602.namprd12.prod.outlook.com (2603:10b6:5:168::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 11:33:08 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::75) by CO2PR04CA0075.outlook.office365.com
 (2603:10b6:102:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 11:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 11:33:08 +0000
Received: from [10.40.100.172] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 11:33:04 +0000
Subject: Re: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
To: Cornelia Huck <cohuck@redhat.com>
References: <20210326131850.149337-1-targupta@nvidia.com>
 <20210401130522.1e9c2871.cohuck@redhat.com>
 <178048b3-8197-856e-af81-66920e60a4d1@nvidia.com>
 <20210407122348.134c7b69.cohuck@redhat.com>
From: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Message-ID: <eceb9c5b-20f5-2d54-20dd-ef32e95c420b@nvidia.com>
Date: Wed, 7 Apr 2021 17:03:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407122348.134c7b69.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b3d255-0699-41bd-d11f-08d8f9b8eb26
X-MS-TrafficTypeDiagnostic: DM6PR12MB4602:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4602129BD661A4329FC74AC4B8759@DM6PR12MB4602.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V383p1W3g2680ZWbCO6HKD0kf8Z7HXKNzz53lLpKt8vWq2cKzEfWdWRPJ3tQkVEJ6hhANZAuO/WdlK9UYvHxkDcHOcKTXUnUPnNdfMyPsiIp0JrwiKSE53eqQoDFjey8AjFKLn8EKS+bQtrWbYGg6hub8cxTYGyq7kBvAkVehi4tPKBwHJsIvXR/UAOxYhbTIuRTFFxmRwqbb1WMnlgDWPY5bCm7bb3lzlAG6FKVN+UyWFLWWOWu2VXNB3BsrkJDL5oeBOHkrlA/pUUFfA0jKNxkS2gCRQovpLVH/ktbllNOVQzj8whQHph/kcrIkhqcGTX3WPMsRm4Yyr0ddc5Mw8S2EZqnhXgjVRfJnCqUtvp73b/HoKnPzjjpCtDPZ29WeBMijF94GPboAgF4riXe3grrgmJjii90sERboUJ12UeoMxVii6QwOOo95X57sqa4lbIldLwHpCNMTjDrDdX1z1g9m1iFMULCD3LhrYq5gZnL1nssv+ZlrUkFHz0axw4DBBWUM4ZOF43PDTeAAarVi4+ztRT02Avj+cppFXn1qNRRd+5fHGN+R7Uuw5w75fyvi7z00GdEp8lEUBOvGhfSklOC9py/R73TzjVv+1RYWaB7/znxcubPbEVf38OFHyxQO+/ivwoGf8ss2xDSOWQI7XHpMU2++Xsj9ddFccAlWC9B6IcdxDfOlj03hyx+eCY1
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(16576012)(36906005)(54906003)(31686004)(53546011)(316002)(70586007)(2906002)(26005)(6916009)(356005)(186003)(83380400001)(8936002)(5660300002)(16526019)(107886003)(31696002)(36860700001)(7636003)(6666004)(47076005)(478600001)(336012)(7416002)(2616005)(36756003)(82310400003)(86362001)(82740400003)(426003)(70206006)(8676002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 11:33:08.6414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b3d255-0699-41bd-d11f-08d8f9b8eb26
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4602
Received-SPF: softfail client-ip=40.107.237.44;
 envelope-from=targupta@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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



On 4/7/2021 3:53 PM, Cornelia Huck wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, 5 Apr 2021 22:32:47 +0530
> "Tarun Gupta (SW-GPU)" <targupta@nvidia.com> wrote:
> 
>> On 4/1/2021 4:35 PM, Cornelia Huck wrote:
>>>
>>> On Fri, 26 Mar 2021 18:48:50 +0530
>>> Tarun Gupta <targupta@nvidia.com> wrote:
> 
>>>> +
>>>> +Similarly, a migration state change notifier is registered to get a
>>>> +notification on migration state change. These states are translated to the
>>>> +corresponding VFIO device state and conveyed to the vendor driver.
>>>
>>> "Similarly, a migration state change handler is used to transition the
>>> VFIO device state back to _RUNNING in case a migration failed or was
>>> canceled."
>>
>> I wanted to keep the statement generic because the VFIO device state can
>> be _RUNNING, _SAVING, _RESUMING. I can use your statement as an example
>> as to how the migration state can be changed back to _RUNNING in case of
>> migration failure or cancel. Does that work?
> 
> So, maybe:
> 
> "Similarly, a migration state change handler is used to trigger a
> transition of the VFIO device state when certain changes of the
> migration state occur. For example, the VFIO device state is
> transitioned back to _RUNNING in case a migration failed or was
> canceled."
> 

Yes, this looks fine to me. I'll update this in v4.

Thanks,
Tarun

