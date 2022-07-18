Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5310577E81
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:19:59 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMv0-0000GQ-Hg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oDMqy-0003bL-DG; Mon, 18 Jul 2022 05:15:49 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:23875 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oDMqu-00068W-VX; Mon, 18 Jul 2022 05:15:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkXoju7+c+z9lqLZ4Hh2JS9lX1KpYZbYV9+RZdr/5zOgvm4wFTQNwiAWNbL3XaMZhwto96V730CwkudDZpKIlPxYM1+GyIF9ktLQzBB4BGbRDBnN3I6tf//sSWl1fvZ18Ws3XEKxq+6rNoYYM9ILb66s7JZbBgpCWwxirO/EHhxvkVTwdKRv94K/Oz5hNIvGHhLU7/mHcpsK5dbdUWUCID5jOuZq7YG6kJpVqXldPbEy38kXH7QR9SEyMY3qFLD/fCPLbCa2Yy7LnUQgFfK7T8hfvnE5dFlBRgIVi0bBTH+nkJ0+w8yrMJup2MFczhtNCXrvN6axo91+QG2nN61cpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62ftNA7k69RFlBHlQJL+S5uSUX4Cnng9Q9x25BmMcJU=;
 b=RcB5VpQSIINzz0B71hsSn4C5INvlCMSrlapt0lRdLARxZTQu3hKTTRFP5oLaVe3wJEGX+twoEPN28X0NEGhwydH6I9e0ANYPd3afNQDCG/IrEPHEOVS/sTaWsrFkGlqbEhLuvqI9dTS/n1J4Mt82vb0cB0zgDADxq7VXNkcNQeIvfXdsTtGkofEpFlshkTjOqQF1oBMochZ6b4quaiIBJBMGOHoOkpfYZIuQiul/4yrWZ3pQkLgn5HcC32ESkdnVR5LGL/1oXTCxAUx0YJWsWFXVK12wtq5Hq4KyaWCTAaiPDD50Ybg8sJ+5V8RjYtZ9oomcEcCU7bPcAQaSbq6BTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62ftNA7k69RFlBHlQJL+S5uSUX4Cnng9Q9x25BmMcJU=;
 b=rVrpgfA4sStBcuAdRIiFOvhZ06LApLNyyG20MWYouVPQNmAeYGczpO+BzyQfXgRfRZEd7LZSugFp7QVzUBJ4yUKxEvlogNYrjHDN3Zm1fkV45jBwYqyt1Cs3iGzuvAKyH2YQueLXSQ9WEtiFlMfEoglwDbhEkTPHNIDheywZII4L6P2KfCg3dTaodKxyQfVWLnscx/+sIo6Hy9Qzpi/NyMl86DQ0LFxpo4knAV90fGAf0lSEd8CNNepndhPxb8f0Q67oOkjT+KQ0WSw0EUce7lShf3ER3z32JbVQADR1JzJoIlOwb3GdgqFPZ0yci/4clzL0xO3kxIU278JZzi//vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DBBPR08MB5222.eurprd08.prod.outlook.com (2603:10a6:10:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 09:15:35 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:15:35 +0000
Message-ID: <481be6cf-1c31-0736-4bd7-9a77859390d2@virtuozzo.com>
Date: Mon, 18 Jul 2022 11:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] iotests/131: Add parallels regression test
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220714132801.72464-1-hreitz@redhat.com>
 <20220714132801.72464-3-hreitz@redhat.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220714132801.72464-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::33) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4766f45-9ad9-496a-1e29-08da689e12c5
X-MS-TrafficTypeDiagnostic: DBBPR08MB5222:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEpj2EreRrDUE3NlYIuYT+hKbfPNnLHPVifyDN/wwsVbcPaKIhDL2+XsKn5cD4dMp5A4YHpaxaHaQ1348dtGHEpmSmg68X34bEYVOXz9jas0ukqNZAf5c0p22g4Ux6/CVsRcyqkZWYFm1jCI1rAO48DiG8kH/Kwt5p/9rFLkWBtIrm5RZqiiojYZsvZxuEp5CJLZdAgjXBtGomqRzF3QK0jdYAeWGieB3JooGO6dzTxNUXDOytEpFO9JPS5SL4u81gda6Uf/4Y0fn1gi45Xxp9C1dTnp7NZleckwriEDJ2+inV7q+Bm5arys1cKtrHn8pOdW7Zbh4j1MeJclCQ4te2mYI8qFQ8EUMpiruS0wLzIDDkVbsINHxl1UYvCvE1yyTPFWX75JLs47xCEEuD0E918ixSNyQ1cYZnPuks38Iv2mzC24ZnQ9lmIzaSl5Xf1YEwG2CrS48tZ/R0u1CHY1O0HM4XXdy6xkQwD8xkghEA0HogZbqzA0KYI/Efi6+mOVC4WcGGuuQhxqmWRTkjce8g8JbyQzQPAgCR59HouT/0r1tz4Gp5MQ13tObRir4kUngLQGEmRFA7z1goxjGxOLyLEAe5/RkiSjvdSGQdBiSSqWAxU7LUldciS4usQY3P5H0OM6B8vbtZmkU7dyPXbCyWx3OxX1Ncy6XkHT3qaOCpGcvlm/P2UQMy/yRxgtOuGz/m9Uurg6NyMEcavzr2JbYkK4PxNxB4U2QVzmBAYZGyCsbs3tl3Lg2WDh+e8bYdNiGotJuo1ekg0bGwiH24cYbeaLwxjYYxHFfKKlKfj1ihUL9+khGCqd0/2oumxsFpDMNeyg4SGNIQCHn7yCQLbMJGzszazdk1PBSm6u8DW+9TOsxP5KRGsi4x3uCj29mXxDOYxLKAMmW4E8ZA23N+jxKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39840400004)(136003)(346002)(366004)(396003)(376002)(2616005)(186003)(31686004)(83380400001)(26005)(41300700001)(5660300002)(6486002)(6512007)(2906002)(478600001)(38100700002)(31696002)(8676002)(4326008)(66476007)(66556008)(66946007)(8936002)(38350700002)(86362001)(54906003)(53546011)(316002)(52116002)(36756003)(6506007)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFVPMkE2WlpBc3EzQngwVUMwMVBaTWxLYVBPVjN6UFZ2cU9yUjgrUlNxdTIx?=
 =?utf-8?B?Zno0VGc4TnZsSnRTWE13NCtSS2h4Wm9yL1luYVNuRElMTGpwd0F6OHNDd2JX?=
 =?utf-8?B?aXQ3TFo1YmpjdnJVcVVndUdRR080bHFBNXhzWVZzcHZsbGMvZkhtcjk0bk9t?=
 =?utf-8?B?SkxMMWdqOWlXVVpqbzB3dHh5VDg2VHA5aHh6WW1xZGpGSlRQc3U1emFIekVT?=
 =?utf-8?B?bmI3ZTRtQzk0U015ZlAvb2J5ZjhOS0F0K3Z2Y0lXV2krUU4vaGM3VjluL0JS?=
 =?utf-8?B?OG1qcUdsM1FXVHJ3WVpwM0h5a0NLQ0lWNzNwbjh6b04rV0tPNDNCSGl2NGVR?=
 =?utf-8?B?OWxZcUVpTUtjNUtWM1o4eHpnUmpqTnlWcUtJTVBYalNXdFFtUGpEU3FUTlRT?=
 =?utf-8?B?cW1BUWc2Sks4K2w1VGliejlEeWpPTHl4c0lCMUp1VFJhUmNORlcrdVdwbmRt?=
 =?utf-8?B?bzgySGFMZmlMdHJacC8rUlpMSkxvVVNhL0tmQWNKV0lLQnljbUc2WEZEaWxo?=
 =?utf-8?B?NWdJYnNaaENSb2p2Qkhacng2WHRsSG5yTVZtblk4ZjBhaWdRZTM4aVRwTUdl?=
 =?utf-8?B?bXA1WXFiemptWG5Sd2RYUi90d0Jwd1FvSGVOTmgyNmZ3QWNCcFJBWXV1N2Uy?=
 =?utf-8?B?TW9yLzY5TnBhV28yVXhZMFJ3UFp6ajZQeXFIZ3hHTlVSaGdEcVVybmF1dnV2?=
 =?utf-8?B?aUFQby9Wd3grZWJmMjdueEFPVDRDd3ZJeUZZQlM5anVlNWJ2ZWxDb2p0c0pW?=
 =?utf-8?B?SUovQ2ljaFlKRWoyUHR0dTh5YUtQbFhYUW9NSGpxRXdncXhwSWVrMGorbHIv?=
 =?utf-8?B?cDNNY1Zic1JUdzFaZTdmbk82TllIclNjVDFwbnkxeUhpSkdPeTB3NjZrUVdv?=
 =?utf-8?B?RzVETmxBM0Y2SFpjZEkwUWowWXYwK3BhY2t1RTE4dzBEemhDQkNtb3VaMVcv?=
 =?utf-8?B?TlNlS1VsWXJRd05VRzVVK0laYk9Id1VicHpRUmdrbko0VkhtdEk5Z285bmRa?=
 =?utf-8?B?TGhURU4vOUUxOHN0cGRIamxRa2RuZUxQSGg5WU00eDRLbXJhbWNYcmRkQlBQ?=
 =?utf-8?B?blNWY3EzVWpKbVF4aTFlME01ekNNUWRralR2QTN3Z1cyTDBzVmpZb0kweEhj?=
 =?utf-8?B?WmhLcVdmeTV2S3E2QlJpSk50MlY5bGsweFVoT0VIVGJYSU1ib1ZNR1lLb1J0?=
 =?utf-8?B?d1I3OE9ZV2gvb2tLeWE0dzhqbU9CM3RKMEduWHIyVnZLT2RvZUlvTkZVMnBE?=
 =?utf-8?B?LzVTaUN3aENaNllOU0J4ZTMxTGhydWc5bFhXSjVtUmkvaTVxRnNYSnphNkFQ?=
 =?utf-8?B?cUdJREhTMkNFZXdmNFVaSmYvbFA5bmdhRWlqMURsd1hrQUxGMlpmYnZqTUdE?=
 =?utf-8?B?c3RvWkowNVhiUHhKZlJiRGxETVJhMTljT21yUms4c29mRXp1dDNZdjV3Y1dC?=
 =?utf-8?B?cWM1VFpuOXhCWFR2cG1QQnZaaDFvOGpSZnJtRUdqSzJ0cGJKbHE3U2ZZK1FR?=
 =?utf-8?B?dElSQ0c0MU1FRmpncWo5dm5vMndMb1V5QUJoMDVranFXTkUvelBiTVBTZjVU?=
 =?utf-8?B?emg2V01KVlVvbVBNRVBuWmdxRXBzck42dGdyaGV4YS9ZcDVsZndkQUw5am94?=
 =?utf-8?B?d0dRN01ZZjNHQjI5RnFpMS8xK0ZaNTJUQ1Vvc0tsbFovaEhUTnNJcUhDc2lW?=
 =?utf-8?B?WW9VUU5XY2p1eTlwcGE5bjhGQU50OVEyQTAvbUxmbW5VMXkydjZFZXdTTUpP?=
 =?utf-8?B?M0ZiVitiL1BCNEtvMzJ5cVF2L2QzNTcvYmJMdDVmQXVaTmFiRHAzcjNhVUxG?=
 =?utf-8?B?WnhxQ3M0eno0aTNqWm5Mc1hwdHhWcG5na3dJVFFXVWkrWThXZXE0eWFRL0FV?=
 =?utf-8?B?M0R1TWVmSjZpUCtBaks5ZHZheFZLenh5Nnh1aDF5VVN4cXlhYXdDZi9raDJ5?=
 =?utf-8?B?ZnV3VkRYNUN0UVdOQk9jdStNTnp5ZlZwWTY0dE5BTjdTclhZd1pWWURVQVRh?=
 =?utf-8?B?d0lKdkxNcU1KSmpqVHhHM0NVYmZmNHVuUEZ4NVNlUmpRcWlNcSszdTRFcDZK?=
 =?utf-8?B?TjdhNkxzODZVQyt3QTM0VnlSZU1oZ2s1cEhqZFNDVGdCaHNPaW1FZFBrdEFV?=
 =?utf-8?Q?+obUmHTA4six+Zzlusnyoos0z?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4766f45-9ad9-496a-1e29-08da689e12c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:15:35.6313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMXAMGjssqOI299FAF9KkwVsCCejbQl1yo3PIkE4+NjE8EIDj9urjLcweMVXfywoIQslxQpcl/uIfsT5DdQGeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5222
Received-SPF: pass client-ip=40.107.7.97; envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

On 14.07.2022 15:28, Hanna Reitz wrote:
> Test an allocating write to a parallels image that has a backing node.
> Before HEAD^, doing so used to give me a failed assertion (when the
> backing node contains only `42` bytes; the results varies with the value
> chosen, for `0` bytes, for example, all I get is EIO).
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
>   tests/qemu-iotests/131.out | 13 +++++++++++++
>   2 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
> index d7456cae5b..a847692b4c 100755
> --- a/tests/qemu-iotests/131
> +++ b/tests/qemu-iotests/131
> @@ -43,7 +43,7 @@ _supported_os Linux
>   
>   inuse_offset=$((0x2c))
>   
> -size=64M
> +size=$((64 * 1024 * 1024))
>   CLUSTER_SIZE=64k
>   IMGFMT=parallels
>   _make_test_img $size
> @@ -70,6 +70,39 @@ _check_test_img
>   _check_test_img -r all
>   { $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
>   
> +echo "== allocate with backing =="
> +# Verify that allocating clusters works fine even when there is a backing image.
> +# Regression test for a bug where we would pass a buffer read from the backing
> +# node as a QEMUIOVector object, which could cause anything from I/O errors over
> +# assertion failures to invalid reads from memory.
> +
> +# Clear image
> +_make_test_img $size
> +# Create base image
> +TEST_IMG="$TEST_IMG.base" _make_test_img $size
> +
> +# Write some data to the base image (which would trigger an assertion failure if
> +# interpreted as a QEMUIOVector)
> +$QEMU_IO -c 'write -P 42 0 64k' "$TEST_IMG.base" | _filter_qemu_io
> +
> +# Parallels does not seem to support storing a backing filename in the image
> +# itself, so we need to build our backing chain on the command line
> +imgopts="driver=$IMGFMT,file.driver=$IMGPROTO,file.filename=$TEST_IMG"
> +imgopts+=",backing.driver=$IMGFMT"
> +imgopts+=",backing.file.driver=$IMGPROTO,backing.file.filename=$TEST_IMG.base"
> +
> +# Cause allocation in the top image
> +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
> +    $QEMU_IO --image-opts "$imgopts" -c 'write -P 1 0 64' | _filter_qemu_io
> +
> +# Verify
> +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
> +    $QEMU_IO --image-opts "$imgopts" \
> +    -c 'read -P 1 0 64' \
> +    -c "read -P 42 64 $((64 * 1024 - 64))" \
> +    -c "read -P 0 64k $((size - 64 * 1024))" \
> +    | _filter_qemu_io
> +
>   # success, all done
>   echo "*** done"
>   rm -f $seq.full
> diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
> index 70da03dee5..de5ef7a8f5 100644
> --- a/tests/qemu-iotests/131.out
> +++ b/tests/qemu-iotests/131.out
> @@ -37,4 +37,17 @@ Double checking the fixed image now...
>   No errors were found on the image.
>   read 65536/65536 bytes at offset 65536
>   64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +== allocate with backing ==
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
> +Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
> +wrote 65536/65536 bytes at offset 0
> +64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +wrote 64/64 bytes at offset 0
> +64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +read 64/64 bytes at offset 0
> +64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +read 65472/65472 bytes at offset 64
> +63.938 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +read 67043328/67043328 bytes at offset 65536
> +63.938 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   *** done
Reviewed-by: Denis V. Lunev <den@openvz.org>

