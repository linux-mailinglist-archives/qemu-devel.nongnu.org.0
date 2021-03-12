Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71684338D56
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:44:21 +0100 (CET)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKh9Q-0003jg-77
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKh88-0003Aa-0h; Fri, 12 Mar 2021 07:43:00 -0500
Received: from mail-eopbgr20098.outbound.protection.outlook.com
 ([40.107.2.98]:11346 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKh7w-0002tP-14; Fri, 12 Mar 2021 07:42:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGOc6W8kRk5EUDHPLa9lYDmYd0Fw/5L6xUabfDkf885ePMLnqqd3y6fQERiEunTEw+GQED+kDRc/01MdeDQU5ZJPoucqrulbTpihr37tGHmWTlj8hCpUFoH4OckQzSgPnrVBm2r978rSyOvyK/CaBZbhSpPyrVGUheOXxNCF6XQEx3zor0Nf6j/IwXUAGaqQPum0yeCycDhh/lMGQtuG9mE/6tmgysnvUA8z/9Ss6nSIyWxRAueZXTyOx3sGYubuvyLm3qEw0VWIwQ65qLwO/HEHi6w1c6HHQXFbu7JLr1SBKdU7LwLFjqusykvcVOTEJNiqVuoHEYGB5d29nSyg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQSEuQNg4yPvE7cPft4o3f8+Yh89Fwb+uc9AUbI9L1k=;
 b=A2CjLhavYX3lhg/msPr4n0tzi/vlewRl9vMPR90hHU6srG0zTIx8H2ytGYNnBOdNwwChIR46VYAotT31ZKKZewKWDxfGHaNLUkL7KaljskpQw+OorwrFCreyTd8RURqzW3p3Q01GttHFHHNe3kf8X9ZvDMnbFperhrK2GjvkUOWYyLVhB3ZDh5BqtMDgXZykZbIMpYMpjZDUoyXG4MbgNRK+c9vZ4dBpOKisCLXcV6fJJRcWsmFdBCEH1NbeOd7jsT8OhhYuseFbAo+70q+uwN3ZHhnsQYU3EmJDutiV9mL13gmAy93PtmF5sU1hKB+ixO7hL+OEOVyTVAaI3zSwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQSEuQNg4yPvE7cPft4o3f8+Yh89Fwb+uc9AUbI9L1k=;
 b=YxgPDXSjzNSelORx+xNwX/Uhru0aiOQfGYBRd64/SBLKUIPc7sBPmesoriMgf5J8MF3HNzA/pZppqp/BLYWzb62WAOvlum+mrhr1xlq04QJuDU/69z1a1ewvLQE81a6e/kXO1fyBzGC9S/ccfzijtcjZX1fBi/J+NUcJGYpsgLw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 12:42:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 12:42:44 +0000
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
 <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
 <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
Message-ID: <da4151c7-4f4b-b81f-f3aa-06a6bb2ccc91@virtuozzo.com>
Date: Fri, 12 Mar 2021 15:42:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR07CA0131.eurprd07.prod.outlook.com
 (2603:10a6:207:8::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR07CA0131.eurprd07.prod.outlook.com (2603:10a6:207:8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Fri, 12 Mar 2021 12:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9d1157e-34a6-4b71-c621-08d8e5545538
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40884D994336DAA7BE36A5C4C16F9@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Zf2N7t6LP+sdUL2pm9oyJQfjntSkRTUp/Lb7neHOiQGrD/KRZ4ZZ7APgVds2RdAX6pb5C7BDnEFawo/fZfbXyIVKBw9+deYM/rEH+FST4kM0bLuS/UraWc9Kb/itxv0If8r1LUlNLCH2TT/bPhooF7bP8PnFpSHH+rYloFZ7k28/WlkSU68tKvrsRk8BHUq+yLZvdkNfe/T7lE9Y/vusep3XdsoTzZnVpTF9IGjQ5zmpO/pXvUtqwPbgdyUpbbY+uhQkmio8kMggdJNc4FS8GKYDdEDCeXdYc6k/jgAuHrNdKMuTEvTTVoJmDB04WNDs+BYEMx9UjgTQuAECH3ral/628XGez8MTT5JmReHT6ntXOfu+0SuuLC4Z9DkFqEkOByyK78dirO/Nxy752Jy6YWCv847TtnWexlYItdOeIHDpL6q1KPWZI2bsaGY06yMzVC9Iv9bSxSsnwXbDFUJYrDJUOTz8aBE/C0+6CkUgajrEDr+gXWURvpUW742L/0g/S1k2zso0h5zwiaV7FA2xphVMihI5nhcjp/lWet3PHr9VTyVvRIKtw5FmJUDsOD9mK73WgEnVYINvsaK3Y4W7Y3i+WVXOTI1XxHdfEqP5jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(8676002)(86362001)(956004)(53546011)(2616005)(19627235002)(5660300002)(186003)(2906002)(478600001)(52116002)(26005)(31696002)(16526019)(66556008)(66476007)(66946007)(316002)(8936002)(4326008)(36756003)(6486002)(31686004)(83380400001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2dpNlpWNHo3SmJmWXNTcDNQejQ1ZkptQjBuQko4dE5UQWg0Y0lYUm1LRWVS?=
 =?utf-8?B?bWNYYXY5UUdxNG52WGs2QVRIdEhTdnRXbXFLdFdQaGJRSW9vZWlYMXNKVlZr?=
 =?utf-8?B?N2czYWxvMVdDb1JQRmZlUlptR3dIR1JiZXNaTmpmYzQ1T2ZBRytOVS8xbEVi?=
 =?utf-8?B?TlhSckhYWlozTmlPMkF6ZjJkbkZYNmlGTVJkMFBTdmIzR1VHQm1sd0Y1MWVN?=
 =?utf-8?B?K3c5dzFMcnZ5aXpLenI5bzZUNkxMRlZhTWwrYmtDYUdGWjluckNhK1djN2hN?=
 =?utf-8?B?bWlpdm9rUThwU1I1cEE0bUlGRDhoQXpjQW1IREZLN0k0bExBWitCVmdFOWUv?=
 =?utf-8?B?NHFDeFU0TVhmYlhmbE96SUpHQndNS24ybE91MWdqZDl0TkRMREJaamp6RGVo?=
 =?utf-8?B?MS9JMGVrZllMa0RRdzdSNUtHNzhHWXErdWYzVjc2eHQ5TWxyQVVDS0FvUEY0?=
 =?utf-8?B?VUxuRnEyaXdKTTRuSGdOWVZPTEl5SGFsdWtrRWZPUU1kbG9ORllFS2xQWVlF?=
 =?utf-8?B?bU5NUjFkcENIQTBwQzBhNFJjODZzSEFRS3NSbUR6bUlDSUllWVVMSnAybVRu?=
 =?utf-8?B?Q2ZvRStxRlRTc2hjNzUyWGl4Q2orZ2N5OHk1bis0N2ZkNVVoKzNnNTBKY2hr?=
 =?utf-8?B?Y2lOcXJKZmpzbERuWENFSFVOMDRJMVlDMUJ1RGRjaWo2Rzh2VVA0eSthWGs3?=
 =?utf-8?B?TFIvT3g3RHhNMlNoMlFIN1paaHhtVW1LTStvSHh2RkxSN3orb25ncTZZRXBt?=
 =?utf-8?B?ZEpBcCtXTmNhRjlFckVSRHZEQWJQeG1rNnJuNkhDZ3dRSUY4Z3YzRXpCcTdx?=
 =?utf-8?B?SHQ0bWpRakJnTE8yc3F3RFlYcm5vTkxIY1BRbWpqNWkzanVqWHhQM2lWdUdW?=
 =?utf-8?B?SzlZcWlvQ2RUUEJRT1FrZnk1OXJYZWl3bStnMFU1MWpaTVFUOEpJZllac3hM?=
 =?utf-8?B?NHg5ZjFoSHdBYjNnKzBwdnl3cUdXMGxEOU9mc1IyMmtHMzZLVGFycUNhYVZu?=
 =?utf-8?B?b09mQmxyZmw2NzN0dkdHaDRIK0l2QXlrMnBiOGFMa1E5Rjd3eVpRQ2ZJZFVy?=
 =?utf-8?B?MUgvaE1vVDQyRVQzWHdnSTRrbW9hNGdVWHN2M0o1eVNjR3RvMjlMTkVEV3Jh?=
 =?utf-8?B?N3A1dVlRSTBjQmY4RTEzTEQvL1BxMDUxVlR2VFlqenpxdk92WGJwNExzWTRX?=
 =?utf-8?B?MklSTVhSL2FFKzlrSU5KbjNDOUlIeDFIcHVaUUtudzlFaXN1SEV1RDY3RkNH?=
 =?utf-8?B?WVArbXdjNVJ4b3pLcFh4NXlxZGVKZFNFdkJNRE04QnB6NEZPYkFhWWhjMUF6?=
 =?utf-8?B?OExWYWkyM3RYTlhlVEM5ZE9jUUxlbzlvMzJyRHV3bHN1dzh5T2grZ1kyZEJR?=
 =?utf-8?B?KzBjNThMaGVpSE55NXJwN2tFSDRPbHN4SVVvOU9kN29hZnU1UnVOY2lndUJS?=
 =?utf-8?B?VmV5ckRCYkZ1VU1XU1J1bHJPK3d5bkMyRm9Bcy96d1JFLzlMKzJqdmZvbnAz?=
 =?utf-8?B?MmticDZ2cGw5R3pwdUU5WCtPOXpDM1VhcUo1d0d2TVlKS2xESDZlcFhRZE40?=
 =?utf-8?B?YzkvYlZnckhDNWdzeVdPYmozZ00wNlJzVVRCc0ZFTVlFZGdCU1BCZVBpK3hi?=
 =?utf-8?B?REFSVDdwcEpGNVY3bVNhRXNIU2hpL3ZtbmJVbXB3MnpCZWVIL2ViK1FiUS9C?=
 =?utf-8?B?eGkxRU1JZWl4Z3g5WXRiS1RUeHM4OFlsUGlaOGd3S2kxY2kzZHk3VExLMHJj?=
 =?utf-8?Q?pecV3WLfSeqRNZHImX+GfibnW8JaaE51dd/pczM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d1157e-34a6-4b71-c621-08d8e5545538
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 12:42:44.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNseh/oe042glNO8RRvJqetNoT2C0Tgpdac34V+59NsdL+dKe1RkwPV6TcxRRJmgWOntq2jBDraBX12Jhl52hX2kc+95x0RT2IK/nRE345Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.2.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

12.03.2021 15:32, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 14:17, Max Reitz wrote:
>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>> 11.03.2021 22:58, Max Reitz wrote:
>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>> becomes 0) and reused during data write. In this case data write may
> 
> [..]
> 
>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>>           if (refcount == 0) {
>>>>>               void *table;
>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>>> +
>>>>> +            if (infl) {
>>>>> +                infl->refcount_zero = true;
>>>>> +                infl->type = type;
>>>>> +                continue;
>>>>> +            }
>>>>
>>>> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?
>>>
>>> Don't follow.
>>>
>>> We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().
>>
>> But the code under “if (refcount == 0)” doesn’t free anything, does it?  All I can see is code to remove metadata structures from the metadata caches (if the discarded cluster was an L2 table or a refblock), and finally the discard on the underlying file.  I don’t see how that protocol-level discard has anything to do with our problem, though.
> 
> Hmm. Still, if we do this discard, and then our in-flight write, we'll have data instead of a hole. Not a big deal, but seems better to postpone discard.
> 
> On the other hand, clearing caches is OK, as its related only to qcow2-refcount, not to inflight-write-cnt
> 
>>
>> As far as I understand, the freeing happens immediately above the “if (refcount == 0)” block by s->set_refcount() setting the refcount to 0. (including updating s->free_cluster_index if the refcount is 0).
> 
> Hmm.. And that (setting s->free_cluster_index) what I should actually prevent until total reference count becomes zero.
> 
> And about s->set_refcount(): it only update a refcount itself, and don't free anything.
> 
> 


Looking now at this place:


         if (refcount == 0 && cluster_index < s->free_cluster_index) {
             s->free_cluster_index = cluster_index;
         }
         s->set_refcount(refcount_block, block_index, refcount);
                                                                                  
         if (refcount == 0) {
             void *table;
             Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
                                                                                  
             if (infl) {
                 infl->refcount_zero = true;
                 infl->type = type;
                 continue;
             }
                                                                                  
             table = qcow2_cache_is_table_offset(s->refcount_block_cache,
                                                 offset);
             if (table != NULL) {
                 qcow2_cache_put(s->refcount_block_cache, &refcount_block);
                 old_table_index = -1;
                 qcow2_cache_discard(s->refcount_block_cache, table);
             }
                                                                                  
             table = qcow2_cache_is_table_offset(s->l2_table_cache, offset);
             if (table != NULL) {
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
                                                                                  
             if (s->compressed_cache) {
                 seqcache_discard_cluster(s->compressed_cache, cluster_offset);
             }
                                                                                  
             if (s->discard_passthrough[type]) {
                 update_refcount_discard(bs, cluster_offset, s->cluster_size);
             }
         }


Hmm. Is it OK that we use "offset" to discard qcow2 metadata caches? offset is the start of the whole loop, and is not updated on iterations. Isn't it more correct to use cluster_offset here? Or we are sure that refcount and l2 metadata is always discarded by exactly one cluster? Than we are OK, but still worth an assertion that offset == cluster_offset.

-- 
Best regards,
Vladimir

