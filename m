Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179143B5D46
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:42:26 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpej-0004i1-4U
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxpbt-0003lk-5O; Mon, 28 Jun 2021 07:39:32 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:50158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxpbl-0004uh-Np; Mon, 28 Jun 2021 07:39:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4RUBBMo1Yg6M5TRhdtsWpG0NBl4OK1hj9f78s2Me1ZCUITlO+dTHSgrvRdEwO/PzqNaoi/URmxMqgPe7oaQPe5z9aeyaEAA27bZxsw59Y60QgJ39FgDmisXmUyob/6wPddcpEfZ+N+5TXp4B7fTp56onRj28xemNvILhCVv10/51YwnZ1qleYNnfAj60xHnO+r6046xZSOmwjoA1d7ExuNxfyye84RwbVCOLeNWGRBZlYIudsEN4GtML7RspGzWuv7gCTR+0i7SgH40i58UAUbvB5tHdUk0DCjkBnJebjGNPMO0OM04jmf+RWmEeg9CdUGTpc3vapoV3ucsEDJaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAb8uXZ0cjR+/BlY1aL44e11coASmT+VFLqstkUe+ho=;
 b=JsYHFK3iMGDgtCH1JiTtFAhYjDoZdCYQJZa19FYYIuG2lBWbBeUtOuTpBNPfAjL3YpDmxl81lWd9LTubfvl/v+48zff0k7Igl2FxKR+HMaNavaCBva3R8eJqdgquz1VIOwbTVk+fhWoe06Th9jZXfI47i5QDRx0/ivUz7CepUwS6hNZklZ9RWIahoCVl2JWtfABY/Qr1pyeeBuhZ0SanWn3kLr1J5LiF4uedZ1qDmTR9JBjUzIOIm94UwwTrcIHGxpbbz8ose5dGo1ynxQj4KxWvxQDpBPZZJFJHyfTI2365O9xxdUkCuPraJQPW8KhB2BcWY1S8bWzSLB8JAMRj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAb8uXZ0cjR+/BlY1aL44e11coASmT+VFLqstkUe+ho=;
 b=kGtEaJ/3lup79G7BAz1PD63n9CxGtVV/9pTomlSLOISeDFLrXwA7qc2hjmfE7LHJYM61EF3elvZAYi18fBbjFjWQObTJfLwCrdPE6rbHl06NmS1pm7nNp+PyumRJqbNYoWQ+KxwvXdaKqsIcFkapNQXv1A2et1XCI8Zt3z/Koew=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 11:39:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:39:13 +0000
Subject: Re: [PATCH 0/2] introduce QEMU_AUTO_VFREE
To: Kevin Wolf <kwolf@redhat.com>
Cc: eesposit@redhat.com, qemu-block@nongnu.org, eblake@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
References: <20210619142120.48211-1-vsementsov@virtuozzo.com>
 <YNMOJLtbNHh2A/99@redhat.com> <YNmfpBqNnXF0Mx8x@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <56722e96-0ddf-4f6b-6ec1-1b86c07ffaf3@virtuozzo.com>
Date: Mon, 28 Jun 2021 14:39:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNmfpBqNnXF0Mx8x@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0301CA0008.eurprd03.prod.outlook.com
 (2603:10a6:3:76::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0301CA0008.eurprd03.prod.outlook.com (2603:10a6:3:76::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 11:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e9e11f-7b01-45c6-7345-08d93a295a5d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256FB8FB36613FF81343AFDC1039@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A0dOxpNoSYo88uad2ZDZZr/wyc68ykhus3u/lNEbrUBIKFjkkUys+zeZ1jJp81eVyblZUAVRFd1uJrlPvgt6U4vF8JUng6MvMvL4eSlIsEzlShL1lZsqJb96whI0ANVCTVc+oE4e4zo9x1p7+AucMSr5/U16l0hGBEFUj7DkikcFWZ/BEy40sjYrof/aVetP9rNlvSecCakPCUprfiq4F4FGVo43DdW/LmT41Ov7qatP+2vksZnI3PqG2f0hM5B0/f0wSbe313Wu7KV0CuihjskhNBWknKm8dieKPwmJXlGL10UCfmLBsu2MOqIJsqg+RyN2s8BRnytTME+vqzQKDUEyuKBg+M0+JyLHLN5Yw5zFUCoZtN2CTK/SYpThky/HmUpgPyrUD4hEiEfACkSCTiesC/f4tPYj2SQsK3KsXGXJEbQdEfGue7iIMqWfPu/SDdtXmCiZa95+hCTysfsEoU+/7F5VvWm0OyROVdIWnzBvLbeUL6tiMtrKt9M9WYfqL4KlosJkLELXPXuHxFs3AdyKIVmKXfQcGQVQ3fB9YOH3MDXXmlwZ6L8Yv/hsSYZNKrgvwc5I80qIQWxTaglL/fPxaMsC/1funqlwk8hyznST2fV32gUKdIVCS4hb4MoVyr9ZN52UG/ZcBBO1CaGc+8QbwVb2+g4yFfEhkHO/1LwpHHfSK6ypkDU37NM5x7hqzPu1eurWtXot74Afjwl7Bt42UxtXhgCisrDxY7/Jf9ilIPrwWeFGAtuYJXAN73ugIGhmSU2Z9noqAxvEOvWqnjib+rW8EmPy0Wy2swXgwQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39830400003)(396003)(8936002)(36756003)(316002)(66556008)(66476007)(52116002)(16576012)(478600001)(83380400001)(26005)(66946007)(38350700002)(38100700002)(2616005)(8676002)(2906002)(956004)(6486002)(6916009)(16526019)(186003)(5660300002)(86362001)(31686004)(4326008)(31696002)(84603001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0Q4MFJjR2pMNXlKZUU1NDlSdWxxa2VUTXZkNnVTa3FrU2JHVE1kMnNnaHI2?=
 =?utf-8?B?VjhWN3RDcDI4YlBIZVA3b0FmdVFIZXJVbTNUbEtCWXoxVGdlVm9lMFViSzBp?=
 =?utf-8?B?Y0JYL0poSlg4SjdxQUZDTm9sUDF4anA1RnpDclBrYXVnT2pwcUI2eXJmaW8x?=
 =?utf-8?B?amNsd0xxSHkyYXI3SzRBaGJ0aWtqazRObmh4U2JEUU5Xd3dnQ0JHS25yTzFW?=
 =?utf-8?B?dUZJcjg1TTJQMjEzWFg0R3A0dmVJQzM3V3l1c0E3cy8yRUVNeFNvMzJVSEQv?=
 =?utf-8?B?emhmRXpaMWRhTUVscStRZUUweUxEVXU5REpSR2JjZ0N2MXV2a0dFOGpXRDBt?=
 =?utf-8?B?VmM0dkxtNTYwM3RFSUI3UjZYTnhlRkkyRGpoL3pFSzFCYlBDdU1jZDhFYTRn?=
 =?utf-8?B?c0JsekYyRnBYdjZEbGYrRXBhUW4wc3pYTFNOdFlKbUNLdEZzcXJxSjNMK2Zt?=
 =?utf-8?B?TG5KRmx1cUV3ZWU0S3V6SXVDdkdxaXY5VnJQbEh4OW5JdFUxN2Z5dDhLU0RK?=
 =?utf-8?B?dUpuODJ5U1o5SEROZlREQ29tVVJXZFBrN1RERUhiMWdDV3QrMU1zdVdYOTFE?=
 =?utf-8?B?VHhtSm14OVB0T1VnZzcxYXZQbDRGdHRhenlGaHJ4d0RBSTNkZDhsalEzM1RI?=
 =?utf-8?B?NGdyNmM1WDVIcFZuUjcra0JocTl6bFY3NEZqOERLK3lxLzJuMlQ0UkJDL3NM?=
 =?utf-8?B?NS90RWwyNEt4all1MGIvYzdoWlJIM3dzUTUxZ3hUeitSL1AxUWE1M0ZiUUR4?=
 =?utf-8?B?RmwyTUgyeFRxZkJsbnErNVJQSTJUbkFCRG5Ia3ZMYXFsdEhNcnRkMnBOUWVN?=
 =?utf-8?B?TnVsd3hhbklnY2VsM2RIU01wa2ZCemlvKzU5bm5zMjhPMWkyNUhrbDUzaHF2?=
 =?utf-8?B?OVVVM0RobG5JV3N6d1FIN1J5VUZOVXNraTZ6WDk3NnJaWmh2ZUVQUXdncWNo?=
 =?utf-8?B?VkNhOTduVm50SFpxZWpQeWRxMmR2c29UOC9pYi9kS1VOYThrSEZCcFVVU2cx?=
 =?utf-8?B?U0dWVlJvbW1GTWg1eTRPRnFjTlhrU1MxUWFoVCtET1VFZlR0YU95dWN6b1NZ?=
 =?utf-8?B?Si9oK3hWbXhybHpzZ1FjNkEzZzQxZXoxQy9neEdwYXNOVFVxdkZMcUl5OHdo?=
 =?utf-8?B?TUgrS1R1cEpCdWNCYnRwY0xkRitkUWRaVXh6aGd2K2ZvN2xqb0c3d044VzYr?=
 =?utf-8?B?aXZJUGtDYVFibDJycTJGWW1IMEFhaGtDcC85c3d1a21QZU5IYS8vaHk3WXMy?=
 =?utf-8?B?QTVCVWNjdExTMnlUSHpsMmkxVG1FUFhKL0ExYkg2d1NTZVpVbCtKeVF4TXBZ?=
 =?utf-8?B?SDBSdmlNTHMrbWdDVzNyVStMZnBHNFVpZXBDK2NiR0M0akxCWnVhU3NCTnkz?=
 =?utf-8?B?ZlhqanRFR0tFYzFWVDFvd0FYZnRJMlh2eVJINXNaMDZUMlRPSEdGbW5mRHVt?=
 =?utf-8?B?NkVhellXNTF4ZWdZb0EvRXhxNzBGL3RCYlpQd2w2YWgxTE9BNWRwZ2JwTEVO?=
 =?utf-8?B?R2lzRUNCRk1PNG45WFBtcVhBL29jdzRVeEhCNEROT0RReEIzcTZJSzJUWWs4?=
 =?utf-8?B?WXlOd283MTVSL05DNngwMlZkMjFQTzBXWlZSOHBlV3JBdmtPNDNudENNMExq?=
 =?utf-8?B?VEJVTnkrSk5nVk5UN1gzOVZRdERSNUg4UXpOU2tFWk13dS90NWhhYVF2cy9P?=
 =?utf-8?B?S0pBbWRuVjlFYVdLcjJJSUlWbWFhOVUxNnRoWXlIckZhZnVyTXIzcnh3djBV?=
 =?utf-8?Q?ulANVO0jmT/q3+IC9K9W2EONWsCOCgyyukKu8tm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e9e11f-7b01-45c6-7345-08d93a295a5d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:39:13.4835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khbo/EFFsJkoCIfbdU+cmFGAW2Y1qrGsOR8yTdneud0bjVduKEuIXreofC9x/Sy0BrNFXN7PyJhTD9UrbdMQE8yfyQH/674WjuTSx2YZ+Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.6.98;
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

28.06.2021 13:08, Kevin Wolf wrote:
> Am 23.06.2021 um 12:34 hat Kevin Wolf geschrieben:
>> Am 19.06.2021 um 16:21 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> Hi all!
>>>
>>> There is a good movement to use g_autofree macro, that helps to
>>> automatically call g_free on exit from code block.
>>>
>>> We lack similar possibility for qemu_memalign() functions family. Let's
>>> add, it seems rather simple with help of "cleanup" attribute.
>>>
>>> I'll update more places with a follow-up if this is accepted.
>>
>> Good idea. Thanks, applied to the block branch.
> 
> I'm afraid I have to unqueue this:
> 
> Failures: 040 141 161 191 249
> Failed 5 of 5 iotests
> 
> Maybe semantic merge conflicts that I didn't notice while applying or
> rebasing.
> 

No, looks like I just made a wrong thing and didn't run tests (hmm, or I was "lucky" and it didn't crash previous time for some reason). I remember, I checked that qemu_vfree is called. But I didn't check the pointer. Now in gdb I see that cleanup function gets pointer to pointer. So we can't reuse qemu_vfree, but need additional function. I'll resend. Sorry for the mess :(


-- 
Best regards,
Vladimir

