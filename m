Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2DF30C5B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:32:12 +0100 (CET)
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yb5-0006SQ-JE
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yIo-0000fW-Es; Tue, 02 Feb 2021 11:13:18 -0500
Received: from mail-eopbgr130105.outbound.protection.outlook.com
 ([40.107.13.105]:44867 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yIk-0001qo-Qj; Tue, 02 Feb 2021 11:13:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVudmc9LultjiNNGX+gbItFLV3436KwHAdyUzI0xj/GZht3H6NqoH9/a2SpUF88bAo+gpIPuv/H2A0aoeoOyhHHIqE/nSHxagbatK1rLwSJdSPMw5QzLHQvlQafVXv+GdyLqYplKuRtvr/1Pifxwhit+aJobfEDomeJheIY+y3JvvbFDH4Ta4/Kh8SQ4Tc0kiytwmpQMTtu/8h+nqMaSyDaUYD9HdVT2PKcIhtQeDIDbzjnx03O0+pHfs+5DvRxZeV/cnbvJRlHDO1UrpNfLaAOaIRWm9cl5yAj/VX21J1NGuIUL/2Kzun03tx5BwXj374LFKncASxowzV3UO+39oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGCGfuZu8O4EJ/axVIUqMhsEXnr0H90Dtth1mqqrvyk=;
 b=UXBy3/75srzQPT9RlIerG9b18C9PtTJXd32IRJIftDfahgrfcxHBxa4z+hc0YxBjZVPUBPfDmEW8NXIk/67hQvBn9hf4dQLBc8h8i/5rfBzUo6YROWlJrJELTRRQBYAPiDtun9TFHfcixeKmOaYzZIwcmWIWuIZ11hwPIfEhn7p3AaVRf0uKrvsk01NY5dFGQXOGcvvQ7MqC0TfdFMYS8UYPPufAImbYcelYdtP2KJ2gnP9JMiQu4QJiAmgkPqAaQRHnwQjPm85B0+eE22SdpK/LB5qTxtju2P1uUTziAGdiT2fS5AJqavYAEsUOZIDykFY48xY065R2+8InA55lTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGCGfuZu8O4EJ/axVIUqMhsEXnr0H90Dtth1mqqrvyk=;
 b=qxCNq25pUxJnOmjofryZFtr+p2FQhYPvaShZkGNpCtFsore7g9grQdQAXihZMdSqMS6CaDO/alEtXPRs7716h+okfGWiowUjvC0a68V2v0eDSJYsDQ5cJQOeVG4rqGoSHxKkumX7bGF+9fvnu+EwtJazfOVbV12wswngZ1UHwXo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3573.eurprd08.prod.outlook.com (2603:10a6:20b:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:13:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 16:13:10 +0000
Subject: Re: [PATCH v10 11/12] iotests: fix loading of common.config from
 tests/ subdir
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210202154138.246464-1-berrange@redhat.com>
 <20210202154138.246464-12-berrange@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e6867e18-4c1a-4eac-a3cb-98730cb479d0@virtuozzo.com>
Date: Tue, 2 Feb 2021 19:13:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202154138.246464-12-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM4PR0202CA0003.eurprd02.prod.outlook.com
 (2603:10a6:200:89::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM4PR0202CA0003.eurprd02.prod.outlook.com (2603:10a6:200:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Tue, 2 Feb 2021 16:13:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6781180-c75e-42b6-12b6-08d8c7956f6a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3573:
X-Microsoft-Antispam-PRVS: <AM6PR08MB35734929648F3B106E44E08AC1B59@AM6PR08MB3573.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p57LDD+MHlOwdA4heOX/oBS2TYwonAAXAHyquBgPCs/KXzZtNI1SZ7SK90vmv+mVY09IdOO17+KCgR5OkbeYrl20Y+t8ghe9xmZO19NtN9WoUF0PAi8t6OHfgEq8eHYD1jtwWVMdWOYJjbmjitjFDvssrxfOfD4sJYychvccRC3aTdzhFyLuzdJtpJjneq3h2Rie9GQbtSgh6varJOXwCjJeQgM9PRycacTXNfgYlehNh73/NDlxKIXdf52ld9rsGevSc8hKtgHBif3hzpohrzvw0207zI2BEv0zXqLDh0boOliO3q+RJxmDyxAxjHeS2aM2+A1IwRi84s/eJ183gtAk2pBVF1T716XyGUm6ML6t0lG8teQLjimrNX2xppvAYebKibcH/+y8ajGapBRKLmS+HP33Sm8sYG7xOztraa++isD+ZDjMansaLl2kMqAh/7Q5s7quYUOsjoSpgXeCM1hTAr20hJKpEgKXThnE0Q9n6hrPZfTLEiBYoZbdMY8NDnI5VrPT40Rfyk/SfVMLZU4bqoYds1Rj41HOMqL7NOefNsb7nwTsyEfkW/+ZKtaOtpct0S/Qg3UT3hD4C67vo7jCzx3pWmuLeiqlnmefZkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(2906002)(16526019)(6486002)(5660300002)(956004)(4326008)(7416002)(86362001)(36756003)(66946007)(66556008)(31686004)(31696002)(66476007)(54906003)(4744005)(26005)(8676002)(186003)(2616005)(16576012)(478600001)(316002)(8936002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHdDc051bmUraTVweXRBTGswZG85UnBDUkluSVVJV2RvVDhZak9uUjBYS2lJ?=
 =?utf-8?B?dXVNeUREVjBkbFY4ZDM5LzBuZkU1Nkx2TGhPTk1uU1djMEFZYjVUNkVpSFd4?=
 =?utf-8?B?VnRxYThzWjZTSmhra1kwUUFuV2dsNUUwSzF4UUxJRHdpendWWEpyM2lqU1BJ?=
 =?utf-8?B?c3pUUTA3dUI3Vlp2ZThVV1FOODB2OEYza1Q1RkNsTndEbTRNKzNoSmJOTW9n?=
 =?utf-8?B?ZjlpdE4rVFJ6NW1zSWpvc3VxQmJCUERBZEtqbUFFZGwwZlFjeTEvWGtrcWJX?=
 =?utf-8?B?SUU3MVBnZXRSL1BaaERMMXQxR044TzdRU2xWYlRrU2J3NStYM1Z3QmxoNi9Q?=
 =?utf-8?B?SEoxKzU0SnBXSG11djR3TzNXd25oczhwdzM1eWI5bkZVczdQZkhVSzY1RTZ4?=
 =?utf-8?B?OUJ3Y3NLT0F5dkF4MkhQdlIyc3R5MEcxZHJ1dzB3MlNJUUx4aFNOek1KeGNR?=
 =?utf-8?B?VHVCVEplSzEzeWN5RnQ5WXoxU0FKOG93empFdUF2QW9sNW9MaDI3Qm5VOXYw?=
 =?utf-8?B?UUdMd3BhTjR0UjNDY0VwMlFiWUVWRFF6cExPU1FBbWFuRXoyMFB2WHdTbVhs?=
 =?utf-8?B?Wnc1ME52NnpGdUk3Z0VsWHNYMDZqOURZMVhXOWovV1Vyb0hjK2ZoQjVlWE1J?=
 =?utf-8?B?bmFKcytkVndQM3pSb2tPWjA0OGJxZk95dHo3UEhKZkg2WWNLNGl4RE5FUkJ0?=
 =?utf-8?B?ZWFBcTJtc3M2LzhCa0I4amhRdFJCV2hSYzhZbDlWRFVob203UHVKcVROcWdH?=
 =?utf-8?B?bHA3V3cwWjdvcVZHZVlrZjZKYmd1TVlpOXBVRkUzVWNvM0lJMzlzamZOVHJw?=
 =?utf-8?B?aEw0cmt3bjV6MCtQZlBJL3h1QUlUNXZrTmJ2OC93dk1hVURqOStUZ2d2ck5B?=
 =?utf-8?B?YmlDZXVNN2orYVdJWWZjdFNpM3JSeTk1YjBqRzJGaHZDRFBDZmZocE9lbDh2?=
 =?utf-8?B?SllMbkJ0ZHFSMXVka2IyZjBPeUQ3LzlXSHQ3ZUFtM2NnY3BnSVVSd0pHbUlO?=
 =?utf-8?B?TGErL1d4WkhYeXpleEZzaHpwNDRGTW1PVFhkQWpHbTZFbnZQMGNlMmVMU1Nv?=
 =?utf-8?B?UUhVSkRPRHAyTHk0ZlNYdXlIZnRyemtLQ1RTMGpSemZUclk5LzBydFJPbTBE?=
 =?utf-8?B?L2gwOEpDbmZrblJ5QkxLYUR5ektoTm9uUEdiWHRzOW1HTVVpaEFycVpHUFdX?=
 =?utf-8?B?WXVxaXJ0ZGtxRzFEMHFCNm9LdU1oWDZVZUpsNlpPbE9VcFd3ay9xMTQ2eWoz?=
 =?utf-8?B?VXhpUE5rOFdPc3dkemxUajd5bTAyOHI3YzB5em1iV3RsMittK29idzN2RTJt?=
 =?utf-8?B?NkZsN1FRTDQ3cDVCSlVnK3V2WDVwNUZoZ3Z3bVoydElqQ3RxeVQvVVo2VWky?=
 =?utf-8?B?OGRRMmVFZ2VVdGdScHg5YURsN042VE5mQTBrN2pBejRNbFMyS1pVODNoM1Q3?=
 =?utf-8?B?UGJzTUR2QjZla3N6Q0pFRVNUL3VCUGwxbVBlSTNnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6781180-c75e-42b6-12b6-08d8c7956f6a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:13:10.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrdBaxY1Dq+BEgrXBgsPUP8rwaFi7KGRkApv26acZUGgFPdJtE2YKZxnTzSHS5WFW9wSTrjY0zofX9ClCyeS1NV2XXW1pbf/5K0AvIVk83A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3573
Received-SPF: pass client-ip=40.107.13.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 18:41, Daniel P. Berrangé wrote:
> common.rc assumes it is being sourced from the same directory and
> so also tries to source common.config from the current working
> directory. With the ability to now have named tests in the tests/
> subdir we need to check two locations for common.config.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

