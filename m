Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2A43AEEE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:21:03 +0200 (CEST)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIdi-0002vw-GJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mfIbf-0001SM-5g; Tue, 26 Oct 2021 05:18:55 -0400
Received: from mail-eopbgr60130.outbound.protection.outlook.com
 ([40.107.6.130]:52999 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mfIba-0001v4-Fz; Tue, 26 Oct 2021 05:18:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4fNGQDnw2iharPx2GANMdzgisdrO7KnebF/4Ek14fVgG9kgFswitLGPuaK7r3QUnuXmLXJd4DExy96P9rIJs08xEhn1wGOMOf3yoAza71R9gbJZB1pbjOrwOLiezEV0Mc52bHXpalNkApEjIudM3H1PMAlMyZConombuExTiSJLP3LD2uh6JnpUUK1wMWf/PiWb3CR8Y2kbcsQVp+WBJqFMmGM+Upo65nehe5FB5ryGzM3ufPx9s05OyP8uQAK+2PfNDIDD4/++wjaf9gxZVpIze9MDc/kmd1fl+PlJh91nNGM09OpQGg9ZQz+GLe0EHxyFuMRlvzj2f4sF2i/Qkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G89iFWP4qezbn9vga6lt5dCWHyK7+soAdD+D+ezqSbo=;
 b=E6kuKhu3tjIUUnbPAQEcKKZSE9ge6Fot1PbHBl53WMbjUJuFbwRenvX3qU9MXkDGIl6xaLhVZw8KdMQ2ydRhGohsPnHYxl4GfQXEtzYpBZkKggHWoXGXpO7XouvzCotYQUauvrTWQsfwarXPE1jbrGhzFmD5qt+lBC6y97cUXTPuqaTJEONPdAvLFI+v8jMOSpG6S6V+nsuKOJdWgDqVnDjBwdOWXpos/khV7/hkQEw4yaeH17/44pEb0ZfTI/1c8KswZNGVTmQkdpz/0J/cZIeTx/4vUcbRGcEKCSnOpLNbFFnXCIhBEuuNfuSm1WFBKAP2y0s1Mngoz1itVMP2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G89iFWP4qezbn9vga6lt5dCWHyK7+soAdD+D+ezqSbo=;
 b=rIArNs0Rw+7OIsf6eFy0qYSusKQHFm7yP4v7yEQoc5cHVk+Wc3tDgHJ5hjPojviNfmnHQhtEZPIGDhJE9/qtgaLuljNYQGsA+jdQDaUlV+DTzmZ3Ox38Xw51DXTz305M4R8wHjVC8ik0rBK0OkH48VVrNlFQnNdURjmPo1hC02Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 09:18:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 09:18:47 +0000
Message-ID: <f63b4410-2c3d-d078-26e5-e891bfbb61e5@virtuozzo.com>
Date: Tue, 26 Oct 2021 12:18:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/4] qemu-img: implement compare --stat
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, den@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-2-vsementsov@virtuozzo.com>
 <f9559937-f077-f8d5-4a5a-2c583c2131f5@redhat.com>
 <e8d99b0a-f46d-1d9d-11a3-5c04de1c3904@virtuozzo.com>
 <7bb75761-7043-25cc-f05a-b24bcecb7012@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <7bb75761-7043-25cc-f05a-b24bcecb7012@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.244) by
 FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.11 via Frontend Transport; Tue, 26 Oct 2021 09:18:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eddaba9-b1ef-4483-04a1-08d998619d44
X-MS-TrafficTypeDiagnostic: AM7PR08MB5448:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5448091E2443AD83B6D7F98AC1849@AM7PR08MB5448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EiKRBX3AvIKX8ojQs/BMF8LwtwN/KtUhc3GhzW+802641xZ0dxhQwOtYBxcnmOJH6rAlsaEKm3PERRJTNf2E6PagLf8qFpuYly3YAle5692a1HK2xCuRKzRBfmSZCax4zmgYZEAN2TPSCb2VIp4fVtsVkp2/DZVeRbBLJ1gStGSmd3Ikhrv9b1vJ5RvqdKBoHDnNzfjQMJ3+UjPpe/DkIt2LkDtrVRSVp4tmTN+1dzDac+zlckc0DJY9VCKuE1zjM8SQ/4SF0m5rSEV6PvNqu9nLenNYJ2WRhJv9DeQaSj7ut3NfG6zCQ3itlLf94GlflS1N1YNss4107lU2empXf4b6xCHm+kXMC2pD4Gz6BSH27/9mZfIjzQN2dF32QkFznhlEAWV8yoG3lzSuLTR6dq65zmnO9b3+S/oFqGf8c5792fRdpRnrw3AjXkTBuBk0SIX0trF/+XuPEPf1lwkIi0ss4fOSzZA3/xjBi/foV1jBk7M1A/BE7zQivyS68h/jpauAa0sc7JCgA41AT55ytpWfBSg+7Wyh5pl2d5d4DA55trrz6W1aAwgjmpRmSxM+DCTj0ElNmxG0KKthQ6gnAmVvpUJIVFt+EJ3/t6DZm7FPAznz3v4rrB/8UfLU+J0S6MEKox+G8pnLs3rlG8ljc8UWwEDuIdvvPbiNfII84iZKWcXTea34rGwXAwLQ1C8l6dC3ET5NQqdrpH5QmyLQJPxpeclCB/cs7+9fW55jgmTB6ngJ/T1dRiZmmeWDVAvq0FHq8lOGMvkgydL0T7O/Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(38100700002)(36756003)(16576012)(83380400001)(508600001)(38350700002)(86362001)(2906002)(316002)(8936002)(107886003)(66946007)(66476007)(66556008)(4326008)(6486002)(186003)(31696002)(52116002)(5660300002)(53546011)(2616005)(8676002)(26005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlEKzdTbFRNSnBGNmZpTTU2WHNJd055cDdrRStBelc3a0xYZ1plN2RCaHFG?=
 =?utf-8?B?bGZJSGxqM1A4ZmhXNXRiVFZyUUNucEVHcXY1eXhuUzAwN3dMNUhsalhpUCtI?=
 =?utf-8?B?VXhzVm82WWVDWVdqUnBWWVl1UDJ4RWJ6Zmk0WmVlVkpCTjBvdmRjRTE4VDc2?=
 =?utf-8?B?YzBBQmh4bjU5aE9QVnh3K3N3VG91STdMaUhDT3AzOXBLdmpRSFkyOXJaUUhT?=
 =?utf-8?B?WC9OT08rNzJhV2t4TW5RbmRhZUVTWis4YU94cEk1QVo2MzlYbFkzRVVOMnIx?=
 =?utf-8?B?ZkRSYlgwanNEMURQMTZmQWZUV0FtTUV2MWRKMWl5NFBXTmdFNXVBWmhsV2tB?=
 =?utf-8?B?a0ZBNkVST21ZZWNndVdZRjdVclhXTVRlL21DNDlBMkJHbWRTS284YmovWTBw?=
 =?utf-8?B?Wm9wWVhSSjFpbllnL2x3U3hDMzBmUFJRTEJRY2RkRlU3L1ZMRW1lTHE4V1ZB?=
 =?utf-8?B?UWdUMHR4NVlrb05PWmdSeDc5TGVyNTByYUxUTG9rdm1zR3dkMkhtTE5GM2s4?=
 =?utf-8?B?UjRZeWp2ZkE2QmxpMmRUYnhtTmkrblVHT2xvdjJlUkFqNFJ0cWYzUXZzbmt0?=
 =?utf-8?B?ZEpsN2o2UTlYY1g2aEZlcXV1ZGsxenhCM20rT1Y5WHg0M0s3c0E4S2JDK01H?=
 =?utf-8?B?by9uclhaaW1kM1AvSWNGS3IySVc3aEIvTHk1QWM2ZXIxMlNYQlVzMlJZVUZU?=
 =?utf-8?B?QkZSZzgzYTBWNXdxM0FxTktPeHNvdkZLNGtqZ0pmOEFLV0tEZWJLTEVkbnlT?=
 =?utf-8?B?d3EvSk9aU3lxSUNaSTFzK1Z5VTF1cUtXVThxOHhtK05Od0RIbEppSGdtSVdF?=
 =?utf-8?B?SlF3c09ZUHM5UmRyTEJHeSszM2hibXB6MFM3RTVray9NU0lMbExOOStlNWox?=
 =?utf-8?B?N09HeEhqT2Q4aW8vcS8zR2NtVUsxb0I2VVFCZUE2UmJPWW8wUnJYUksrMDc0?=
 =?utf-8?B?VXdxbzFBL1V3WHp4aVNYSmVDYXVDeUsvQnFBc2piUGhPdWVRUUthMVFJL2x3?=
 =?utf-8?B?QVJaSFp4VXBDbE9LdnBnbm1aUEZrTDZad0hjY3pWV1drdVJ1Y1pKWGs0VC9x?=
 =?utf-8?B?eHhhS2FzemRxWkd3N3ZaTjJ2R2lNRitXRmI3SExMTnJUczRvZDkvR3N6Y05B?=
 =?utf-8?B?YXJrSVhuYjZXSDJPeisyM3RNc09wSVZGN0JKeUpINlJnNXkvS0pSV05sMnlk?=
 =?utf-8?B?cVp1eXRYS3NjTkhobGlLa0cwRlVaQU9oN25Yb2l3UGREenU0bXBHL1RIMFJW?=
 =?utf-8?B?QklHaGh6bHhqMnBhbmFmV0ZzY3h6V0p5RkNkN0FiK1UwMVRRNytZZDRKUlY2?=
 =?utf-8?B?VGZXa0oyc2JCNTVFL2tnWTNqdlNIWGxBUTFMYWxmaEh1eHp6TmlFSUc1Uksv?=
 =?utf-8?B?TVRKOUowRWp2OE52R3hNbWJGRlMwdDV2SlpQeVlFYmlwT0EvN045VEU1Qzlz?=
 =?utf-8?B?cVFjdkd4MUNsUnlBT3FIU1d5QmhsZFZHemdQNU5uZUFzZ25PS3VGWk1WenYv?=
 =?utf-8?B?cTVGM2NLS0hYbzY2VFIydjdsZk04Q09IZU5uUTJJblR5Q3VXOFZtSkdUMHJp?=
 =?utf-8?B?ZGk3a3U0VlQrdlpGM3Y5dlNEMHRHZVJlb0FIUkJ5SGlFL3k1bmlZbko5Mm9y?=
 =?utf-8?B?YWN3SndwK2FvbXFXMUMzcmpUZ0VmYW5wcDNFcWJHZlh1U1VWSXFkbW1rYXpC?=
 =?utf-8?B?Zk1pRFVNOUVINHJzUlZYQkxoRGdFa3U3Nm9LZWFtZWs0UnFqWnhDbVNHYTdl?=
 =?utf-8?B?SXFlWDZhd25DT0orRXRHUGJRbUl2YkJVc3RjbllteGJ2T2NRUXlVSWtYSy9W?=
 =?utf-8?B?Vnkxb0IvV1FsQWJwZElXUjFaVU5MUkpoMmNJUUtreEU2eU82L1VaQTFqZk1R?=
 =?utf-8?B?Wm9hZUZkZy9vYmpLUGpuRktYYXM2NWxBZGExSjl4cE5lSGx2UnA5NWZmYTdj?=
 =?utf-8?B?T1p4RVIxQ0MxWGpUMFJPemwyVE5zV3c1Nmo0T1hibzZIUEFrcHM3K0V0dGZZ?=
 =?utf-8?B?OFJaNkw0NElJWXNQWjJXR1EyRnFvRktHVXk5VXNyNE1yU1A5QmRJTUZDZy9o?=
 =?utf-8?B?aGsvVzNpY2FlSVlCR0FBWFdvWURzZGJLWlN5bGNzV0pNS0JhZlpyb2lGZmhI?=
 =?utf-8?B?MDFyYjNMVHVxcWt6amFQN2pFRWZmeDhJWU9KaG1GN3MzTTNqRDlTVTNuOWdJ?=
 =?utf-8?B?VmF6NjkxVDRoc2s4U2NRTzZlamx4NzgrU3Z1ejRJaHRKK1pTSlJFTzZLQnda?=
 =?utf-8?Q?MAxoU9By6m1YvB//PCZrqUsU2PyycYW88YXr97bWBA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eddaba9-b1ef-4483-04a1-08d998619d44
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 09:18:46.9227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nhTzRIbTzjSviq6pF1kAS+WFDKSqjzxSWLybeGKnS25hDF12vnvPYFxBV2oVbfCWPfN2W5apdM81pQY4pWV97YxfYOX6FF648PR7GHw4Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
Received-SPF: pass client-ip=40.107.6.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.037,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.10.2021 11:47, Hanna Reitz wrote:
> On 26.10.21 09:53, Vladimir Sementsov-Ogievskiy wrote:
>> 25.10.2021 19:40, Hanna Reitz wrote:
>>> On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
>>>> With new option qemu-img compare will not stop at first mismatch, but
>>>> instead calculate statistics: how many clusters with different data,
>>>> how many clusters with equal data, how many clusters were unallocated
>>>> but become data and so on.
>>>>
>>>> We compare images chunk by chunk. Chunk size depends on what
>>>> block_status returns for both images. It may return less than cluster
>>>> (remember about qcow2 subclusters), it may return more than cluster (if
>>>> several consecutive clusters share same status). Finally images may
>>>> have different cluster sizes. This all leads to ambiguity in how to
>>>> finally compare the data.
>>>>
>>>> What we can say for sure is that, when we compare two qcow2 images with
>>>> same cluster size, we should compare clusters with data separately.
>>>> Otherwise, if we for example compare 10 consecutive clusters of data
>>>> where only one byte differs we'll report 10 different clusters.
>>>> Expected result in this case is 1 different cluster and 9 equal ones.
>>>>
>>>> So, to serve this case and just to have some defined rule let's do the
>>>> following:
>>>>
>>>> 1. Select some block-size for compare procedure. In this commit it must
>>>>     be specified by user, next commit will add some automatic logic and
>>>>     make --block-size optional.
>>>>
>>>> 2. Go chunk-by-chunk using block_status as we do now with only one
>>>>     differency:
>>>>     If block_status() returns DATA region that intersects block-size
>>>>     aligned boundary, crop this region at this boundary.
>>>>
>>>> This way it's still possible to compare less than cluster and report
>>>> subcluster-level accuracy, but we newer compare more than one cluster
>>>> of data.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   docs/tools/qemu-img.rst |  18 +++-
>>>>   qemu-img.c              | 206 +++++++++++++++++++++++++++++++++++++---
>>>>   qemu-img-cmds.hx        |   4 +-
>>>>   3 files changed, 212 insertions(+), 16 deletions(-)
>>>
>>> Looks good to me overall!  Just some technical comments below.
>>>
>>>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>>>> index d58980aef8..21164253d4 100644
>>>> --- a/docs/tools/qemu-img.rst
>>>> +++ b/docs/tools/qemu-img.rst
>>>> @@ -159,6 +159,18 @@ Parameters to compare subcommand:
>>>>     Strict mode - fail on different image size or sector allocation
>>>> +.. option:: --stat
>>>> +
>>>> +  Instead of exit on first mismatch compare the whole images and print
>>>> +  statistics on amount of different pairs of clusters, based on their
>>>> +  block-status and are they equal or not.
>>>
>>> I’d phrase this as:
>>>
>>> Instead of exiting on the first mismatch, compare the whole images and print statistics on how much they differ in terms of block status (i.e. are blocks allocated or not, do they contain data, are they marked as containing only zeroes) and block content (a block of data that contains only zero still has the same content as a marked-zero block).
>>
>> For me the rest starting from "and block content" sounds unclear, seems doesn't add any information to previous (i.e. are blocks allocated ...)
> 
> By “block content” I meant what you said by “equal or not”, i.e. what is returned when reading from the block.
> 
> Now that I think about it again, I believe we should go with your original “equal or not”, though, because that reflects what qemu-img --stat prints, like so perhaps:
> 
> Instead of exiting on the first mismatch, compare the whole images and print statistics on the amount of different pairs of blocks, based on their block status and whether they are equal or not.

OK

> 
> I’d still like to add something like what I had in parentheses, though, because as a user, I’d find the “block status” and “equal or not” terms to be a bit handwave-y.  I don’t think “block status” is a common term in our documentation, so I wanted to add some examples; and I wanted to show by example that “equal” blocks don’t need to have the same block status.

Actually, I think, that the resulting tool is anyway developer-oriented, to use it you should know what this block status really means.. May be just s/block status/block type/, will it be more human friendly?

> 
> [...]
> 
>>>> @@ -1304,6 +1306,107 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
>>>>       return 0;
>>>>   }
>>>> +#define IMG_CMP_STATUS_MASK (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO | \
>>>> +                             BDRV_BLOCK_ALLOCATED)
>>>> +#define IMG_CMP_STATUS_MAX (IMG_CMP_STATUS_MASK | BDRV_BLOCK_EOF)
>>>> +
>>>> +typedef struct ImgCmpStat {
>>>> +    /* stat: [ret: 0 is equal, 1 is not][status1][status2] -> n_bytes */
>>>> +    uint64_t stat[2][IMG_CMP_STATUS_MAX + 1][IMG_CMP_STATUS_MAX + 1];
>>>
>>> `IMG_CMP_STATUS_MAX` isn’t packed tightly because it only has four bits set (0x33).  That in itself isn’t a problem, but it means that `IMG_CMP_STATUS_MAX + 1` is 52, and so this array’s size is 52 * 52 * 2 * sizeof(uint64_t) = 43264.  Again, that isn’t a problem in itself (although it is a bit sad that this could fit into 16 * 16 * 2 * 8 = 4 kB), but in `img_compare()` [1], you put this structure on the stack, and I believe it’s too big for that.
>>
>> Hmm. May be, it's better just use GHashTables and don't bother with these sparse arrays
> 
> Or we could use our own bits here (ALLOCATED = (1 << 2), EOF = (1 << 3)) and have a small function that translates BDRV_BLOCK_* values into them.
> 
> In any case, I don’t mind the sparseness too much, it’s just that it shouldn’t go on the stack.
> 
> Hanna
> 


-- 
Best regards,
Vladimir

