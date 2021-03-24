Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C63482E1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:27:56 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPA6c-0003EZ-MM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lP9xt-0005Nf-RJ; Wed, 24 Mar 2021 16:18:54 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:24483 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lP9xq-0005dq-Ca; Wed, 24 Mar 2021 16:18:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMHCBPZd+cPVTFqTuMHpxIlSghmDiITQKDkg2u8sJYQo4fcfGcUkjPbPzA0WuwaZ+EuKjnrlmj40kXjVo/+1msJRpa3IGYHGvJuoY4pMijG5WYOEoMwrNsmTz98ybRBBzOFnhQOjm9YU47NoKZhQlMbPnaAY4mBrhraTcco8SUGiF4a7EbuOPJYk7y5i11DMecXgFlrNkDZpZpc0OzBexbEFZUNU/iOhHx+2NDHzVHMvpDWpCjQJAy0Ntnluox73lyTboe6G2ZTH0SspGpOh+zZ01ANI8AKc5QgFkqwFUcUh5cbniZMr1OGaZZ7CwNUOc7e/mTs9NGPyGa98Eo+HYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrlK8JThRuKKxJOgK1yUCg7Aty+947m8yiMIZ6PuRl0=;
 b=nPj5WPhIMqil10ghax3zdEG7hOiIljTxU0CwFu0az7xnActWHbLzEUO7Rk1Keq9VW5kBb0OzwJJ7CYirysDBH7ABmbWuZf6/0c7OfV6o4y9WfAlQtgNuR54LecJuUXmXCwYMNpUeKZaXOknS+nTrglBqk+cuRMa8+U5OCDpJalMDaPyHg8q6X0G9Iaq/ywZfroiaT9OkH9rH9pNuehr+f1YOk72q/J0QG4/iiHmowoNd/WOE3nx2j56IAr7hAM5T12oucQuJwtWnnTo4Y+fB1LtSBeQnRb5qHxJMvcFOHk91TJsEyXUP/QXCEAw2hcerE1R6UrVEckQjkobi3/EoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrlK8JThRuKKxJOgK1yUCg7Aty+947m8yiMIZ6PuRl0=;
 b=O+Ey8QxdYLV3hVaY4cQFXp5rcaZxKr1mjjxNsEmrqGRKi+T8WZXUeiEtCKAzmw1tljDfRkzDQ5wqtA5I/KKikKV8NUtEfLU1nDVrKpMKLU2HiJgjiUEWKsB8L0rCIAu75Jfufsu2Vzhk8rL6V7wWQE3H913EOZW87N3clUsFVc0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 20:18:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:18:45 +0000
Subject: Re: [PULL 0/2] Block patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
Date: Wed, 24 Mar 2021 23:18:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0014.eurprd03.prod.outlook.com
 (2603:10a6:208:14::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:208:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.28 via Frontend Transport; Wed, 24 Mar 2021 20:18:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94c45c36-12d6-4c45-8397-08d8ef0206dc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-Microsoft-Antispam-PRVS: <AM6PR08MB453329145EA701E78CF5AABFC1639@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9T/gFzswppEZC9DrWruyeY4HcUCLNKUhIqhydwn+xz0yxCKwo7Rzl99QevG3zg5Y4KN7+zMnip8Xdh830UiWg+Ja5EJv/st31aZak3GNUoPttK1uWPiasIyq4vkxI1xWcGvm0GADvXWdC0Ds297y/IJRHmKxmHhf9VBt/VZ/zaqPA7dJnQjOjb/ZZKK7pLQLOgwaNcyfhpQiF9Zn7+5MPp6D9E+uVYA7KdyV6CTTJOsPCrfWaJ5OqWn/K1TQU6LbpwCei3lSfpuzvs8xv9psXxVQBCq+nlWTtNBGFvZ+xS1Uf14a/3wtSTRsnYoBuAekjrDgzDix0FQHbSbU/Tnw4UJu9y6gWxumt0I+mK/xS6Vr79l4ZfwwG7pwt7HoAQM1Emtt3frOcLfx+2thp8Km3FGodmjoHPugMoIN10BGwSQx7BIjh7ql/PcnAll9yL36jRh59ecuNux30fO1qiOZf53LFDNZIclqm7XKP0Qry8PtWpI0/jm4kJYFerlioggAlvo75Wz8vrQXXPR8Y5hW3tUjOHbUF8KJovJltF2FjyfObtJLO73nYpvpan29Py/M0Y9yDtOHXFk3lgXo8Z0g1+HJnslipzhkPz8d74CaEhRdRyfsHuWsWNFjmBNtUvhsDgvS9v2Q7u79vbU2J7p5scJh5c4GyKAG5Lqks6j6KGsiMzlIbrKU//3nL8MuSGRvHqiDmePaIpcidQldw7nAB3sNXemGf76Ejsp4Cu5ZszZL3kXltdHUo35qMraCzzEbSufrXx3HjCQNi70tESqvdRqo1kvfgmj1d+pwMfCELuk2oHEQYsTdXPUpxrdGleiK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39840400004)(316002)(4326008)(7416002)(66946007)(110136005)(5660300002)(6486002)(66476007)(86362001)(31686004)(54906003)(2906002)(478600001)(66556008)(966005)(52116002)(38100700001)(8936002)(16576012)(956004)(2616005)(16526019)(26005)(8676002)(36756003)(83380400001)(31696002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a05hQjYvc3lWanlMa0MrUlBvVExmV2toTTRaY2QxRy9HcGhFVjlNUjhzWEFX?=
 =?utf-8?B?TW5sU2xLbnpvdHU0Y204RmVkNzJFazl2VmtSWGY1aHZ4N3d5bC9zbG5Bb0tx?=
 =?utf-8?B?akhrNVhld1NpcFBaT040NWI2eGdaNlJaMXZiYXE3K243Q2srNmJORzZidCtr?=
 =?utf-8?B?TlFTUDE5TUNTdGNxRGR1RWNwS21oNDc5clo0NEZGSGhNTk9JM2ZBTENOR2ND?=
 =?utf-8?B?RVBNZW5RZVVJZnVnVzJUcWl0U2NiR3l4ODFxekRCem4yMUhsN0lqTTNUa1Ew?=
 =?utf-8?B?eWdUZ09ZaFZFV1NFMk9hOXhKdk45L2FDcktjRWtaRDYzclVTOG1IS3FNdk01?=
 =?utf-8?B?eW9zazk2bGFGY0gvNVA5ZGd0MmdIaUk1NXJaZyttNkxLSFpvSnJnVmhBY2pu?=
 =?utf-8?B?RngxdG5aNGUwbWd0Wm5WTFdSNms5WDJuVVpQODJsNkhocW5FZmQ4eW02bklB?=
 =?utf-8?B?Nmp2RDRuaGxjdFZsMmcyRUpDRDFMQXcwWU1aMjRYVjdIMnJIb25RNU15QWJW?=
 =?utf-8?B?M1Q2TVRaRDFaaFVvbWk2R2IzZ20yTHoxeTNPeGsvdlJHbENHcFpaT2dRZVc1?=
 =?utf-8?B?c1ViZTNaYmd3eUJxemQ1am5wU2s0MVhTcTJkL3llL2syVEtFWWl0Q2hFZXhy?=
 =?utf-8?B?citXNGVjdCtaVDc2eitPWENBYWhsdWdGMFVIL0RLUE1xSC9odkcweUFsRUNJ?=
 =?utf-8?B?cUQ1aG1SNVFWT20rS21RUytEYkF0N0J0a05CVk5YRkRGSDlvUEtxR0pYSnFp?=
 =?utf-8?B?c0dBNGl5Z2MzK1pIZDFrYXlWSVY0c01qdXhiK3U0YUE4c2Y2cDFzNlg5ekpD?=
 =?utf-8?B?Z20xNXUrVWdobE5lMDJTaU5odlEwQUdBUWl5bzRuSkxOajlHS1dCVXFNQWFG?=
 =?utf-8?B?ZzlUQVBqZ3F2K0V3eTc5d3AybEhMUksybmNuOGhaQ1h3WmlRM1ZtZldLc0tM?=
 =?utf-8?B?N0x3VkYwRWZXOWl0ZXo2UVhVOWhPczJRL0NtOUx4OElXNTlHOWdGSU4xMmc2?=
 =?utf-8?B?clo5TXVSRmtyU2RCb3JyaVFVTmhNQysxNWJsTjd2anR4OVVMcURhN05YVjFk?=
 =?utf-8?B?ZHhaTGcxWjJqLzNFMzNlVURLMWEvcHhYYWUzTXBNb3RMaXQvaWFXY3h6Q25w?=
 =?utf-8?B?UmVoVmlnenFGYVJ6cDNtV1NBaFJWMmhQckZWdmQ0N0M1ak1BZFpzQlJQb0ww?=
 =?utf-8?B?MGs0Mnl4RXNmTWpuUVQ0c1ovdU16M3FOK0xiMXVzaC9Hay9vQS9EMGF4Zmhj?=
 =?utf-8?B?RXRCSU1ZR3NpdllDZitGN2VPTExPTDB0S21HeHJOVGplN2VtS0h4UjRxZWJn?=
 =?utf-8?B?ekNvMUMwVlAwZm5nRlJWRWgreUd5WjZzUWNiQUlHZml3dUhwdUtUYTRMRk5i?=
 =?utf-8?B?Mm11b3kwbFVKcjNtdHpRL0ZKVGRQWmRKbndDRVZIcTlycXFuNFpsVW1Ia3BG?=
 =?utf-8?B?ZVo5TUFFck5PeGJpcytsN0FlTDhROHg4UHczdDM4emhRZmRwTCtsZ0VEZjZy?=
 =?utf-8?B?WmgwSVQ5Z0VneDRVdHljVVdSZmVnbzdkYnlmamhsZVZtSUgvckVPbGZsM1Fw?=
 =?utf-8?B?ZDVUSFRlbGx5YTY3ZVBqZytIZTI4S1JLMm13ZnlVNTBLbDlLV1A4R3RkNjZS?=
 =?utf-8?B?Y25vRHBXQWZ0V3ZVWUsvQ0phK2JoZmxUVEJjeFMvSUpjd2VzdVVzS0NVVGlo?=
 =?utf-8?B?MTc2UGZWRlNCSjl5S2FVendzcFpyUXY1S0pJVXc0VE5qN0RiRW5ZZzBhSXhu?=
 =?utf-8?Q?vFF6CZ0LO/c/p7+pV6tycO6TchvhhCKP3A1IAjI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c45c36-12d6-4c45-8397-08d8ef0206dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:18:45.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uV1EQIO1JLkrhzTBM00RqzSzKVukrwbHHtNfQetXGCJceudIfMUIh0g5YT54ZQuR5fFA/d35jiSgNS1zhmI46tV/16lBeiF8fq9xMYWQxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

24.03.2021 21:05, Peter Maydell wrote:
> On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> The following changes since commit 67c1115edd98f388ca89dd38322ea3fadf034523:
>>
>>    Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210323-pull-request' into staging (2021-03-23 23:47:30 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>>
>> for you to fetch changes up to 3460fd7f3959d1fa7bcc255796844aa261c805a4:
>>
>>    migrate-bitmaps-postcopy-test: check that we can't remove in-flight bitmaps (2021-03-24 13:41:19 +0000)
>>
>> ----------------------------------------------------------------
>> Pull request
>>
>> This dirty bitmap fix solves a crash that can be triggered in the destination
>> QEMU process during live migration.
>>
>> ----------------------------------------------------------------
>>
>> Vladimir Sementsov-Ogievskiy (2):
>>    migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>>    migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>>      bitmaps
> 
> This failed the 'qsd-jobs' iotest on s390x:
> 
> 
>    TEST   iotest-qcow2: 309
>    TEST   iotest-qcow2: 313
>    TEST   iotest-qcow2: qsd-jobs [fail]
> QEMU          --
> "/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-system-s390x"
> -nodefaults -display none -accel qtest
> QEMU_IMG      -- "/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-io" --cache
> writeback --aio threads -f qcow2
> QEMU_NBD      -- "/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- Linux/s390x qemu01 4.15.0-132-generic
> TEST_DIR      -- /home/ubuntu/qemu/build/all/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmp807j_qyh
> SOCKET_SCM_HELPER --
> /home/ubuntu/qemu/build/all/tests/qemu-iotests/socket_scm_helper
> --- /home/ubuntu/qemu/tests/qemu-iotests/tests/qsd-jobs.out
> +++ qsd-jobs.out.bad
> @@ -9,11 +9,11 @@
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id":
> "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
> "job0"}}
>   {"return": {}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id":
> "job0"}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
> "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id":
> "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0,
> "offset": 0, "speed": 0, "type": "commit"}}
> -{"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id":
> "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id":
> "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id":
> "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id":
> "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0,
> "offset": 0, "speed": 0, "type": "commit"}}
> Not run: 172 186 192 220 287
> Failures: qsd-jobs
> Failed 1 of 118 iotests
> 
> thanks
> -- PMM
> 

I can't believe it related. My commit modifies bitmap status during bitmaps migration on target vm. There is no kind of migration in qsd-jobs test.

-- 
Best regards,
Vladimir

