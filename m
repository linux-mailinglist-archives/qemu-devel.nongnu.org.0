Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86F5F5522
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 15:14:53 +0200 (CEST)
Received: from localhost ([::1]:33640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og4Ee-0001bj-OZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 09:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og47D-0004Kw-H9; Wed, 05 Oct 2022 09:07:11 -0400
Received: from mail-dbaeur03on2115.outbound.protection.outlook.com
 ([40.107.104.115]:13537 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og478-000733-Qp; Wed, 05 Oct 2022 09:07:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVmBAWFAbO+gsFVHVGHXE/F94eAqIsnC2lVlLFdBmw4kpfcnpoLusJznEXdIEmZDdP1DB32WymR9+hVPSRHAE9i4hlKa7Y2cwxrLtLzkwuwfvseCq22mDK2gHcEf8hIR3KVGWuClQfXxyxbNSi+up7uy4lYiQMf14nZmhU+viTgix0cKJdCx+rico6kTA0uK+EsQK7zT7NN1Naxsv0XZ5CVcHZooqoNV31V9b9J3V8ok7dzJIltbQeprydh4y86HUyQEUdD/HYsOOwHAUDrP4PpNW4FLPO2gVuGE10IATvdMrqutdOKj1mCek1EvfLyWTpNrBY0ONLaK3fGv87CNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WWqREjn6HzU4pcgsQx7yZyQX7B+44EiPY/ysgaG4XQ=;
 b=ICPhICnP2mX4TUf9wLNSGaaBd6I8uBF6awz05Y8rGDaeO1Vhy6lravqz0WyY09T3nhMoEpD1RU3Dcb7L5+DRlTsamEa5PZlOlZL8JKKXTTknSWRe8ZVU70bPOEmImSWm6lUJ/yS9N8GTthPSVsbhcmtPq5IjHtmDg9w7cyvOwP1OExmXUeZthDgAeWBfE1oMEmsj0aaG/DThm133BiJzdABU4HhWusEeQmmcnapWWyCsAX1IVEgsUKqq4BhmEd8+aUdKrXcuGS5ClSQJ3FOkTfC1HnAwrhlkcHJE6zjQxXspbWuMMfNHXFQvpfj3juCoU6z7yuTNUNt58DBEqpp8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WWqREjn6HzU4pcgsQx7yZyQX7B+44EiPY/ysgaG4XQ=;
 b=F2rElx0Bn7r8tC3wJuL+O6iUWjbwhR9ZJ5R3zxLE+14c+iKyVkYJTYWjzPEsrOG4U3kw2DC3jG5Z8GJts/CylC2twW2rFgUNFOFbRjTN3SaALEiQudYR+cHo3OTjBno7JX4OkqQ/SB+CjT092zBTyziTtCmwQ17V//RNu/z4CH3+5hLlea7IsshZqXvu8RXWbqeuhk9DOAmAhnqozaZIOTSUoW2nr2KnZByEfyuryHTdpDykOVsVFdrNFW5aoAAqd9n3axGIzVFAw8JD+v1PVgnOAybX7WjRXMqf23AnlswY2L9W6L2DEkbMhX3cnjMir0zLsLPiE2qJAOTQ2vvoig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by AS8PR08MB6422.eurprd08.prod.outlook.com (2603:10a6:20b:33b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 13:07:01 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 13:07:01 +0000
Message-ID: <1cd0bb13-f701-d050-edeb-ed056d3202ef@virtuozzo.com>
Date: Wed, 5 Oct 2022 16:06:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [RFC PATCH 1/1] block: add vhost-blk backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <20220725205527.313973-2-andrey.zhadchenko@virtuozzo.com>
 <Yzx/TS7byHcj6phc@fedora>
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
In-Reply-To: <Yzx/TS7byHcj6phc@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:EE_|AS8PR08MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: cffe33da-d2ef-4077-02da-08daa6d27e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yadckga8uxdCCB64bchae0t77wUOE/lgx/5FNx6J91idME2KUnNpEC0RkK1Q0YtROsEgtSkpLW116N4hDtmMxmafgLTjkqgXzgc11Atf+SfvTML6vzmvWrW7o4Hrt7Y5MRTXDlxvFnHcgXOMg9+E0BHl3TkuvcnBwSln3+T7oWA2LVh5FiuXiyEwxFrH1BJ0fJGFlKDhcJ9EP6VjwsyL1uViEGgdWOg3AKQt/bqxxv6KKg2b8EjgU05f16xa70n57Bq/i3eVVwi1HjuweSGObwSz1F0/6JPoa5N50vg0oPoYJa6nrMK/2uhTQbtBmGMtgLhXTlv2q6+ZRZQd+RKdLvle9BE5NxG59ptK26wCuULtf+XjOK8OlX+joeDGoPdMgHWDtE1X8a62WPOQT7T87BvhH59Fjn/KcL6mCEnZMNjFcU5d7QrtWzEN4cLzlV9G56krt/YyIXPgK14C83QhnC8Nr5pOVBbVGTkcdWUyLIV30Yjich85+mg181sSXPbAe6qw8OHZignnStHnYJQwfPquuII1+3bv+/EzMvJhGUrhHNlkW9Hw2aeX3gmh2YNN/xH94wK17KsUKpVfjiWcK5+VLqGNHVmLTxPzTAV6XUzneqqkzCMoR0s5W8YrVRbHQYv12HAykPzj2tfHOHe6qrIBn+E3gzmlwX73A5QIsWcXBspFpAXjtfcElrC5qxFQ7pfVyhuUJvuG1eNTpd6nEHP4/Fu6HUQHciIOhP1b9U2KT34lQNy+5UmucRAZwNITNRy/dQlGYV/Pwj7rhdciqgjlC9gyTH8DVL7Pj5DxBomFuJxLV3PxOQIIr0iDacrgl5mS/xAenliH+8lHDPgSRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199015)(38100700002)(31686004)(44832011)(30864003)(8936002)(83380400001)(86362001)(2906002)(31696002)(41300700001)(6916009)(316002)(186003)(26005)(6512007)(2616005)(107886003)(6666004)(5660300002)(478600001)(66476007)(66556008)(53546011)(8676002)(6486002)(66946007)(36756003)(4326008)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhCdUdZSGhiTjdCY3ErTGVOdytxVGZSQlQ1SlEzMFJVdlV6VHZQTWNFUlRm?=
 =?utf-8?B?WTI2T0VIREZJaEJCWHBjTGl6amlMb3JEbjBUQnExbUxBdjFSRzBvK2FxK2FZ?=
 =?utf-8?B?SkpEWFU4dHhRZUtDc0JOSnBJYy9YYTRJY3dOeUU5RDh4c3I0UkJYUTJucm5r?=
 =?utf-8?B?T3JRYXZtNUQ0MWM2UTlZR3ZFL2lDRzFGd1oxamVQcmFUTmI4cndvKzNYSmZ0?=
 =?utf-8?B?akM5SXZNTDBGbUVmT3FZNk00NW9VWElmb2pNNzQxcTlsWHE5WXpUcVNMTi9a?=
 =?utf-8?B?NUdtbmwxdnJybXYvR2R2K0hPcFNqMkh4REJybmFVT1FkdVJVa29zUjdNTjBR?=
 =?utf-8?B?T1AwbkZ1YkY0MktUYS96TGNNOS9Qa3VHQTdsVmpLaVluMnhqdThRdlJUaG82?=
 =?utf-8?B?czdIcXVDU0wyR0JQaU1CZmVSbVdSTHBmelk0MW5pa1BMV2l6d2Jkd3RBeE9M?=
 =?utf-8?B?NFBIaU5STkdNQVA4cjRjOGJ2L296dzRUOU1QQk9NcnBqQ0ZhSjlPRUxLUEhU?=
 =?utf-8?B?M24vaVdaeG9pME9MN2tDK0NoYkNId1A3RElCQzdudFcvMkgySW9OR2c5OGxt?=
 =?utf-8?B?T0lIY1RuMndRS1lUYndmWURzTjB3ank5YWg2WkIybGw5aUJkdHQybmpUK044?=
 =?utf-8?B?Um4zekhUMVBHblc2b2l5TDQ3ZndPcnNLS01CVG4wZHdTN1ZwY3l0RUpSbG1k?=
 =?utf-8?B?aGRRL3QyckwwdzRoTHo3bWw3cmdxZEg5aTlNaUZxeGF1Zkp4d0F3OTVkZlgz?=
 =?utf-8?B?Yld4RVZnVTV6Tzk0QWtWUmNVanhsMEZJRWt5dkJ2NTR1Nk1yOWNQaFNsclVi?=
 =?utf-8?B?TTljRmVycUNod0tERUNCbzFBZUhlTzYyZVdCTk8wQlNUWXJIK3JSR0RvSWJt?=
 =?utf-8?B?LzMxY21PdXVBblcvSHFDbG1tZFo4SDdMVFF5SnlNd3JIMEgzd2RrSlFzV1Bp?=
 =?utf-8?B?cEw5TnI2ZTNKcDJ4TEpDNFpRcmZaNEZOVGx3elBMVW1veUJLTjNUQ0l0V3J6?=
 =?utf-8?B?ZjBYYmpaL2UzOFU0N2ptdlpzMzg0MnNudExWZ3ZmR1hMWDVoZGNwSEwzL2lo?=
 =?utf-8?B?M2NjWjB3T1d0bzFyUm90eVdXTmNoTzNXNDd3aEVSZVdGbjBDSC9VaVJKd0tn?=
 =?utf-8?B?QkJxRE8rUDg2OG8wdGV5Y0pOZ3M0Y2tweGFuNUVMdnJPL212NTdGcUc1Mjh4?=
 =?utf-8?B?K3F2V0owekMvUUFqWDlPc09ZQWVYVlBhczhFWTFIeU9FRlFCRFBJYUJvZHhx?=
 =?utf-8?B?RC9VY1pTR1NsQU1ISy9rQ3BVZEV0cUljMFhxYS9tSE9yTnB6b3dOVEhIRytq?=
 =?utf-8?B?ZmlFbzlvRCtaTjlLcWo1eElxdHRhZG0xcEIrd2plS3NyV0ZrM2l2UFZpSlRv?=
 =?utf-8?B?YWZLWllpNXRKdmlJTlQwL3Q4MGw5bmJPLzlwMHVWRGs1SExYczIyL1YrYXhD?=
 =?utf-8?B?N2lVZ1ZSUzJzNEtRTmdTQ2YwbTFoVElKZmE2NTA1WUJnMktoVUpoOE1YbFVp?=
 =?utf-8?B?cCtxcnJIMGpCS2p4VUIycHlXSFdCcllXb1o1OWhBbklWVzdYdHF6MjBXWXNO?=
 =?utf-8?B?dHpPVWRsSldMbDNVT2dyQTEvemllS3dWZlNuTlZBdEExZ05vMG9nMytrSVRC?=
 =?utf-8?B?aW0zR2U2UERpcHVNZGVrU0V2eGNpQ0FMNFd0M0xhYmI5b29ITHJxYndzMDM1?=
 =?utf-8?B?NWpPUGxZQURoVmZmNGdqZkdtbXpoZ1dOYnJUWXRuK21QczhWdCt2VmIxR2kz?=
 =?utf-8?B?Mmo0bmJhZXdYT1V6L3lCc3JnMWttdVFBOWo3QUd2dmxMbVY0NlpYYm1BMHN6?=
 =?utf-8?B?Z1dLa0dkbUppeE9sN01sQXBwWHRkbjIvSzNwa0dtY1FmVWxxMnEzZHpSYmli?=
 =?utf-8?B?RWpZZ2tXenM2YzhYUnQ5Q1lxMnNrUHQ0c3NHSkpEdHFFdXZsdUpXL3ROZXZI?=
 =?utf-8?B?cVd6LzMvOG9DZW1ieU1SY2RxTWw1TVViRlpueXRpZG1YSG9qbllmVG1HOCtE?=
 =?utf-8?B?Qk43M2o4aFN0Nzhmd2dkVkhSdHVCUXAvd2lZRUF4VHhyYWxzMWlta1NTYmVa?=
 =?utf-8?B?YjRVbVI4blVMbmlMdEZ6ZlVnbjVmaHBXS3JmdWo2NXByTXh5WnhKUisycHZR?=
 =?utf-8?B?MDdpa2JXWmp0cGFWVW04dEVyVGxpME96T285RFRtQXh4aGp4UGJPQktOTElJ?=
 =?utf-8?Q?fVvcd910DF4Iv4ueqn1e2Co=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffe33da-d2ef-4077-02da-08daa6d27e1f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 13:07:01.6744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7pbyK8t0RkfijVoi/SnV7BxF3P2kBT1u2qBQ5pYDVV60dn5T2BUzAfw3oZx7V3PC9aCcTadv5MUEXSGfOFRWjvHix6tAH3FPpjrTcWx9l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6422
Received-SPF: pass client-ip=40.107.104.115;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Thanks for the review!

On 10/4/22 21:45, Stefan Hajnoczi wrote:
> On Mon, Jul 25, 2022 at 11:55:27PM +0300, Andrey Zhadchenko wrote:
>> Although QEMU virtio is quite fast, there is still some room for
>> improvements. Disk latency can be reduced if we handle virito-blk requests
>> in host kernel istead of passing them to QEMU. The patch adds vhost-blk
>> backend which sets up vhost-blk kernel module to process requests.
>>
>> test setup and results:
>> fio --direct=1 --rw=randread  --bs=4k  --ioengine=libaio --iodepth=128
>> QEMU drive options: cache=none
>> filesystem: xfs
>>
>> SSD:
>>                 | randread, IOPS  | randwrite, IOPS |
>> Host           |      95.8k	 |	85.3k	   |
>> QEMU virtio    |      57.5k	 |	79.4k	   |
>> QEMU vhost-blk |      95.6k	 |	84.3k	   |
>>
>> RAMDISK (vq == vcpu):
>>                   | randread, IOPS | randwrite, IOPS |
>> virtio, 1vcpu    |	123k	  |	 129k       |
>> virtio, 2vcpu    |	253k (??) |	 250k (??)  |
>> virtio, 4vcpu    |	158k	  |	 154k       |
>> vhost-blk, 1vcpu |	110k	  |	 113k       |
>> vhost-blk, 2vcpu |	247k	  |	 252k       |
>> vhost-blk, 4vcpu |	576k	  |	 567k       |
>>
>> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
>> ---
>>   hw/block/Kconfig              |   5 +
>>   hw/block/meson.build          |   4 +
>>   hw/block/vhost-blk.c          | 394 ++++++++++++++++++++++++++++++++++
>>   hw/virtio/meson.build         |   3 +
>>   hw/virtio/vhost-blk-pci.c     | 102 +++++++++
>>   include/hw/virtio/vhost-blk.h |  50 +++++
>>   meson.build                   |   5 +
>>   7 files changed, 563 insertions(+)
>>   create mode 100644 hw/block/vhost-blk.c
>>   create mode 100644 hw/virtio/vhost-blk-pci.c
>>   create mode 100644 include/hw/virtio/vhost-blk.h
>>
>> diff --git a/hw/block/Kconfig b/hw/block/Kconfig
>> index 9e8f28f982..b4286ad10e 100644
>> --- a/hw/block/Kconfig
>> +++ b/hw/block/Kconfig
>> @@ -36,6 +36,11 @@ config VIRTIO_BLK
>>       default y
>>       depends on VIRTIO
>>   
>> +config VHOST_BLK
>> +    bool
>> +    default n
> 
> Feel free to enable it by default. That way it gets more CI/build
> coverage.
> 
>> +    depends on VIRTIO && LINUX
>> +
>>   config VHOST_USER_BLK
>>       bool
>>       # Only PCI devices are provided for now
>> diff --git a/hw/block/meson.build b/hw/block/meson.build
>> index 2389326112..caf9bedff3 100644
>> --- a/hw/block/meson.build
>> +++ b/hw/block/meson.build
>> @@ -19,4 +19,8 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
>>   specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
>>   specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
>>   
>> +if have_vhost_blk
>> +  specific_ss.add(files('vhost-blk.c'))
>> +endif
> 
> Can this use the same add(when: 'CONFIG_VHOST_BLK', ...) syntax as the
> other conditional builds above?
I tried but it didn't go well for me :)
I will check this again

> 
>> +
>>   subdir('dataplane')
>> diff --git a/hw/block/vhost-blk.c b/hw/block/vhost-blk.c
>> new file mode 100644
>> index 0000000000..33d90af270
>> --- /dev/null
>> +++ b/hw/block/vhost-blk.c
>> @@ -0,0 +1,394 @@
>> +/*
>> + * Copyright (c) 2022 Virtuozzo International GmbH.
>> + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
>> + *
>> + * vhost-blk is host kernel accelerator for virtio-blk.
>> + *
>> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
>> + * See the COPYING.LIB file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>> +#include "qom/object.h"
>> +#include "hw/qdev-core.h"
>> +#include "hw/boards.h"
>> +#include "hw/virtio/vhost.h"
>> +#include "hw/virtio/vhost-blk.h"
>> +#include "hw/virtio/virtio.h"
>> +#include "hw/virtio/virtio-blk.h"
>> +#include "hw/virtio/virtio-bus.h"
>> +#include "hw/virtio/virtio-access.h"
>> +#include "hw/virtio/virtio-pci.h"
>> +#include "sysemu/sysemu.h"
>> +#include "linux-headers/linux/vhost.h"
>> +#include <sys/ioctl.h>
>> +#include <linux/fs.h>
>> +
>> +static int vhost_blk_start(VirtIODevice *vdev)
>> +{
>> +    VHostBlk *s = VHOST_BLK(vdev);
>> +    struct vhost_vring_file backend;
>> +    int ret, i;
>> +    int *fd = blk_bs(s->conf.conf.blk)->file->bs->opaque;
> 
> This needs a clean API so vhost-blk.c doesn't make assumptions about the
> file-posix BlockDriver's internal state memory layout.
I thought it did have some API but I didn't manage to find it. Does it 
exist?
Probably I can just open file by the name? But I didn't really want to 
manage flags like readonly. And if BlockDriver already opens this fd why 
bother with another copy?

> 
>> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>> +
>> +    if (!k->set_guest_notifiers) {
>> +        error_report("vhost-blk: binding does not support guest notifiers");
>> +        return -ENOSYS;
>> +    }
>> +
>> +    if (s->vhost_started) {
>> +        return 0;
>> +    }
>> +
>> +    if (ioctl(s->vhostfd, VHOST_SET_OWNER, NULL)) {
>> +        error_report("vhost-blk: unable to set owner");
>> +        return -ENOSYS;
>> +    }
>> +
>> +    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
>> +    if (ret < 0) {
>> +        error_report("vhost-blk: unable to enable dev notifiers", errno);
>> +        return ret;
>> +    }
>> +
>> +    s->dev.acked_features = vdev->guest_features & s->dev.backend_features;
>> +
>> +    ret = vhost_dev_start(&s->dev, vdev);
>> +    if (ret < 0) {
>> +        error_report("vhost-blk: unable to start vhost dev");
>> +        return ret;
>> +    }
>> +
>> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
>> +    if (ret < 0) {
>> +        error_report("vhost-blk: unable to bind guest notifiers");
>> +        goto out;
>> +    }
>> +
>> +    memset(&backend, 0, sizeof(backend));
>> +    backend.index = 0;
>> +    backend.fd = *fd;
>> +    if (ioctl(s->vhostfd, VHOST_BLK_SET_BACKEND, &backend)) {
>> +        error_report("vhost-blk: unable to set backend");
>> +        ret = -errno;
>> +        goto out;
>> +    }
>> +
>> +    for (i = 0; i < s->dev.nvqs; i++) {
>> +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
>> +    }
>> +
>> +    event_notifier_set(virtio_queue_get_host_notifier(virtio_get_queue(vdev, 0)));
> 
> Should this be done for all vqs?
> 
>> +
>> +    s->vhost_started = true;
>> +
>> +    return 0;
>> +
>> +out:
>> +    vhost_dev_stop(&s->dev, vdev);
>> +    return ret;
>> +
>> +}
>> +
>> +static void vhost_blk_stop(VirtIODevice *vdev)
>> +{
>> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>> +    VHostBlk *s = VHOST_BLK(vdev);
>> +    int ret;
>> +
>> +    if (!s->vhost_started) {
>> +        return;
>> +    }
>> +
>> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>> +    if (ret < 0) {
>> +        error_report("vhost-blk: unable to unbind guest notifiers");
>> +    }
>> +    vhost_dev_disable_notifiers(&s->dev, vdev);
>> +    vhost_dev_stop(&s->dev, vdev);
>> +
>> +    s->vhost_started = false;
>> +}
>> +
>> +static void vhost_blk_reset(VirtIODevice *vdev)
>> +{
>> +    VHostBlk *s = VHOST_BLK(vdev);
>> +    int ret;
>> +
>> +    vhost_blk_stop(vdev);
>> +    ret = ioctl(s->vhostfd, VHOST_RESET_OWNER, NULL);
>> +    if (ret && errno != EPERM) {
>> +            error_report("vhost-blk: failed to reset owner %d", errno);
>> +    }
>> +}
>> +
>> +static void vhost_blk_set_status(VirtIODevice *vdev, uint8_t status)
>> +{
>> +    if (status & (VIRTIO_CONFIG_S_NEEDS_RESET | VIRTIO_CONFIG_S_FAILED)) {
>> +        vhost_blk_stop(vdev);
>> +        return;
>> +    }
>> +
>> +    if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
>> +        return;
>> +    }
>> +
>> +    if (vhost_blk_start(vdev)) {
>> +        error_report("vhost-blk: failed to start");
>> +    }
>> +}
>> +
>> +static void vhost_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>> +{
>> +}
>> +
>> +static void vhost_blk_device_realize(DeviceState *dev, Error **errp)
>> +{
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VHostBlk *s = VHOST_BLK(vdev);
>> +    VhostBlkConf *conf = &s->conf;
>> +    int i, ret;
>> +
>> +    if (!conf->conf.blk) {
>> +        error_setg(errp, "vhost-blk: drive property not set");
>> +        return;
>> +    }
>> +
>> +    if (!blk_is_inserted(conf->conf.blk)) {
>> +        error_setg(errp, "vhost-blk: device needs media, but drive is empty");
>> +        return;
>> +    }
>> +
>> +    if (conf->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
>> +        conf->num_queues = MIN(virtio_pci_optimal_num_queues(0),
>> +                               VHOST_BLK_MAX_QUEUES);
> 
> Why is 8 (VHOST_BLK_MAX_QUEUES) queues the maximum?

Arbitrary number for RFC patch to simplify memory management in kernel. 
I will re-do it if we will get this series past RFC.

> 
>> +    }
>> +
>> +    if (!conf->num_queues) {
>> +        error_setg(errp, "vhost-blk: num-queues property must be larger than 0");
>> +        return;
>> +    }
>> +
>> +    if (conf->queue_size <= 2) {
>> +        error_setg(errp, "vhost-blk: invalid queue-size property (%" PRIu16 "), "
>> +                   "must be > 2", conf->queue_size);
>> +        return;
>> +    }
>> +
>> +    if (!is_power_of_2(conf->queue_size) ||
>> +        conf->queue_size > VIRTQUEUE_MAX_SIZE) {
>> +        error_setg(errp, "vhost_blk: invalid queue-size property (%" PRIu16 "), "
>> +                   "must be a power of 2 (max %d)",
>> +                   conf->queue_size, VIRTQUEUE_MAX_SIZE);
>> +        return;
>> +    }
>> +
>> +    if (!blkconf_apply_backend_options(&conf->conf,
>> +                                       !blk_supports_write_perm(conf->conf.blk),
>> +                                       true, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (!blkconf_geometry(&conf->conf, NULL, 65535, 255, 255, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (!blkconf_blocksizes(&conf->conf, errp)) {
>> +        return;
>> +    }
>> +
>> +    s->dev.nvqs = conf->num_queues;
>> +    s->dev.max_queues = conf->num_queues;
>> +    s->dev.vqs = g_new(struct vhost_virtqueue, s->dev.nvqs);
>> +    s->dev.vq_index = 0;
>> +
>> +    virtio_init(vdev, VIRTIO_ID_BLOCK, sizeof(struct virtio_blk_config));
>> +
>> +    for (i = 0; i < conf->num_queues; i++) {
>> +        virtio_add_queue(vdev, conf->queue_size, vhost_blk_handle_output);
>> +    }
>> +
>> +    s->vhostfd = open("/dev/vhost-blk", O_RDWR);
>> +    if (s->vhostfd < 0) {
>> +        error_setg(errp, "vhost-blk: unable to open /dev/vhost-blk");
>> +        goto cleanup;
>> +    }
>> +
>> +    s->dev.acked_features = 0;
>> +    ret = ioctl(s->vhostfd, VHOST_GET_FEATURES, &s->dev.backend_features);
>> +    if (ret < 0) {
>> +        error_setg(errp, "vhost-blk: unable to get backend features");
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = vhost_dev_init(&s->dev, (void *)((size_t)s->vhostfd),
>> +                         VHOST_BACKEND_TYPE_KERNEL, 0, false);
> 
> The last parameter should be NULL (Error **) instead of false.
> 
>> +    if (ret < 0) {
>> +        error_setg(errp, "vhost-blk: vhost initialization failed: %s",
>> +                strerror(-ret));
>> +        goto cleanup;
>> +    }
>> +
>> +    return;
>> +
>> +cleanup:
>> +    g_free(s->dev.vqs);
>> +    close(s->vhostfd);
>> +    for (i = 0; i < conf->num_queues; i++) {
>> +        virtio_del_queue(vdev, i);
>> +    }
>> +    virtio_cleanup(vdev);
>> +    return;
>> +}
>> +
>> +static void vhost_blk_device_unrealize(DeviceState *dev)
>> +{
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VHostBlk *s = VHOST_BLK(dev);
>> +
>> +    vhost_blk_set_status(vdev, 0);
>> +    vhost_dev_cleanup(&s->dev);
>> +    g_free(s->dev.vqs);
>> +    virtio_cleanup(vdev);
>> +}
>> +
>> +static const int user_feature_bits[] = {
>> +    VIRTIO_BLK_F_FLUSH,
>> +    VIRTIO_RING_F_INDIRECT_DESC,
>> +    VIRTIO_RING_F_EVENT_IDX,
>> +    VHOST_INVALID_FEATURE_BIT
>> +};
>> +
>> +
>> +static uint64_t vhost_blk_get_features(VirtIODevice *vdev,
>> +                                            uint64_t features,
>> +                                            Error **errp)
>> +{
>> +    VHostBlk *s = VHOST_BLK(vdev);
>> +    uint64_t res;
>> +
>> +    features |= s->host_features;
>> +
>> +    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
>> +    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
>> +    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>> +    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
>> +    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
>> +
>> +    virtio_add_feature(&features, VIRTIO_F_VERSION_1);
>> +
>> +    if (!blk_is_writable(s->conf.conf.blk)) {
>> +        virtio_add_feature(&features, VIRTIO_BLK_F_RO);
>> +    }
>> +
>> +    if (s->conf.num_queues > 1) {
>> +        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
>> +    }
>> +
>> +    res = vhost_get_features(&s->dev, user_feature_bits, features);
>> +
>> +    return res;
>> +}
>> +
>> +static void vhost_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>> +{
>> +    VHostBlk *s = VHOST_BLK(vdev);
>> +    BlockConf *conf = &s->conf.conf;
>> +    struct virtio_blk_config blkcfg;
>> +    uint64_t capacity;
>> +    int64_t length;
>> +    int blk_size = conf->logical_block_size;
>> +
>> +    blk_get_geometry(s->conf.conf.blk, &capacity);
>> +    memset(&blkcfg, 0, sizeof(blkcfg));
>> +    virtio_stq_p(vdev, &blkcfg.capacity, capacity);
>> +    virtio_stl_p(vdev, &blkcfg.seg_max, s->conf.queue_size - 2);
>> +    virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
>> +    virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
>> +    blkcfg.geometry.heads = conf->heads;
>> +
>> +    length = blk_getlength(s->conf.conf.blk);
>> +    if (length > 0 && length / conf->heads / conf->secs % blk_size) {
>> +        unsigned short mask;
>> +
>> +        mask = (s->conf.conf.logical_block_size / BDRV_SECTOR_SIZE) - 1;
>> +        blkcfg.geometry.sectors = conf->secs & ~mask;
>> +    } else {
>> +        blkcfg.geometry.sectors = conf->secs;
>> +    }
>> +
>> +    blkcfg.size_max = 0;
>> +    blkcfg.physical_block_exp = get_physical_block_exp(conf);
>> +    blkcfg.alignment_offset = 0;
>> +    virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
>> +
>> +    memcpy(config, &blkcfg, sizeof(struct virtio_blk_config));
>> +}
>> +
>> +static Property vhost_blk_properties[] = {
>> +    DEFINE_BLOCK_PROPERTIES(VHostBlk, conf.conf),
>> +    DEFINE_PROP_UINT16("num-queues", VHostBlk, conf.num_queues,
>> +                       VHOST_BLK_AUTO_NUM_QUEUES),
>> +    DEFINE_PROP_UINT16("queue-size", VHostBlk, conf.queue_size, 256),
>> +/* Discard and write-zeroes not yet implemented in kernel module */
>> +    DEFINE_PROP_BIT64("discard", VHostBlk, host_features,
>> +                      VIRTIO_BLK_F_DISCARD, false),
>> +    DEFINE_PROP_BIT64("write-zeroes", VHostBlk, host_features,
>> +                      VIRTIO_BLK_F_WRITE_ZEROES, false),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static const VMStateDescription vmstate_vhost_blk = {
>> +    .name = "vhost-blk",
>> +    .minimum_version_id = 1,
>> +    .version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_VIRTIO_DEVICE,
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>> +static void vhost_blk_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
>> +
>> +    device_class_set_props(dc, vhost_blk_properties);
>> +    dc->vmsd = &vmstate_vhost_blk;
> 
> Does this really support live migration? Are in-flight requests drained
> when pausing for live migration handover?

Not yet but it doesn't look hard to implement. Resetting device will 
drain all requests.

> 
>> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>> +    vdc->realize = vhost_blk_device_realize;
>> +    vdc->unrealize = vhost_blk_device_unrealize;
>> +    vdc->get_config = vhost_blk_update_config;
>> +    vdc->get_features = vhost_blk_get_features;
>> +    vdc->set_status = vhost_blk_set_status;
>> +    vdc->reset = vhost_blk_reset;
>> +}
>> +
>> +static void vhost_blk_instance_init(Object *obj)
>> +{
>> +    VHostBlk *s = VHOST_BLK(obj);
>> +
>> +    device_add_bootindex_property(obj, &s->conf.conf.bootindex,
>> +                                  "bootindex", "/disk@0,0",
>> +                                  DEVICE(obj));
>> +}
>> +
>> +static const TypeInfo vhost_blk_info = {
>> +    .name = TYPE_VHOST_BLK,
>> +    .parent = TYPE_VIRTIO_DEVICE,
>> +    .instance_size = sizeof(VHostBlk),
>> +    .instance_init = vhost_blk_instance_init,
>> +    .class_init = vhost_blk_class_init,
>> +};
>> +
>> +static void virtio_register_types(void)
>> +{
>> +    type_register_static(&vhost_blk_info);
>> +}
>> +
>> +type_init(virtio_register_types)
>> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
>> index 7e8877fd64..fb2c0e7242 100644
>> --- a/hw/virtio/meson.build
>> +++ b/hw/virtio/meson.build
>> @@ -40,6 +40,9 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng-
>>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
>>   virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
>>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
>> +if have_vhost_blk
>> +  virtio_ss.add(files('vhost-blk-pci.c'))
>> +endif
>>   
>>   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
>>   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
>> diff --git a/hw/virtio/vhost-blk-pci.c b/hw/virtio/vhost-blk-pci.c
>> new file mode 100644
>> index 0000000000..f3b6e112b4
>> --- /dev/null
>> +++ b/hw/virtio/vhost-blk-pci.c
>> @@ -0,0 +1,102 @@
>> +/*
>> + * Copyright (c) 2022 Virtuozzo International GmbH.
>> + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
>> + *
>> + * vhost-blk PCI bindings
>> + *
>> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
>> + * See the COPYING.LIB file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "standard-headers/linux/virtio_pci.h"
>> +#include "hw/virtio/virtio.h"
>> +#include "hw/virtio/vhost-blk.h"
>> +#include "hw/pci/pci.h"
>> +#include "hw/qdev-properties.h"
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/module.h"
>> +#include "hw/virtio/virtio-pci.h"
>> +#include "qom/object.h"
>> +
>> +typedef struct VHostBlkPCI VHostBlkPCI;
>> +
>> +/*
>> + * vhost-blk-pci: This extends VirtioPCIProxy.
>> + */
>> +#define TYPE_VHOST_BLK_PCI "vhost-blk-pci-base"
>> +DECLARE_INSTANCE_CHECKER(VHostBlkPCI, VHOST_BLK_PCI,
>> +                         TYPE_VHOST_BLK_PCI)
>> +
>> +struct VHostBlkPCI {
>> +    VirtIOPCIProxy parent_obj;
>> +    VHostBlk vdev;
>> +};
>> +
>> +static Property vhost_blk_pci_properties[] = {
>> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
>> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
>> +                       DEV_NVECTORS_UNSPECIFIED),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void vhost_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>> +{
>> +    VHostBlkPCI *dev = VHOST_BLK_PCI(vpci_dev);
>> +    DeviceState *vdev = DEVICE(&dev->vdev);
>> +
>> +    if (dev->vdev.conf.num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
>> +        dev->vdev.conf.num_queues = MIN(virtio_pci_optimal_num_queues(0),
>> +                                        VHOST_BLK_MAX_QUEUES);
>> +    }
>> +
>> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
>> +        vpci_dev->nvectors = dev->vdev.conf.num_queues + 1;
>> +    }
>> +
>> +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>> +}
>> +
>> +static void vhost_blk_pci_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
>> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
>> +
>> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>> +    device_class_set_props(dc, vhost_blk_pci_properties);
>> +    k->realize = vhost_blk_pci_realize;
>> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
>> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BLOCK;
>> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>> +    pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
>> +}
>> +
>> +static void vhost_blk_pci_instance_init(Object *obj)
>> +{
>> +    VHostBlkPCI *dev = VHOST_BLK_PCI(obj);
>> +
>> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>> +                                TYPE_VHOST_BLK);
>> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
>> +                              "bootindex");
>> +}
>> +
>> +static const VirtioPCIDeviceTypeInfo vhost_blk_pci_info = {
>> +    .base_name               = TYPE_VHOST_BLK_PCI,
>> +    .generic_name            = "vhost-blk-pci",
>> +    .transitional_name       = "vhost-blk-pci-transitional",
>> +    .non_transitional_name   = "vhost-blk-pci-non-transitional",
>> +    .instance_size  = sizeof(VHostBlkPCI),
>> +    .instance_init  = vhost_blk_pci_instance_init,
>> +    .class_init     = vhost_blk_pci_class_init,
>> +};
>> +
>> +static void vhost_blk_pci_register(void)
>> +{
>> +    virtio_pci_types_register(&vhost_blk_pci_info);
>> +}
>> +
>> +type_init(vhost_blk_pci_register)
>> diff --git a/include/hw/virtio/vhost-blk.h b/include/hw/virtio/vhost-blk.h
>> new file mode 100644
>> index 0000000000..76ece4215d
>> --- /dev/null
>> +++ b/include/hw/virtio/vhost-blk.h
>> @@ -0,0 +1,50 @@
>> +/*
>> + * Copyright (c) 2022 Virtuozzo International GmbH.
>> + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
>> + *
>> + * vhost-blk is host kernel accelerator for virtio-blk.
>> + *
>> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
>> + * See the COPYING.LIB file in the top-level directory.
>> + */
>> +
>> +#ifndef VHOST_BLK_H
>> +#define VHOST_BLK_H
>> +
>> +#include "standard-headers/linux/virtio_blk.h"
>> +#include "hw/block/block.h"
>> +#include "hw/virtio/vhost.h"
>> +#include "sysemu/block-backend.h"
>> +
>> +#define TYPE_VHOST_BLK "vhost-blk"
>> +#define VHOST_BLK(obj) \
>> +        OBJECT_CHECK(VHostBlk, (obj), TYPE_VHOST_BLK)
>> +
>> +#define VHOST_BLK_AUTO_NUM_QUEUES UINT16_MAX
>> +#define VHOST_BLK_MAX_QUEUES 8
>> +
>> +/*
>> + * normally should be visible from imported headers
>> + * temporary define here to simplify development
>> + */
>> +#define VHOST_BLK_SET_BACKEND          _IOW(VHOST_VIRTIO, 0x90, \
>> +                                            struct vhost_vring_file)
>> +
>> +typedef struct VhostBlkConf {
>> +    BlockConf conf;
> 
> What is the purpose of using BlockConf but bypassing the QEMU block
> layer?

I did not want to
- Decalre several properties BlockConf already have
- Duplicate configuration helpers like
blkconf_geometry() for the above
These were the main reasons.

> 
> If the file is a qcow2 file or there are additional block drivers like
> the luks crypto driver then this doesn't work. If block jobs and other
> block operations are performed on the QMP monitor then the image can be
> corrupted.

Thank you for the pointing this out. Unfortunately I know little about 
qemu block layer and did not think such things can happen in this case. 
I will try to re-evaluate this.

> 
>> +    uint16_t num_queues;
>> +    uint16_t queue_size;
>> +} VhostBlkConf;
>> +
>> +typedef struct VHostBlk {
>> +    VirtIODevice parent_obj;
>> +    VhostBlkConf conf;
>> +    uint64_t host_features;
>> +    uint64_t decided_features;
>> +    struct virtio_blk_config blkcfg;
>> +    int vhostfd;
>> +    struct vhost_dev dev;
>> +    bool vhost_started;
>> +} VHostBlk;
>> +
>> +#endif
>> diff --git a/meson.build b/meson.build
>> index 8a8c415fc1..7c00a8ce89 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -336,6 +336,9 @@ have_vhost_kernel = get_option('vhost_kernel') \
>>   have_vhost_user_crypto = get_option('vhost_crypto') \
>>     .require(have_vhost_user,
>>              error_message: 'vhost-crypto requires vhost-user to be enabled').allowed()
>> +have_vhost_blk = get_option('vhost_blk') \
>> +  .require(targetos == 'linux',
>> +           error_message: 'vhost-kernel is only available on Linux').allowed()
>>   
>>   have_vhost = have_vhost_user or have_vhost_vdpa or have_vhost_kernel
>>   
>> @@ -1814,6 +1817,7 @@ config_host_data.set('CONFIG_VHOST_KERNEL', have_vhost_kernel)
>>   config_host_data.set('CONFIG_VHOST_USER', have_vhost_user)
>>   config_host_data.set('CONFIG_VHOST_CRYPTO', have_vhost_user_crypto)
>>   config_host_data.set('CONFIG_VHOST_VDPA', have_vhost_vdpa)
>> +config_host_data.set('CONFIG_VHOST_BLK', have_vhost_blk)
>>   config_host_data.set('CONFIG_VMNET', vmnet.found())
>>   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>>   config_host_data.set('CONFIG_VDUSE_BLK_EXPORT', have_vduse_blk_export)
>> @@ -3756,6 +3760,7 @@ summary_info += {'vhost-user support': have_vhost_user}
>>   summary_info += {'vhost-user-crypto support': have_vhost_user_crypto}
>>   summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
>>   summary_info += {'vhost-vdpa support': have_vhost_vdpa}
>> +summary_info += {'vhost-blk support': have_vhost_blk}
>>   summary_info += {'build guest agent': have_ga}
>>   summary(summary_info, bool_yn: true, section: 'Configurable features')
>>   
>> -- 
>> 2.31.1
>>

