Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05145355910
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:22:10 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lToSu-0000iW-EG
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lToR7-0007ju-8E; Tue, 06 Apr 2021 12:20:17 -0400
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:6088 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lToQy-00007Y-Em; Tue, 06 Apr 2021 12:20:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq+Isr2W+5SiYE4Tc33j1r9T2ZqhREeEnYJIB/rY/zUmYDUg12kQTSaNBr/i/5slx9yVKF3y4hvA3AzT3j302LmBY6Koy7fq6pWb/eF6pMQZzZ0Kdhq+hjemsy5NkwGQSGzHtiiHmhx2596qafwQCt5HwQBVK8vnVYW9QJxJvjh7NHTsYJW6SoHCPtJ1JjRdQmuVf2cuvnqe7N818OoevWVBcIBqW1lRmqLplk04fARbn66rEmMICPPlCReyrhc8GMphLdumJsVqVc2VDhmpMDQQUSpw5n95ASrHlZXAZjIfs48IeDJ552yUDAIjFSxP6ipG+kgy6ynD2n2bX+btIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Snooo+nzEY/HKCq8k5x9oj2Psi5tKZ3awDxMqyRP0qo=;
 b=G7NU+J2VyVwIhxEs4cEVXarLc1UTyJnQH9LdSlwhEcqGowFNAdMdBJ4Yy80WkqthimdQxjuFGKu7s++p40mtknBKTKxx5TRzv+cgGORtFLgIw5kyklRHWVEd6LMdvaOp2/h3SL3YHdYL+mybMcC/cQtxn0au2nDXTUFDOvBA/tUL1kyLu6Elcsfwm+YuteL4H0Hw6esmbr0ZXAPyCezq2Bgb6/j1abDiuQ+uiDCdUhzzZSMvB5klm8yG8lLWSQhEBHVqYDCNklpTvvnQVr+h373ckyabb3lOkPUUYpuQtf46AUhnlXbtzXU1N8H8FqyfsVI+BHSujp0VVL09pVHvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Snooo+nzEY/HKCq8k5x9oj2Psi5tKZ3awDxMqyRP0qo=;
 b=qCFyvwUnq2MJrOpMLvdDlm4kiZ6amis8vmzny6vWHvtgdtj+2usDrqK2LPkC8AARitrIv507/o+IPk2kEZzaXrNBxymCpj+LTZWfM6q/sOZWkjK8mJsdQP6CmNSu4MfEt9rQ2ypWZH3EJKNh9C0L2US6p0uUYGORnoWCZy+HUhM=
Authentication-Results: yandex-team.ru; dkim=none (message not signed)
 header.d=none;yandex-team.ru; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 16:20:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 16:20:04 +0000
Subject: Re: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
References: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <861cfad0-8eef-2932-1c7f-821fa0d0d629@virtuozzo.com>
Date: Tue, 6 Apr 2021 19:20:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Tue, 6 Apr 2021 16:20:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8de278f-ae34-45d1-dd01-08d8f917d60b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4913C012F8B392E4E4B103B4C1769@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvWtkYZx9DbwTRrhoYGL0E9n5Byph3ThcVeC+1emKQD7N+ZOGXrpmWIRBkYnH4uGU/rE6Ok+Wuvl1WESa7YhBUDHH0ns0KVoP7o9XobJqI06+AbAR+5j3SHgXblfbHSnDGyBK+89m3vLTzVss6HthN+ovnfbpJI+PdozLXzV1IX7Abq9qQgmKvb0VWi08pNgpH057H9A7FxstfHeAzi4F/eoO19WEeX1x86g3FrbNhIQ6R9w6pvlINffLNNyWLXrjqdRz6/UJmnWPiL3tregltYJhyblJMtrAVz0Y8Ma70Y1EFMo+FwhrFL3DwgBdXXKttnbrEvUWthrAZqvNZIpn35KtwEJIE8iPbVFEu/gs9dGPR+nzakNo6++/YywP8GMqUoXavmRCp1r1+gur7v5IDQ+pyBv2fv9FYjQRD8G5I0ehZVwUHoPCBX1uXJGSeIKtMWKRzoNMSQk7pY645t/lZtbLIibuGMXLndA3mMqcfm7jC5aEfbi1HXsZh9NeLVCqyOTEyQKULFTrSarYA0oTiiwYU/k9ePtCPy6wHZKoj8fHlrZKwIy4vHCyhAJUtXbSgyM6nSc73+9JEdbUsFmaV/fsSnfDBW8lAhszklR1KgJ+tyGK2ifskMnbCx9JdU02ajklV4Tm3csSASnjGwcCxKqZuoDGtwtkudufJvIhMZ6+Yt5D7iIRaYonWy3kF3FPk3L3oZ731fFFUXhDfkxk+Nq/KEJi5zzM2dDSluI/oYYCjMCvA44HUeZcljTMy21
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(396003)(366004)(16576012)(6486002)(316002)(5660300002)(8676002)(4326008)(38100700001)(86362001)(16526019)(31696002)(83380400001)(66946007)(66556008)(36756003)(52116002)(186003)(478600001)(26005)(6916009)(2616005)(31686004)(956004)(2906002)(8936002)(66476007)(38350700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2kxZU9QUlhmU1dkcUxGMHRJYjlFbVJKUHpOYUIxUlB0VTBmaHdRaVIvaE1r?=
 =?utf-8?B?NlhqeXd0Vm8zcEVtaXhyaDh6Rm1ZeFhXZ3FMeHlCcVd4SFdNQjg2V2dEalZo?=
 =?utf-8?B?NDYydFRiaEZtZnBLdUhMMkY0WjUyR1MyWHdIUllQWWhsOUZDR25FcWpuMG04?=
 =?utf-8?B?VW1kRFlhanR5OTlnT0J6eHU1WjZZdFllZUZuVFdtVFZ6VXZ2NG9WRkVLQWVK?=
 =?utf-8?B?RmJlaEhsSmZPbkgrQWh4V0NjUmJxZVpaendqd1Jzb2c1QTFzRzZzeFVkM0p3?=
 =?utf-8?B?VDlLbnRlUytGZHRIcGw3ZHI2MkEwNlpPRlVBMS84MHdza25keHY0M3h2UGtM?=
 =?utf-8?B?S3J1RHQwZHM2QUU1VnJvMi9MdHYyaVpRQ0xXYXgvTXRkbnVFdHpQTGZMTm1F?=
 =?utf-8?B?Vy9jV1BLQ0pSZlZVNEpBMytPczJ6b25uOERra09ILzRqTzNwMEFaRllycnhw?=
 =?utf-8?B?WnFSUkFpNWljKzQ1NjJmZWtUSEFvOHRxeFFZV2xqQnhGYVR3UkJnemNQcE1w?=
 =?utf-8?B?Skt4YWVIVS82YjR4emVMeERTZjh2aHNkNGZ4azdhTTRZc3FXSlFtQStsOEhy?=
 =?utf-8?B?RndMTTZDdUlDZndhNDVzYVE4MXhTTVg4MjZsaGNsOW03b2syeFRxTGgyV0h5?=
 =?utf-8?B?ZGt2NUNRZDZiVitOZFhobkN2M3p5TlNiQkJqbkJablBZOWw4VVdtVnRsS2F2?=
 =?utf-8?B?ZXdMVHd4enAyQ2ZhajQ5Nllua1BGb2lIdmV3OUFWSFJDVzV3dUxRNnVWVHpG?=
 =?utf-8?B?SGgweHk2TjJlbHNudi9ZcVZXZStGTG1pRTI4cldBRi9aaHRJdHlYMXlFNHg4?=
 =?utf-8?B?V0Z4bDJwMjBoYU9HYWEyZjhvT05OMUR5UGxEV2lDVGxsS0ttYlFKMXRrM0Mr?=
 =?utf-8?B?M3N3aGJyRjVabEg2UzZXbGNYeU9QcGVlYWMwYTJQZmdoMDd3bUpwTlVPLzBS?=
 =?utf-8?B?VGpRU3VtS2pqZ3Y3N3ZDeWtJYitQZ2tadnpDMHNwZlFwSGMrZEEwTGhDdWpK?=
 =?utf-8?B?ZmxZNlhzMWNJNnM2aFZWU1FXcEdQdUJ6ZGM4M2N3TEFUYnRhMk9wK2lqREl0?=
 =?utf-8?B?QVRSVW9OTjdOanMySktqamlrMEtkSlVpK0Z2VXB4cDl4bjZBN1BSY2l6dm0y?=
 =?utf-8?B?eXJ0V2RlNUFLUXdMbHRrbm9uanl6TDA3WFlxMGRHNDI5Q3AwRzBObk41dnp4?=
 =?utf-8?B?Z0oyVURFOXp3Wm5hWkxYR3NxVzBXNDBpd2FlMW5teU5uVHJlL0hQdXltWHBP?=
 =?utf-8?B?YTZFcmM3eDI0V3FPNzBRTFZvNGw4RzNoVXZqVmVoQ2p6V2p3aHZkRDAzbTZR?=
 =?utf-8?B?K3hTYURlQVVudXNVdnNNWnJFY25leURkQlpBSUtLaHBVSWthZVE0SGIwQXBQ?=
 =?utf-8?B?c0QwWkVQMXh6eTF0QmQyWE82MU9ZcVJpVHRKV1RkT0IwaFp6d0RLcUc5R1FD?=
 =?utf-8?B?V3Y4MUx2emdJT2dYZFNsM01QNlc3R3hiVVU5MDdVQzQ3K1RBV3lwbGt5MWJk?=
 =?utf-8?B?cUMzWXJsQlZVV2lMWlhIU0U5c0NGMmYrbENLTmlWT3ozQktJV2svUnB6WDc5?=
 =?utf-8?B?MkMzRnJVeFpaNzBZUStaYm5HdWdiMk0zQU5IMVNQVjBtZGVrVVpqT3NyanAx?=
 =?utf-8?B?KzZ1NDQveXJpUlBDSzJUcDVNTnJaSkVObklpUHhSWnNMMzJJRGJtKzZyc2lz?=
 =?utf-8?B?QTdFc2paakdac2NDZ0Y1M01vYTl0TGdIcTNiWkVMZXVMVjRmcUNKV1FlYXph?=
 =?utf-8?Q?YWMKRj/dLGeGCR83Mx3zfw2X/uCJi4JNgWD11Fs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8de278f-ae34-45d1-dd01-08d8f917d60b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 16:20:04.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f++Nqq0EfVLK0n7u4Bgn9EaPDG6FUQYU6Bm8rJySy/hwVQ/bn1t2z4o5ja4mtGy49RYAsORd8tpyMI1OnNlxyuPiFiOV6pzi+qNUV41Y2hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.6.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

06.04.2021 18:51, Vladimir Sementsov-Ogievskiy wrote:
> If on nbd_close() we detach the thread (in
> nbd_co_establish_connection_cancel() thr->state becomes
> CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
> s->connect_thread (which is set to NULL), as running thread may free it
> at any time.
> 
> Still nbd_co_establish_connection() does exactly this: it saves
> s->connect_thread to local variable (just for better code style) and
> use it even after yield point, when thread may be already detached.
> 
> Fix that. Also check thr to be non-NULL on
> nbd_co_establish_connection() start for safety.
> 
> After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
> impossible in the second switch in nbd_co_establish_connection().
> Still, don't add extra abort() just before the release. If it somehow
> possible to reach this "case:" it won't hurt. Anyway, good refactoring
> of all this reconnect mess will come soon.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
> 
> Hi all! I faced a crash, just running 277 iotest in a loop. I can't
> reproduce it on master, it reproduces only on my branch with nbd
> reconnect refactorings.
> 
> Still, it seems very possible that it may crash under some conditions.
> So I propose this patch for 6.0. It's written so that it's obvious that
> it will not hurt:
> 
>   pre-patch, on first hunk we'll just crash if thr is NULL,
>   on second hunk it's safe to return -1, and using thr when
>   s->connect_thread is already zeroed is obviously wrong.

Ha, occasionally I reinvented what Roman already does in "[PATCH 1/7] block/nbd: avoid touching freed connect_thread".

My additional first hunk actually is not needed, as nbd_co_establish_connection is called after if (!nbd_clisent_connecting(s)) { return; }, so we should not be here after  nbd_co_establish_connection_cancel(bs, true); which is called with s->state set to NBD_CLIENT_QUIT.

So, it would be more honest to take Roman's patch "[PATCH 1/7] block/nbd: avoid touching freed connect_thread" :)

Eric, could you take a look? If there no more pending block patches, I can try to send pull-request myself

-- 
Best regards,
Vladimir

