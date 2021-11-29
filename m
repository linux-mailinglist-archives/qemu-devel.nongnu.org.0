Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9CD461A54
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:51:02 +0100 (CET)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhzh-0006QN-DD
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:51:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mrhy7-0004zy-Gg
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:49:23 -0500
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com
 ([40.107.223.49]:12587 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mrhy4-000577-A2
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:49:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rju4PZ1mCBNkqZGWp+OW12WD7QUFwSlalG4KlkCmuJJdo4RIIBdD1chhg0qBHpmsYAWAg7TdNXgMDdZ6Dc93vokvRG7KeTtWwVAqrTpj+hv6U/ABKyYxk/hwIwQB4hdQ5KsaNNXHnBQFj7Z0vVCLXGWp5OjTdN6eaGA0XRrNOg4ecOLB2VC8mDlQ6mXvWrQYZik4AjMrRUCECRbQg+h7xrmQ/52xedJSXJ604H7gQsCQpuHzMW3Q25sEwlToHwOdBdeNtWmxEYr6IEmun7vF29UsmSwiy85W11TspU6dvQ+RF08o92w7rlvuj3fTCvWYYsykLepwFZgy0/jvMv8n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCxrP35GVSndYA73av2BTtmYh/UfcWBwmN2LeJzzFYg=;
 b=cA268WtC0LOcuaEo7QRLBH412nuf5c2B9J547Q6O5YcfPlrgGAk3E9M2e4DuUigmW/e3owYPNUYSvmZUducmJKlyeTnekf0puQdPJNar1zbnegCfKnQKVAYbiC6NbH4lU+pRjgePIVIpaapzl/RaaK0x0rRPIm7jqxen5PcVE6EQYya9/AVx2uU6PtfgBBCLhJcWALEAx9WYYIkT65SZ1z9NK5z8SzJ+BZmtIcRSymDl9OARZSa4oJBMKLDwKayRtlJqz9lwlKduY5PmjsQX3fWtdOS2/LBxxkxlK122cvU+o2U3AzdNGf0UhDtGH+5W2G/sT8FZ2wBHAh4KYBe6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCxrP35GVSndYA73av2BTtmYh/UfcWBwmN2LeJzzFYg=;
 b=yRxCpL64yit9w9rwc6vWdkOUaQ4kWmjhk2enIaPhgdSoZuuiCixdWPzuqkvk/9TaHV58gNCkVGth6fhtveoabmr4ItQZsY2LmZ+MEAJ0OK5KPBc2/MWfkm+/TXHS68Yv2fVYg8adIWN3BOzf3nYnDndfnBDh5L91sg/zWGvqFkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 14:49:16 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:49:16 +0000
Cc: brijesh.singh@amd.com, Sergio Lopez <slp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tyler Fanelli <tfanelli@redhat.com>, afrosi@redhat.com,
 qemu-devel@nongnu.org, dinechin@redhat.com, John Ferlan
 <jferlan@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>
Subject: Re: SEV guest attestation
To: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
 <YZ+SwkDnJii644jr@redhat.com>
 <b5f06218-05d2-dfcf-0570-35758d9be768@linux.ibm.com>
 <7f31b595-2385-b5c1-4aae-633e41c812cd@amd.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <222ca969-9138-d0c3-1c04-87eb157848f0@amd.com>
Date: Mon, 29 Nov 2021 08:49:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7f31b595-2385-b5c1-4aae-633e41c812cd@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:208:256::32) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 BL1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:256::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Mon, 29 Nov 2021 14:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fc31f69-8a7b-4eac-7cb1-08d9b3476aa7
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-Microsoft-Antispam-PRVS: <SN6PR12MB47507534AFBFC965A8CCA63BE5669@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeQM3J05oCxWb8SFc7uWKy+2kgKtb2zXBO6yQ+shba94cCG7BWL/Oy101vB3u9JVIO/LC4m4E4/FfPwpJeOeCIqQxq4RbYq7j/hz+qa0mTzYAk7wokawmQAIm3hNfCLruff3H2grSLWwmHZhhI8j5KwmffKtqEQ27rQ1G72Rknlv07V+Hw4F4kd/c3MHjclVLUAlKFDqctHSI+A+EqXb+C0GKevw3QCkEoWpPsY1765oezqXSYpeDiLgiu1zwRfinsis2gMxU972rRQOBLlCF8aMBOh8gLdfnK3IeWZEMmZn0/s2i1lRlRvu9v6TJ1V8Xf0d9qHsHiNe7mEg0NDYt2q/D/QB82vaYwhPKH108Up5I7AhkpEIePo5Kqh3sYaNgyCvGENL7nsHY6CSBUJCCmlyySadVLoKnQ2nWElJlprFrRdQ1g8yemk+CxmXbZlGTeB3Ga0d26c5S5iECDVTCmGpS0qx55uOd66TCdw2/Fv6un0qp6h3FCAk20dd/YV2BezCzmn6BWcdwmyeovMPWv+v+CAmZfDy/nXktTbKFBaZk/vN0v/4fYLylYaMUNPpEM+i4xOwZSF+ckfTqxiV7VoEz1bQCoH+68YTrqqskd+CADTtk7BJj9O3WRlMfA49sVUP1hlQYx/FRD6epFOmJwlu7BqAFi+hxLMRvoDA0sdt6YHyKLifrwzZiVChWgSxZ+7DRLy8YZBiLJQLLnYiysLJnPJJ5J3Ql6UFcPyfxLnCwQafq80I1jyrzMa0eRXwNn0dltn7HaTYAjCHlk7NeaokuHSSNukva6hMYBP4g1xWmgQ6ZpY88ryBTrgXa0Ds
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(36756003)(31686004)(38100700002)(6636002)(7116003)(186003)(6486002)(83380400001)(2906002)(3480700007)(8676002)(4326008)(86362001)(966005)(16576012)(31696002)(316002)(5660300002)(30864003)(110136005)(508600001)(54906003)(45080400002)(66556008)(26005)(66946007)(66476007)(53546011)(7416002)(8936002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkw0NklUTUQvY2VOcnRZYnhUaVdKdDRFNGIrWXBRanBrdVdBZFF4cW43VUJX?=
 =?utf-8?B?RnRIMjZMRXA2ZmRFdmRWNStUYU92SVRVZW4wNzJpVDY4ZytiKzRiVVNISDMx?=
 =?utf-8?B?b2hnbHVjL3VuYjI3UytNa2p3Q2N3SUVQSy9ieE1laFBlY1pLTlhab2tCQWZ3?=
 =?utf-8?B?b0lEMHpCR2xpTWlkRUpmSlU0TE11cFpPanRHRlo2MEdvcmFLckNPTE5ZbnM3?=
 =?utf-8?B?Z0t6akJ2bmIwOVpBT3lKQVBENDNubnV4d0NZaTQrL3YxSE5USWxMb0U1cHNF?=
 =?utf-8?B?K1NtNDFqcU5lazRVWjdobjlMRk1RN0hEL2p3a2VYa1lvL1YvdDlaU3h5M2dz?=
 =?utf-8?B?bkhZMW1sK21EN0wrcW9POURNR29MVmxnWUdlenZBSmF1UFNpRnBWWWdySFIx?=
 =?utf-8?B?ZkxxTUNpWDhOdnZkeWdiZTdzalZPNDNqVUtXdkdqaGJJZ3BxcnhrZXg4ckF0?=
 =?utf-8?B?MkdDTGRnWUhKcWNkeFp6ZWd1cWhrYzkvMnl0RFVUU2s0eFZhZzh5TFliT3dR?=
 =?utf-8?B?Rys0UUZmamZjdUI3MldLMDVqWEVFLzZYZGkzOXZ6OGppUGI0WFpNRU5Scitn?=
 =?utf-8?B?M2xIM1ZmaUgvbEw5MkpNR3pPM1h0NTQ3UUpPRVkxYldYNXFBZWlkNDh6RXpr?=
 =?utf-8?B?ZDlPc2lKcVgydytGWmlsNll0WFp6T25YSlNSWW91Tk9SV0M5M3k5VGRseHVn?=
 =?utf-8?B?UDdXWldzTHlxT3JENVNaQ2xwLzZKTzA0NTI1V3dFYzhTMStEcFBVNUpkdith?=
 =?utf-8?B?K3hSbEtqMEFGOEsvd2VVNU5NMmFMTzNGalIxbFZ1REh0MlpvY1pGOWp1aTJw?=
 =?utf-8?B?MlI3RGpYRFBoK0J4ckJmSUh6ZnZTZTRkZGNpbVV2RlZzRmZnTFM4UnEvUER6?=
 =?utf-8?B?aXlIMnJTbXdOS25TYUtVa0lpa25NMVB2YThLUGNWUktTYVZtOEhvTjBTakVo?=
 =?utf-8?B?WXErSFphSmFObCtqVS9QV2NNSnBZMFpGSlJFWVdXcVRZWnNwSDBieWkzeUdz?=
 =?utf-8?B?Nm5QOWFySlprSGI1Ly9sZEx4MGNxN3JCWEdIZ3E1VFZWamFBREFPQStGdm5C?=
 =?utf-8?B?OUtFQWpUUC9HWXM4SXh6NzdZYWxHYjJBQjBwUjRmTFF2WGMwUGk2T3MwQjhF?=
 =?utf-8?B?c1pvVCtOeHFGUUI2Mkx5Q2dZcEp6bStsR3ZxbXVkbmx6eDlzLzQrb3V0UU94?=
 =?utf-8?B?Q3R5bHIzT05EbmcrMDBuY1FZV0dINnh0Z1ZjWFd6R20zMy9TOVMybzZKbHRH?=
 =?utf-8?B?Q3hoQUY3T1VDVDBSeWk3Z3FVa2l1ejF6eFdWSkwxME15MTNxbnZ3QmtidTBJ?=
 =?utf-8?B?RFFXajFiTlAzNXRPUklTTUFkcmhCakh2cHg4a3pJMldNOFJuUmJuS1ZHaHZB?=
 =?utf-8?B?bmJXTFFRaWh4TGJqVG84NkVlNjQvaTA2V2tOYXJmMngyQXdHTlB0Y0dpdUtm?=
 =?utf-8?B?eHNXeWpweDZYcDRFanNJVENIei8reGpjNUtsOEhuOHNoRmJ6MkkxMmQvRUE4?=
 =?utf-8?B?R04xZzdZaFJ1ZHBMREZBNVZ6U2ZTRDQycU55OUkxMHBmS3VEc1ZMMGorcGhy?=
 =?utf-8?B?alZYdEhCUncyOWtqQktKa1d6eCtoMGc2eWhQYmdEQmROalJUSlJ1aUszUzBT?=
 =?utf-8?B?cEVnT0p6YXZjTFYvMlAzN2lla2dkSU9PTXd4RWY1UFIzazJNaUNqeDhhRzF0?=
 =?utf-8?B?c0FPNkV0NjA0YVpmTzl1czArWUttRUU1djN5eitldjVmaUxKRlBPSHNlejln?=
 =?utf-8?B?bWNmRE9QQklseXBVVHUyZ3hRUzJHNWZBMU9EVXpudnpmL245SVR3eEdBbXNw?=
 =?utf-8?B?ek8zSC9JTWlFWkJOVmg3ckJlQWhIK1Z1Ym8zeXJJSlZLQUhGRDNWRWRkdytC?=
 =?utf-8?B?ODlod0dOZ244R1lqVEliVlRuNmFOMUxuRFRUbnh1ejlpRHRsRXJhVEFNOXR5?=
 =?utf-8?B?bVYzRmVRK3luRGdpdFlWZ0xzNmE4aVkzY0R1MjJaRjV1S1VYZzdNQUJMeExO?=
 =?utf-8?B?d0hCTFo2U093UDV5UXpHVmZDSFUwS3ZnSGx1ZVo1NTdUYUhxTlMwR1JlOGt0?=
 =?utf-8?B?SU1Kb1VhQTB6cWliWmZhRnZ1aTNnMmo5UXBEbFJKS1BwU0NWaENjcSsxOGNK?=
 =?utf-8?B?RjhZOTZmcUxJWjNZL3J4S05KcnlzbkswVTg5NTFqM3VJbDJoYXAwNUg4TUlt?=
 =?utf-8?Q?yBXdUaBXlSpexEteSrtuTIA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc31f69-8a7b-4eac-7cb1-08d9b3476aa7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:49:16.5355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4DM8qhCRVx2uomYSvjKG0tTOHRiH9k/bKWtVgXQqTI+V+1hkrmmr/IRZxVZJLKlA+ZQKiu+HvRBiDVfz1ETGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
Received-SPF: softfail client-ip=40.107.223.49;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/29/21 8:29 AM, Brijesh Singh wrote:
> 
> 
> On 11/25/21 7:59 AM, Dov Murik wrote:
>> [+cc Tom, Brijesh]
>>
>> On 25/11/2021 15:42, Daniel P. Berrangé wrote:
>>> On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
>>>> [+cc jejb, tobin, jim, hubertus]
>>>>
>>>>
>>>> On 25/11/2021 9:14, Sergio Lopez wrote:
>>>>> On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert 
>>>>> wrote:
>>>>>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>>>>>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> We recently discussed a way for remote SEV guest attestation 
>>>>>>>> through QEMU.
>>>>>>>> My initial approach was to get data needed for attestation 
>>>>>>>> through different
>>>>>>>> QMP commands (all of which are already available, so no changes 
>>>>>>>> required
>>>>>>>> there), deriving hashes and certificate data; and collecting all 
>>>>>>>> of this
>>>>>>>> into a new QMP struct (SevLaunchStart, which would include the 
>>>>>>>> VM's policy,
>>>>>>>> secret, and GPA) which would need to be upstreamed into QEMU. 
>>>>>>>> Once this is
>>>>>>>> provided, QEMU would then need to have support for attestation 
>>>>>>>> before a VM
>>>>>>>> is started. Upon speaking to Dave about this proposal, he 
>>>>>>>> mentioned that
>>>>>>>> this may not be the best approach, as some situations would 
>>>>>>>> render the
>>>>>>>> attestation unavailable, such as the instance where a VM is 
>>>>>>>> running in a
>>>>>>>> cloud, and a guest owner would like to perform attestation via 
>>>>>>>> QMP (a likely
>>>>>>>> scenario), yet a cloud provider cannot simply let anyone pass 
>>>>>>>> arbitrary QMP
>>>>>>>> commands, as this could be an issue.
>>>>>>>
>>>>>>> As a general point, QMP is a low level QEMU implementation detail,
>>>>>>> which is generally expected to be consumed exclusively on the host
>>>>>>> by a privileged mgmt layer, which will in turn expose its own higher
>>>>>>> level APIs to users or other apps. I would not expect to see QMP
>>>>>>> exposed to anything outside of the privileged host layer.
>>>>>>>
>>>>>>> We also use the QAPI protocol for QEMU guest agent commmunication,
>>>>>>> however, that is a distinct service from QMP on the host. It shares
>>>>>>> most infra with QMP but has a completely diffent command set. On the
>>>>>>> host it is not consumed inside QEMU, but instead consumed by a
>>>>>>> mgmt app like libvirt.
>>>>>>>
>>>>>>>> So I ask, does anyone involved in QEMU's SEV implementation have 
>>>>>>>> any input
>>>>>>>> on a quality way to perform guest attestation? If so, I'd be 
>>>>>>>> interested.
>>>>>>>
>>>>>>> I think what's missing is some clearer illustrations of how this
>>>>>>> feature is expected to be consumed in some real world application
>>>>>>> and the use cases we're trying to solve.
>>>>>>>
>>>>>>> I'd like to understand how it should fit in with common libvirt
>>>>>>> applications across the different virtualization management
>>>>>>> scenarios - eg virsh (command line),  virt-manger (local desktop
>>>>>>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
>>>>>>> And of course any non-traditional virt use cases that might be
>>>>>>> relevant such as Kata.
>>>>>>
>>>>>> That's still not that clear; I know Alice and Sergio have some ideas
>>>>>> (cc'd).
>>>>>> There's also some standardisation efforts (e.g. 
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.potaroo.net%2Fietf%2Fhtml%2Fids-wg-rats.html&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C3c94b09f0cd5450460a808d9b01be1f8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637734456065941078%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=E%2FeaI6JNF2ckosTeAbFRaCZUJOZ3zG0GNfKP8082INQ%3D&amp;reserved=0 
>>>>>>
>>>>>> and 
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.ietf.org%2Farchive%2Fid%2Fdraft-ietf-rats-architecture-00.html&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C3c94b09f0cd5450460a808d9b01be1f8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637734456065951077%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=WEkMIZZp3O5Gyay5jZT8KSUH9fyarNfXy5O0Z%2FpHdnQ%3D&amp;reserved=0 
>>>>>>
>>>>>> ) - that I can't claim to fully understand.
>>>>>> However, there are some themes that are emerging:
>>>>>>
>>>>>>    a) One use is to only allow a VM to access some private data 
>>>>>> once we
>>>>>> prove it's the VM we expect running in a secure/confidential system
>>>>>>    b) (a) normally involves requesting some proof from the VM and 
>>>>>> then
>>>>>> providing it some confidential data/a key if it's OK
>>>>>>    c) RATs splits the problem up:
>>>>>>      
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.ietf.org%2Farchive%2Fid%2Fdraft-ietf-rats-architecture-00.html%23name-architectural-overview&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C3c94b09f0cd5450460a808d9b01be1f8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637734456065951077%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2FwNFMGAfojFZyGIj79D5%2BW%2BRPPuwumJiqIrf5UVrkPU%3D&amp;reserved=0 
>>>>>>
>>>>>>      I don't fully understand the split yet, but in principal 
>>>>>> there are
>>>>>> at least a few different things:
>>>>>>
>>>>>>    d) The comms layer
>>>>>>    e) Something that validates the attestation message (i.e. the
>>>>>> signatures are valid, the hashes all add up etc)
>>>>>>    f) Something that knows what hashes to expect (i.e. oh that's a 
>>>>>> RHEL
>>>>>> 8.4 kernel, or that's a valid kernel command line)
>>>>>>    g) Something that holds some secrets that can be handed out if 
>>>>>> e & f
>>>>>> are happy.
>>>>>>
>>>>>>    There have also been proposals (e.g. Intel HTTPA) for an 
>>>>>> attestable
>>>>>> connection after a VM is running; that's probably quite different 
>>>>>> from
>>>>>> (g) but still involves (e) & (f).
>>>>>>
>>>>>> In the simpler setups d,e,f,g probably live in one place; but it's 
>>>>>> not
>>>>>> clear where they live - for example one scenario says that your cloud
>>>>>> management layer holds some of them, another says you don't trust 
>>>>>> your
>>>>>> cloud management layer and you keep them separate.
>>>>>>
>>>>>> So I think all we're actually interested in at the moment, is (d) and
>>>>>> (e) and the way for (g) to get the secret back to the guest.
>>>>>>
>>>>>> Unfortunately the comms and the contents of them varies heavily with
>>>>>> technology; in some you're talking to the qemu/hypervisor 
>>>>>> (SEV/SEV-ES)
>>>>>> while in some you're talking to the guest after boot (SEV-SNP/TDX 
>>>>>> maybe
>>>>>> SEV-ES in some cases).
>>>>
>>>> SEV-ES has pre-launch measurement and secret injection, just like SEV
>>>> (except that the measurement includes the initial states of all vcpus,
>>>> that is, their VMSAs.  BTW that means that in order to calculate the
>>>> measurement the Attestation Server must know exactly how many vcpus are
>>>> in the VM).
>>>
>>> Does that work with CPU hotplug ? ie cold boot with -smp 4,maxcpus=8
>>> and some time later try to enable the extra 4 cpus at runtime ?
>>>
>>
>> AFAIK all generations of SEV don't support CPU hotplug. Tom, Brijesh -
>> is that indeed the case?
>>
> 
> I think we may able to do a CPU hotplug on SEV but hotplug will not work 
> for the SEV-ES and SEV-SNP. This is mainly because the register state 
> need to be measured before the boot.

Tom just pointed me out, theoretically we could do a hotplug of CPUs 
under the SEV-SNP but I will need to check the security team just to be 
sure that we are good from the attestation flow. I can update you guys 
on it.

thanks

> 
>> I don't know about TDX.
>>
>> -Dov
>>
>>
>>>
>>>>>> So my expectation at the moment is libvirt needs to provide a 
>>>>>> transport
>>>>>> layer for the comms, to enable an external validator to retrieve the
>>>>>> measurements from the guest/hypervisor and provide data back if
>>>>>> necessary.  Once this shakes out a bit, we might want libvirt to be
>>>>>> able to invoke the validator; however I expect (f) and (g) to be much
>>>>>> more complex things that don't feel like they belong in libvirt.
>>>>>
>>>>> We experimented with the attestation flow quite a bit while working on
>>>>> SEV-ES support for libkrun-tee. One important aspect we noticed quite
>>>>> early, is that there's more data that's needed to be exchange of top
>>>>> of the attestation itself.
>>>>>
>>>>> For instance, even before you start the VM, the management layer in
>>>>> charge of coordinating the confidential VM launch needs to obtain the
>>>>> Virtualization TEE capabilities of the Host (SEV-ES vs. SEV-SNP
>>>>> vs. TDX) and the platform version, to know which features are
>>>>> available and whether that host is a candidate for running the VM at
>>>>> all.
>>>>>
>>>>> With that information, the mgmt layer can build a guest policy (this
>>>>> is SEV's terminology, but I guess we'll have something similar in
>>>>> TDX) and feed it to component launching the VMM (libvirt, in this
>>>>> case).
>>>>>
>>>>> For SEV-SNP, this is pretty much the end of the story, because the
>>>>> attestation exchange is driven by an agent inside the guest. Well,
>>>>> there's also the need to have in the VM a well-known vNIC bridged to a
>>>>> network that's routed to the Attestation Server, that everyone seems
>>>>> to consider a given, but to me, from a CSP perspective, looks like
>>>>> quite a headache. In fact, I'd go as far as to suggest this
>>>>> communication should happen through an alternative channel, such as
>>>>> vsock, having a proxy on the Host, but I guess that depends on the CSP
>>>>> infrastructure.
>>>>
>>>> If we have an alternative channel (vsock?) and a proxy on the host,
>>>> maybe we can share parts of the solution between SEV and SNP.
>>>>
>>>>
>>>>> For SEV/SEV-ES, as the attestation happens at the VMM level, there's
>>>>> still the need to have some interactions with it. As Tyler pointed
>>>>> out, we basically need to retrieve the measurement and, if valid,
>>>>> inject the secret. If the measurement isn't valid, the VM must be shut
>>>>> down immediately.
>>>>>
>>>>> In libkrun-tee, this operation is driven by the VMM in libkrun, which
>>>>> contacts the Attestation Server with the measurement and receives the
>>>>> secret in exchange. I guess for QEMU/libvirt we expect this to be
>>>>> driven by the upper management layer through a delegated component in
>>>>> the Host, such as NOVA. In this case, NOVA would need to:
>>>>>
>>>>>   - Based on the upper management layer info and the Host properties,
>>>>>     generate a guest policy and use it while generating the compute
>>>>>     instance XML.
>>>>>
>>>>>   - Ask libvirt to launch the VM.
>>>>
>>>> Launch the VM with -S (suspended; so it doesn't actually begin running
>>>> guest instructions).
>>>>
>>>>
>>>>>
>>>>>   - Wait for the VM to be in SEV_STATE_LAUNCH_SECRET state *.
>>>>>
>>>>>   - Retrieve the measurement *.
>>>>
>>>> Note that libvirt holds the QMP socket to QEMU.  So whoever fetches the
>>>> measurement needs either (a) to ask libvirt to it; or (b) to connect to
>>>> another QMP listening socket for getting the measurement and injecting
>>>> the secret.
>>>
>>> Libvirt would not be particularly happy with allowing (b) because it
>>> enables the 3rd parties to change the VM state behind libvirt's back
>>> in ways that can ultimately confuse its understanding of the state
>>> of the VM. If there's some task that needs  interaction with a QEMU
>>> managed by libvirt, we need to expose suitable APIs in libvirt (if
>>> they don't already exist).
>>>
>>>
>>> Regards,
>>> Daniel
>>>

