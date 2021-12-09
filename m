Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BC46EDAE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:52:36 +0100 (CET)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvMeo-0003u3-NL
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvMdU-00031S-Jp; Thu, 09 Dec 2021 11:51:13 -0500
Received: from mail-eopbgr80123.outbound.protection.outlook.com
 ([40.107.8.123]:24833 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvMdR-0005hJ-Cz; Thu, 09 Dec 2021 11:51:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mz27vDGBX49Kn9WeBouPxPVukGhVs4QTorORN5kGNsTAWI0XURED2e4p8DAf8TUs72K/sF8tAuLXznUMi7N9o0tVjm7BXbMrY/YWdQVt5ChLjJxNdbasvLJuZk/cVnBE3V2XwT2xaeMoVYZC0ilzQIdrti3E3mgySyGqqQAACAq7wm4CJ6XyIAQCqUDXisJahG1s/XZ3pbF3B7L8uXLfyMGzhZ4/EPjR8DbRd7W6mZUOBx8MNcqzgc5d/zEKEDACl+BGLKyz8IPdV/RciBDWyQLgcSSZlnR+C5ZB7f/jp4voYD8Zy54a9F4J/jv/rSwmxfV2azC/eqqrRByX6sqauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0V5pjZPGTvaEJEwzw52QoZvbpfpUjFsQ8JUbA+0FPs=;
 b=i6TbuIWpTQr8p43yq8vjoLkvo6Nbkvr5ZDEV8kuuR9EAclJ4D5BqkbXC/cpXMWXniMMXpFyl6fp+W+JPBZYVuSVgbCAR3RohmAJj/Af1o77M4ViWhMjJE343Gpc0ldfod/bO6hbcFGCpF9nalKkyHNmIBzCrKqIPj/W6SvVLjJqmKm5/kzwTLnj1SOIyE1Y/T6xK/d2uFCW1eihXG8igLf9qjtN3gwaCPMcVQiri6tMk9cnXGcourSMcw9ra2pz8hBkdjcVmmakf+mEzRx4/zHW1Vw92nlXJMmAZvCxfhfteBNiHF7FQRIVv+RhRbUUFc0e31YBGE839pEqeajirmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0V5pjZPGTvaEJEwzw52QoZvbpfpUjFsQ8JUbA+0FPs=;
 b=jSjLeyWSKiZGbjf4wCxnNdWGOSwHng0a4tTF7S+B0Lmfbd1Z57Ovx5kNspR2gsaw03DllWVWt6YA/miLO4Z7S3YOKRSOcs6C24mLQiXvW/0ST/YyAVqB2EeSW+xf7iljfwSBlA/LpY2Bkz+/KwqwHe+Zk1uL0Df/htu0sEE5oXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6017.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 16:51:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 9 Dec 2021
 16:51:04 +0000
Message-ID: <1542b233-8828-3a95-a511-b19b916398be@virtuozzo.com>
Date: Thu, 9 Dec 2021 19:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211209142304.381253-1-stefanha@redhat.com>
 <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
 <YbIvtoLHeZLcBE4b@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YbIvtoLHeZLcBE4b@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::6) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS8P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 16:51:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8759af68-13b1-4b7a-4c7b-08d9bb34169b
X-MS-TrafficTypeDiagnostic: AM9PR08MB6017:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB601789F71212C0E8BA456FB3C1709@AM9PR08MB6017.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Toi5niZ2UJcEEh1MMiuviZpQbnZNOUXxlrGDooh7B6qN7YWkHw5GXSFjqRAQjICSW1480HE/ehbdUpLt9Q6WRAjkdG/L9ZtRaN54qfWTCuu6PBWLSlVg2liAsBOjm4sDsF9lt/yUSaaECtVt4ojiZaMeNd8oo/pyE594nlCgpiUbjA2FSkFyzUTT3BDEsiRcSS9q7AG4D21eRoXEf8FKNjwZfJXdDEE1lOenOF01yWG112OyL6PH3XtxwhVj/axNR1NRyVTrd61TpwXMV3+wayYGfa/pns6Y/ACLE6TPC5s1I9PuYlWhWQAs445fXFzRPgHwQRvNIS+HIUZYOT03+mOoFhZD/4cr6pLQs5qifqyTyxV1ZBbmUro6/jMqU2mkZ2dG++/nPyUW5vF2FEHfko4uJVLPn4boWdJ2/qPMJwTDP+dexh2PrjCa9ZvPbLgZ17kMSLEt//ch5hJ9PU7ehg5fk0j8r+L6Bk5UjHG4KOiILc9Wv6257+DyO+BneNMlh3QkIDBC1EC4PG9bJncMhutk2daZYOAXuZUYwfSFDT3PSAIcKfpg4Y8M9pcxJgbV25nsKQdShE/ekgkbz7mCTt9X+1mvSIZ3l6BO2fhMs+eI8GQojkTZfQUZv6vsen7sHaMSWKHcSIoRr4Er5ZmEoMn8WLAnKuCg43SsmQbDaHBxe+D0NQPacp/TNxbr8wgNYgILyucXhvuUvzNikQvskcQ/SmsPKdeUil4lVHEO/8SGF8aFbWPKug5juea9dOPHOZD7+mlm42q9ME04jkUsCAC5QsjKhLPzKs/A9GWstdErRHvRSl9UvzKQHJ0Lpc3lFuQ6nLMhanxfWgvQnMQt5Aw4yj2HOWoF/wpCDQstVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(66946007)(66476007)(316002)(6486002)(66556008)(31696002)(8676002)(86362001)(38350700002)(8936002)(2906002)(38100700002)(110136005)(36756003)(5660300002)(4326008)(52116002)(31686004)(966005)(53546011)(956004)(83380400001)(186003)(2616005)(508600001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitOWDI2UnZSQjRpMEFHRGhyYllXVTJ4RXpYMHRQN1FtbXo2aWg5LzNoTDJ6?=
 =?utf-8?B?dDlXZXYvbWR3ejA1VVVtT1Q3ZU8zK0JYc0lydm9aWHVQVmd2Rk5Xd1ZuV2xX?=
 =?utf-8?B?VTQ2MDdkM3ZYQk5oWFpmc29qOXlJOGk4RnBCRnNHVjUvUE1ZamVybjJXbUo5?=
 =?utf-8?B?OXRmQTNmU2pnSmF2cHdPeWMwak9yYjFBUmUzS0E0a3RURGNJWGh5ZTliOHkv?=
 =?utf-8?B?ckVkVFhLbEprRmdleHBDcDdpN3ljYjBlSHpFTTFsYzltcmtLQTg0cXUva1Qz?=
 =?utf-8?B?ZW5KYVZNV3VvNmV6Z1pjc0JZbThDYnBudWI3OFhCWU90WjBueXZhUTlvZFhD?=
 =?utf-8?B?cmZNUCtkVGFiRVhhRnd1S2d2TVhTVXNGYzdMZ2JIRTNNdC9zc3NmdTJXSnpU?=
 =?utf-8?B?T3hWUzcrRzZPcEdjVWhkd0M5YVVFSzBGSW9HWWU5L2xtRVc2NE9tWUtVd0dF?=
 =?utf-8?B?ekVNK2orTElGVGJNMjJwNitTbm1UeURtS2F3aHdHa0FRMVpoSVNXMWQyenlW?=
 =?utf-8?B?aHBoU2tLS1plWFZyVng3WS9VRHBzdjkxV1ZQV2VTeTdCUStyalF4ZFJSajB1?=
 =?utf-8?B?QlVRdXUzakNWOWpiQ3RsK3Q4M0xKM0c3am5TYjA0c0o3WUlzS2gvc0taQnY0?=
 =?utf-8?B?S1Q2VGxPSXN3NWwwVTNOM0h0eDloNitxdDVFUUwrRXI0K3FsM3VRN1ZiV2Zy?=
 =?utf-8?B?K0dKT1BmaUlVVDFZZzBMeU5FN0lGNndOSGNQSktxQ0hydWZJQ2Jmc2YxYkN2?=
 =?utf-8?B?WVNUekl5NUg2anNjNkFMUWtJdzFickE2RkdBZEJBcmU3K3pITzZhQ2kxcHQz?=
 =?utf-8?B?TDFsOVRPUmxmcElTdkgwZ0xYSjE0MHlQbUJmaGFTbXpJNGlSb1pxWUxEeExS?=
 =?utf-8?B?azgyZ1hvdmJHY2F0M1U4NEdGcVZUQlM4bmtEZ0JoVnRYNUQvOG5nOHBuSFB6?=
 =?utf-8?B?VTJYUWFGNmIyT0ZZYXQ1bFdybS9NdjV6dVpka3dCb1A4aVRiQjVOWDc0aVVP?=
 =?utf-8?B?Q0pRc3RwWTk4bkN1Z2JtcUdiL2x2SWgybjNQcE9kL1I3TDdTVEo1V0JEaEVC?=
 =?utf-8?B?ajhkdVJMM2VSNUMzNGxHNVdtRE12SmZtczg0MGFkOUZZS1NrdTZEc0FEVVpZ?=
 =?utf-8?B?cnpPY1duMnU4QjZCWlYxbk1SMTRsWkRrZkl2UzRRRzl1UTQ2Yk9QaUZvdG00?=
 =?utf-8?B?c0hobTl5V2hKOHJ4dmtrVldFTm5NbGRpU2JXT2VSM1lpZ3Q4S2xPZVhmd3lZ?=
 =?utf-8?B?cHl0M1lNQXRaVXRVbTFhRVl6Q0NndzU0aXRvL095UVZIekJCY04yaFpyaWxw?=
 =?utf-8?B?bzRXVUpDcmx2SVZnUUxQbnR1T1JmV2dSRjk3NGhwZjIwUWtBWHFGZ0d6SFFS?=
 =?utf-8?B?amN1Mm5KVWdlUnhmY01yQSt3K1NzbnVhUUZSZEswbFNoL1VkTktJaTNkaGQ2?=
 =?utf-8?B?eTZDZ0oyVzlQdkRPVWx5WjFpVHdnNUd0U2xCN2tka3FuV1lkYSt0SXQrempx?=
 =?utf-8?B?Y0xLczNHMVFXTFFpb0RtYlhhMkZPOWludWtmYkpkclVmSTJJUHVqRFZTT2ha?=
 =?utf-8?B?bEhFQVR6UVJsVTZseTZKN0dSY3BLWHVzVEdjeFM2bitpY0NxYzlTa3MyMk1M?=
 =?utf-8?B?cGRkek1taExIT0dZMC9rWlNZdjZHazVqdVl3Znk0dVRVZDRjd0hIOHVOcDlo?=
 =?utf-8?B?R3NTNWx1UFpINXQ3S2VmVXZDc2I2ZmVnWGFXM1h5b2xNZGtMVUtzM3daQWZi?=
 =?utf-8?B?RUxaQVA3cFUvVG1XdUE3WVJmVXhOZHlGcVJHTlZVUXNqcEF0Ym1uSTJKY2VY?=
 =?utf-8?B?Qk8xc2t2WStrc2EwRnlMajVwemt4MkNqMlI1Z0tUYXlKUDlSSElTNWp0d3Fx?=
 =?utf-8?B?bWluOU54OXZKRHViNnVDRk1KRjhaNHJvUU5ETlFJL1lpWE5vRFl6dHpLbWF4?=
 =?utf-8?B?VkxxWEF2VkZvczFORk9mcFdIUzkvYUhoV1B0TXJtbTlRdkFWZ2tQT2g3Rk44?=
 =?utf-8?B?bzVDaWRaZTYxdkpJb0l5WDhEOStVYlFzMHhiZWRBOWk1YzBla1VMWmNTQ0NK?=
 =?utf-8?B?bGpncG9IZTlxTDlRVDc5d0V4UmE4Ry9CYlRPemVuZXErQ3pjVFluZE9YOHN6?=
 =?utf-8?B?ZmxvcXRQNHA2VGdieDRMa0VoUVBUTEpEQW52THBOYmhUczVIMW9ncEdoeWsz?=
 =?utf-8?B?dllVOFRyVzhHOGRTOEJKWTY0Y3JqR3lrejlrcGpwQXc5a1ZFVGJYM2tkREM3?=
 =?utf-8?Q?//wfd32UW81W0QuuRUlsyawWZuwyEVFFgWaRFVzFvg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8759af68-13b1-4b7a-4c7b-08d9bb34169b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:51:04.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sqkI1uB67D1qzkRMcDRS6DbhPU7WuhQPpnnfAC4n1ClKJTcbsBlL6ttnXBnX+/P9SUXw13bQW/vduW6q7q4CPGDZ9LvmKTPw0F6i/zelGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6017
Received-SPF: pass client-ip=40.107.8.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

09.12.2021 19:32, Stefan Hajnoczi wrote:
> On Thu, Dec 09, 2021 at 04:45:13PM +0100, Hanna Reitz wrote:
>> On 09.12.21 15:23, Stefan Hajnoczi wrote:
>>> The BlockBackend root child can change during bdrv_drained_begin() when
>>> aio_poll() is invoked. In fact the BlockDriverState can reach refcnt 0
>>> and blk_drain() is left with a dangling BDS pointer.
>>>
>>> One example is scsi_device_purge_requests(), which calls blk_drain() to
>>> wait for in-flight requests to cancel. If the backup blockjob is active,
>>> then the BlockBackend root child is a temporary filter BDS owned by the
>>> blockjob. The blockjob can complete during bdrv_drained_begin() and the
>>> last reference to the BDS is released when the temporary filter node is
>>> removed. This results in a use-after-free when blk_drain() calls
>>> bdrv_drained_end(bs) on the dangling pointer.
>>>
>>> The general problem is that a function and its callers must not assume
>>> that bs is still valid across aio_poll(). Explicitly hold a reference to
>>> bs in blk_drain() to avoid the dangling pointer.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> I found that BDS nodes are sometimes deleted with bs->quiesce_counter >
>>> 0 (at least when running "make check"), so it is currently not possible
>>> to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
>>> bdrv_do_drained_end() because they will be unbalanced. That would have
>>> been a more general solution than only fixing blk_drain().
>>
>> Deleting nodes that have a `quiesce_counter > 0` doesn’t seem wrong to me –
>> deleting only depends on strong references, and so I’d expect that anything
>> that increases the quiesce_counter also has a strong reference to the node
>> if the former wants the latter to stay around.
>>
>> I suppose we could make it so that both the quiesce_counter and the refcnt
>> need to be 0 before a BDS is deleted (and then deletion can happen both from
>> bdrv_unref() and drained_end), but I don’t know whether that’s really
>> necessary.  I’d rather leave it to the caller to ensure they keep a strong
>> reference throughout the drain.
>>
>> The question is, how often do we have a situation like this, where we take a
>> weak reference for draining, because we assume there’s a strong reference
>> backing us up (namely the one through blk->root), but that strong reference
>> then can go away due to draining...
>>
>>> Any suggestions for a better fix?
>>
>> The fix makes sense to me.
> 
> Okay. My concern was that this is a whole class of bugs and my patch
> only fixes blk_drain(). I have audited the code some more in the
> meantime.
> 
> bdrv_insert_node() may be unsafe in the case where bs is a temporary
> filter node that is unref'd during bdrv_drained_begin():
> 
>    BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
>                                       int flags, Error **errp)
>    {
>        ERRP_GUARD();
>        int ret;
>        BlockDriverState *new_node_bs = NULL;
>        const char *drvname, *node_name;
>        BlockDriver *drv;
>    
>        drvname = qdict_get_try_str(options, "driver");
>        if (!drvname) {
>            error_setg(errp, "driver is not specified");
>            goto fail;
>        }
>    
>        drv = bdrv_find_format(drvname);
>        if (!drv) {
>            error_setg(errp, "Unknown driver: '%s'", drvname);
>            goto fail;
>        }
>    
>        node_name = qdict_get_try_str(options, "node-name");
>    
>        new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
>                                                errp);
>        options = NULL; /* bdrv_new_open_driver() eats options */
>        if (!new_node_bs) {
>            error_prepend(errp, "Could not create node: ");
>            goto fail;
>        }
>    
>        bdrv_drained_begin(bs);
>        ^^^^^^^^^^^^^^^^^^^^^^^ <--- bs can be dangling pointer
>        ret = bdrv_replace_node(bs, new_node_bs, errp);
>        bdrv_drained_end(bs);
> 
> The fix isn't as simple as blk_drain() because we don't want to insert
> the new node before the now-deleted node. I think the correct way to
> insert a node is against BdrvChild, not BlockDriverState. That way we
> can be sure the new node will be inserted into a graph that is reachable
> via BdrvChild (e.g. BlockBackend) instead of a detached BDS.
> 
> bdrv_set_aio_context_ignore() and blk_io_limits_disable() need to ref bs
> like blk_drain() in this patch.
> 
> There are some other bdrv_drained_begin() calls that I'm assuming are
> safe because they are during creation/deletion so I think we have strong
> references there or nothing else knows about our BDS yet.
> 
> Do you agree with extending this patch series to cover the functions I
> mentioned above?

I'm not sure.

First, we can't support "any graph change" during some graph changing operation.

Actually, when we do some specific graph change operation, we should forbid any other graph change operations, they should wait. Possibly, by adding strong references everywhere, we can avoid crashes. But what about the logic? If we do several graph changing operations simultaneously, the result is absolutely unpredictable, it's not what user wants.

The problem is known. For example it may lead to 030 iotest failure. Probably now it can't, after changes by Hanna.. But I think we'll not be safe, until we have a kind of global mutex for graph changing operations. For example, here is my old attempt: https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05290.html .

So, probably, until we have a good solution for this, better do only necessary small fixes like your original patch..


Second, actually bs may disappear on first yield point, which will happen earlier than bdrv_drained_being() - in bdrv_new_open_driver_opts(). So, if fix something, we'd better declare that caller of bdrv_insert_node() is responsible for bs not disappear during function call. And check callers.

-- 
Best regards,
Vladimir

