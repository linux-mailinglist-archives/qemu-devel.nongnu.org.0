Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B749EB26
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:37:33 +0100 (CET)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDAaK-00035J-EQ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:37:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1nDAHI-0004yp-TD; Thu, 27 Jan 2022 14:17:55 -0500
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com
 ([40.107.93.45]:40289 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1nDAHC-0007aN-Jk; Thu, 27 Jan 2022 14:17:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWf5SbqEK34qp9oZF3Ceor0hIQqfUgPZcRb/GQmf/bePSSxxHVa0+BdowzM7LO3cIdPd97gUa3TV1BWiq6iHVunmIN1A7XhYRUnA3ALx0X0CT6YF/rzx4TVdwI/xHjZiWFK8wa2UROaWZF+2nhnHup5WKUTu9sXdjKeNRAJvy1qm95ve6qnqcyW13MTBeT5ta/ayTdC5SyZpUF79FIDRLZj9oC30oodaZ2ehpokioxGx9eo0HFfRB3xQcjtebXEM8WmAHJmtfR/z6WhUtArAE5mNnJ6RZnQPuRV8l22WYaFNJdgMxBrM/lzUxHyvyfWOKC2ay1/R0x6hug5pDvD5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIHOHdCuk+koE/2+Pkhemx+sXUQmg5CfYYIIroNdoEE=;
 b=TcqxhkC0ECU0QGEOU8X0dV4y4MA5w2Ypyp3iVA93DLtconLt/leSjffxKoSjdrQr/eVg4xuux5kaqLWiof9idIrGFxkjdnizARZtUQWyy4zf1Ui0X1BFNDR0l4zRCo08jywjbLITEC56L/y/1ah6mDnlWEOfNwB0tBRJUHyS/IOq2T/rjgp5SttbSYUUfxnYHZeimBYOA5izTDNeivuWIR5TOlZaWj6DKizysLTE1S/QQh7j0aWHnXABiWmI+/rStqpYkDfMFpunm+FARtXtl7Q7HMPpxJ4PIdnWjBztWFGIqs4TX4iIVk1S2/WOU4lWDJJe3GOpnV+UyTzAYxtSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIHOHdCuk+koE/2+Pkhemx+sXUQmg5CfYYIIroNdoEE=;
 b=x5YlnLDMYGFHy44CxsEgOVC+TRY4Rhi9s27X2CnBCQfJwGLG3QXlY7FIyoYOEdtcAWsS8S3qhfLJ8cj57KbkfIEoKpRBw3bnumYueF0f6jLdHXngT4xINf2uPtUWgwtEcTsU3gquYMGN6Rqy/durnuh4GRXqvoTiJ2LZIXMTNYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by MWHPR1201MB0173.namprd12.prod.outlook.com (2603:10b6:301:56::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 19:17:41 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c%6]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 19:17:41 +0000
Cc: brijesh.singh@amd.com, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jakob Naucke <Jakob.Naucke@ibm.com>,
 qemu-stable@nongnu.org, Daniel Henrique Barboza <danielhb@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 qemu-devel@nongnu.org
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <fd1251f8-1d39-9ce6-3824-10c397ae8c32@amd.com>
Date: Thu, 27 Jan 2022 13:17:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220127142800.11d8f1be.pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:208:329::19) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a68ba0cd-b3c5-4429-5555-08d9e1c9b078
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0173:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01735EE5EA759F1813248DC5E5219@MWHPR1201MB0173.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:211;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrThTn1zbtRaQFUaFhEdVRaLaTUVPSl9ZBy0xZuuFK5UVj0Yz6GF7L73SQ/kHK0qbq+DG7LeUvOP3OmimTtOvZnpES/OncO0KXPymfO2KBqfVwwvaa7yjgjR9qCShne9hUkFRW+frvZssBwteFnTGf140eWy/tWDozOo5jTJH4n52Q7cC/krO/K3KTETRQHzI2rO2jrOstkLivJzcvz1IX9iz9aaOmNKwwnzuRM8GVStMk7ejvCJwsezwTc29D8TYstkUr1IdOz/eVz/ev0rqEmA0HGxwmAeOx7ly1cGyXZvYAPxA8S9oSYM2GEArz/j64lnqz0v96yeUn133JOeTQ+jSEKyuJVgcw4hkqIJhTrZfKCeO8SKCIW1/5z7p/7ps0XMgsKX7CvoxjKfrTz4TLf0s5HpPd0ryQOLRIWkdSpp1AAAbDQb8R4rcwvZOcl4PgqPB17dSZsqS4PAtGPK/RigouU0LAZmJqfRW5IhKAT0oNziFL2xN12pDQmxdKFqt69n5Dt0oE0LGDu4+fn52c2/jyZYSw15+BSRUbYdxo5MXSkmZSIvSodSH4MV9/nKPw/Hzr+1cZOT+zBAa3pDe2+eLe2SoBoAcFIaJwkzRyy2CBy9wX1+LNLmxD+Fpr3bl6gPsGoFrXcjCEHDiSH3+t/+c/lejZputvkLZolAmw6Rg0WYylysywHzRnbrxO0nBX6/utSOOCGJ557/ISRHBlad4JXp49Qc+ywpgKRpgpAUKgaz1gsntAr5rzBWOFci
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(316002)(508600001)(54906003)(110136005)(31696002)(66556008)(44832011)(38100700002)(4326008)(8936002)(66476007)(8676002)(66946007)(2616005)(6512007)(2906002)(5660300002)(6506007)(31686004)(86362001)(53546011)(83380400001)(36756003)(6486002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG53aVFIQnhKMkRZUVUvK25zelA2Q2l5NGNDdStETVozRDh3SVBoSFBrT09a?=
 =?utf-8?B?Q1pETDhHT05RUitYNDZwcG5UdktINGJVWWRUeGtUQWh6K0IxczVBOEM4ZUly?=
 =?utf-8?B?Skw1K3I3a2NvY1NTYmZoRDJtb3Z1bXNDVHlpbFZ6OWdSWGhlaEswYWVoQURJ?=
 =?utf-8?B?dnlQRzVRWUFiYkJFaFhWRC9HR2VJQW9wRkNEM2R4RnpsTjVZa1dSOGpiWExV?=
 =?utf-8?B?VGpkaVBvSXVGYlluSlQ0SEg3dzlLOGlFV3N4NEJHYU1MemR5RVB5aUtvTmo2?=
 =?utf-8?B?c29DUWd0UGkzQjJhck52VVpuMkl5eGNwaDhDeUVOQStPTUxMbDFnQlV5Z1Z3?=
 =?utf-8?B?ZUdIRmNiNDdJNlpGYTNyVmFyZWtEbEowbUNnb0I5RlV0RWJxZUszNjNkV21s?=
 =?utf-8?B?WG1mdDMrTUl6bFRrbkpIdTNGM1hPaFR0MUZ3M3RVTVFoUEpRYkpyZ2Z1UXVM?=
 =?utf-8?B?ZlhIbFV1bVZNaW9vdVVyaTY3QUxJaGgwcTZKS2RQMjFsckhCZi9QN2xDT1Ny?=
 =?utf-8?B?MG5ZTU9CdzVwZUF6VkdVZ09EcFpERXpNZnhiS0Y2bkJrMllwU29DT3N0ZWRx?=
 =?utf-8?B?UjZCaDQ3R0dIbDJkYzdBNXd4K3BDRThlRFQ1YWJhTFI2bDljeUMrYklHUkp2?=
 =?utf-8?B?d3hmVVdYVFZsNnJsRWtTWTRLSFhLNlI1U3QyL2UycGF4Q1dlV3M2YytTMGRn?=
 =?utf-8?B?MVZJWFEyanAxMUJLb1I1Qk9RcWxxZW5TR25PaGd5Q0ZjSWMyUC8ySlZQcTIz?=
 =?utf-8?B?V005bXYxQXk4QkhmZE8wTUJVM0ZaVEw1dS9tTzJlNnJRWW03N2dSdkh2MEI0?=
 =?utf-8?B?dExVTGV0VWRSL2R0eEVKVzBzZjNCTktTOVg2NEUxUVpXWXJHOTAyZytCZkJU?=
 =?utf-8?B?OGJYcXQ5MmxGbVgvb2UvT1dnWldNajlVZ3p1SytreW91cjloRTJqd3R2ckRQ?=
 =?utf-8?B?YkM3cDNSa3hUbUNMRjJKV3JtR0src3JYVkN3S05rSTFlamFIMzhoQ2pyd0gx?=
 =?utf-8?B?OHoxdnA3RFA4T2ZoUDArRmQ5alhiRitJNnlML3llTDdLUHBKVnVqNkEwSTJ3?=
 =?utf-8?B?MzE3aTF4ZTZaV0l2bE1sMWg1eUc2bXEyRGw3aFFHYUZMNHRsSTVOUnFTQ2Vj?=
 =?utf-8?B?Wmp4dkVCZm10U3JzY3BSZU5FYlI4cGsvejZVbjI5eEZrc3BxQUtLY3l4UE5J?=
 =?utf-8?B?a0UxQTM3R0ZXNXMyZEVRV1ZTa1V4Z1AvZkZpam5Xdy93ZTMzL0U2RFJiSFBB?=
 =?utf-8?B?SDk0S0h4WTlQN083QzY5NFM4SUp1Mlc0NTJRVzdlS3Z4KytEblNSL29lanlU?=
 =?utf-8?B?ZW8zMER4cWtDcTVOL3g1c1JXaU1RYjJCdmREdUdnMGM3VWNEaERocFRQM3Fn?=
 =?utf-8?B?WmlpaTdWanQrODVvZ1dBcktEaS8rRWJMZTJRUVJ4T2lxQTJMZXdxR0s2VldO?=
 =?utf-8?B?YVdiWk50NWtwSnFGRVVqWWNIUFNDa09PMDFkWDRvaWxuZWdKVjltQ1U5MDNK?=
 =?utf-8?B?VkZJZk43bWw2VTNReWQyd0h4THJHY3dPenFlOW1Qem1PZDE5TE5qaWcxSXJ5?=
 =?utf-8?B?dnpRc0hTd1dQOEVOKzVZOEV5ZFNFSmNhM0ZPN1dmNmI4NWJscXhYczVtNng4?=
 =?utf-8?B?SnJ2SHJ6UjFuYVVWL0lKZWdYc3NqWmU2dmE2aFAxNUlXUlRMc20ydHY3dEpv?=
 =?utf-8?B?ZjR0cW5zM0x2L1V2L1VMMlFYWVZLWk1jcTVtbnhxc0JUU3VUcG5DUzZEQzhI?=
 =?utf-8?B?UzM4Z21uVFI2dU1OSG8wRjdheE9UaFRscWpnNlZ5K0IvYUdPUUdOaHVnOW52?=
 =?utf-8?B?cDNGYUlFODlLMzZmREZyNEJqajMzcEZ3RVpqVDBjMXZZZ0tXMEVNSisyckVT?=
 =?utf-8?B?ZmcyUHg2N05JcThXS054RGNacFdqeUVYUDhXdWx1R2pUQUdjZVBxWEZLdmFS?=
 =?utf-8?B?OGNRTEhZVHBtMDFQaEFXV2dZbktmTFkwUTE5S2hEN2d4RTFnVEtEb2lCTHN2?=
 =?utf-8?B?dmdTcGNBZ3R4S2tUZSsvdGxCTzV1OEUwbmtkbXpRbVZUcmIvc1BWc0docFJX?=
 =?utf-8?B?K3dvd2gvbnpBS1Zva0RxbVVFTmh0SXVuOXowYmE4ekE5VjZRNnNSUExEY2U3?=
 =?utf-8?B?a2YyZVg1dERJZmpFUzA5SG1UQXl6TFNvMkdIRWY4NXJZUDZoK2gxMThKUlQ2?=
 =?utf-8?Q?PkhO1ab3xiWxPacXJlu93cU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68ba0cd-b3c5-4429-5555-08d9e1c9b078
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 19:17:41.7806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhdUR1LgYs0EucTcaEXodLndziSgPdC96t17fbw3YSjE2fv9HndzcTuUqOSaaiYhujJbG6sZCW9eOEUQoRO4Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0173
Received-SPF: softfail client-ip=40.107.93.45;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



On 1/27/22 7:28 AM, Halil Pasic wrote:
> ping^2
> 
> Also adding Brijesh and Daniel, as I believe you guys should be
> interested in this, and I'm yet to receive review.
> 
> @Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
> too, and that the fix works for your platforms as well?
> 

Thanks for looping me in, I can confirm that SEV virtio-fs device 
support was *broken* on the latest qemu, and your patch fixes it.


Tested-by: Brijesh Singh <brijesh.singh@amd.com>

> Regards,
> Halil
> 
> On Tue, 25 Jan 2022 11:21:12 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> ping
>>
>> On Mon, 17 Jan 2022 13:02:38 +0100
>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>
>>> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>>> unsupported") claims to fail the device hotplug when iommu_platform
>>> is requested, but not supported by the (vhost) device. On the first
>>> glance the condition for detecting that situation looks perfect, but
>>> because a certain peculiarity of virtio_platform it ain't.
>>>
>>> In fact the aforementioned commit introduces a regression. It breaks
>>> virtio-fs support for Secure Execution, and most likely also for AMD SEV
>>> or any other confidential guest scenario that relies encrypted guest
>>> memory.  The same also applies to any other vhost device that does not
>>> support _F_ACCESS_PLATFORM.
>>>
>>> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
>>> "device can not access all of the guest RAM" and "iova != gpa, thus
>>> device needs to translate iova".
>>>
>>> Confidential guest technologies currently rely on the device/hypervisor
>>> offering _F_ACCESS_PLATFORM, so that, after the feature has been
>>> negotiated, the guest  grants access to the portions of memory the
>>> device needs to see. So in for confidential guests, generally,
>>> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
>>> about the addresses used being something else than guest physical
>>> addresses.
>>>
>>> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
>>> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
>>> form the vhost device that does not need it, because on the vhost
>>> interface it only means "I/O address translation is needed".
>>>
>>> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
>>> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
>>> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
>>> by the device, and thus no device capability is needed. In this
>>> situation claiming that the device does not support iommu_plattform=on
>>> is counter-productive. So let us stop doing that!
>>>
>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>>> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
>>> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>>> unsupported")
>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>> Cc: qemu-stable@nongnu.org
>>>
>>> ---
>>>
>>> v1->v2:
>>> * Commit message tweaks. Most notably fixed commit SHA (Michael)
>>>
>>> ---
>>>   hw/virtio/virtio-bus.c | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>> index d23db98c56..c1578f3de2 100644
>>> --- a/hw/virtio/virtio-bus.c
>>> +++ b/hw/virtio/virtio-bus.c
>>> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>           return;
>>>       }
>>>   
>>> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>> -        error_setg(errp, "iommu_platform=true is not supported by the device");
>>> -        return;
>>> -    }
>>> -
>>>       if (klass->device_plugged != NULL) {
>>>           klass->device_plugged(qbus->parent, &local_err);
>>>       }
>>> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>       } else {
>>>           vdev->dma_as = &address_space_memory;
>>>       }
>>> +
>>> +    if (has_iommu && vdev->dma_as != &address_space_memory
>>> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>> +        error_setg(errp, "iommu_platform=true is not supported by the device");
>>> +        return;
>>> +    }
>>>   }
>>>   
>>>   /* Reset the virtio_bus */
>>>
>>> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
>>
> 

