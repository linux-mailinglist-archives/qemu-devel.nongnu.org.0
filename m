Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF472F9F81
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:27:24 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tcx-0006Kh-Lj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1Tbm-0005oP-Dk; Mon, 18 Jan 2021 07:26:10 -0500
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:65506 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1Tbi-0008Bz-NL; Mon, 18 Jan 2021 07:26:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PW85qjaAf2wpue8qWNhTr2EUD/F8lMuNMuIvNdMuP4J21ter3Mfv/w562F9+uQNncg9IWsBc/WZsBIyaJWVgvcxxgtIJQKOfCF7pm2GOqOO1FZiQc63KrCIo41dgjPdUfeYtTkbocPwWL08CxW5QOE4WpTHiCwhQOx4NyAH/8Wk/UfEdJV1+12q2BO8AnQZ70I4QNyDFZOD0roRMOKxUed4FkmeFarTfVyvI3lzgVxWP6eKSVRI5PuM5BIheRvszDdTHooclO2HNuwgecty6GL5yFDRXw8TtlrfYgmM6AJq6e8KJUhHt30n2xXEcN9vGJvlHKbEV+giRAdwOt3IMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJVpQHJTbb4JICve1I9f+ShPV4Op8CkdcLfCEtHcXl8=;
 b=OaEq81Uv+xDUsq/p0Ur5xYUy0/luiLzAE3qr4PGcgBUa86IRDPPl4Ewo1vkxZuOOJaFwu20QSD5rX3ucF/f+NypM7qvI6jnZVhFJLMbovmComI2xONAju6MQdnMnQEbGGo3IlupkvIUGFdizeQmQNPxAYOga4Y/HmtQPYnU4HxNHBvDIIqL3Ema4YWZ70BOm39gkonaFroFkRxOinbEavoEzUD2XFX4MuJsoUUS7ktKDCg3HU4Q+hmXWNXc8P/F6XxdNw+8RtgNLafSKkFabruKg3+j5xT9XpbclqB4L3ZNq6Czwzga6nVekaFUrCoo1ORyF6E9aaBE1J07xMV23Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJVpQHJTbb4JICve1I9f+ShPV4Op8CkdcLfCEtHcXl8=;
 b=uKk3MnX+RK9rcj+2qa7RIFxEiKdWcVXgawT89c5LTbXljsd4jG5cE7ELpNA/Ze2Cr5cwCFATSH60PFX2PiHE+ZjLRIZvq+s/rD/p2HIbz2i3C3rxaX6jKoOvoL3qNYlBdoDyCYl/Mj8sAeOIxvHRadswTcXkTLwlvWE8262GQZ4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 12:26:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:26:00 +0000
Subject: Re: [PATCH v5 02/10] iotests/297: Rewrite in Python and extend reach
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210118105720.14824-1-mreitz@redhat.com>
 <20210118105720.14824-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <018d9715-51d8-9167-5883-40cd5743dfb2@virtuozzo.com>
Date: Mon, 18 Jan 2021 15:25:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118105720.14824-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.116]
X-ClientProxiedBy: AM0PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.116) by
 AM0PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:208:3e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 12:26:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba501a5-b2a0-413e-8472-08d8bbac36f7
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256F4383363E9EE3B850F3CC1A40@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkLS2Vws37IkSpn7xiMwsMJ/kGX5ngW+RNwQYfJO2UMrS2vRiTvH6+0rR00c8P8UpjmtOotNwvpFfgVNx3zDuTX4hBnugqeSIHvDkmpOdyJK3GvDkb1jo/xzI7+RKzbItOlgJBN1iP7atMV9cczQwKFAf2Av5Or0X5IDkr5+wpCGFRGHS/FNGutrGtxNc2VOZhF6P/L3WKzzHrn45eAqPLDeGqFvMvBZ+8zWY2c27zWds7OBGTSCh5dxrKL7XamZJqjzoY2GIJ/Mku4b4pqyc+/h2SYE/lKDk9RxXTO5Gg3rQZaCGfU+fj9KcRw7lzYI7BOFPQRqQM3sOsCp2yIeDvbAf7IPrF0Xp0HPEJxtg0undYgj/8vplNe5WFCpxL/dlw/31crI5+3SpQry1ECO+9RceC3VIWpNc/EsXI+VfIlizNTGSkBZXDv2J0ImjrFApka+VsOfqq/0japH2tbYUaFGQrBElYBCvXqyvGBTv92Yl2715tqmCX1Oi3l3n/Zp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39850400004)(346002)(66556008)(478600001)(6486002)(8936002)(5660300002)(83380400001)(66476007)(66946007)(31686004)(4326008)(16576012)(316002)(86362001)(186003)(2906002)(16526019)(2616005)(956004)(31696002)(8676002)(52116002)(54906003)(36756003)(26005)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWZCRTFvd2ZtU0R3UDlSakdsOXE0OWpCVE1JVHJFR3NTZEJGTkluMG42RjVD?=
 =?utf-8?B?Nm5nNk5LOTRTc3oxdnppazduZzBVSi9Qd1NwWUNzejJscnJQSkFTNVpJK2tt?=
 =?utf-8?B?UnA3T1FvQXI2MGppSzdCbnVEOHhFWjBUQTNKaHpabHRTbTA0RjN2K0JVTzV2?=
 =?utf-8?B?SWZKMGp0eUUyOGNnOFlyUHg2eEhRSzJ4d2hQMStxOVB6d1FqRmVhSWhvc0U5?=
 =?utf-8?B?Umg3ZTJEb3pGWklxZGMyVTJ1aWdqbE9wZWRpdm82WHJYcWlRL0VuMHcyaDM3?=
 =?utf-8?B?MFBxWC9PaU1BaXJjY2NuL25acFVQbEhmUUZjTzZDUFErYThaZTFucCtWMExC?=
 =?utf-8?B?bEdJVEpNN2xjU08wLzl5Y2lGQjVsRXo1MHh1L1hWeGlTWG9aTTl6OXRGbnlI?=
 =?utf-8?B?TW5RajhlSHJpZytid3pVOCtwTnF6TGh0N2dWK0traDdaOVdyV20zcFJXZkt6?=
 =?utf-8?B?dWRvamYzUGZSMnJzRzVtbFRIVUFIc05yMVp6TTUwbmIzWXRSNVh4VVJzbjZp?=
 =?utf-8?B?Nm5Fd0pxRE11eTJOTXg1aVFFTlBLUEhlSmtSUEpEZ0o2L2JKb0dkNjliSW1F?=
 =?utf-8?B?N05NMFNFUWI0emN6SWl4WE5MOE5Ja3NybDdSSXN3UDI5a3I3SGtDRDFFeUM4?=
 =?utf-8?B?UWtxMzVITnBNb1hMMEh2RkkzY0NWQkFhUnhRNlFsYzRnMUxxcVFKZ0JONjVJ?=
 =?utf-8?B?VzViUGJ6VWZoTUc4azVzU0hXYS9XYldOS3RRZHlRTlpDZ1VPTE50a1VlcUhz?=
 =?utf-8?B?ZldFRmRxTDdwc3FkM0FRNTdaczlzcVQxWTB6MFRrNzQrNG82TE1UYnFsSzI2?=
 =?utf-8?B?RCtmWlRJakJVa01WQy9Qc3B1bnBVaXhPRVVlTFZMQkVNOFl5R3ZGYUphbGhE?=
 =?utf-8?B?UkRkOU1NRlNDOSs4b1VzbjFHa2MzOTlrZDF5UDladzFiZXhSMDZjcHY0SmNp?=
 =?utf-8?B?MVpmOXZ6cU41YUxPQytKMXJSUzgzcFpjUW8vaWFxRm9ZYy9SK243VitxMlRL?=
 =?utf-8?B?M1J6cmQva3BLY0ExbytQZ0FFVkdzZTQ3SFhDbEY4R2lqVzNycWo0akpPOEF4?=
 =?utf-8?B?QUozU1hiTkhybU4wWDBteFRHRGlrZmNFamhKYllxUHBzL0kyL0JYQjBkSzNY?=
 =?utf-8?B?SDc0WVUvWWNET0pydWZPRVBGV3VmSjB3eDB5cGVmZzNOa21MR0ZQZDlsRWdC?=
 =?utf-8?B?WGFIcGNIWnRjd1E5K3VZZGJHWjU3akwwSnNYWlArdlRtRW5zdkFyelI1R0Qv?=
 =?utf-8?B?MEsycmwyWk15MXlobktmbTc5RHRGSTRtd2VWUVFYY0plR0RYUGxXcXp5VS9o?=
 =?utf-8?Q?0TbkJhPJ/rcXHy11OdRB9YUd2XqEuQBANk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba501a5-b2a0-413e-8472-08d8bbac36f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:26:00.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8sm+WUOMdfoJcuDK+JIBDMY9YFVaKbe4jhVGOiJxtawGZWs9+v0fZmT4G2aY9Zo1eD5iArcCun8k1Y6is9tCqdvaY6LlimIF61BNqWUe7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2021 13:57, Max Reitz wrote:
> Instead of checking iotests.py only, check all Python files in the
> qemu-iotests/ directory.  Of course, most of them do not pass, so there
> is an extensive skip list for now.  (The only files that do pass are
> 209, 254, 283, and iotests.py.)
> 
> (Alternatively, we could have the opposite, i.e. an explicit list of
> files that we do want to check, but I think it is better to check files
> by default.)
> 
> Unless started in debug mode (./check -d), the output has no information
> on which files are tested, so we will not have a problem e.g. with
> backports, where some files may be missing when compared to upstream.
> 
> Besides the technical rewrite, some more things are changed:
> 
> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>    setting MYPYPATH for mypy.
> 
> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>    paths set by the environment.  Maybe at some point we want to let the
>    check script add '../../python/' to PYTHONPATH so that iotests.py does
>    not need to do that.
> 
> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>    comments.  TODO is fine, we do not need 297 to complain about such
>    comments.
> 
> - The "Success" line from mypy's output is suppressed, because (A) it
>    does not add useful information, and (B) it would leak information
>    about the files having been tested to the reference output, which we
>    decidedly do not want.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

