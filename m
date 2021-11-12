Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF044ECA7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 19:33:54 +0100 (CET)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlbN2-0008HO-Je
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 13:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlbLv-0007JS-6z; Fri, 12 Nov 2021 13:32:43 -0500
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:51334 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlbLp-0000Qn-A4; Fri, 12 Nov 2021 13:32:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjyhXPWyTZTx0SJWyWz1rq7EFpvVjiyoMQbGfCmWhKkbC8CpZxvI/qoNYJOvJZPVkEW5434VPOkglr9z+U0thbtx3LtfQNzoeta4aSpkR40LgSKXxIsXipfmCxJ2tk1YvWJXyuJJxteo9OWQTjx0yJF7SZ/UKHdxYbDfkovu9jLZYPeYaaeVWi/k2mGRzLkUDHebeLtHZYTdSPW5QK5kybY1tjtKJrzhlu7oDkpd9EfIHU2cx/wjyhFT4udi3nVW0/lNuH51/0/2YCXZbfQuwe4kOzEmvQqvHWQO/OChxSfKbQkCBWp+rIKL5uZv5Eec2PH0hg1H7TQPCo3QVruunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fheNvSAf7dz/AhsaD2culb7jluJRlXd1ZdejTVzlkc=;
 b=RmAccDffeoq16LpfQ2LpElOkasuA26bcQZBPmxTYNYYq3bfJwcmAQwcXHty+WT464+SthxoKsa0f6h68OGm+Ry9x9EDy6p2+1KgLLbhoC9eNwkzuVvIPa1d+MgUT+qfVZP2PKw9nXMILEcHwV9JuAjdX6VkcHbv2PfbPTL5P9iCuzhUiwVhvY9/9BdbRHi45T89hrzpC1dpD0xnOKYNCS4/+4Fj9JJK41nhKdojrzNmEt/nmVe26nZ9TW031oNcD+BU96g+YjFMEKrMyBa+KDP+hBFWE8sai479XsVUYeI+/hdhg65pcXyuvfLpx/HHF/e6T7RheZ92CRNEChjcCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fheNvSAf7dz/AhsaD2culb7jluJRlXd1ZdejTVzlkc=;
 b=LBiJeXm50tSy0W42WmmfapWHYmQ2PA3mh/xl/wYmBoSKIt295kPNWdwr/jeDvvJSpYRYaYa0J/421CfVccOpunYh7lOc7mfAnVR0Li01JonUrDrUMUmcmE9gZpuCvNESr0X3Wz6pznTrFiURsqvs6kOK32aumChjsekZrSOog24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Fri, 12 Nov
 2021 18:32:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 18:32:34 +0000
Message-ID: <54b75db4-8867-d1ee-e32c-bc3e4c23ec28@virtuozzo.com>
Date: Fri, 12 Nov 2021 21:32:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org,
 Roman Kagan <rkagan@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 "Denis V. Lunev" <den@openvz.org>, Roman Kagan <rvkagan@yandex-team.ru>
References: <20211106134155.582312-1-philmd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211106134155.582312-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AS9PR05CA0047.eurprd05.prod.outlook.com (2603:10a6:20b:489::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Fri, 12 Nov 2021 18:32:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f58e79-895f-4d8f-80d3-08d9a60acb1d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB610239174DEB98FC65767295C1959@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJ161wymCV1kGrmQGfK9aTEzp6wsL16+Mu5v0tzvDhBryrsjzqfyf1W+KlJP3N57hhr3SBu5XOzJ9jkbB75rO1JLMpNNIfe8kle3hfTtBbIrSdxuqXPS7CEya3ZB0dRgSc4HTR4omZ+NCy+vYd49zDGTWBzAzhglC7n6NzA7VtT6cqM+qmLEEtNt/9CVUEUCdsNPBpllddTebSWBLiFXw0kQpWlHJlqXbHu1PRjYdNPaIb9VAfJtalCkH3zhipaCdsDjwnHLdF2460tkce3rTGEWXs8YvaM1JNzJCrkHlpwWvX59EvnZ2dwdLKPpPcRs+vos4VYUgz/g18Z5r+fxyx7KoxxvXA9w/aIYYAcZTocDenfJQMBQpOG1c9UMEg18Jrlp5hD6pE1DetdGXa60wvI8hictau+ABElhlO4eu3NadeXjHDjYGONJo1yUGGAIbnR58ftPnt1/I87cBHTfBXnJS6197gfhcmFcwC0NUDLA6xlkyF1hFGVpvK6SdG4jr8OMERglmD4Xp/MxI7yGaOrZeuToVZg5wOOv3+mmkqVmGIiBYBu+0t9Nd/3mZ2JmjOXY3KJU/AqnhicmGb8x+Ie6AeFLZznsf3arCXTDzadl3rcWbgh8/mOZX4IiX3IgbcnVfuV9P0IX6TjYaiewLWCDKDFQDF5hY9LBZqXvPVfQbr/DwAOuZFxOXYV6R4hXixEOZaYzKeF7xDiUqQHbDB1MJXVVWinVwy3srgfemQUw/2d6ykpXAjmU2QUFpcTj3+Roj+WrzMHXq3+Q461/EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(83380400001)(186003)(31686004)(8936002)(6486002)(26005)(86362001)(66476007)(66556008)(2906002)(956004)(66946007)(316002)(2616005)(16576012)(4326008)(5660300002)(508600001)(8676002)(4744005)(31696002)(38350700002)(38100700002)(36756003)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUptaUIzbm1zbWFaZHVqMTVZZklBenVjY2grUjhmajhWbVhDa1pkRWhwUmRT?=
 =?utf-8?B?YWpyM2tRekRnRnpPRG5XUVV6NXV2WGlhWng5cFlqL1BzZ3B5aXgwOEd4QTFw?=
 =?utf-8?B?SnRDS3F0d2J3MXJja1RaSHRNSmcyM0lnNW9tUGlJQk5vaTJVL0NTSnhGRjk4?=
 =?utf-8?B?dC81OGh1YkZtL2QvRkhxNkpEcDUwcmJDSUs1MUZxTk0xbk5TU0hmY3FwN0gw?=
 =?utf-8?B?QytyK1VqZGU5Q0dLZ0M5UEtEanVXTG1TK0VmUVNxYXNPYzRjSDZ2Q1REQVpk?=
 =?utf-8?B?ckZkM0wyWG1FMGd5WGRDTzJYOGF4QjJ6Sm5YRm9vR0owRTFYeWl1b1hKZ0RW?=
 =?utf-8?B?N0UzOWg0T1VVQUlLTlp3N3QvRVBuZkp0NlBBendxRmdUVGxtbXBVUnU5UFU0?=
 =?utf-8?B?ZU1FUHFpNnBQaU5RY1ZYOGszMCtjbmpYQUdNODVIT3FwaVhqT1VEOEgyQ1RB?=
 =?utf-8?B?Vi9tZDBWc0NEUXBYVUpwTXRhNUI5VGJjeXpRM1VBd2ltL081M1R3TXh4Y0Iv?=
 =?utf-8?B?bVZjbllzbzBkZXZ4UG1kT2tTelZwREY2MWFLbnR4cjBEazZOc2k0eEQ4ZXR2?=
 =?utf-8?B?UkVjeGtNd3oxa3E3RGZBaWZ3djRvUUNBUDBEdU94UVZidjJXaVBhNFdzS3dy?=
 =?utf-8?B?N1NaMUhSYU1WamdhYzFBVjRzL2RmcmdDYVZWejZQV0xNUHRRNjJ6NEpQZWhV?=
 =?utf-8?B?dXJjQktCUE1LU0Z2dmcxY09RdXlwNTBUYmhhSFRITGVQc1JDdzJYN3U3S050?=
 =?utf-8?B?MU5KbFp5YVFITGxPTGRxUlg2NGtOVDVXQ0l2cE5pQmdUUC9yZFY2MDUyUnUx?=
 =?utf-8?B?V3RsVExBd1lqdUtod0xrb2NLTzVNdTFQTkVCamlXQ01xdmlxQlV1K1ExUUkz?=
 =?utf-8?B?aldMV1FpeHNabzc3bTFFeVA3S1dIbm5XN3U2UHBzZysyQUdaMVVWa1VmUU94?=
 =?utf-8?B?WE8xUzRqUDlzb0wySVpMOVZzL3RkV0VxdWZ3djd3OFAzZmcwVFY3ZWJFSEJ3?=
 =?utf-8?B?Sjh2RHpObVAzQks4akx2SFJycjY1WXdWVlNHRmU4M1dnbmw4Q3Q2ZHI3YVBY?=
 =?utf-8?B?TWYrdTlkK3hoUmRjTCtMc3lXaUtpaUc4WnRFTFpDc0RWZnROd2NvNG4wNUhy?=
 =?utf-8?B?dklqVm5yY3IxREpRcnNHRmhQbkJMek9INU9xVWxZa1pHYkIxQ1VWYUxiWVVX?=
 =?utf-8?B?TWozWHNVN2FoZlFjeHhYUHU4RzNYMk1lOEZuZ0tkU1pJY3NIdW1VSC9kcDB4?=
 =?utf-8?B?c0FQb2dKckFRSHREN2JKeHFaVzRuREl4bjEra3dVOTA1Y0x4eHVNRndqaFU0?=
 =?utf-8?B?T28rZTkzNTh3bitGMWQvZVJ4ODFraVRwQmpNZEFROUhKSTQzempqQVRYUUlz?=
 =?utf-8?B?K1l2eGU4eitnTGVIVnl3VjNBTzBjVGhMQ0VhZXpNSDRlUHM1RjBSM3F2VmNU?=
 =?utf-8?B?MG5FNFNXUkJwc3FTSm1oa3p5ejdCR1Noa0QxOTN2WEFqeGp5Sk5hUEZmaEZJ?=
 =?utf-8?B?cDVtelIvYzFyU1FDMEdFMlJtT3ZJV3RsZlhFRnluOVViakp0MGUyTzNiWW8z?=
 =?utf-8?B?alpEdmRlNWY5MXFMeE1XeW5XczQ4d0lkbDRkNkxSVE1mekxZR1R2VUpYbkty?=
 =?utf-8?B?Y2Q1dmlXMXRjalhRc0d4cjU1N2JlZFQ3Q05KTXowS1pPOStjUklQQm4vcEJr?=
 =?utf-8?B?TUJhRklCYWlaZTdOcHdzcUpQY3o0ZFY1WTFFaExGT29rNDcwdVlmcWtsOW1E?=
 =?utf-8?B?QXN4TFJRdEM2cDVxeFVleVJ4ZnhjZFRKbmE2ckZvOXErY0U3TmxzUFpuQ2ww?=
 =?utf-8?B?bW95UVlGckdZeXdWaHAreGt1bTM0Zk9rWUt2TEdoeFFJNjFuQzhWZGtFSU1i?=
 =?utf-8?B?cGcvWGJmeVBtUTZKdlpmYWh2RE1kUS9zb2pyL2xPb3R5SklXR1B1ZEkvYTJE?=
 =?utf-8?B?L1YrdEtPb1dROXBONjNESVhHYlAyUlNwd1N5cytsUWdVN09yTWFaTVRMQTNz?=
 =?utf-8?B?SzlzWnoxbWhHeWtJdU8vRlFwZ0ZYOU8wTDJHbjlmNnlNUmVGUWtKdkE3SWRa?=
 =?utf-8?B?QmlnWHBja3h3SURYL1JJTzJMcE9INEk0SUZ5eTlPbUdCeElOTFh0SmQ5cXRW?=
 =?utf-8?B?ck9SMzBObTQ0SXdiVmh0ZitkK0pCQWlTWFR3Y2xOWHQxblFmZ2FROTlTbnV3?=
 =?utf-8?B?OWkzTmZIbTlhcU05RE5aSG16aW9QSnhJSW5NQjhaUlp5UlBGejNUd0hZMVly?=
 =?utf-8?Q?ii0ob9O0pNCWbc6yoqMYQp0W8YIFsri0kScRY4Uank=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f58e79-895f-4d8f-80d3-08d9a60acb1d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 18:32:33.9059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENMIOkcrb57XTznR1YGb0HWHPU/U0maQ5lP6fQKgMpTpqtcHhdc+qpJ7pvgyUVTmFstYavm5VHb6c/t0z48jo/3HI9PLkXQJD9Sefy4L0FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Add Den and Roman (his new address)

06.11.2021 16:41, Philippe Mathieu-Daudé wrote:
> This is the 4th time I send this patch. Is the VMBus infrastructure
> used / maintained? Should we deprecate & remove?
> 
>    $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f include/hw/hyperv/vmbus.h
>    get_maintainer.pl: No maintainers found
> 
> Philippe Mathieu-Daudé (1):
>    hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
> 
>   include/hw/hyperv/vmbus.h |  3 --
>   hw/hyperv/vmbus.c         | 59 ---------------------------------------
>   2 files changed, 62 deletions(-)
> 


-- 
Best regards,
Vladimir

