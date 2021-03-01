Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DF329225
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:40:26 +0100 (CET)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGpL7-0004rT-TY
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lGpJP-0004Ck-Hc
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:38:39 -0500
Received: from mail-eopbgr750082.outbound.protection.outlook.com
 ([40.107.75.82]:40928 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lGpJM-0005tv-RF
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:38:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLoExaTojkpV9jTN3trA8CEB08x3jRlHVnQY1W6MoSzqI9HXQcub0C4yfjm8uz8trTkiDDyvrWPsDOmvkgH0A0ZCOV3RNiaQSsGpboI5IahEX22Hh2uobna0VTV04LoLPM7V8N2nGo523MdkS4IKoqcEiF0B/K/k43mP38dBtjSNKvCEriLjZbSuU5M98GclDi1rbbqpriGyYCxRdClugj7hstdA/VnaBkx2qzuoF9siYQaiyYtizg2qbjNLc/6W5l/bReVstrbA8UFhmrvQISQKq8MY+JVqNnUBKUbt9mMPowQkPLKDag2KO1QHvF/XIUpiKkAciE3jscDXuiH1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY7CMU5ZdpJBoEbleOVgKXdD1sxuxP3Ed3tPX/0N0BA=;
 b=Hsuj8w7eO5iNiPEnSK1X7swewnu4XdTKLiggH0XUVxc54hCV0o3/fkdQSA/MxGbFT3H2uhT/Jq3s+2E267UoBeGGwfae+Z72GMD2LYduo+6VJBgIG7IvlIkl5mnkeqUWbNoK24eOPdBuW5FYUSFCpDVH8G+mhcwkDe8YN7+dE/nOL4rxDq0ebFSaglDNDwt+z+zpI3vxHtWf4HeVmB2r2+YZnDbjrjPkBOgFTNTnVQxLPJVZzPIRaDHndNtb3GB/CJAVFggS0z/10pe6WEzqMDW2TfAyX/USQXb7RgKjAmGJqLVkybbZIH6PJIIdio3aJMxXfmHHdYWwEKoQtuPI6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY7CMU5ZdpJBoEbleOVgKXdD1sxuxP3Ed3tPX/0N0BA=;
 b=iqQKtR0EtCJcXYNrSAUueWzywM6eNzZyvW/x/Lc5/Ws073kmqRTYSnR6EF147unnGwWZ0B0Jk3/y/c8xz/mI60MnTzwKT8cvrYNvPqnuSVUz9LkPNbMvEpZ0/kgc5bawMqjM+nXL6LpsENWTuyRoOBs/9G8Dx/NU93UzjC5aWuo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 20:38:32 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Mon, 1 Mar 2021
 20:38:32 +0000
Subject: RE: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
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
From: Babu Moger <babu.moger@amd.com>
Message-ID: <d35d495c-a3e7-5a91-d936-99efd45b15b2@amd.com>
Date: Mon, 1 Mar 2021 14:38:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALzYo31mMJ_Rf9PAhAHHi6JHzBn_dc6ZhsU636r1UeEj5uuQKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0501CA0153.namprd05.prod.outlook.com
 (2603:10b6:803:2c::31) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SN4PR0501CA0153.namprd05.prod.outlook.com (2603:10b6:803:2c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Mon, 1 Mar 2021 20:38:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c475306b-0b4c-494d-8367-08d8dcf1fa8f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4445:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44450E078E3F137E1E91E9CF959A9@SA0PR12MB4445.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fh4bzlCukSix1+vQPCz7UcAgs+T/yBH2uLr+FuR7WPr4OB2BKWQygdNZZQKVA96wyKHRWyM8UUPKIas2ysErLu7SNWHB9zVarRfVhJ8t6i9RniBXHGp72A18K1sq2Htr5Cq6i57TfDewAEEO+CkbgkFD0n0LOjqxNaTaAUthaXJjBsHxApUTcfyKECorVWzj/4B2VT1+98SPNnB1sse7li9ttCtfQ3r2nIbSf/wvLfK57FOqx88Nj9NccnC3FZyOatfl23B5foi1u8T6CJKT6HLMM9Mc2PLyYdTCv5zPNuSeeC94QjeCzhmmGEiccQx1xk9IzZIEIm5cBWX+YKwZZ0nZZdEJRy+/iVw62vB8KLyoVYrhS3Bm4MO4iBxFq5RA4i0rvnTRU7Qfk/tlGIpgAd9zC9K0XcWaJtq3ATCdibetqP3ldc8+BnUloqKPbeToKWpgt5ll3pogfDvqLJv7ccnX45qnwMyNpX6XIh9xB5KzFKj+rs0tL0BXzDhHW4402hxWBC4kNjNOV292nMsvRGFqJKXyYCuZ63LNuWOWc3/g/4o1jrhT49/Z5BAt1DRJYYibx2CG46ZAYotfZTub4hmlMEon1CXoiWWVzVIvGGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(31696002)(54906003)(4326008)(86362001)(16576012)(31686004)(66556008)(8936002)(66476007)(956004)(5660300002)(316002)(8676002)(2616005)(2906002)(52116002)(16526019)(6486002)(478600001)(83380400001)(6916009)(53546011)(36756003)(26005)(186003)(66946007)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFhaR2JPS0RrSmhPNzZybFBPb2JOdXZyY1I3L2NkYkR3Y3A5Y2hBUmlUNVAz?=
 =?utf-8?B?RHVudVpVUjFzWitEajBZMVZXeDJnRzh1SUp5SkJYOU1UWVhiWElYc08xbTh5?=
 =?utf-8?B?bVJXUzV2dmRYMHU4R0tZelZoQWlQeUNjSDloL3hveHA0TEd3K2FlM0I0UEhY?=
 =?utf-8?B?ZUk5RitraksxZTRLckdNV0VVSXhjbjdYYTh2MnA2c1hyWUlGU2lXRzdvUkVX?=
 =?utf-8?B?eHd3RTdRbkZUVU1hVGZwMDlXazk1QkNxL2dZeUR6UEZXYk4vT2wxTTlKbjMr?=
 =?utf-8?B?cWhnbm4wTElEVGMybEtRSDVwVTB4eHZOMXhyTzZOVVJ4eGNQM2NvSzZsQU1q?=
 =?utf-8?B?SVVBYmNocXVVUlA4SGNtWjQvSjN3OU1TeUpFZThmQm5zeVY3REVhMEkrd3h2?=
 =?utf-8?B?d21wM0szNmN0WnBGZTRnZnFUOXF6VThGMFQrZ0ZnMFZDWjVIa1RtcVh2eHFp?=
 =?utf-8?B?U2Z1R2dGZXlLejl2YytReEkxWlRvVHZiTG9xbGZrRUpzczIyNWQ5SFoyTXJo?=
 =?utf-8?B?RHF2OXdkZlFmdFFVNGRwTkd2YmRDUDRwVjh1Q1J1MzF1V3VJdUJNcytxNHpB?=
 =?utf-8?B?NVU3TmxZRDZkZXgvRHdSZ3N2bEZLMlZnNTU1V2o5aXFUTzlNbi9tSUt5UjR0?=
 =?utf-8?B?ZDBOTUp2aE5FT2hNOWs2YUFXb0ZISHFlYXlqNUN2Q0MrOTJSL3pIWk1YQWN0?=
 =?utf-8?B?Z0FSQnZOOXJ4RFh5QlhReThTQmlrM242NGpIam1wM2NvYWlDSDJlc1NFVTVZ?=
 =?utf-8?B?VGp0NW9aNnpaQ2lCeWQ2elNERFhJeS9mYmZzekhZc3dzR3JIeFNtVHc2Vmdk?=
 =?utf-8?B?V0VhUW9ObUw5Rmh3N1lldXM0Rzd6ZW0wM1F2RHJ2cVkvTjkwd1NoUTZaNjJJ?=
 =?utf-8?B?bGk4aVFRbXVFWHArSEpMQWxXQklJYzlGT25LQ1Y2eU1MZUZwU0NiU01qN0l2?=
 =?utf-8?B?VmkyaUkxdlByVHdlZGNERHRNRldZR2c0eGxyRXl2Tng4Q2pETmducUhBRXYy?=
 =?utf-8?B?eXNxK2tMMG1VS1pFeC9ueXgrYjh1ekJTbGNPL1lSTlU2NDNobFBzSlFQUjVk?=
 =?utf-8?B?TzNVbjBDaElDMUlXUDkvanpPM3NNLzVQbTFWSHFhTFJ2Q2QzbkFLY2diNjlo?=
 =?utf-8?B?WDdCYzdZRVFlb3FjWGhwbU13UFA3aGdlcmtXRk5VK3dMRjIwa0V0WXRMdGZh?=
 =?utf-8?B?djY3Tlorb0NZWnB0dk9UbG45ZnBuVGdoTmEraW9PNktxTCtpTjFUNUdWVThI?=
 =?utf-8?B?RHRpMkc1Z0Q3elZLdHEwa3VFZXJsLzFpeHJuM2dlaHBVdmI4TXFJdHlGNTQv?=
 =?utf-8?B?UE9kN3IrZXhtVlRzOUJWQTNpUHBDOGpkTU42ZUk3QzNUNDBhZXhKdFpxa3lR?=
 =?utf-8?B?RXRieExGZ3k3YVF5YU1Tcm5MSHR3LzdKZVNtTTl6U1h3cEZVUlEwQTU2R3lI?=
 =?utf-8?B?bnJRQ2g1T3crblhtbDJ3b2wxem5IVFVvMUQ5MG8rU3QxS3I1cURFSzlPaDRr?=
 =?utf-8?B?dzFWYTlNamJhbzFxeklESXN4dkxra2pvSVhEeDRja29iUzJnbXBaMjN5NUtl?=
 =?utf-8?B?MW1KNUxORkpleWp1c2xuSm5QNWRIL2lCVmUvR214b0tLYWJ6QTZaajVlQXdG?=
 =?utf-8?B?N1NxZG93NUQweFA5TmgzREZZZWFadnVVMDZaQllvVVE3emtweHVwSDl5Wm9X?=
 =?utf-8?B?czFuQkNDQU02TWVnSGNWQzVxaWpYZG1VS3JDTkMzTk1mSDBlYm1XMk1ZZ0lC?=
 =?utf-8?Q?V7uxEBAe9JkbkExtznlXXyXuGe4ohsbnGT/Cg0o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c475306b-0b4c-494d-8367-08d8dcf1fa8f
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 20:38:32.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyv3V4C2a8+Baamb2qGJ1PQ1lUXFOaSv4wCTzUaFygJ1LxbCtn5hj81zYAn1nHFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
Received-SPF: softfail client-ip=40.107.75.82; envelope-from=Babu.Moger@amd.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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



> -----Original Message-----
> From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> Sent: Monday, March 1, 2021 2:22 PM
> To: Moger, Babu <Babu.Moger@amd.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>; Paolo Bonzini
> <pbonzini@redhat.com>; richard.henderson@linaro.org; Eduardo Habkost
> <ehabkost@redhat.com>; Qemu Developers <qemu-devel@nongnu.org>
> Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
> processors
> 
> > > Hi Babu,
> > >
> > > I tried to test below patch for AMD EPYC Rome CPU and I got below error
> [1]:
> > >
> > > Also, I noticed SSBD CPU flag for guest was still available even
> > > without this patch, I noticed that for the guest, AMD_SSBD not got set.
> > >
> > > Guest:
> > > 0x80000008 0x00: eax=0x00003028 ebx=0x00009205 ecx=0x00002003
> > > edx=0x00000000
> > >
> > > [1]
> > > [    0.008000] unchecked MSR access error: WRMSR to 0x48 (tried to
> > > write 0x0000000000000000) at rIP: 0xffffffff9245c9e4
> > > (native_write_msr+0x4/0x20)
> > > [    0.008000]  [<ffffffff9243a6c5>] ? x86_spec_ctrl_setup_ap+0x35/0x50
> > > [    0.008000]  [<ffffffff92439423>] ? identify_secondary_cpu+0x53/0x80
> > > [    0.008000]  [<ffffffff9244adfa>] ? start_secondary+0x6a/0x1b0
> > >
> > > 0.011970] unchecked MSR access error: RDMSR from 0x48 at rIP:
> > > 0xffffffff9245c772 (native_read_msr+0x2/0x40)
> >
> > I did not see any problem with these patches.
> > My guest setup.
> > # lscpu |grep -o ssbd
> > ssbd
> > [root@rome-vm ~]# uname -r
> > 4.18.0-147.el8.x86_64
> > [root@rome-vm ~]# cat /etc/redhat-release Red Hat Enterprise Linux
> > release 8.1 (Ootpa) # wrmsr 0x48 7 [root@rome-vm ~]# rdmsr 0x48
> > 7
> >
> >
> > My host os.
> > # uname -r
> > 4.18.0-193.el8.x86_64
> > [root@rome images]# cat /etc/redhat-release Red Hat Enterprise Linux
> > release 8.2 Beta (Ootpa)
> >
> > Also, I only see ssbd feature when add this patch(EPYC-Rome-v2).
> > Otherwise, I don’t see ssbd feature.
> 
> Thanks for checking!
> Can you also see the ibrs feature inside guest with this patch?

Yes, The feature is available with this patch. Otherwise it is not available.
[root@rome-vm ~]# lscpu |grep -o ibrs
ibrs

> 
> Thanks,
> Pankaj
> >
> > Thanks
> > Babu
> >
> >
> > >
> > > Thanks,
> > > Pankaj
> > >
> > > > > It is normally added as v2 for compatibility. Like this.
> > > >
> > > > o.k. Thanks!
> > > > I will test this tomorrow.
> > > >
> > > > >
> > > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
> > > > > 24db7ed892..f721d0db78 100644
> > > > > --- a/target/i386/cpu.c
> > > > > +++ b/target/i386/cpu.c
> > > > > @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] =
> {
> > > > >          .xlevel = 0x8000001E,
> > > > >          .model_id = "AMD EPYC-Rome Processor",
> > > > >          .cache_info = &epyc_rome_cache_info,
> > > > > +        .versions = (X86CPUVersionDefinition[]) {
> > > > > +            { .version = 1 },
> > > > > +            {
> > > > > +                .version = 2,
> > > > > +                .props = (PropValue[]) {
> > > > > +                    { "ibrs", "on" },
> > > > > +                    { "amd-ssbd", "on" },
> > > > > +                    { "model-id",
> > > > > +                      "AMD EPYC-Rome Processor" },
> > > > > +                    { /* end of list */ }
> > > > > +                }
> > > > > +            },
> > > > > +            { /* end of list */ }
> > > > > +        }
> > > > >      },
> > > > >      {
> > > > >          .name = "EPYC-Milan",

