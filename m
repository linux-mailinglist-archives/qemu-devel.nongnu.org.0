Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FD461A4B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:49:58 +0100 (CET)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhye-0004zt-Q5
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mrhxW-0003t0-JE
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:48:46 -0500
Received: from mail-dm6nam12on2084.outbound.protection.outlook.com
 ([40.107.243.84]:22208 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mrhxR-00051G-Cf
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:48:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7TB7On4mJk+HAeYtkU+yg0ABqAx1+2XH8B1i74/ECTnQB2V8439c7wLYa1p7ociACHcV7tvR5vvc4E84qW0re4kjK8FVNmtwl2sh856+rjB6SGqvUGzIaw4ps4a3kyIhrc+gyeQyLkwjXQMkdYT+eDRhcHIHbJ/bcNjVYHx/9NCg9Qc0u/gytcRp5hf8Au2KG1cset4yzsNjp1izV+D9KwJf98PQJ/fqwEsFPDglq+qyKfW5vIWdeLLECzmaOrM7wub2sN6f5tyKDLn8V9Jw4Vfs4ne72b4l1DYPZQQySyWupGyR9c4wflXfRgeG2Zn6S+S7HfcewW+Gxy/W7oV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AghrZzOBgjlum7WBBXtMrTDYJ1DIGcjdHj3gJsr/Lb0=;
 b=VTuB0ML4Se5AAf/iLqinc8+WKHQKonGDLh5OLkjhZ/4Ur0eT0jLJdNBe8kHlJ8gvARQRNUqn98qmZBl4fLh2dFEL+Jr06LcJyfJ6fYB6QCEY2wXHXHxconDfjch0WLoqb5De3HzJWNCPICOLPf8Np4hqzB6MUaAhqA1iPyjjt9DQ0I6CxaedlJd6nZ682G9h8x3IlfQKOi5rtUaG36ve+qIl1q3NqJ+9mWeQdoIfy8Lmj8p8hd5zYo8X3HX5AYxq3+n4zc1ZwTv1w3opeoV/rMQTVyf5LnzReQO+Nr+k0WqyMDms/SRGJ+VM7kqdG+6uQdgHX3itBuea1e1o2FcuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AghrZzOBgjlum7WBBXtMrTDYJ1DIGcjdHj3gJsr/Lb0=;
 b=cDvu4tkJicLuWgK91vk4gZzSRsjUipLfRUUXUKZRyR/o8POUYgSOK9zq6Suxe0A5lZzdTNj32wJMtMIXZ8a102+cD0KEoKdzI/duIxg4IznjYvueU1QgBdlUpWZ9+l2aNyn8Aex2l/FbqSXrR2DcjEc4yei3MIRWWd/NsWSvCZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 14:29:11 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:29:11 +0000
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
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <7f31b595-2385-b5c1-4aae-633e41c812cd@amd.com>
Date: Mon, 29 Nov 2021 08:29:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b5f06218-05d2-dfcf-0570-35758d9be768@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:208:134::25) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 MN2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:208:134::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Mon, 29 Nov 2021 14:29:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 830fdd59-38a0-4c47-6a39-08d9b3449c25
X-MS-TrafficTypeDiagnostic: SA0PR12MB4430:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44302141A25087FF3B8FB356E5669@SA0PR12MB4430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 55QB+RgrGdQQMBxrFRbxiG+u5PHAq8nBXdQZEouRMIQGiiPwTDnXBtxyGLxJBhkNHjdmBCPR1AdFEfCa4ju9Z2l/5iylz1qBCn/+6NU/OLHZM4Fd8F/ARRYiwSV6xaAb/Q/0TsXdnxtmr3CFDQI3WL59M0bCdEZf12dQRBqCfYK37O9uK0PBMZPj50z7cBAVFxYx+ZcQ1mxIGUy9NW639RI579VgjZfYlhiKw1xqWkmbhFRPM5mo0q65TthIqkAlMPXdS3HxKivefaabpuwGZ8y5HcUM5IStE1IiEXV7+9rfCqaLp3oosBurQIAQ1Kwe2uQ826FWgwu6lKRPOee0o7OUcee03+IcFGd9J3+6yCiwnmPpIUrqPzzFf0HssE/6ZSix8tK8/w75AOO/J6qL1II/WOeMq1qiQrq4+xWSKHM+UbB8r3B0iQFZHgRTPQg9pdBegXBF1JLjHSSZmAXc9rNkE3hhVPkvdGY38aY9bdKvtp3romtJcGkpTOyBRzJ3gBaT6KZ5wrn+eZKTwgIL4/iWfuYrsK7JZ9m9+Ya0ZDcsv8373E13NhNIMiso39O2Nuv4bp/Ap0rYwE8j9jB5hQv5mJGOc/1P15k+BtLdQCfF6fkkocOOGAZEA3G/2FhxHXFfrXM4FPD5PPE8GbNM9yGHJFd9S2DfnXmp2JWOZnWN+rcy3oB/cLgzzoS57kHYO4jQ/nb3WuDKneU+WtH//yDBKXVQEf0aaK85GR/ok9F8IB+Bo9v0+ACaaHsn/8A/xpaCe8Z2RKXyCZxbkqOzrbDu5dNdk96KB2MkGWRiWklfytzpMgoL3d27RxsyDauN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2906002)(30864003)(83380400001)(3480700007)(6636002)(66556008)(508600001)(44832011)(53546011)(956004)(966005)(38100700002)(26005)(5660300002)(7116003)(8676002)(66476007)(31686004)(7416002)(66946007)(4326008)(36756003)(316002)(2616005)(8936002)(45080400002)(186003)(54906003)(16576012)(6486002)(31696002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNRRDIreGNyNGZmR0g2WWliWTZ6TVNxUGlLbytZZ00vV0NCQmhEYmlnWktB?=
 =?utf-8?B?Tno3UFFnaHRrbFpsbmtvS0xVVWJNRXB0Y0gvZ2Y1V3loMmJIWDdSTnRYUXVa?=
 =?utf-8?B?MENCYmlMVzI5aVBxUURrRWJWWW5SVTg4aGF6KzhwZlZ6QTNpcDM2akpneTlY?=
 =?utf-8?B?cWJBZFRIeUZyV3hhR3J4NGtVOG9qRmRmWDJwUm4vY2FjTVRYbWFhY3VuK1cy?=
 =?utf-8?B?cHpBeTJpYm1lTlNKUUJGczBvZmJ3WE1wdFJ3TFhFVHpMT3BqaDZ1UVg0Q2Q0?=
 =?utf-8?B?NXlGa0FsOXFpL0d3MnVYNnZjL1RFSlBENVBzRTJXWXdmUE82QW9ySWg4NzNm?=
 =?utf-8?B?aXVkcVhwMXg0ZFpNZmFKblVXYUlBNHZxa3ZQNUJaUCtKOEUvUnJiOFJrbFpE?=
 =?utf-8?B?UThpV3dyc2pvN0RkSWs0blRwOUFGNVRzU3J2YU5kdlNpaTc2Z21ES0ZXNWR2?=
 =?utf-8?B?blBlOE01d013RElEa0lQa0JKQlhTaGRxaHYvSWdVWGtJdHJqZy9oT3RXRFY4?=
 =?utf-8?B?K296U0l5aGFnNEpQZ2ZwS29KM2FaSGFmQnBjMkNtaHBFVGxEblYrcVBRQzVC?=
 =?utf-8?B?WDRSNkgxWUhxcmJ4K2laazU2bVF1dWdpTmhyQ3VxWXRLNzBIUE5GUmFVd2xM?=
 =?utf-8?B?b1FZcWp4ZWZxUjc3TmdmeVdMR3lodjUxdkZPVGNPSmdsOHVubmZxc28rQ1Ay?=
 =?utf-8?B?NktvcTFvNGFxRU5pQ2taYmFKYVJLNkFkQ1l1YlNhWEppaE1sc2xqVXdBZDNt?=
 =?utf-8?B?NFlINlh5bG5PM1Bkdzc2eGxCMkJOZXVNK1JXRzRrU3ZDVlJRVWsvd2Fvc0kw?=
 =?utf-8?B?Q1NoaVFDL3doNE1KUml6Z1BLVE1jNEp3VnVjeWJvbU5yb0xjeFZaVHZzSmlJ?=
 =?utf-8?B?OFIvNmFWSk0zSExrR253Z1BOTXVJTTQ3Y2xFcldFWGFYOG4yeENsUm5zVWhx?=
 =?utf-8?B?bjM0UUIrd25BZjd0SHg3aXBjTEJVeWpCbG8xSlBqTGJBenNkZThYVFFmbXVx?=
 =?utf-8?B?U2NLVjRmTThBWXFseFJELzNxNEZCRHU3QmY4Ti82TGYrOWFzQ09MODJRcFY2?=
 =?utf-8?B?NkovcUZaMGhPRWo3aVNaTlpoVlRpcnIwK0UxbHVDZU1LcTRuRmIrUDVSU1VC?=
 =?utf-8?B?NmJSOFgyK2ZhOXoveXp3WTlmTlpXdFdxZXM0TDZiSVVoRUJ0VndHVEVHMlNh?=
 =?utf-8?B?elYwSVpxOVdiNTd4UmExT2liTE9mSG5ISXM3SnFjVlRlWEFielRscGRrbmE1?=
 =?utf-8?B?QVIxNlZsMHVCcmRUMXZ0alFwQ0xzbnFTQWRZa1dmdXNTUW93NU9KTndjZmFo?=
 =?utf-8?B?aWdqVVcwNk5xdm02RTAzb29SY0J3RlQvbEs5OUdsMk1YVk5Kbi8yTWpleldh?=
 =?utf-8?B?VXZhbnpYOUJSS0JlMk5jMDhqQ2hqMVlUR1RWVkM4TVF3WUNncm4rWmZoOXNj?=
 =?utf-8?B?WEZjdnZIdDlmamM2TnIxUnRObnQ1ZGdkYnExUCs1bCtUS3pCaXR1MWswVU9n?=
 =?utf-8?B?VzlTT2RGRVBzL0JjVEpPb3hQam5NUGRZUCtkYVdyc1VXRTNUQzBSclRUNFU3?=
 =?utf-8?B?aW40NldWZVVPUUFUOW5SWUNUV3JrSEg2WEQ4OUc4eGdHMFc3Sm9MTWJGTitX?=
 =?utf-8?B?N0Roam1pNDBQUW1QTkVaYm0vVmZmbVA1dG5rdFRTMER1TW03MU1UNXdXVElZ?=
 =?utf-8?B?YzZoQUVxeHFVT3ZMejgwSzREK1RxbjhXRnBiS2l4UUFlZUs5NlA1ZGRsd1Rw?=
 =?utf-8?B?Mk84b25mRTh2ckNRL3I0b3NsTFY2QjZ3Ky9FYzQvRWpHcmJOMlVVS2t0T1gx?=
 =?utf-8?B?TXV2VFNiVnhRZzBiY1FHbjZiU0FmYTVLU3o1a3NsUFFUbGpGZEhLNWFCSUd4?=
 =?utf-8?B?M0tPd3RWTVBTeCtMOE1WUk83K1FvTmZ2YXpWeHpPQXQ1M3ByNjFzWUphMFVt?=
 =?utf-8?B?aFdZYlMxWDZSbWszWTZyVWZJNDVOc2o4aENlUVJDcGFmeGFkbFJsbFRJcC9q?=
 =?utf-8?B?WFN6M29ybEtLcG9hVVEwMmJ0V1F1d1E0VCtYdEdQbzd5a1gyVS9JTjZsRjMz?=
 =?utf-8?B?RUlKZFcrMkQzZTFXcjdML1hXbGpwN1BMVEo4UW1uNTdBR3BMczNZTlljSUpm?=
 =?utf-8?B?T1NkRXpOdTlmYnVPR2FGdS9SR1pjU3dOSUJIRmtubG9pY2NMQWJYRzBranZE?=
 =?utf-8?Q?cwKnywqXKQIoHSyKODETNa4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830fdd59-38a0-4c47-6a39-08d9b3449c25
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:29:11.1250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWE37UY9zGgkVsV1t0+I6ewRb+MaHyY7SIZUOWjNIKj7FqDFrBagaFkyMOMVAUG1bjcphKRf38NzhQ6YnZ+vKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
Received-SPF: softfail client-ip=40.107.243.84;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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



On 11/25/21 7:59 AM, Dov Murik wrote:
> [+cc Tom, Brijesh]
> 
> On 25/11/2021 15:42, Daniel P. Berrangé wrote:
>> On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
>>> [+cc jejb, tobin, jim, hubertus]
>>>
>>>
>>> On 25/11/2021 9:14, Sergio Lopez wrote:
>>>> On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
>>>>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>>>>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> We recently discussed a way for remote SEV guest attestation through QEMU.
>>>>>>> My initial approach was to get data needed for attestation through different
>>>>>>> QMP commands (all of which are already available, so no changes required
>>>>>>> there), deriving hashes and certificate data; and collecting all of this
>>>>>>> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
>>>>>>> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
>>>>>>> provided, QEMU would then need to have support for attestation before a VM
>>>>>>> is started. Upon speaking to Dave about this proposal, he mentioned that
>>>>>>> this may not be the best approach, as some situations would render the
>>>>>>> attestation unavailable, such as the instance where a VM is running in a
>>>>>>> cloud, and a guest owner would like to perform attestation via QMP (a likely
>>>>>>> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
>>>>>>> commands, as this could be an issue.
>>>>>>
>>>>>> As a general point, QMP is a low level QEMU implementation detail,
>>>>>> which is generally expected to be consumed exclusively on the host
>>>>>> by a privileged mgmt layer, which will in turn expose its own higher
>>>>>> level APIs to users or other apps. I would not expect to see QMP
>>>>>> exposed to anything outside of the privileged host layer.
>>>>>>
>>>>>> We also use the QAPI protocol for QEMU guest agent commmunication,
>>>>>> however, that is a distinct service from QMP on the host. It shares
>>>>>> most infra with QMP but has a completely diffent command set. On the
>>>>>> host it is not consumed inside QEMU, but instead consumed by a
>>>>>> mgmt app like libvirt.
>>>>>>
>>>>>>> So I ask, does anyone involved in QEMU's SEV implementation have any input
>>>>>>> on a quality way to perform guest attestation? If so, I'd be interested.
>>>>>>
>>>>>> I think what's missing is some clearer illustrations of how this
>>>>>> feature is expected to be consumed in some real world application
>>>>>> and the use cases we're trying to solve.
>>>>>>
>>>>>> I'd like to understand how it should fit in with common libvirt
>>>>>> applications across the different virtualization management
>>>>>> scenarios - eg virsh (command line),  virt-manger (local desktop
>>>>>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
>>>>>> And of course any non-traditional virt use cases that might be
>>>>>> relevant such as Kata.
>>>>>
>>>>> That's still not that clear; I know Alice and Sergio have some ideas
>>>>> (cc'd).
>>>>> There's also some standardisation efforts (e.g. https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.potaroo.net%2Fietf%2Fhtml%2Fids-wg-rats.html&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C3c94b09f0cd5450460a808d9b01be1f8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637734456065941078%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=E%2FeaI6JNF2ckosTeAbFRaCZUJOZ3zG0GNfKP8082INQ%3D&amp;reserved=0
>>>>> and https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.ietf.org%2Farchive%2Fid%2Fdraft-ietf-rats-architecture-00.html&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C3c94b09f0cd5450460a808d9b01be1f8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637734456065951077%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=WEkMIZZp3O5Gyay5jZT8KSUH9fyarNfXy5O0Z%2FpHdnQ%3D&amp;reserved=0
>>>>> ) - that I can't claim to fully understand.
>>>>> However, there are some themes that are emerging:
>>>>>
>>>>>    a) One use is to only allow a VM to access some private data once we
>>>>> prove it's the VM we expect running in a secure/confidential system
>>>>>    b) (a) normally involves requesting some proof from the VM and then
>>>>> providing it some confidential data/a key if it's OK
>>>>>    c) RATs splits the problem up:
>>>>>      https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.ietf.org%2Farchive%2Fid%2Fdraft-ietf-rats-architecture-00.html%23name-architectural-overview&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7C3c94b09f0cd5450460a808d9b01be1f8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637734456065951077%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2FwNFMGAfojFZyGIj79D5%2BW%2BRPPuwumJiqIrf5UVrkPU%3D&amp;reserved=0
>>>>>      I don't fully understand the split yet, but in principal there are
>>>>> at least a few different things:
>>>>>
>>>>>    d) The comms layer
>>>>>    e) Something that validates the attestation message (i.e. the
>>>>> signatures are valid, the hashes all add up etc)
>>>>>    f) Something that knows what hashes to expect (i.e. oh that's a RHEL
>>>>> 8.4 kernel, or that's a valid kernel command line)
>>>>>    g) Something that holds some secrets that can be handed out if e & f
>>>>> are happy.
>>>>>
>>>>>    There have also been proposals (e.g. Intel HTTPA) for an attestable
>>>>> connection after a VM is running; that's probably quite different from
>>>>> (g) but still involves (e) & (f).
>>>>>
>>>>> In the simpler setups d,e,f,g probably live in one place; but it's not
>>>>> clear where they live - for example one scenario says that your cloud
>>>>> management layer holds some of them, another says you don't trust your
>>>>> cloud management layer and you keep them separate.
>>>>>
>>>>> So I think all we're actually interested in at the moment, is (d) and
>>>>> (e) and the way for (g) to get the secret back to the guest.
>>>>>
>>>>> Unfortunately the comms and the contents of them varies heavily with
>>>>> technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
>>>>> while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
>>>>> SEV-ES in some cases).
>>>
>>> SEV-ES has pre-launch measurement and secret injection, just like SEV
>>> (except that the measurement includes the initial states of all vcpus,
>>> that is, their VMSAs.  BTW that means that in order to calculate the
>>> measurement the Attestation Server must know exactly how many vcpus are
>>> in the VM).
>>
>> Does that work with CPU hotplug ? ie cold boot with -smp 4,maxcpus=8
>> and some time later try to enable the extra 4 cpus at runtime ?
>>
> 
> AFAIK all generations of SEV don't support CPU hotplug. Tom, Brijesh -
> is that indeed the case?
> 

I think we may able to do a CPU hotplug on SEV but hotplug will not work 
for the SEV-ES and SEV-SNP. This is mainly because the register state 
need to be measured before the boot.

> I don't know about TDX.
> 
> -Dov
> 
> 
>>
>>>>> So my expectation at the moment is libvirt needs to provide a transport
>>>>> layer for the comms, to enable an external validator to retrieve the
>>>>> measurements from the guest/hypervisor and provide data back if
>>>>> necessary.  Once this shakes out a bit, we might want libvirt to be
>>>>> able to invoke the validator; however I expect (f) and (g) to be much
>>>>> more complex things that don't feel like they belong in libvirt.
>>>>
>>>> We experimented with the attestation flow quite a bit while working on
>>>> SEV-ES support for libkrun-tee. One important aspect we noticed quite
>>>> early, is that there's more data that's needed to be exchange of top
>>>> of the attestation itself.
>>>>
>>>> For instance, even before you start the VM, the management layer in
>>>> charge of coordinating the confidential VM launch needs to obtain the
>>>> Virtualization TEE capabilities of the Host (SEV-ES vs. SEV-SNP
>>>> vs. TDX) and the platform version, to know which features are
>>>> available and whether that host is a candidate for running the VM at
>>>> all.
>>>>
>>>> With that information, the mgmt layer can build a guest policy (this
>>>> is SEV's terminology, but I guess we'll have something similar in
>>>> TDX) and feed it to component launching the VMM (libvirt, in this
>>>> case).
>>>>
>>>> For SEV-SNP, this is pretty much the end of the story, because the
>>>> attestation exchange is driven by an agent inside the guest. Well,
>>>> there's also the need to have in the VM a well-known vNIC bridged to a
>>>> network that's routed to the Attestation Server, that everyone seems
>>>> to consider a given, but to me, from a CSP perspective, looks like
>>>> quite a headache. In fact, I'd go as far as to suggest this
>>>> communication should happen through an alternative channel, such as
>>>> vsock, having a proxy on the Host, but I guess that depends on the CSP
>>>> infrastructure.
>>>
>>> If we have an alternative channel (vsock?) and a proxy on the host,
>>> maybe we can share parts of the solution between SEV and SNP.
>>>
>>>
>>>> For SEV/SEV-ES, as the attestation happens at the VMM level, there's
>>>> still the need to have some interactions with it. As Tyler pointed
>>>> out, we basically need to retrieve the measurement and, if valid,
>>>> inject the secret. If the measurement isn't valid, the VM must be shut
>>>> down immediately.
>>>>
>>>> In libkrun-tee, this operation is driven by the VMM in libkrun, which
>>>> contacts the Attestation Server with the measurement and receives the
>>>> secret in exchange. I guess for QEMU/libvirt we expect this to be
>>>> driven by the upper management layer through a delegated component in
>>>> the Host, such as NOVA. In this case, NOVA would need to:
>>>>
>>>>   - Based on the upper management layer info and the Host properties,
>>>>     generate a guest policy and use it while generating the compute
>>>>     instance XML.
>>>>
>>>>   - Ask libvirt to launch the VM.
>>>
>>> Launch the VM with -S (suspended; so it doesn't actually begin running
>>> guest instructions).
>>>
>>>
>>>>
>>>>   - Wait for the VM to be in SEV_STATE_LAUNCH_SECRET state *.
>>>>
>>>>   - Retrieve the measurement *.
>>>
>>> Note that libvirt holds the QMP socket to QEMU.  So whoever fetches the
>>> measurement needs either (a) to ask libvirt to it; or (b) to connect to
>>> another QMP listening socket for getting the measurement and injecting
>>> the secret.
>>
>> Libvirt would not be particularly happy with allowing (b) because it
>> enables the 3rd parties to change the VM state behind libvirt's back
>> in ways that can ultimately confuse its understanding of the state
>> of the VM. If there's some task that needs  interaction with a QEMU
>> managed by libvirt, we need to expose suitable APIs in libvirt (if
>> they don't already exist).
>>
>>
>> Regards,
>> Daniel
>>

