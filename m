Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D6047E744
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 18:53:08 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0SH5-0000vm-8x
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 12:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0SEQ-00085Z-JF; Thu, 23 Dec 2021 12:50:22 -0500
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:45092 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0SEN-00057P-BZ; Thu, 23 Dec 2021 12:50:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=df4ag0LwkkRe30Y9vkEri+dP1dgIfVYY9JhHjEYryh9HDDT5gzyBwsJ5V4XrrzF6yNG60R15sifwwGG3pFABK/cckpF83Xq9txQMcIFMg2LPIwq8zUg1l3YS19X4Cpcod+OOEdPFIfS+fH+vtJoL0JVTBVoT9hNfwPINSGFkrXLGqAYECnO6DRxRy6uFJAvUkK8QDWc7GpGJP7xf/KFN8wjzk7Ye4JmzpyKxdazYppipcK7lX21lwVX3EXEH+nuxbAjGgh+HDCuxqDg9sYuxA63zxxmNxgUZxbNg4Xx6R60IKyPt5EtaUf000opREVqtJQxg2VxvM/xz7elDF5zvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+wYf8fs3PHZMfh3+CPz7QxsWi5SxZu4saf1DqlCJFk=;
 b=Z+Bp6kuHjIWvWVOlgRWvGEyWbYvS4g2JqqbViPSir4PZxq8UO/ULb4K+kpUfNTsjn74ClGr+T1B9SEdDKpdnB8kHdKF0yqmqwaoZXh3sbUVfTLQLusUZLN17M9XJQBxFjDBaFQIwWMKehg51Qetf9ZCIn/Q6NycfuJkJjgTh7lp5JVmVSBtb6/1ie3Tq48EHNQc5uhHdx9HEZXJ4u+NmkmAZmJGQoISZ0pICKAE8JC27kheOtugUd//cGoS4ayz2a4X0iNo1Z1Oqzg8N2UlAJenv2A95DCjibbZtuS5sIHmeerFNZ22g4h11fxnwRNm5NibfUaMQz/ZOaAa27E5LZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+wYf8fs3PHZMfh3+CPz7QxsWi5SxZu4saf1DqlCJFk=;
 b=uE+cF7aB3StOFr4FbA3+YfjR1A1spuOHllrBnT+JyFOC4Mw/lH6ftZhN9OPW6FoHOIA/YO4T4dAX5U6TQixmkqVqflbihuvhpZ77NPdI7gKPB4hBx+zurw03sZoMqbAdQwrplzNMCm7DnBndBZiEZ/F/WVCwQdYQhccraUcbbfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM5PR0801MB2018.eurprd08.prod.outlook.com (2603:10a6:203:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 17:50:16 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%5]) with mapi id 15.20.4801.020; Thu, 23 Dec 2021
 17:50:15 +0000
Message-ID: <ec50682f-a421-797c-a436-085f00ccda35@virtuozzo.com>
Date: Thu, 23 Dec 2021 20:50:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] iotests/MRCE: Write data to source
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211223165308.103793-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211223165308.103793-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4238d8a-1f5b-4dba-aacd-08d9c63cad1c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2018:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0801MB201875BE9F6E7D032018DA8CC17E9@AM5PR0801MB2018.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Edb3aE/RSfosRQ7KaNkiVcQwMI61vdGcXFumugrvjHIU3MbRxGJjQIVUw0D7rXc0/Qizh9bZqon0CHAu8ApGI0M9NOpiljs76SQy4WjA/b3HtX6D88iE+CyMiC2cOcSB6tVNDaK/sBytAEolPubWpomSTs+wdpNd834CcBBTLLf/84q2RcWXKkGqoVnB8fZoYm/HArYiByWs+AtWdRMx+NEFtFSNPqFYWSqIvRwaQ091ClnarXGhqY27u6vKiRRD01g2siL4TUSYEQqx1O747z1DkHtYydsuwEzUCRUJzMU5MMSP8idHTX+xFcTMZQjnvdGCqJr05t5K7U//a8N5bG6uM/kmOVVB0V9mrEgv/UKSRvh1qyYWSi8WBHfLEOMGsJmaQKxpOtt3Kf3H9dCl9ljFsCmNc1CN8nW/itBaiLyRQdA1FvaTI9gEciNTEo6v8OFyYrUz+hi9oC8xOUH0HEauiyknNB1d3ped7LKkvNjQGOQty++2FDEXQFJwoQu7gF7Cch+mtCaPx0bst3qM7XloblfigvEenE4y2LM0R8PglCV65RIriTqE/a5NupqQfYM6WOIhGOZCB08Fp0/SkwsXo7Jg/7vZzdzisEUPb7LYYNVM/l+DYtubJDPZwy4Utp+hPuoUGpT5xmM/EIxIPywaB6I94tnJ0ruce5mbuweQKY9GbwbHPcK3HHkrrnBIkBU8ETcpHu7evRi+e3wnEoSo7L2gjClKM1lRa9wtaaoZQZjvpS+24A15PWx3CMhz8/CkxN0Ob38FxjunzXBztw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(186003)(86362001)(5660300002)(36756003)(8936002)(2616005)(31686004)(6486002)(316002)(6512007)(66556008)(83380400001)(31696002)(52116002)(2906002)(38100700002)(66946007)(508600001)(8676002)(26005)(38350700002)(4326008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNOOVBHSnUybmk2QnJWNGFCZ253UjlsNGJCWk02U0RMUzdmQ1ptRG5iTDFY?=
 =?utf-8?B?M21HM0JkTEFNTmRLNnROZ2hlellTcUZaaUFUdGt4dlJCZWVuK3IwZWpYdTVS?=
 =?utf-8?B?MjBvUEJwNjk4ZVA4dkd5MG50NXJhS2FmZHFsT1RGb0dKTHROaHlxYitPQW1F?=
 =?utf-8?B?Y2lNL0VjZ1RJWGtlWmRLZGxMOXkxdVE3Nmphc1kvcnhibmhDWWt1YVR0VDJl?=
 =?utf-8?B?bDIrME9mdGtqRW05UkZiS2YzR0Y0aWs4YTBxMjFteHJkVFNIakNNb1k4ZEpT?=
 =?utf-8?B?elRPWW05NUh6ZU9wWWY5WXFibndQSSt5MGZiY1JwTnlGd2Y1T3lOL2hEOVhS?=
 =?utf-8?B?d0ZZcjIvRVlwU2pTQlg3eStDaGk3MnhVaW5nRFdtZWErYlNjVE9WcTJFd0hP?=
 =?utf-8?B?SDdXYjYyalo4S0QyUEpTUThjQVY0QUMxK2hUVzVISmphQTdJZTV4bVJuYkVI?=
 =?utf-8?B?ekh0WE44VXRPcHhLZDNHYk9TdDUvbGxoUVdXL3ZzY3A4eC9UNWphc0krd1JS?=
 =?utf-8?B?bEltOWs3MW1CdGRJNk8ya2t5cFI0a2cyTEIzSWRwSG9LSXJXVDR2amZZd0pa?=
 =?utf-8?B?VU1HK3JSTTQvQU9pQ2hBWDJRWDhVNjlEOVRTNi93YU4xSHBCT0xVd080eEFr?=
 =?utf-8?B?N3A0NW9DYlZQajU3VVBOYThZY0FNUjhabDhFdHBISmpJamdLaVh6ZFRCZ0pz?=
 =?utf-8?B?OXVGeStJQ0xBR0pDdFdhcTF4TUFyR1NxaDNMRnRkalcwUDhVOXlIM1RpbUls?=
 =?utf-8?B?Sys1amJXNnNNeVZvODJ1VlRGQ1Q5ejZzYk15Q1BDK1BtRkxFNlhyQnR1Snd5?=
 =?utf-8?B?d3lIQUNnT25nZjlyZ1N2YTluK0tBV2pXazJGek03aWhXb0ZzVEdKTzV0ZkFD?=
 =?utf-8?B?elhIWkI2ZmN3UUZuYUVLRnNsemdjRU9nVGVDUnJ4dllTM0dwOU1Yd2hMTk42?=
 =?utf-8?B?dEpMVVFKejdtWHBMMlFBeDFHQUZOVFRYVHZyM3ROazFRMDM0V0tHdkRTb3dJ?=
 =?utf-8?B?c0xkWnJqaWduNWVmbDdIUVg5Q1FNdHE3SzkrV1QrTXI5NHhGRlhPRjFqRUhL?=
 =?utf-8?B?M0VleklwL1NtVlN2ZjdDVW84Sm1najZ2RjNDaWlPdkY4bVl5SUlTMUNnaDUz?=
 =?utf-8?B?c1QvQmQxdTdKaHhwY2UwNzJOMHFnb0dyUkwwckZMb3BIUXowakh4T1E5a3BP?=
 =?utf-8?B?MWJuaVQ2TEx2WDJJaXN6cGNLRE1HRnI1UEVvQ25ndGtYcy8raUFDSjhoVFRi?=
 =?utf-8?B?Zm9KT09vVjlUaFVRWXBoMnE0L3IraU5yaTIycmZwWm52eTl6cnRhTFVOOHFU?=
 =?utf-8?B?bStSYXlhUklmZCttcFVjNEFPcXd3Q2dJLzhPbnBQK0lxVlg5VVhwbFFMblh1?=
 =?utf-8?B?Uy9lR1pMdmdpV0pWLzFXaCtXTm5XV2p5VGRYTHVUUHN0K3RGaysrNXZ6cStj?=
 =?utf-8?B?aEtRaisrL3R5L2d4enhHaFBTd2YvWlB5UDVBbitTaWovdzVHcnpLUU4rNWJP?=
 =?utf-8?B?NmNOMHVrS25VdTdtbDV1UDNjaDZrWTBaZFB1ajVUUStPVUNta1FmSUtraThW?=
 =?utf-8?B?aTdUL3MzV2xXM08yM0Z6ODFJdFROQ1M4STFlSUhhS0djT3Z3OHBXbHJzNE5P?=
 =?utf-8?B?ZnNWZUUrdXEvb3lFRzVnekQ1bmJmRXFLM3YwSjc4LzVqeGh6V1F6TXE0Sld6?=
 =?utf-8?B?bHhvRmRDelZqQy9kNmdXRFUvYjJKY1A2TlB1NU16clEwR0hrWHZRTE1aTlNp?=
 =?utf-8?B?eWpzb055VlRFQ3lOS3I2RGRKTFVzalhXdmVyd01vSy9GRkZkVHVsYUxER21J?=
 =?utf-8?B?VGppSDd0THdSQllUeW5Dd3dNWnI3WVJtTEIvNlZidDBTcTcvdFBnL3JacDFt?=
 =?utf-8?B?SGVSMGFGZkpUMVR4d1loVGZTYTlFSUY3TjJvMzFQQy9GUDN6TTU4czZTYktS?=
 =?utf-8?B?dGxpTm1ZYmorK1N3RXFKcEVqTmp1b2hhOHFZYmN1VjBCQWJYanVObXhGTFpa?=
 =?utf-8?B?VDBPRnVVYnlsSzVRazUvL09HdGhHME9YUlNJa2dxVFZxUHh3V2NmRG5OcXBN?=
 =?utf-8?B?a0Nza280aXF4cUdBelF0aHVYMk5tTko1dUFSMUw5R1k2REJVVnVyb0hHd2VD?=
 =?utf-8?B?Y0NSMU9rQ2hNaFdDd1NnMWFzVzl6NEpuZTYvSzNkd3ptU0ZwbGNiQ0ZaT0Jn?=
 =?utf-8?B?amhpMGJwN1JidUY3T1p6Ym9oSDJpN3BkZGtRQ1hGSVRRQ3huVlBFWlV1aHRt?=
 =?utf-8?B?b0JkbEloY1BRY2h3NXE5Ulc3endRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4238d8a-1f5b-4dba-aacd-08d9c63cad1c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:50:15.8253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9xcynqdXpxoFrVg/uhRYbSFxm1+1fwxbLjQcSF/TLNKYyrmBxcGIrm2FqW7xK7q2tL1kPBLhuqzj1JrM5HxSJgYogDj42RheJlH2yDz/Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2018
Received-SPF: pass client-ip=40.107.20.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

23.12.2021 19:53, Hanna Reitz wrote:
> This test assumes that mirror flushes the source when entering the READY
> state, and that the format level will pass that flush on to the protocol
> level (where we intercept it with blkdebug).
> 
> However, apparently that does not happen when using a VMDK image with
> zeroed_grain=on, which actually is the default set by testenv.py.  Right
> now, Python tests ignore IMGOPTS, though, so this has no effect; but
> Vladimir has a series that will change this, so we need to fix this test
> before that series lands.
> 
> We can fix it by writing data to the source before we start the mirror
> job; apparently that makes the (VMDK) format layer change its mind and
> pass on the pre-READY flush to the protocol level, so the test passes
> again.  (I presume, without any data written, mirror just does a 64M
> zero write on the target, which VMDK with zeroed_grain=on basically just
> ignores.)
> 
> Without this, we do not get a flush, and so blkdebug only sees a single
> flush at the end of the job instead of two, and therefore does not
> inject an error, which makes the block job complete instead of raising
> an error.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Hmm, relying on flush requests sequence doesn't seem reliable..
Maybe, it's better to insert blockdev-add filter after JOB_READY? blockdev-reopen should work now for "file" link changing.

> ---
> As hinted at above, I think this should be merged before Vladimir's
> "iotests: support zstd" series, or said test fails for me with VMDK.
> (At least on one system, not the other...  Would be too easy otherwise,
> obviously.)
> ---
>   tests/qemu-iotests/tests/mirror-ready-cancel-error | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
> index f2dc88881f..770ffca379 100755
> --- a/tests/qemu-iotests/tests/mirror-ready-cancel-error
> +++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
> @@ -36,6 +36,11 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
>           assert iotests.qemu_img_create('-f', iotests.imgfmt, target,
>                                          str(image_size)) == 0
>   
> +        # Ensure that mirror will copy something before READY so the
> +        # target format layer will forward the pre-READY flush to its
> +        # file child
> +        assert iotests.qemu_io_silent('-c', 'write -P 1 0 64k', source) == 0
> +
>           self.vm = iotests.VM()
>           self.vm.launch()
>   
> @@ -97,7 +102,7 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
>           # Write something so will not leave the job immediately, but
>           # flush first (which will fail, thanks to blkdebug)
>           res = self.vm.qmp('human-monitor-command',
> -                          command_line='qemu-io mirror-top "write 0 64k"')
> +                          command_line='qemu-io mirror-top "write -P 2 0 64k"')
>           self.assert_qmp(res, 'return', '')
>   
>           # Drain status change events
> 


-- 
Best regards,
Vladimir

