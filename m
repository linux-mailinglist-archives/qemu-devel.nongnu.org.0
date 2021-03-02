Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51C32A9F3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:05:00 +0100 (CET)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAKJ-0002G9-Qs
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHAGF-0006nv-DG
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:00:47 -0500
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com
 ([40.107.243.82]:14817 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHAGB-0008Rk-K6
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:00:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nz2VdmEXiwzmq7LrK5YBYiLfnLmCAS4Xs8m6zApK34bYCwv7kMzsV5Y8LeFQTjNfB/oQuKPSVEELBxgh0ubIJBiA6hYyY3smp0AOB8JeFU6swJaUe5+HFDBQBrvRyWoqhdv4lOYn0T9uL9hH+fJSaG7Ck9XwTfrmuus2RPxj/y2P1txtK1PlQWrZN/kfDOY4/TBoFzLJ3Q2BuQfXJ9xlBz5P+YKAvtb8+MB/lln8SkCMR7RyqZUAhNO/ankzAv+4z4jpBEm/azp0gtXCDcCGxDL8JqK313wHcUaPE0GRerZBZ1ZeLV+Ee9tFpQPIF/RrOVFNv0fHb/G5pQHYgWPzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbnsomjZcfkYG16hMqgY0fZmomrDa23cC9LFFPvz6VE=;
 b=fkxpCp5h4JIu01p4+b/FIgN9td70e1GRDcmbh7kvdV7aFFLPt5PJgiFjGqjZKTleCYyf7wTkTxBDnWHTMPKzqf4xUQBevSWbDh8qL9R5nxpJ5WUs6bCkvov/CCapJ1DMEWAnGB1Yixquon2XUPuZrBUoBzXy+zxIsC3coaICM0UIvKjCHb0GNXzQer5k74U2XYKsSuPqAcVp6sP3UHJ5hsNOMnuJYIbaH113WlIXH+a/QyZFH5XbELWCuqRGrWE4mga1AtjxV73bSbOZzC07dMT693WFYY8yb/4tY9E7D+WdU2aGE1JsBzUe2No0s0ad7igNf6hMg00NOWO0/u5Udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbnsomjZcfkYG16hMqgY0fZmomrDa23cC9LFFPvz6VE=;
 b=MSr0l3RUUYn1LoqUXKA2uSoCx/XxJkbKLI4Vq0DtvstaoQ3m8c67ZUcoODigQHWhDA3Iqni4ta1ocoNYN5L6vjdINphgrtgrf54OkX+R9XwY6JOmKEIArbzFfeyTYiFjCIhuCldxOfBo22MsEr9xcVs/y3Y52zsMZhWFAlHk3BY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SA0PR12MB4478.namprd12.prod.outlook.com (2603:10b6:806:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 19:00:40 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Tue, 2 Mar 2021
 19:00:40 +0000
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
 <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
 <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
 <fc966654-c04e-a61b-dd08-c28dd04bd316@amd.com>
 <CALzYo31mMJ_Rf9PAhAHHi6JHzBn_dc6ZhsU636r1UeEj5uuQKQ@mail.gmail.com>
 <d35d495c-a3e7-5a91-d936-99efd45b15b2@amd.com>
 <CALzYo33OfA8yJ4d7LN0kowdqG4_Ty-XZycV50WTrXtq0Ka+WSA@mail.gmail.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <942a8eb2-9830-38df-4edd-a4712d7861ab@amd.com>
Date: Tue, 2 Mar 2021 13:00:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALzYo33OfA8yJ4d7LN0kowdqG4_Ty-XZycV50WTrXtq0Ka+WSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0601CA0021.namprd06.prod.outlook.com
 (2603:10b6:803:2f::31) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SN4PR0601CA0021.namprd06.prod.outlook.com (2603:10b6:803:2f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 2 Mar 2021 19:00:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d132b6b5-593a-45b9-f3bd-08d8ddad7923
X-MS-TrafficTypeDiagnostic: SA0PR12MB4478:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44783504087AC3675F0A8E9695999@SA0PR12MB4478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kUU7doAAPBiwqavn06oRb8rmifr/gvXQhyFwJBw/F3IgtHnwWunaU+yzic+m8jRUbHioJFc+gA1TzY9eajFZDNOhh+JPulxMTYHnn2yxbutCQJzNjmmj4T+cL0YWWEj2ECSlbFJYFhAbsPHY5/PtRVxkNHsDDzsu7xpLDvk/y47RU9vYkzJ1bXbPNENAH54KcwfvrFKwbP6ZZiaSxMD56HPjS1JO9nkCTj65LRh8X9GK0QCHwMtyzIdwQJeP54pNbVo/wwetpAJ7+05pMAtwzgWkdsLlmQtDR61Yww2W3tAuHJNiyH1QgjCvyXryTO9k3sAtzBTgoFAJj0OXbVXO7BCe0mA8UHPzQSK2fur5ZtGVPVxf+L0oOwyeudH082MT0oNA/2liOSyNvmizj79vAFobgyekOlJmyAYv/56gIGzrX4PgNu3LccNZnQuLPQj5Q2ZRBBlc3C5v9KiQtqo2ZfxR79aNm//Wiq+7pa5Cd31L21OztUMDtoM4QE3tmduPrlcSyA0qDsSzHZ9Zjjsl1YZ6IawT0ECkmlReGbJR5SwFsgQg4QddmI6oQakv29w5Hm+NAUuLNGIYWsveMnduLiK7tC0LdKhGXVBPBqscFnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(66476007)(66556008)(956004)(66946007)(54906003)(36756003)(86362001)(16576012)(2616005)(316002)(8936002)(26005)(52116002)(31696002)(53546011)(6916009)(6486002)(2906002)(8676002)(16526019)(478600001)(83380400001)(186003)(44832011)(4326008)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZkY4QWNFbjh3YllLVm0yMWVPbnY3Rm9SazNlYzJsdnFESzBwUHpIQkNGU1RC?=
 =?utf-8?B?a2F1RzAwOFUzR1ZvZXdzSFBWanVpWE1NTjNlMGVsNWUwMzJOU1JpbkRoeXgx?=
 =?utf-8?B?UHQyRXBkRUdlelR2YTlHd2gyUTRkaGNFSVlrRzhvdERic01CKzkwcFV1TTd4?=
 =?utf-8?B?UUpPM1l1ZndLSFR4ZnljSUdNL3REUXFTamRmcDdKSUxTUys3OTljdUNHTXBu?=
 =?utf-8?B?QmNsMm1yWFZMZHhyS2I3dHgwVFN3U0VEKzY1dTByalhpUXBZc3VDYzZzcWJH?=
 =?utf-8?B?MVhBR2Z6a2R6RVBzdnhkbmNpV05ybDBjSXZCYUUwQ1lqcGRvclNxQmJEWG5a?=
 =?utf-8?B?Z0FQUnpVVVhFUVk0Zyt5NUJ4ZTBNUHRXR24zNnJERjhDdFpZZm51Ylk0a3FU?=
 =?utf-8?B?b0ZJUkVSU2Q5QldQMG94UWVpSDVMNXJVUlpsMjcyMkZKK0NNRzBKelVzMzRU?=
 =?utf-8?B?bVJ1RXl0WHRqMUJhNEw1R3g3RDQvWC9GM0thTVVQNFBlZUNxbkxHMjdDT3Bv?=
 =?utf-8?B?a3dOWFg2VEkxSStTRmp2b05NdG9zdHpmMDJ3bzk1MjA2QTBPNjNKS0tnN1VZ?=
 =?utf-8?B?NitpSW5ZL0FiR1JwMlRIU2swaEV6amNIbmhtTFN2VHp6QjVlVzdNd3o1UExC?=
 =?utf-8?B?V1Fld2M4cmtZb1RseGUwViszUFVqN3lGbDByRGZTUUF3K0IvUFZaVHN6RXpJ?=
 =?utf-8?B?VExqRjlDckQreC9SVno0SzlDWnRYa0lEVVlwdUxIdllERlU0dU5xSTBiakwr?=
 =?utf-8?B?Qm1BRFpiUnBMWWExTVBUUXhHL0ZncEhqMFZxSFNVR3VXcVlMRGlUTmtPa3E4?=
 =?utf-8?B?czBpYmNoak5WYmY2MkFNTFFjb2k0dUpnZ3VOQU5ycEprRGF4cUdJd0Vndm1U?=
 =?utf-8?B?V0g0aDFWc0dXMnRIV1YyWThxQm4reG1id2t4SmI3RlhHWnJtaUVoUEtEK3ht?=
 =?utf-8?B?cWVCcEZieHZBNWdiK0dIMGM2RkgyMzNQMFY2cmJWMUM3em15VHRFakVqSmJa?=
 =?utf-8?B?cXVkejRJeHY0MnlpekFuNEF5ekNySE4vVFluNnFFd0tPeVZOVTcxVTY4c0xz?=
 =?utf-8?B?Y2RsYmxHR2NjMTZKUVpRTWIybTBSZTZYK3BrU3FiTVpnb2VydnB5bzFpdjhy?=
 =?utf-8?B?SEw3d0V6N0JjOVBwVlY1VnNCbnJqR0orbWpmR0V3ODZZOHBzVUUzbjdSbFBO?=
 =?utf-8?B?MW8rTGNIT1Rjcmd0ZDV5UXB6TDY5UllpM2pmOEdnZjFoRG1yaGR3MFY2d3hD?=
 =?utf-8?B?M0tZejJudWppSHBCYk9QQkp6UUpxc1dqd2REaTFPSk9STC8vS3hoS0EvSlh1?=
 =?utf-8?B?NnFrOUlhRFhObG03bDNtZFJmN2FLTkswckNCQ3VRT0Rvd2NzUXJnUlRnSU1V?=
 =?utf-8?B?WFA3c0hSeEREcExFbVNPOWlRVkgwOHlUdGxvY1FwRG4vRXRqREZXdFlXWEU5?=
 =?utf-8?B?cmNMTnlySyszVERUaHI5Z2dMaFdlc1Y4dFRYekx5VldjdVNhbngwelV6SG5O?=
 =?utf-8?B?KzZYMk8zWUFzRDRKZURCVVFQeU1NY3kveHVaR2JjUzg5QVl6NFBaMFBNU3BZ?=
 =?utf-8?B?SVlVUWx1VnlTRW9FK0FRODlYdjlhZW5GTmgwaGNHK2lOdUR2aUdEQkdHUnBo?=
 =?utf-8?B?RE1MUXR5aU9MUUg4TVQrT003RzZudlBQOE8yZEhMMThSRWZsTDU2WGdtd0tk?=
 =?utf-8?B?VG5uWG9qa1RaT3poQ2R6YnpESnVzeVkyUlF2WENDKzB3UTVDOHRDakZ1c2Yy?=
 =?utf-8?Q?OnE0RdtNClkj+62dHXbSP8Ue8Z3DCpESYt6B8B3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d132b6b5-593a-45b9-f3bd-08d8ddad7923
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 19:00:40.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOkN3fN53SakN28/LXNShnJfp8Ol2LqvcN+aJ5gGmd25mBYHoZJuwbZdW99gwWBV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4478
Received-SPF: softfail client-ip=40.107.243.82;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pankaj, Sure.

I will add signoff from you if it is fine with you.

Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

Let me know.
Thanks
Babu

On 3/2/21 12:38 PM, Pankaj Gupta wrote:
> Hi Babu,
> 
> I confirm I can see both the ssbd & irbs features in guest with the
> below patch. There was some issue at my end, Sorry! for the confusion.
> Can you please post the official patch for inclusion.
> 
> Best regards,
> Pankaj
> 
> On Mon, Mar 1, 2021 at 9:38 PM Babu Moger <babu.moger@amd.com> wrote:
>>
>>
>>
>>> -----Original Message-----
>>> From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
>>> Sent: Monday, March 1, 2021 2:22 PM
>>> To: Moger, Babu <Babu.Moger@amd.com>
>>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>; Paolo Bonzini
>>> <pbonzini@redhat.com>; richard.henderson@linaro.org; Eduardo Habkost
>>> <ehabkost@redhat.com>; Qemu Developers <qemu-devel@nongnu.org>
>>> Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
>>> processors
>>>
>>>>> Hi Babu,
>>>>>
>>>>> I tried to test below patch for AMD EPYC Rome CPU and I got below error
>>> [1]:
>>>>>
>>>>> Also, I noticed SSBD CPU flag for guest was still available even
>>>>> without this patch, I noticed that for the guest, AMD_SSBD not got set.
>>>>>
>>>>> Guest:
>>>>> 0x80000008 0x00: eax=0x00003028 ebx=0x00009205 ecx=0x00002003
>>>>> edx=0x00000000
>>>>>
>>>>> [1]
>>>>> [    0.008000] unchecked MSR access error: WRMSR to 0x48 (tried to
>>>>> write 0x0000000000000000) at rIP: 0xffffffff9245c9e4
>>>>> (native_write_msr+0x4/0x20)
>>>>> [    0.008000]  [<ffffffff9243a6c5>] ? x86_spec_ctrl_setup_ap+0x35/0x50
>>>>> [    0.008000]  [<ffffffff92439423>] ? identify_secondary_cpu+0x53/0x80
>>>>> [    0.008000]  [<ffffffff9244adfa>] ? start_secondary+0x6a/0x1b0
>>>>>
>>>>> 0.011970] unchecked MSR access error: RDMSR from 0x48 at rIP:
>>>>> 0xffffffff9245c772 (native_read_msr+0x2/0x40)
>>>>
>>>> I did not see any problem with these patches.
>>>> My guest setup.
>>>> # lscpu |grep -o ssbd
>>>> ssbd
>>>> [root@rome-vm ~]# uname -r
>>>> 4.18.0-147.el8.x86_64
>>>> [root@rome-vm ~]# cat /etc/redhat-release Red Hat Enterprise Linux
>>>> release 8.1 (Ootpa) # wrmsr 0x48 7 [root@rome-vm ~]# rdmsr 0x48
>>>> 7
>>>>
>>>>
>>>> My host os.
>>>> # uname -r
>>>> 4.18.0-193.el8.x86_64
>>>> [root@rome images]# cat /etc/redhat-release Red Hat Enterprise Linux
>>>> release 8.2 Beta (Ootpa)
>>>>
>>>> Also, I only see ssbd feature when add this patch(EPYC-Rome-v2).
>>>> Otherwise, I don’t see ssbd feature.
>>>
>>> Thanks for checking!
>>> Can you also see the ibrs feature inside guest with this patch?
>>
>> Yes, The feature is available with this patch. Otherwise it is not available.
>> [root@rome-vm ~]# lscpu |grep -o ibrs
>> ibrs
>>
>>>
>>> Thanks,
>>> Pankaj
>>>>
>>>> Thanks
>>>> Babu
>>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>> Pankaj
>>>>>
>>>>>>> It is normally added as v2 for compatibility. Like this.
>>>>>>
>>>>>> o.k. Thanks!
>>>>>> I will test this tomorrow.
>>>>>>
>>>>>>>
>>>>>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
>>>>>>> 24db7ed892..f721d0db78 100644
>>>>>>> --- a/target/i386/cpu.c
>>>>>>> +++ b/target/i386/cpu.c
>>>>>>> @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] =
>>> {
>>>>>>>          .xlevel = 0x8000001E,
>>>>>>>          .model_id = "AMD EPYC-Rome Processor",
>>>>>>>          .cache_info = &epyc_rome_cache_info,
>>>>>>> +        .versions = (X86CPUVersionDefinition[]) {
>>>>>>> +            { .version = 1 },
>>>>>>> +            {
>>>>>>> +                .version = 2,
>>>>>>> +                .props = (PropValue[]) {
>>>>>>> +                    { "ibrs", "on" },
>>>>>>> +                    { "amd-ssbd", "on" },
>>>>>>> +                    { "model-id",
>>>>>>> +                      "AMD EPYC-Rome Processor" },
>>>>>>> +                    { /* end of list */ }
>>>>>>> +                }
>>>>>>> +            },
>>>>>>> +            { /* end of list */ }
>>>>>>> +        }
>>>>>>>      },
>>>>>>>      {
>>>>>>>          .name = "EPYC-Milan",

