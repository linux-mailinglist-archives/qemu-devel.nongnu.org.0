Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E145737264B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:09:20 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpBH-0001wC-VU
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldp0Q-0006N3-SC; Tue, 04 May 2021 02:58:08 -0400
Received: from mail-eopbgr70092.outbound.protection.outlook.com
 ([40.107.7.92]:31815 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldp0J-0005gK-S9; Tue, 04 May 2021 02:58:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLeEPmhv+cfm+c9ZrBGZcgKlLamiDdH2fWRuZu5BKeY+kY4ci4Sif6/8DrgA3+XMwnSIKqEfNI2JgkCekkrGQDoA0mByUZpN23H6mE1GeIIm4yJNaGRilvtRTiFoUPIytc3YwtHdH8Ni1nhvSo1deSqmAO1SaJ0LXeRT1WVgja5c+aK4ws9ZQ2VHGNWtJVbaIFitxpx05QNx95vvJpBZD/R/Dldz++OXG4/lOb+9nrep0/bG6eYLUBYzycn216ck4eDV1npC/EQWfuLxYwlOjSeu4BtBhxDWmEu0oTmrLHLSBD1hK2iV3xeM7GgaQrjo8vRDy/i5EPIJs0ng0ZnyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vGfxW7jn2SeH/h+0iheCIC7TMWMm0e0+IDWj2g/WdI=;
 b=Av9VQYiIf0ChdhkjEUEUfq9n3/hcNgSwmvA4o6TmhQC0A5a36uuJZhDBe1HceVOkiB7Xx7woTCklpq2jRlUOTQ0InuNR+ju0DLhInPvPfiMlYq0VLv0HznuztxsHDvxrLqo016op3dRhJIfh0fYURjz5qEQo1GuUgE6z+Qwn8B7x/jj1cwsEhXLkr5LtnN9kbfRQ5lQiR15vTgyKfHvxvMyr7H64rPBYNGq2/qus7Fo8bQdYG3foRWXmp0M+rPt6hwyHIDQqdHs7nhwRa5Cb8k4Wusq8RqwIiMd+O3ekSa3EEsKRk52HZN/8diFF8zcVIDlrgOlhAQUOUfDKjbckeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vGfxW7jn2SeH/h+0iheCIC7TMWMm0e0+IDWj2g/WdI=;
 b=MgQrh2guIi0QH9zrU7r7xqWv1P/EvIo3a3hn33fQcQjKG7z+DCFDXOT0XDdvCeCY5O81N7WzDuaLFWQ1XN81kbNesGTMw5wEorFKfHZCWEs6xPDG9YtHivceWN+CKS6i/BuEUXXk6zQFwoZh1urNsD92ERuuSosKg0RBqi186og=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6709.eurprd08.prod.outlook.com (2603:10a6:20b:395::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 06:57:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 06:57:56 +0000
Subject: Re: [PATCH 5/6] block: simplify bdrv_child_user_desc()
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-6-vsementsov@virtuozzo.com>
 <w51o8drhkf9.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2b237b1b-9924-765d-7eaa-905889cbf4c2@virtuozzo.com>
Date: Tue, 4 May 2021 09:57:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <w51o8drhkf9.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR3P189CA0067.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR3P189CA0067.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Tue, 4 May 2021 06:57:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c1313e3-9281-4782-0358-08d90ec9f251
X-MS-TrafficTypeDiagnostic: AS8PR08MB6709:
X-Microsoft-Antispam-PRVS: <AS8PR08MB670913DB6424E39DC5BD5229C15A9@AS8PR08MB6709.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAS+jY/VU2nNbLeUkiS0w+3RzeB9arRRM3/FuUD6s2vrlndnByVkg6BV/Th7lUeGsOiKX3ZBVpQ6NpRZ+BEJsa4sxZDPVchFeZ10ylF//63oZ+NIn6IxTJkNdeOUlOuPwQm7dCfiBFsbMYOVwoD05gv3EfuwzvisDgius1x4WKNy427q2nHwh/G0GpRvzs5NY4FiH3hmeH1r20LeZAd2UI8eqZXiNLeHCADZpx+jCS+z0cT2VIO39l0+Uz4/jJzYHzrRaC1ORZq2b1bUMVV418W/VqIPf+dXaI2yrEURjiXYdYp0rad0zMDKhhQ3rWEYYfRw8/LmSmazHdRyX9kfDiyMqqPlJAEwlGPb+rZa/T1BQbjOTq5RBDLmwaDH/1S3k9mbmvNmIPzBZ7al8cNa+TN6a0N+LAIwImapNUnF+z55ujat11NNV6rAYt3hS9b7bhGJLRM3QcOarvXswGufxY5zYP4KtUbkj2YPE5duZ9dtBx1vlwrwzjRYgAc+zXCPkpzkLTL9V2vBSjeJIOHiSV/+MXTzr3dac6fSMikrRw21ARmOgJlkEa4uhXb8d6ElsSDPKp19VLB15v2IFyeQ+dl8wZDzd4l0oTkhO0BF+yNvyhmDkcH6eGq2QaKJcZEkiiUaWMVgx7TW2oNNaaPjOF9jPI02Crrbr4Te/llA/UUTKVLNtl0sbLm/3KZNiiUCfkyJTooM6Pw4xHmWiuDBvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39840400004)(346002)(26005)(316002)(4744005)(66556008)(38350700002)(38100700002)(8936002)(31686004)(86362001)(6486002)(31696002)(83380400001)(8676002)(36756003)(16526019)(956004)(2906002)(5660300002)(52116002)(4326008)(478600001)(16576012)(66476007)(2616005)(66946007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGNCMFcyOHg0SlZOMUxWaVFmR1NQcjJqb3lCQVR6a1RxclVSL0dYQ3JOSy94?=
 =?utf-8?B?SktMMXhhZkYzQlRGVWJIckNzUkEvOEszc0RTelJ2R25OR3hjUHdOZzV4STJ5?=
 =?utf-8?B?dzNRZHgvY2tjTmJKUVFDR3VMK1A4Z0RoSEg1L0ZJSXdva1lMOVdqZUJrM1lh?=
 =?utf-8?B?WmVOZEUxS2l5RXV5aXczdlN0NTdXdkw1eUVxUVIyMjE2VC8zQ1FCSXNqMENt?=
 =?utf-8?B?cUV5a1lVc0VWZFdsakdWM1BmT3ZyT0ZycEhRczFEVjVHMGo0NFhNYklNYVJF?=
 =?utf-8?B?bFVMUWhXdGRmQytxWW9aaExjYk83aThMWFoveThNUFR2czl5cnVHaThzcHJn?=
 =?utf-8?B?azRtN0VmblIyODU2QktNaWZ0V0JqbUhvZVM1UEZ3Z2FhcTIvcms2M1dQTnZZ?=
 =?utf-8?B?OTRMUXF0ZlVOQzZXVE5aZEtjWTFHR0hWT0cxNGlTZXNYOGNVRVc5QnZRS0R4?=
 =?utf-8?B?TzN6bCswMk9qaGc4b3hxMzJQMjdwS0VQVnNIQ1N0M0o2MEUvYXZ0UmJTZ2s1?=
 =?utf-8?B?ZTNaV295dmZvZ2lKaE1leit1WXI2L1hBWERFbG5XWnN0WW1ONTN6SVpXdjhR?=
 =?utf-8?B?NFpyaUpJbldqWG5MaFB6Nk5DREZJYXc3YjZ3RzNXTExVVG41RWxRVSs1U2FZ?=
 =?utf-8?B?NVB1K3QrZnlGOHlKSE9aaXMrdjMyZ1RFL2dUdHdkTkhYc3RiQWNsUW5ZZkpW?=
 =?utf-8?B?dFd3WTcxV3VudEhmNEEwbHRiYTAwc1RmbjJGY0dkRjZVcStUMG9sZmF4OHVt?=
 =?utf-8?B?WDJNKzF0cnAwOENQU3ZQTW1oNVRQN3dXSVVMZExLZlV3ZW9kanl1dEJpK084?=
 =?utf-8?B?OUxjQ2doYnpMOU1hTXBBdlM4TW9xRlBqSmpabnVTNUtzdGU1NSt1THRwdlJx?=
 =?utf-8?B?Y3E2TGRXV3RsZjBDMjBSV0tTcUFYWHhsVUpQSkVnV0xVN0ZVWnM3M2w5ZitX?=
 =?utf-8?B?dHBZS1lEcHQyVzk3RERRUE9CRXBIZVVTMXpNbCt1eXN5TWh5dnQwYm1zemRZ?=
 =?utf-8?B?WVVneURxUzJlblg4bUwyQXczKyt4WjRVTGlUWUIvaEh5WllYdExGc1plS2dy?=
 =?utf-8?B?bzUzcDhuaHI4Q3NpOGlkV01uczA0dUZueEtXMFZicUVDbXppUCtjQVZTQWsx?=
 =?utf-8?B?VTJNZ1hxU2VSMzdySDRCWGJOU1AzU20vK3EwU0ZwZVpzb1RXekZsOUtEOVdU?=
 =?utf-8?B?OG5YVGY5NXpFS2MzMjFVRFBjRmg3ekhrR1JmVW53WHBpY3p6eGpjVUhLSDA0?=
 =?utf-8?B?N2JNdEhyOWZ2cGU0Z01PRXo4dkxJY1BLZ3FkamU3a3lqQVdjRkxMSWQrZ0tx?=
 =?utf-8?B?cTRuTkZSWEtaRWdLMEFVYmprRjJCdWNuY2hpMzExeHFyNVNvekhPclliaHZx?=
 =?utf-8?B?U3ZLSDM1aG5uNmZhc2o5NDR3Z2FqaHFHTXhBLzJLck9sVVhjQXVJUjJCaytD?=
 =?utf-8?B?RjlyOUhlUjZtbFJ3dWo4Ukk4dUxpODRuV0U0ZlRROUtaQjJCQVNmbjB0NWpR?=
 =?utf-8?B?Q1FlUS9rM3RkT1JrQzRESkhKaUxldE00WEVXS0xjdncrS1h6eEtrODVEWFpa?=
 =?utf-8?B?ZGJ6SzJGZ3pVRkdHcEhTWGdxR3VFUXByeTBmOXpUNXpVTVM5ZWdHUlhiNFpB?=
 =?utf-8?B?eWd3WnhWYTZLQm54bysraHFLaU41ei9ZVm15RGNSanJ1ZjJ3eklZWW82bWYz?=
 =?utf-8?B?YjZsL21EMkNvZHNtWGZGM00ybWlQUittNmN4dkF3dHlNRGhIVGhxc0dpRXNZ?=
 =?utf-8?Q?+XV9upaqLDdbMcFd4+/okfTc+HH5QlFkF0lHgQj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1313e3-9281-4782-0358-08d90ec9f251
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 06:57:56.7959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G38s3s5Gif7XFH0XegLCFdsxPVjcWxu3xEQpF9rXCJCINA8bwNd3JiMyAD7CldcxSGTvwwm7HVc7FEhUPT9PbD+4YDtGYyJiSoHFeUCavlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6709
Received-SPF: pass client-ip=40.107.7.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

03.05.2021 19:05, Alberto Garcia wrote:
> On Mon 03 May 2021 01:34:01 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> All existing parent types (block nodes, block devices, jobs) has the
>> realization. So, drop unreachable code.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> With the updated description that you propose in your reply to the
> patch,

Hmm, is it answer to 4/6, not 5/6 ?

> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> 
> Berto
> 


-- 
Best regards,
Vladimir

