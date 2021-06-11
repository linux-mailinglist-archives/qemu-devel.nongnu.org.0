Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5E3A442C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:36:42 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lriH3-00069z-RG
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lriFm-0005BL-G4; Fri, 11 Jun 2021 10:35:22 -0400
Received: from mail-eopbgr140122.outbound.protection.outlook.com
 ([40.107.14.122]:56299 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lriFi-0004cl-Iq; Fri, 11 Jun 2021 10:35:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBkqYhxHndSQ4mtQvP3fzmmQ6G5YaNum52h1lOqGSd83UuMJg0UXKOeANJ2ChlIEHvFSU/Lkf6Mbkcrh9waj2h7+yfuMKb3Gv9A5G4ddN2Y/D8J4q47NicgSo8aZFWrVhZmqLpyZ5gWlvjL7iew8zVXcwCIz6+c6nr60tiDtReHNFobbO3s/UD9Ul/vzignCtwHYsppr7NmHVMrziG+eT1P3fZpGHy/OJ2k6PZC9Vvydd2lZ0ovG20BLt0W0ag3XvllgiJ29LcBY/2OISH18ldQopRszcUP06fBAQXd1jV0/KBLF7YQEFuz0m4K4VqWiDU7Nrj9d2AIZM8bbNfGIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLPc1OSQDNliLLMyQ0OCa04xOkz0sVS2o6GATpF1KUI=;
 b=D5xaR2Dx5xxbqg4DU9GcqnGeXMYkIfMxfYb2zISbhO7q4EVwVADSlpHwbIkhN9NvOFMXqyoR8EskKNQ6fI4aPuRlz5fV+K16waoiVi2jh6Fd+h8dxpAONm7iVSSjqKWtzMXV2Hpi/JgPnecygSyHNseMgWYN2CgGtDHIjCeJS9hYSMYMclLGCQeigBG6VVSVseIbEOBUk09dpcn2R5kLDP6zLs9fChENnnbwYnCJ2qm8iWLyo4Ja7IP22yeYi9NpppUCZG9Ti1MyO3s8fXdjI32S6g3W73y5J/5hslgrENcCu5KeFSM5z4GhwxJwLgjD0Uu+270el2C5iIRasYFvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLPc1OSQDNliLLMyQ0OCa04xOkz0sVS2o6GATpF1KUI=;
 b=Z0ODc3WQSL4WU18se7lBEPt1+7pLm4R9fLepW0FZCX7LXZnwEkBt2QLYHzQgwNxCTmRcojyg8/LJxTanFJ3f0RkIpN8L6yTD8xZms4CIOOaDwxkjrMbAATFln7e/hCP1fQ1d0KaRpsYYV/KgjdRDc3AFuZM4a/NFXl1ACmJr+M8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 11 Jun
 2021 14:35:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 14:35:14 +0000
Subject: Re: [PATCH v2] qemu-img: Make unallocated part of backing chain
 obvious in map
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>
References: <20210611140157.1366738-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6a0aabb6-441c-8671-fc07-a7113043ccc8@virtuozzo.com>
Date: Fri, 11 Jun 2021 17:35:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611140157.1366738-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 14:35:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec5b0c53-1d83-47b7-5936-08d92ce62024
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-Microsoft-Antispam-PRVS: <AS8PR08MB650291E2C42EC930B54AA171C1349@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXa3s2BBXTWWTsxTU+ZZYnLR9pyBvgVJOj9Z8WuCxvOV9UbVaYx39z9sHulvaBdFYNw01IpBr/WP5ao754P5d4bmHVuWqrEzXG0goxdssI6Lc+PIqI5LVJ3JIShIaMv2B/cm40pY2fh3ns3EsO/HTt4HgBrtx9qJEUPubn794b2cxGC5El64tiGwZzfLZxuzgo7YSZKiI+JCEvrp3SRLp7RZJH4pdCgFxyLYuDLys2a15PvvXph+DrHS2NZoVNsbRUjrhJQwp/PFsKGQyxrvNX1wgbyce53wb+EQUrUYnjGVoBXCFIsYIi/Xnr/61A6wLiv6pSJnbPnIhKcVFGf3THL82aLzPGfaaZ5ICLyvwBsmLdaADl8EyTNUuYUaPxHPP8pUJ4gHT0FHYZ9jmHobq7N3ep2EAy/d3IUmg0u9shki7haD9XnoK5lli+fp8kYVyCYSupV6UdQQ6g4QoD77r75cj9QHZHgZQiAibDkOqfODQA80jI96L4RRnHODC8ES8vJcqpYNum+ypb0zAXv8uT9i1nQhTXqt0HsV6g7+DuaIaXP41WFCjWV+/svmN9ii8J6Xq38gs3/ZQQ3QRvXv1x0y2hL2X9/yoIYLnfeU7ho3pRkZIOw97ARBDC8dWDVaTTul+zYWK1Zo9NNyvWU58ZeUCTne2Pi+VdePY5vkoc2cXfQZf729oF5EVYKihcTLoaawN1OiTLuEAEAv89CoLxnLmC8QEH3orFTHzXwfCi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39830400003)(376002)(346002)(8676002)(8936002)(38100700002)(26005)(186003)(66946007)(83380400001)(66476007)(16526019)(4326008)(16576012)(38350700002)(316002)(5660300002)(86362001)(52116002)(2906002)(956004)(66556008)(2616005)(6486002)(54906003)(31686004)(31696002)(36756003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b21SVUhQVThIL3JVdmFQM0k5c0ZqVWZWRlI3cDhFMW1CUW0xSG43cjV2TTl2?=
 =?utf-8?B?dE5ZK0h0VnhZSUU4b3cwdGlKdlhNR0paeVVuQ280NHZuOWlaNlBaVXpiZDBM?=
 =?utf-8?B?amlYKzVrZmlERWFLRHdjaUNuVzZYN1JPL1VvTnBrdlI1REQwdTNKVUE5M1A5?=
 =?utf-8?B?MlZSMHByRFdnRnUvTDgwWVdRL2FhQUpucVVXekNMSnpaY0NvTmRlR3lrclV2?=
 =?utf-8?B?azRvd3BESGR3UjloRFRQN1FJODFvRVoyTjAvNW4xUmVKUHdKSCtjU0ljV1Bk?=
 =?utf-8?B?QlZCcHo0WkFOSU54NlhxdUo5MnhIam8zYmpNUkRFemcwYkdPS3BoM042aXNi?=
 =?utf-8?B?Vm9jOHVvT0d6amxQdzVubDNKQm1aVG4xSnA3UCtMZGEzR3dWdHAxNUV1ZDd1?=
 =?utf-8?B?TFlWaFB6UXBubm5EY0tBNzdXQjZiVWhJalRHQU56TktGbndjQmJVM1doUVlJ?=
 =?utf-8?B?bUNxTndENG9nZ0NIUmRNeE5EcmVpcGtQMHRGU2VZaDlCZDJBUlNEQTM1Sk9K?=
 =?utf-8?B?S0Vwd3hyTEZRanJ4QzRVajVXZ3I2OGRyNGZoaVIwQm9EbUs2bHJFZFAwRjZ4?=
 =?utf-8?B?TFdVWmNDbVhaaHd0MCs5bUxLbFdBNm5PNlZxckZWbng2cEhnaFUvWTdtOTdw?=
 =?utf-8?B?NCtXWHFiTkdrcko0d3VSVGllaEFMQjNjWDZDTFh0aGU3MEVBU3gzdUxuQm83?=
 =?utf-8?B?SVhOQUFuclpHbXp6N2NiMmJETzB3MW9rVTZxZGJEemUxOVRpR2JUMUJncW5E?=
 =?utf-8?B?eFJrVlpVTTI1UWpHeXhySE9MaGdiWms1WkxESmhHcEtMdkRmRG4wMXQ3THVP?=
 =?utf-8?B?azZqYWJ6MjhhelVjZURCMGU0MXExNlhieHM3SkFLYWdPVE1uOEYySkcrSFlY?=
 =?utf-8?B?alZZRml4MjZMR1RaYXgvSXNLU2JHTEMzc1AwYk9tOW1qN2JoWEpuRmNxU1l4?=
 =?utf-8?B?SEtEdFVvcGJLUGh2eWZvMk1EQ1hCRXpYWHg5OTEzNkhRaFpKMWRiWGo2aHds?=
 =?utf-8?B?Yy9ab0ZzNTNoSjZyQ0J3T1BnQlNIUm5VU1RQek9RM2NZZStWTHBGWUdvam1X?=
 =?utf-8?B?Q2lQOHRJa29IZ1VtM1pDaElhaGsvWC9HMHd5Q2g5bldFTy9iU2FXSGw1RkRC?=
 =?utf-8?B?TTAvTEwyZCs4Mmt6SEVWTjhNTUI5V1NabUhpZTRHUnk1NTkzekRPUTVjcmJZ?=
 =?utf-8?B?Q090ckhwSXhIeVhRRXFTS05lb0thRHNxZkRCNDB4UVY5cllaNVZoYXNDTHFo?=
 =?utf-8?B?YlFqZldOeDBYRWdXS0ovVzJON3JLRlJQSThva0NFMmF2YjBabllqWXNVTWdP?=
 =?utf-8?B?akgxZXR0QS9HeVdWUmU1MVlPMitjVHlFdEh6VG0vR1Vta2JFUzNud1Q3L2FI?=
 =?utf-8?B?T2RBQTN2bDlnTUNOaTc1Ym5ReHVSc1MvOFJvd3M5L05WRzZtbHVXUU9xc0Vi?=
 =?utf-8?B?N053aThadkxlQ3RKMDFFcVA0Y2o5aHNMNU9ScGhwQjAzUVJkYmpsMDk4b0gx?=
 =?utf-8?B?QnRLTHZvTzNqblo4SDMrNnk1eWFmQTBERk43aTdRNUtndklRVGdWb00vN0dy?=
 =?utf-8?B?WXBncDMwcVV3ditzY002YnlKbGRYRE5IOEpJVFhkN1R3TGpWOGtab0lQcndx?=
 =?utf-8?B?Z04wUERzVFFCVkNFdzBhMTdnQUdtOHNxYlhndkVEdzcwKzlFUUlYaVM5K1Zv?=
 =?utf-8?B?MC93WVlYaU5kZ3pCMlhoMzNBVGJ2aFlUWUM1eWMwcDBqYVUvcWNEMTRGZjRM?=
 =?utf-8?Q?nKJG2peCvIOWcDF5cCpHEGbw/sQENtKxsloVo+r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5b0c53-1d83-47b7-5936-08d92ce62024
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 14:35:14.4034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jcMlRb5DGrwEZJKJCg2dwJdKzcgIGIFmCLIiEP2bSafnWugpg6WlFuc0w1Ptieiedtt1XUJBJQKkiXkQN1BV52jYpLXHe7SudwU4PwhnFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.14.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.06.2021 17:01, Eric Blake wrote:
> The recently-added NBD context qemu:allocation-depth is able to
> distinguish between locally-present data (even with that data is
> sparse) [shown as depth 1 over NBD], and data that could not be found
> anywhere in the backing chain [shown as depth 0].  But qemu-img map
> --output=json predates that addition, and prior to this patch has the
> unfortunate behavior that all portions of the backing chain that
> resolve without finding a hit in any backing layer report the same
> depth as the final backing layer.  This makes it harder to reconstruct
> a qcow2 backing chain using just 'qemu-img map' output, especially
> when using "backing":null to artificially limit a backing chain,
> because it is impossible to distinguish between a
> QCOW2_CLUSTER_UNALLOCATED (which defers to a [missing] backing file)
> and a QCOW2_CLUSTER_ZERO_PLAIN cluster (which would override any
> backing file), since both types of clusters otherwise show as
> "data":false,"zero":true" (but note that we can distinguish a
> QCOW2_CLUSTER_ZERO_ALLOCATED, which would also have an "offset":
> listing).
> 
> The task of reconstructing a qcow2 chain was made harder in commit
> 0da9856851 (nbd: server: Report holes for raw images), because prior
> to that point, it was possible to abuse NBD's block status command to
> see which portions of a qcow2 file resulted in BDRV_BLOCK_ALLOCATED
> (showing up as NBD_STATE_ZERO in isolation) vs. missing from the chain
> (showing up as NBD_STATE_ZERO|NBD_STATE_HOLE); but now qemu reports
> more accurate sparseness information over NBD.
> 
> An obvious solution is to make 'qemu-img map --output=json'
> distinguish between clusters that have a local allocation from those
> that are found nowhere in the chain.  We already have a one-off
> mismatch between qemu-img map and NBD qemu:allocation-depth (the
> former chose 0, and the latter 1 for the local layer), so exposing the
> latter's choice of 0 for unallocated in the entire chain would mean
> using using "depth":-1 in the former, but a negative depth may confuse
> existing tools.  But there is an easy out: for any chain of length N,
> we can simply represent an unallocated cluster as "depth":N+1.  This
> does have a slight risk of confusing any tool that might try to
> dereference NULL when finding the backing image for the last file in
> the backing chain, but that risk sseems worth the more precise output.
> The iotests have several examples where this distinction demonstrates
> the additional accuracy.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Replaces v1: 20210610213906.1313440-1-eblake@redhat.com
> (qemu-img: Use "depth":-1 to make backing probes obvious)
> 
> Use N+1 instead of -1 for unallocated [Kevin]
> 

Bit in contrast with -1, or with separate boolean flag, you lose the possibility to distinguish case when we have 3 layers and the cluster is absent in all of them, and the case when we have 4 layers and the cluster is absent in top 3 but in 4 it is qcow2 UNALLOCATED_ZERO cluster.

So, if someone use this API to reconstruct the chain, then for original 3 empty layers he will create 3 empty layers and 4rd additional ZERO layer. And such reconstructed chain would not be equal to original chain (as if we take these two chains and add additional backing file as a new bottom layer, effect would be different).. I'm not sure is it a problem in the task you are solving :\


-- 
Best regards,
Vladimir

