Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EC3C6DBE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:49:59 +0200 (CEST)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3F38-0005zk-5K
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3F2D-00051r-UK; Tue, 13 Jul 2021 05:49:01 -0400
Received: from mail-eopbgr50113.outbound.protection.outlook.com
 ([40.107.5.113]:52134 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3F2C-00057N-6T; Tue, 13 Jul 2021 05:49:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf5sp8XJLtQjRJozNoyZG/fT9lkFo3huP+i2/cT0Ae9hzPOEi0ouGp01ok8hhYSrdCEjEWJrMTdX8ErcZhdCMgCFkfHQ+aFl/N7eFLM2Ps1UsJnpJbcNefAybNzqZMOs4g7Z2KC5TKuO7flHYMVYovEBo3kjcGwJLyIB2JQsZ2Xg0SqhHFf7Lqyw8e/Dc1ncJNPbgOdfACKLCul05k/FhMwif1cNDVuRsBKC1qtho1gANjWOAS/eutEGCfizCBCduMBj0eN4N1yRLbRj75Z9ueCeGa0T2ViSyehUTqJNSlh7PIgy/sWkJogYyJtMYlBx+weHjh9GcmdsAI0vSMKlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zz2auOPngoKawyZ1cP/N29rzKJSQgHLKveNh3KCEQYQ=;
 b=fESoLgm1kSb+3ZUaMMSnStlzSvzcXeW54x/oI7qKvyLYfHO2M+K3JI0xMa8bhyT+lfeHx85rPogLgGJdPgv6cgly+s5hMtIByibtAQxrvIyK9yCspJw8fiLV+PC5Oo7KMmojXEb/Z6I9I7QZHQK/LYNbi+6ZgNCg6Mtsrc8J4zCzw/FhFK2aPMjqhYOa5UjogWO4ri/BM9HSwAJNpORqPp5GuqKd63YNoeLhpjfUyzi6uc9JD6sSTwp4lwF1PQFZ4Jr3yLLOfOZ86uRrDx9ho3GBb/+uUrfnHoogeiMfivbSzuauH9YpXYRWJwLyFu14Ccu+zcurKZTEL3pYyOrWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zz2auOPngoKawyZ1cP/N29rzKJSQgHLKveNh3KCEQYQ=;
 b=OtRtS8DBLAjx8KvdbWXg6+XLVbI0nBb+v9ScwC6BhYJvPXEKAx7P1ucJdJkmB5mGr7WoQOJNxjoWWDyIsv/Xu2WidRScw3gLnyquv5auhw3oND45jQq1dDK3b+Iv6kH8/jSgeDNgz/hUbVZa4a27V4PgXpvVHIu6OUHJK0JCeO0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 09:48:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:48:56 +0000
Subject: Re: [PATCH 09/10] iotests/linters: Add entry point for Python CI
 linters
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-10-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <97311517-f66c-0cde-5c80-d5173cf6695e@virtuozzo.com>
Date: Tue, 13 Jul 2021 12:48:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-10-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 09:48:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee153ef0-fe54-47b7-af28-08d945e36eca
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650D0E87D05747B4E340512C1149@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4vKxNqTon9yrPyQFrrIDZfAQraov8jrmu+ScVfP0so1+dnxtS6gR3pmrV8nVv3tU4UKtuehImgJYSAE0cGB0d6/Ew2iNGd8FLxGBOzS58zc1cXwIvvQK1vknPlbDvFC9nmloH/atutzRlOvBBVWMI7oCv29sfKGuMf6yTNQAQ7aH7PvKvmX6CYENNN1AIFaRvGlfHRmoAQ765IoiAKh1MU/tzoIJ8+/kX1+xu/YY/LM5cJRi4lxnYYHJnNY4RcHDrEwnCBbzJCI6xkJP54SSeWSLZp/BrIb/sjD19azGEx9qeiJP7L3xVeTe11p3JsC0OA8MgpEUjXqGcQt8u+Txxn1HQXI/zXQe7VjKR07SYXBevawa7XCLoE5wSNw5Cq29qmMhdkqCF8jxbjLnqUYUeNCEIM3gKcYg4EtLMXxfslzwHqWoPTnsKOEjK8TJe9Lcn73Bj3e0P7ipDHghmQMtLPw8dROdOl3Ye++1iPqFuwngmolInBC9037D3Wtw5YZ3U52yZtpXA7ZJvMWa+bYM+KPgq7aRB+iL/0OnFm26tfU0bo/uOginlTUYd9EGxHE5YIbIrtq05AqZ2DqpGCf1kEVPycMJPPnRTob6GMbTbgOcjGlykpiGSWthdXo0WaHHyUHM2oW94fnLOvThBtBaxk6AKwESvt7T+kQ1RWI575ok70XMJMzKXeLe1GxKWB/UwrjtECY7daThJ7TUlyQfU8v0bJnr9STQiErjWrTKsjBKgVgzopnniUmK3mWR/MbM+p2O8XbHgqdTc+RijIg0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(86362001)(8676002)(83380400001)(4326008)(956004)(31696002)(186003)(2616005)(54906003)(8936002)(6486002)(498600001)(66476007)(26005)(66946007)(66556008)(2906002)(31686004)(16576012)(52116002)(38100700002)(36756003)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRadXdNVSt1cEoyalZFajlHbWxWYk13UWloQlNkaDhlbCtqTURSWVZLSWcz?=
 =?utf-8?B?V2VGdmV6MUZ2cEVLdkRQQnlTaUpPLzBVSk9VZVlOdDhjMlRuT0tmSXV3ZUhE?=
 =?utf-8?B?bk0zQTh1cTBabXhYNWFEampsNjVxZWhGNkN2SVh6bVphUTI0b09veFF6WUVy?=
 =?utf-8?B?ZmhBNml2dFJnQkp4ckdta3paSHZacytJVGpac2d5SDViSTVmSFZEOEFHUUFI?=
 =?utf-8?B?ZDVzeVFZaVhkRk1SL2Jsb0RKc2c3NG9zWUhqL0ExVkU0eXNBWFdCR040aUNx?=
 =?utf-8?B?YWZwaVJ3dEZ2TUp0bkMySDVCRXpkcENpWjVmYXNFYU40UEtuL3VKSElPK3dw?=
 =?utf-8?B?bUJ0Yk5ZL0VLMTkzdGhLUHJxTzZnNElqRnZQNXowYnNja2lZeExvbTRDRXpa?=
 =?utf-8?B?UjVmSkcvcEhlNE9TQlhodTZ6UnVZUURPRUh5ZzdkeFpHZzhEcUd5cGZsOWhp?=
 =?utf-8?B?dngrT1VuTk5ZRnl0MHdkckVJQk5tdEdyNFdxbDRoZmtEM1ZhVWZhZ0xZbkdM?=
 =?utf-8?B?M21rWWZQSmxnMzNRWnY0MkJubWF5aG00RlZnMTgzK210RTlzY3V0YWNBV3pN?=
 =?utf-8?B?UGF0SkkvRkRlTmtUQTZ3ZnUzMUlyS3FCRGVjSnRsK3BKbWVUZk5VQ0NteHFE?=
 =?utf-8?B?dExHd0syM0YyTitTaklXN0lMQXRuVC82eTBkZ0VnV3VnYmpPc0YvZHpuajdl?=
 =?utf-8?B?SmU1Q3N5b1pzZ0F3V2p0NmQ1ZjNJU3NYMEdTRXhvWU1RMUlKL0JGQ0hEYVhO?=
 =?utf-8?B?bC9Na2ZhTlZreG1SLzhnWEUrOXJjMUZnbXcrUGRzWkpnSytTUWdOUkg3THZs?=
 =?utf-8?B?MHRTT0pxUFE2ajB1NFhabnJyTjdDSVo4a2FFYlB1ZytPbFlNck1CVDlxeisv?=
 =?utf-8?B?UWdGdWZyY2xsSzZZUkJ1RUZBc1RUM0dyUmd1QkVlLzRreDNhaWZ0VStjOUI1?=
 =?utf-8?B?WUxBMkdSeVRkVE16LzI3RnhSbk5XazhzNllUdXJRYjRLc2xRT1BTUm04eE1P?=
 =?utf-8?B?aFNWZXhiR29ySGM0cG1DZW5xMXJRcHBjc011azJ1TUhFWDJYWEJDU25pOWZY?=
 =?utf-8?B?YVBKTWl0SS9sMVpKN2cvMDYySEdTbXJGU1h6K1c0aDNyR09xUFBmODRtTkJF?=
 =?utf-8?B?dG13SHJ5T1NmbmxUeFRYQkprd3h4NnJOS1UyQlk2UmZTS2xycldYMk5xcytL?=
 =?utf-8?B?aG5tM0hyOUVZSG1yZFZaa2FRc3FwbjdkUUp5M1NtMG9kdlFVUERVcXg5d1lu?=
 =?utf-8?B?Tm96a1Ryc3ZiTmsybkkrZWNUN1NIVFpwNkliS1hnYlVldWdLbG04cHFYdnNR?=
 =?utf-8?B?QXhES093SStlN0s4NEkwOTIveU9sT1RSdTBDUDVuSXk5TFJ4MTRYOU1iaUJ3?=
 =?utf-8?B?aHBCd1JRSitzQVFOT1Zkbld2R250MnFoUzdnMWJUVGJjNVRnN3dqTVpTQnlR?=
 =?utf-8?B?MFBHVEk3djNmTUtxSTJHSXArU1A3K0VWUTVkMkU4Tjk5YmhiTUs3dS85WTE4?=
 =?utf-8?B?TEhBczhqQU41QzBJM1o1NjYxY3d2WEhaM1c2NjlIbTNXeWlRdGZFVDJXVDUx?=
 =?utf-8?B?QXFpZzBaYS9UMTlUWEZ4ZlJRTm1JcEZhUWU5cm40TlF6NjRveEN4Q3B5VXZs?=
 =?utf-8?B?YXZ5MSsxdDRUU3hEdUNwQXpJemhMalRrMUVBbTJYbkdPYmVNVFFWRG9UY1Bu?=
 =?utf-8?B?ZXZ3MUU0RTcyd2taa0RGeVR6OEFqNjdudUFVS2hzcERwREZxUXB1ZmtuVTY3?=
 =?utf-8?Q?80d0d/AHWMNQntlg1P+ib7WAsTANBY4Ndb5DuKi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee153ef0-fe54-47b7-af28-08d945e36eca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:48:56.9201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L/DaCss5cBtHVhNsM/vYDeuL53MCkDc750Nj/ESwPOh8CO4Nn/yckuV2AMUexHGJt6opIS11NO6uV5q5l3RdAR9hvBGiGYfbRfSwuKn/xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.5.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.06.2021 21:20, John Snow wrote:
> Add a main() function to linters.py so that the Python CI infrastructure
> has something it can run.
> 
> Now, linters.py represents an invocation of the linting scripts that
> more resembles a "normal" execution of pylint/mypy, like you'd expect to
> use if 'qemu' was a bona-fide package you obtained from PyPI.
> 
> 297, by contrast, now represents the iotests-specific configuration bits
> you need to get it to function correctly as a part of iotests, and with
> 'qemu' as a namespace package that isn't "installed" to the current
> environment, but just lives elsewhere in our source tree.
> 
> By doing this, we will able to run the same linting configuration from
> the Python CI tests without calling iotest logging functions or messing
> around with PYTHONPATH / MYPYPATH.
> 
> iotest 297 continues to operate in a standalone fashion for now --
> presumably, it's convenient for block maintainers and contributors to
> run in this manner.
> 
> See the following commit for how this is used from the Python packaging side.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

