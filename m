Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF12BB25B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:22:08 +0100 (CET)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgB2t-0005JE-Ah
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kgB0Z-0004P0-3y; Fri, 20 Nov 2020 13:19:43 -0500
Received: from mail-eopbgr50091.outbound.protection.outlook.com
 ([40.107.5.91]:26591 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kgB0V-00042U-TF; Fri, 20 Nov 2020 13:19:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0vV5L43nQRVQYano72XCmToAeV9uo5xsM2ZNTAa/I+5C3InxaJYnHPGKQwljXwzL707rouIk0nIQQlqS2wtq2WamuE1cy6Qnvp2QpNfWhf1svmR1XbfjOoWucKDeN/nnFAsND+ccKfBCttFRZjbwArlpDnVTM2OVzDj55DKGauL3p5xp5Err6gpmf0ZZeFWDlZ7boE7FNvuvdcXs0fraF1R+Ty4W6/y9hg+BYWx+hzoiWkcTdxrNKJ5qX9P14E7ome/gbkDzt+9EvD/uI3Znan+LD9BeC/GR1pOcnVcHK0GOMJyATL7bZQTwMphCMK0EQ+eBfmSSJROUkKxzFs3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuQqKaiOr4GTBiEdMHdL7GmTJvWiFQabL9XJ2YWMI78=;
 b=kTOMYmhr7VGomTxM8dq8qhXjo/iRLvqXWNi3uLXtpNql+UoNxxPTo3r5ZwlE2GpHbqwgHpx1jAv2FOFiAq9OzfMe3gTjvzy1mnWzMw5RoqGO+0efg2ll4pBScj8Rj/afY3xi4bDu9CyScymKvYPj/Pf4lugyi9aH+9FrT0/sHTYaTUwNs5ILToPfNKEJyXGcqTTEfNRcd6k/B1t7OpXlb9GYyNBacQXqvv2nR7O4ECNms2NUm4s2PaC7t1JPJ+J4+CsqYudy87EwaVkDEn/juDzQV17BM2Kf8DVZ1E5HbKQhcVRk8vBmEeebvxR2P7KydxNdkW/MZwY/mAF3Bwmyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuQqKaiOr4GTBiEdMHdL7GmTJvWiFQabL9XJ2YWMI78=;
 b=o5cJJJ1bNUnbaH/qw37F6EEQnDkRT5i0NhJTn+Y3BrbBBEE1Vy8gB4mI39e/b6m/p54uokjngBv2g2XerDwcITQY5SU7clnyxrmh0EOINK6ySDPwPpLwyeMR6zkiOmfk13ZUqHQgFVDI24cJ5nSmpF2fMnWUq094AowemM1Bhmk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5030.eurprd08.prod.outlook.com (2603:10a6:20b:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 18:19:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 18:19:36 +0000
Subject: Re: [PATCH RFC 0/5] Fix accidental crash in iotest 30
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, jsnow@redhat.com,
 mreitz@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com, den@openvz.org,
 eblake@redhat.com
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
 <20201120163627.GD5599@merkur.fritz.box>
 <e72b2129-0e65-5f8f-a90b-baf03757b1c9@virtuozzo.com>
 <20201120172251.GE5599@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6d6b17b9-80d6-aa90-6e1b-f8519ae181cc@virtuozzo.com>
Date: Fri, 20 Nov 2020 21:19:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201120172251.GE5599@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: AM3PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:207:5::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.108) by
 AM3PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:207:5::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 18:19:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5913e908-89e7-4e22-eece-08d88d80d60f
X-MS-TrafficTypeDiagnostic: AM6PR08MB5030:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5030F3F351593D3BC6D2F659C1FF0@AM6PR08MB5030.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VD61ZPfiXQEH/DyGRkWXnMy7/Bd57c6Zc9R69y0OQlbaoDQKljckM4XHHIHx82dilFaS8OihJsTYs4CXmK4BUjav2XG/4EzNV8Vsp2tg+gtnk1EHXFNi8OoNHVrGujkZFJm3GsZgyHcJm+DjCE0OWYcavcGYWsr/KwYo1puafq+66nsuHi6NkdKpxEaIEEBGkKSTrgwFpJrUujzLhX+DdPwXSvROMYGIHoqrvmRufE5Nlj156a/D0t3rkft4Nw+kdYoHlKgATJ7++Ii+NyIc1alWdIonZVXSZfDPrSu4Jb+evdIxqNj3B9PasuDSa7t3FJY4bD5AH7pAIkcv3W3M+YpUcX5NILvNHZSTFipsMMp48n049BWiGXmCTCKXOuzx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(52116002)(6916009)(83380400001)(31686004)(66476007)(66556008)(66946007)(5660300002)(31696002)(2906002)(8676002)(8936002)(36756003)(956004)(478600001)(2616005)(7416002)(316002)(16576012)(4326008)(186003)(16526019)(86362001)(6486002)(26005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: GhI3FYDfyWTJSEPEdBW2lmHzt3xB6X7Wp/EW1pMQ0o9i56UjpDGi9ejRKGozz/08Cg6GOMJJUXJrzyA8uFqHCixI6zp9wbauEX0RX9HsD7ie9xSlPxEkYiZnhJ3fRNqBZ6UzrSXiGhneMhN1hHO7uKxeB7TO+14mvIIG6jXXtvSr6i00aonrpJb2WvxaKUDGgYlhmrdhA76K47K2ml5rg3MdXBTwVRnetwQbZCz+xbPssJSMxmNB5FzbJegx/rSqAcvj/CXDPOAx39cZM4vGvutFxobyTwRdAt6RERTPiQwXXkkh8v8005Wbc29YVmJqoVnPED77go49asQVYUdZmbRuJRqxSGuosUB0pzun5FhZQUwPdX7T7WPgH4Tb3QD2h6kMg5SM3kHd2Sq3R/8MLYLg8gBH8U3/NM/FyMSzEc04DRrrBykLaPXSU/neDTjstHq0orppHYx5FRuKoIF0xKBT5pE3nQk8gqTxvCjxVqcYalIAv/+dfiaz6L0Uuv+h2vkSzenX9y6vquyCWMs2DQZ2bzC4xCmg2xpOIga4+UvTwZjdzpkYTM1KhAG3snWqagyhOHNje+Iy4p3mjTfI0lqijj8cl72+MwcuG4XgRS5xSvBCwrYa2vOY3dRJqMlancOMYCpr323nXUyujdSO/Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5913e908-89e7-4e22-eece-08d88d80d60f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 18:19:36.0390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoZOj81WCJQQcQfoeRU1/QGcKdC6kbdcEVCQQHg8Z8VhVgP2yp83OCzZO0u93UwGTAL3vcVLrYT3jtbuYUuz+4vPrM+OaQlWfxI6S0TVYTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5030
Received-SPF: pass client-ip=40.107.5.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

20.11.2020 20:22, Kevin Wolf wrote:
> Am 20.11.2020 um 17:43 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 20.11.2020 19:36, Kevin Wolf wrote:
>>> Am 20.11.2020 um 17:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Hi all!
>>>>
>>>> As Peter recently noted, iotest 30 accidentally fails.
>>>>
>>>> I found that Qemu crashes due to interleaving of graph-update
>>>> operations of parallel mirror and stream block-jobs.
>>>
>>> I haven't found the time yet to properly look into this or your other
>>> thread where you had a similar question, but there is one thing I'm
>>> wondering: Why can the nested job even make progress and run its
>>> completion handler?
>>>
>>> When we modify the graph, we should have drained the subtree in
>>> question, so in theory while one job finishes and modifies the graph,
>>> there should be no way for the other job to make progress and get
>>> interleaved - it shouldn't be able to start I/O requests and much less
>>> to run its completion handler and modify the graph.
>>>
>>> Are we missing drained sections somewhere or do they fail to achieve
>>> what I think they should achieve?
>>>
>>
>> It all looks like both jobs are reached their finish simultaneously.
>> So, all progress is done in both jobs. And they go concurrently to
>> completion procedures which interleaves. So, there no more io through
>> blk, which is restricted by drained sections.
> 
> They can't be truly simultaneous because they run in the same thread.
> During job completion, this is the main thread.

No, they not truly simultaneous, but completions may interleave through nested aio_poll loops.

> 
> However as soon as job_is_completed() returns true, it seems we're not
> pausing the job any more when one of its nodes gets drained.
> 
> Possibly also relevant: The job->busy = false in job_exit(). The comment
> there says it's a lie, but we might deadlock otherwise.
> 
> This problem will probably affect other callers, too, which drain a
> subtree and then resonably expect that nobody will modify the graph
> until they end the drained section. So I think the problem that we need
> to address is that jobs run their completion handlers even though they
> are supposed to be paused by a drain.

Hmm. I always thought about drained section as about thing that stops IO requests, not other operations.. And we do graph modifications in drained section to avoid in-flight IO requests during graph modification.

> 
> I'm not saying that your graph modification locks are a bad idea, but
> they are probably not a complete solution.
> 

Hmm. What do you mean? It's of course not complete, as I didn't protect every graph modification procedure.. But if we do protect all such things and do graph modifications always under this mutex, it should work I think.

-- 
Best regards,
Vladimir

