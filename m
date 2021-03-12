Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E69338D28
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:34:37 +0100 (CET)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKh00-0006Cx-PF
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKgyK-0005UP-0h; Fri, 12 Mar 2021 07:32:52 -0500
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:41066 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKgyG-0005UR-EQ; Fri, 12 Mar 2021 07:32:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kun+1PhwQOxG74HdS6/Qd764dk6aaIcg4gFdz0rQ9NRTiviX6jwEo+Y0a2OICVtIEQCL6q03GqQuk9Fvhg/zDtLjnFgascQ3ZDaotxpLaEjzsdzHmwffKJFGU/umU/3V02I05xECXmEp5MkW+c356XznKX4jRE5hKsECWNCIeU5e83RlRibUMawq7uWy9SWeko0qvLdYrPBny3I1ZPcvuxLn8ejqfpMYT7uDdo3pu4fgZ0K1pQnmGQK3D7R742BGfJfej/nzkYhlWF01MVej8C9FLFeY6wAaLg3Ay1x3pNi5j/NFDk8F/6gdlLj3Fw68ipG/fEwgE/Iuk8e7MDhd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfIbs7+eIvo55Cmq7o24N7IavlJti/N+52W0MCImqyE=;
 b=dNm8Nvh8qIQQflAZf4LcLveupwnWHbqNSEAkEjSGwK+k4i42EL6MxlTc1cL7abe8HBS5otEI2v/w0TYPioNkMN+nzc9SxE1ZlJkyORT5xRIqth/8Ovdziydy3eqKAVKOVeqL4EyTvRhnMfSHTecZdvMAjOt8GIZ6dIsLGV/ejWNxRvp0S283AxVJeDksfKDTS8I/0V1HKjZNrkUpbtGGCwUoChsxMjFd+WgYaMMyCxS2Jh1MX3QQoeUv2Ab+rvKk8xrpULQIvEaiIV27HC9001rM9aE0uK5aupURhqODfvq2LOHq16g7anD6qvs3h/6Y1qHLjWiH+RWrxIfDD7kiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfIbs7+eIvo55Cmq7o24N7IavlJti/N+52W0MCImqyE=;
 b=NDBR0JdcpG+qH5Quna7lRic2Dytans32KZqyt6ArWW3HPvj+Us3yAVDhClXTnqhVPKkYjrSaxulWQpfOHmu7J6cU9bJ9+7otf28jXRf3nmdn3SDMh93hb5f08hFqD/BKquWDgKGXmmiQNZNzlp/leKHYHxE2f0OJTPfNuM5h+Dc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 12:32:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 12:32:44 +0000
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
 <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
Date: Fri, 12 Mar 2021 15:32:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 12:32:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 327110b5-16a5-4bb6-5083-08d8e552efb0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-Microsoft-Antispam-PRVS: <AM6PR08MB43424D04C97B122363DAAD6CC16F9@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQLAbtlUieYBTN0QsDpe1ecFLN1B7dLCFABUWuMqPCiPGkYID7KMJcwUG8hfTrFoBLFA6iFN+E9UMmLytbFmQePmqZ83tJ3xueNuXGjeAmjNTe9RnxHt54cyoQQxg8KZlBmqfK8mlmHkZ6D+1Q5ESclMuLmsHkvCyChKXhVAW/qZw23XOpxiTQ0iAiQ/2OgFQQ97B27QkCVcQjWpUiaXGPZ/8UUW0lA1x3vWb6Cn/6XNtlqxqb80KmSDlNa1x8UjB0sXLwI+NeBC78QvGl7iaCqlSYQ95cx54tnR13wqA6IfKICukf9GR5vlSNW+SHV92Wec6Bqp3kHyN80t3SpZwZtr++BKxg5IlVbdiuMVLTtaYvqxsO2QheFgcbNjfRbbe+SMETks1ZOXcKh7IK3LwsnfRogEu8z+Udgik12c9zit8Szovj6T/EKOI11AyHZmlwE7Y+jVfTAQ97xEjg48pTVxUnVJmm6GD1G8pmcRBNQwPuxpQNlkuyVUtOv03gA9b9bUUICCU013Rn4HgXKyITLuPTjOPSolyGVXmwaFz/vV6973tqa7xr1C5rsG+R7o4fnIRBGWKC/PsoIX46+XR/QOAGO8dTiVPESJSU9xxRk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39840400004)(186003)(4326008)(31686004)(2616005)(16526019)(478600001)(5660300002)(31696002)(26005)(86362001)(2906002)(36756003)(8936002)(316002)(8676002)(16576012)(83380400001)(6486002)(19627235002)(956004)(52116002)(66476007)(66556008)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: fBCpOjf8z81xkazm82BJj7xg9wIejyA0qiERpfw+KzmSUetDE81O6/GHdG2th+qUcBcSMjit/Ge967Lm3+Vuob+Wr4jLTWDm6fdjTZWLEsfB7QsGo0/pmFeaoUHlc4geKI98sH4ZHEE+qsuJtO9xwFs7ukHpw39b74IHjiGJJtTyDjApJ+DZyX8UX/NvGoHZJvOyejKsOO/CSjTgO5dkOARvDkJFiiOkN3zOJoIguFk9mMelSy/KAsHAC2sj/QJHV+dm8zGMapuTdEwyg6RUxnA+2Ca5BVWiJUOSdO4NKdeCv4ZZxP1r6gizPVOYwx3Jer/GuEXj5FnSOFcE+XzNhuz8dwgD5+z5mwh1TK2w4DPELqZ1lc/kFem0syAT3BEmw75+Kxsca5NIB8sLHD+HjRfNA+K0I3WDtA29njboi+RGJlTmU32HAWOGlXHlhm+AySy6iEnxNvaSzviYPfNIUONT5lEPJmyuwLRNrRSO//qJ+4IHC3eWnTM1/83tKwZWIuUqoWXUNlh2nMi1pS8oHIW9wogtK19f0VR0qTAWPBS5yZpvzZ7djMqVQt0aHKie3vmHkWaGB/OeQ1c7kmNHOX57kDBfdE5ylyS+pVoaDkbOS03EuAK0A4i09sTAB2Q6d41RYeSyQfN0g5q+1HDxt0MdzcbdDc/txD78PR38Yrz3Dd0H55Ehfn7DB3kPVGNMxPXFGXlDsPW7vHpsv8ht41ucPdNQr1ZzQ3kJHFf8IEzM88NqNsdbox1FzqVhUo/P
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327110b5-16a5-4bb6-5083-08d8e552efb0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 12:32:44.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV7j9L0ZHXhUZ2d1L3LGmgaSgsQ4oVTEMkapnBGizer1DdYJtPWG+NDUJ6cEQit8aT9iuaKKo8XU97PeyeY8t+8woR8S5bBXT2Zwn0+2Pvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

12.03.2021 14:17, Max Reitz wrote:
> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>> 11.03.2021 22:58, Max Reitz wrote:
>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>> becomes 0) and reused during data write. In this case data write may

[..]

>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>           if (refcount == 0) {
>>>>               void *table;
>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>> +
>>>> +            if (infl) {
>>>> +                infl->refcount_zero = true;
>>>> +                infl->type = type;
>>>> +                continue;
>>>> +            }
>>>
>>> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?
>>
>> Don't follow.
>>
>> We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().
> 
> But the code under “if (refcount == 0)” doesn’t free anything, does it?  All I can see is code to remove metadata structures from the metadata caches (if the discarded cluster was an L2 table or a refblock), and finally the discard on the underlying file.  I don’t see how that protocol-level discard has anything to do with our problem, though.

Hmm. Still, if we do this discard, and then our in-flight write, we'll have data instead of a hole. Not a big deal, but seems better to postpone discard.

On the other hand, clearing caches is OK, as its related only to qcow2-refcount, not to inflight-write-cnt

> 
> As far as I understand, the freeing happens immediately above the “if (refcount == 0)” block by s->set_refcount() setting the refcount to 0. (including updating s->free_cluster_index if the refcount is 0).

Hmm.. And that (setting s->free_cluster_index) what I should actually prevent until total reference count becomes zero.

And about s->set_refcount(): it only update a refcount itself, and don't free anything.


-- 
Best regards,
Vladimir

