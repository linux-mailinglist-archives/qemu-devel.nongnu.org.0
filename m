Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18054CBA31
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:29:48 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPhmN-0005j8-CB
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:29:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPhiD-00048J-9K; Thu, 03 Mar 2022 04:25:29 -0500
Received: from [2a01:111:f400:fe0e::70a] (port=47492
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPhiA-0006AG-9o; Thu, 03 Mar 2022 04:25:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbioimL3haVlbUv9f+eIcAwjZru6qrYjFyBMWHpZ43eA7VCscI6RQ2wIiELSq2plBqKF1mFaNTB0t/2zN1380ZLgRdzmC392uY31mza8LmSsFgXQxhAYhJLjvC7Wg+9aCMZ3M68LC75jBVerNisLJlI67DmgfRyr0SEhOWM/Nryxi6EDSbDGX+MUcFqftQbFa1mBXFM0zX/QeM7kpR9r9WU3Qek60jH9NzdXP5h/U7yC9M/5py5Nxxl2ISaYSCd/tcGTQ2Z8kSH81uacHoO0yCu5q67mh81U8vWB55tKWi/TsMj1R3y9leoyR16DrBpssvC122J7br+l/jaW+dwLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSXzfVoZjv/sUn97zAPtrKSneEUOtq65XfKsD59wQ4A=;
 b=OSQjwTehqr0CYWnRkjfp6VRzCqjSi1QGy19om7AU+7NM/Ecn8Ao8glKKP//YRr6KDNWYldZj43i62nL6jwghgAisJ0WyNFlZyXZkGTrY+g05XttnIfS5FnNmk86MZG2OOmfoMuM2bW6bnYkOsXtjM8ZWn9yIQvlY2T6la7uCSnjXZo1R2wFkIMmo2e5FFidMUdFX4P6yy4nfrhJCsS3aeHXCZnwmiy1JYagtB6WsudVdsyu7YQKGqbusGoohhaT4alyXs8u/YD4fQfS1kly/mXUTcrpZgaxdVShSUkNY3IG9pfNO3LZM/oY/ORP1QkrPUWc8A/OyODAcf6FiW0C0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSXzfVoZjv/sUn97zAPtrKSneEUOtq65XfKsD59wQ4A=;
 b=qU7ggu1srCKICuYZrIG0jpbI8mE2StnKXvD6TSEOZjoyF7XZGMhVKkDFw1pBKz7Xc53deDFbdbqPloyNNB4CTfFo8kBxPaR1ycAuBC0XU3ZmnD/KiEDi9ihhUMVcV1woNgKWRZks3EHMjqPuE6o01fGKOKQ10RRf5Z6njVEz5Rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3402.eurprd08.prod.outlook.com (2603:10a6:10:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 09:25:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 09:25:19 +0000
Message-ID: <e9b5e0ec-a2fc-5f7b-6773-062979cee2a8@virtuozzo.com>
Date: Thu, 3 Mar 2022 12:25:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/nbd.c: Fixed IO request coroutine not being wakeup
 when kill NBD server.
Content-Language: en-US
To: Rao Lei <lei.rao@intel.com>, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, chen.zhang@intel.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220303022145.328112-1-lei.rao@intel.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220303022145.328112-1-lei.rao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a52f24db-3611-4148-6a46-08d9fcf7bbc2
X-MS-TrafficTypeDiagnostic: DB7PR08MB3402:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3402FE5078A6BA8080822E55C1049@DB7PR08MB3402.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8QM8EajwN33SWg+8EQLa4/l9tN2u+2MI/0d8pf7w4kttqfiFtl+N5yyIh6HGXS2l9G0z7A1nb9rRXDt9vTCNZDcyeL8cxiczmr7jbVSE9gEM8CuZbyUkrD3dc0yAs6yHiPa1YihhRfxZSWnVUMJDXtpD29nyVPHzRvNRAP5AhwOk7V8LMeDAlDuXLmxOqFdGb6P7jFsWud5LqGapVO/OltKBARb3q2LvlcXM5njfBfu3qAMsp6Wm1dLWTZXLvbp3CP8Sqox3gMBe3k6szOeRQGuVhpf9DNYDTA7U1PU+E8jhOJIiYdpKYTRTONQ8PXQSCNXQgIqGEldvQfeIBsxtPXX0kWmoit7MdD+9L5WfDryYb8CWGGvscLx580UbspBxM1JWsRERuhZiizQ6ytcHk5q5TSGwGmU9tXOGcLEVkhO5x9/LSA/Lq7rovZZ4ioe2KM+M+pp4P2W8+8NF+cJf/AJGABfajTEN9q6w//ZgZCnIYT5Onz2TfekwspZlaEOk9+zBPFawqH4XxbG5rPIbbjxwiwAowMOMuQKJA0lYAMTaE4RxeRYIz1IIe8SsFRU6W5cTTfpiTn5ZImFzC01Thb9/fuq1Yad+Sio5Aw9jj/qKp/KaUFmVBlafscI1GVbG85UnOsP7Vlwt5pWQOqyNMyGoIBbXrEZqAe9U17AZYck2T0hO3Yf0nW6PQEtha1sE/QiBoN0Kj4LtWGKzbGvq1yyc5yzBXjly3cESuz6VLcsEggqJW+jkSZy8clvLyCRgONzZC2dxG8Vnub4hB4a/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(38100700002)(6512007)(316002)(26005)(186003)(6666004)(66556008)(6506007)(38350700002)(66946007)(2906002)(5660300002)(66476007)(52116002)(4326008)(8676002)(86362001)(31686004)(8936002)(508600001)(31696002)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkdJaDVrUURsODFKQ1B4ZmFueGllVFFGdUU4bzNMNGpmcFl0cW14bXU0c05x?=
 =?utf-8?B?bVlrOXV4MkJ5blhWNitZcFdhaHdlM05Da2ZNSVNGejdXamhobHlOM3k0NGZk?=
 =?utf-8?B?ZTNCams0b1Vydmd1UkVsYWxCaUlBMG0rUlFsRWdXRGRleEJqK051SlNSZFlk?=
 =?utf-8?B?SGNhM2paa0JVVStSSlBZYnI1MFJKZVBSZDJsKy94STdndnBxeE1OS3VWTTNY?=
 =?utf-8?B?S1NGOXFIaklMeVoxQlMvZC9iZ3hQemxqMzExd1NVazc2U1ZrVXNwWGI0L3FQ?=
 =?utf-8?B?S1Q5cE9CWEtwMVVyZzZERFYxdlc5WEFzQ0Y5ZHdUd1dpMDNUY1ZiblhTcmt1?=
 =?utf-8?B?citnLzNCUXFTemh6N3dvSUNOam5GeWw0K25oMlpOcWJSNmRJN3o2L0xGUlBW?=
 =?utf-8?B?ZGM2Z2dWUEtMRXNibzlIQmk3Q0UwOTNJMXAwZ1FvNmpMYzJVUEY0TjY3K0U2?=
 =?utf-8?B?UkZBcTF3N1R6alRHSmJUYXNMbTdwMHZLUzl5cTNaVXF0QWZaRWY5TkJSbEQ0?=
 =?utf-8?B?M3FDdFRBS1YycldrTEJuME1VUnZGVXNHMVZDR2NtVUQyb2ZKc2N4OGhrQjha?=
 =?utf-8?B?bE1INTFWc2pkQytuN1QzZzNPMEdpNzdUVXVUWTNnOVA4ZjNxS2t5dm1GSjhZ?=
 =?utf-8?B?WXVCMXdFMkphbHdGcko1QmlhMkRDejNWSXdFQ01uZWs4TEZGUVQzRjNFLzdx?=
 =?utf-8?B?T0lrSTl2SkdKM1MyUzQwTEVrNjZPWlNVRDA2RThmbHFJVDU1ZjFPOW1kU0Fh?=
 =?utf-8?B?TTZWQUVyUTNONGQ3ZDZkMjgrYUZNaWduTXJtQVIyS3RiRWdEek9OSlZlWWUz?=
 =?utf-8?B?K3liUVZwMXMxOEs2eWZQMTlCUzUxTE5EVkxwREE5OU0xZ0c5dW1vdUl2SXI0?=
 =?utf-8?B?eUNnbVFqQkM4RFN1YU5aTmVyRjYxc0pUQzZCTTV1ZGlpY2FUd2NmYlhQVG4z?=
 =?utf-8?B?VkFLQ1FCcWs0YkVEUEdvRk1xcThMYkw4NHlHQWtaRjNOZUZJNWtLUTFGNmFI?=
 =?utf-8?B?b25IaC9aYjMvK2hpWTgrMmdVOUQ0aVRWYldRRXVSVDVFR1NVcC9VUFBBVVFj?=
 =?utf-8?B?Q1FqKzlGRFRMT0VPYnBlRTlRVnZTb2JaSURaY1RISlF2UXBLMkVEa3ZtVzBV?=
 =?utf-8?B?cnIwcS9yT09leHJ1d2w2OXVkZFAwVGtFcWc1VG1KS3dEUHdrUDZQQXN3Z1pG?=
 =?utf-8?B?ZUdpeWl0TDJBcSswZGVGYlVPb2l2b0xNcFZTbVlYODE3Y1ZVQWUwYlMxdFlo?=
 =?utf-8?B?cWJPWFlUdGV5aTcvTUppTnVEaldiRml6Yno4ajNjaUtlZmREMXhOTy9BbVRR?=
 =?utf-8?B?bTZzandocGMwUWdiNE1FRFBmS1N3RjNMZlVQZE5qbmlwRmhFQ3ZxYTBiWm1Y?=
 =?utf-8?B?NDBCY1FYVVNsUGJFM3hQY3Z5b0w5cEJpK092bVZJOG11bm1vNnVxbjNRZHNs?=
 =?utf-8?B?b29qQ2lvdkdBSmU3MTJXdVdVcUtVZjFQNXQ5cUpBajdLQkJnblc0cXF1bVhK?=
 =?utf-8?B?V3ZpSUZJZ3NuUG5QYXJwUzk5Q3N4aSt1WmFjbXMxK29LM0tFSFM1RWFxTXUz?=
 =?utf-8?B?VE4wU2dSVjk5N3hzZmEyaExUeVB5L3lSUWM0Y2dtOUoyL1ZvTHRCdjV3U0c5?=
 =?utf-8?B?aEZFZ2Rheno2ZnVQMWNBRlRFaE1VRHN5NllBNGh5eGN0YUxNU3hVNjY4eGJH?=
 =?utf-8?B?OThYNEVuaER3MHpkN1E2bmF0MVFLSklxaVpHYkVrVk44Rmh3RUxTRTIyTEtG?=
 =?utf-8?B?cjhVZzVqcVN3Z3c0dE9OTE5iYlByZDZ6Qkg1WGZMSHpNcFY4QzVWcStkT2sy?=
 =?utf-8?B?cFlBd3JhY0x5QlFhUEk5b1JrMWpjcFNHUWRpbUNiUW9hTjFXT1hJY3VKWjRS?=
 =?utf-8?B?bDNSNXFvOWg5NjRqOUxPRHgrQTJ4UzBOdFlteThKNGZrbXNnTEJ2b3VvYytH?=
 =?utf-8?B?YmlMOC8vVExiTzJkZjliNDhjUFFRVk4yL0UvOUs5TW14a1BZTFMyQUdyUDhG?=
 =?utf-8?B?MHM0NWFUMG9icVlUWFRtWVZBWTEzNTRsenN5amtwN05zYlFGNEZ2ZGpMTEpN?=
 =?utf-8?B?cmI1OHlyOTdoaWlLY3dzUWJxcnVXMUFOZkt4eE5VWGM2allzWngzQ2dacGJt?=
 =?utf-8?B?SjBUekFkSzNWNko3UC9paDJPeFBNbnJ4RmhyVGJCcnZoOGhmSmpJRklXNUN2?=
 =?utf-8?B?THltejFWYkJZMENnV1dGMjBtTmM2cEFDS3pSVkhpakN6OVBtWC9ZQUZKbVlX?=
 =?utf-8?B?TmhxajFyd1FHcUlqcEpYUzNlU2pRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52f24db-3611-4148-6a46-08d9fcf7bbc2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 09:25:19.0118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyO5PrNriPaL8SLn+Eh9YpRfJeznWSrAnADR+pu5vT5B8unOtN1/yP4gpeWLOwY6FPb2VT4brfE+0fr98O/uBMz7kTyDQG+1LCbbgB1NTwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3402
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::70a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::70a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

03.03.2022 05:21, Rao Lei wrote:
> During the stress test, the IO request coroutine has a probability that it
> can't be awakened when the NBD server is killed.
> 
> The GDB statck is as follows:
> (gdb) bt
> 0  0x00007f2ff990cbf6 in __ppoll (fds=0x55575de85000, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> 1  0x000055575c302e7c in qemu_poll_ns (fds=0x55575de85000, nfds=1, timeout=599999603140) at ../util/qemu-timer.c:348
> 2  0x000055575c2d3c34 in fdmon_poll_wait (ctx=0x55575dc480f0, ready_list=0x7ffd9dd1dae0, timeout=599999603140) at ../util/fdmon-poll.c:80
> 3  0x000055575c2d350d in aio_poll (ctx=0x55575dc480f0, blocking=true) at ../util/aio-posix.c:655
> 4  0x000055575c16eabd in bdrv_do_drained_begin (bs=0x55575dee7fe0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at ../block/io.c:474
> 5  0x000055575c16eba6 in bdrv_drained_begin (bs=0x55575dee7fe0) at ../block/io.c:480
> 6  0x000055575c1aff33 in quorum_del_child (bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block/quorum.c:1130
> 7  0x000055575c14239b in bdrv_del_child (parent_bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block.c:7705
> 8  0x000055575c12da28 in qmp_x_blockdev_change
>      (parent=0x55575df404c0 "colo-disk0", has_child=true, child=0x55575de867f0 "children.1", has_node=false, node=0x0, errp=0x7ffd9dd1dd08)
>      at ../blockdev.c:3676
> 9  0x000055575c258435 in qmp_marshal_x_blockdev_change (args=0x7f2fec008190, ret=0x7f2ff7b0bd98, errp=0x7f2ff7b0bd90) at qapi/qapi-commands-block-core.c:1675
> 10 0x000055575c2c6201 in do_qmp_dispatch_bh (opaque=0x7f2ff7b0be30) at ../qapi/qmp-dispatch.c:129
> 11 0x000055575c2ebb1c in aio_bh_call (bh=0x55575dc429c0) at ../util/async.c:141
> 12 0x000055575c2ebc2a in aio_bh_poll (ctx=0x55575dc480f0) at ../util/async.c:169
> 13 0x000055575c2d2d96 in aio_dispatch (ctx=0x55575dc480f0) at ../util/aio-posix.c:415
> 14 0x000055575c2ec07f in aio_ctx_dispatch (source=0x55575dc480f0, callback=0x0, user_data=0x0) at ../util/async.c:311
> 15 0x00007f2ff9e7cfbd in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
> 16 0x000055575c2fd581 in glib_pollfds_poll () at ../util/main-loop.c:232
> 17 0x000055575c2fd5ff in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
> 18 0x000055575c2fd710 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 19 0x000055575bfa7588 in qemu_main_loop () at ../softmmu/runstate.c:726
> 20 0x000055575bbee57a in main (argc=60, argv=0x7ffd9dd1e0e8, envp=0x7ffd9dd1e2d0) at ../softmmu/main.c:50
> 
> (gdb) qemu coroutine 0x55575e16aac0
> 0  0x000055575c2ee7dc in qemu_coroutine_switch (from_=0x55575e16aac0, to_=0x7f2ff830fba0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
> 1  0x000055575c2fe2a9 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:195
> 2  0x000055575c2fe93c in qemu_co_queue_wait_impl (queue=0x55575dc46170, lock=0x7f2b32ad9850) at ../util/qemu-coroutine-lock.c:56
> 3  0x000055575c17ddfb in nbd_co_send_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, qiov=0x55575dfc15d8) at ../block/nbd.c:478
> 4  0x000055575c17f931 in nbd_co_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, write_qiov=0x55575dfc15d8) at ../block/nbd.c:1182
> 5  0x000055575c17fe14 in nbd_client_co_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/nbd.c:1284
> 6  0x000055575c170d25 in bdrv_driver_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:1264
> 7  0x000055575c1733b4 in bdrv_aligned_pwritev
>      (child=0x55575dff6890, req=0x7f2b32ad9ad0, offset=403487858688, bytes=4538368, align=1, qiov=0x55575dfc15d8, qiov_offset=0, flags=0) at ../block/io.c:2126
> 8  0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:2314
> 9  0x000055575c17391b in bdrv_co_pwritev (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
> 10 0x000055575c1ee506 in replication_co_writev (bs=0x55575e9824f0, sector_num=788062224, remaining_sectors=8864, qiov=0x55575dfc15d8, flags=0)
>      at ../block/replication.c:270
> 11 0x000055575c170eed in bdrv_driver_pwritev (bs=0x55575e9824f0, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:1297
> 12 0x000055575c1733b4 in bdrv_aligned_pwritev
>      (child=0x55575dcea690, req=0x7f2b32ad9e00, offset=403487858688, bytes=4538368, align=512, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:2126
> 13 0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:2314
> 14 0x000055575c17391b in bdrv_co_pwritev (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
> 15 0x000055575c1aeffa in write_quorum_entry (opaque=0x7f2fddaf8c50) at ../block/quorum.c:699
> 16 0x000055575c2ee4db in coroutine_trampoline (i0=1578543808, i1=21847) at ../util/coroutine-ucontext.c:173
> 17 0x00007f2ff9855660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
> 
> When we do failover in COLO mode, QEMU will hang while it is waiting for the in flight IO.
>  From the call trace, we can see the IO request coroutine which is waiting for send_mutex

Hmm, in call-trace above, it's not waiting for send_mutex, but sitting in yield() inside qemu_co_queue_wait()..

> has yield in nbd_co_send_request(). When we kill nbd server, it will never be wake up.
> So, it is necessary to wake up the coroutine in nbd_channel_error().
> 
> Signed-off-by: Rao Lei <lei.rao@intel.com>
> ---
>   block/nbd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 5853d85d60..cf9dda537c 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -167,6 +167,7 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
>           s->state = NBD_CLIENT_QUIT;
>       }
>   
> +    qemu_co_queue_restart_all(&s->free_sema);
>       nbd_recv_coroutines_wake(s, true);
>   }
>   

Hmm. I think, I understand the problem.

Actually, when request finishes, it calls qemu_co_queue_next(&s->free_sema). But I assume the problem is that we have a lot of requests in free_sema queue. So, when error occured, current MAX_NBD_REQUESTS finishes with error and they wake up at most MAX_NBD_REQUESTS from the queue.. But what if we still have a lot more requests in free_sema queue? Seems right, nobody will wake them.

I think better is simply move one line:

diff --git a/block/nbd.c b/block/nbd.c
index 5853d85d60..33adfddc41 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -529,8 +529,8 @@ err:
          if (i != -1) {
              s->requests[i].coroutine = NULL;
              s->in_flight--;
-            qemu_co_queue_next(&s->free_sema);
          }
+        qemu_co_queue_next(&s->free_sema);
      }
      qemu_co_mutex_unlock(&s->send_mutex);
      return rc;



Could you check, does it help you?

This way, every coroutine, that goes out from
     while (s->in_flight == MAX_NBD_REQUESTS ||
            (!nbd_client_connected(s) && s->in_flight > 0))
     {
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }

will wake next coroutine, and thus we will not hang.


In other words, I think, that the real problem is that in

case

     if (!nbd_client_connected(s)) {
         rc = -EIO;
         goto err;
     }

of nbd_co_send_request(), we don't wake next coroutine in free_sema. So, let's fix it.

-- 
Best regards,
Vladimir

