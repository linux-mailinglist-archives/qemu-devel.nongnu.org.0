Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427505842A7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:11:15 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5AQ-0001bu-Dj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oH553-0004cb-RG
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:05:41 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oH54o-0003vZ-5r
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:05:41 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SCr9Iw001819;
 Thu, 28 Jul 2022 08:05:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=J4zLrWvJ6ZtKB47AtvEwIwufVg88Nh3DAsO4VodK34s=;
 b=KIuz+WuQ2vJ4Mimx1wrdAfAP3kf6gxROeBEuDXDTKj/5fXjPzNcS7PDSQibfEMwUj6Ob
 z5G8udtUkpW+4St3nBkJqrZI9yGJ60vWcfOe1YqpmdQRqrFurlv7KfMInGG0NbWSkoTK
 ayAsbyP2O0cK+S9iPhR7wDRAkw5bpmV0fu770WbQKSj+MVhFgnehTvi1DC+5tuDbytyT
 YYtGX/oLkowCDsY5Y3GT8X0ZOaJYL/PLkBcNUVCEBocAKqGP/sQ9K/YEI1xaPlXzZWum
 PJ+8ZrKZsNFc2kq3ZexGiTT2Y549qxC6MRJmEG4lgIoIiAwHuBhjaysccz8rM/X2KLVa Ew== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hggh1vg8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 08:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KITD99o6b+/EjcK4Fk7bgvpCJN7BZ4m/jir8m27pyrxhy7BMdQkNRp2SI2wUN7Kp9vBRsaSvPgSopswj58Mps5m85SgJyjQRu5Wn4/VEi3H0/UERD01y/s+wEJg4yn516OJNGH4mHQ9i8mujhKujVijRHq5LyhuyHQNeZTGjosn/nx23UzHZndfw8BfAN59+aH/flnkpybHayq5kXr2nH/2/nXdBobV/6wyH6l6phlLA6NBDbC69VIHuovfaGHaSWVqHPFVucUCMUB+z2OE4a0ubCzJ0/JLQanT7JugPIebpTV+bQowDrhM1E2T2HqGwYKrd6IJ18Z0X2+JL4Uf44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4zLrWvJ6ZtKB47AtvEwIwufVg88Nh3DAsO4VodK34s=;
 b=nBBpPTPlAIsigNGIopnvclSuN85GXgpOSv1m2uARcOil/ZIaAeXUGtXCKVzva0wf65E7XhvIop7X9Ui7LB56mV3WOj7nN++IFaOdJzIyhUpNSlO34huv7E+gSQ+AhR9J2IICWRn5YNYiArbkeW0U01LY1Ass3MFwgEc7PZ4yLAagZSmdsJaRsgp8Eke+FOF/Y65rB1CbowK9stvG9OYuIYWusPbnTZ4ZTqmCcyMrajxQO1AdgsRDJMkjfERJADI31FtxTJRBEmFhaFjYAbJnr0B1lmR97MhVYn9laUSUR0oVT2TPxeJ34F9126jF4ua0s9MWSpKrjtpIW+q/X1IY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM6PR02MB5163.namprd02.prod.outlook.com (2603:10b6:5:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 15:05:21 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 15:05:21 +0000
Message-ID: <c388063a-ea01-ca07-8e55-06556def7e82@nutanix.com>
Date: Thu, 28 Jul 2022 20:35:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/7] multifd: adding multi-interface support for
 multifd on destination side
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Manish Mishra <manish.mishra@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-4-het.gala@nutanix.com> <Yt/N629r3EpOLrHG@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Yt/N629r3EpOLrHG@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::15) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca90b4dc-99e9-47c6-d0e6-08da70aa9717
X-MS-TrafficTypeDiagnostic: DM6PR02MB5163:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUa2ByeSXF+nIlMJ2N4/cYAnq0uhJeZI0Y//rILUKb35twECGfn/F2iXC5bUIDIU0I5SyPH4uH1Pm6dhlqjtPTdK6XbUc21o3qcwxNHgSuEvVe/rSeTgRCHNqUgijOgJNXB97b8YwnSQ72vo6IzNlVSyH8yYM/JzO8xq2HJI6CWKVhqwfXdHtxDM2VppHk3B+cwJ4r8C1YFfVU8ZIRuZ6qNO6giINmnbWYo4ZnEFi2oDefvJFfYoN0FMR0z8LQqVa+ILKgjgaZKc4fNraWh9eicGFaWjXdgoD+dVWTBea0QRkqgCqAEckEcvU2FKPC8azjzaXn+UOWvG+YBrw7rBN6zfnbMElyLe/rtFzgm1bf4G9/jw6IxEJ+C4Bi+xPLJZBrgDj8DcB2q/EIm65pNIF05bEXcI/FaXDofCcr2WyhCbGSlQLsr0TUFup+y99NiKoMq0rdLRe/XQHnELCLkgvNAn5a6ER9a8osuW8kGiMdwISPDS+YG4zLwjVMML82QbbxWUHZsKMR+5Cq4E48Q1WkyGlB/0ze1/PTaj1jHOzBAKgDAdf6q+qHPOHiQbqyESMhy+dJ9Rggx3kf3xNE0+0sLqc/Js8R6ToudzmlZKBVQsuyc8N88rNM2Q4oou+bFddh+xyq4URAhF2zUlmkjfxu6/T6iC078dh0Ueggboz0WkElRSZT/0aH7HaeZ3Zfo3czMHKtcIuaoV2g+jnsT1mcFB9QX95utwC/EFBrSNQpNJe4weryA+fwqiMkjtkxwqt+2WUijNclNfqI1GsnTXalXmHcGcmSTbjBZx7OCB9L6yAqa+CFDZeURXyAm/jNoYlETVN5/K7bpL5Lzhwq3dbSFZmBd0/O5uu8lqf/lby2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(366004)(396003)(39860400002)(136003)(2616005)(186003)(107886003)(478600001)(6506007)(6512007)(26005)(53546011)(52116002)(41300700001)(6666004)(6486002)(44832011)(2906002)(8936002)(5660300002)(6916009)(316002)(66556008)(66476007)(66946007)(4326008)(8676002)(36756003)(31696002)(31686004)(86362001)(38350700002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJNV0hhZ00xTHd3ZUtLWlZSS0JEMDFPTW9CS2xVNFZrM3VxQ0kyZXNnQnky?=
 =?utf-8?B?bGg5a0ZBVHJjMVUyQzVKTG96bnMwV3ZZVFM4S0x2V2kxUk5vQktJa05sYVVW?=
 =?utf-8?B?c3E3TUFDSlh0UjVyd0ZnaFF4d3h6Z0NNNk53MWt1b09scmpyaThHQThVTUZL?=
 =?utf-8?B?OUl5L3A4RTlDZGNXUmNGR2F4NkRBVWZBdk1sSlZnQVJVQzhGYzlmelFrbUZY?=
 =?utf-8?B?aG5nNEIvQld2SzJ5ZEZ5OG5BTGtFWmpkYkxNOW1SWUZtM0xwZFU2S2xXeGRU?=
 =?utf-8?B?RWZpY0xsVmYvWGJzZWYzRDcwbUZIZDBiY3o1NTdMQk1CZlhQeUlSU2ZTVkFs?=
 =?utf-8?B?VUhuSXF2ZzVtRHFFTEtTcCtmUWVtRmYzbEoxNy9uOTVKL0ZqeGRYUlB0WW1x?=
 =?utf-8?B?ZFlwWkt2NTlrdmduckt4dHRpa29heHhDRERyYTAxU3JtMHQzNUU5WTdOY1hn?=
 =?utf-8?B?azVtRnNsdkt6b3lkcXRlTTJGZzM2VWF4Zk1EQWVCeGw5b0haR2QxdUxtNWxJ?=
 =?utf-8?B?aWJwVW1ORHJQNVJuMTI3UFozR2dwS0R0NHYxU28wMkRKcGcrQ1FPQWk4N3U3?=
 =?utf-8?B?L2VTYmIxa0xjcmQzd1JPeWJuRFNYR1lIWHZGU0x4cit6M3NDNCtNTHFiZ1dF?=
 =?utf-8?B?WEJZR2w3M3dmQU1oVDlqSVcyK0VldWd6Y2FTRGR0Unh0OUIwRjY0UnlVdWVq?=
 =?utf-8?B?WUpGRGNIby9VbStuUFl0WjM0aGdEMG1kUnRLMnB6ajdURzJ0U3Y3b2Q2aG5U?=
 =?utf-8?B?dEZrRXpwcmw2Wk5JczRKZVlRU21uSm40VURIdGQ3N0FsallqV0swS281M3Ro?=
 =?utf-8?B?MzNaemZ2S3ZLZWlMcWtYaVZRRlJKV2hBZk1leEJINnBDWkZaSnpLeW91THNq?=
 =?utf-8?B?SjNkd0tGWENTT3FDRWxWdjdMV1l6dlNveWkzQ2xpN2x0dXF6SG1VZ1luRjVz?=
 =?utf-8?B?aVYrYTYyR3ZvSWltMXM1eHVHVmxIQUc0aUhodmJuR0VNbDJHc0Z0ZDNndkZM?=
 =?utf-8?B?M3pBeVlkQk1kMlM4TFlTMFViUVBtTytDaXFERGlWNklJUjA2VG9ZMjBpdTd3?=
 =?utf-8?B?VnQ4RVhIWklWejhZd1k5Q09QQjFocElNQ1UxaThhRVlRWDBtN0NOdTBCUHIy?=
 =?utf-8?B?bGxjTmViMTlhVVVJYW9HRXJ1Ukc3U3dVbDFURjRRdlJ0TzQ1WUk5aWNZM1lu?=
 =?utf-8?B?ZzBmQkE2NUl5T1VoMkI4cmErdGFvcFhnZEU3bytUY2pSdWNhVU5ZNzMraHBM?=
 =?utf-8?B?MC96MmpjTkxwTE5tSVpXdjB3UnBHZDVXZGM5SWZGeHhianc5SjhrZ0MwcElK?=
 =?utf-8?B?bG5QN0taM3VVZFdmNjFVWEFSVWNxanhqKzFsd2dCbE1Cem1pc203NXMwZ0pW?=
 =?utf-8?B?RmFGdVB1Rmk2QXJUaTZGR0FGOVZEZW9tYi8zSHdBdENqdVNIZUFPYTFmcFdJ?=
 =?utf-8?B?UTFHMFpTYWJOam1hZ3pQUUczUmY5MG5SdStXM0ljZ3dGVlkrWDE2Ri95RHRi?=
 =?utf-8?B?bzAvSi8raVc5ZEZjZkUxL2FDamdtL3BRRkVSSmhvZjF3anVVa3NPRlVGOVhr?=
 =?utf-8?B?SkdOWC81cDZNVmxmMXJWcDRJdFpVV2RueFJBdmdKdGtaVlVCd2xuaHBLejcw?=
 =?utf-8?B?KzZLRDdPNjhZSUJ3eXYvWlgvWU1TMmNXTzVjY0FxRzNwWEJQZ2lrbHNTN0xr?=
 =?utf-8?B?VUxnL3gwM2o0cy9JU1RlcCtpRmQxeUIyQ2FqdGllTGgrNkFPNGtJQ3JLdVdm?=
 =?utf-8?B?T3BaOU5EV2dxSU5ROWliYWN0SUVjbmVIdWxHUzhKeHNKWnBtUkw0YkFhd2J5?=
 =?utf-8?B?d0p1Z0hOYzNJeDh1NGtnTnBBOTg5cGdhVFdJV3lTYVpIMDNJQ01WN3ljeGJO?=
 =?utf-8?B?RmVEc3lBeW1hQ05OSDFoakdvdU5ndWpEMXQrZHF6VFNLcERYWW1PY2hLOUts?=
 =?utf-8?B?UnREVk1RbmRXNms4ellYK0EraVIraUFvVVhQUkdDUitad2RuT1hrbEJ5bGVQ?=
 =?utf-8?B?Y0FTL1VFOVFhVnkydHhzRjhMZitldWlRV2h2UnZ4K05IekR4MEVraGIwanQ0?=
 =?utf-8?B?dFMzM2ttVXdabWhkWHhrZmFqbnMrYWxlcFNYNzVMZDYwOFBWUk1FbVdoVUdu?=
 =?utf-8?Q?SBlYc33CYmPVyiUbp0G3hRlPw?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca90b4dc-99e9-47c6-d0e6-08da70aa9717
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 15:05:21.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+RO8tYgDlmumS6AZAaOy6DuRQp96fZvq9gWWQmH42y3F8F7i1J0Rcqtfu5PO4oj0Mas5XRDVdJsQsOmR8nxPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5163
X-Proofpoint-ORIG-GUID: UE4KKXQugTPPTjnB9bqBnEp41QsNs_vd
X-Proofpoint-GUID: UE4KKXQugTPPTjnB9bqBnEp41QsNs_vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


On 26/07/22 4:50 pm, Daniel P. Berrangé wrote:
> On Thu, Jul 21, 2022 at 07:56:16PM +0000, Het Gala wrote:
>> i) Modified the format of qemu monitor command: 'migrate-incoming' by adding
>>     a list, each element in the list to open socket listeners with a given
>>     number of multifd channels.
>>
>> ii) Qemu starts with -incoming flag defer and -multi-fd-incoming defer to
>>      allow the modified 'migrate-incoming' command to be used.
>>
>> iii) Format for -multi-fd-incoming flag as a comma separated string has been
>>       added with each substring containing listener socket address and number
>>       of sockets to open.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 79e00916a1..5555f0d2fd 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4479,6 +4479,24 @@ SRST
>>       to issuing the migrate\_incoming to allow the migration to begin.
>>   ERST
>>   
>> +DEF("multi-fd-incoming", HAS_ARG, QEMU_OPTION_multi_fd_incoming, \
>> +    "-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
>> +    "-multi-fd-incoming defer\n" \
>> +    "                wait for the URI to be specified via\n" \
>> +    "                multi_fd_migrate_incoming\n",
>> +    QEMU_ARCH_ALL)
>> +SRST
>> +``-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]``
>> +    Prepare for multi-fd incoming migration, with multi-fd listening sockets
>> +    on that connection. Default number of multi-fd channels is 2.
>> +
>> +``-multi-fd-incoming defer``
>> +    Wait for the URI to be specified via multi_fd_migrate\_incoming. The
>> +    monitor can be used to change settings (such as migration parameters)
>> +    prior to issuing the multi_fd_migrate\_incoming to allow the migration
>> +    to begin.
>> +ERST
> We should not be adding any new -multi-fd-incoming CLI parameter at all.
> The CLI is so unsuitable for any complex configuration param and this
> is a prime example.
>
> If anything we should fully deprecate anything that is not '-incoming defer'
> such that we become 100% QMP/QAPI based for incoming migration config.
 > Sure Daniel. We will depricate this -multi-fd-incoming defer flag and 
only keep QMP/QAPI based migration config in the coming patchset series.
> With regards,
> Daniel
With Regards,
Het Gala

