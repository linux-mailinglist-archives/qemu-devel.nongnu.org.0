Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2266A73FD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXRkj-0007Dy-L3; Wed, 01 Mar 2023 14:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pXRkh-0007CQ-QN
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:04:36 -0500
Received: from mail-sn1nam02on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::603]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pXRkf-0005kx-8n
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:04:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNZ//f78CNOeeADrYZ+YyZmHPbnTp8KjbNTslS38w/0hefCp7KPDqY1cY5aQPdyHMgHJZwH1jfA75vFU61FMsJz592EW78RL8Vnw5NAVSLwUOYVKnqE6unfccD6QD9YwE1Dqw5E0GfA5r4BN1WJbWQmJ3+cPO7xD2Pru4CKAONAWbDF6dHccWHMyUHLdj8fPywyp+TrUKZZHtui98SlVZGBtn1rPIEgbMw2hddvdeUgiYNBGX4rKRGpostKEiEjV4GLjN0Me1nwp3lKFIYPNwZtjR/bIXd8vvYW/P99y+Lc2ZOYfXhU8rrrsodIVZR7o7rczinKm6P2/oBxYVuN10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L5xMwpSZ7B3WWGI5y3lH0ZOR6OzGdrdwCSaUx6aAVI=;
 b=QU3pjMdO+GaL63NxoJ8HC9IqigaitocRP1qvavDgIFUnWsNOZ/xAblDCNDxTDmicOOjOX1NhnluRQEjV4RibzxPbxnBJben10JJEUS9KRU1ggNDp9Ejs/FGdrZOyxdLVpU7GEZ3dcSpb3nwis80fXqyJHkl9nMQimHH43UdMkWI7/x0XByJEffpiQ+gFOA7C+3MxT2RzsOlS803xZimiaMTqGcWYlnnM6DbbWUo81OXkCZpSI3o19zO4soRx5bJoPLwj4Llkeeo1TxQCDj4YxBoLga8IbKj412OGp7u83KbYeYHLZX2meVYvVl2naPlEGUTX8u0lDdv2kpWDh2DAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L5xMwpSZ7B3WWGI5y3lH0ZOR6OzGdrdwCSaUx6aAVI=;
 b=hSxDkYpPgmnWm+icoUTVEzG1OunsvX6ozsbuj8p9JOxYOfqCQVOdj9TysSO5oiLweIg16CoEuRArQ8Cu56bdRGumtNust+1LLgoMNBPRvD1gwzoVuAkxiYO+bX+McXqgI6Qaz72E8iMg+08RMllTuXyfstYvdgvODrCpuQKIO5+9TXT1U9M4wzubB6yWCCKXYAJ1LZTYWKf3FWq60F0FYbYHGwhbzh/FfREL4In6RXKktg3FBQwhJZQc5TwpeyQQiLfQnHs8UO31uXyjsSQ//rPE5LsQLThpbcN2WwH8/MnKxJ4RZoAVqKCcNGOzgeQQ3P/d7DSRUGUjKsJxESdMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by SA0PR12MB4527.namprd12.prod.outlook.com (2603:10b6:806:73::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 19:04:25 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6%4]) with mapi id 15.20.6134.029; Wed, 1 Mar 2023
 19:04:25 +0000
Message-ID: <0af32442-5780-0bbe-a4b2-71e6dd71c03d@nvidia.com>
Date: Wed, 1 Mar 2023 21:04:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
 <79b05864-3feb-8e3c-ab03-7c656027741c@nvidia.com>
 <7db50fd1-014e-6ee1-b224-5677a98093ce@oracle.com>
 <6a42ff0d-5400-f3ef-8316-3a1233c096d3@nvidia.com>
 <15861d03-df49-69b3-da78-083851ebded2@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <15861d03-df49-69b3-da78-083851ebded2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|SA0PR12MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 3463f773-1163-48a4-6dbe-08db1a87c61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gr6+YCseLY0S0vZ+zItvkyC+288f/oNpNV6HNpr4j8IEazsUD/1CAizrlXpj1xVFHjnmFCM8RNm7LdR0cq12aQQl64BJX0qP52iCgpzWV9Y0/hx7M3LgK84th+yqNpsUK2g8tL55xDqy7QJ++wHE1Fomcy6OqzlcFc/D/7FTXC583Df0WizfyjZZULDefuFZlnbjazChSSLAOkMxMbf1VYFLGDpx8PLCH4b/m5mTCsRxfC4bmh3sNLIeqrcSOVJcZ7P7lMMcFoMNskapXz+nuDhCgSUEbC/cw9IADOYq0geeBGGbJVRrIbJPMLZ1AcWAv6mzxfPTucAOg08xrLTdUsbo6R2jlOsszw5DnJAYHPceDyBXrA/jshdPGLc+xkUgfil54E4eI6qxAb+WTZPamn6mrZZYD8BMlpMCcRiIGcPLKO92/T2XGfvtkqEnrQo5Fcv/YqS6SYXNJTOSO9LPiZG/U+Yy4YcTd8T/7R9h9PBRY7uiYp/Ft9nT7y8df5a51DTp4WhfPl3yat+O6+x7jmqUQwZOE6h4dJ8/PAohglcKdCCq/pp4+r6OVt28SSg1XSzzA4Uvcw3KiT+dsGUinMf0eLWR90t1ewmpsHGs8fkjxzlVnO63pTqbXn+Y5XgoWHXGwkMp4NHiOdgT4appDTHPZIAQl3kYIcKP73D8AuDLAsiiL9cK9AnTzgehL1F3huokynRo86UkAM40/oqXG0AUEF4cI6FzQ73YuIItjjxAwacRsZv+dE8GyGVjObo6onm1CLSPX2jcfxeABPjO+D92tAWlika9jplLY/Iww6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199018)(31686004)(66556008)(31696002)(86362001)(66946007)(8936002)(8676002)(41300700001)(7416002)(4326008)(66476007)(2906002)(38100700002)(5660300002)(478600001)(966005)(6486002)(107886003)(6666004)(36756003)(316002)(110136005)(66574015)(83380400001)(54906003)(6512007)(6506007)(2616005)(53546011)(26005)(186003)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJSb3cycmJmbGxGeVRVSmJjdHZPQStyMWhWZTRxbS9BSi9BdFkxeHhsUnFY?=
 =?utf-8?B?bkFINnpDYlg3QlVITGQydDF1Z0NOMFpKaStJR0RmSUJlVHY0UngvMllZM2xp?=
 =?utf-8?B?UUdqVVRRQnVLZGxrYWZvYmlDeTZxenRsQTRJbE44UlNyRGNhNkpyYkd6NXF2?=
 =?utf-8?B?MzJHeGRXbnJLUWhsNEdsa001ZC9TcUZDYUZsbEV1aTNRdHEraFhhNUZybDRp?=
 =?utf-8?B?SGZiSmVSZmJSMDJiMUI5SHBJK3RCRHNvUDE0SldNNXVXY3RZM2JsR3c4cENW?=
 =?utf-8?B?NzJKSkg2NmJndUVoUmVHM21vem9qNmtlMlUyVmlVOXBTTTlleTg2L3pSb0hL?=
 =?utf-8?B?bFVCN1QvYUxTQUY0cXRKN3RmdHl1RDJaRGxhN2pNQ0ROcjUxOGxUbDZCeFZm?=
 =?utf-8?B?VCtXNHlGVEp1MVpwTzV1SFhESHYwd3NJMjBQOW9tbitabTdmMENmZXRXZG5C?=
 =?utf-8?B?bS9LZHhYYW5PM1ppYTVkVk83MHJBUE9NeWdXTG13T0pwRUEvU29XQ0ZHS2l6?=
 =?utf-8?B?MTQ2TDFtLytCdHhOcVBhbWp2eVJiaCtFSGV4U3RsektMemhxR0xkVjgwMklq?=
 =?utf-8?B?ZlRObWE1VWdNaUhTeVBWZXFRQzVVNmRnWkhNeklINFNoRWhiNzJ5YlYySDZK?=
 =?utf-8?B?UGhjeElpejF6U3hoUTlGTW5vVTMyTXY4OGNhcXc1ekVzbDRiQ0lhR0w5ZlVj?=
 =?utf-8?B?OFM4YXJyemVYU1pYT1lWdkZTQXVjYWZDbldta0lvZWVZNEpiekNrM2NLcjdB?=
 =?utf-8?B?UWZOSUZud0xQUFFJV0w4TTNySnBDSlhJWXBnZEN4eU13UEhsTXV6dUpBcm1h?=
 =?utf-8?B?RjFROGtRNmlKbG1OMzdzV1ArK3FWbFFRYlJLN2M4UFAvN1dRRW1JT1VsMnFl?=
 =?utf-8?B?ejFUQTBPeTZYWnRZN1ZncG9nZFhtM2szZEFqa2pZVFo0NlliYktqMnRCY3Vu?=
 =?utf-8?B?cUpyczBjK1UvWWNvajh5dVh2SWtjRlExaHZDYkpSL2hIb2I4aEI0SS9mdG1R?=
 =?utf-8?B?N01rT3piK0tpK2xVeTB6eko5MmRPR1NYelFiSXZDUFJJR3h4b254d3AxcDJr?=
 =?utf-8?B?RVEzeXROVEs3SEVBOWRReEhaU0UxY0Q1dzd2ajdCVjFDUzhWQXAyRno0NjVn?=
 =?utf-8?B?NHA0RFJ1bE12OUdQQjYvY0gyMExaQUk1MWxXYkhmVXRGaExta3pKam10aDJU?=
 =?utf-8?B?ZVVqb3NSQXVuRTVwY1hjNjUzMkhOUWJRY0pPaFJSQmdsY2g4azZIUER1NEtw?=
 =?utf-8?B?bDhTVDNzc0tTeXpNbkJkcW80UjJMTDRHdndOejJYVFhIR1NZL3ZzTVJuaUVO?=
 =?utf-8?B?S2dKTGF2czRnMVk3Zjh6Nmxxc0g5d0kzV0puVTYxdVFZZzFDNDl2YXNIMTJN?=
 =?utf-8?B?L1JJRE9WT25zRmFNNGM2YmIzbi9qQk1GK1ZPNmJtZW1CTktwWHhxWVlRbFRW?=
 =?utf-8?B?Uk9lV3hSR3V3L05YOTlWWEZ3bHNMc0YzYVZhVUFPVzVjdi8yQzlmelFwdGor?=
 =?utf-8?B?ZGxEMkN5MWFPb2ZuajZIVUVhVWNNd1hpeS9CWEhRem54VktlOFJ2bGhoWmt0?=
 =?utf-8?B?Ry9mUmN4ZHZFYmh1K2hldmRxcUt3U2UvWmJOcUhwWk9FOW01SEpwdG1uZUR1?=
 =?utf-8?B?N1FjRmlicVZwTmFLTVBYUmI5dDUrYmljb1ZsL3NXV0s1N3BXZVNGbVpsSkxJ?=
 =?utf-8?B?c2JYd3Y1SWZZaGEvMXpucDY4ZFhCODFRMFcrNEV6Wk14Tjlpdi9TeC9ScENH?=
 =?utf-8?B?R3VPTGtZVmtvUXRGTElTM3E2QnR4OXljd2JUS2xLZUU1RVg1dTFiNHlVMHlG?=
 =?utf-8?B?ZlN0eGZuQ1BYdkRPNFB3ZkZ1Q1Zzekg3OVp0VEd2dGVOSDdKcEovR2o1QU41?=
 =?utf-8?B?RmFabXp5dFpkQjAxK2s5TW9KUFZicXhrNm1vRnhpZVZYTjRpM3NsK3lRODFZ?=
 =?utf-8?B?N3RVWG40YThmRm4xUm1RWFdKSW0zZzNxSDJpWS92SzRSMDJYVlZEOWVkZU56?=
 =?utf-8?B?YmRmSDF1bXIvMmtsTjk0dVNBMTdwWml1UHk4MmJqaGVBM1Z1RERFcFM3b3ZH?=
 =?utf-8?B?dGJiRmU1ZmZEbjBkK2RxOWZlSUlRRVlKMjZmMUVad2JtWEN0ZW02VkZWTE1E?=
 =?utf-8?Q?y+HMbLXrCl5aX62oTtlGuW43A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3463f773-1163-48a4-6dbe-08db1a87c61d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 19:04:25.6030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntHnsXfbijl+ZNpJ8I7oylkqIqmDj62TBt+FrZrlgg03+752/Ing72uamwGy8WhDPUEgecTZVsOF3I+3Z8NAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4527
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::603;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 27/02/2023 15:50, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/26/23 18:00, Avihai Horon wrote:
>>
>> On 24/02/2023 21:26, Joao Martins wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 23/02/2023 14:56, Avihai Horon wrote:
>>>> On 22/02/2023 22:55, Alex Williamson wrote:
>>>>> There are various errors running this through the CI on gitlab.
>>>>>
>>>>> This one seems bogus but needs to be resolved regardless:
>>>>>
>>>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
>>>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>>>> 2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I..
>>>>> -Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader
>>>>> -I/usr/include/pixman-1 -I/usr/include/capstone 
>>>>> -I/usr/include/glib-2.0
>>>>> -I/usr/lib/s390x-linux-gnu/glib-2.0/include 
>>>>> -fdiagnostics-color=auto -Wall
>>>>> -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
>>>>> /builds/alex.williamson/qemu/linux-headers -isystem linux-headers 
>>>>> -iquote .
>>>>> -iquote /builds/alex.williamson/qemu -iquote
>>>>> /builds/alex.williamson/qemu/include -iquote
>>>>> /builds/alex.williamson/qemu/tcg/s390x -pthread -U_FORTIFY_SOURCE
>>>>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
>>>>> -D_LARGEFILE_SOURCE
>>>>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>>>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>>>> -Wold-style-declaration -Wold-style-definition -Wtype-limits 
>>>>> -Wformat-security
>>>>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
>>>>> -Wnested-externs
>>>>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>>>>> -Wmissing-format-attribute -Wno-missing-include-dirs 
>>>>> -Wno-shift-negative-value
>>>>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>>>>> -isystemlinux-headers -DNEED_CPU_H
>>>>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>>>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c 
>>>>> ../hw/vfio/common.c
>>>>> 2787../hw/vfio/common.c: In function 
>>>>> ‘vfio_listener_log_global_start’:
>>>>> 2788../hw/vfio/common.c:1772:8: error: ‘ret’ may be used 
>>>>> uninitialized in this
>>>>> function [-Werror=maybe-uninitialized]
>>>>> 2789 1772 |     if (ret) {
>>>>> 2790      |        ^
>>>>>
>>>>> 32-bit builds have some actual errors though:
>>>>>
>>>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940719
>>>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>>>> 2601cc -m32 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm
>>>>> -I../target/arm -Iqapi -Itrace -Iui -Iui/shader 
>>>>> -I/usr/include/pixman-1
>>>>> -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include 
>>>>> -I/usr/include/sysprof-4
>>>>> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 
>>>>> -O2 -g
>>>>> -isystem /builds/alex.williamson/qemu/linux-headers -isystem 
>>>>> linux-headers
>>>>> -iquote . -iquote /builds/alex.williamson/qemu -iquote
>>>>> /builds/alex.williamson/qemu/include -iquote
>>>>> /builds/alex.williamson/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
>>>>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
>>>>> -D_LARGEFILE_SOURCE
>>>>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>>>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>>>> -Wold-style-declaration -Wold-style-definition -Wtype-limits 
>>>>> -Wformat-security
>>>>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
>>>>> -Wnested-externs
>>>>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>>>>> -Wmissing-format-attribute -Wno-missing-include-dirs 
>>>>> -Wno-shift-negative-value
>>>>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>>>>> -isystemlinux-headers -DNEED_CPU_H
>>>>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>>>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>>>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c 
>>>>> ../hw/vfio/common.c
>>>>> 2602../hw/vfio/common.c: In function
>>>>> 'vfio_device_feature_dma_logging_start_create':
>>>>> 2603../hw/vfio/common.c:1572:27: error: cast from pointer to 
>>>>> integer of
>>>>> different size [-Werror=pointer-to-int-cast]
>>>>> 2604 1572 |         control->ranges = (uint64_t)ranges;
>>>>> 2605      |                           ^
>>>>> 2606../hw/vfio/common.c:1596:23: error: cast from pointer to 
>>>>> integer of
>>>>> different size [-Werror=pointer-to-int-cast]
>>>>> 2607 1596 |     control->ranges = (uint64_t)ranges;
>>>>> 2608      |                       ^
>>>>> 2609../hw/vfio/common.c: In function
>>>>> 'vfio_device_feature_dma_logging_start_destroy':
>>>>> 2610../hw/vfio/common.c:1620:9: error: cast to pointer from 
>>>>> integer of
>>>>> different size [-Werror=int-to-pointer-cast]
>>>>> 2611 1620 |         (struct vfio_device_feature_dma_logging_range
>>>>> *)control->ranges;
>>>>> 2612      |         ^
>>>>> 2613../hw/vfio/common.c: In function 
>>>>> 'vfio_device_dma_logging_report':
>>>>> 2614../hw/vfio/common.c:1810:22: error: cast from pointer to 
>>>>> integer of
>>>>> different size [-Werror=pointer-to-int-cast]
>>>>> 2615 1810 |     report->bitmap = (uint64_t)bitmap;
>>>>> 2616      |                      ^
>>>> Sure, I will fix these errors.
>>> Just a thought: should the pre-copy series be moved towards the end 
>>> of this
>>> series, given that it's more of an improvement of downtime than a 
>>> must-have like
>>> dirty tracking?
>>
>> Given recent discussion, maybe it would be better to split this 
>> series and go one step at a time:
>> Start with basic support for device dirty tracking (without vIOMMU 
>> support), then add pre-copy and then add vIOMMU support to device 
>> dirty tracking.
>
> and add the fixes first in the series. They could be merged quickly.

Yes, of course. I will add them.

Thanks.


