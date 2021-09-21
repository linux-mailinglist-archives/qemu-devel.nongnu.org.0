Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCE413597
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 16:50:04 +0200 (CEST)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSh5v-0000Xb-J8
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 10:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSh4P-0007Ll-0X; Tue, 21 Sep 2021 10:48:29 -0400
Received: from mail-am6eur05on2099.outbound.protection.outlook.com
 ([40.107.22.99]:15328 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSh4M-0004ns-FY; Tue, 21 Sep 2021 10:48:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHgsecIygt9MalWi31pRCN8BydV4f/IhzZK/XqSKKCVL58zVcqFVIQaYPxGKIR33i6fz7gaoR+6a9idEPW8k0VVUZQ9p4+Ah6i1vBoctMXv/65B2ckH4e7vn6Cae4HjAmFABm1FD1ohcshsU8ws5meiAmMomfhybPObBCw9dI8aAHfTtgyj+2EKBxuvamnypLRpx36i0DkhiJTEFwWz+umad2U9LHyNIW6fbCR0BNjQfHD2NCGpz7hPHsn47RGv+e+SzyDklpSzyFGQMR5WUY36e3z2AOv6Lh+DncmW4xCzmJ7YJA6OnnR+fFN0+stlZMfuI/XOSvwbg4NEwedh63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tMkGSekIqENAVphZ8nkcR3EWoS05JY++Loo5JB2bO1A=;
 b=juojWnHslNPpYN86ljHl1W+yf5KR2MA4zrz1Yob2WjtxQlpj7qZ4NDrqxeP76f2h0QKCUfYR+n4C+evqkVJWv2GyQgdpJbqkqgACjK9JcgiZk0LcDwPlbZmB1HRKxQleQJtgxnUIkmcdbJxeN3epbuDZ+xjfn03v7DtxTm1LeHuxBg135N8AMvVMmOAjNAaKLkEXx7J9FkQPz8qHJr3Y/XZ0TkTqu1DhE2RAO0ao0s7BaPrw/Dw0QhL8UNZe0Hgcg/HchKh71TPAbg6vycCs9NKtoza/LbFZK1jdMyC87hUbU8CfSMcpDfhdCY/9aWELNp9A01PGwa+hbER2EdvNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMkGSekIqENAVphZ8nkcR3EWoS05JY++Loo5JB2bO1A=;
 b=gJyS4fSvsqXz3zFB3IAQFd2voBOuodMKdqAL5l6XGMSnWZxvz9L7EwutT/89fLwufwKIjHe+H7rOngIQDfXRoSif+Pkz0a0ftPQiBPhvgn6M23nsxRkCB7vhLN72SuvzxbMwa1/8B2WghGVrKQUo5V67Uo9YC+Ik9sWsUAv9KVI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 14:48:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 14:48:22 +0000
Subject: Re: [PATCH] qemu-img: Consistent docs for convert -F
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hreitz@redhat.com, Kevin Wolf <kwolf@redhat.com>
References: <20210921142812.2631605-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <af7d38f6-5da5-2273-324a-e8e74de4268b@virtuozzo.com>
Date: Tue, 21 Sep 2021 17:48:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210921142812.2631605-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 14:48:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d89e54f-e1b3-494d-393f-08d97d0edbe9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6165FDB77129055AE0F4DBA2C1A19@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lc4IuGO0oRYHdVcJW1SAaZEdoDZAXfPGMZzGwwgeQKSSIBnX0n29Crj3YLHrLSXtx+SYNLdwKjCSQk7UZIpqvjyuxaJ16aZpM+eBczhK337lCht5eMa8LmgtXc0yoCivBkcA+iCGNxtC/ARZonKzmgAWg9HZRAmexaaHfLRx/yn+897XaZ6+Bum8QWC8NMiBIG4TgDlhaIiPu9LdZ/3IcucDnTDy26YZmpKPeU/VNj9pmRbEOLP3QSrMrC8UX+N0uUM4Y1oFWydJg0BWu52U9y3aNL8ewdZdrC/d7yl9gAwzSmUjXQsuJFM1OeX3dnVwYEqBRxfaKI5629k/9MOnxIftf09SXa4zZnhiJzFbr+diSSEl26gnCIIebE4wzmLHcDvgX+gAn5rtOYiIk/UqcO8tDk8O9yxhk4J7JSqKSFt4OuA+I5jn+cqfqDW5/5UQoJ5/6AMIIZdixVO3vIAnnfsnDNJEVyHKneSlkRT79RionWsXdmGn02I6nsUny9rp6dnDgBGSi3EG5UKq3YARZnUPSBlufvWwVYsQZyImU8FvcGvUwEUV+BADJyMx+MKtvkKZoV7p9C7Wj4tWvnR8IjxTLqkgyFL+MNgBBLHcdBqLeidEdn8Zptyzs28lTsnWhwr2j+Sv3U+n7KVVM6oHK6+BfRobAtSvbXCDzNo7hniMy2TiYR6/h1eZhTTJL1VvDJ3d5v3jUWLNXEpSxNOBJQfQIWTckQHMvCqOXjOvbkUBhi/I2t4sxEJSylbfrxo+/ykRWjBUFqi6LkYgjm+zOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(31696002)(2616005)(4326008)(2906002)(66946007)(316002)(5660300002)(16576012)(66556008)(36756003)(4744005)(31686004)(186003)(38350700002)(26005)(8676002)(508600001)(38100700002)(6486002)(8936002)(66476007)(86362001)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFh1Q1FtQVQzWCt0WmZ1aDY3SjNyUXpJUjM1Lyt6SDJ2TWJhVEpYYlN1eHB2?=
 =?utf-8?B?ZjdUaU5USUxFN0lRUDE0ZHhOa1Bkc1lEWWFQTlZHWDFhMzgwZlRMd0tVKzZP?=
 =?utf-8?B?M05UZytiRitpdHlGRmdCdkhLYStieGN4UGxHQUVraGlkelZPeVNLY0ZVMDN1?=
 =?utf-8?B?NVZQL01OZlQwb3FCTXZOdlBVZU1Va2ZTVkI3ellITGs1V2VtTVdjQi9JdEVX?=
 =?utf-8?B?bk9sWEZiSVJUSXhTeHQ0TXlEUXBpNnRuQjhCWlUzSVhRa2JhVTVtc0JFSnNt?=
 =?utf-8?B?enpvU0svOHMrMUNnNGNySklHaml4cXlTSXB6azRaSFdCdE9yd2VrYVM1ejVI?=
 =?utf-8?B?SndjZVVsWjZORWxIQVAyQXUxVEhmTUx2NmdieHFHNkFVdWJhTXhxcXZ6OE1W?=
 =?utf-8?B?QTBLOFlnWXFLbWZNenY2eXEvM205K0dYcjExbWF5enRRSFlOM3YzVjN6M3li?=
 =?utf-8?B?TVArVDNTYkw5cDdUZ2lzUVNxNnFLTVdTQUxka085cUQxejZGdWZSYXlrTFhw?=
 =?utf-8?B?NmpWV1hTSi9PQUsrRytuS1d6dUg2UkhrNS9seTdxcCtwa1JzWFlZTkFnM2hh?=
 =?utf-8?B?aVdIeUZKU0VXRXNJS3hiRlBTTUhjTUhQcjJOS3M1Zy9HSXBsMm5MdlFXcHlr?=
 =?utf-8?B?ZDFqa0I2ejU5MitYSzYzT2trbGh3QmhTRC9ZNS8xa21COEk2TVFFZFVHdXdy?=
 =?utf-8?B?MEo0Q05teGFPVk9zd0hsaWg0bW9mNm1rdUhjN2lMNEttWkI2ejZueXhyeUNo?=
 =?utf-8?B?NzBpT0IrQ3NKUFVvWEdTdXp1eVNyYmVCK1lqcFZoWmtlNjBLMkJHRjloNklM?=
 =?utf-8?B?QlE5QktLNUM4UzNpMDdlWk10Tm9qeXNuU1ZoS1lkVU12TnRESXZCY0RXekxi?=
 =?utf-8?B?dDRaYXBobjNFQnpTZ05JSG5sMll5RDcxTHJGelFOKzFDc20vNEZ1L3Q0cjlX?=
 =?utf-8?B?TGtPS0NlbURRNDMwNUxDd2tST1BWczN4NGpScTFEZHIwZGVDN09rR1dJWWNi?=
 =?utf-8?B?aThYRlRWdENaSWFIM2dGT0RvaWdUL0xCMkVidVVYbFRSYWJHQXlGd29QblRZ?=
 =?utf-8?B?MnRycHMzbHg2RFF2cnpuZUhMMWdGeENPbVplV1RPRFgvY0cxUW9CM1NnUlJ1?=
 =?utf-8?B?U09iV3h3YmgxK1VXVWpRNVNkSWo5WFdlNkN0UkdpOTljc1g4bEovb3lCTWVW?=
 =?utf-8?B?QzhkTzlXQ05oZklYM3JQSTRqVVZGd0lrY29Qa0Q5VXVER2o3YTZRWFhFT2pD?=
 =?utf-8?B?ckp3QldMT1ZZdWFCSFJvUE5NZVI5UnpxMCtEQ05HdDR5YURmR09paTZjRWZH?=
 =?utf-8?B?TFA3RlBqWW1UT2VHRldRNWNuYk1EWWtZMkkxTDVjcWZ3Zmx1MmdoYVdVdWNC?=
 =?utf-8?B?RFhMYkUxdVRuT1p6enF5SEFHNE5lbHcvamV1QzZkZjVEeDlLRTIxRUZuNzRx?=
 =?utf-8?B?aDJjVy93b2ZtTlpaT1dQMlBCZmRCdzdlSndCaGlkaXFOZHBjb1dndHYwZHo2?=
 =?utf-8?B?TzZaSmJpMHlrbGprSTNRcG8xTEFmTEwxT1dBY0FKTFo1RlN0MWU5RDNrNEw0?=
 =?utf-8?B?WDljL05la2xnaWFvbmxQSDFWVkhzZEdZOWdqcW03ejBEV3F1N1IwNzEzY1Jn?=
 =?utf-8?B?eG5DWmxOQnhjRXRtZkwzM0luRHNOZDhyY2VyelpWcWwzMXpvQTNVWkFKOTU5?=
 =?utf-8?B?NEt2U3IvNEhORGsrTUttbnBMcDBKQ0lMbXJza0dlRlFuQURFZmFkN3lGaHFp?=
 =?utf-8?Q?hBAbVUeaVNwtHhbKoo9YtBK+mNNkr4fbIVXQKWX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d89e54f-e1b3-494d-393f-08d97d0edbe9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 14:48:22.3688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egKotvmme3fUhCoZsQ9H1zAm8KAIHvkO5CS3/9IGSUFGRT0rWtiZHY1KQ+INHEf1qSoH9wQtXUEj0alf5kSDgd55v2oXrLZ6/vuj0QGGgZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.22.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

21.09.2021 17:28, Eric Blake wrote:
> Use consistent capitalization, and fix a missed line (we duplicate the
> qemu-img synopses in too many places).
> 
> Fixes: 1899bf4737 (qemu-img: Add -F shorthand to convert)
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

