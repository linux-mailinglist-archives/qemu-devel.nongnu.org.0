Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D626909C5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:23:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6sJ-000235-C8; Thu, 09 Feb 2023 08:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6s9-00022a-GB
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:21:57 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ6s7-0000Ke-7c
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:21:57 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319CftrR009789; Thu, 9 Feb 2023 05:21:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=lKr7Tzmx1zhMtYLTzJORTG3bsVHlPSBrtUoITbfKFIY=;
 b=aGNd+kjwakhLus3UmJB96kkUQeUQzXBVRkmEDvX0gQC2ht10DOilOP5LQZKJZjNIq0ll
 z0nuPM5ujlWFvRzb5I9JVW9ZOFq9CExjYhNcQQvW3a5do3HEyv2N2+9qe5JLJe2QIHMx
 dUcRrSrDc7abkSei8fK5TufIMfs3Nbuykrt5MF47GrDQJQAKPnp2qZXyUGzUzMwL99ne
 WW0leRxg4rJDk10CsD0Xn7rMBs6f4dg8Xuu4LimT8njXIOHgjpfY/IeRk+NsmgXC+YQI
 2LVS7cYZjVHoWOagDJvd9VP50oEZYuI0FDgOtCRdUHZR2O6qPF6L+z2jxl/isnGP+vQ5 PQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqanqjwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:21:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt8RN++U4yM/jrSyM2YhRS+RLWbNlnvp/RO21hpIme0bjWQ36wPHf28N7IBhTvy4IsRh7FHcgvlRQ4u8jkY1E2dwJGc3DpIDrf5Uyo4prRR/WXaBp8XRIbnfiaMK6gOAUK/efK7PZRpfTPAY4lJhR88Mhw5dkBz/hvYVemP8uX04F2U8v4HOU9tE7FUP7girO1VhZoi/QAaxIiD6qWtmapsG58oiJNwb4sgl+jnzA97pHuA9RqBJEmrQ2kEhF5d3JYvHe0TdKtjDfcfFNq/rOqgUOR4Qyf42INrCX6sDFNTXTRnxcQ82Nd6Rajd6+l+sE59e7cMOMsI9LyG/vEXEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKr7Tzmx1zhMtYLTzJORTG3bsVHlPSBrtUoITbfKFIY=;
 b=KAgNOuPNxd4YLQR2OuwuYkcC+Sf3q4A8Z7U0EkJD7LQLh3IKZYJzniAWCoTiG/WMsRWimF8JaYKG0A+sg8rhfCYRiraJc+hvWgP8Z0DMsI1YSVnCLWPluflDZ2J5nu8gaWbF22wwEaGBhiZWAV7ee5Pn089/ybyZfjUpvIHJc8wEzw7XvxSPeZUz2biXnXgUbRsgCmSzCqVAZRdfHMR3hryM1sMztBWS39i/biBcvW50x+y9nVfBXevPRK01FvkaIyYg86LXV5lnV5KsnVn+JIZsDorUcU04bLc349rE7Wv/2w7X1oP+ewhdhcf6K+TudRqbSxlXvVD29hX/sIGsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKr7Tzmx1zhMtYLTzJORTG3bsVHlPSBrtUoITbfKFIY=;
 b=X9R5j6wQePffoyornTm+lkw/oA7f9M2aMgd0D2+zMYpPC7nGiCUDDsLnbWrkzTgGF7X07AhJAC4/qVLUv2Er/2aJPnij5UbaAxlFwtud9k1micA89jpx3HG/70K4Ztb95hW67+ZnGi7UT1I4wM7Sj7IpzzwYfII6unZe8UlL1SOFAaJc4WQaSZiB/tPZTCUwbwBdUQiYyj2BGePDto/Mw7yalONIaHBmkBx4YHYg/9xptREw8hzprAHAuT36SUj63eWzItLhmGl8VMVhlWa4bBE6n9PosnobfaaFM7x9LkYPUxvNoZsd62p33ArhViiTVU0qPx2UCDWulO4uuROEZA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA0PR02MB7275.namprd02.prod.outlook.com (2603:10b6:806:da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:21:40 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:21:40 +0000
Message-ID: <a30f9796-15ca-97f3-f946-b9759c7b187c@nutanix.com>
Date: Thu, 9 Feb 2023 18:51:28 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in
 migration code flow
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-5-het.gala@nutanix.com> <Y+TNuesEEUeYqF/u@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TNuesEEUeYqF/u@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::32) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA0PR02MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 082a4c9b-db54-4af2-fb01-08db0aa09440
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMXi00xlM153P9sw7upKW28D6tvBzhRRYnKVRmWw7ILxCIsFQceCREP0Qp9YKVng3LfzKY/pS2Zumu3zKMD6dYL9f2WowwI5P/l/mvahbaKhQkh58eB1nKcmC49AbKAc/H7S6Q361f+qLxWLIWg1MdKzr1ukk6TChKe/odrZ35sDaqzqy5lbZSeoJ9cmftOQBdMS2DRn6B/ccYNvqxJXzNgoUjDmwjP/R6IfGzMHAtrcAESZW5PUm0H0yBclyLqTfnv9bQ+/qjVw6NkxndRPrK6WQVt8z76N+J+yi2m7/zqiroXLB1GbcnjJ6xrp8Z7Jq8M0LHqbLGCfwc7y+kkVi7eCokogk/2tEPtWJWSfxLC/0j3OtKC/AeWq/OKzZFdDOWQtTrC1oF/lXr/K2LGcchtmuOUsOCRpr4SSiI6n/nPXAIVVWPSFUd4RPfJuGw0vuyg4ZGy77vVjkVxdPqB1ygsjxJHmo8GJFrEiT0cSLtUkzOsBrfDTSXxSh/fKQfCCNuBitQLAAuY+iizvlwgiVV6cjnPOLcP0Z9F5P5zcwEBW9v5xvRHq4ksWPT4Jmy4Q5As+wCNcKiXt1xUVQlDmSi6HHPvQyoPmmA5l6aAsgdV2gNmYKsbCKn3ilpWdfW1eu3m9xJXFrQFs+IVUIEwsT1HjXLGUDMf/KiWjikpGdQF22qn2Zplzx8w7mz+52EeBe1Ubm1PyVUVi0cLJGqAZurcvQZW9MAbXcxSOjsVqquU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199018)(36756003)(107886003)(6666004)(6506007)(26005)(186003)(31696002)(53546011)(86362001)(6512007)(6486002)(478600001)(2616005)(5660300002)(8936002)(4326008)(6916009)(41300700001)(2906002)(44832011)(8676002)(66946007)(66556008)(66476007)(38100700002)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEw0aEhJMS9NbGwxWUVXdUtlVE9QclIrZHZCN2pRNlVFNC9GaCszZVc3cS9P?=
 =?utf-8?B?OWUrcXdmWkVBYzg2bDJsUytuUnhHRUF1WmZXSm5MZG1mb1JTVUo3d1JuckZG?=
 =?utf-8?B?NWVWMmVBbE1jVXFKMVRkM3J4OTNDYkt2SkVlN1g5L2FtNzB2dm5zRndmY1dm?=
 =?utf-8?B?dU9Tb1V3U3N1eTNScGRYRG0vWkJBeG95aTdScUNiZ0ZMemxXZHlkbzBwZmdE?=
 =?utf-8?B?RU1PSnc3QitOTmxQRnQ3aFkyNk1SbUY3dEMzRFhlT1c4aUR0Tzd1dWd4UzJ4?=
 =?utf-8?B?a1ZoNm52elRoVEdsbGc0bW5sLy90b040SkFvbkV6OUp2dGdaOW1VTEEvc1hJ?=
 =?utf-8?B?V1pkMEY3SWpsZGR5VkNDS3VKRitmTTBlNkh1SXFzWWM4V09WZFUwZFp3NGww?=
 =?utf-8?B?UkVMRW1DMm1PeWNONXMyU253WGhRZnVpTVp2SUdnWitkQXdMODJYQkhhaXc1?=
 =?utf-8?B?RTF5YWtKK0dOZVkya0VRb3JWblBIUlNTYTlsT1hLM0R4eWFVbTVwWVd5N05w?=
 =?utf-8?B?M2J5UkF4Y01ML25zTUhMdUZKcHBwTFh4RjFHTlVEUDVYeXR1RjBGS1d0SmUz?=
 =?utf-8?B?UnpUM1lHZlBFa3J2ZXlicmVEV2xhcko5Qy9Gc215MDJHSG10T3QvZGFPNVBs?=
 =?utf-8?B?c2NFT2dUN3dWcHQxbysydzU1UnFrQlVGNk9GYW1QYnlCZXFKRU9sdGV2U01r?=
 =?utf-8?B?bW5rQXlzdEY1dGRMTDZQS21MQTk3NGd1WVNaa0RxYlVmZjA2ZG92REV2T1FI?=
 =?utf-8?B?WGRHSTZETjNLdXd6L09jbEpJS292TVB0TEMwZFdxUDJCL1BiRU0xNVJwTDF0?=
 =?utf-8?B?Y1dPZDVzTnQ4TU1EQlFteldicGJRRDJEc3FGOFRrM0RDMFVzeG50YUdmSSt0?=
 =?utf-8?B?UHd5dWR2a2JaMDErRVpRRHlrcGpPdkR5MjA1dmwzY1JUUHlaY0ZEVmxrZFZ0?=
 =?utf-8?B?WXZWNFhUbGhiTHVjaTYwRzRmaGQ5a2FYZ1VnQUJHYXFVNmFzcUxPcEtQczcy?=
 =?utf-8?B?S3VpMi9LTmsyUFVPa2ordEUyUG9iaXVPUkcrNlBSRThodEl5Ymg0WjdEUmNp?=
 =?utf-8?B?Z2F5N05DenRaVks4dHFieFUvbzFFRHk2cG83anhlZTBIc0UvV1p6bWppem41?=
 =?utf-8?B?dHZWS0t5WnVvMlNKN3Rzc3poRFhHMStJMm91ZTZQaVZEZ2xZcy95YklwTGJ0?=
 =?utf-8?B?eElqeEd6QngwVG5qNmVacDBjM1ZkOE9nL0dnc1VEMzgyTjdmQ0N0aUJHbW5U?=
 =?utf-8?B?VmlIZ0lYMlRVelZ1Ylp1RHZlUWdYSFFkQklQNFNVNUQ5YnlXOFJZeTZ6UEdG?=
 =?utf-8?B?SVhzYUZwS2Rka2F4ajNRMnhwQlp0TmQ0YjRmQWx3RE9UL3VRNDY0NEIxM3JY?=
 =?utf-8?B?R0Q2OGFxam4ySW85clp5WlpEYmI2MUk4MU9tWU9aSU9NZGtVWkZNMXozZkdE?=
 =?utf-8?B?dFlHNUVZdXFRWlVaMmtBb0RhRXMvaWd2Z2J1YytOYmJTUnN6YVhlSzVvd0ZZ?=
 =?utf-8?B?cEcreXdvdnluelZRMjBCNkltT0R2STNYcVlQWVIzVmRPclZUcllEWFk2Ry8y?=
 =?utf-8?B?MitOcVVpRkQvdGNyN1RKSDk5TVRnaWZhWGxERFl0T1RiblFqSUZHNkhXQWl5?=
 =?utf-8?B?UXVYc0c2dlpXMGExMFU1ZTZnUUI2THBhNVhiRVJEZFBpbVdoR2U3ZUVLNnMx?=
 =?utf-8?B?Y1owdE5vUVNGZ2RaRysrc0twWitPRXJCNml0eG1JakRsSjkwa2F1aExTTllj?=
 =?utf-8?B?d0d0dXZrZEpVa3VHT1l6b25qNkZBdkgyWjk3czFjQ3RVZXpQVGpJbWRHbU0r?=
 =?utf-8?B?ZC9VQWR6Q2haUkx2T2s5TnQxNzdTQzFpVm1GTmoyaHRSdW1mSnFBdzB5dFBW?=
 =?utf-8?B?TFVoc2R2MG5nWmQ2b3dvaHlqTE53QWdIZ2Q4K2krT0lDRlBnL0cvQ01uSXVo?=
 =?utf-8?B?UmZxbCtTRENHMFB1WnBUN01DOUFlK0ZLZDAzSEk5bGQvNlRxNkdOck41Nnc3?=
 =?utf-8?B?U1NHSjJXc0pjUnVHSUhYVy8yTFZodXRhK0Z3Z2NIWFEvZGtoc2RxNk9sZ0E0?=
 =?utf-8?B?ZW9NMytXVmZmS0ZMcWFNeURzbmJ3N3RLZ1paWHBMWFkrZllwNEE2ZTdoZzha?=
 =?utf-8?B?MUpXcXRodGFXQXFPTXc1WmNuaXpCenRld3NLWEJ1R25HZHhCbThvOFQyRkc0?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082a4c9b-db54-4af2-fb01-08db0aa09440
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:21:40.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thbKHjxHTti4xnj727QlyMgMrXjcB7z8V9r8COhBPwUgE5SDD6I8eUWVpRiaY+Vexka/QP63/zzi1x9QDGZ7Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7275
X-Proofpoint-GUID: uFyw4VcX9VPjrte4x6QekE0GfJc741xR
X-Proofpoint-ORIG-GUID: uFyw4VcX9VPjrte4x6QekE0GfJc741xR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 4:10 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 09:35:58AM +0000, Het Gala wrote:
>> In existing senario, 'migrate' QAPI argument - string uri, is encoded
>> twice to extract migration parameters for stream connection. This is
>> not a good representation of migration wire protocol as it is a data
>> encoding scheme within a data encoding scheme. Qemu should be able to
>> directly work with results from QAPI without having to do a second
>> level parsing.
>> Modified 'migrate' QAPI design supports well defined MigrateChannel
>> struct which plays important role in avoiding double encoding
>> of uri strings.
>>
>> qemu_uri_parsing() parses uri string (kept for backward
>> compatibility) and populate the MigrateChannel struct parameters.
>> Migration code flow for all required migration transport types -
>> socket, exec and rdma is modified.
>> diff --git a/migration/migration.c b/migration/migration.c
>> index f6dd8dbb03..accbf72a18 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -63,6 +63,7 @@
>>   #include "sysemu/cpus.h"
>>   #include "yank_functions.h"
>>   #include "sysemu/qtest.h"
>> +#include "qemu/sockets.h"
>>   #include "ui/qemu-spice.h"
>>   
>>   #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>> @@ -489,6 +490,44 @@ void migrate_add_address(SocketAddress *address)
>>                         QAPI_CLONE(SocketAddress, address));
>>   }
>>   
>> +static bool migrate_uri_parse(const char *uri,
>> +                              MigrateChannel **channel,
>> +                              Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
>> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
>> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
>> +
>> +    if (strstart(uri, "exec:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
>> +        addrs->u.exec.data = str_split_at_comma(uri + strlen("exec:"));
> Huh, what is the purpose of using 'str_split_at_comma' ? The format
> of this is  "exec:<shell command>", because it is run as:
>
>       const char *argv[] = { "/bin/sh", "-c", command, NULL };
>
> we should not be trying to parse the bit after 'exec:' at all,
> and certainly not splitting it on commas which makes no sense
> for a shell command.
>
> I would have expected something more like this:
>
>      strList **tail = &addrs->u.exec.data;
>      QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
>      QAPI_LIST_APPEND(tail, g_strdup("-c"));
>      QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));

Oh, my bad Daniel. I thought for exec as string it would represent 
something like "exec:/bin/sh,-c,<shell-command>". But you are right.

Because I interpreted it wrongly, I wanted to include this function 
'str_split_at_comma' and that's the reason, I had to introduce first 
patch unecessarily.

Thankyou for pointing it out Daniel. I will look into it properly in the 
upcoming patchset, and your solution also makes sense.

>> +    addrs = channel->addr;
>> +    saddr = channel->addr->u.socket.socket_type;
>> +    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
>> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
>> +            migrate_protocol_allow_multi_channels(true);
>> +            socket_start_outgoing_migration(s, saddr, &local_err);
>> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
>> +            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
> This is probably a sign that  fd_start_outgoing_migration() should
> be folded into the socket_start_outgoing_migration() method, but
> that's a separate cleanup from this patch.
I agree Daniel. 'fd' being a part of SocketAddress, here need to show it 
explicitly makes less sense.
> With regards,
> Daniel
Regards,
Het Gala

