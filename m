Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA52F5A09
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 05:55:40 +0100 (CET)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzufb-0003im-AJ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 23:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzueO-0003JO-H6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:54:24 -0500
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:32135 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzueL-0007lE-6K
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:54:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odqv7Vs3REIFIp4S4oMndhN7p2IEQu6FFg4se+yw1i0bH84TMy2cOymYv9fAzaMLCQRCT/VmfAc9hJI79/kBJ3nCrtgcemYfHr7eVOyuUtdWaYzcICIougvxnqdGk35hMSAq0R199/gA+CivoUg2IVGWUYyeT/HiJxQbIkb7bpjtLxRJuuYZxDjp0SUzi1cu2OH7u0kPe9StiI+EZ0+mve30h9rKceTkVRHEAd6CAPjrnZFLRdTpji4xPJfdaxRrSt9hcTsqJsLS+E5EILolG2O1EgYgMVVF+a/xiWeTJQjSkpbxgqS7SDluz5fkfHnxwxlI3RrELfszKCv5L8twzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v84KHaDQCjW7RP21lxNcDltU2hgn4bCzkHPtjZaGJpI=;
 b=GqxUfJnh4W+ncSX/5mUvo4BLjba8zQa0SnHO2JRsW7lc+Z22Eb0baHqH+mJkY5O+zP79k9mqcYjB7j67ZaWgRht/yUA+Re+0BodnSqxAY9mkwA5WN4mebILUnE87ndq3l7dmQ2gLLdyuDisgXmD48OvX/fECeNclV278wwdwUW1XGZQOFrwQMoU/82gEbpBxEDNDQzAA6+j9n6XthvRfeU9OMGPnbBDMvjpOfIv2HKqPOcJRwW7dTnVIDODCR9kUrf6Ls3UTkQWdtnGUKZOHA/4MwITd31NcXlg/2wD4lHRI1bD+fEoTPi5hPgaSyATbyuam/a9Jftb2wjkjU4VX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v84KHaDQCjW7RP21lxNcDltU2hgn4bCzkHPtjZaGJpI=;
 b=KB1TNotIH54CXk+DArQssSgyTCC9ExTfziaXHEd6CvYqiVI3NSLyF8AYZCApbDnwX/+Ld/anPA8W3QOAKbIIpXZqsEbqTs6cM4LM5KcdTV5e1/cqChIwizOoSrcLJcpO6rzh5KoU/nTI34lkXBa7o73jeRWomWiSa5mfHB+1Fvw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 04:54:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 04:54:15 +0000
Subject: Re: [PATCH v4 1/5] net: Clarify early exit condition
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210113221013.390592-1-eblake@redhat.com>
 <20210113221013.390592-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7e1edd6a-dbdf-3c4c-4dfa-c181418d09bd@virtuozzo.com>
Date: Thu, 14 Jan 2021 07:54:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210113221013.390592-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM3PR07CA0120.eurprd07.prod.outlook.com
 (2603:10a6:207:7::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM3PR07CA0120.eurprd07.prod.outlook.com (2603:10a6:207:7::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 04:54:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6f47fd1-8c02-4a32-4823-08d8b8487161
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4342E552F0AA20E3144F758FC1A80@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hC+6N8B9asF+ViqBgUiwj6qmEVeN1ZCoRnnh3aitajYzvFfTmyIEFNQ/Z+cFZBxts/CV5Arxmf0Odo2yeLr1XqoYuen8zoebRvpU7YsX5DyxuqrPQ9AXZgK3ANQEBkFzcFVe5M5Uxmx0AwQQ6cvrxcSL38jngtPOS9f4GlLoCuFa+Lq9wc2k0CTg8dXs5oZsk+TFointKql4+EUzMbEgFRZmFCvgIZNaF9g6QgjiPDmGOn89TZXlT7I9hF/1lVIXa+uQYE/IkViF5KpAgdPxnwz7hPicu7KM7xIMb0Hg8WP8ArYdsCob9mocWzVR9DXFy26q47F53Q93WLgCTflH6TZcJAJUaGKTM2n8ID8iq1byfsuNBxI1XK7W52i9vR3zGluKfxnWfcpJkuGeq/7Blot84WDE5E5X6XbO+BjxNLGJrvjwsmv64v5WRMzF2JHRjPNTt9v4/aKy5IQzOjb536M5d5TE1ryhD6qVcm3Ugq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(136003)(376002)(396003)(346002)(478600001)(26005)(52116002)(86362001)(66556008)(8676002)(5660300002)(16526019)(83380400001)(4326008)(2906002)(6486002)(316002)(66476007)(2616005)(8936002)(16576012)(31686004)(66946007)(36756003)(956004)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWRVbnM0YllZcmpMQ2ptbUxvTjdzaWt5L2RlVEJmdmtwbEc4RzhDREIxd0tT?=
 =?utf-8?B?ZmRKZHhvbzlsWEZrMlVpOVMyWTYyQVJUYjlydjFYQUNWMEJQeFI0VVVMYjBu?=
 =?utf-8?B?S2tSQlNiU1kxQlJGNmlRM25Ecnl3TlQvUkkzSUVnZjNYZjEySzZwWmxSZHVL?=
 =?utf-8?B?Z1NzMVhVRmpQYjBHaW9hdEk2bEx5SzdlNWNBZ2tPTW5MQ1FVanZ0UG1FbVlV?=
 =?utf-8?B?VGxmTDdaMU9CMUhQd1gxQUVvcHJ0V1NlUC90Q09sSU53Ukx2Vk5HbUZUZVdi?=
 =?utf-8?B?OG5RejRzem1YYXBBMm8vY0x3T0dXSEJvaThKYVpKVXFVNmoyTlpGc0tkaW1v?=
 =?utf-8?B?SmRqZllFMm9wSHBZZWRQeTkzOUdWVTJWZEFNL0lLTmJRblhtYTRNSVcreTJ0?=
 =?utf-8?B?WjlxNGh1Uk5sMTRNQnhZNzhxeWhzOVNCVVlVOGtYaHFPcWozSXhFZ1lCUTl4?=
 =?utf-8?B?blNsYUs3clM2dy9WM0U1NWR3T2JoUG1jbmZ2dHY4SG9VY29VOXNQT3FNVStN?=
 =?utf-8?B?T3V4Zkw2eElCcUhwUWp2NDhCeXVmUXVLc3FMZnN1ZUg4b2pMMURKcnh0Y1lw?=
 =?utf-8?B?OUhBYVVyUHBWZEd0RkdtVGRYSGZ0ZzJJQTRzbSsxazMrVzlWQ1p1bTErVVpl?=
 =?utf-8?B?bjc0SVB6MTB4Z283UjBTeW4yR2dHRkordGprb1NHSVRsdU1hOWpEdFYzY2p4?=
 =?utf-8?B?QjVGSzhvamZFRitSRkM4VU9DemY4ZkZQM3h4UjdHWU9ibkJHN0FRemRVVito?=
 =?utf-8?B?VDBNT2FIb0tOWVR1UFo0djJ3QWFvUGVTb2t1UlRQM1VSL0VmVlNmZUZkamtq?=
 =?utf-8?B?YWhSQ1ZhZ20ybkRxcXFyenBqeGwwRjFjQllaSDR3bjRyK3VGQzA3QVc3L0NH?=
 =?utf-8?B?dnJHZDNTR3M5SDVLTTllRkhpNlhsTkRxZ2UzWDl4Y005TGthMERpNG5vSmt1?=
 =?utf-8?B?Z0d0QnpsZmJzaUc2RUdSUkIvTnlpODVKVkFMRTd3MGIrV1h2YmpNS1o5OFNk?=
 =?utf-8?B?aHpDMCs3QUdyWmxENzR0K3Y2czgyZ1hLR0NSK3ZTbTc4TzB2VDlWcE5zbU9N?=
 =?utf-8?B?anZIMTNnUTVFQmUxQ2VkUmk1K0czSTlVNjdHL0NKenh6eks2UVpyS1ovQkI1?=
 =?utf-8?B?WHhEMjNGZUdNVWU5RkltdjFFKzJ0RldLZ3c2TXBQOFJYY2pRVW1nOHE2Yncv?=
 =?utf-8?B?MndXL0V6UVhSYk4wUi9Da3dHU3paY1RoOEZaakdJQTgvVmFqV2pDUnJrcTZx?=
 =?utf-8?B?R1pXQSt0eU5EVGdNdXp5cUJrMStrRFZkWmN4Tkh2NHRJTktQUjNTQkxWYWRB?=
 =?utf-8?Q?TxDZ77zRDTRlhA3CshR3edI9B+CJMzjXAP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 04:54:15.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f47fd1-8c02-4a32-4823-08d8b8487161
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jN8pjiFCQIyLFwnd/1olzurGo3cwdt5S7BDd//7YJCyHpZPJ8cFQFvx/nO036FBlDqcO7DVvND9nBYOOU6gCLbkdSDT5e27IaLJcr6nQIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.6.122;
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
Cc: Jason Wang <jasowang@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 01:10, Eric Blake wrote:
> On first glance, the loop in qmp_query_rx_filter() has early return
> paths that could leak any allocation of filter_list from a previous
> iteration.  But on closer inspection, it is obvious that all of the
> early exits are guarded by has_name, and that the bulk of the loop
> body can be executed at most once if the user is filtering by name,
> thus, any early exit coincides with an empty list.  Add asserts to
> make this obvious.

A bit simpler (for me :) observation:

But on closer inspection, it is obvious that all of the early exits are guarded by has_name, and in case when has_name is true we leave the loop (by break) immediately after allocation and assigning filter_list for the first time.

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   net/net.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/net/net.c b/net/net.c
> index e1035f21d183..e581c8a26868 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1211,6 +1211,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>           if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
>               if (has_name) {
>                   error_setg(errp, "net client(%s) isn't a NIC", name);
> +                assert(!filter_list);
>                   return NULL;
>               }
>               continue;
> @@ -1236,6 +1237,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>           } else if (has_name) {
>               error_setg(errp, "net client(%s) doesn't support"
>                          " rx-filter querying", name);
> +            assert(!filter_list);
>               return NULL;
>           }
> 


-- 
Best regards,
Vladimir

