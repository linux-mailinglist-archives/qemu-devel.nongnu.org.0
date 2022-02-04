Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367574A979A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:21:07 +0100 (CET)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFviE-0006WJ-Ao
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFvE7-0002wI-6w; Fri, 04 Feb 2022 04:50:00 -0500
Received: from mail-eopbgr40138.outbound.protection.outlook.com
 ([40.107.4.138]:40226 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFvE3-0005RL-NW; Fri, 04 Feb 2022 04:49:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xsn3kSNfOhXbjrD8MCjyOu3Uty809dmXE1Hy4aJ5rhDr+u1QS2GP5046+9d2Xjl/0LTxD/vtkPQ+PFO7UPeRHATWFYwk5O8+FU/MzhE0tiuWjl28z9hsF1dqNbzgR78ZqK/T1kzdbUiFg0CX6rJ+0bJI37HDbMjl+ZsH/lGG4SFzh9vT4eII/Agj6H6hQW6RJGSQo7l7PBGLvWdd1Kp9n8KJ842UY7ALLwbRCZzYiHTdrECaUw6OlNsGrmpVui6Ggix68/ZUPMpVHiKGMbfqxJ+5zgmq5bq0eAyJfaEZWTDuqBchz9eKO9VVGZlKvrKrbSU/bsY+sgAOVhljZBVbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a46PKc8Nrhsoq+dC1fiSdCLtgeubKmXFyJ+jh43Z6E=;
 b=j9fbgHLiBhzqk80S4f8prlTp430Q/+OoSiN0yeBk45wXUILsuuBImYZwnnxhB/9ET72nkSeCtS7O3HufPGtUBlo695UPJR5+2zDA4R1EIkSNo+T8YWZy0q8ydCQPtl1BDW4sIRrkFlvh0ntUYDagrsGp4rfJVvsnY/vFGZdrGlPh7i5Wi/SgpGcWSMdAJV7QqJLsM/Ox6DNORejzuPmr1mQzj8f55386lM6BwumXHlYGlMKSa7BCnkKY9EL7rcbfPcZZHf62933PA+ib+yTwCU/qO+jWJvRR1pUomUqk7ybcmbUbAasdexmKYQKrwDVHM8yyDeRbEMKP6FauJqqHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a46PKc8Nrhsoq+dC1fiSdCLtgeubKmXFyJ+jh43Z6E=;
 b=aFZwRDA4Gc81KmPtMyN+WRRxToGRQ1nkeGeF2+dIYFo/EPucD7eqrh5JlWuNTUJmhvA2pEcn2Z1C8XryuE+0digAjC/vzA97nDaQ870uPqcLMn+8Hyh2jHgT2MwkqkhTFNfogq/IOMAwjW2swyrxfVJ8+H3SvkExOSeoK6XIVG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB7189.eurprd08.prod.outlook.com (2603:10a6:20b:404::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 09:49:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 09:49:52 +0000
Message-ID: <13a6f342-3525-7929-e8c4-d82f6887ca49@virtuozzo.com>
Date: Fri, 4 Feb 2022 12:49:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
 <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 888dd236-71d4-4546-c569-08d9e7c3b0ba
X-MS-TrafficTypeDiagnostic: AS8PR08MB7189:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB7189DF58E7EDFC188DD94287C1299@AS8PR08MB7189.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TthOpH4dJZayYIqwptvOoJNKKCvy5rI5jXZQabif5fw9pzrHeZXrqsbFw3tyDK4xTDplLyK0kzYiRGij8yDL5kl4xr1i+BR2lFJ8mBXePVXCMCaflMAfsllq5bpTTIiFG6e8tJ6tlQme5+1ATD7nvO3s82cETd+z1254ppKL0J00ToVYi8U+Sz9qoMc0UbZYN9gGw/jMGYveVPArc4ngtTMfuGMvd7MPlAyYx0gcjHCPQhjVCq50Fa3s9tfazOXEhQrbfIKhGI0RFnDu1VWcHa17TTjndQMFAx1RGvoCZ0KH1R5L44Dl5JmFkAx1UUSrUjyUHgFl2cvb8va+QjwfKelfLv3gEMC23mSA13s3G9vDsb/FsjbMhvxoNkf6TJOki3wgOfEneat4LsKwfj645ApvXVP0U3c7eI6AnjiHp7/GoDSZ1TdmRkDd839OYROG3nsp0NZWn7TIgvEfsNGzyP5f3NuvjY7IRTUM4hLiset6crIDsAFMq2+eJruz9BLjstpYPsldvjOZ4nUUOpiiQYf0sHyXlZ9DYGOvj4tny0H3a2XHxiRY0GHo4ODrUVAA8vvN2mD0/qCF7KNd04z4o749s5ccke6CZC18We/72a9y5XaKftrvRDJgsyris1TNX27hJeOh386cGnN8R8R+v+iWUU2WJY8A2NXHXj+7eCPzy5dosAh4vDWGGsB8R2JwUHABssy5BdeG4ptowzfwHfPhiBgl8LnZ+TSTYitCiTVAEHw0znqo6WwDdHCm0+REP3T8sOgt2EiNe5ZhAjM06I7jNZvsrYwzWabSFpaQztHgbhavMT6TlgHWUjYZ68py0j9d2thmS7SMl0aEPclKNlo5uDz6h1W6jhBvqvq+O/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6666004)(52116002)(38100700002)(508600001)(66476007)(66946007)(31696002)(6512007)(6506007)(66556008)(4326008)(8936002)(6486002)(53546011)(966005)(316002)(38350700002)(86362001)(8676002)(2616005)(31686004)(26005)(2906002)(186003)(36756003)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alkzT01rYlQ2R2svRHVnY2lQK1RjKzZORUl4TzVHWHd3L3d3Z0dKTXk1YWV2?=
 =?utf-8?B?eUNZc3NmM0Z6aXp2bjlJY0xDYnVZbzJIMURuNjFzZ0xkRkNvNUVHUU5Lbi85?=
 =?utf-8?B?ZjRlMXhKREU4enhxR3hCOENNUVJXcitCSzBSRndzR0NRY3h3UkFoT0tXSTB0?=
 =?utf-8?B?bTNDNlQzNWwvdUNjZDU0TW14NHpFc1RJOUJFeS9TQTVFNTBoTlFDMm5yU2c4?=
 =?utf-8?B?bTUwS0lncmdIc2g0L0ZrU3B5cmxMZGljb1NmUUJIK05pYS8wdDJVVWFLTkVI?=
 =?utf-8?B?Ni9WQ2dDSWY1Y2trTE8xZm5NbENBeU9mcGQ1TVFQMk01OWxjNVB3WmMyTzVu?=
 =?utf-8?B?TWxOMjVqSWtCMmZWOEpqRmZwaFRHRGhWWTE3OUQvWmFZSllmQWFFV0dwWk9x?=
 =?utf-8?B?VHNiWTluNXM4QUFFTUJIVTZORlBKWkdFbUt4elZtdnZaSWlMenFKeWo1MUtF?=
 =?utf-8?B?WjhEd3pGcmtRNGNVc01KaXIybFpBZXI2TGRmdnlveEhJMWxqMXgvK2g2THAr?=
 =?utf-8?B?eW5LUWIrcEQzTzhVWGNrVHlpMjZmYkpoaUhaODN4eFoybit3NnI5K1FpRjdK?=
 =?utf-8?B?N3BrTm1tM0hQbG80NHZWa3VrUjkvOVpLQitxZ0pFZUxXRU53UDJHckRHYVJL?=
 =?utf-8?B?cHh4alN0d205R2oxc0sxeXVTRit1ZmJIK0o1SGZkRVo3dTNkSkZCbDdndkdT?=
 =?utf-8?B?WDUvQTNoTDRsV2hvTk8vdXBNaGhoVUtnOUJxMUFDS0NxSmVCVERjQndweDFX?=
 =?utf-8?B?WThNaTlldkNNYVBBcjRSQ1cwbkR1OW5qSHZJMmxUK3E1VGplZFVGOGhzTXRR?=
 =?utf-8?B?RFdYbTBqZnBZOGMyNHVkMnJLNFRxaFRpNDZNWU1ZL1BSUVRoeGFrOUUwMU9l?=
 =?utf-8?B?akxoUmphMy9Mamo1WEtXcEdyT3VGQlF4aHNVYlpCSVhaTlkwMHlPY1diNmpz?=
 =?utf-8?B?YUtVcFpXY1Z0MVVyT1AyajRQS0lkMVlqU3VaUU9wOGI0S3gyVDBuWG41WDlB?=
 =?utf-8?B?cHFHNVhTWVFWMnRmb1J0VlV0TGdkWVJiZnRYZUlocEJuNlhkck5KOVRJaXFQ?=
 =?utf-8?B?OTJ6QS9nVE1wcU85OUpPMVlVdFpmUmNDR3JBTWxUaEp4djRpZ3IwVCtRU296?=
 =?utf-8?B?T0JSZ1ZEaWpxanlkYTFlTFZ0SmFBZFdvYkFta3RwVldPTHBheUpPMUxNNDJ3?=
 =?utf-8?B?elMrZlV0eHdVVWJ4Z2wyL2xFWWdoakZuSmpoS1lxZVJCckp2dFd1VXNNZW9N?=
 =?utf-8?B?ZXBLQlp0dGEwVVV0RExydHpFNnE0MHRYeW4wM1REanF0eUhpNUkxN1E0Um1S?=
 =?utf-8?B?QXU3RjZXelhYT1dVTXVQL0lOcE02enJ2bXhGWThzejkwei91MXQ4ZW9NUTRR?=
 =?utf-8?B?T1A5aEtSOHdFa0wyclhpM0gwV2kzWFZBclIvOURnV1A2QkE0WGJLSytVS2VM?=
 =?utf-8?B?NSs2V3JnZ2JBLzcrQWhPbWRVdmR4ZG82YmZOWHJDSW50T05Wdjc4K1VDS0ov?=
 =?utf-8?B?aGd4RUVQY0ZlRlJCdHhGVTV0eXFSWWZST3dQc3RRN0VkTnJFWUZSRGRhdmkw?=
 =?utf-8?B?Y0xmcUhhdm5ha3JFSFZjVmpxc0QrZW9qbHdFVklnMXlIeFNGdjUzdENoZXZ3?=
 =?utf-8?B?YWZqSEhiV3NhUG9PRUhhd1J0T2s4cWE3aTE0SG1FemdXWnp4YzJ6Z2gxRHB0?=
 =?utf-8?B?OUV0M09UTTJNU1h2RzNaV2FyVW1veUJ0bFM1STVlUHRZSWFxSC9NU3JMM2Fj?=
 =?utf-8?B?M3hWMlN1OGd0YWNkN201dnZOR096M051NEp2Rjk3bVY2K1BUbEJuS1JENk9Q?=
 =?utf-8?B?b3JyQ1V6UnZZekdtWHY2ZElWZXJnTWUwSXllSFZyUklLVzdPakpFVDkxa0F6?=
 =?utf-8?B?WW4ra1FBTVpFZFZzMUMrREpGTWF0WGlhVmZUaXRwbzZtaW5yK0M0N3NEa1pz?=
 =?utf-8?B?WXZpc2xheFlzSVJqd3FvNW44VFNTL0M1OERuRkFmNWs0dTVYai9HWmdFVm1Q?=
 =?utf-8?B?a2VrZm05VHlGaEZ2MFJ2Wk1hcCtVM0ViODNVSUdMZkJzNU5DZFRVaTFHaGpT?=
 =?utf-8?B?UndGazZvYmhESkpXWHdjOFAzazBmdHdpM3d3cWVKMDVXNXVjc2lVdGIwdWRx?=
 =?utf-8?B?Z2VQWFluajl5MVVPR3A2a3dKbzA2ZTB3SWhIb2gxWUpjSHJpWGpGMmtaa0ZV?=
 =?utf-8?B?Yjg3dW1ENElHdThTUWV2UGtnK21lUVJvMVBuNDdBcGd3eERzRlp1OEpOT0VE?=
 =?utf-8?B?K2hNa1pnakpDcVdkM3k1V1oycURBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888dd236-71d4-4546-c569-08d9e7c3b0ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:49:52.0867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjyMKbO08vx/l1qB5acuQwUD3BsYQI1LfYZrXEsC7NKrOzYHQvBz0NF1j7PDtt+Oso3jAVT+ni/HF/hHTk/JmdDzg5TIGP9fnVp1HwuNtIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7189
Received-SPF: pass client-ip=40.107.4.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

02.02.2022 18:37, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 01/02/2022 15:47, Vladimir Sementsov-Ogievskiy wrote:
>> 18.01.2022 19:27, Emanuele Giuseppe Esposito wrote:
>>> Protect bdrv_replace_child_noperm, as it modifies the
>>> graph by adding/removing elements to .children and .parents
>>> list of a bs. Use the newly introduced
>>> bdrv_subtree_drained_{begin/end}_unlocked drains to achieve
>>> that and be free from the aiocontext lock.
>>>
>>> One important criteria to keep in mind is that if the caller of
>>> bdrv_replace_child_noperm creates a transaction, we need to make sure
>>> that the
>>> whole transaction is under the same drain block. This is imperative,
>>> as having
>>> multiple drains also in the .abort() class of functions causes
>>> discrepancies
>>> in the drained counters (as nodes are put back into the original
>>> positions),
>>> making it really hard to retourn all to zero and leaving the code very
>>> buggy.
>>> See https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/
>>> for more explanations.
>>>
>>> Unfortunately we still need to have bdrv_subtree_drained_begin/end
>>> in bdrv_detach_child() releasing and then holding the AioContext
>>> lock, since it later invokes bdrv_try_set_aio_context() that is
>>> not safe yet. Once all is cleaned up, we can also remove the
>>> acquire/release locks in job_unref, artificially added because of this.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>    block.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
>>>    1 file changed, 44 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index fcc44a49a0..6196c95aae 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -3114,8 +3114,22 @@ static void bdrv_detach_child(BdrvChild **childp)
>>>        BlockDriverState *old_bs = (*childp)->bs;
>>>          assert(qemu_in_main_thread());
>>> +    if (old_bs) {
>>> +        /*
>>> +         * TODO: this is called by job_unref with lock held, because
>>> +         * afterwards it calls bdrv_try_set_aio_context.
>>> +         * Once all of this is fixed, take care of removing
>>> +         * the aiocontext lock and make this function _unlocked.
>>> +         */
>>> +        bdrv_subtree_drained_begin(old_bs);
>>> +    }
>>> +
>>>        bdrv_replace_child_noperm(childp, NULL, true);
>>>    +    if (old_bs) {
>>> +        bdrv_subtree_drained_end(old_bs);
>>> +    }
>>> +
>>>        if (old_bs) {
>>>            /*
>>>             * Update permissions for old node. We're just taking a
>>> parent away, so
>>> @@ -3154,6 +3168,7 @@ BdrvChild
>>> *bdrv_root_attach_child(BlockDriverState *child_bs,
>>>        Transaction *tran = tran_new();
>>>          assert(qemu_in_main_thread());
>>> +    bdrv_subtree_drained_begin_unlocked(child_bs);
>>>          ret = bdrv_attach_child_common(child_bs, child_name, child_class,
>>>                                       child_role, perm, shared_perm,
>>> opaque,
>>> @@ -3168,6 +3183,7 @@ out:
>>>        tran_finalize(tran, ret);
>>>        /* child is unset on failure by bdrv_attach_child_common_abort() */
>>>        assert((ret < 0) == !child);
>>> +    bdrv_subtree_drained_end_unlocked(child_bs);
>>>          bdrv_unref(child_bs);
>>>        return child;
>>> @@ -3197,6 +3213,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState
>>> *parent_bs,
>>>          assert(qemu_in_main_thread());
>>>    +    bdrv_subtree_drained_begin_unlocked(parent_bs);
>>> +    bdrv_subtree_drained_begin_unlocked(child_bs);
>>> +
>>>        ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name,
>>> child_class,
>>>                                       child_role, &child, tran, errp);
>>>        if (ret < 0) {
>>> @@ -3211,6 +3230,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState
>>> *parent_bs,
>>>    out:
>>>        tran_finalize(tran, ret);
>>>        /* child is unset on failure by bdrv_attach_child_common_abort() */
>>> +    bdrv_subtree_drained_end_unlocked(child_bs);
>>> +    bdrv_subtree_drained_end_unlocked(parent_bs);
>>> +
>>>        assert((ret < 0) == !child);
>>>          bdrv_unref(child_bs);
>>> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs,
>>> BlockDriverState *backing_hd,
>>>          assert(qemu_in_main_thread());
>>>    +    bdrv_subtree_drained_begin_unlocked(bs);
>>> +    if (backing_hd) {
>>> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
>>> +    }
>>> +
>>>        ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>>>        if (ret < 0) {
>>>            goto out;
>>> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs,
>>> BlockDriverState *backing_hd,
>>>        ret = bdrv_refresh_perms(bs, errp);
>>>    out:
>>>        tran_finalize(tran, ret);
>>> +    if (backing_hd) {
>>> +        bdrv_subtree_drained_end_unlocked(backing_hd);
>>> +    }
>>> +    bdrv_subtree_drained_end_unlocked(bs);
>>>          return ret;
>>>    }
>>> @@ -5266,7 +5297,8 @@ static int
>>> bdrv_replace_node_common(BlockDriverState *from,
>>>          assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>>>        assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
>>> -    bdrv_drained_begin(from);
>>> +    bdrv_subtree_drained_begin_unlocked(from);
>>> +    bdrv_subtree_drained_begin_unlocked(to);
>>>          /*
>>>         * Do the replacement without permission update.
>>> @@ -5298,7 +5330,8 @@ static int
>>> bdrv_replace_node_common(BlockDriverState *from,
>>>    out:
>>>        tran_finalize(tran, ret);
>>>    -    bdrv_drained_end(from);
>>> +    bdrv_subtree_drained_end_unlocked(to);
>>> +    bdrv_subtree_drained_end_unlocked(from);
>>>        bdrv_unref(from);
>>>          return ret;
>>> @@ -5345,6 +5378,9 @@ int bdrv_append(BlockDriverState *bs_new,
>>> BlockDriverState *bs_top,
>>>          assert(!bs_new->backing);
>>>    +    bdrv_subtree_drained_begin_unlocked(bs_new);
>>> +    bdrv_subtree_drained_begin_unlocked(bs_top);
>>> +
>>>        ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>>>                                       &child_of_bds,
>>> bdrv_backing_role(bs_new),
>>>                                       &bs_new->backing, tran, errp);
>>> @@ -5360,6 +5396,8 @@ int bdrv_append(BlockDriverState *bs_new,
>>> BlockDriverState *bs_top,
>>>        ret = bdrv_refresh_perms(bs_new, errp);
>>>    out:
>>>        tran_finalize(tran, ret);
>>> +    bdrv_subtree_drained_end_unlocked(bs_top);
>>> +    bdrv_subtree_drained_end_unlocked(bs_new);
>>>          bdrv_refresh_limits(bs_top, NULL, NULL);
>>>    @@ -5379,8 +5417,8 @@ int bdrv_replace_child_bs(BdrvChild *child,
>>> BlockDriverState *new_bs,
>>>        assert(qemu_in_main_thread());
>>>          bdrv_ref(old_bs);
>>> -    bdrv_drained_begin(old_bs);
>>> -    bdrv_drained_begin(new_bs);
>>> +    bdrv_subtree_drained_begin_unlocked(old_bs);
>>> +    bdrv_subtree_drained_begin_unlocked(new_bs);
>>>          bdrv_replace_child_tran(&child, new_bs, tran, true);
>>>        /* @new_bs must have been non-NULL, so @child must not have been
>>> freed */
>>> @@ -5394,8 +5432,8 @@ int bdrv_replace_child_bs(BdrvChild *child,
>>> BlockDriverState *new_bs,
>>>          tran_finalize(tran, ret);
>>>    -    bdrv_drained_end(old_bs);
>>> -    bdrv_drained_end(new_bs);
>>> +    bdrv_subtree_drained_end_unlocked(new_bs);
>>> +    bdrv_subtree_drained_end_unlocked(old_bs);
>>>        bdrv_unref(old_bs);
>>>          return ret;
>>>
> 
>  From the other thread:
>> So you mean that backing_hd is modified as its parent is changed, do I understand correctly?
> 
> Yes
> 
>>
>> As we started to discuss in a thread started with my "[PATCH] block:
>> bdrv_set_backing_hd(): use drained section", I think draining the whole
>> subtree when we modify some parent-child relation is too much. In-flight
>> requests in subtree don't touch these relations, so why to wait/stop
>> them? Imagine two disks A and B with same backing file C. If we want to
>> detach A from C, what is the reason to drain in-fligth read request of B
>> in C?
> 
> If I am not mistaken, bdrv_set_backing_hd adds a new node (yes removes
> the old backing_hd, but let's not think about this for a moment).
> So we have disk B with backing file C, and new disk A that wants to have
> backing file C.
> 
> I think I understand what you mean, so in theory the operation would be
> - create new child
> - add child to A->children list
> - add child to C->parents list
> 
> So in theory we need to
> * drain A (without subtree), because it can't happen that child nodes of
>    A have in-flight requests that look at A status (children list), right?
>    In other words, if A has another node X, can a request in X inspect
>    A->children

It should not happen. In my understanding, IO request never access parents of the node.

> * drain C, as parents can inspect C status (like B). Same assumption
>    here, C->children[x]->bs cannot have requests inspecting C->parents
>    list?

No, I think we should not drain C. IO requests don't inspect parents list. And if some _other_ operations do inspect it, drain will not help, as drain is only about IO requests.

> 
>> Modifying children/parents lists should be protected somehow. Currently
>> it's protected by aio-context lock.. If we drop it, we probably need
>> some new mutex for it. Also, graph modification should be protected from
>> each other, so that one graph modifiction is not started until another
>> is in-flight, probably we need some global mutex for graph modification.
>> But that's all not about drains.
> 
> The idea was to use BQL + drain, to obtain the same effect of aiocontext
> lock. BQL should prevent concurrent graph modifications, drain
> concurrent I/O reading the state while being modificated.
> 

Concurrent I/O should not touch bs->parents list, so we don't need to drain C.

>>
>> Drains are about in-flight requests. And when we switch a child of node
>> X, we should do it in drained section for X, as in-flight requests in X
>> can touch its children. But another in-flight requests in subtree are
>> safe and should not be awaited.
>>
>>
> 


-- 
Best regards,
Vladimir

