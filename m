Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4824480954
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 13:58:22 +0100 (CET)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2C3Z-0004OT-Bg
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 07:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2C1f-0003Lp-Ls
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 07:56:23 -0500
Received: from mail-vi1eur05on2103.outbound.protection.outlook.com
 ([40.107.21.103]:44311 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2C1c-00043F-M5
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 07:56:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9cY0UNfx0ja6oD3DD+mIjqKtoIX5bmrLyxVeF6KWDiCiSQTqY9EvHiAzsP7NANjUrRZZUE+pmHL8N+iS7ZBR1wvUj9/aEihcbVF+bxZIM13X1Ib2M2MKALgK1db3NE03OhsW1bAOcm4N2xNmlB0YOea4PdCmNGPf6nseGLUgR1+14Bayggb+7KUXpuf0vUng3w+QGYkCVQ77ZnFXZCr/7VIiFW8zwzoQceaHktuFyH6VHvLi4OlrjXKG4aq04box6oCHWw6OGIKTMpp2mIh9DkZr7Hgqa1PXFDV2Ds3A0mqiE2IhQ7gDlP2Fbb/9Gx5OgXuRA1sZ8J57ZHnQiQETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFGyjFNIxS+aWySUw/9tmpPNLtAGfuUik6lRq0nafLk=;
 b=JnU5HgJ9IcfqvEqnjGKKMijYMKluqoBE9jAw+IbmsrNzRu0Uy4zlfSAqORN7knfo9S1b10ZX2fz5SEGosZFlbHYULD4dKm6wIQNjCznmbcobidHFIqgG3IhQGiT9UPvlNcT7Gc8Es96J3RSKLZ60JJhfL9qfd/B3Xox8LoF5DgL9xOY0F+vfbIOuu21dVD0TOjouDdbWivYJmGVxQsLlvRbLMA98ulgs6dgIMWTBaLM7M22Fa6wCA9TR6Zxl1nTLTWv86dZqBSBfLxVWQW1V8hj3lhZVC3LmGnsH1FMReeML+jOXVtXzJj/GJ44nYjQuGAt/9IaDqe9QHyuoPUq8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFGyjFNIxS+aWySUw/9tmpPNLtAGfuUik6lRq0nafLk=;
 b=jY9UWSSwb7YeYdGXktn1R4jGiL/bco3ZLbwlt6IagyJ2FKUeinPz5LxB6Lq4TWxT/d6YY1WaUfT8j4G9zGPhuUKzw+WL2cDlj6O6kLzP2ba9p1rA3K5a23bL5Z2zgGO9olrjKLXdaT4hkNnmZpgKnXybYIy47FKrAtX+8WgXeKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6785.eurprd08.prod.outlook.com (2603:10a6:20b:309::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Tue, 28 Dec
 2021 12:56:18 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 12:56:18 +0000
Message-ID: <2d97e5ea-4b06-0166-675e-599bb56bb5c5@virtuozzo.com>
Date: Tue, 28 Dec 2021 15:56:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/6] migration: should_skip() implemented
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-3-nikita.lapshin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211224111148.345438-3-nikita.lapshin@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e022b30-3646-42b4-e938-08d9ca017071
X-MS-TrafficTypeDiagnostic: AM9PR08MB6785:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6785D0B63318303776BA0423C1439@AM9PR08MB6785.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kFdgnKnrzXhqJPcB7HMh9/BwuxUuippbFLhsflS/8o35rHKv1S0kILlkjr1LUiVcJznu31OxXOjV/6yXiB0PZQ6GP4VHYbZZ//YWJa2Fuwa/XEQfYKRCVLkynOF7VsTd1qh8jwrRxBqkIK+zLsvRY5Zn4Ve+MMpx0OujMmgnI9kvMTRKTVGsJvLrQTACE1+JSwtz635IERFCZZkfUTPQFF8XARkK9u8jIRxKeBpf+r5h9rUqnCD3QRV+vwlPbRMhpP+UsOKKjPkgjTTQIRs+CF5oJpXolFPdQKPvW80Lsnkrh/mAcg+FcyoO4qMao1gF7f4aYtOWIc2jKSKpAlA+E0S35KgMtaz8/NuQodWplfutFdUL8OzRxDN8BEHghRHGD+xrj281RSsLpNvlb7XHIFUjBLOrKxZO4fTNDTHhtSMcrBQIjldSyxZCAwoQrBF6bBpQLUyanyZcbzKWRKci6V0DTKAZzfaiZpkbLcq2Yr9WEtxwex/DjzK48ERuGoAf0sdQeT6JT2q3ZjL2x8f562KDkCrjkmVqlM2NZ15wst2eXDUiF6bjcucucyZyfTK3xQFqqbKVm+cygNu4G3sPAsmR4f9lzahXkEu9emo2WBJDvp6vYxQdbVfs1+wfdB86/4ApRgyjMAbzoSpltgTdORsGZBSSMAbzbag/lnjZUWtGiu0Mh/6DDg9LH0/xBqYs5tSmwWZoasHoZ8dTFtKnEcf0ZEk3nHqKGJkU83nkz8dUbUUvej1r83U9qNTis2vizi6eOQD4OW+2sgeDL0WwYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6512007)(6506007)(4326008)(8676002)(31696002)(8936002)(31686004)(86362001)(52116002)(107886003)(2906002)(66556008)(36756003)(6486002)(508600001)(5660300002)(26005)(4744005)(38350700002)(66476007)(186003)(38100700002)(66946007)(2616005)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmo4ZjZ2NWVpL09jc3p1bDJxU2MwaFN5ZXV5VEpBaE44cTltL29TZ3ZqNzBV?=
 =?utf-8?B?WWpSdU13RkZEYTRMT0d4WHpyT0RDUjBXSHlMd01ZNUNyTEJQV0hkbmRrbVl4?=
 =?utf-8?B?U1pSYTFSYngwQ2xvVUVnOU4zSTJSV25FZ3N1aTJBcWUrNWFiWHB3MlhIa0VT?=
 =?utf-8?B?azl4eUErd2RmUEYxcnpqek56VFkrWjJUQnVFYXVtVkJkelpJZzU4RmNKZ203?=
 =?utf-8?B?N0tvcTkwMVZOWHRWNjhYZyswb0FtV1MwLzhRaFk1TTZZOEZQTVUxeTF4Qkhq?=
 =?utf-8?B?VE1wR2FENXFGa2ZuTk1vK2dVQktrMGw3aE9HN0pRYmZVa0dDZ3RWd3lSUDZk?=
 =?utf-8?B?Q0t2djZ1blU3dUlYNGREMUJSa0FhTHNGd1lpdEVTbkdtQ1RvV1M0QmUveXVY?=
 =?utf-8?B?TzJvQmJlZ25xU0dCMWtzQXp6a1poT0IzY0NLK3lSdlJNU0hrY3hMQjBlQTRS?=
 =?utf-8?B?cEtXcWM5MjlKNHNFZTM1Z3AraDZ3bWFFenZwTUVROGlQOWRCMGhoOEZOM3RW?=
 =?utf-8?B?YmZXbnhrRURFZ1k2R1FLaHFKWEhleFBEZHJsdHIzaVUzUGx4L0Rvakt2VEJP?=
 =?utf-8?B?a1orWFp3MEFoSUhRR2pnZVkwRVZtTnQzNnFoUDMyV0RmYkpEaFBLNGNUQktm?=
 =?utf-8?B?U2VQS1lvRGJyK2FRYnFaU3UxcFFUeHZvNHJHYnoxektsZk0vTUVnaUkweVlF?=
 =?utf-8?B?L2N6OC9DQ3d0M3N2QTV5SlBOaG8ycUhjRWF1ZlExTktFd0pPS1RrU0V5UG9O?=
 =?utf-8?B?MStYQ0x2akNjU1RldlBKVDY1MklFWVBhalo5c0YwM0dyNHBLdFhXaGIxSWxr?=
 =?utf-8?B?UTBJRlBVZFBQZUl2S2hEMnZ4SGl3Ly96T0lKNW1CTDIrZlVvblFMUFV4VXJG?=
 =?utf-8?B?MnYrMGtuR205RjRwUUI1R1V0d2p5MndEWlJla2p5MTI2YU9rb0JPQXAyeStY?=
 =?utf-8?B?aHk0Vm4rR0dsUXdNRkFZUEk3ZWtaSFhNM3lBanQ5dmFkSEpvSEpyQjFad203?=
 =?utf-8?B?NWY5ekowQzh0OTVHeUNydFZ3WFVWV1dqUU5DTWxJb0JJR09TL2t4NVhORGQv?=
 =?utf-8?B?QlJVaHRMenZYL3MrdVk3YVZBYmMxVXQ1SkdJUUplMWFNS2NqTUFybGsrTDBK?=
 =?utf-8?B?WGs2QkoxV2lkNG50dlUyWHcvazJiVjdXK3dGZ1FGRGdCUHJzNkpIL1NJaTZw?=
 =?utf-8?B?bkZnUHE4MUVIY2Z3MmpTTEdmaVR1dUlNa0p5VkhRMVYwcjVYTXM1RWJTWVBX?=
 =?utf-8?B?V0lBYjV4a1FEOE9jdSs0UGdNN1RtYlFraTZHaTdLVnRLMENIMlc2cWs0MWxk?=
 =?utf-8?B?VHpQRmRhRkVreWRLSGNPbTl4ZEhyU0pyclRJTmsvYW52cys4OVdiUHUzK1g0?=
 =?utf-8?B?QS9aQkJPejFpalJXelQ4eStHVXgxWENObzV6QXZBWnN3RW1kaXRrYUFrcTRp?=
 =?utf-8?B?SkNSYmE5NWs0TG4ycU5McVJvdTk4eDZKazIyeW5nS3htMVJ5dHF5QnE1UTlS?=
 =?utf-8?B?T05wNzIrQmszZnVSaytwZS9wL25mL24vZng5UXpQcVpmbUVmK1RWeExneEFS?=
 =?utf-8?B?OWZKUGVWcHp5UXFIL1NWVkV5THlvTi95TE9nWGkzVWtrbkZQT0YrVk5iR3dH?=
 =?utf-8?B?L2tFc3BYbThrYTVqN1pISU9tVlZLcjZpMWIzTlg0cEp5cWsvU3pMVXlKVWZ4?=
 =?utf-8?B?MzRuMm9ZQWZuNFJrZjBqQ0oyZlhCTDY5cVB5NmJCQmtPOXA2ZE1CYWZiYUsy?=
 =?utf-8?B?bGlsMDIwdlN2RUhxZjBoazduVkN2VFZMVng0LzEraUlxR1lKVHRQS25ZalRP?=
 =?utf-8?B?U0N1OHFCa2R2RlJ6amFEY1ZkZGk0aEJ3RDVrYlUrNkVNa0RTcFNTc25PUEdZ?=
 =?utf-8?B?dDMvZGFjRGRKTllpWUY3QndVY3lBWjBEVlNuMHZCZVNIRGxQbStBQ0E2dXlX?=
 =?utf-8?B?MlpjQjFjR1FTdmYxSk9UL3R1NVBZa1V0amtVb2I5VHJ5S3ZKclJZMnFlQTVY?=
 =?utf-8?B?T3NIcUVDRGw1UVVpVXE3T3ZJYURVd3ppcHEvNkVlT1dzRkwyUkJLOWo1WTls?=
 =?utf-8?B?RmVkTFpKTnd2V0EzdGJQUU5nNFZocktpa01McTFoY2ZnQ3EvRjdTSURhcmdr?=
 =?utf-8?B?b09yK2NaRkVGOTZXbGZVY2hHY1hmY0ZKNEdKUmdWTjJ5RXdrVlptbE16alhz?=
 =?utf-8?B?UFQxajlNVWlVeHlPZVpoVjA3emRyaFhZMDJRMDhBRjZFY1M1dnAzU0VIQ21a?=
 =?utf-8?Q?N/q97WDMSj/DDlLN6dnPeb0XyuZusUiM1gmz6ge4OQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e022b30-3646-42b4-e938-08d9ca017071
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 12:56:18.1802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wYUcXaoD6ViuDtkNu7cTHkp/XHjkh0F+bmQ3nG8rWBsiKHpzmoyImzlbrDBHry3wXKvNPNdBPNFfZKho8LTUT4NyycAyk61kyTsXfia49U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6785
Received-SPF: pass client-ip=40.107.21.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Better subject: "migration: implement should_skip()"


24.12.2021 14:11, Nikita Lapshin wrote:
> For next changes it is convenient to make all decisions about
> sections skipping in one function.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

