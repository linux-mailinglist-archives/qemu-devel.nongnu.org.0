Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802114D353B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 18:37:41 +0100 (CET)
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS0Fo-0007cN-1c
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 12:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nS0EP-0006IF-6d; Wed, 09 Mar 2022 12:36:13 -0500
Received: from [2a01:111:f400:fe05::716] (port=15874
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nS0EL-0006jQ-21; Wed, 09 Mar 2022 12:36:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGuB90HWdfOqCWzg8gbQNCfuzrp+Jdkbu+Nvv+deS7ujdbLnf+NvuRS8ghHe59p4AafHea/pJhiTKQKFvxo24eGyr34OFtfQQbX2MEkeAsZs9lHPFi53akOi8PrndwHikEr/UL3tq1Uh/JlilqdGh17IDqc9K5OmURsaUV61CsHRJROLQjvPUaE92vU+vsV3aY+DL8X+LRYsmenrYknFSl2s3zCCkpCbqRQNMQiQa7eLyx7Tcv1RiFkpSdQ7+AuMN58l7hyO7pV8/VNCUdL78afXjc5gdnpmLapn1HKfPrlQMWzCPhTdMpXyPO7boQe99FTTuRvgILYlACQ73dBJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr/JkFYSyefrPaMQC1gIHB0P7dTWfFWN95xRjQmdrZE=;
 b=SIGFI/Zb9cGWw3wuCa79+FrIsnR9TYP1d3M0auu6nGVs01PBJKsrp64K5tFE9S4QU4Mm2fU6tp12t7KZc/jLhBvQgK7qwVCnn0rQVUPIh65xPOKg2qLjeIWhPrXmdkKddfE3rQY1ODdN8lWllH1JFuaBBXZ0Ok7cwsSXPG1Ar65U/iOBupNKuGeR/8Gkm6SnJIaOnMQLVKbKk7SZKu+g6jsTxpCyHP69m1tfH0t+qiy66W5I83lFiRu8jOaEPtEguMNmhVm1oF86CuATydcMrZnyrxHNKgzkQP5ofKaiPi0xRHnygeuOTv7f1x4cv914+Iou9RJe7w9lu9nsbGmL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mr/JkFYSyefrPaMQC1gIHB0P7dTWfFWN95xRjQmdrZE=;
 b=V/3rnm6Ud+LbJ1903x/KkEXEoXzGJufRXLNC3egCP3sxm5hKHzoUYwSAcVrrx7DSsGpqUYoxrI3XhNDbXAtzdvlfT7JrgNvmaT35Gc40XWIhTwDg+wY8UB35urdx+YNIsXFodxGc5Go+To92Huy6CEqy6CevppNByAuHXAI9P1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6050.eurprd08.prod.outlook.com (2603:10a6:20b:285::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 17:35:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 17:35:58 +0000
Message-ID: <4373205e-e745-9e94-1147-810d3bcadee5@virtuozzo.com>
Date: Wed, 9 Mar 2022 20:35:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] block/block-copy: block_copy(): add timeout_ns
 parameter
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com
References: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
 <20220302162442.2052461-3-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220302162442.2052461-3-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3a1c866-224a-4ca5-e937-08da01f345c6
X-MS-TrafficTypeDiagnostic: AM9PR08MB6050:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6050DA015E6DA920BF6FEAC8C10A9@AM9PR08MB6050.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5jdW9VIHaQSLB1glBEAoXVQDErfIQ7e/D8/90gy4hc+nvi4idaSNeXiJ4qjZ6GjH6PnwV3Rvx9t4c331i+CGku5vbJjqbSnwYW23ZHlWeh9rxia3MOE5Fr5MgGim51AjDpCN1rWODauO12iqZadle55n8Rb5tSMO84p43VHCkbkbRMquO/OJTy6AjKnrk+aaY1qhQQpH+nPGFRlPxXgoz8fR4FPdOCAbFwD8QY7ZQkjfYApD+5wINnZc+K1SGYEQvPs9Ji2FiL/t2jTQ6RmDNjsxK4flaY6wNpZJ0xuw8l44sBO5yngprBxXMK6rOAf87ymLHXvSWJzjHgDEsiuu+LlK/JfK6iCobTv/fzuwcWpaMmoHbFpuLcSjHdZjCx3HuZieH4SR6ML+0Z8dKM63C9H5CHfuEqZJHDg2uPtPF6DNfDQyUwOJQx+8TDoyZaSuVTfwKTUVbXYIxpsVI9iwq9x9OEN0iis2RD2Uar/RpPsJw/r8OtulGQSFh6T7olm9Gsi/qVTw/AsfVw5OVP11aaiLG+QR5DiM9TiR1/wov3ynOVH58f40AIbtA0VDg+sMaZ8p6ROa1B1WFs1DcaIw8mz1Q8h6ndeSQpZHE3DdSQpgAQG831VDol0QNcOrQbADFV4ByjlWCKQgV5gCCLyYKXcNHHuPyphKuBptTAQpLwND6eM1bVhapFQGfkVhA1TCMTw0e7rV8i3zZNTZ8uOURMPGyg5TB9CAwD5Q5mhFNnOVpAeIEofrD7IXJbfqlbB2cl6Me3Kh5FQnw26C8Pr4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6506007)(508600001)(316002)(86362001)(6486002)(31696002)(38350700002)(38100700002)(2906002)(6916009)(83380400001)(186003)(66476007)(2616005)(8936002)(4744005)(36756003)(66946007)(66556008)(26005)(4326008)(31686004)(8676002)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9FZmZyVjFMeTdZT2JMdGJlKzE3K2xYNzZvUDJpQkNRUlZCSHVCdU9oclNv?=
 =?utf-8?B?V2lKcDFTOURvcHpMK1VOVS82d1BDYkVnK1J2VzdZOXdTTUpGUXZZczU4Yjdj?=
 =?utf-8?B?WVJDMnVrSEhuQ0kwNHpnMlZYdDJjclQwWmYxelNqaFh4SG5xajluOE1vejlk?=
 =?utf-8?B?c0drSHRaQ1ZvTzNLa2t2Vkd0eUZ4V0Rqb0s0OHltbGpSbjIzeXptY3ZNK0k4?=
 =?utf-8?B?Vm1yZnVvR3pwK2lVeWg5WTh2QStpRGl4T0lDcXZ5MGhZM09NU0FwY3doR1Ji?=
 =?utf-8?B?Tkl0c3JRYmJVUEJVUnloTE13ZGhFS0xoNFdYeEliMmdXSElHQUE5QnM0LzQ4?=
 =?utf-8?B?SWFVSkQvemFwTnN4QWd3NEM3TUxJNUJwV2NwSW83K3RYdWF6YTQrWGFvZ0Uz?=
 =?utf-8?B?cUJqM0kycXl2QXNhQ1VLMlJ1dklVR1QwUnhOWGtrcGNrS1pkZ1FQMTROZlBi?=
 =?utf-8?B?a2hhR0VNVjF4WDBUaXc2NXp0aWJlUnF4MkErMEV5NFhPVk9YdURyZlczWXNR?=
 =?utf-8?B?a1RHZmVYdDdQdmlrNVN2cVd6KzNmZWQ0L21JZ2Zna3k1Ky9jM21VdUxoYnZX?=
 =?utf-8?B?dkk1cXFsU0txWTMzNFdUdEVESXV4QjQwWFJDaWNLeTVYeUE5RTBTeWFWRHo5?=
 =?utf-8?B?TDY4eStqKzVhWkJ3Sis2SjVUZU9YcmY5NW9RUkN1WW5PUFpSMVZtMXRERllN?=
 =?utf-8?B?WW5wYjRORm54clNHYVJ6VnlndEJCMEhXb0o2RG5qVnJEa2xxRXhPUjJ5YzhE?=
 =?utf-8?B?Yjgzd3B0ZFhDUncwdmttNnBkYWs4dHExbkd2YzRSaGwvejhhdnlPMDN0SzVC?=
 =?utf-8?B?Vmk4RmpUbUU2QUhkc3oyeXVOQTlCbkcxNTMwZ2hRZHFwTHVHcXNHNnV4RmNZ?=
 =?utf-8?B?VFRrVHJ2TjNqUEx3aGF1dHpjblp2VnU0dEVtT1czaWFxOENtL1pvSStiTjlw?=
 =?utf-8?B?VGhuOXNqOUF3VS9PWFpncis1c1g0cmJrUVR6V29idXJXWEdqcWxDL1o2OHBl?=
 =?utf-8?B?enlGU2tEUC9pb3h5dGNtL2lxRk9KT1VuaFdqUjAwS0thbmVFQ2JKREJodGJj?=
 =?utf-8?B?L3N5bGo3R3dwd2crR0xVQXZ4NmthUVV4MFZId1NWOWdncGFxRGc2dVhwVHBQ?=
 =?utf-8?B?dVBFR3MrVGl0czNwNk5ZMmFULzVGOGZsdytMUmdOenBNejcxMzRPVHFtdGZB?=
 =?utf-8?B?VkpRc0gxQTUzaUMvZnppbE1oY1BnUXJkWmgwTjJVckFKTmwrd1lnVHVlOWov?=
 =?utf-8?B?QzJoMGxXNDB6UUlkaG5MbzA4cnV4WFVtYUIzS1h1SHRxRUZaQStRMGE5dUxF?=
 =?utf-8?B?OElwbEd0U3MvWXZFTGxYVTBvNExibjkvczdnY3ZSbndPNnMwWjRaRVBlWURR?=
 =?utf-8?B?M3BkQ0lKL2o2YkM2ZThzYW40RnNnbzdnL3Z2VXlGeWlZSHNmVmdpVjI2bS9D?=
 =?utf-8?B?RHY0N0doNDhVd1JCVm1mSFNDaExBWGZ0azg2aW5COTEyMHYraXQ1dDl4c0xo?=
 =?utf-8?B?N0NTaG0ydzN4ZkFEQUVSamhtR1pObXdWU2YzTzdvbFhwNXc1TjRHV0xGVGZF?=
 =?utf-8?B?cU5UU1c4S1FWVXJHMjIwZDB1Zk1xUnFZWU5SYSt1REh0SFlyV2Q3QTNlU3dr?=
 =?utf-8?B?SmxQMjdXKzFwZ0JWWlZ2SUNzeWt4NHR3YXo0c3Q4MTBoQUZ6UVVncFZ3dm82?=
 =?utf-8?B?NWVHbGVnZ0VTaisyTHJpcFNQZXEyYTBoSTI1ZXR2bmtVZU9hL3JOMTYzamNp?=
 =?utf-8?B?YnZIMyt5ZU5nVEJ1TnBOU2k5QWdtV2tlRW9DZW1KSkpBbnk3bVkvSEc0UGpq?=
 =?utf-8?B?VVhOWGNUZ3FRbVdkRzEwYjVkRmo0T1dZK1IxTDIvbE4weWJqQU40YWhwMnds?=
 =?utf-8?B?Z1JBRXl3SWh4azdPLyt3Vm0xalZhS1Jyd0pSVS9jWVpQUzBUQ055VjQyaS9Y?=
 =?utf-8?B?QXlHaThmOFF0Z3hzUDhnUmNwRTEwSWV2VmMrWnIrcytCSE1JU3BOYlRDWWox?=
 =?utf-8?B?ZFlXdUJEeUEzYk8yRVZVZUcwR1NxbW85S01UOGw3MlhCc0NoZGU5cVhIMkk5?=
 =?utf-8?B?ZkhFb1doWXZqejFxbWErcytPTGlZeWcrWGE5VTNLcUJrT2hyN2FQRFQzSklz?=
 =?utf-8?B?bnExQmhZT3R5TThJRUtwUkRNcW1rSFkyV01YRjhpeG5DT0FjSnVtSXcyalhF?=
 =?utf-8?B?S0VLY3ZIMnM4dDNnc05PMDNLWmNSdnA5MGNENWdUSXgrS3lwN0Jyb2pmakM1?=
 =?utf-8?Q?Sh1P+GrKkam+7iqiWNLY+wVcHc4PH4HCcm6lblkEEM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a1c866-224a-4ca5-e937-08da01f345c6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:35:58.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE/OaCI8gnkVL69Wx6+FVsnm+e/t4BaVz7jJ3LTwR8Xg7yZ922J4P/z//iR9sqXXn4nBJv4gnJG0hXxD5luxkKX1WxCLXMr3L258fdXdsaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6050
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe05::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe05::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

02.03.2022 19:24, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to limit block_copy() call in time. To be used in the
> next commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  2 +-
>   block/block-copy.c         | 28 ++++++++++++++++++++--------
>   2 files changed, 21 insertions(+), 9 deletions(-)

block_copy() call in block/copy-before-write.c should be updated to not break compilation by this commit

-- 
Best regards,
Vladimir

