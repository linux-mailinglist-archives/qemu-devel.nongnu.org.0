Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA942C2566
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:11:25 +0100 (CET)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXAK-00046m-Ka
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khX7h-0002At-Vd; Tue, 24 Nov 2020 07:08:42 -0500
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khX7e-0006Ea-ME; Tue, 24 Nov 2020 07:08:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af3KqZ+Ty0a68c9QqomtWBEfALpltYWYfScf1Ap9Y5wGq1EaPLZE7KzwIVNdZh6YccXhxLwsknsVuYSFa28H3ZNin7VAmbD1EmZ1T8ZoxfDqYtVNEOy9cuXTgNOXAwwWImMc8L1gmrkY4tTfB3aQXVtWYuxa9gPCAwWaNlGppMskUswpkiQY2bz6h5nMgpOEZdvKGF91ealrK3ckO+dpRR8LPLRLZ58vM94UF3KHKERkBuRNemueD0jIw6YRo90hg6whE9IJ8RhLhEa4XVIhhCijfR4O9CYGS4RsdCcR82rYjxyy6TLbrrlhOJuXWoUUqKnrZhxWkw9miMaQ1qLy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ/bcwLy/Y3GCokaAhuE35xhNOmywMvpzEOcrJ6R2g8=;
 b=UCwFnSPD9YNiOb8i0RzAyloqdBAiFJ6uh7tR8aKzO809fr2UYVStUFXvSdNc3xgHXFrZYH8Yi7xqUfyKXjbKqlc9e2wyaKCXH4VzjhAn2xXIfLjvMpaDrJr3NnDSLh1nV+5YchTRJGCQoisf26rtHXd51/nDAeM+WGzoC7QGQRn/y6Ps3LWG47iYXWTzDxH6Yt62FufzSN+t2G0IZwM+3aRrm5baLY4ruc6XvYcMbcQr/U8zUgTvoAO9hzdM3JdMD8IN4Vx7AOJ8/C3y4to8nNw+rgtPD6OqO9LyoC9JQjm56EOxfTvXEApZ2GJsF71/F31huiFplr+A5sxLfFSvOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ/bcwLy/Y3GCokaAhuE35xhNOmywMvpzEOcrJ6R2g8=;
 b=a+HSh8DLUkNAhGfD7yND1++OuaN9EN/SRU6VEgCv7i8WakYD+1Ddp+mhVUa8M+RiYjJUtTBOpF61sUg0wcSDDmvfvxn3mWhshd0ovcx+vaF9nFegLok/SLn8Gx+8fUgdxcvboZbAyG2/r1inKth6KIdaAVWxSwx9MTN4vm3fCW8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0802MB2411.eurprd08.prod.outlook.com (2603:10a6:3:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 12:08:34 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3589.030; Tue, 24 Nov
 2020 12:08:33 +0000
Subject: Re: [PATCH v2 1/2] iotests: add another bash sleep command to 247
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
 <7fa343b4-cb87-cb64-956a-87c3a32f75cc@virtuozzo.com>
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <d22cf36e-0133-dfc6-0ae7-95e05a68ce04@virtuozzo.com>
Date: Tue, 24 Nov 2020 15:08:30 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <7fa343b4-cb87-cb64-956a-87c3a32f75cc@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: AM4PR07CA0012.eurprd07.prod.outlook.com
 (2603:10a6:205:1::25) To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 AM4PR07CA0012.eurprd07.prod.outlook.com (2603:10a6:205:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.9 via Frontend Transport; Tue, 24 Nov 2020 12:08:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 212dacdb-6428-436b-60aa-08d89071aa3a
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2411:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB24110779B3743F842231E5DAF4FB0@HE1PR0802MB2411.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GS/qKj1i9pKlwRaMoBzj9KmwEyDhyx9HZ28KW7eKI7mEEYicpBaixj8fcvfFRX2sE0gNY+WMTdWsjna6L5qH7RCpkDblnP089LYFsjTAfTelYCGa3A8IlpOgRD6XK5wQQgZY6LKUOO5MZmIJhKxLTh/qbBtzNdxc+J48njCxSCr5INR5MURbtrT/6gQ/yd8KkWWZu4p7K1c9uM0kD1T6Afr5iTWIfHtL/UcT9jIcstBvMYWchG5d9PE3q6WK6kE0CdyJDAgCpOvFta0jF+R4ZShjkK7ifkFxQTKkfybZT+e1Y/ypay9C3EEtP+n87uXSBE+BfKeQlbGDQWpMu1EEXJsDf29r+qU1Jf+orGapTPk79Tc/kh0Ue71l+XEc9tcq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39840400004)(136003)(366004)(2616005)(2906002)(8676002)(956004)(44832011)(107886003)(36756003)(5660300002)(86362001)(66556008)(66476007)(31696002)(66946007)(4326008)(316002)(31686004)(8936002)(26005)(83380400001)(16526019)(186003)(6506007)(6512007)(478600001)(53546011)(52116002)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: C52TWcQwFnz9UOha1A46Val3cozDO2rXG/fkRbBlb8s550Oowj65e/mODTdfraDV04F4vT73ZCWJ9YbggAZam2+OgN3yQI/FfNnrw0hVWdETm/kzYuYJHxFuUZEKgEFiK8fRNHSzhBWKzuhD+fHaeFK6weDEaezsSMOoQIER/DAMfCOIVL3kydE1yVF/jXysYNlZgkfw8ipapmNesGqnVzjV5eWcHfpuTdKCVawaTmbN4esEQ/mv3dtMNvBQeHkBA5Y9Vf+tyBkgFvE8mgdJA7t40xKWP8xPtLULj01t7U1lowADvbaln1RG8hGO+hdGam9qDc6ir6+reRZ1ukbuJbFGM/YrdlWOpBQeMf7cYOgFYhrqpTYR/XQqKNPN9CDAcitv3M7QXttAahWiRqaTwoPetZJW+4Xehb6J7A33l0Wf8No5/na7WzujakyyKKIOx/WdtLX2SAJC42jWZLhk3E6wjyx3rKBcLGrHQHLTTAxaTQZJGeCXUoJOvjmHPeTbWYhX6K/SGoe/9zEOzDEn+FG0XqMzK8fbiVuIY5JOO7x7M2uMNmbzsoKL2QDYYi8QE1N3qOsAOOkhyt/7ia1+5gHfFFheo5NtlpI6UDrSxbz21ML+unOj0/cUP+HIcFLXudDPbXG7YvgQZvgGYehRk88QqiNhrVjk/D2iftXd7j+sgPDYf7/hWANUhl17Mra9rf66lBvdRz76HM5mOm0k3ve42b5SwWIA8FLxiCAp2Ylw3PqZLZVwyfz7f/qofmIUK0WS2K4h5rQAl4WcUjHOLdjZXOIggbc1X5VhDh3ZSk2+l2L5K0OKlgOfH6zMRFRk0mdDfURd/5iXmd3PLxRt/fmA+4V2EgNEAdz/sgChpTWf5xh7nUr6g52pdDC/sN7H95gepqHiATLhfpJ0URy5Kw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212dacdb-6428-436b-60aa-08d89071aa3a
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 12:08:33.7250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0dKIhbpXAjFzvw1kKDTbqoGF/46cdaQVKyT+258wYZnxPY4caVdKNMZ3hXsHIA5PCJKCSnqK5U44S4xk8b+MZsZQ9eBlA4Gvo/ZSbp5jq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2411
Received-SPF: pass client-ip=40.107.21.104;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 24.11.2020 13:04, Vladimir Sementsov-Ogievskiy wrote:
> 23.11.2020 18:44, Andrey Shinkevich wrote:
>> This patch paves the way for the one that follows. The following patch
>> makes the QMP monitor to read up to 4K from stdin at once. That results
>> in running the bash 'sleep' command before the _qemu_proc_exec() starts
> 
> But how? Before _qemu_proc_exec() starts, qemu monitor is not runnning,
> and its new behavior can't influence..
> 

I am not a bash expert to explain 'how' but this workaround works. It's 
just a test. Maybe other colleagues can say.

> If bash subshell work in unpredictable way, may be better is refactor test
> to send commands one by one with help of _send_qemu_cmd. Then sleep will
> be natively executed between sending commands.
> 

Or maybe write a similar test case in Python if Kevin agrees.

>> in subshell. Another 'sleep' command with an unobtrusive 'query-status'
>> plays as a workaround.
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/247     | 2 ++
>>   tests/qemu-iotests/247.out | 1 +
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
>> index 87e37b3..7d316ec 100755
>> --- a/tests/qemu-iotests/247
>> +++ b/tests/qemu-iotests/247
>> @@ -59,6 +59,8 @@ TEST_IMG="$TEST_IMG.4" _make_test_img $size
>>   {"execute":"block-commit",
>>    "arguments":{"device":"format-4", "top-node": "format-2", 
>> "base-node":"format-0", "job-id":"job0"}}
>>   EOF
>> +sleep 1
>> +echo '{"execute":"query-status"}'
>>   if [ "${VALGRIND_QEMU}" == "y" ]; then
>>       sleep 10
>>   else
>> diff --git a/tests/qemu-iotests/247.out b/tests/qemu-iotests/247.out
>> index e909e83..13d9547 100644
>> --- a/tests/qemu-iotests/247.out
>> +++ b/tests/qemu-iotests/247.out
>> @@ -17,6 +17,7 @@ QMP_VERSION
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, 
>> "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 
>> 134217728, "offset": 134217728, "speed": 0, "type": "commit"}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, 
>> "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": 
>> "job0"}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, 
>> "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
>> +{"return": {"status": "running", "singlestep": false, "running": true}}
>>   {"return": {}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, 
>> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>>   *** done
>>
> 
> 

