Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC31329008
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:03:16 +0100 (CET)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGol8-0001FW-GX
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lGoiw-00005H-Ff
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:00:58 -0500
Received: from mail-bn8nam12on2053.outbound.protection.outlook.com
 ([40.107.237.53]:30177 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lGois-00069M-Qu
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:00:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Faa+8IaXuxAPb6H3SDCsUK8wH+AZTt6ikFGomaqjzV6cmLXwNSzcKDgDMl1Wu4OtZZIXRwNQ+5hj/4xfGertlxedZ+0dx9D0os/SKHMz/yN1lntLs1yJ9ddxRHjcwTV3yFkaB05pTM5v3rLDlgCr8pYE/jfvSZK2Oro6rmP4NaL/vby2ZFUsbX1q4mQVcXbGO1OemOIVDZ67pg3pOiHvUuae/mnflQ1/Y7O1rmMXvrnk+46HQOIkp3Jk5kOE4S5K6ZPEm6+WF0soVdUExcViBAxv6gPjU7gDAqGKQLjNg6VrcvOkvISHMKjH95WFRTwDKgALPyMzbEEHfttKJtlfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdh4oma4MXgxdgdy4zOFUZx6BVMzpv/LrwURJUXj72U=;
 b=Vj3hZSSEhCi5uuu+6FeG2wk9jBaAbCNfzvZzzabpNSnW4+DIVL+UnOdbPmWJ9CLLU/GwWGtVgy6HWQF/FEOsol3nd/NXJV9O7ymDCapLyfZ5wQN/nDQSeu5rmFWKD+k90l7lkkq68YGKS5SwNNGQKCj4UztgHYRkeygNxCOXAXKPzGmFwViNtyKYo9USJbU9UII/irmhyH9PT0PsWmfeC/j51vCBpM/qXBV+crLt+tt1ZpQjFIfUGQiJi5+mNO3te+AZizKWIJx4SAEzIf6kjwTZXYnhmQzOB1H1POVhvVkeYf5w/mwhb4OCa1WXJ2eXwsoU7K+YIuuXJTpSkVwAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdh4oma4MXgxdgdy4zOFUZx6BVMzpv/LrwURJUXj72U=;
 b=gr4JIobklI3c09FT/fYQ596kckjsWWn42YF/kYZ4O192GcU15+2neTAs7RWQ8it0gGZH/JpAcKO502f/zxLOahA+h+3VWi6acAKcZgLCTxIggNWfS4tDx1VciyI/xiz6JbjTetPUxqjwiB/ARCBJEBDtidUsdfAlBi98jR2h5zs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN6PR12MB2607.namprd12.prod.outlook.com (2603:10b6:805:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 19:45:49 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Mon, 1 Mar 2021
 19:45:48 +0000
Subject: RE: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
 <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
 <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <fc966654-c04e-a61b-dd08-c28dd04bd316@amd.com>
Date: Mon, 1 Mar 2021 13:45:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:806:130::29) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SA0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:806:130::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.10 via Frontend
 Transport; Mon, 1 Mar 2021 19:45:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 197610c3-0aae-4623-dfa9-08d8dcea9ce7
X-MS-TrafficTypeDiagnostic: SN6PR12MB2607:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2607C650C6172136CAC4DFCA959A9@SN6PR12MB2607.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEhVs5Gj8KNmDDZoe3kbs0mVoqojlvJhR98Iq0OWIGuTlaZeWEuVyOaRNUVxXrfyid96tb2C2yz6715SXRIl9W0G8TrF8Jjwu8mj/63pKPjuxlT4a6Sc+nbpae93KkoTt78jm81H12XrHuQD0q4riEzzDV11D2fOc/QEMZEjlC1OLyymEexmcuO0guaXc89zEPzet79S1RsV/pq0ZDA9L9Ro/lMUmdhUt3nEwzsr8VGz2uk/DitaA1UljKSfDa6rplcCYX1rhSdYda4GVJncc6g6z3kLnAOm7iuwNESmera9FAURk7kKITYg1mkiCO4S9v9LsHtq+S9DoZvm6s6Hh1xWnLfPfct+W4XTjOfZMxcTB4TfFadP4z9RtqtPWTyryUUQAQ1ji9cG3XN5nTr7XoWMr3myjR4ou2EBtao6xWuh1hZOOQYvk6ic+KK4AqA0jAMzpVx3ZKFQs0rqvVyLINzwniSjfRHilFshrsd/I/WpaPbECmB/IrzlP0cP0FQ5fNjzHVvBrSRmacUKr8IM1wQqqJK3A5GdXddp/aZ6yVzY0J9Hbm0iyODU29cAzAzCI7U16VeR0GOztvzYqbjZnHfaK8XdWwDLOjC+1jLeeyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(8676002)(31686004)(26005)(8936002)(16526019)(36756003)(53546011)(2906002)(83380400001)(66556008)(110136005)(66476007)(52116002)(478600001)(316002)(2616005)(16576012)(44832011)(66946007)(186003)(6486002)(4326008)(86362001)(54906003)(5660300002)(956004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y01qTnFJR0gxNWNQNDlIbjBwc0ErTGZnNzBscWpOcGhXWnZKREpRWTVodzYz?=
 =?utf-8?B?QTB1SHE1Q3BtV0dpSXZJVmFhVm9tWGpHV09KaVZIOUlxbXJ5VGpxbU4xZnZP?=
 =?utf-8?B?VytvSHB2ME12dDRxdU1pNUpvZXByVXpQV0VzT1J3WkxWaVhFNytkTkZ6RkJx?=
 =?utf-8?B?MGZvOHFibndQVkhqS0oySk9KTHVEMmpSY2REd0xPdVl1emt4L29zbzdXT2NO?=
 =?utf-8?B?dmtlMFh1aWtSMmREbngzY0l6UUdmVTZ0MFVSaytLNXNvUGZLMVFWZzg3dFAz?=
 =?utf-8?B?OW1MUW1GaGROTXcwNXFhajNEWW4yeGZQR0JDWWY3UlZHREg1V3NVdGJERzBn?=
 =?utf-8?B?QWxFckVvVjN6OTQzOGZqTG9acHlKQ1VKR2FBSmJ4aGM4MEtjVlFQZjJ3dkg2?=
 =?utf-8?B?UytNbjI1anA2bWp1SnFJaGYzaHV0TVA0dVNqbjBHbDdRL0xscDY3WU1XeGhP?=
 =?utf-8?B?M0kvS2xrTHNvS0YxL00yNDRLM2xvWmNGVC9QZ0hlWmpyWHhxTVpiSWkweElW?=
 =?utf-8?B?Ylduc0JsaFFubEdxSEN0WGhMRm9HRnoyTVpMbk9rTDc2Rm0yRjJ2V0RpKzlH?=
 =?utf-8?B?TkJlY2JmbExJRFZhc0g5V1orYXgyczhmWVhhdXdkQ1IvejRxUHhXSmRxMVQz?=
 =?utf-8?B?ZFlyNlgvc05GalFLQ05TaWhHNmM4b05pUTI2OVRyRHg4MGV3dWp1RC9LaGRU?=
 =?utf-8?B?TmRPb01ldVl4V09LSmxLaSt3cEdBczVaWk5WTjRqOGVmdCtsYVZqeENLbWo5?=
 =?utf-8?B?UXpqeDhrYmQySHRSYU5kdEM1alJVdVcvUUZTS2RPblZDejBMQmRCWEk2d0Rw?=
 =?utf-8?B?L2lxSWRvL01XNG1PWFlXNUphSnBNMWxpcFVPd2ZwU2phZHJBQWFMU1hMaldT?=
 =?utf-8?B?WEJLRC9rMXFlREZ1OTIvT0ltOEc4MWFXQ01XTE5Ua2F5WlNvTkNkV1dKSzhV?=
 =?utf-8?B?UTVrVnhkdEVQY01rRkFZbFZ4UlN3NXNLSmw5dDlHR09tSEtRYjFBNGRlVnB3?=
 =?utf-8?B?NGdhK051N1NwVFpRaVJzTzc1L1VZN2wzZmRRaXQ1K0VXRUQwRVdQN2RqUWk0?=
 =?utf-8?B?ellaLysrZ1AyQTROWGI4L3pOaEVLaHZicjQzS1pEOUhxMzdVamtJQ0UzN0li?=
 =?utf-8?B?bllPMmlCbmJKTzRXR0pocGZ4QjFOZG9VaHJBc1dpWTZQZDVjbkxRdWppdzcz?=
 =?utf-8?B?OTh6TlRIcjF5K2VTR2dMVHV5RHYrdmRWc2UxQmQ3cWtHRUo0TEtHSk1ncUpP?=
 =?utf-8?B?eDM1Rnl5VXpuRkpIYkNHejkwMTB4N1F6Qm9YV1BDd0tBZW0xeHdwbHAydnph?=
 =?utf-8?B?RjMxUmFndS9qb2lucWgreXI5OExQZjhKVTI0TUxScVNuODRKakNZWWo4M25O?=
 =?utf-8?B?SndmNW4wR3RWQnY2K0dDRzlFaVNET1pQK0cvcGQ4UjEwWHJ6T3ROZmNITEVw?=
 =?utf-8?B?R0s5TTRKRDY5NzhZWDBYRkNDQW10TVJocElXNTVCR3VlTy9GclRUZTh1a2tV?=
 =?utf-8?B?YlFVNGRhanplYlNKOFF0RTNwaTNIcWlwUllybG43MHQ0UWRmb0pHQy9qRjFy?=
 =?utf-8?B?Qm90LzRVa1BHOFpYTzNrV1hiMUlCWEdGZ2sxczJBT2hrVDUzaXNNMW1raDE1?=
 =?utf-8?B?OUhIUUtyQXRLa2QweXRwUXRzWHN0TUVvdDBVSXJYRWFiRHRqd3dZZGZQYnBz?=
 =?utf-8?B?NTZWcEQ3Z1Avc005OHl6WFdXOThvblcvcCtFNThXUWhIRFNWWWszU0drem9Y?=
 =?utf-8?Q?lsBBhXFpYk5wsEmtHqerUfJ03D85pF4s9nULtqD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197610c3-0aae-4623-dfa9-08d8dcea9ce7
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 19:45:48.8843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZCz075i690I+fQv9RBJ6FrXfNKcPLn3FHrb3ufewjY7bf3uyWy8yVFB4rcLvZ2S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2607
Received-SPF: softfail client-ip=40.107.237.53;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pankaj,

> -----Original Message-----
> From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> Sent: Monday, March 1, 2021 10:46 AM
> To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Moger, Babu <Babu.Moger@amd.com>; Paolo Bonzini
> <pbonzini@redhat.com>; richard.henderson@linaro.org; Eduardo Habkost
> <ehabkost@redhat.com>; Qemu Developers <qemu-devel@nongnu.org>
> Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
> processors
> 
> Hi Babu,
> 
> I tried to test below patch for AMD EPYC Rome CPU and I got below error [1]:
> 
> Also, I noticed SSBD CPU flag for guest was still available even without this
> patch, I noticed that for the guest, AMD_SSBD not got set.
> 
> Guest:
> 0x80000008 0x00: eax=0x00003028 ebx=0x00009205 ecx=0x00002003
> edx=0x00000000
> 
> [1]
> [    0.008000] unchecked MSR access error: WRMSR to 0x48 (tried to
> write 0x0000000000000000) at rIP: 0xffffffff9245c9e4
> (native_write_msr+0x4/0x20)
> [    0.008000]  [<ffffffff9243a6c5>] ? x86_spec_ctrl_setup_ap+0x35/0x50
> [    0.008000]  [<ffffffff92439423>] ? identify_secondary_cpu+0x53/0x80
> [    0.008000]  [<ffffffff9244adfa>] ? start_secondary+0x6a/0x1b0
> 
> 0.011970] unchecked MSR access error: RDMSR from 0x48 at rIP:
> 0xffffffff9245c772 (native_read_msr+0x2/0x40)

I did not see any problem with these patches.
My guest setup.
# lscpu |grep -o ssbd
ssbd
[root@rome-vm ~]# uname -r
4.18.0-147.el8.x86_64
[root@rome-vm ~]# cat /etc/redhat-release
Red Hat Enterprise Linux release 8.1 (Ootpa)
# wrmsr 0x48 7
[root@rome-vm ~]# rdmsr 0x48
7


My host os.
# uname -r
4.18.0-193.el8.x86_64
[root@rome images]# cat /etc/redhat-release
Red Hat Enterprise Linux release 8.2 Beta (Ootpa)

Also, I only see ssbd feature when add this patch(EPYC-Rome-v2).
Otherwise, I don’t see ssbd feature.

Thanks
Babu


> 
> Thanks,
> Pankaj
> 
> > > It is normally added as v2 for compatibility. Like this.
> >
> > o.k. Thanks!
> > I will test this tomorrow.
> >
> > >
> > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
> > > 24db7ed892..f721d0db78 100644
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> > > @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
> > >          .xlevel = 0x8000001E,
> > >          .model_id = "AMD EPYC-Rome Processor",
> > >          .cache_info = &epyc_rome_cache_info,
> > > +        .versions = (X86CPUVersionDefinition[]) {
> > > +            { .version = 1 },
> > > +            {
> > > +                .version = 2,
> > > +                .props = (PropValue[]) {
> > > +                    { "ibrs", "on" },
> > > +                    { "amd-ssbd", "on" },
> > > +                    { "model-id",
> > > +                      "AMD EPYC-Rome Processor" },
> > > +                    { /* end of list */ }
> > > +                }
> > > +            },
> > > +            { /* end of list */ }
> > > +        }
> > >      },
> > >      {
> > >          .name = "EPYC-Milan",

