Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2103FD9E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:00:08 +0200 (CEST)
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPqZ-0005b7-4r
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLPej-000717-LV; Wed, 01 Sep 2021 08:47:55 -0400
Received: from mail-eopbgr80103.outbound.protection.outlook.com
 ([40.107.8.103]:26501 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLPed-0004P6-Et; Wed, 01 Sep 2021 08:47:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPdWdMp6eLV+hH0OYUwaHcaZ5vLliMnMTld4OwJnMQRjZaligV2peLOluG7Gxmg8ZFoKJKN2K2FyLYHIcMUu8fAxA7Rf84cIlXyuXPl5vXpLM8PVHOgPldYa+Z9dpqOwN35V5Xa4BLZxO0LCDl71PG6Oha0Ybtu2JuEzzsM02JuG65sN/kfjDM/CVZLhGqy4ip1lGKUXY/fOaQ+IbXgAqH0dOd9cwaGZNDlRQWC1HycaOdvQ10M9aoneLDPWy7eAxM+bnW0vkqunhqkxhKDx1z2c0MhbZulO6yRkPW2xKMZpqPGWZoWf1EOBUdsFtSqbSLGIaLDg/PfBsWVbsquRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IH2gX7Isk8v+S7NMH5Ypz/+zxqhWjmTllJVfd3VM61Y=;
 b=bpIP0FBXBtIOvdMkParsbmCHMz0hy0NlGmpZRR6kemzL8KKOf/Ndcpy/D+1Ut+2W/+zjsZffby97GiuHzxp2E6CHtzwg7bCSP2aBeml/NqvIM0vr1ORP2fpcgp63ns1xQmbIFnVzUgYQG9kW3nxLOD6TUntBTlUdPtx4/Bp6aFUvwXC62hlNn71jQTu2TBd8g3veLQaeGn+bnYBxUzN9kvTWxrUumyZow3A9FwzQ77Bn6vXVhb5nmY16/llXIdlnEDr0VtliTOUtUnXl/93ArPhlvuaeStcDANv96JuDBK+7J/dIWcGrFVGiYPxsrq13CsAuxhMnmED28on+YMs36w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH2gX7Isk8v+S7NMH5Ypz/+zxqhWjmTllJVfd3VM61Y=;
 b=GO9+hjKv0cz6KNVdDHNp16ABDPCxxMCnzREqOzyCByJNVKi7HeVlgS9TmwcxDHkF6qmQXhZO5YDiwx7HijKeRP24+seuX0zuPKUO1zzCEop2ApJpqembbM8fbhpR0DJqxG47XadloWwiEM1xpazqVRviOP8qCKbPJekNfRBp8Cg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1663.eurprd08.prod.outlook.com (2603:10a6:800:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 12:47:41 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 12:47:41 +0000
Subject: Re: [PATCH v8 28/34] iotests: move 222 to tests/image-fleecing
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, kwolf@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-29-vsementsov@virtuozzo.com>
 <3dc6d789-1793-d80e-7318-2714de7e36ec@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4ca70606-dba6-9fb6-20ca-a3971216b0de@virtuozzo.com>
Date: Wed, 1 Sep 2021 15:47:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3dc6d789-1793-d80e-7318-2714de7e36ec@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0123.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::15) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0123.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 12:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e87f512-a7b6-424a-1490-08d96d46afe0
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1663:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB166322717B3FFE41B8EA3667C1CD9@VI1PR0801MB1663.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2mJNdJp6wdQYQTinwUJetusOwIw+/HVnmmD9Y5sn1IIfsgrk+b69O5mTMoYrYCd+0Z1Wpq3rP5YstNSlymhkKG2Grcqi9/HOeC+jtmhOrrivKY++v8m0EeI/mYkOSzDp8anAVQxhikZ8MybhgQfNtBQqQ7jPeHgeIBKF+asRpGeDQqosDIyJrvGl3RnF1HsfGBmstNnu97c9w+S+KLiKjTthjyhe9GprTh6RLaIvuUxx7+39Zmdf79sbubB8v+PY3h0ZIw2WfGiNEwiZmxJRZ3eedACVQ13I/W2uTjDaJah/zjI1670UnC9uE6skA2O80PZqjD+7pYU0eubiQGQlDexNPaQj4o7awX/eAjPXHtdZU6dhGck0z8lGpJRpyO72/vhbIcBUJx/6F4rCHcwxiDtd8m+T79B+cWVXvdQJGyXENqrJU2KryFuizoDtusOjZuNS/xoDxFtIAgBwmuq/L4PhvgcxRAauX1Ob706d5BYhUC4J7LpgIpvcVtZn4+Nq97dszH2X/ySHrKpDJWioj3r48yOo0YR4R3+2EiegAzyvk0mINajG5TFWaDGB7g2P95B/jtgc35YS627EMXG6JSBhxSGVHpfbyP5uWYbSn43ovxGQVFMQcc3fV6Nr1P+tyPmikM4gyRZKKbdvsXSutfnKW0EZ3uqmdt9qjmuWHJZrEZGxQAyW0rANFuP5pPdBrCQeaZ63ahgBMlq/1xKMiqSYyFmJTTDW3DMxtPe2OCsGeQImettgCtw9QxeeFDXxQokN5Q3WdxC7QQBdoSqhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(6486002)(5660300002)(66476007)(66556008)(66946007)(8676002)(8936002)(7416002)(316002)(16576012)(31696002)(36756003)(478600001)(2906002)(4326008)(86362001)(83380400001)(2616005)(956004)(38100700002)(38350700002)(53546011)(31686004)(52116002)(26005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHhDQVk4T2dITkVZRGVxQXYxSC9ySVJISGxBNlBNYUptbGJzWkNDK2NXOUNT?=
 =?utf-8?B?NXZpTWNGNEk2UFRxNXY1TEt4VU80eHovU2N3K2pmMWZhZFFLQjdMaXZubU14?=
 =?utf-8?B?RUMwcGtRK2FRRVEybVRyTlFiZE8xNE5ScSs2eVR3U3l5Nm00akhtZllMZGsz?=
 =?utf-8?B?U1NkTldLQVFJUE8zYzhTYXR1K0J5MUNnMVVTS1ZZcm9vbTFFa1c0YlFPRXRR?=
 =?utf-8?B?NUlMK3dUa0J6YUN1cmpqZ3NFbnlGVGoyKzdhNFdXSW1QUW5qRUhsWXVuZHE4?=
 =?utf-8?B?OWRscHVlQU4vOXBlOVV5VFFiRTNDeTlTaTlZcW5DcGt3YUR5SEtrbWE5WXdk?=
 =?utf-8?B?L3Z4SENJVlBCV2NtZ3BnRFN2Y0s0SDNlTHNUaHo3Z09zcXBiaGM0NlI4OUlm?=
 =?utf-8?B?U2xZNGFPM3k0Q1k4RktEL2hmYjFBY0V0eHM1MjFMWmp5Y1R1QklRM0pvN1RF?=
 =?utf-8?B?OEVBeUNvU0RHaDkzQWlOK0FKWDFVU3NvWnhVZlF6bEE4V1hHV2R6aE53eEdV?=
 =?utf-8?B?RDF3YWZ0Zy9LZTdXNjljd0RXbnl5azY2UUhmay94UTdNeWZ6Z1NnMDc5TmEw?=
 =?utf-8?B?aFFBa0xQSytrYStKNFMvL1NnbDNZbmE5TTJaREVTQzZweDZQMzNVT05HOHJY?=
 =?utf-8?B?Z2ZobmVNRlBxaWEzMnc2ZzlLN1F2b3p2S2hpWHV3RCtzbTZjdGVXRW9DWThP?=
 =?utf-8?B?ZFVMdVBvS3ZZZ0RFY1YwTWZXc3dsWS9rK2JFRVlhK1dZK3B5a2I0Y3l4am9N?=
 =?utf-8?B?QnJUbjk1M0NBeXB1YTkzc0hzUnZQa2luVENiYmhGVDJiZW5qbjY1UG5OTnZE?=
 =?utf-8?B?d0JrNEtmZmhRbjU5RVIzTUFnTzAwT0JtSDFsckVEb3hpWlRiMXExUCtHWmw3?=
 =?utf-8?B?aHpHRkl3SC9pMm44ZTd3TFdDRDlvSlNmVUtDZitmSjByNmxMMThsL3JsbTFk?=
 =?utf-8?B?VnlJQ3hlYjZxS0VvcWJLa0VpaVk2MGk2OXlXdVNjMytnWmxtc0dDVDJzZFQx?=
 =?utf-8?B?UGdScWJFTzcyT2RqY05oWDhaRThLYk9KeVVxS0FKZ1NJbm1RdjE4R2FXYlh1?=
 =?utf-8?B?R3ExOWR2aGRUNkhLUnByYzg3cU5oRFVuV0lZREowRnFpcjA5ZWpLQW8zSnh5?=
 =?utf-8?B?aHhhaWhSWXNKMlM4THZBa2xhQkV0QTV0dW5YdmFMbUFXZWZjS2lWbVl5bmZR?=
 =?utf-8?B?WmtwQW02SkFSVUNoWm5IZDI5MTBYa1JRdHJTZVdKSy9ud203K2IyWDYxclhV?=
 =?utf-8?B?UUpsYUdJYlFKQWdDTDdwSksvbFFNT3ZlNFpxN2E1emgxWk1GNDJpQ3c4dVlv?=
 =?utf-8?B?M2tWUTVZZklsR0ZFa2RPZ3JpU1JpaDAraXdVeFpMSkJKVHFZdnAyOU81eTR6?=
 =?utf-8?B?K2Nmc0RqcndudVB3bFlsd0NoNHBlTUVDMGd1dGdQK2RRSVUvMlYxeUJrZnhO?=
 =?utf-8?B?OG0zdlozRVVXMzZyZXBQajdIblRkQ1NKTWhxSFBPMW1GeTNnc1l3ZmtwQ3pI?=
 =?utf-8?B?MXdzK3c1OVNjSjN4Sk95Ujl5ZllabFNsS1Y5Qmx4czMzb0U1VXRHWk9FSHRE?=
 =?utf-8?B?UVZMTFF3b2hjSGlUZTJtT1NlMkpQZjJOdlloRDV5Y3hGZlRXWHVVTThpa2RR?=
 =?utf-8?B?eXpESlNrSFNsRFRCZWRxNjBteEtNSnJwaUY1dXVjZUlRbHo0L0puV3Nyc2lp?=
 =?utf-8?B?UHJDN1VxempZOVpRNnBTeWRrdlVzRWV3ZkNXZEZTZlExWmQwSHMvYUxMWGQ1?=
 =?utf-8?Q?9YDKn2NRg5p9+y1UF7am8hqDtSl7eZ1ipQN8HGo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e87f512-a7b6-424a-1490-08d96d46afe0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:47:41.6935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KWWw5xxMbV23KDJMXofCwuV56m1L96RHF8pzvJCtGY5ZZdMuFvwLdWTKZKV37sIP1fHsW/mpsgOwFYiv/13PYjZ8HDazvq0PNLivCwHj24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1663
Received-SPF: pass client-ip=40.107.8.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

01.09.2021 15:37, Hanna Reitz wrote:
> On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
>> Give a good name to test file.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
>>   tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>   rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
>>   rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)
>>
>> diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
>> similarity index 100%
>> rename from tests/qemu-iotests/222
>> rename to tests/qemu-iotests/tests/image-fleecing
>> diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
>> similarity index 100%
>> rename from tests/qemu-iotests/222.out
>> rename to tests/qemu-iotests/tests/image-fleecing.out
> 
> Good news: Including error-report.h helped with most of the CI errors.
> 
> “Bad” news: .gitlab-ci.d/buildtest.yml has a complete ./check command line including test numbers...  Not sure if that’s a great idea, but in any case, this means that build-tcg-disabled fails because that command line includes 222.  I think the fix should be simply to replace 222 by image-fleecing.  I hope that’s alright for you?
> 

Yes, that's OK, thanks

Unpredictable thing :( A reminder to always grep for file name when rename it..

-- 
Best regards,
Vladimir

