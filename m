Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F113439D464
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 07:41:01 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq80S-00019h-Du
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 01:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq7zE-0000KZ-Bs; Mon, 07 Jun 2021 01:39:44 -0400
Received: from mail-vi1eur05on2110.outbound.protection.outlook.com
 ([40.107.21.110]:54624 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq7zB-0001gS-Ib; Mon, 07 Jun 2021 01:39:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOwNNdgo3wuuGn6RJCSScwPPKvdGql4Q4PGvEXMxzRWKeJ4kaPYWStBKzYDDXOruz0nNGU7JZVh3uBstFrCu2jpjPUFI0ztGV3feTwnzDQsdMTA+JusUYALxKpZu1aCtHcEA55e+vloasGWl8uToxvBGUkU0DaapckPmbs1QQapttnzbu2zImxAfqF9udI6NebgV35XppH31X5bo2I6/RlDEH5Sm2xLf8eFNJ+/2QQvOx0Ujxl5z6zhLlidW6uKivYtGMITEfPxLq2sR0isWb5CCtCo6KSSdLNq3q3Cs5oEkEworhVvooMNIzH8/HldDr5MbTeHm6zG5NaagEuzblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skt9RfQahcrQZqcCmpp3GevGGlPEYeGau8/coHBtny0=;
 b=Zl4sZDWGrx+vV32YxDrX1FWRnPIlmIdIiq/35oqvRUCASk2QuoWjFiUsp3HdexfUL3wAompn4vakHqCM0cqbSNbKoplpbXIwcCtV+z3qnYXJNufnt0lnXkhYnNeqrSv/16ND1QBMxhx8JfYoO3giET+W38WFsU5YUbR1/MkoK1YS6WUBsCiINe2AOGiiv8xXc76jJJJUh5t3fOj3/5EiFsKwIlexhq58cqIQDw21SRiJdoscoJLaOwmY+2viTpB57bAgC28RKD78ljz5e8kzhwFquvFrZKVaPcUzdjPD2m+aUEdquvoTGoLz2ZCf2BU4dgd8o45F3WzdixCTO6oGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skt9RfQahcrQZqcCmpp3GevGGlPEYeGau8/coHBtny0=;
 b=A1Pt92DhQrXxHdjU5P4lapM3tSz8wvXIMlHja5t8+5Fm0MLtXlChkmLejmIyRAn+8K82R8o3qCIFEJdM5yKAox5iCNzGgSZ++DTaQ/bIFXZNbMOzXlw2kHK3pWdKGsIaAZGUEmmeqY+pySfEliBwyfW0QM839syItyMc2F5ujas=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 05:39:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 05:39:36 +0000
Subject: Re: [PATCH v3 1/7] file-posix: fix max_iov for /dev/sg devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6426cb5d-9b3e-ca6b-35d4-c4cd5488c448@virtuozzo.com>
Date: Mon, 7 Jun 2021 08:39:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603133722.218465-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Mon, 7 Jun 2021 05:39:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161dd32f-2a4c-47d8-b401-08d92976a2e9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32215E851052450B1956170BC1389@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKu4balAFkVjKFDQfG41ANu7ihPlteIM5hKkX2X07eWwnm/2+FS2VY7X8XXPjImNLX2dAVoNUeRQ0xGUn7NeoyqjjwenAkF+Y1BW7B1m7v1m0wn1mjnlmiOFjBFvQe+9K4Ux9FLdFWPGyY8q6jsS16nJPPMrJvanBY7R3dMVe5itbC8/gVS7yGZ264eUixvrW+RqwPu9d1hFIWJ/mnztDZzA4gXLHWrVio0aLKbqLNmnNrlslu2OUj/4DDlPQL/8/zgNWTvaEAUciqjHdA1GPKJQRgdxA2/qdhP4XUJgfu3HAvf/LZrc+btElBnOMC3bHCjHEb4X0KExOq9CI1R8ZVWSF7qIlfWty6kpxHGPylbf9+GJsgUgsBFE++BhpTDojq5ivlUCZpekSMdwcyqoJIJkiedewmjJ8RH9k4DkqAPHc/4UNmksS+NCqvNerBrLf7wOqSJ93FgjUQmQmUpCw4D2zD05jojcRsu++/cPyRGwJ5StV2KMXwvx22GpIZQAdlc93tcFb19cJXFcw/wyXVKy1H9a05WAKIn2emZZhvqPnOy0wMk+FK6xqvc/KcPK9AAgnj/sZGwqxeJPmGEdHOCDcUFLWr4iKPwZ/ll9g3nQ18eEYw8VguHclEnwKqOTCrYC3qotTL0QkIkqAMwZxg62LjSLjuoxBDm2Y/AohK8KsloS5Z7WEi2GDePNII3L8zNH7fd4P8EIf6ZXbn0/kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39830400003)(6486002)(8676002)(31696002)(2906002)(316002)(8936002)(86362001)(83380400001)(186003)(16526019)(478600001)(52116002)(38100700002)(38350700002)(31686004)(36756003)(956004)(2616005)(26005)(66946007)(66556008)(66476007)(16576012)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?clAvbWd4UUIxUGwxb0xSZ21oMXFaUlAybzJ1OWFnQ3p1MGk3RzlFVG81bjhm?=
 =?utf-8?B?MzNuYzRlQ0xUZFVkUDJnT2lkMXVTYktPN3Qwd3owSG43NFQ3WVNNNXEwSmtN?=
 =?utf-8?B?elNjWVVWOHBRLzNXZG51NVpnWkliOVRsU0lKUnJ6d3N2VGFUMlAwMGdTNzhQ?=
 =?utf-8?B?NmlSUnZIYncvbjNLNWtSZEJLdjNhSVBlNjM4L1Z4Sm5lY2pPRmthN1lTNGtV?=
 =?utf-8?B?M0tnMDhYM3hOOFNLQXMxYk9ibkNLOVFRSnRadTdrUWxNa3VlY0huVURhUEtW?=
 =?utf-8?B?Z0N6cmxtVkhvdXlUaGJYaWtHUDNmcTRSOGYrV2huaSszeW9JMmpaTjlNMlpL?=
 =?utf-8?B?OXZsWHBEeVdFK1RJRnVnUHo5aGFxaGhEc1oyZmpBMlplRENoNUFWdlVVbHRW?=
 =?utf-8?B?NHg1b05IdGtqcVJOcklUU25aVkZQWEVLVzFDQ1BqemJxb0FZRHdXVnJPN3Mr?=
 =?utf-8?B?UTlxUEZGWTRPZGo1enh2OHpPaFp1OU1sUjNDU3lPUHRpcmFBR0YyK0pvNGEx?=
 =?utf-8?B?NEpIWnY1SWtDYXdPdk80elBpZ0k0ODJ0MU11bS9JRHU0czlBbFJuRHZiOWlv?=
 =?utf-8?B?WU1BRit1ei9pbmoyeTRKUXRsUUt6ZXo1dTFlOG5ad0doUVdvMGNxYkhPVU1Y?=
 =?utf-8?B?MUpFZUtlOEcvZGthdy9zN1NjWVlvc0xIdW56L3ErSmttODk3SloxS1hXdzls?=
 =?utf-8?B?d2RKTDJscVlQUEx6ZkJxYVQ4V2VTMHIzS0lXUEhGbm5STTRQOU9uZlBxSnhT?=
 =?utf-8?B?RWUwbnA5bzNzaXVUaW9tazdNWjZqcEVzQXByUG5kNzFEaGR4dTEvVXZUeVZn?=
 =?utf-8?B?WmRWd1ZjZlNCYi9ZUk9MQVFRNnl3MUs1Q3ByajduWUZUZXFsMStsZlkrQUQr?=
 =?utf-8?B?dGh2cFRuMm5OOW9QblVPaVRTTWVUMzJ2QnA0UzlJY0JZWkkwdDNMZU9nUUdp?=
 =?utf-8?B?Sy9ZYXY1ZDdxcjV5bW1lVG1YODN3NUVhL2c0OFZzRitnU1R1L05BY244T3VB?=
 =?utf-8?B?N0srU3hjVndDanJoSXhqUTUrb1FWRXl3QzRDZzAzQUU5RUtOOWhDWC9hVmky?=
 =?utf-8?B?eVdrY0xMSjhRQzNPMUlBSkRCZUd3dXVPb2tQRkhTL1VqTUhCZ0s2eWx1K0hF?=
 =?utf-8?B?SzBHbmo0eGZlKzR3NmwyeTRsQjN6bTVDdVgrcGVjOFBiaE5ib3RTeGdqQVo5?=
 =?utf-8?B?RHh1LzRjME13S09uWTFZMmRuTUtPWmhtSmFYTHNRWTVVQ0FtU2EvaVJtajY5?=
 =?utf-8?B?UXJINkFLRmpMRUtmRHRjOVBXYmlKWm5HeU1oOUoram5HMkhoemdKRm5SUHVI?=
 =?utf-8?B?NlpNdkJtYnZjcWpsN2FZN1JPL1B3UGp0UFZvOGlYUFE0T0lZa1BTUTQ1em9v?=
 =?utf-8?B?U0hDUGZiZ08wd1dPNys0TjNKZ1l1cnptUnFkVDQ2SE9sQkNKSko1dkdPZEMv?=
 =?utf-8?B?dU1OTVBrWHRVUnc1YVEva0xUTWp4em1LdGdpYi9mNTUwMFVrb2JjVVlrMXM2?=
 =?utf-8?B?aktXRFF2ZFlva2pwWWMya214US9RMlJTa2dJN0RTMEV0aUh6ZnVUWG1xa1cy?=
 =?utf-8?B?Z0plV1lrZlI2aEt2dUJoMFpMUVBRMDRROExLbXk0czhuMld2cU5NZ2I2NGdv?=
 =?utf-8?B?cVVHa3duN2ZKY1dBeVZFaWxYdmxnZnpnQW91MFgyeWQ5elRBck1MVFZEOVNB?=
 =?utf-8?B?SkUvVmY3RGJRblFZaXJMRnNxR1pnbFlLRi9CbHZKeDMrNWFpSk1JemRGbENB?=
 =?utf-8?Q?TuwIR0u9KJ4atnoGroSntsMnAaDlHOlLt3g2GcB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161dd32f-2a4c-47d8-b401-08d92976a2e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 05:39:36.7721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvuI8nCe6+El59CCFB1YO/YZKO3a9V1VS5QzVcoJReIXF5ame15sbkY/CZCGREJWvXJjCzOCR3TN5/C+NCNa1AcCK8DEO0shom06z7D3ay0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.21.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

03.06.2021 16:37, Paolo Bonzini wrote:
> Even though it was only called for devices that have bs->sg set (which
> must be character devices),
> sg_get_max_segments looked at /sys/dev/block which only works for
> block devices.
> 
> On Linux the sg driver has its own way to provide the maximum number of
> iovecs in a scatter/gather list.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index f37dfc10b3..58db526cc2 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>           goto out;
>       }
>   
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;

So, this is a new most-probable path for char-dev, yes?

Is it better do it at start of the function to avoid extra fstat() ?

> +        }
> +        return -EIO;
> +    }
> +
> +    if (!S_ISBLK(st->st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
>       sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
>                                   major(st.st_rdev), minor(st.st_rdev));
>       sysfd = open(sysfspath, O_RDONLY);
> 


-- 
Best regards,
Vladimir

