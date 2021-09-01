Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF53FDD3F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:44:29 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQXU-0007EJ-LX
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQVx-0005h9-L2; Wed, 01 Sep 2021 09:42:53 -0400
Received: from mail-eopbgr60105.outbound.protection.outlook.com
 ([40.107.6.105]:55622 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQVv-0001RP-NC; Wed, 01 Sep 2021 09:42:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku9EjwEHnGsrAEnoRharSWNIc6ME1+HmjbqnudC/onqKMnny6sQzNxrgy1JM6BY3hI1gqjpkMbICAQ9PyHEy4H6qhADsgEnNb7SM6RIyK5BRR9tC6cm+9v37PZKQ5XY0lNLymf8VlVB8EDoD701ds7aRLM96jeFr6Pke98bln10ejCDs3drE1igy9J9EFOPff6iTowIUYLNvCJMH/4GK11yv5ZtutUpatvegW7jBe2B6bBl42e2z0mayDwSYys/29y3K6DyRR53KR8Ys1azmxr5XKG+mGB9w/iLxFng4/GK2SB/nAOz1zqSY4W8HpgGwd2rkgQdi+rKI2JaVY2X5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=h7JXaQda3kQY7Yr+Forc8VliTLXi/fMAoU+zlF0qrpo=;
 b=WhqqKR+/S3wtbG+wWB1+L1xW8FsaQZH0r3cjJpHKd5kTs4rPuuqa7xF/ifw+cKwnb/3qqFCcUw5+FifKzHnQbB6WELI4Nc65dcyxeI78eOXdoul3Zmrt0F9XuAFPrrAvxS7FrzZ3MUUo+70fr+77Rg+g/6huFQ9k4LJDv1aemPpydqFkGGwnAguNHPV+VGM3MyBNPR/Nn0E1csXCh/9LLJpXd+HckOxH3LRVlAyoeyLbCtzhs0MqdDQl4lVXDyud8lJAcViLqiO/iE4gpNjk6Iq/2Vzelv2QbxiJyNENAJF0ksodd8mONsKuDF455kUEiDKk4QdPsoBLNVspROdnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7JXaQda3kQY7Yr+Forc8VliTLXi/fMAoU+zlF0qrpo=;
 b=v2MK9wjAvcK/5DvnUIcnWYlAaKepWhftTuMmMNapGQk6wDJ3it76zHXS4D8NV4Bh7VIwNNwbGniRqRya8TPNbYZdQ3jCdtwcaBEMgi98JTt7A+y/1tD2aCoZqhw7QuCqPO9NMTkeeI2kw72LoV0ZVnYHg6vOcJuDCEdyyzJJfkc=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 13:42:46 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 13:42:46 +0000
Subject: Re: [PATCH v3 00/10] qcow2 check: check some reserved bits and
 subcluster bitmaps
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <482f241d-1a1d-598b-9b58-a975e4657320@virtuozzo.com>
Message-ID: <a31336d1-9e04-e920-9740-90332970efcf@virtuozzo.com>
Date: Wed, 1 Sep 2021 16:42:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <482f241d-1a1d-598b-9b58-a975e4657320@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23 via Frontend Transport; Wed, 1 Sep 2021 13:42:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46cc7565-d650-462f-50dc-08d96d4e616a
X-MS-TrafficTypeDiagnostic: VI1PR08MB5501:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5501EFB20735C6F1E7B300A5C1CD9@VI1PR08MB5501.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /63cEn3yegAMS6px5LGURuri8Ce9nwi/skbf1EXYzhaTbLtRvYZXFG26bCARvt+Lh1AxMdX36KLpM0twX0vjanGYzsOKv2wIQODyEF91/GVCLNeLF9/E0PQSTMg4wqzRKl061/BaoCWppVEgFkQ47b1+fjfxRtbiJiShxKRXk/r2GODS66QC0OwKkMHFuKf69H8fg7ckfcgugHp1hyOF7qpfyI8NTmL+S3MRNtdrGIDUUJlA8NgGX2U5Wpg5R/uemvPVI7wM+k5ESaA5x/cWDMGkqmgzxT+/9hB9mj+41oYKbph+pO8J31wqdjhZav1WjGxLbsZs4/fus6x6f3y2wFYGJHnjNH2CuR91kEYlS8hNWlznNMBVBWS5WYfCc/4PPdzEB32LcbyVuRcWtoyP+BmqLDeZ4xkwQTR81N2OfNYz/OVSgGpkDatMcyz2CDsT9D4BIidaE6N/yxy0b31S0BliSVUYtqDg8n9skQbtBNIv8rQcz/dQfiePIFEKT/sM01p/LAN83mRIfD7jUeEcLixbdBskAVs+ad1a81b7AwjbRaQNx6TEDb45+7S2xxKObiuSBPbZgqO4M45tjtJ0y4XVfI1xDVNeaLDBmfHEKoT+VyeL8bWpovVuGLaz2ijYSdyqpo0abQ1ma3P3WxbnTLDALhjqHfxdFRp2zXfOmGTnrCL1R8TbIq0OWJeAmZoQr5oSLVrlzb4bW2AfMgK+rBIdIXovv0eNlN9mubQzCv/ErIQwzC5/Y4NM90C5Bm81kEM54QwwWVxBTi0FeCueLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39850400004)(52116002)(36756003)(478600001)(956004)(2616005)(2906002)(38350700002)(38100700002)(6916009)(26005)(4326008)(86362001)(8676002)(316002)(16576012)(8936002)(6486002)(31696002)(31686004)(5660300002)(66946007)(66476007)(66556008)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R8aNrObjam9FTSPwGHQnfGK4x1y/Kw+OntE5b0DWb0fYGJM4e5lx+0j2g8N177t1q+zihh6TSCsOqIyeP76bGYIjPNve8+SnS2VpMoh7jztiv8uD7a+TW3dviAjn9TaMvvk8VFcHBgZyEEXylifEEYDrZBGUP4rFh10gYq8f2KJFH6aoXJxuolfpZVr4SGJVhwol9LoTxX4sjjZkZy3ImZp+aSQbUk2t3cokWUPCfyKIpmdxL8wHVIbzV5bS2urgmGJ+HD8p04yUPhylITlQZY/Kqn/DG164OH6kEHl3NOv3hhNL3r0EavO81Hr3Uu6J4N/1R6svJKp9bAF8fHSh82gK34sxQcLydSb6gKWgLXUStezrYd8qinQdjFv3qJeh5ripooh8MzE5YwwgepK5KSGSyAXxYd0UnQhxzXKMEker9JftxIhJ9cuywmOSAT6losCr1czmczGNSrPoDSUYuxjqk6mr1kOzuMPZrZSbVn/nsXJFfiy5d0Zis411GnyupKirlpe1uv4ENbZcffxEDHMhj7A/OGJ0VtJkRCeBcGl8Sk2Xr57ITaYPigBGbGTfMthtnJxYMo4aDviaIiQGBWZ01RqgH718I+3zlrVa9AKJ8tAUrE0iDx5f3BUEHiaVp95Ur0Lv+oAu02g775beR90LZVqjjTY0V/7GRfetVCTVikzTh6e6bH48UnU5pj6ejjYeiEL8BULHPqaxR4d+eyOa8BipazCQQ97qF12vMp85a6sj50hrBCZMB8ha2I5G
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cc7565-d650-462f-50dc-08d96d4e616a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:42:46.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzVpdT24xvj9QXoTkXz/huxG0qzw4eY7ugwWn03SwwcsFVwynw/fZjK9YfJrNDYCqGBeY9Gd87nXSods1VqA+lnEh4TZUf3R/eGWIuTEggc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
Received-SPF: pass client-ip=40.107.6.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

Ping again:)

Nothing changed: patches applies to master, 08 doesn't have r-b.

03.07.2021 14:17, Vladimir Sementsov-Ogievskiy wrote:
> Ping :)
> 
> This still applies to master with no conflicts. All patches reviewed except for 08.
> 
> 
> 24.05.2021 17:20, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> Here are some good refactorings and new (qemu-img check) checks for
>> qcow2.
>>
>> v3: add r-b mark by Alberto and t-b marks by Kirill
>>   07, 09: add missed "\n"
>>
>> Vladimir Sementsov-Ogievskiy (10):
>>    qcow2-refcount: improve style of check_refcounts_l2()
>>    qcow2: compressed read: simplify cluster descriptor passing
>>    qcow2: introduce qcow2_parse_compressed_l2_entry() helper
>>    qcow2-refcount: introduce fix_l2_entry_by_zero()
>>    qcow2-refcount: fix_l2_entry_by_zero(): also zero L2 entry bitmap
>>    qcow2-refcount: check_refcounts_l2(): check l2_bitmap
>>    qcow2-refcount: check_refcounts_l2(): check reserved bits
>>    qcow2-refcount: improve style of check_refcounts_l1()
>>    qcow2-refcount: check_refcounts_l1(): check reserved bits
>>    qcow2-refcount: check_refblocks(): add separate message for reserved
>>
>>   block/qcow2.h          |   7 +-
>>   block/qcow2-cluster.c  |  20 ++-
>>   block/qcow2-refcount.c | 328 ++++++++++++++++++++++++++---------------
>>   block/qcow2.c          |  13 +-
>>   4 files changed, 240 insertions(+), 128 deletions(-)
>>
> 
> 


-- 
Best regards,
Vladimir

