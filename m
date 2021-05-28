Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51F394267
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 14:15:31 +0200 (CEST)
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmbOj-0007wh-Sl
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 08:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmbM0-0006vP-Ts; Fri, 28 May 2021 08:12:40 -0400
Received: from mail-eopbgr60136.outbound.protection.outlook.com
 ([40.107.6.136]:3137 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmbLn-0007PT-IX; Fri, 28 May 2021 08:12:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZxYWkqv/5LDkF+fkxjHHjb5ITdfKbB6j/V+EMxiarp5iojpXRptt1j5AIO7D+un8ooDsnLBWAyif7bv+uhnM+ZW+TF4Kt3IKvbuvqIZmjxl5yEvlY6WSv2nflx4/bTVeuM5RwyojrgzrTk5ELzTSxqEux+7LVevNZ6EDebLUuwSpYf78boaHElnnB8v16HkLjRg0ao8RqGChdd3Vn284k0+/Up2X/iZR3hFSedY8nBAedA5aeeZlURPSZtOxBZhMIsc7eL9geHwMVPXCy/+HiV6sBnZEcZHuO5rG0rY2nGUcPLCN/LsXQ2L2wKn1X+dGWMqP1fQLnoVjgaHR7/Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J73Led7fUP5pNuERJ/IQJi/4WRd+ljf0EZUSEGk/008=;
 b=OW/TImjwv6vPoT/jD+HWEqYt4O1/kJrpvXHZGf6Ti+CnhlO7tkJkJwJ6gxr8fB6z1tv0Vygd7dT1e73iw3ElW6WIz3+VgmnJ8BcKI69vKcSRvhaTnRO4RpKDdrPfCAwHLZ+Hq7iaRNIkfgZy9e8dGehtx8u4NlK+Va2n9kO4tLNKU0/sH8qgIqHTzPX+tP9UQGt4eqSqONzHe/AbY3u3EVKAubAhWKKFCflFHPWHQyNE3GY5aFErD9b4dphQ+8tUec+HKojd7pAN6Na0ookugly1JUKrCivvrjCyh6XY8z6DbGtIX8VgukJFVDytlvuupt7DGul9Itjb0/B1i5A8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J73Led7fUP5pNuERJ/IQJi/4WRd+ljf0EZUSEGk/008=;
 b=YmXsmz6OlTlrBrr2hnGTic3Ie8eZcBBfDd4JO7gjO1lr2FHi2atalAUCZ5wYFnOW3qEv4EAmWHaKGrbD0me9cEYaJS2fGvHAsE6aUmaQEzE6wrQa18b3hDV+uWFRWkUldmtL704A8cPoIg0nti4hz76ybVY5O03Gj8P1GFkuWNY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 12:12:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 12:12:22 +0000
Subject: Re: [PULL 0/2] Block patches for 5.1.0-rc4
To: Max Reitz <mreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, dshemin@plesk.com,
 qemu-stable <qemu-stable@nongnu.org>
References: <20200811093505.972894-1-mreitz@redhat.com>
 <CAFEAcA_v=pTcao6-42bQP7yhVq1Zinjk-bbE71Bksu0=LaON0A@mail.gmail.com>
 <615bc8ec-d686-cdd7-88aa-8023c26d6c69@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d2b051c8-30a6-1fc4-e9bd-49163bef675f@virtuozzo.com>
Date: Fri, 28 May 2021 15:12:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <615bc8ec-d686-cdd7-88aa-8023c26d6c69@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM3PR05CA0137.eurprd05.prod.outlook.com
 (2603:10a6:207:3::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM3PR05CA0137.eurprd05.prod.outlook.com (2603:10a6:207:3::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 12:12:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4b8cda9-95c4-473c-ee30-08d921d1d8ee
X-MS-TrafficTypeDiagnostic: AS8PR08MB6887:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6887DAF3883ECA3EC6068C12C1229@AS8PR08MB6887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m674k/LyWkl7oa16gRVjqMwVSXRx+vMA+pFnHN48ZfFWNo14HLatyScwHgN8SqFIyZiBmKIcy2/gyAVZnJPBti2nY6bI/wMcWDFDePZthjXhXnlDmLJl5k19lKmR/vqUGExyx23TO4yihOzWzaTWE22KTNFvIgO3uEURz3J3mEy13vzobqB0aX8dGmBmgasrctjsiuVXaQ2Mi8HCM2yNkJuhUt3/u/JTpScOzRLYKpWMarkGg2otCx7x9suTuATQygb1Afffn8oosxAPka8EiS5Xt/E/DyteZz181VzAdZOOEVML/70SF4SY+GIFdjaHRUl4R2Sf3z5iHBB7GWWNJa6jD3oKM2ixZoNbeY7xz9X2rqQakjsQn1/5Q/3nZs9fUb6ORgCEzoiGSlZdZAgcJ+WSdIbUSplvEkrKw6sB2bKt/bOZO5AaGEN6kRFcNZWOe0tPAXq+koSYeRT4fqMrM0/Cvzj5qOnW52rOKnIYn2PmNCUpqMuwdHBoUpra3OG/w6BHb4q3hfeQoLEVCmZZTH0IR+9UV/4m2LZcrUqZNZ9XB5r66RxfHvU/lGX5DmDR4OURb6FyA+5tQO8siaBdLGaMkyrgSrKcBc0wvuirhWNmMK5hGJmwmW7AHEAxmZIwEgMEL38mk7ypxkjeRoHAo9BI5hVMYzJFDQeDzoZbo6hezadE4HjdiIOyeQnPlHrsOJ9CqKx6E7mxddgybg/0qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(39840400004)(346002)(5660300002)(316002)(31696002)(478600001)(4326008)(16576012)(54906003)(66946007)(16526019)(66556008)(66476007)(110136005)(52116002)(6486002)(26005)(38100700002)(53546011)(86362001)(956004)(36756003)(186003)(38350700002)(2906002)(31686004)(8676002)(2616005)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXJqV2lORWdqY2Zyc1dCZUdNdWlZNjdta2Y0ZmU4TUl6QW5jMU4yaEZKN2tn?=
 =?utf-8?B?bzNmeXY0TUQvY2pCSEpxM2doQlMrUFVDN3ovRVpqYmZEeVZpTFZ0REFWY2lW?=
 =?utf-8?B?SjY0NjlpRXAxSmpURHEraGI2bEVVSEJLSy95OUZRSFNoNW1EM056TUhKUG81?=
 =?utf-8?B?RkdabkxZWEQza3JWN1hUY2ZBUk15WFV2M1VJaUVHN0xQMHZENUZWdklxTGlz?=
 =?utf-8?B?RW1nY2Y1TnBuK3dqeVJyMkE3TXgyRktwK1ZjM29WWGF0dVNLQlA0WGlWU3ZF?=
 =?utf-8?B?bk9SNHgvQk9oYVpUT1VOczA5YXNYMExqRGpqVUlmNjdiOE5MRHAvMkNLWmFy?=
 =?utf-8?B?Q0ttc1M4WERrYm8rV0hlVlprbWVNVTNvdlhqTWNoell4S3ltUE44NndPeTJE?=
 =?utf-8?B?dStOZXpzUk42YnJaQUNiTytOK2Y1RURPZVVqampGMGtwbzFYTXduUGVOQXFv?=
 =?utf-8?B?SFh4Q2JxMzc0NTZZNmdRQ0Flb09Xakt3dTI5MmFQWWRHQm0wK0tLbDZKYWxn?=
 =?utf-8?B?ZGJPK0VGbnJwaFpIQjVYSHFCT05YVjVXSkhkNGRtUUIrRWhwalZEL3gwSUFO?=
 =?utf-8?B?ZlBQaWx6Wlc4WDF2S3ZJRmZ3K3hZbVMwU2FVWXhucnFsWnN3am5iWXcwTDVC?=
 =?utf-8?B?SGZuNTUwbWx5V29na1hVZVJrVzdpS1V2T2Z1R213bkd1YkFMcjVUNG5DOW5T?=
 =?utf-8?B?WWVxSHBpRU9XOXJybGxERDUrMERrQkgvQmlPa3VTelhoaUFTWDM0ZzhZZXUv?=
 =?utf-8?B?RVR0Q01FSjhpYk83K2JqS0ZOU05HV2dsWXBBY3lWSGFXZlVaMjh4VWFLN1Vi?=
 =?utf-8?B?N1hLdWphRkRWT2tZMkN2WFl4TTE1SHR1RWttMEZkbGw4d0lSa0dLZVBpR3c3?=
 =?utf-8?B?VXBMV0g0TUdoOHdidmVsN3MrdHViSzMwU0o5dXdVTG9NYTRzQndlOGVLelc0?=
 =?utf-8?B?OEc3WlBQcnNsbnhqQzBiQ0c1YnJjTFMrcFU5STdLL1pheVFURGgxb0F5dFow?=
 =?utf-8?B?cDZMT29Cek1hTlkwWUIrMG1TTjdTajhmV2lKcVhkMDdxT1VxalZYeGpST01u?=
 =?utf-8?B?MHNSRTF1bG5VSVZMUE0zeHZ5cGgydVZxRUU3VTkyRHVMQisxeWFGVEVSSUpW?=
 =?utf-8?B?bzJmejlJWkxiS2o2TFlmaS9WWXlva3VyUEYzLzFWNUdFY2cxUVpjNG5CWU8r?=
 =?utf-8?B?c1FvZGh1eGROMksrdkFBYUJRSVYxYitTV3lwbnBSSEp1dkdUYm95Z21XTWtW?=
 =?utf-8?B?U2c1SlRuSDhpb1ZzZy96b2dYMHdoSW5ieDV6eXNZY1JpTVJhdUE0TExXeGI2?=
 =?utf-8?B?dGpTWUxoMlY1SXMrdVg0ZWdtVFRvWmlTMkwrNlZqQjhzS1p6czBURGZYUG5z?=
 =?utf-8?B?b3FlMzRmLzV6M3hsRjBqOUo3NGxGZzJESjcweWxEMjExazh4eGJRV2xlSmov?=
 =?utf-8?B?SDZOWHRvVlkwOVNyL014NUpOTlQ3RFN0WDFUWTJGL0VqU0QyN3pTeVZGNUh3?=
 =?utf-8?B?aWs5OC9YV3pobnBsd2dRbWhqTHZ3L2cxdWRUZy9OWFBOYUNpNUduM1NYMHk4?=
 =?utf-8?B?cU1URmtNa2dLcXljWHRTSXhBL3JCeUJib3VIcEZpQklrL3pscW84Tzl3Nkxt?=
 =?utf-8?B?N0tlVldIS0JRdkoybVMwTkR1aWtqKzI1eXVmTWNybXlsV2lycU5pK1gzMUdm?=
 =?utf-8?B?Q25LTGNkMjNXbWhhb1VBRm9TNHpyZGlHZnoxcjZEbDRRdXppY095T1RmU20z?=
 =?utf-8?Q?XECLU7ty89fSxcGNTi+PrAxVPgG61gO7L0ZwYJY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b8cda9-95c4-473c-ee30-08d921d1d8ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 12:12:22.2418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAJ6dIk+fKyKa1g43/jZjWUmCXZEQpHhwrcDUmoXwlO+/umsztGarHHsyEb8O5w1LpCBZItfUVwktW5hblfOAqW/DEZJGvYyXo7p5SR/0PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Received-SPF: pass client-ip=40.107.6.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

11.08.2020 12:54, Max Reitz wrote:
> On 11.08.20 11:39, Peter Maydell wrote:
>> On Tue, 11 Aug 2020 at 10:35, Max Reitz <mreitz@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> There is a bug in the backup job that breaks backups from images whose
>>> size is not aligned to the job's cluster size (i.e., qemu crashes
>>> because of a failed assertion).  If this bug makes it into the release,
>>> it would be a regression from 5.0.
>>>
>>> On one hand, this is probably a rare configuration that should not
>>> happen in practice.  On the other, it is a regression, and the fix
>>> (patch 1) is simple.  So I think it would be good to have this in 5.1.
>>
>> I'm really reluctant to have to roll an rc4...
> 
> Well, that’s the information there is on this: Regression, simple fix,
> but little relevance in practice, and late to the party.
> If, given this, you don’t want to roll an rc4, then that’s how it is.
> 

Recently bug was reproduced by accidentally starting backup with source = cdrom (image was not 64k-cluster aligned).

Fedora 33, Rhel/Centos 8 are affected.

Could this go to stable branch?

-- 
Best regards,
Vladimir

