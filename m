Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E070387B4A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:38:31 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0re-0006iJ-EX
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0ow-0003jw-92; Tue, 18 May 2021 10:35:42 -0400
Received: from mail-am6eur05on2097.outbound.protection.outlook.com
 ([40.107.22.97]:25697 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0ot-00060a-TT; Tue, 18 May 2021 10:35:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKE4lKK62BaZE2TGv3nAeSyCv+/LwASpxsmfNs7U7i9Aa1DLvul1HWu7ppNKALwFBWjhOr8vYSAk4tSjVj2JNiyvE75l5EGYQUFcyT1o4/RuSKcvi0mVe1QBC+FndOiKlmIefWiEYqRgOUHyD9UFQZgIQjMYVKJC9Ava7bHXNeGZwL0bBvM4Kwqjkuvtzuzcd2neMsDwDiow5lorDUgkVSRZKVJ7lQNlYwXrjyTDxyvlOlNVniHHjg3+T5FyRF5PcVl8E3QsvACqZskItk02mbbyuiuJTxXTEfrF8sF8yiIM4y7wRDwietDP16F1A5aPWpKn1c21Iee7hAnNXjL3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enGTCTSzkFcWW/DhCVxxWXNEQVOQwHJaEsiFqaN6KuM=;
 b=RCwuxOJ98Seny/Pow03jo5C46Od85Fv+huZ4wPIXD07EILBQtURcxoTfq9i5+z/jt+Hn2qxx0Ew5i3I8GFVrf4o7iu2DqLbN1syijx2TuzEjAsYksj+3d1ar+/7JJFDSIh1na7c3AOZx2TMUVplg4d9HFE3SkflgxGFAsf3lo5jJRjuMPaAVDOdWbt/JNz+fP0M2CwiNzp05PQ+J4ZTwv9wtQPzqX3kvPeuJsoynIBQ5Ms3dtjKhQICi4h1e3B5S2/Fc77XhrjU5mKu51TqL6Qek9FLbyDNaZDOGA3filuxvxMZi2Zo6Ngt/5YNwR/bjY2CZnIGke34CjBvFJwmPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enGTCTSzkFcWW/DhCVxxWXNEQVOQwHJaEsiFqaN6KuM=;
 b=TfF5BYRuzTopBh2plY+Qt+UhrXYM9EoGkVORgTUIcl3tzOHvmOUozheVoD1dbCaQIi+8b9kGxrEybq3NqQ6ufcANzqB/yHSK+P4Sm3HnuCJ83iKzb8ahYBAaEdouvhxjU3iStuTs3T3NgZAW7mqkwMBesqQeltJFtTaLq/l2u04=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7012.eurprd08.prod.outlook.com (2603:10a6:20b:34f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 14:35:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:35:36 +0000
Subject: Re: [PATCH 18/21] block/block-copy: make setting progress optional
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-20-vsementsov@virtuozzo.com>
 <3b6aebbe-4c7f-7759-cc7c-59e3619a68a6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6c88125f-d7ff-ad52-c2ad-1919c442b32d@virtuozzo.com>
Date: Tue, 18 May 2021 17:35:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <3b6aebbe-4c7f-7759-cc7c-59e3619a68a6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: HE1PR0701CA0049.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 HE1PR0701CA0049.eurprd07.prod.outlook.com (2603:10a6:3:9e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 14:35:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 765ab1ff-12f8-4dbe-619f-08d91a0a336c
X-MS-TrafficTypeDiagnostic: AS8PR08MB7012:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7012981280C1B8D80560B936C12C9@AS8PR08MB7012.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 66+5Z3NhN8ETE/eiRQPGcBoQaamCMywunl5wFL+VIKjUPPek4aup/yDBo4yzgDFzGlKDugkZbRAnvnvttupcQn+eQbWGlcdsPBMvY9m99Ht+XdvHBDbaWBPCQKo5UWB1vBY0KHyKDUCP60CRBpuP4jig3+TejcHtvs/QopFuxIp8cmueegjV4t5pGiIFdWJAyNeF5ZLwIvxKvl6TAoKCVR0RYZKWU6C7t0cv7NyWgChKi7/6zFcmyww3RsqZiXd+jkb995Idrz+tlfoKlAhbDPlR7lEfww+6Qj78BkJCbqWTHppXJ9cAjXNd2sr+V1a9x+w+ve2hO9hKhpvtrLI2jBECt17wdXI/QFK67Hx855gunGqWphqMRMI0/h3m8rSSTflKtaGUk8RsHJ9chjTZftto2OK6xMxARgMiJkep0XPwlbCT03kN09NiCZ58z+0TY4ebBsMz/eBMRcYToZxstqIZrOBjuTv9QWXndJKDV6kHLrsaYKFz3XAZk055xcAytcDPp443zbp45Bpm/pUQn0XMlaeJg3+Vu+1dPZwLTaKrsbCr5ctDzB7LhF25mNT3vQhcs7fLB8GnHGccjT5QbUpL2nhqCRUKjOBeA7yE1dfJurTaMpEDJ+JMwYUndlR+ZPzr6cjxbe0MQgr7qV1649Vj9szH2XHJRF7cNAQPnIydSqDGJQKW6qbpC1mo6hJv/IgUQG1Us08Ys/Mwx9n1+6m3AqB8v2E8GQ03X7NlN7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39840400004)(31686004)(5660300002)(16526019)(186003)(4744005)(36756003)(8676002)(7416002)(38100700002)(38350700002)(52116002)(8936002)(83380400001)(4326008)(31696002)(53546011)(66946007)(66556008)(66476007)(478600001)(86362001)(26005)(6486002)(107886003)(956004)(16576012)(2906002)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SkYvS0YxTDhjZjlOTHBxa2wwWjJaelVlS3gvczAxZTRkOW41V25vYldSZUZ6?=
 =?utf-8?B?VzlZM2FObFhMenhkRWpXTXQ2RUozUklmWnkvaENlbm04R2Z0VDBkRUdKSUha?=
 =?utf-8?B?b1BxSDBDdTdzZmorK29DSEl2bnRNOTVQN1JmVXM2TnNrelRuVkxTY3VOMG9n?=
 =?utf-8?B?SHovTDdYS0RkUjBYUE1ReFAva1RNQy9KM1lkQU9VL3k5bkJ0c2hVVkNtTDRs?=
 =?utf-8?B?SjZ2b09YeFgvOFViTTFHRHRNcFB3RnpWb1ExMUVwVjgvaXFBUGdwdGVzQ2pF?=
 =?utf-8?B?Rm9GV1VtdndIc1U0OEFCYWlYZ05hejV1Z2ZJeXdGelBRandKMncxNVVldVA5?=
 =?utf-8?B?R1RIekxhVDlWWVplR2s2Y2UzRHVWaGsvZEMrUURxbmdMZi9KNkRiRWQveU5L?=
 =?utf-8?B?TTg0Zjh1cU01YVRCMDlIY0ZScDcvdThhd2p1cTdYYjFCeWpPVk9YNG9lU0E1?=
 =?utf-8?B?UkduTEV0QVIzcGxqdmZBV2FHTWxEakRoVkFkUXBaN2duN0hxWk1zMVpEa0NJ?=
 =?utf-8?B?b0ZIQWx2R3dTK0czc3VzbmNQTzZlTklEVWV0aW12aGxNRW5RUXhoK3IyMEFE?=
 =?utf-8?B?ejFtcGRXTGJ3NXcxa2hkUjZTUGlaYmp0bGdiV1cveW1UNjJBazBYL1Ntais2?=
 =?utf-8?B?R2t5aWFlbzZiNTVsRjVPaHE1cG96R3ZDajFqSG1ocWM0WkFSMFltMTJ5V3pE?=
 =?utf-8?B?OHpVa1RMcUVHWVRMdXRNUENLZDgxWGNYZVh2QXRJdXJuRWJ2WmhDaDkxc1dF?=
 =?utf-8?B?eEd2QmZYSE9ITFBhMEhJZVJKcnIxZHVGNStsZC9aMDdQU205ZlAxYk1Xb1BT?=
 =?utf-8?B?L0V1bi9YazYxNUIycng5VHdrYTcyTHdZckhRY1R3Uk9QTTVNaktKVG4yYXBM?=
 =?utf-8?B?ajkwcUI4R1U5Z0ROTTBkQ2d3VHhTRExpVGJsNnoxMEdOeU9BeE1vZkswL25u?=
 =?utf-8?B?aFM1WVBJYUZRczc5MUJ4bVFhTE93N0FuZ29KcmFjdVlQQ2xGbWNLbUQwUjNP?=
 =?utf-8?B?YlBSUzZpc1FRTjd5WHVWcGlCd0lMaTNISWpuUWhQbU5DTmxBQTRDR1c3UmVs?=
 =?utf-8?B?WlM5UGVrOHpmSWd6aW9IOWhmUHd5d05DVG9Oem9aSGduUi91SFJpdi9TNFRH?=
 =?utf-8?B?clFFRENleHhFM1lwYkJYaDF1WUd2NUFOMjU5bTJLVTVwc3N4bDNIc1dXNGsx?=
 =?utf-8?B?dEREekR2anRKcXRUUjVNNlNVcHdWelJWY1l2QmRUcWhnS0pYUXVmbGxOM2Iv?=
 =?utf-8?B?MW04NEJHaWhBcGNQQUVzSG90TUZNMENjbmIzN3paY3RwT0wwemp6THZ6cTY1?=
 =?utf-8?B?Uzg2em80TTZ2blBLZ3NqVXc1V3NPSVZ3THRuS2M0UDBTZXp6dG1GcGdST1c2?=
 =?utf-8?B?Q3FmMnFhUVBxMjJibXRHZGJHYjRleU1FbUswNzhkbHNZRGJvWXYxY09qMGNV?=
 =?utf-8?B?czB3ekxySzVERFcxa0NzMDFKOHJPQzVpTVQ0eDQ3eVBKSnkyb0FtbWo2SU5S?=
 =?utf-8?B?SE9tVGxzWHJXRXpBUUxibHZGUDM2a1FJZjk4eDhxRDJrWTQ3YWZ6c2RrTjBy?=
 =?utf-8?B?aHVqWUR5TzhFM2pQaVNyLy9ITmVTMlR6NkhUUTRnNUZDSjVINnJDRnM2OC9X?=
 =?utf-8?B?NHBtMlNYbi95RUthbTltZGNwa0RweFVyUE0xdkJRZElLbWRiNHlPTmFTZTU4?=
 =?utf-8?B?WVQvZ1l1eG05RzN0dTkrTnZhenBmc1FDVDVkbzhNU1REQk9KM3BQSTM3RjhB?=
 =?utf-8?Q?xzbUdildIxmkHtxQF1OuVaNJTvIITQxXfRt5iW/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765ab1ff-12f8-4dbe-619f-08d91a0a336c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:35:36.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ06CsBZjG+nrZdspNM9ahkkfY22oh9XuFJxOubw6DAoMtN//OyhA5ru8CIKo3GJ/h+EpT2Z69okXgNt2a5vQoOx6psSj08CTUmFoKy47ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7012
Received-SPF: pass client-ip=40.107.22.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

18.05.2021 17:26, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> Now block-copy will crash if user don't set progress meter by
>> block_copy_set_progress_meter(). copy-before-write filter will be used
>> in separate of backup job, and it doesn't want any progress meter (for
>> now). So, allow not setting it.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/block-copy.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> Makes me wonder whether an “if (not NULL)” check in progress_meter.h wouldn’t be a nice addition, but:

IMHO it isn't. It's unusual to check if (obj is not NULL) in all obj API functions.. The only place where it is usual is obj_free() like functions.

> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 

Thanks!

-- 
Best regards,
Vladimir

