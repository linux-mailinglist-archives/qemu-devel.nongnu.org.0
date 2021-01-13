Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7632F4E0F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:03:58 +0100 (CET)
Received: from localhost ([::1]:56926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhgj-0006ry-P1
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzheP-0005wp-JR; Wed, 13 Jan 2021 10:01:33 -0500
Received: from mail-he1eur04on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::72e]:52007
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzheN-0002pW-T7; Wed, 13 Jan 2021 10:01:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBUTPxu9fI8n1K+gBqHOFG56sVSTAmdiLQtL3YGM60mEroxxsL6TMsXkBKIRWBnT0x9ZB1SDbs8SpAKVnPa2VB+SCDqIpprpmmzNs4jEZp+kk1ynZnXH4uIIkx0zLQ6RSMGrKTZfyQC06QUertaBHqt5eqNceMyKaYK/OMnDNKQ8ZhUUa/0z8xt6ALKKuF3GRzPYozRHOH7kPDN4PRg/QnP2+7igmQURGYf/NvZELcFOmi8BNIx1gkUbCuSlE5CcQ0hXf5jzcGEIJctgXOrUJXgkV/oih5/h3cuweYtaTkVnIp+XjyB7A4qAX+TDF7GbQSASYddk7eyhoI1fjXGOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNWx9/CHreQNK9q/j0zq0eKPrehKyfmmfn0niL7Et1Y=;
 b=i1r77lZefEk+GlydZnIVJtd9z98eajNfLSpII3B19/QjlgJq/V3Lwht+XHORFfWHW1qO0dSzrTgMNjZxxoRrCHXlaQGHbidROTOyDxb+w6hIC4/IJS9AfCZvtvsZnJ5tvKTyMHAtThBTb3Oww8EzFao4y0LM3L5R1JaydHHnKD+RK9MJwTwjgFpfk0F+EoxZuTDp6STGMZcgyk2DxVWaxO0kS8KZ8Ce6mExfidSiaXDesqVpnpJ5457kMSrgdvw9GcHmSKbvsR5wJK6f6u8VwRp2IGaOkY977ZxG6QK4UXrEZp0IxP+BN7P+tpn66lmOFGQgU8ixxsAmg3uAI6YsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNWx9/CHreQNK9q/j0zq0eKPrehKyfmmfn0niL7Et1Y=;
 b=Hqmw11aeyA+rd3JyxMYl8a5VCtH68VGfU9g1fxQ039JUtXJJ4TpmvfSTZkVYyq86hIXZwP0sskrPsFBb+5lKUhg4vH7/UR+A0WviqCC0+qCXXoso3aw3PJM/ekpknwFI/BKdiHF9IMdsOGik+jfk4COg5m7UaYMVpp3eVDs19xU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2451.eurprd08.prod.outlook.com (2603:10a6:203:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Wed, 13 Jan
 2021 15:01:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 15:01:14 +0000
Subject: Re: [PATCH 3/7] iotests/129: Do not check @busy
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f4f5df60-fb84-24e4-da2f-87818aab2a56@virtuozzo.com>
Date: Wed, 13 Jan 2021 18:01:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113140616.150283-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR01CA0151.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Wed, 13 Jan 2021 15:01:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3e1e5d3-8f78-4004-dff1-08d8b7d41277
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2451:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB245151D31900720EBC24969DC1A90@AM5PR0802MB2451.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+vZW2UF3lYMfuMyNHGYFBz6aKbVZVXxVyQmF3LkWMnby8r2HL87nwaTBA8uRSOS9qibl0Zp19Vh1UJt7yCl+MLkJeuSICcpzObg2h7WBAe6RxHzWRZI4lIlIzJuEgGwZoOoGcG7d4rnRZMFIZ+rr+Ba061bmMjqrd6MfU4HrU0wlSFqzafRL0PUu3aAwj3zaoxJ+nuNUmhzeT2MocIXE28F16vyYNh4PUsYj9BDyaJJky1rvGw1hrr18Bypk3IH9EFVFPM2cf4vKsS5h0Qt8zpg/L1Kv0i9y8UglQr7LEV0bjqwaSuoo+JUxKsJmOCUeLnBxhZ7vQg0sAan9o/0b5J/SC/llKttv5RXDh/6LqKfR5fMm3G/janBAWs8fOaEQo0B8cEV9Js9fje8mG9DGK1zFnek99ZMgIzoQcaAi0FWvAODqPndEomawDcCqzA+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(31686004)(2616005)(31696002)(2906002)(4326008)(8676002)(36756003)(186003)(956004)(16526019)(83380400001)(316002)(66946007)(66556008)(8936002)(16576012)(66476007)(52116002)(6486002)(26005)(5660300002)(478600001)(86362001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWxFekF0YmlBOXlsODEyK3BhNStBeXl0S3pBZWdvYUJTQ0FJZW9pK0p3cFEy?=
 =?utf-8?B?Z25DUEJMUWo4d2E0QXNaOHVFb1VLNlJIMXl0YWF0djB3cWF3dXR6dUYzNjdU?=
 =?utf-8?B?UWdLZ0JtUHdkY2g4QjhtWHgvVjQ4a2NMYlNQZjV6b2NFUkZXbEhWOHF0dTNL?=
 =?utf-8?B?bEYwcHlxN2VMMjlKRHI3SWJmdzhOK3pRQ3ZrSmx6RHFjb1NIT1pmMVk1d1Nv?=
 =?utf-8?B?ZlI1TFFtTldZTFgyZ3JUdEdZYVN4aG0rQk1PNFBwRWpXdXdtd0JtamRWUGZY?=
 =?utf-8?B?VnZENVFSSlJReEYxaXJ0aW5JNFBDQnhJczBhM2ZISTlDNzNKQXB1b1ZIVzQz?=
 =?utf-8?B?RnhVT3o4OXhrSW9TZXVlRDkxMlI1SHlieGdoQ1JaQ1Z3REV6RVNjWHJEY2VG?=
 =?utf-8?B?ZXFINUlUQWNiY2dVbU1zZzBFVDRwTnRNZFZVdE94WmNxc25FeitkOGxad1o3?=
 =?utf-8?B?NEdwaFRHT3BaT1JhNHZFdm5WYXh4SEIvUnViek5vK1I2RVZxWXYvUlVucDVn?=
 =?utf-8?B?TE5oZXA0SXd0RktkaWZNUkt0UFd5RmhFYWdiNHVGTkp0MS9KTE5yT0VDUklO?=
 =?utf-8?B?WFRidTZROUZuVzBxLy9pRkxhUkI5aUFibkpnRUZhUzRUYzcwQ0xyUk9NRW1q?=
 =?utf-8?B?WVRqZDUyT0Z3cjhBazFpL2dxZmdjOGJaN2FkUHdMekFDb1dUNDE4cVExa1Ro?=
 =?utf-8?B?VnM3cVJJaUpnMi9TN0FmR2tnZFN4czB4NUhpNEJmL3pSWThEK0tPVHJPREx3?=
 =?utf-8?B?NVo5U0hWbVdJdFJRb3JCcjJCRXFrWmNVWlF2QjZUMGR3c1NnMXBwWVRLaWVE?=
 =?utf-8?B?dlEvK2F2azlFM3ZqOCt3aTRjQXlxM1BBV01SYUk2KzRzRzZyL0tqTGp3cTlS?=
 =?utf-8?B?WUMrdDZUYXdOM1NkRXBkdVBNVEFjOXZlMXpRREZuYlh2YnQrNWg5VnVEZjZD?=
 =?utf-8?B?TGlUV0ltTjRMODVIcytHdTFxVDNveURWcDVTYUt5M2VsY0p6T0dSVTJLN3RU?=
 =?utf-8?B?NHVYWDk2dlQvUysyRXhUVXlHUnk5MG1CY2gzckpvQ3AzNU9qOXRzcGkyVWZT?=
 =?utf-8?B?RmFrMXNGeStQaUNvYXRhLzdaRG1JOHlSWjJsNnZaajZuN1dHWkYreVRCazBy?=
 =?utf-8?B?TERmZVljV29iZ003UWxNWEIyUGNMalV0VmEyMkZvd1N4VEZQaSt1Mm1UanRz?=
 =?utf-8?B?VnRlbGZQVTEzYUFGd0ZMeUpYcUYxaHRmWkdONjBFcGRyWmVEK0I5RGVxbk1h?=
 =?utf-8?B?SVMzZCt6YnNEQ3NZcHZoVHJoUVYzRCtsMVErSlFPN3dJSEFIUkJhOVJBZTlL?=
 =?utf-8?Q?mcaOWK86MMEUJzmDGRby4yBnW5WxfEWqow?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 15:01:14.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e1e5d3-8f78-4004-dff1-08d8b7d41277
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojTjEueTtDKtK6WpS5XaLOgNBpL4WI/SPsdmiIKtXmWt320E4On9g00OCsAl/AdvJXRS0vwKbWnx3RZcOplqcOtOYngFc6OpmWrg108GuIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2451
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 17:06, Max Reitz wrote:
> @busy is false when the job is paused, which happens all the time
> because that is how jobs yield (e.g. for mirror at least since commit
> 565ac01f8d3).
> 
> Back when 129 was added (2015), perhaps there was no better way of
> checking whether the job was still actually running.  Now we have the
> @status field (as of 58b295ba52c, i.e. 2018), which can give us exactly
> that information.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/129 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 2fc65ada6a..dd23bb2e5a 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -69,7 +69,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>           result = self.vm.qmp("stop")
>           self.assert_qmp(result, 'return', {})
>           result = self.vm.qmp("query-block-jobs")
> -        self.assert_qmp(result, 'return[0]/busy', True)
> +        self.assert_qmp(result, 'return[0]/status', 'running')
>           self.assert_qmp(result, 'return[0]/ready', False)
>   
>       def test_drive_mirror(self):
> 


-- 
Best regards,
Vladimir

