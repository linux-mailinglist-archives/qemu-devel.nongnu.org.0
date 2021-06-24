Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418583B2C9B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:41:26 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMnV-0002TS-9D
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMla-0007LF-41; Thu, 24 Jun 2021 06:39:26 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:61726 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMlV-0006hg-12; Thu, 24 Jun 2021 06:39:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN7y9KSx4q7exluHOnWZlPAB3FbbGBJRI11v0NUr/KCk5z/Ksbai8O+LSVD0QawS6J+zHcHFWHLdwDYz2fjnjG8dN3mkUHMDy/BGGAN7DN7YgHYOqKBK4mf9p+M7u/ynFrBHZADCuC6if5fybRpVlgGgugAz06HvfMQd+f/LNQURWD81UssJdSPIYm7An+HGwZzG3BNR63ZbnPaj1h4nZEeQuQAmX04R0GFsM7uKUOHRzy252SdiBULPZ9OGL7RlllrtH6OAqE/q4tMhfEHWN+p349t50ju2h4KsFHP9uuDJg1m2G3e5ZEbzlXKS8PU77bDbz/buuS6CZs83M7whzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyov74I+evJUBybNT8cY+iziW5MIbl0XpC2+J8ldkKU=;
 b=MYiKMtSNxeFzOi/jM+VbvGHu2+TpNAt5BifAvyq+eH/ubUeCbEuoVnsL2FuR0sjL7fCBk8u4qIo/5GDU/ud3m2Z/fpt/kU8ME4AcEDthsBayIm+g65n0TowOwt3x2vBqQzHCw/IICz2ceDdg6FC9V0Xt8bh2FFgRpC1TYT+8mREN1QT0TQPSq7m47AVn4QL0YSSX3X9gGpq2YImoI4TaE7mF8vXP433E7wYNGa65GIgTk7KSZ6/9Z3O4BFy6pVqdtH+VqhUBiyQbiBGnuYOSR9fra4GaTOHuJm6QlLHGA1cp0tXhPO2l4DyVuVPKRMAUitvl2RPCjHoUK9cIxvqxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyov74I+evJUBybNT8cY+iziW5MIbl0XpC2+J8ldkKU=;
 b=JezO8MSsQQVl3q18SMUA/2awVv/MvT4U3o82mXQkjsDfglBWMenfzPpO40QC8ipCWW/Jb3F1+UcSWbo5Hc/c74lr1QjNNUvzmGlkxXyOodVUjDfX4YHBr0fA3yagOmAp3U9bJDlrNH5XILSxdk88vN/kfYRXWsjr+1bwED9UmKU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Thu, 24 Jun
 2021 10:39:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 10:39:17 +0000
Subject: Re: [PATCH v2 2/2] iotests/307: Test iothread conflict for exports
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210624083825.29224-1-mreitz@redhat.com>
 <20210624083825.29224-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0a2840d1-e276-9e10-e03e-79964d1498ed@virtuozzo.com>
Date: Thu, 24 Jun 2021 13:39:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624083825.29224-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: AM0PR02CA0144.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 AM0PR02CA0144.eurprd02.prod.outlook.com (2603:10a6:20b:28d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Thu, 24 Jun 2021 10:39:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a4c9b2c-e711-4017-3dba-08d936fc516b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17162759005ADA4412400536C1079@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71r7rY2yoPhyT8m0y7fHyC73q3mwp9YrYEsQu/0qqaJOj5yq2D+K+AUr/h6G+lnMsTuLuA1B7TufKzP2b926rPk2o+X4fuoY/bRVw8P+fbw8SiXJurEszkzxIAMpdCgfv22G2DbDVxKSsYaRmYlQ/ix4EGfGqrrXVxba9JUHwf5zFhQwmSwi5RjZELYsn5YhOzqRoV+ah7XBm6eqHy503mCDm9lARMQQzmy0pc3peEKJTB1an8lHc1jlZ/kDBCqt0M/zSQ6NIhPttXtQ61RfSyn/n9tCXo6YUndcOJ4bOCU8ewUbiBbNoZOZAmedYDP5CItwkZYNZx3Ce4SLMmsCy5Pd7janYYCTLLChLI8ziNKgq3jnP4GUoJjA0fr/Gn4WPi8NNrvw8SyRvJRfoxESWHUCpIIRdpCKXL2x34HcfKCvjLanLuEI1QsvexIIf+eN1Er1vXjSktrIsSKEGs4OgGPMiVg/SJodkhS7M0KmTBVMIQorbUTt11ZBqt31RmFIvy43c7qCb7m4VPjZPyxr4XDJBLHFcTjEuc6XH1ZfVraIrmB9oLiwxho8jhrpJlG0pewk4FaOQbV/Kko5CwE7YE5HzFf8NoH1heFFUtFP3JgYJEgfz93Tj+M+HAyqfkZ82fj5gxiuFJJGO7pPTy9fv0kdTnbPMg9Wn145Fa2uRudWgpbgZqJLLFCun7FyerMHxHe01e/BnkYMpRLdJIX4OvShNgoXlV0778Q/5zq7yqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39840400004)(366004)(346002)(4744005)(16526019)(186003)(26005)(36756003)(52116002)(66946007)(5660300002)(4326008)(66476007)(16576012)(2906002)(66556008)(31696002)(86362001)(6486002)(316002)(478600001)(31686004)(956004)(2616005)(38100700002)(38350700002)(83380400001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRYSlBEV1lrNUxhVXVBbzNvdDh2dHhBaXpRRGRiaHU5YTdHbVozOGR3NlRL?=
 =?utf-8?B?aXdsdEtINHJYSVlFRkVLbHI2Z1YzeitiaHZTRHZKamNDUXJQejN0a0pmeHZK?=
 =?utf-8?B?bU5xaXdudkYyWXBmeVFOaFNHTmFpblEwQlJsU1NjOVorU0Z4OXptSnU5U2xn?=
 =?utf-8?B?aTJiU3lOcGhQUUNnY2Y1VWpzV2NseXkreDNLVWd1Vk9yR3c1RllKNkh3NExP?=
 =?utf-8?B?MDdDcitLdGV4ZmhHMUYyNkRzd3FONzkrVVdDdFhmNjRHUVFHVXJSZXgwdUVx?=
 =?utf-8?B?VkNvcXBIeDIrcTlyV0Q0KzRGdnBmMlphL2FKckU5bmV0UnJZSEo2cnROMlkx?=
 =?utf-8?B?Nklab1VJR3J0cGJOTWtIYWVwSWRZU0FmbGlERDRPWGNFRnkzZnpyYXVTS3B4?=
 =?utf-8?B?eC9lRFNXSWpic0RzRGJuYjhnY3NYWklyakswdDVSemh4NnNhSHBUVWo5YnE2?=
 =?utf-8?B?eXV0VFJ2ZlN0UFhTSTV6MUxDNm5ZYlQ2SmpaYmc3bXRvc0RzckdPZmEzRnBo?=
 =?utf-8?B?UWtXblBhMU1nYVhWMEdIL2dONjg3WDU3QTNSY3l1SzFoek0yOS8wRUtwSktE?=
 =?utf-8?B?YUhOeUs3blp0SW1iMW5Gc2xoT1BCSFEwcmw3U1h1UHROOURUbU01U2lBZDJM?=
 =?utf-8?B?VXk3dnpLUkN2N04zdkl0WHdWRVhMcDZTWTF2aWYzTjdhWG1oM3UzOTdlUVk5?=
 =?utf-8?B?VWhGa3Qrd1gra2ZPNVM4eUVOakNSNGY2WGtmZytDSzFLd2VXNk40WVZhaU14?=
 =?utf-8?B?NnJFR1BDQmVRajdzU3JLdXlQc212QklUS0tzRzUzUEJkZzRqeEdXNVFSSVEx?=
 =?utf-8?B?QkdiVDVoM3hoYURjTHdSdGJsak5uTi95Y1V1cHlPeXU5NDNmYXVVMmcwaTZT?=
 =?utf-8?B?NlducUsvRzFPUGZBNDJ1d21mWTk5eS9QdlkyajRVU3BSNEppZGF5Z2lZc0ZD?=
 =?utf-8?B?UllyQlN6L1FWZnkvd3dtSEE2YXcrWE1GbGtRUGdZeTBWa1UycTY3ei8xZzNs?=
 =?utf-8?B?YU80RUtCdVdHMnh4STBGVDR1YnZIdGQyRGp0L0I4aHVQU1Z0Njkzc08xZEpo?=
 =?utf-8?B?Q3gzZzU1dGhyTTRpSW9GOCtCWnMvT1gwTk1rSDRFQkdheUIrWUNBZVhCV3Jh?=
 =?utf-8?B?U1lOb3FyRWhvN3RJendvYm1JZ3FvR2VBNktWTGh6czNnT2UvMnBOWStMY0t3?=
 =?utf-8?B?L2VDcmVoVFN2bDRrRVVRQUs2VmhMc2g4SGViRGcrTHRCa0R0ZVhuNHRGR05o?=
 =?utf-8?B?cTJKdGoreUladnRkbmxSZHdVT1pUMVdXM0dCN2VxRzd4MHV1WEt0Qnk4dXBJ?=
 =?utf-8?B?a21YbUxKa0V1OVpJbS9Pck5xY1RuckhFOTVOZ21ZTWNFU3BEcFdvaFZhSjJC?=
 =?utf-8?B?QTg2bHJiYmJVSS96VlZpV3AvQVd1RU5lSmp4SjJVQWRaMjQ1V3VYZ3k0UDVX?=
 =?utf-8?B?WWVtT1FvWVpvcFRoNzNDaTB0M2ZUYS9yQWNUclZ2MFpMTHpPTHdmNnJ0M3hJ?=
 =?utf-8?B?WVdhREhmemJvRks2eUt2b1ZOMHZmZUpndE56b2NJTWRDQjA5NEc2MHhLaTRj?=
 =?utf-8?B?bGJEdU5qcE5yRjNBSkRKL0dXVEhxQ25LN04zbDh6dDNvR1FqVlFtQTkxeFdC?=
 =?utf-8?B?bmlUYkNBMlRONXNucWs3L0xDa2JmWkswd3FiVnNLS3h5YXVVVEYwV3VOekJW?=
 =?utf-8?B?cEdFK1NEd0RZZTVKeVdTbWx0VWNKaHdxTmNLRDEwVEJvK05oZWd0NDk2UHE5?=
 =?utf-8?Q?6xiJn/Fhhz/tDgu9h9h9SE/sPIPFj13WDASlgdK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4c9b2c-e711-4017-3dba-08d936fc516b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 10:39:17.6153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENAnFYs3c3eVcO6aHqm3+2x4Jvs9zAgHF9vWuEh8VqGemrXBxEPu24Z/axZ9SHS46vNTegwOBMGoVJJuThrMKdFD0C4+N6uhqA/wH5Ua2tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

24.06.2021 11:38, Max Reitz wrote:
> Passing fixed-iothread=true should make iothread conflicts fatal,
> whereas fixed-iothread=false should not.
> 
> Combine the second case with an error condition that is checked after
> the iothread is handled, to verify that qemu does not crash if there is
> such an error after changing the iothread failed.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

