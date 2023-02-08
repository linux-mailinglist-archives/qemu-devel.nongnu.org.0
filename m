Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE368EFAA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkLM-0005Yk-7f; Wed, 08 Feb 2023 08:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPkLG-0005Xw-6p; Wed, 08 Feb 2023 08:18:30 -0500
Received: from mail-dm6nam12on20629.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::629]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPkLE-0006nF-9G; Wed, 08 Feb 2023 08:18:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq1MHBgTdjvdhunyHLMP8XHZ8xXQQLYTEjpVOHWzI3qKvvnDavi1aPHosJGG4mAF3kltSrOZqakxNcljes6mnclcthq+II9WoJznRN48dEXxbCQ+oxA2/0ZOLPks+Vv128zyRE4VQw362WkHVHCQFGoQiOSzHxfZbZyLhj4IJUUhGMpwjTnKf5rXuE8DA9fGSeWs7wIgeI9IalgV48jIZDEFChJjwF7+eMy4vVmLlVEKA5XJENOisdj3mwfOeKT/dffjAXeXsOq1orJSUq+fAjK9RxPOmMwvyuFhpLUGjD4ij4ioke92AmUv4lVYD5QS9aXP9pvesdbKQiPUV2R7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYRS7ppDCgXm2KQCTo3homVa9JwYf44oC1bxFemCKDs=;
 b=eSAngVvoLHiE6hJd3vPUlHCRVRDEPOebeT6dtgzRB9hObfPr0KdIJNoSDYSbLJyXNtWn2Z9AGLosivgq2E2v55c+i4NH2tkET1mE9Y+gwtQp4/fhbwNXUm7bwaFRHTIDSvQIHwURdooaIXqZjP1VO7hswaOhOqfWEvTQbY0ixwCtzMxg7q46V4nnV+RwkJ4q9Q/a02fnIsCVyuaVMs02+LVg4Xg4FerGZaHIH+xe3tkqKuI+oBKB+ChtL2XTDub1DXPTt1mPJyaNPhWFcpv8V6eVn0zi/fHsG3v2mmgnwarBzAc3XhWnwsupRvqiihZ17+Zi8swcpmQUIPnLl4ua7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYRS7ppDCgXm2KQCTo3homVa9JwYf44oC1bxFemCKDs=;
 b=BqqFGToy8H2izwADUfvLvbG+jaMcAFPVXkqqKSF3BeBrAcg4pJR/BnQX1XHrSDhHKFnty0NriWPba8PGT70EqXfYLHBCk4faGKMQbECaDx25RkOGYy9EOV9KAi/nY+/yLrxQmYXOM/8bhvHkBK7bYazwDASc0C9K/OKZi8HECUasz4EhmIo3Sl2UB6zZVuZBEUTtmX7iq1EvofZsbkHKgc+d1idd6lCOIp5CoPv7cyAPk9fjOiwOpVnH02iXYrzCYJXrlz8fCHb5vs8jpkJ/unlwZpxUPCgMMojopqelDl5hETwneoMzu2OoBCatJrCT2zsZ5uQSYCiEzsfP5cBFdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 13:18:24 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 13:18:24 +0000
Message-ID: <e464ff0a-80de-09be-e952-641073b4a494@nvidia.com>
Date: Wed, 8 Feb 2023 15:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 14/14] docs/devel: Align VFIO migration docs to v2
 protocol
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-15-avihaih@nvidia.com>
 <20230207164934.26833971.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230207164934.26833971.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|PH7PR12MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 133b2c4a-d2a0-4676-4bc8-08db09d6f4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+NgCDeZJvAfaRndV+MFRZwk31XQNO6mZRPo7KBdMeHDVgPOu25Vv3XcUS60ki7bV29N9Kc6nTVO1cUUJi4xa1Cz/gtekV0OOf+BjU+Er9svBNzA0CxFLzRn+UUcNVRtrTLNxpKjFVla79iiR2GQndAIPGMZruURaXNdnK2ZoulM1WIUYrLJmY8ePD8WQ9VWQCm6IFxIB88pvSWy+bzgEEWkOduXr57tEzhjOLP3LuDZwsFGzdnsZl+sFV8TuVtBLwQNcU8LreKx+3h7z5/HvKKMlyhuOXXBQ0AKWqh+vsntWBO92MU5UVVUVRqieiNLpsEQbgMiGa348d1n7j7q/gjFQ6ceC2lMuav7GIxPKlzYKFYPpJOCVeTyHKCvvR5Xz0Mw/UDB152Y7VLib9ZmW55xOo3cHhTTA4Bz639AZ9ahn0cF9gZO5xlRd2vodghJjkOWt8O2jEZt7nhPjpO1xSTom4LdHrOfxzr4EezSfsxIOrA7lDrvD6Dhx19nG/p1KoNSmaK1TQjhVlI383IAHAhU6qbuo3d667/LLlthPrIyelXRLInJJxidy/dvcjrbE3/Z+JkGvxG+kqDiBFL1NSr9lA0JN0FMiF5d9MIJ0Ijiu54u5umzGQviLJ/uRHYvZ9/SPccoz0wjJjYEI/cn/opKPfjR48doHk4wqesLkTPD1Qzr4z4IU4nxdMUs0mQmB+rreMuu+vQUyyYhhCYDTdHQ48Z7JIWO1+ejPfflNdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(66574015)(31696002)(38100700002)(86362001)(4744005)(2906002)(316002)(54906003)(41300700001)(36756003)(66556008)(5660300002)(7416002)(8936002)(83380400001)(6916009)(8676002)(4326008)(66476007)(66946007)(6666004)(6506007)(6486002)(53546011)(478600001)(26005)(186003)(6512007)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTFwZElkVklSSjh5ZzU1ZEpVcWlwOFBGazFnVVlIaFpWV01OYzFOYjc0ZnBD?=
 =?utf-8?B?S3J4eUJ1dVdHY2o0TzJkeXh1a2dpcXcvQnB3RVZvRHlLaTVEdVg3NCs3TzJo?=
 =?utf-8?B?VTllaDIxTFBRbjlyaVRqKzIvZXhKNEV4Wlo1VjF2SmtnN1VvMFgzTDFhSmkw?=
 =?utf-8?B?UENXUVVsU2JxZi9qbkJsZitUUm5DZGRnNGpnMU5vdzJGanhjY1YwQ3lUOGVy?=
 =?utf-8?B?WC93b1B2Mmc0Nm4ydkhPYk5HQU9rcUIzR0treUo0K1lYUVhVSUE4T2pRdDZG?=
 =?utf-8?B?MWxjYlltSUtMaGlVYU9YNGxZb0R4MHZJTVV1KzZuN0hkUTdabFJMN3BhbG05?=
 =?utf-8?B?b2VIdk8xNnVDeGVmVmx0MEI0UlJHSElFeUgycTNsd1RuOGsyaTZOeUt6L1VL?=
 =?utf-8?B?MzFDMnd2bmZ4UHVoeHVlUVNuL084V2NCaWQwb1ljckIzT0pxSm1lb1crbDl6?=
 =?utf-8?B?d3hJTnR6VTFaVXVzTTN0dHVUZlNseVY4SjRYbGxvanh6M2lhdU1tdmNObU5E?=
 =?utf-8?B?UWFKdjBraDNHZXNRcmVvOHNyMUFOSnNsdDlrQmlBU0wxbkZaR1lCTjM4eFRu?=
 =?utf-8?B?Nnd4d2VSa2JXZUs5RXg2c1lsU2MwRzlHcmRGajk0MmtSVlk2WTRuaDZIRDU4?=
 =?utf-8?B?cHd5UkRGZ3l1MUQreTlmQ1dkb2hzdFdncnJnK25TV2E0WUljWE9yNVJoTURo?=
 =?utf-8?B?NERTMUVjVk1WdEFzQVJXOUlaU1hmSFpqWXlvYTZjdDRmbDJMellkVUlPMXVk?=
 =?utf-8?B?ZXpMR1M2OUVWbCtmNVlLRFNjRG1jNEpnWkRDMEovcVdvRE5QcnhPbDhoRUVn?=
 =?utf-8?B?bWM5Ym01Qi94NDRlbVJlK01oUDUzcVVGejlwWmlQcFZjV1RhbTl4QUFrTHBW?=
 =?utf-8?B?TjJ1M1pjZzJIVWdub2VSbGVyeGNPTFM5R1hzNDVwYmlJL3NrWDZ0dm9qQ1o1?=
 =?utf-8?B?RE1MVXhDMnEwclRYMDNpRVkvSnp3U0xSNmhOWGVYdjFJWlppejhGNzRUeUFS?=
 =?utf-8?B?RGFMUVpoNldHWkl5bEVmWlpZQ0dpeUNrTmZ2M1NlbWw0S0JFSk8wNm9uYmls?=
 =?utf-8?B?TDdkSitDd3RYMVVnMG84RDFZUjBVNGVTblNBcS8zZnhmR1hTbjlnek5uRSta?=
 =?utf-8?B?dHJUaThxWnZGWXFUSTJrek81UzJzLytDS3VVcXovK2JmcHBSTmp5aVJIY3Iv?=
 =?utf-8?B?RTJ2emVsTkFST24xRTkyUzlSMkpNc1hWbzRaNE9wVXM2bERuUVFPZzBDVUVV?=
 =?utf-8?B?WkFOYitWZ0t2SVNEU0pQUUZSV1lqMmFCbFlMNFI3MzVpOFY0Q09jU3NKZmtm?=
 =?utf-8?B?Tm1jK3JQUzQwaEdXeUVMZktPTU5HTDdmV3NiaTVVR1M0MjU4RHJEaVMxMytK?=
 =?utf-8?B?WThoZ0llcUNaYjkyaFNlVHphbkdTWVhlZFVpNW45QVl0aHBJbG8rR2hrdHhS?=
 =?utf-8?B?RXFiZVQ5a3ZRdEJHQnpIZVFuSTE1dGlkUnFXcFNWWUJHOGJnemQwU3ArN0c5?=
 =?utf-8?B?RjEvM2p6S1hlUDNkZGRBbnJsSXIxN1BTb2pOQUtZdFBLVjFBdEhYT3JMcnVz?=
 =?utf-8?B?N2ZuWlJiaFNuZGVkVmV6N0xPZEZuWmpYam94bHhveGdYWVd3empEY1FzVTdN?=
 =?utf-8?B?OU8rUmNJSzlZMzI0R1FFcE51ZjRiS0dtbTFOSE1YT0VPbGgrUVdKMWVkcHAy?=
 =?utf-8?B?aVlhYWpqVHVBa3cvRE5RRVQreEszUHYvVytKellNSHBVN25kVDcvdEV6ejRF?=
 =?utf-8?B?MkRCK1pxa0xYYWpGbmdHYXFDWG1SSzZqQkNWVUc3SWpuMXBBbVNKRWdMSDFW?=
 =?utf-8?B?WEhiamdFYmFkV2U2WVpCT0N4bUFnTmM3VzBJY1Zzc0NQeHEyWnVkcDZBUXNh?=
 =?utf-8?B?b3dnRkdMejhBK2VKbmptT2dxQlNDT1diYXNTeitTWXgrSzR4Z21ETXB4bUJR?=
 =?utf-8?B?c3p2dDRtUWoxeXQrd2R3VHNTM0hSbEtDVUpWZWtCTWxzV3ptbEVMUWtLRmVW?=
 =?utf-8?B?bHR6OUFyN1VYZHdHTGpZRkdUeTY2VUc4MjEvT0V4Vm5Gd20vN3hQVXpINWxK?=
 =?utf-8?B?WG1sZ2VhdzlwSnhOUzlUblZGanVNUlZVVlpkaU9jWGowYW5sTmpPQk5xMjJq?=
 =?utf-8?Q?Uq8qLtHqZ8BsRIgrNBLqteYUv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 133b2c4a-d2a0-4676-4bc8-08db09d6f4c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:18:23.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psTqhcKo1eQ3HP9qX7RyjiSkKlZ38H6aPodurxjcFX+ltv4uPpYdOPufjSfXMhBMsiLvacnLgcZF3Xh/OluXkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106
Received-SPF: softfail client-ip=2a01:111:f400:fe59::629;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_PASS=-0.001,
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


On 08/02/2023 1:49, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 6 Feb 2023 14:31:37 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Now that VFIO migration protocol v2 has been implemented and v1 protocol
>> has been removed, update the documentation according to v2 protocol.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   docs/devel/vfio-migration.rst | 68 ++++++++++++++++-------------------
>>   1 file changed, 30 insertions(+), 38 deletions(-)
> A note about the single device limitation should be added here.

Ah, right, I forgot about that.

I will add a note.

Thanks.


