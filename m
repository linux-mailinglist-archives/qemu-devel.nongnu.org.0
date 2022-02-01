Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DED4A6020
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:29:08 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEv5e-0005bi-UQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:29:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nErih-0007Wj-8L; Tue, 01 Feb 2022 06:53:12 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:36160 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nErid-0001mG-3a; Tue, 01 Feb 2022 06:53:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXj95RFkDQi2trlIn9aEQqUnrQl7NZ36oDwiOmr4nSnmmxMLGdIXgF3Shy4E9CDNhLuru8AOd78BI6GLAGujs72YCvndACmo/Xm7lq8EU71EdiaDdmFTW2oh6rEkaL9aEYqFJPA/kwCR9q89k/ebV/ERWkd4x30YeEgltyOfkyu5yPdOO4sjLNoNiog3RTOlC+h3GYmkp1aDAA3Bfs+PdKPBRg6TWGBSQrBFwF9FMyZi6EBZ1btn8weuGRotIfhQ4I0ukx5eYmRoXZtMRGGrkw+k4iemf/ueZ1Qu8Mid3e+TfhRgmYxN6fVfnKJWNWejHFvrc2IZiUEy7B1pUXhmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCe78AQkLi+ajfyJ4jU3RliBeD1Bd6BAivx9IO53BaM=;
 b=K33ememLACv4Thz8YOuUQRUlOiNKFqDVhixm8O83E4WRqGMK1rPc7pG9MTNsCEPCP8TziHDMy88L3WJLCa6LlHrQjr6jaPMqdoxSNUEpiGMy2begTK3WdsVmYSPBn/KrQ6/0pfEjuzCFhZRfKfH8EhCww+poWA3amdsNbTU8EMd6jucxRLhT5uEP3LvoWx08MdWbuoEPBHaUgBTvFKoDf3m8mcoEqNigpCwgYZy2+Og3JRq14nk1l5Ilo4pod/bTLJnLJa0ynh1UGSvmoTrQ7oTqpsN6Geota3r4F0RuGx9z9ASV7n9GO3XVZQawWU7JABCDEFfVhPtdHyF0xNiJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCe78AQkLi+ajfyJ4jU3RliBeD1Bd6BAivx9IO53BaM=;
 b=YHSykrJCeHEp8eD9lzq/Z85eM9zNLfgeiYo9G5EOoxpLJ++4BUQ1PgFImbx1GbHd7JoZTlHDc0fbNLG2fChd9whLGfMKecYib4JKWjjX+4vXVHT50QfqBS6wpFcj4/N2gt26+81XD5r3L3sRGhG5nnDBM7KaPGICqtYAtbCm70Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2656.eurprd08.prod.outlook.com (2603:10a6:802:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Tue, 1 Feb
 2022 11:53:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:53:02 +0000
Message-ID: <564df203-12fd-c9c5-460b-c0a5cc3d871c@virtuozzo.com>
Date: Tue, 1 Feb 2022 14:53:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC] block/nbd: Move s->ioc on AioContext change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220128155130.13326-1-hreitz@redhat.com>
 <4836201a-a469-c063-babb-4e293daee297@virtuozzo.com>
 <6b28a0b4-8244-54bc-ec1b-91a123569c7c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <6b28a0b4-8244-54bc-ec1b-91a123569c7c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d0a28c-a935-47e3-3f53-08d9e57966bb
X-MS-TrafficTypeDiagnostic: VI1PR08MB2656:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB2656220BF2508ED3949BCCECC1269@VI1PR08MB2656.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nDTc6FGLpoXx1AuOGO2CUHhN23QRuZifbdqklySTUtPhB5ixxwyGMeyRSEdxHM5qJ2dNtkqqhae4X33Wu2p/osLZ1lWRLwa5I2rY99VaKNKSCN4vGzE/ZI2jD6i5CLaBjDxprPhSzx6ZTiX+VU5zou1oQdKbK5PkOcOOVIlv5Qwo1TLx5e1lsc42/IyAceF3iCL2F7dNRIN1RjDxn5vg/LR1xguJ+8ypA8Jcu3yHfd+1SNt7zKUag+x8pywAT3g30fT1gWQHq6JfEztUjaHTn20tJchx37tgE4yjMnKBu+0rzT3kMI804QAVM2VYbfCJE585d/VxGjpZDLqwZkeWfvvRXqCI2/ijjUDI8B2UhbjoC/a9Ll/R5Nyij4+giIRQNntEB6gr47HO7cSEWw2X1XTB4bHSKtRgTlgDY1eC3OqN7vRHwK2otRFtQcSMo6wmV7iI8HeUx10yi3gQxmCMHquHjsHQ0K4qtSLS/9K/c41b3VxaOfCthJg5Dl/qFIv01ldN9QjmbuYVj/8QngiRvchwIJrfRJmfsp9l1O2Fz+UKpHOeiuJUtERR5biYzTQIAEm2y9K92+LYTVoeQzyqoM6CITjIUIG9+naw5TRkfFTlt5AuYYlM/ZYfbsbg4nuWQV9IuUAyQoV4XyJOOsxvjC6myrD05ZXnJVf9nKoHPtrS4IKa3/YawGU6KtMera1h7xNkJMFpiH0w1YlpkptIljD3Y1ipV1yO6FwD0SKevj5mgwgCzPkxjT21x0CysGKnMT0cyxhD+dXNsc4zP4wyR1W0EyWh0Txjg1H0tsftdb1GHksRHwgoEllFGqOufWjjFg1wokB3YKNXvjniOz7TZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(26005)(186003)(31696002)(5660300002)(2616005)(53546011)(6486002)(966005)(52116002)(38100700002)(2906002)(508600001)(6512007)(6506007)(83380400001)(66476007)(86362001)(66556008)(4326008)(8676002)(8936002)(31686004)(54906003)(316002)(66946007)(36756003)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJUbEdaYjF0Rnd2aDZmdnZhLzJzR0RkZG0ydWRtSlE4SHcwaXdPaEFLbWxD?=
 =?utf-8?B?OEdwdzBiR0VoUmZiZkhRWEpqSFcyMFRvZEpicUJJbEdEVFE4Mi9KOGUyVHhw?=
 =?utf-8?B?cXJ6UkRMTUhmSk9KYjdTOGpCMFpYMGNHVEtmYVZpQkpPQ0ZnZ2g2ZnJvekhN?=
 =?utf-8?B?VGdWbGRTalFZWEdyOWw0Z3ZST3VMTjhnT0RzR2V5TjlueFZ1U2V0a2N5V0t1?=
 =?utf-8?B?Vm12Q1EwWEtXWHZSc1hwQnpaOUZtSVJWT2p0YXJENG1uYTNtYlAvbS9ZVy9D?=
 =?utf-8?B?M3c2b3FHbXUzT1lQRG9hMStNbUMvYlMyTlNjM1JseWVyMVpiSFd6NkxoQkp4?=
 =?utf-8?B?UitqVGc2cDJOZ0w3RGRleGptNGRuRFVlbDZhSUFvR0M3TnBQR21LU2c0cVlx?=
 =?utf-8?B?Z3hsT0tSaE9HU3lJcmNEcDF6d2dqeFBZUytJdGd0bDJ3QVM4bGNVVzJrQVBK?=
 =?utf-8?B?WnUwNHJSbFVmSmU3bklGU2EzRUhjWGxpSmVPM1FKOVpTRHI2N2dvMEZxdnN3?=
 =?utf-8?B?c2dneXltU1lwU09HU0grZkowYnJweWhoSzF2UTd5cWtEaDRZWUlpVlhxWjlL?=
 =?utf-8?B?eE14NFlOMC9xN1JkcHlHSzIzbHMwVEcyV0Y3c3UzZ3cxU2szQlppKzJJM0pP?=
 =?utf-8?B?MEJnQTNvaEJxWnNaQml0SitEWkNrSjYwVFRlQXUrR2c4d2o3QXk0eFFaMHk5?=
 =?utf-8?B?Q1lxcTJ4aWw3RFcvR3VRV0p1SjJRZVVmMUNtaEgyaUNkOVdIdHJMNmttMmR4?=
 =?utf-8?B?Zm0wOEIxM3NROWZwd09LaGtIMm5iVmNMSURwV1pHSkJXNDUwQlhNT3FidTgr?=
 =?utf-8?B?dWljWm5wZytHQkFDeklsbDVsWjVFSTlHOWZ2TE1RbXdlN1NYS0g5VUswY0hm?=
 =?utf-8?B?aTN3WWdNazQ4NWpnSEVkOE1VekxYaWZoZ0JpMnBRS24vc0JSemRrR2NCM082?=
 =?utf-8?B?dVE0TUxmcTVZU3laVlNsUlloR1IzN3ZEU3N5VXE4ZTBzV0RoSmF0U1NVMmc2?=
 =?utf-8?B?TzQ4SXU3eTVXV1ZBb2ROeWI3SkhNMHpJczVMYXJES29YaXJSaU1sdkQ2aU54?=
 =?utf-8?B?S3lCNlpralNyMnhIVzF2eDJ1SUlDUVdkYitVNzNxNGtWQVIydzNZSnhyZzNr?=
 =?utf-8?B?MnMrQnphRHhDeFk0Z2ZkWk43M3BLNHVHTjFRKzZWd1lSazRvQjE4NzVNN2RI?=
 =?utf-8?B?bkZYQWFIOGhUcWpZTTJpaG5QdFE4WGRuTnYzOWNUVkoxTEx1R1k2RTQrVXlL?=
 =?utf-8?B?blBVblR6bWthNEpLQUdyUnVjcnhoTUZMaXVhYzVyMzR6a00zbG0wNjdIMHY0?=
 =?utf-8?B?bUNXdCtqYzFkak5sVXhpR243VDNkaGZJOEdIOGpkTnlRd3JHUU42U2RiRHc1?=
 =?utf-8?B?YVAvMDJGQlZSbVR4eUVSTlFSdnNROGVuZ0NUWGpGaC93dnRWanB4SHNyS2xG?=
 =?utf-8?B?ZnZCeGZyN0xDbzNYV0dpRFd5T1ZYM2duNnlCbVJ4N1N3K2pIZXNEOHhFZE1B?=
 =?utf-8?B?a0VUUjJ5ZmFNWlNHWUljb2l3a0FNZm5kRW5scS9iT2ZQcGRGa3BuY1NOUW1G?=
 =?utf-8?B?QjNaMWtqby85R0pWL25BcGVXb1J2bkJ4cGFzU1Q4WEZWQUdCTlRhUDNMUnBZ?=
 =?utf-8?B?Q21oMnlMZEJSMk80UDJYUGVoL21vekFjd3FVbjJ6bDhuVUU2VC8rU0tuTFJO?=
 =?utf-8?B?ekNMNHlIZTd4VERNcGVpMklXdVAwWGFWZDRldGUyTndwaXlvOXlZNFhaOEpl?=
 =?utf-8?B?dEJlMTgzb1ZLRDdiMFhteW9wcDJ3TVZOajU1WEF3SkpsOTAxbnhUSmo0UVBa?=
 =?utf-8?B?WlhtSFBpVWdnLzlWSlNia1p2bnhBUFlIR3NxQVJjR1VGRXZ0T3AzcDJOYkxI?=
 =?utf-8?B?a3o4LzFxNmJ2K2hTR0U2K3BBeGxMWEZFVVZDWWVpdGhRL21TVVN2ZGJsdnlh?=
 =?utf-8?B?OEEyeW9VdXFGM0RzaWpKUEtwOS9pWFFRVlloY3haZ29PR1pvam1tb05Gek9O?=
 =?utf-8?B?MmdiUnVtZjlZUTZoTnh6YlB1MTNWaFNVVW9LNG1tMjVaZTY5cnhTRjUyZVd2?=
 =?utf-8?B?cmNSaWdWckF2OGZrS0JyVzRvUlR5N2lkUllZU2FIc3I1YjN0YkdWZFJ0MytM?=
 =?utf-8?B?ZE05TEpZTzZqMkRoTzVpYnViTnlubGNubm52d1VLcmNGTmZWS1BUWi9Md1BC?=
 =?utf-8?B?U2oxeUg0bzZjMGZsUHNXNjdzK1RONVMwMVZBUmp2N0RYWmYyVStlaFFvSlZ1?=
 =?utf-8?B?b0tHZzFmRnVOVWg4YzVSTHVYUnZBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d0a28c-a935-47e3-3f53-08d9e57966bb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:53:02.8861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHtxM3LITaC7BsBSTTOH3S2wLOcvsCrNbSQT91MB+rSRY3OkxKzoKQJ7bim+c2R7c1l6e/6ltggNm6bXPTQb8z6BllYHfI+rVwgV47FO8zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2656
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

01.02.2022 14:40, Hanna Reitz wrote:
> On 01.02.22 12:18, Vladimir Sementsov-Ogievskiy wrote:
>> 28.01.2022 18:51, Hanna Reitz wrote:
>>> s->ioc must always be attached to the NBD node's AioContext.  If that
>>> context changes, s->ioc must be attached to the new context.
>>>
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1990835
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>> This is an RFC because I believe there are some other things in the NBD
>>> block driver that need attention on an AioContext change, too. Namely,
>>> there are two timers (reconnect_delay_timer and open_timer) that are
>>> also attached to the node's AioContext, and I'm afraid they need to be
>>> handled, too.  Probably pause them on detach, and resume them on attach,
>>> but I'm not sure, which is why I'm posting this as an RFC to get some
>>> comments from that from someone who knows this code better than me. :)
>>>
>>> (Also, in a real v1, of course I'd want to add a regression test.)
>>> ---
>>>   block/nbd.c | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/block/nbd.c b/block/nbd.c
>>> index 63dbfa807d..119a774c04 100644
>>> --- a/block/nbd.c
>>> +++ b/block/nbd.c
>>> @@ -2036,6 +2036,25 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
>>>       nbd_co_establish_connection_cancel(s->conn);
>>>   }
>>>   +static void nbd_attach_aio_context(BlockDriverState *bs,
>>> +                                   AioContext *new_context)
>>> +{
>>> +    BDRVNBDState *s = bs->opaque;
>>> +
>>> +    if (s->ioc) {
>>> +        qio_channel_attach_aio_context(s->ioc, new_context);
>>> +    }
>>> +}
>>> +
>>> +static void nbd_detach_aio_context(BlockDriverState *bs)
>>> +{
>>> +    BDRVNBDState *s = bs->opaque;
>>> +
>>> +    if (s->ioc) {
>>> +        qio_channel_detach_aio_context(s->ioc);
>>> +    }
>>> +}
>>> +
>>>   static BlockDriver bdrv_nbd = {
>>>       .format_name                = "nbd",
>>>       .protocol_name              = "nbd",
>>> @@ -2059,6 +2078,9 @@ static BlockDriver bdrv_nbd = {
>>>       .bdrv_dirname               = nbd_dirname,
>>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>>> +
>>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>>   };
>>>     static BlockDriver bdrv_nbd_tcp = {
>>> @@ -2084,6 +2106,9 @@ static BlockDriver bdrv_nbd_tcp = {
>>>       .bdrv_dirname               = nbd_dirname,
>>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>>> +
>>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>>   };
>>>     static BlockDriver bdrv_nbd_unix = {
>>> @@ -2109,6 +2134,9 @@ static BlockDriver bdrv_nbd_unix = {
>>>       .bdrv_dirname               = nbd_dirname,
>>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>>> +
>>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>>   };
>>>     static void bdrv_nbd_init(void)
>>>
>>
>>
>> Hmm. I was so happy to remove these handlers together with connection-coroutine :) . But you are right, seems I've removed too much :(.
>>
>>
>> open_timer exists only during bdrv_open() handler, so, I hope on attach/detach it should not exist.
> 
> That’s… kind of surprising.  It’s good for me here, but as far as I can see it means that all of qemu blocks until the connection succeeds, right?  That doesn’t seem quite ideal...

Right. Still the intended usage was for command-line, so we can wait for connection on Qemu start.

Using it in blockdev-add when vm is running is doubt-able. In v3 I had a patch to make blockdev-add a coroutine qmp command to solve this problem. But it raised a discussion and I decided that it's not a reason to block the whole feature.

https://patchwork.kernel.org/project/qemu-devel/patch/20210906190654.183421-3-vsementsov@virtuozzo.com/

> 
> Anyway, good for me. O:)
> 
>> reconnect_delay_timer should exist only during IO request: it's created during request if we don't have a connection. And request will not finish until timer elapsed or connection established (timer should be removed in this case too). So, again, when attaching / detaching the context we should be in a drained sections, so no in-flight requests and no reconnect_delay_timer.
> 
> Got it.  FWIW, other block drivers rely on this, too (e.g. null-aio with latency-ns set creates a timer in every I/O request and settles the request once the timer expires).
> 
>>
>> So, I think assertions that both timer pointers are NULL should be enough in attach / detach handlers.
>>
> 
> Great!  I’ll cook up v1.
> 


-- 
Best regards,
Vladimir

