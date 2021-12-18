Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7667479AB5
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 13:25:22 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYm9-0000Fr-Q8
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 07:25:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYl6-0007D0-M8; Sat, 18 Dec 2021 07:24:16 -0500
Received: from [2a01:111:f400:fe07::71a] (port=52317
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYl4-0007p7-AM; Sat, 18 Dec 2021 07:24:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk1rkWWDu//msz+6FxKkLxIdCOBlteCYdhCZuTCcUBefY57o6bfArijqLy0ZyBt73Wx4qQLlWAzACjykDxR8zm8wt+gk2McPoDGL6LT/f8+6zlVXu8bQLUY/gjkyS3dBpI7d6UXkVJMblDVOg83ekkMEbd/HRCpBqaTRFWsBPY8zOi39xQ3qKwnRwPTxSdA2IL/yiM223/molBR2zZOTWjtzzhBox/H3yrFCGBWNoUUWcp0+yvum6USWVkYNyd5A2LVLYkshFwNulmgO1a8EJN0AoYEFUljWtnvQMFSzPDJfb7MIuhXKTJvXdoAkriwleR7Q+Xu/u6IVUJ5/NVjPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfAxIKTZt1X8xUIwY6USsCxDgtwFupjwKrkbRUeij3c=;
 b=j2gJXgGSDQiBLom8WhSoeKnrT0v4e/vkp4b0nky068lCuKFgJS4PWVVT/scqOlh0CPLIqxe/WRaKoRfwWtmb4qHa9aJDPu68BxWqck/AMlYW/8Q3aP7uJcotQ0OqrP5I5s9RZKjZQzqkQxsff1aI0lO/2zMV7z/oS7bqdZhF7KyFaaJsKHBz1RG78fDlt2IVkLHDEquNBhmmr4IHlMuqRigd+KiRLNLIABq7W67ottQEV1qhFun1Ym0nUejy/xvN1yrTdVZyOAUm6OC/DcLESvzvPCkiZnkiOoN05K+05gGf8YHRHCu3oVHhDVThqf+U+s9qSBKsbbgu4S+XuxgDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfAxIKTZt1X8xUIwY6USsCxDgtwFupjwKrkbRUeij3c=;
 b=eSg/94KFuf+3kqKZB0/i9ep2owz6eBAwnJVQUltukw2h3K5Ml/LY3xcUjlYEdEuTuNkWQbCdnMiiwDLoRPk2J83n/5bQDCYsEiGl1f3pyLhUhtqnjQVGLl23eHOGdvEbrXK37DKLTLcpl0mrh8GdKVl+EACLSgIYiOCEWD/TGIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4435.eurprd08.prod.outlook.com (2603:10a6:208:144::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Sat, 18 Dec
 2021 12:24:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 12:24:11 +0000
Message-ID: <6a0523e4-58d2-ba43-f6d9-f5ff9b616549@virtuozzo.com>
Date: Sat, 18 Dec 2021 15:24:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 14/14] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-15-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104145334.1346363-15-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 12:24:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f40b092-3c41-46cb-822f-08d9c2214c03
X-MS-TrafficTypeDiagnostic: AM0PR08MB4435:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4435DB85438F2B4282159CEBC1799@AM0PR08MB4435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:287;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8s7ngYbPtcA+usIV2TRbXX+WcJhr1xDkLMNXkYa2WbErJsM7r72GwWprWBF6Wy0Eg2i934xnveavnaqJ7eKI+UqoTK/poelb5xUzVNNykz9vBCaXE7TAL9s3TX+PH6IxeTPdPAn5GxtUnDC3VUtAvgiLsqw22k0VYCWd+qBiFF2j4ROFyaMCSxBKlW6TjjLARGQedxTWbcKHKGSx0ioYDQfbwRAfUXZdSuhm3oMDsFiNIqDNTup+Y+bU/OVdsZkTaharo63dY981Rv1OwODSCJpX4rUAbeDuEFtHqEK5Tuh9W1nQQntghV844aAcOGDIgwbDDHYqmqq2MRucoHF0jwbhmJLtckpDHXgEc/4Prhjvm0ghw1375UBe/jTYGe3ZfIklzkgJ4AEY9k9+zk3xUSxZ6W92eN/JfrO0KUAGXMLkO99KQPL9RYQ2s0BnjGye7c1kq44P14Et3RbytImqxReubv4WtAgn9MCXQ7eZ2AZYx0jtAGk9j55aR/LVf6mCbiwDGIKGDSXtQTJV6qReOK6qCYClss2V/iR8A3CeKl3gJ9I7FSEhSkNwopuPADaYN13rfjwE6e41n1f24jQscxjmAL6FzSLnSWeF9/kP18DaQYlBFcfpuXoWk9hVHIgipg87vjwCymh1snETwBEZI3ftpz5bYBjH2/n2vANM675j8dczvS1N3zJaEh2qBaIQtHZhEN6+G2fM43rjzFjxfZfaEX28SytSaO8klvV1/mY4cshfk3hRBb7fcffvOrLQMFoeKJJu9ofKdQPW1KHYKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(36756003)(2906002)(2616005)(26005)(8676002)(38100700002)(4744005)(956004)(8936002)(316002)(54906003)(186003)(16576012)(5660300002)(83380400001)(66946007)(508600001)(31686004)(86362001)(66476007)(66556008)(7416002)(52116002)(4326008)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1huVHh6amR1a25pTFJwS3U1ZThOcjVuTjQ4TG5WZmw2UjhFNTVSZjYwZHFJ?=
 =?utf-8?B?NUlKY2pBMjA5V1NjNTdnZjJYOUNVRk9NRTV2SEllTU1TN3ZpZDRXKzhjM0pQ?=
 =?utf-8?B?dUc1Z0g3NEtpVGxxNzJ4RytERHZXai9ZOUVtNWJZdkx5UDVMZW9OYUVYTU5t?=
 =?utf-8?B?RFhjanEvV3BaelZjTHVVMktqTnlzVXRmVU1MQUpXUm4vUXlqVkg5S1pWOTFh?=
 =?utf-8?B?dXllTmZLT0dFRlozQ2VlOCtOMGU1QndQSk5sRTl1ZzV2Vm82NjZ2T1pMSDBl?=
 =?utf-8?B?UVhiSXFzRjRkeXRkNG1hNm56YjVjODNLcG9Ma1pOU09IOEhLeWxlekpWbVdT?=
 =?utf-8?B?NTVXRlJuYVZBSGplTmZEWURpUW1WNFVqaFQyRFRYY290MzMzaFF4RUZMdG1I?=
 =?utf-8?B?dktSSm93ZUdJQXdMRFFaN1hTcko4TVMrb0JrWEpXb2ZpRm5FR3FjQjhjREM2?=
 =?utf-8?B?dEJyY3p0Ynl4YlJiU3Y0bG1KNmZwb2RDc1puZlk3RDFrRExod3FvZk9aRGc4?=
 =?utf-8?B?UENsemFiUkZqeGd6ZFZDb3htajZONmR6MzNSN3YrVG1LSmp3eVdHcnVvUHZQ?=
 =?utf-8?B?eFJvK251V09iM1NGTjIvc0RvYjdnaWZuZitheGpDUjkwUS9OTlcrcHkrMUdk?=
 =?utf-8?B?RURYdi82Wm9RNVRJS3pBOHNSTnZxUXA2L1lRZ2FuL3JJWmZ4NWhPTzVBd3hk?=
 =?utf-8?B?eERlN043cUlaTzdlMERPRnlZV2FENS80OWRPaTFvTmZTMWZFcHprVFhsRTZk?=
 =?utf-8?B?Vk1LN0thNzZoVHM3aU14NnNRRjJRNENoTngyeFptakpaQmpMaldqbW1qY1FR?=
 =?utf-8?B?RWw0ekZJOE9VQy9JMlNyUUxhUlhuZlQxZ0NaWmVUQk0wNWFuOXhnd0VUVi9i?=
 =?utf-8?B?VFBFMldaUFVCTXAraFBHV3g3SXpSeDhpaTN1NkdTSm91Y0NBMVZUYTgvOWNT?=
 =?utf-8?B?TnVRdDRyTTJmVHB5VlZucHMxcnlwcFVIQzBCSUlnMi8rRURab1JNcVVKWXpx?=
 =?utf-8?B?a1lJakxoSlp2blRaaWRtRnBtamdDMjBwK3BkblJWNkE0Wlg3NXcxYlprUU9O?=
 =?utf-8?B?NFdBdDRxNERhaEUrbFdYQ1FzejNFemlBU0R1NnEzWUEzT0hYb0ZFandBaHEr?=
 =?utf-8?B?TTR0cm9lcGRhS0tTVFBHY0s5VFdBQ1A3OHZML0t0ZHhycGw3NitRcS9BeWdh?=
 =?utf-8?B?Rno4RTBBaENCOVdxcUlJbXVwVUM2U3k3TXh2VTZjN0k0dnBPNVRIVG5qaGov?=
 =?utf-8?B?S3FQYm9VdHpJTVdlZ3Y2VEhOaVVUK1o2TGltb3M5eHdkdy95eWFOc1diTnZG?=
 =?utf-8?B?dzVybWxtZGZ0NWhtVUdSZ0RFV09weHJnZFd4Z0Z6RVpCQS9Wczd6MytFUlkw?=
 =?utf-8?B?bDA3VFduZ0c0VTNHZ1U2QzR2aGM3Rkxtd3RHUjh5eWNwejdqNy9YNExxMm9Y?=
 =?utf-8?B?bmhvbTJSWVYwRzltRGxpeEsrTVdVOVNLNm5KdHE1U1AvZzJNUWlFSHFPektr?=
 =?utf-8?B?WjQ1dXUzYW9SVHd1a21PUUVMRFFubzNuUEZ3OXRxaERPbnZ6NmdZQ0RkbEhJ?=
 =?utf-8?B?VjBPTjY1RitRdXdPaTNnY1I2bHNERzhhUlpxM2MxaW1HVElaK2pORUFTM0gx?=
 =?utf-8?B?YnExQXExUEt3Z3lER092YXRRcjNlR2lkSzAzVkMxbEZxT3E1Y0N6RGNMS0tu?=
 =?utf-8?B?Q2s2aU1XazExOVhaQjMxYnNrVUZzL0U5Q0hLc2IwMzZhUDRNWks2Y1AvcjZN?=
 =?utf-8?B?blYwUTk5WXBaWmFNOVZrMWxyZG5qeWdTUHNmTjd3enc5Q0ZnTW5VTXFNMUFD?=
 =?utf-8?B?VmwyTXBYYWtHRGFsZFd2UWVENGVrbFVhK2hQZ2RQTFpkR1JQZk1WODNVQ29z?=
 =?utf-8?B?NVFvZkJqL0JwRXlIaFU1WXVFVHk1S0ZmMHdibDM5bGVYdjhHR1g5SXhiUzV4?=
 =?utf-8?B?UnJlV3FQcmxWWFlmay9qNEFDbGN5b25TYjFxT3RvVmdIUjN4N2Y0WWtvY2FX?=
 =?utf-8?B?b21CVXJMdE9SaHBsSEhIRzZYamcrUTNvVDNBQVBsc2RFMC9jbWxydE9rUEwy?=
 =?utf-8?B?YjZyaWhnS3k0bURXM0VwenptL3R1WmhybGZPenRuSnd3dWp6OFV0dkg1Slhy?=
 =?utf-8?B?UzMvODFZRTN5bUNJRWxaVmhUTmV5VDlyY2JBQWI2YUdydy9BZG9PcW5iRVhU?=
 =?utf-8?B?Njg5TmVMTlVza002MzhQSzFHVlhlbVFIQkRaN0tmeUxabXVXQWtxci9MZ0lU?=
 =?utf-8?Q?JOpEBr9RQzgw5NL6v83az8/XYXi3RxA5qZV0OxAB6E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f40b092-3c41-46cb-822f-08d9c2214c03
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 12:24:11.6087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1MP8DGfc7bZj/4bBukyorEHQY+wvaxnF45W+CwH57PNXGy4bp/R0IrH4xJRvw+oNudO5PCrOqUwwxFJfgeazPQ33nwNj6SOAdeRBS9AH8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4435
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::71a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -728,9 +728,11 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>            * disk, secondary disk in backup_job_completed().
>            */
>           if (s->backup_job) {
> +            aio_context_release(aio_context);
>               job_lock();
>               job_cancel_sync(&s->backup_job->job, true);
>               job_unlock();
> +            aio_context_acquire(aio_context);


Why we need it? If we never acquire aio context under job_lock, it should be safe to make a job-mutex critical section inside aio-context critical section.

-- 
Best regards,
Vladimir

