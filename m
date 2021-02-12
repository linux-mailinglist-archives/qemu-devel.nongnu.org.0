Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7CB319CD5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 11:49:59 +0100 (CET)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAW1N-0000we-Kj
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 05:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAVzw-0000Dm-BH; Fri, 12 Feb 2021 05:48:29 -0500
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:18343 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAVzq-0000Va-8n; Fri, 12 Feb 2021 05:48:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5uzDd92LlqKQAtXCX7z1oCzvgQTzg/PV6/azPwSmrjSlCjphM4m64dyxLV7U+tXu6h+1qtOGc9UvN+Q3eSUZyivP2kSq6qijTsmkAmEXDi+dI7uaMIrGpd67lg6V8pDGBZLENy/CabZNa/YGIMuw0LLE+6uCfKNSZ72gMovHNdtHzlzAAVaNP+ClFAFfbTAklriInILwRsTVebizWhYBVWBLgCwQd164WzbVjMEw5+kreiaavcpsiNGKtwyGOrmVH6//6b+wPa3NazwYf8XF5GYfAhaWTd604zvUeOOhDj3jjY6wVX5Pm7TFT3Jp09lI8S26IP1+EcsCt9qAJUaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82WyDyF8NNRgdFVyqwy99ITVIuJnFeBzdW9Fh91OAfY=;
 b=mOh3qJt60y3N2idiQP1jMthlKgZ90ZnFBwB+HooriUa0yLMQQiX2Up/kwGSWAEen/bmdf4DoVhh9r2z8ogSX17Mqyjd6sBdXZsSnT6JPm7jC2GzRpcUfjy4Rv4kSrWyH6FP9J3AqZwEsdwXapW3K+ncu14xmDBx3QRiAnu5zGMVqzaiKPe7UrUJ/W2ZNuojqk7t7FC2ZRsl0IAxiG/w5kfZwBvWI3dAydvQYINgbXTE7A5shrD3Nr+ppl4i+m21v9wej/KoLghmCAFJz0zqfPMZP/UW5Y5D9yepR52MTKI2pWol1PPRLhXxTrPgTod7qnG4axeJ/PwxLJe0bHbr3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82WyDyF8NNRgdFVyqwy99ITVIuJnFeBzdW9Fh91OAfY=;
 b=D6oMxtZAqSlAhMUHC/ZQFfGNurV1msHh3KnS/SCr+pJ0E7Y/ZD60e8jlNnYG960Uuu23dML9BOKX3THzlBix192mS8duHPcY6A8PyrYwuM49ufX5Keoe0NhmrcsiNPs6bff6q2ILv5iKeqfMVUsLtGDpv4oKjKoMUDPutfDavKM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Fri, 12 Feb
 2021 10:48:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.034; Fri, 12 Feb 2021
 10:48:17 +0000
Subject: Re: [PATCH 1/2] block/mirror: Fix mirror_top's permissions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-2-mreitz@redhat.com>
 <182ee6e2-865b-5d83-a7d9-c95e2a5f44df@virtuozzo.com>
 <10b1af76-a335-012a-1750-855b7a8e2992@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4cb8e49d-d0b9-215c-b469-fae89db3faac@virtuozzo.com>
Date: Fri, 12 Feb 2021 13:48:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <10b1af76-a335-012a-1750-855b7a8e2992@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 10:48:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba564c3-8698-4474-857d-08d8cf43b489
X-MS-TrafficTypeDiagnostic: AM6PR08MB4852:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4852E25E40EEA60E105A5A1CC18B9@AM6PR08MB4852.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Pox3j0xGDtDZtFYqXlVYb01adpiQWR4J7cFGiC92B2R+Wp5YrwAPGqU4Dzgq9I6FtXhYqp7PSnPZGt6u0WZJ9iK7Sa5t4UrPoNM6NsyRn401apE4S0cVpMh+zEcdOjf6MNVLWzEQQMWMfmSAn0y6mi9c3dfVYzLn1myaV2vOYOmrTNSr5t5xx8QQg3/3CNXnDZa5ODkuP+MuXSanirMsjYcfZZ8ik1Dc0wKvKlTOsnSw+GIRPNucOO6NneaTEyzTcEwXTj3jMjrS50b/xfofEs47Ks6jCjao7q08Ov7Gk3yWytHCzRPWkX4mgQN3L0znsqHovMT6c8jfchhkJHuXO6+lCTd65/kq7abaGJrIhGzc3qCTbHmEbhU1z5ivLoCTVQUcEnnyB7SCdGHZy7RHM2KOnhiCdSCBQyxOixlzEny3M1e2ULs7WP5iUDsS6PP4Opg6PuY72q1+Uz0PkKKNdNYcjOx20EkGNXZgwGLKGlJ5aUKCqM++z3eXxQ5Rjb2uTaY34p4yCA8ZaatBhC7+UryDP0SS+w3gUBCRIki8ayyZjSwKRlT+1IRzrBAZ9pb0a2XwIGXBJf9V58p1GibVs3jDmdXv5B7Rf+gl7QaMfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(4326008)(52116002)(83380400001)(316002)(16576012)(478600001)(956004)(31696002)(8676002)(31686004)(66946007)(16526019)(5660300002)(66556008)(26005)(2906002)(53546011)(66476007)(6486002)(86362001)(36756003)(8936002)(2616005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qk05UVB2L2ppTmRjREFxek5SblVUWnhxSkgzU0UwUXRjcjQzQS82ckNmMXFR?=
 =?utf-8?B?b0xkZ2F1WlhyRXA1dWVSTWdkV3locWlLcjJnWEIySlZ1dVJNemFDWC9RamxV?=
 =?utf-8?B?NFdLNDlRQk5jdGpETjBEYS95OFFabTdaeXAyZ3hlMm9GZkkva0FZV3JWUi9K?=
 =?utf-8?B?Ym9rbkFWdnNlVXBwWTNvRGk1K0xxTVMvbHhVb01ZOHNmaCs4V09mTHNJUHE5?=
 =?utf-8?B?OFRCNEZKazJjeHZaL2JOSnF4cUR2ODRPVVptaDl4VFZVdGJCRkxIdGIvcUx5?=
 =?utf-8?B?T3dCZUxwSXYzbW05d2VESzVlMVB1WXYvSGY2ZnZhWUVxdDhaRWR2Zm5nY25m?=
 =?utf-8?B?bmxRZjBiQUJZVFYyOFRSMVVVeU5TQWo0Rjc0S3I1ejN4dFN6cDdyOGRZUzZS?=
 =?utf-8?B?SjVHd0VORTIrcjN1YnNvNmNkL2lCV04yMmg3MFVueTUwTTlXVnhSS3kxTTZX?=
 =?utf-8?B?TmdJOStFUll2TmdtQWpweEhuV0ZHTFl4UnlneTRtT3lUSGlNUXJBQXp0Nmxx?=
 =?utf-8?B?WXJUbmlWTFhHdkVVV2hDU3BCV3hhVm9NOHVEMVVqdU5tZGZYVG5wZnV6ay9i?=
 =?utf-8?B?WVdpLzJEVitHSUNYaHlDc1MvNHJDSnlzUWdZODM5MHB3cGFvT0tnckdyYkth?=
 =?utf-8?B?eEpMbiszUkxUVmhRV2VKT3QvV2l0ZUFKRVFBNG80aEwybklRNDZIdEwrR3Zu?=
 =?utf-8?B?bnIybHB6LzlKbHlEY3o2N3lTTGg3MGVrRDV6SU1mL1RVUmZIbWJDMEM3bEoz?=
 =?utf-8?B?YjJDOFdsOW5oL0F1UGVURHlvakNpRkgxVU9IY05WUldCUUxkWHdZWHlYMUdR?=
 =?utf-8?B?NTZaYnFtaWU4N1Q0RnNMUE1WZzdRVEhkMzJ5TWVrdE9tcGM5b0IyVGpCNGhE?=
 =?utf-8?B?TE9veFY0RWd6VHFXdHd3cHdrNnVidHF1OW0veVVNZjRqaXJYVzJwbWRiWGhy?=
 =?utf-8?B?STBqbVdWQ0JwekVtalczeU1LWEIzQWxaZWcxSVp6cEpqcVYwclYxaS9xVWts?=
 =?utf-8?B?bzlZZUVMWTV0NjFwaTU5a0ppSVpaREcrdHNpaWQyWlpoK2p0b1NEaXRValp1?=
 =?utf-8?B?Z0pldHFuK0pLN0JwMGNuRHZQMFhiNFVIcUJ4QkFHL2IxYmlGTHZBdFpOZmJD?=
 =?utf-8?B?MVFvcXRyWW8zNmM5Rmc0ZVlOVWE1aTVRaXhidGN2Z3diRlQ1M3BUNFE3RmIz?=
 =?utf-8?B?WFppOHYvWEY0MVBzWVVKcnlaQUYrVy9WS3RkckVWQnZydHE0ODBGbDV1ZFpO?=
 =?utf-8?B?Ui9QS2tSS3I3VXdCRkVMTEk4NnAwS1VXMm9pSm0xTjZub3JDKzFJT0pJQlJz?=
 =?utf-8?B?SHg4S0RVZ0ptbXREa1YxQjJObmtHQVRDVSt0b3JGRWkyaG1YR3lTT2ZNTmxT?=
 =?utf-8?B?NFdQMlhsb3FRaWdxbnZTMWtqYUNBUy9aZFFnNmplRzVDNzgrbzVPVUxZM2My?=
 =?utf-8?B?bFBETzhzZUlNTEVIcnZtaHIwZDNwenJxVFZyem8zL0cwUXA4aUc5cWRZVVhp?=
 =?utf-8?B?eDk2aXFjc3BmYkV1NVFTUEFwdXJDOVdoa1phZW9zVXJLbU16ZTBmd3VRNzVr?=
 =?utf-8?B?UjhycDBlVC91bVN0RHdnWkpmNXVwY0N1NUNNNkFFN0IvekpRUSt5WEFtaVlD?=
 =?utf-8?B?QStadTlqVUhtdzVjcVJPNGhrbW5wZStKS1Z2bEdwdUFncmFvcGdPcmV3MHFW?=
 =?utf-8?B?cmR6QTRoV0ZNdzAydWdYV1FYSHNYT3BZaGR0NU5kTDk5L0w3bVRmZ3lNYVZG?=
 =?utf-8?Q?FbVq0YUxr35EihQczjlPdOYpaQT5KJq9fbmrzrV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba564c3-8698-4474-857d-08d8cf43b489
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 10:48:17.2979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1x9Qi+T64i+Lo2UceIV5vsWMQoVx+6gjd8FoctpXg8m8IlphnB4Ln0HIm0w8Gfu66gHX/8XtdBLtRYgnupnRyk5g4RzSElDCva4JDlT4dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Received-SPF: pass client-ip=40.107.2.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7,
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

12.02.2021 12:23, Max Reitz wrote:
> On 12.02.21 10:04, Vladimir Sementsov-Ogievskiy wrote:
>> 11.02.2021 20:22, Max Reitz wrote:
>>> mirror_top currently shares all permissions, and takes only the WRITE
>>> permission (if some parent has taken that permission, too).
>>>
>>> That is wrong, though; mirror_top is a filter, so it should take
>>> permissions like any other filter does.  For example, if the parent
>>> needs CONSISTENT_READ, we need to take that, too, and if it cannot share
>>> the WRITE permission, we cannot share it either.
>>>
>>> The exception is when mirror_top is used for active commit, where we
>>> cannot take CONSISTENT_READ (because it is deliberately unshared above
>>> the base node) and where we must share WRITE (so that it is shared for
>>> all images in the backing chain, so the mirror job can take it for the
>>> target BB).
>>>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   block/mirror.c | 32 +++++++++++++++++++++++++-------
>>>   1 file changed, 25 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/block/mirror.c b/block/mirror.c
>>> index 8e1ad6eceb..1edfc3cc14 100644
>>> --- a/block/mirror.c
>>> +++ b/block/mirror.c
>>> @@ -89,6 +89,7 @@ typedef struct MirrorBlockJob {
>>>   typedef struct MirrorBDSOpaque {
>>>       MirrorBlockJob *job;
>>>       bool stop;
>>> +    bool is_commit;
>>>   } MirrorBDSOpaque;
>>>   struct MirrorOp {
>>> @@ -1513,13 +1514,27 @@ static void bdrv_mirror_top_child_perm(BlockDriverState *bs, BdrvChild *c,
>>>           return;
>>>       }
>>> -    /* Must be able to forward guest writes to the real image */
>>> -    *nperm = 0;
>>> -    if (perm & BLK_PERM_WRITE) {
>>> -        *nperm |= BLK_PERM_WRITE;
>>> -    }
>>> +    bdrv_default_perms(bs, c, role, reopen_queue,
>>> +                       perm, shared, nperm, nshared);
>>> -    *nshared = BLK_PERM_ALL;
>>> +    if (s->is_commit) {
>>> +        /*
>>> +         * For commit jobs, we cannot take CONSISTENT_READ, because
>>> +         * that permission is unshared for everything above the base
>>> +         * node (except for filters on the base node).
>>> +         * We also have to force-share the WRITE permission, or
>>> +         * otherwise we would block ourselves at the base node (if
>>> +         * writes are blocked for a node, they are also blocked for
>>> +         * its backing file).
>>> +         * (We could also share RESIZE, because it may be needed for
>>> +         * the target if its size is less than the top node's; but
>>> +         * bdrv_default_perms_for_cow() automatically shares RESIZE
>>> +         * for backing nodes if WRITE is shared, so there is no need
>>> +         * to do it here.)
>>> +         */
>>> +        *nperm &= ~BLK_PERM_CONSISTENT_READ;
>>
>> this works only because we don't assert READ permission on generic read path in block/io.c, like we do for WRITE..
>> but this is better than pre-patch anyway..
> 
> Yes, because you can read regardless of CONSISTENT_READ, the question is just whether you’ll receive consistent data.  The caller needs to decide whether that’s the case.
> 
> Taking that permission kind of is deferring the question whether the data will be consistent to the block layer.
> 
> In case of commit, we unshare CONSISTENT_READ above the base, because the data between base and top will not be consistent.  Starting from top, we know it is, so we do not need to take the permission, because we do not need that guarantee from the block layer; the commit job can give that guarantee itself.
> 
> (I suppose we could add some ALLOW_INCONSISTENT flag to read requests, and the permission is checked when that flag is not present, but I don’t think we really need to.)
> 
> (Technically we have the problem that there could be something else between top and base that unshares CONSISTENT_READ, and we’ll never know, but addressing that would be complicated and it’s only a hypothetical problem, AFAIA.)
> 
>> How block-jobs and filters works - definitely goes beyond our permissions architecture..
> 
> FWIW, AFAIR, the first job filter node was commit_top, whose purpose was precisely to allow unsharing CONSISTENT_READ on the base and then offering it again on the top.

Hmm reasonable. But sharing writes though backing chain is not that safe

> 
>>> +        *nshared |= BLK_PERM_WRITE;
>>> +    }
>>>   }
>>>   /* Dummy node that provides consistent read to its users without requiring it
>>> @@ -1583,6 +1598,8 @@ static BlockJob *mirror_start_job(
>>>           return NULL;
>>>       }
>>> +    target_is_backing = bdrv_chain_contains(bs, target);
>>
>> may be initialized together with definition..
> 
> Could be, but would that be better? :)
> 
>>> +
>>>       /* In the case of active commit, add dummy driver to provide consistent
>>>        * reads on the top, while disabling it in the intermediate nodes, and make
>>>        * the backing chain writable. */
>>> @@ -1605,6 +1622,8 @@ static BlockJob *mirror_start_job(
>>>       bs_opaque = g_new0(MirrorBDSOpaque, 1);
>>>       mirror_top_bs->opaque = bs_opaque;
>>> +    bs_opaque->is_commit = target_is_backing;
>>> +
>>>       /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
>>>        * it alive until block_job_create() succeeds even if bs has no parent. */
>>>       bdrv_ref(mirror_top_bs);
>>> @@ -1646,7 +1665,6 @@ static BlockJob *mirror_start_job(
>>>       target_perms = BLK_PERM_WRITE;
>>>       target_shared_perms = BLK_PERM_WRITE_UNCHANGED;
>>> -    target_is_backing = bdrv_chain_contains(bs, target);
>>>       if (target_is_backing) {
>>>           int64_t bs_size, target_size;
>>>           bs_size = bdrv_getlength(bs);
>>>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Thanks!
> 
> Max
> 


-- 
Best regards,
Vladimir

