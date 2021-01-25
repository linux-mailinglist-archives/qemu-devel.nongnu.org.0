Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C03025C6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:56:32 +0100 (CET)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42M3-0000wH-3g
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l42Jv-0008Gk-Hl
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:54:19 -0500
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128]:28387 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l42Jn-0003ZF-NV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:54:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kyx7/kr5/KeSKRWFIYQyMySnpODl8dExNWGLff6kkHPNgiurUkfdWpi1+/8+QXZ45OwibudVTrf8ZkSib64BwGrtcZVS36zPi2P5yw7znLC3v1T/+hpHhzOvaY8vJc6Iwqu8O6PsGiJmkBAt6NC1xgy1YP30vpCz9fuBUKp6XrBKzimkjZVRKYyIoWQ5mQohAcv7ANVr2pcz7yCDsDhJEz5OlzuScPjZlA+Mabe7MvFSV02ksRAqDi0p1L5t+6aZmTkPnFkAWZdkq0hrM+61ELHEt060VVY+JZbta7IwhogBu6ovjQbmhyKKj91QK+lpO5pYTJ+/SiugvQVTFE00lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+gGuvVoos+OfZjvQfvCCELz6FbU4FeZmbGtfb2UFHY=;
 b=dZAHk8eVGo7LlHa/CZ/30QJS5nNvvwU12ADP8Jf2GchI1f1YbwxHQgslQ5bjhlyxya1OBy8Rfp/nH73SDTOcAEtj9I8vRQpW5wwR28kJWSl2Sb0ggX+ok5JfgqADafE9kEpzNQTtBitEtQ7jyG+6t6ZY48XLunzVz1OJgme6Ez5FTcbyE/a/VM7jpuYRDEABmNWof8j75Agnx1FNXTmrkFgMj5bDez+3Pw0hcsIcUPF5dFUTs/EkRWBbifgjYUdBDy7wxWeFsasJEpa1Lr99MvxL4eOGpqDZrzRlB5NIZ4ZoI+t+DSI/byqTGLS5zMisDBtKzU/HIGDBIM14eP/Acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+gGuvVoos+OfZjvQfvCCELz6FbU4FeZmbGtfb2UFHY=;
 b=Sc0VXY10GE5m3SjF72iZ463mB2mAv7oBd7dNlV6/1tve01GRlCKl7a0w8ug+w13bLDaFZssy/xDJNnY8FeyQsbnJMmqxrdFm/O2T687m8nwuXUpljbjAq1UN4BMrtt8zwgJjYZswEOHjjhD8B/30TLyl+72fXj60gZdteVEBtiU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3543.eurprd08.prod.outlook.com (2603:10a6:20b:48::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 13:54:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 13:54:08 +0000
Subject: Re: [PATCH] error: Fix "Converting to ERRP_GUARD()" doc on "valid at
 return"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210125132635.1253219-1-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eba35260-9aa2-a816-0400-f1817b8aea1a@virtuozzo.com>
Date: Mon, 25 Jan 2021 16:54:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125132635.1253219-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.113) by
 AM0PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:208:3e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 13:54:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1f02a9-4e87-4222-a09c-08d8c138afab
X-MS-TrafficTypeDiagnostic: AM6PR08MB3543:
X-Microsoft-Antispam-PRVS: <AM6PR08MB354356738FE8B7C51D2F2998C1BD0@AM6PR08MB3543.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVjhHJ6EWRiyn7KmzLDbNDr04dTbjjUNW/UuUA9dD+kx+27q0mprbk4v2VSEuxQAZhY+grRttv23xwCHMO7lbSR2mbsr/9ymAFQYSxjutBzXG5yAPPngjp5B9BMd8GpC3JuArqRwB4bBOYnfhtgNoFWTHicRvrwIgeCJDtkdw7ytwKxmU0n24KY5bVs332c/DFAGPbLTSo75B3Ev18OzadRiCBL8GnMzgYkZ5S7kWCeBxMW8QHQ5/c5TEuDL40MOV1JVg0+UqCATwTKjrTCxbNJDb+Ozz73H7XB1tgp/o9xqM+lC6XrlNSy814oD2h5PClG1epi0UvPY/AY4WGd1Js7YQiWDM7UFrbUcg5xu4Ws5dvvfZTU1HVWR+hTJgaD6T92xgDhqmxzmOqACsfjpeoBs0J18lQaOnIEdvf000d/tlEKnAvewmX2h4hLUGqK1gRNn/y/eGhWScE0S9wDSRHIp286ovqbub6J7kLKEGCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(16576012)(6486002)(36756003)(956004)(26005)(186003)(4744005)(478600001)(5660300002)(2616005)(66476007)(2906002)(8676002)(16526019)(8936002)(66946007)(86362001)(52116002)(316002)(83380400001)(66556008)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ti93V1JLakNBMmdMT0dkYkxrYlFqUzlYeDB2MU9DeUxaaXJGL2NWYWJkckJK?=
 =?utf-8?B?aWdsR0FyNVNsT1dTTHFQRVdhaVd0QStzbUFic280dW5CbXhaOXR3VjJxZVU5?=
 =?utf-8?B?QlA0Q2Qrb3RpUVMwMXhidzlyMytTNmRTaldRT3IrYlJiV0hOU0xhenNQVFBG?=
 =?utf-8?B?TlVsbFJISkNyZzJ1ZkczZkw1aWYvZUhLcGtTV3FSQVZRckVaWnMvVTVxRDZz?=
 =?utf-8?B?M2o5bVB6MzlxTmIwd0JvSnY4MW13ZXpxQkhTRVFOU2orOG1GUndLTjdSSkc5?=
 =?utf-8?B?ZmZqeHc3Y1Nma0RHcGhNTnpMZFpPcUhkRFRDbFlCdDd1ZVJFT2diRzBTZHQv?=
 =?utf-8?B?SDZMd1oyZG9rWmI3ZmpsM0EzYnVCcjZVUWdleUNYQnNkQzB1Y01YT1VFRlpR?=
 =?utf-8?B?cDVMSkp4MUdrNlBDMmNmaXdKM2lxK3hTR2pmdCtmaVRaUjBKUXpGSUtjcUJG?=
 =?utf-8?B?NEJkVzBrSzBvU0hOUXhpZ0V1aHJUbHBUeVcwMlB1bjQ4emh0NzFQTWh2eW5L?=
 =?utf-8?B?QVViaXp1Z1dLREZ3NmEvYkY5SzFZaHZvdk16NWk4T1lMTGYwbitSenNpbEhs?=
 =?utf-8?B?MVB5OWtiN0FQTThFcW1jNVR3OW0vUEh0MzFjd0UxVFlXMUtSckFYS0NOcXpk?=
 =?utf-8?B?dmtkVFB5K29xUUZZZlJET2F3VTFHWjhqNHBhbHBYZmdjcXllRmt1TXJ2d0h1?=
 =?utf-8?B?U04xRnRSaGI3Nk1ZRFptVUFuMHR1c1hNWVkvWHcvbzIvRzV3K0VxdG1xcExp?=
 =?utf-8?B?cWU2czhHSzNlV1pNeTIzR01DSVBjb1R2ME15ekJ4cXYyYVB3eGdqaDhYSW5t?=
 =?utf-8?B?aVliVDZkVmlZMi9pSjBjU2RmemIvdThqWWZ4ekpLeGdGRWZCbjhmaDh3cnRY?=
 =?utf-8?B?ekROdmlxTG10UkM2UTM3bWpSRVpZSFlHbnNPeHk1a3VxajlDaTBMN1ovVXly?=
 =?utf-8?B?MDdYTjFtV09vdERFcFhJNGJVNGtabURwYTBjQVNDZTMyYXlpT3RjaE1HWFRn?=
 =?utf-8?B?R1VNL1N3RTJRQ2I3aThxZVROZlRjWEJrS3lXUURJcmpWNGJwL2N5bDZDN2tL?=
 =?utf-8?B?U3BwWXk4SEc2SDBXVDh5TzFHRE4wWmxyL3JnYXYxTTBiRW9LbThSdjIzdVFi?=
 =?utf-8?B?Z2s1YllWTEZUYmRuamlkTHdXTFhWU2RjT09jRW1xcCtaR2JIRjN0NEFicVNS?=
 =?utf-8?B?UlBCZUNTdlJKQlVsUEpjT2lpTkVsS1g3U1lJRTNhS1AvbnhlVkZxQWpnRyto?=
 =?utf-8?B?b0piSjBMZysyVmRIenBWWW1OQ1hNUmtySXVPZERVTnhEaUtHTlRwK0xHazcr?=
 =?utf-8?B?VEEwNGRzQjJISmhsUERUc1lDbTRYbnZnMTB5eWxqNHFhOHhDWjgvTmZqN2M0?=
 =?utf-8?B?M25lNWpqZ0xyODhSeDRwbzRwMFVHaGJvR3gyNS92ZmUvbUJWQnYvUWlrbGdW?=
 =?utf-8?Q?x1YMbi4c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1f02a9-4e87-4222-a09c-08d8c138afab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 13:54:08.3381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaVMFbV2wKf+xup1X1iAsDFuxpJzBcslFFtEiI1gvjFEypjUa8n68yBv/ymPCGErRL+XF2F6jqWbN1UwzOUbrJ+K9niQBPKZwdjPn75FaJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3543
Received-SPF: pass client-ip=40.107.6.128;
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

25.01.2021 16:26, Markus Armbruster wrote:
> Setting errp = NULL is wrong: the automatic error propagation still
> propagates the dangling pointer _auto_errp_prop.local_err.  We need to
> set *errp = NULL to clear the dangling pointer.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   include/qapi/error.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qapi/error.h b/include/qapi/error.h
> index eaa05c4837..4a9260b0cc 100644
> --- a/include/qapi/error.h
> +++ b/include/qapi/error.h
> @@ -235,7 +235,7 @@
>    *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...)
>    *
>    * 4. Ensure @errp is valid at return: when you destroy *errp, set
> - *    errp = NULL.
> + *    *errp = NULL.
>    *
>    * Example:
>    *
> 


-- 
Best regards,
Vladimir

