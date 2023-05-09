Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A716FC5C1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:03:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM3H-0001QG-51; Tue, 09 May 2023 08:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pwM3F-0001PP-64
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:02:41 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pwM3B-0006Nt-4V
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:02:40 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349ARaju008864; Tue, 9 May 2023 05:02:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=MRtnUUVT03dVMTsGBdxtuTdJ3lboGerwI4cIWRmeQnU=;
 b=uk2oNCQma/7w0Ket630oO98cgscE5CYwKi+LDljONwtSBROiL/4ZPDP4PclUq6pQGoGH
 emgbbw3ZCY+hH9xuSgHoJ399L+zQud5EkwHpkwTdKmkkvfV3/t0nHj1AJHNAWDAx8k5E
 ol+392I0ij1rfLe/6ier7JFwi9tptUuPSDQLvyYlG4afr4qIfneL25xvhTqXe8KYSpMF
 q8GwAfy+z2ffyQwpuyFmFs9fO5cI3UZ+Gai96RmIsQX1LPZuR7Sh28D41GrtV1lYkpf9
 IflhR/cia7Tc05Rx5X85S5E2kggUp4vSqQLVwBUY4kS1t3hhwXi+9RRdlwJ0riLF22Nr Mg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf8cuhe85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 05:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz+YJRwztX11keu7EtBS5aH26NItJqiZCMsCJQnWFtKG8NHKO/3g4fvoUXOfVjvXpy/F/whnZMWC5b9Q7JgLo+1+s7golGrsf357JnkyMo4wveZs7cBm0QKHjiakKId/Lkkykoj2nxxYVgnOlwtvpaz6NsFUM7k7qyCSnLoc5cf/EIvzbVttsJjt34X5jlCWZ0V874cgdb9UPjnBsVd1/oYfv1MAxeVEOomHEatJkvQ+oewCThYOAHCG/iDLUmHTeka4/zUYa3bfUI6uNXfKneex7YLGzL91SX6Hh7KICqR9+06UJ50tDYIdTjj4Hy1KNRu5Y02elYAW3ZYTeVPHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRtnUUVT03dVMTsGBdxtuTdJ3lboGerwI4cIWRmeQnU=;
 b=FsMy7wM4OIfQa+L5jr0SN7JVCizMbMG1o6hb/c2O/HxUwHLaFBWIUVjI7p3AzqeutFNzePGs1mAmbcKx2nAaYUg8nd0jxbZOBjWgdcQWf8e6BJ7O/iP07F/q4NcmGP/OWdmwfz6TbpyxUOE4xDk59ZEwBLfd7ZH3hU7zyzXkDRR6bTLuztx36zZOsRHE0ctpe/wLL9SKgnZ1ZBS2lvFBeX2R5hcicdOMVKVaKeOhn6pzXWi7pGYfIKtcAw1c1QdtS32PJoIlmnEWNANvUMhqs28GI0UdL+gW0oG+zlpeZw5yIeJG7KF+23+4zC5xQVDBNDceupk7DOD3ws6AE8KAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRtnUUVT03dVMTsGBdxtuTdJ3lboGerwI4cIWRmeQnU=;
 b=xpN2yFXz8vNLtPxia5oYsYXG/kdKPqaK+KD90xOj1FOOlGMR3hEPRFyvQf6qmp2Z+lXu5t2yhKris31nc/ViO4SdakyiE3MaMKBzlAuXfeNoIWwHzVzGXKe+imjOlvGuzqP4l5PSKu4TCdkBbz65oLMOfQVyf+8wRt/ihjeLIwqZGPmDpZeNeZo3Ik0RxMQCMkBL+hjvjmrnLdkLHILvFxY79bo04b03iqCDKHwlftjQqlRwgOaJxSt0Id62K2LGQfc6eWKIjrx17g1zZEPtdjOn5oLv3WFOYvE3TKZslgRAJ5y0VbBpGJoSh8fCuUsOYEH6ZDfD11qWpl2DPNTODg==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by MW4PR02MB7233.namprd02.prod.outlook.com (2603:10b6:303:65::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Tue, 9 May
 2023 12:02:32 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 12:02:32 +0000
Message-ID: <141c4d9e-a3bc-02e3-fdbe-d2f61605e7a7@nutanix.com>
Date: Tue, 9 May 2023 17:32:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [RFC v2 1/1] migration: Update error description whenever
 migration fails
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 berrange@redhat.com, shivam.kumar1@nutanix.com
References: <20230508153223.133081-1-tejus.gk@nutanix.com>
 <20230508153223.133081-2-tejus.gk@nutanix.com>
 <11962c60-475a-31a8-ef55-8da6dacca9d2@redhat.com>
From: Tejus GK <tejus.gk@nutanix.com>
In-Reply-To: <11962c60-475a-31a8-ef55-8da6dacca9d2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|MW4PR02MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ed331e-6e15-4b0b-a3e9-08db508544c1
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jcCgZuCVr/gl91BLf+WsimivXdwqusCHyNZWmPLja4GEhkoEye6JEtz/LzJC3pCkMVJeDdSmzVkYRHfpABs/XnKwhpcg7b0J8ZpUrSiMX3KvbdYfdhx67Nc2+a8khKi+rmZmnqyb8WCAY1BvjKEflFjnLb8VHli7bNrDtsq7rj7Cgk7tTUbIkbAExyoyBpffUDruqvMfT8ro2maeiB8F4LAgGaS9Y8vsGo1oHXh8TwsoAWPlrcUFN4xpdWGgUtHeQCNio3EaVdiHoGeH4Q4za++/btdfHJFAFGceTbelE/RFkNy2MEewD4PdnNThBVpQB0qTyoJfc98H4GVINNlTf4MCBXPXKKH3d4f4UF5kKwuVmMfEoA8ZpBLVGdYpVAnUO59Redct4tl2BauUCx2qlUmPStTUu7Qlm51J3UiXLr1d7CKzr3VkPgaWprHrX7ypmXqZkpoSQ7THds0868ntCHYLoyPFG3AesxGDqBtiCizUIOT8ZZHYvI+tWMnIodo+qaIZdMZv81QP3F745UmEfL/9XVWJSrK7cSAyU81YwRDU9idPpaCYyBrkVYybz0anaeHmTePXVqjQutf/MPA43ygv334uq5XB3UBJGT7yaEzLvsPBLLPCmxUd6Y8OmGiIs9xHqVmsuIOBuhtUOQ136WIp7PXDs6K3Wxffi2PmmuYft4j3Q/2WgZqfgLhmpdCn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(83380400001)(186003)(4744005)(2906002)(2616005)(38100700002)(36756003)(38350700002)(31696002)(86362001)(8676002)(8936002)(41300700001)(52116002)(5660300002)(4326008)(66556008)(66946007)(66476007)(6486002)(316002)(478600001)(31686004)(6506007)(26005)(53546011)(15650500001)(6512007)(6666004)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czFkd1BTaUFpWEkrbWJhRXNHWHRyWmY5SUsvamkwb2VpS0ZjSlFhaFNscjNr?=
 =?utf-8?B?VkZvK1ZLYVI3NVFJS0pqZlZNbHU1a1UzQ2VtWjIxcUo0VC8vZXN5c0Nla3lW?=
 =?utf-8?B?MXhONmlnNndyQ2MvbDk1MUtyNHlkSjdJYUNnNllmbUd1RW9VZHBLelJDL2NH?=
 =?utf-8?B?aDduL3YwSkFBQjE4SUE1TWNRcnAwQlRYMzhlZitOZzgzSnI5VTBHU3Z6MWxh?=
 =?utf-8?B?dVkzM0hmOUM3WTJZaWovSnl0Q0Zyei9JY3F0OEtvbTFSenlCVkhMa3JJL1Fo?=
 =?utf-8?B?Rm1aS0ZRNFNaMWIvdGFsaVV0NFBVRjF5c2FaeXRMYmxOd3lJNnJxdVY0LzRG?=
 =?utf-8?B?aWZreHBsRjNIb21Zb1dsV2g3UzdpSFdpYzlBOGYweVlqQ2hRWEpXVm9QRnk5?=
 =?utf-8?B?cU5JQUhaZC8rQ01hQW9aeWprREpMZStCeWF5dTBmWE94Q3RjWU90MklOak5i?=
 =?utf-8?B?YThnNTVPTmhqMDg2SllTNzNOUVdtUmo1MXpBVFhMQnRncDJMN0poeFNhWm16?=
 =?utf-8?B?RkQxNkVGS0tndmNoUE5oWmlSb2FHMlZxNVpHNXNvN1E4ZkplMTBTSG1uTStS?=
 =?utf-8?B?cWdhZGlRRU1HWktvekoyVDlzUTY5ZEFJVlBwc01qcTZheW5EYzdqanh3c1cy?=
 =?utf-8?B?U0dqeFFVVldqd3I3bkNiVm9rdzVhWnpOaWdBc3hPSm9yL0lkWjRDU3hrNE5O?=
 =?utf-8?B?QURpb3I1bTZMNjZTS2V4MTlZd3lzcDVtaW5obmtCdjJZeVl5OHo4aFRybTkz?=
 =?utf-8?B?ZU45N1cwK2NDL1lWUUpKZU9TOVBDWUFLNlRZMXJ4UGtIQ2VUZHNET050THVq?=
 =?utf-8?B?bTdBTkRLTHNpcWkraFRSNmxkMWdkT3RxeTBqOUZrRE5MTTd4blhJVHlaM0NQ?=
 =?utf-8?B?VS9yS1Q4alVCTCtvQTc0R3c2cERDWHBKQW5LOWc4ZDZ6cktRbmVwUTB1Z09V?=
 =?utf-8?B?cmE4S3B4RHRId25Ub0E0WUNteW5LZC8rbkZXOXkvRzVuQ1VnQXV5SmcvQVhv?=
 =?utf-8?B?WTM4cFF6czFJZzdsUlhoaU5qS2ltdDBHT2czQTRvY1dhNGhMV1RTWWhrRVNk?=
 =?utf-8?B?U2xQOFMwNUdpWER0ckFyYVJ1WWlUZVkza3dsYjJWNnpXOUFvZjZiWUhoRDVD?=
 =?utf-8?B?aHBzS2JqY0RxY3RTck9QcVBIdDJSeE5CTjNkVExua1kwdE93eHZvc1V1VVI5?=
 =?utf-8?B?ZHM3Z0pHU0xQNXlWRW82eXpTY0gyUlhNUzZRNkd2V3dhRktPSDc1ak55dDhi?=
 =?utf-8?B?dytjdSs1NWZlOFhMMFp5ak1nVXNrVkN2N01ZT1BKdVFzYUVVQ1gxY29NUzcw?=
 =?utf-8?B?SzBlVUdNdVoyemV5OUJEaGNWcG5uRXhuV3dvM285S0pDRkpFdFFWRkFCZmNJ?=
 =?utf-8?B?NnBsTVBzaGpOQ1oyUFJ0OVpDOXVnVzVVdEl0bjc4M2NiaUtybzkwc1c0RmFO?=
 =?utf-8?B?RlhZc1pDQlBENTU5ZFp2ODhBcDFkdWViK3FqNFBVQUJqRkJnWDg4dEkvcEpr?=
 =?utf-8?B?OUNNQXRBdUViMlZ5WkdvQWQ5Y0RKakRDYkRjZ1doQ1FkeWtWQnIva0htK0NS?=
 =?utf-8?B?cmE5V2owWGhVRytPbDJ6NkhzMTl3ZjBROUF4K1VlQ3U0dzZaallZcWNnTVdE?=
 =?utf-8?B?ZzlWRUpYdENJSGsveHFBMEtaRTgzWGpHRGZMY1VSRS9TNXBSQjlGcnp2c1ox?=
 =?utf-8?B?Z1N0STROSXRuZG1RSXFHRHA5NzlaenhESTNXcGZUOHRRL0tBZFVqbWNWQ1pw?=
 =?utf-8?B?NlVGVEw3WS96WVJ2d3dTU1Z0RVU5WmpJVGd4ZEdIZ3B6bm9Fakg1RVJrNEtq?=
 =?utf-8?B?dVVuZUtEb1lhSTBRQnIxZWd2a1diRWVDR1NSaSs3ZG1hSE5YeGhsdEpGUUJ0?=
 =?utf-8?B?aDF0YVpXTGFKT0FjTDB0aW52bWdzQm1wbUpsdE50ZDdhREhjRmFMaTU2RVlH?=
 =?utf-8?B?UXFDeXNTdXlLU0xnRmN4ZmNFS1NCeFJTR0hnK0QvaUl4dDlYYk92WlExQUx4?=
 =?utf-8?B?R25aV1AwemdobTFVVU0xWVdRazVVMVhCUFhRVE5XTi9qMjBVTCtIaks5cGZ4?=
 =?utf-8?B?bzZHWm5uQjkyMnEyMmJHQTQyZkJBZ0Irai8xSlRBbnhkSDIwR25DeFFuSEpN?=
 =?utf-8?Q?Jie6wkRwYdfpbytpHlH4nYLoy?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ed331e-6e15-4b0b-a3e9-08db508544c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 12:02:32.1641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WU4HgZohpj2DcPc8y44Oe7LvW6KCoS0k/J3CsArOSPG4ZnyIqVyggfWqy1jBUNMAHsE5ZupYCede5sgJHVRk8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7233
X-Proofpoint-GUID: V3nRV2IF63T_gWQ0dE5Bckry71xtHxVC
X-Proofpoint-ORIG-GUID: V3nRV2IF63T_gWQ0dE5Bckry71xtHxVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=tejus.gk@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 08/05/23 10:19 pm, Thomas Huth wrote:
>  Hi!
> 
> On 08/05/2023 17.32, tejus.gk wrote:
>> There are places in the code where the migration is marked failed with
>> MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
> 
> s/failiure/failure/
Ack
> 
>> libvirt doesn't know why the migration failed when it queries for it.
>>
>> Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
> 
> The Signed-off-by line should contain the proper name...
> Is "tejus.gk" really the correct spelling of your name (with only lowercase letters and a dot in it)? If not, please update the line, thanks!
> 
>  Thomas
> 
My bad. My git config seemed to be configure improperly, will fix in the next revision. 

Regards, 
Tejus

