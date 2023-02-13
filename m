Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B24694A10
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:04:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaMg-00026p-AM; Mon, 13 Feb 2023 10:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <webczat@outlook.com>)
 id 1pRaMb-00024g-V9
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:03:30 -0500
Received: from mail-dm6nam04olkn2061.outbound.protection.outlook.com
 ([40.92.45.61] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <webczat@outlook.com>)
 id 1pRaMZ-0001Ck-22
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:03:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcJZK+MaLF8B5waj3s8DRg+dJ7cYtRdsg+wudIieumkg8N1QtZLvsTTDFUuDo1hljQ7YvpIxbmNSRxK3gjAckj8No3b22JDVrOUA4ys7AoB6zl7/Vlp0hk1XP4/zJJ+zOBnt6f9VafnbwxIkFtHFpBbtZkQCExObCaXgDEAFL/8YJhRREKCxiNlP1vk96A9cnmVsMRfqkcSSnxaqjyYGnrSOmEf2vmHIA0AdnVn9jQitThrrX2CQs20fbCma0VKr1m51HSBrdQ0XztSrbscBoWq9RN5J1PtgDfG7DjC7xl40MhzH0Q/qvAPK/ZYnqVXQ6nxM6ZdeVFHgK2BfQH7tkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4uqFqb3fFpCpCFwX0P05JaAAyB5A8IUVCoSzJ4jsgo=;
 b=dhlC8JUrjpOEzK4RVOKuvRprS5jvI51jomBmBdHPize2NMotcfd1gV96iPVDbAoriye/yJNxAqjo6v1A+Wq6kEtTOlE7Mm0068Yjg6t8QP+QnkADfUHpG85rFoBD1xk24SqGDXX3NFLreK79g9+RjEd+RODiuGyv5ASPlIALWDog6OBPUYGExl69BigrpMf1ivxAlQSDwsDS6trwd/h7iBGwCvvplaN+iFW5WT0wCNZAEpXebo7PtA9gN1zAVdVViRlIQxqeNa1GqgUVuxghtia0JNzevutPspdRT+tmAF7yTYgs91Gj1Jf4GmU1Y0x5HvY8UBYw2KPAEWE+TVynCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4uqFqb3fFpCpCFwX0P05JaAAyB5A8IUVCoSzJ4jsgo=;
 b=q4LlFtua39BEiKBQgMcGKCAhpstFkuPRYLCiH+VdNkldGc0bdaQl2xq92LN3CteYNKHMFj83bkK5alfNxq7PTjiFQvINmq2ELTYu0wa6Bvm0FDK4jH8JB/06S/k68UqFlYE7VY/ivaCMJ9t52+YCaWmLKAF6dDegkWvHnOrbZx3qSjmkHhxr+q38vHRwzTE930jXj0+ZqXWSkV3FwtZRZQuOOI4EFhILfvVJC6o7VrScPPPVkmC/s29UqzZgxYu3fCIhG016HdbQvZ0RfTtw54fb1J5cXNEHnJ7CQTpPa1a3uccj+6oy0kVhKoeOb5VYOUYfzGUqr2vx+pgl+iFNcQ==
Received: from BYAPR12MB3014.namprd12.prod.outlook.com (2603:10b6:a03:d8::11)
 by IA0PR12MB8747.namprd12.prod.outlook.com (2603:10b6:208:48b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:58:16 +0000
Received: from BYAPR12MB3014.namprd12.prod.outlook.com
 ([fe80::a666:b29d:dedf:c853]) by BYAPR12MB3014.namprd12.prod.outlook.com
 ([fe80::a666:b29d:dedf:c853%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 14:58:16 +0000
Message-ID: <BYAPR12MB30145F6B5B02667AC0BFD95EA0DD9@BYAPR12MB3014.namprd12.prod.outlook.com>
Date: Mon, 13 Feb 2023 15:58:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Windows 11 guest crashing supposedly in smm after some time of use
Content-Language: en-US
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat@outlook.com>
To: qemu-devel@nongnu.org
References: <c0bf0011-a697-da29-c2d2-8c16e9df21cf@outlook.com>
In-Reply-To: <c0bf0011-a697-da29-c2d2-8c16e9df21cf@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [rlV5MSt7mYNrFb4HgpFVSFqXK51e73Tl]
X-ClientProxiedBy: BE1P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::20) To BYAPR12MB3014.namprd12.prod.outlook.com
 (2603:10b6:a03:d8::11)
X-Microsoft-Original-Message-ID: <1fa801df-3880-0e1e-1c96-925484321cdf@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3014:EE_|IA0PR12MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4d4a39-ec3f-4294-ba67-08db0dd2bc71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atRjpoy2UcCLyjcjw3RpESVjYUlt5UuLF/k16mSj0KW1oD0sy4iJjSDI9Py6ZBG90vJpueqRceJvIzBp87qmalMymswFSFivGZr0IV80daU+P+A0x4lCIfh/+ypNeevcmdASnSRW7d+c5ByTFggMTd2YmXLsqFy0CLe+BzKE5LEaCQOtlaKXIg0nl47lNNU9Bzccu9AVD+bC/CytDHcfZBH2VK7Chsy2FPhcNVl1epQ3WhyUOQ98lcCnXDl1TEK+OCD5HmcKPYpvyorJYlnx5l3gP+oIFLftpTZ3HsZ8GRU5IFnzcthAqP9pNTCw+0Kcie4icCUITNvq9+rby6RAeI7JUyHX4msSuiRmMQ+budBmrVE+FzhwkHTSXFzbTBKNE4wvvE7bXJVTyM6RhY5dpK9EpI+OPfbDpWGYBvIe9BhlFCg+l+AvXavdT1eFUKlH9BqJ9K6ERnPslWvv1ZlvTjs/5g+n3cDH1cqmPEq1LV5UA1Uj29tF4CVxN58fV1piV4XxKfO2fRf/+4yKqrYfYaf39ExS9qvmTzhrtfsgkO11NqmiwXZUPyyk4apJrGJSLzHgKzmfoZKTVebpQN172jhrHDr9o5NYf0AGwAOHZPTVJRWn4Q3AkgQ13Xz2Eg3X5lZ5PspYd54/C1Ds+BkWbA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2p0MnJ4azhWR2N3SXN4aTlXRkJGcFlQcnB2Q2pGbHh3VGYzUlpBU3h3cGRy?=
 =?utf-8?B?VlhSV00xUUk4VTUxMjhRWGp3ZmMvZS9aZ2Q2bjVxVjVFbVdhSmVYNFVpQWEr?=
 =?utf-8?B?NzRWa2dhbXFyZ0tnSC8zYjN0N21BU2N2ZzBVTGJYenU4VU9ybFUzTkttSHJH?=
 =?utf-8?B?VEJjL3E2UE8zRHBDYjBZemtXcmdScnJKV0RaaElVb1JRL040SWxNL0lvb3RT?=
 =?utf-8?B?dGh4L3RnYllmMEhLSkQ0bGNzdzg0OGhDRm9sSDMyMTUybmpqN05oc1VWK2tW?=
 =?utf-8?B?MGRKTUJoQjVjZC9HbTNlMlVhMk1Sb3JFSUV2Ylg2b29lMU5wM3BrZENlbkxt?=
 =?utf-8?B?cnNXSFVISTNPTWNTdHlEZlVyVVcxeWp1VzVuTFl4bDZYZFpGaVJKc2FZYW9I?=
 =?utf-8?B?M1FDZzZuVEZsRjBtemlDTkNoSEdEbTViUVN3UHJmOS9EOHhoakhJVUVYb1Fh?=
 =?utf-8?B?VFYrMlAyWVlmNXNuV1FwTks3WU1JNW1naFBuZWRjQml0NG1kQlp3bUk0Qncz?=
 =?utf-8?B?UXI1SXZHS29jY2UxV2dCUktPdGU5RzhwNzRBRUp0NkVaSUM0YXdrMkdMM1A1?=
 =?utf-8?B?UVpQbzU4TmFGdVYyWE8rUjI0TFBPcHhBRndWQmFGNGFHUzl2eUF1OUhYd3hh?=
 =?utf-8?B?M2c0QnQxOUZqNVVFKzVtVzFFL1NkdzlvaU1haENlQ3QzR2ZPQnZCSE9NVllr?=
 =?utf-8?B?VXc1bUF6MENkVDBaajZ3RmxuZ3FISTNmdU9PTDlMUnMrYTBaWFpQcXZDUWdq?=
 =?utf-8?B?d0RGdm5ZcHhFTFlYUXR1U1c1ZFpyZFhxZC9pTkV0U1B6ZTNxM0o1d2p6NGhI?=
 =?utf-8?B?b0duaVdmNWIvZjdBQXRIY21IWmMyb0h1V1ByWWdhNXJ2OVRGaEp3bHlFZGpw?=
 =?utf-8?B?S2cyS0NOS0lXVU4vVm9qVlFJUDEya2Q4V0x1WDNMWFBrbEcxVFprampLdGM0?=
 =?utf-8?B?QVlMTFFpejBEZjlXbGlEWWpaeEtCRmdMdURjbWh1YzJnNk0yWGplZzdXMmFu?=
 =?utf-8?B?enpqaS91ZlhCM2VSQ1hNc3o3MEFLR3RXL2RhSC9xVERvMEhSejc5TVEvcjdQ?=
 =?utf-8?B?MXM2ZjNlYWM4TTJOd3M3WklzU2hjRWlWM0QxeWw4Mmh2N2NQcWI4ZzJKOWR6?=
 =?utf-8?B?dEZNdHVIbzlaOFhjWVZTSlRaWUVQazY4QjMrbWZNWi8zc0FZUXJOZlBXUkNR?=
 =?utf-8?B?cTRteE5zNGFVMUJpbG42eHhnWFVNVkFtVGhYUks0R0h3NUpnOUQveXpZaEFn?=
 =?utf-8?B?WDY2Rk1ZejYwS2UvVzFmT3U4WjMxNDBUbFVIbVZBNGdmUkdmSzFueklxQk9J?=
 =?utf-8?B?dElhWWJHRU5NbU53d2tJVWNjaU9ydHZjdXJoVlYvOTc3Q2swRzBFTzBjRWJU?=
 =?utf-8?B?a1NWZUFKRnlRUzVCMTNwMnp0eEZiQWNmUndEMXppdWJoeWJ2aE9MWmNpZGQy?=
 =?utf-8?B?aCt2eUtPdFFWeU9MZ3IrRFRsN3QzeWc1UEl1M3RYQzNaaXl0VFg1VlBkV3k5?=
 =?utf-8?B?UzkrMnpYNkp3anByZ0tNbVJOeXQ1UzBqUU5iMFhWaStHQjNmZlVUT2RVSHFi?=
 =?utf-8?B?WkZ1QUNlbkt5Wmg4ZHQwVDJzblBJMVpwUWhmRW5tK1h0UlRTVWlRK0xNbnRk?=
 =?utf-8?B?L2czWitMYklRVG8ybFhpYU52NGFwRzZHdTE1OHdqTkhkSS9BZmtYMkZ4VDBq?=
 =?utf-8?B?NnZpbExuVFlqKzNDRzgyTENKSFVzdWxtK3Jzb001dWJIRVA5TXdNaWlBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4d4a39-ec3f-4294-ba67-08db0dd2bc71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:58:16.2826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8747
Received-SPF: pass client-ip=40.92.45.61; envelope-from=webczat@outlook.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_MUA_MOZILLA=2.309, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping?

W dniu 10.02.2023 o 15:48, Michał Zegan pisze:
> Hello.
>
> I have windows11 installed on a vm. This vm generally works properly, 
> but then might crash unexpectedly at any point, this includes 
> situation like logging onto the system and leaving it intact for like 
> an hour or less. This can be reproduced by waiting long enough but 
> there is no single known action causing it.
>
> What could be the problem?
>
>
> Configuration and error details:
>
> My host is a msi vector gp76 laptop with intel core i7 12700h, 32gb of 
> memory, host os is fedora linux 37 with custom compiled linux kernel 
> (fedora patches). Current kernel version is 6.1.10 but when I 
> installed the vm it was 6.0 or less, don't quite remember exactly, and 
> this bug was present. Not sure if bios is up to date, but microcode 
> is, if that matters.
>
> Hardware virtualization enabled, nested virtualization enabled in 
> module params for kvm_intel.
>
> For vm using libvirt, qemu 7.0.0. Virtual machine is q35, smm enabled, 
> processor model set to host, firmware is uefi with secureboot and 
> preenrolled keys, tpm is enabled. Most/all hyperv enlightenments are 
> enabled.
>
> Using virtio for what I can including virtio-scsi, virtio-input, 
> virtio-net, virtio-balloon, etc... installed windows drivers for all 
> of these things.
>
> Guest is windows 11 pro 64 bit.
>
> What crashes is qemu itself, not that the guest is bsod'ing.
>
> Below is the link containing libvirt qemu log, containing the full 
> qemu command line and also the crash messages. Note virtualization is 
> disabled in vm even though nested virtualization enabled on host, and 
> hyperv not installed on windows, so it's likely not the cause.
>
> https://gist.github.com/webczat/1f224e7ecdc17c5c26316e0121f4ed43
>

