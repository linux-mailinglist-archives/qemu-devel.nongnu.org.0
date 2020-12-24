Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241CB2E24D0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 07:31:13 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksK9V-0002nf-IO
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 01:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ksK8R-0002Kc-Ev
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 01:30:04 -0500
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:37606 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ksK8K-0005tD-M1
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 01:30:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te+bmDBjtd2hisRZ50l0oVVJZd/XT4eyHAjZmY+99tZnSY729LvShMYekFebXSWvrphxB4JMquaDPzYL6osFCfdXOZQ/SBUJh7V+ScbHD7XaNItIEG4rs9vyqTt5p1QfqUp2AXqwJMNvgMHW8yYmi4/qyT+REfOMYd8a36FD/5GoPCebWUE7JMRJC1+diljNOFmcMJ/RRPItI7Wugg7lhERmewFmC1sIoqEw6taqSRDHCugBEoObG+FT/pWOMPEJ9he3/zjYuiYkKLcz3tTfsiIwmJVKYm8FjovqV4Ll/K0zT57hZQAT4nfMbQ5dPtsiR4Eb3kMNoQ6WryLlEIn9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en0Uy8kYuUnzOWACTQkMgnOeSktAl7yUzibYunlJAzg=;
 b=jz4pHvQcksH4uCkpAGY+YTRoyTQFHZUmHuBk4xtF43L+mKJEPTQFze+UlR9BWuFM3N2jnybPNuhgh77IOi0az4KMKAwI+RMGpPAi2pIADywzovRprBDC8xNQKyD4bxeEVY0cIVrLY7IuJMvoM78/IFcjhSTVGIhktz9488kRu7VejNm2uUeMFixThtINkHAqMiD86TjFvcEnoFFHDFwWTwAM99mKL7mbwoz8icQ0U2rLsZ61AcJE/O4vmOp20YGrDLFP7NTwX0/PNz2vFzfEEgQ2izrr00kSBflS+fRuLCBNrt4tBHyhYR+qTWhIpkp5fCwbr/kqkvDWVQvPXK0y1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en0Uy8kYuUnzOWACTQkMgnOeSktAl7yUzibYunlJAzg=;
 b=QqGymnL8XDM/s6nS31qPc0HpF/rt2xxdidDSe1TdanKh1OYTXChqlcAwMQbGzzTCBBCJ58b66ehIMuFtN30oTaOrRv+RagKEVG9+ZnUvqWdyAtBcFv6SZFluFZJu2kbvI8kmkuf04iVWB/BV2rF0HjZeLW24Q5cV1FNpNF66xDY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 06:14:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::e4d2:71cd:7d3b:ad82]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::e4d2:71cd:7d3b:ad82%8]) with mapi id 15.20.3700.026; Thu, 24 Dec 2020
 06:14:50 +0000
Subject: Re: [PATCH v3 5/7] qapi: Introduce QAPI_LIST_APPEND
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-6-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <38506fb9-97c1-35a2-8dcb-99ccae631ac7@virtuozzo.com>
Date: Thu, 24 Dec 2020 09:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201223221102.390740-6-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.110]
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.110) by
 AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Thu, 24 Dec 2020 06:14:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c37043e6-0b44-4a15-ece1-08d8a7d338a8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691A11BFA722D14C4A5D526C1DD0@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XygvSgBhT0EUXB1/s/uZpPfUEx4ngfofd7PS9iOC/16LP6TCMriFrGXWZ2DWRn33mv7mMJjIPVF0WEy/ZymoPfHbNZ0YvGhDYXpCITPfC/HX3rmKySbJdWEei9BL9X0nrvxaCUqnzt2aj/Xy0ffEnFgnD1eJLz5/gyOCAQYRn0RKmctSN1oSlSLOYZ8itAFf3vvqo1+HiPPZbKmNSMsBG7C21RyBTKPTGE6tcGOEEmUKBtQgMVUuySuPxfRWRIDzC/uZxh6Lwm97pCqAOT4rgwRdiUsgNaZ9ph2Kr7RLq6MZwBeX0ZAXqoJdDXCMaCjLHVyBM1tEDnEibHAXJkZPdl98IoLIU2UwzDtgHuoihbZvgTUxwBgFLxoq3AwkwE1sK2H9uJ6pwKMTnib4WmgKb8mCaajxWJvjmInCA5VQSRzVarjHeFF2WsQcf6S/FqUOGp/6pl36N8Usa1NuL8y5IJykJ+iTpp7ZLub8posR/Is=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(86362001)(26005)(31686004)(8676002)(16526019)(31696002)(4326008)(2616005)(6486002)(956004)(16576012)(478600001)(83380400001)(316002)(8936002)(5660300002)(66946007)(36756003)(66476007)(66556008)(2906002)(186003)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDJJVjhUZkk2QllOVTRFdDRrNlVaUHczMGkzeHNnOWdpcXlhWXlhbXVjaExR?=
 =?utf-8?B?TjJOcUJrQVJwUHBQWkRkV0liMFBReDdwQjBiL2w1bm85SzBJUXBzdVlMM3Jw?=
 =?utf-8?B?eVFkZWxaTTM4TWhTWEdnVzhuL2htMkZoVVhZOUl0RGd4SGRtaUxmZWU5ZEgv?=
 =?utf-8?B?R2NhdzJKRHlUZUpMamtSLzRZTGFVeXdrZlRLUXdrS1dkNTlzV3VxcGlScWRm?=
 =?utf-8?B?OWhGWEJDM0xDODhyTlhBVjlOVk9aMVBleTVHVVV5a0I2anFJaHlPQno3azNO?=
 =?utf-8?B?Q3RscTc3QjFWRi9teENaSFJvMWEzNXR3MnVndjRER1E2U3NVV0JmWlB3YWhr?=
 =?utf-8?B?Vms2bVRLb1l0eU5GYXBEaUN1MFVOd2oxdzN3d2VyTkxybXR2RDVnYUFNaWF4?=
 =?utf-8?B?c0Ztb1dSN0VFbXg4VjFRQitaK29xVWkwdTExajQzbmltOWJUZGZMN29Ubm84?=
 =?utf-8?B?cko1TEV1OTYrU3FOYjUyM001MTFpeEZXWkhJNlZZSEptT2phWml1RVdXQ1l2?=
 =?utf-8?B?VnBwa2RCU1FiU3ZBeGpUT2gxWDhoM0lFZDdxcWVhOW1TZUwyU09zZngwM05U?=
 =?utf-8?B?Ty9xVHUvZURoNmIwa29vc0dpd2pCMmtTT1MyV1NRVVBTZ3FhaXJML0hjUTZU?=
 =?utf-8?B?TzdndFRXeDgycXdxSVAzcTk1UDRKNFdDNm5IVWtrNnhvSXhpME5GaWdKOXVi?=
 =?utf-8?B?K3p0SjNvUFo0bDZUaFNQTjAyZ094ZzBvUkZudCtyRldDZ3o2eW0yQ3NVQ3Jl?=
 =?utf-8?B?elJkMkRCME9jSFZreU9QRE4vQ3kvRjd1cmhkN1hPREFYZUUreE9ZTUlvZDZZ?=
 =?utf-8?B?ZVRVUTBPS3Mvcm1Qc0MvYzlJRjY2WWhQVEtQaGUycGszSmVQQ1JlTmVnN0NN?=
 =?utf-8?B?YjczbmtPNE1ONzVWa1Y2eDVsaGVpVVdMWVJmWHk3UHpWMHRTbngyU2V0U2Fx?=
 =?utf-8?B?VW9BMHpMd3BpNG5uaGhzK0o1dDlQWmhjN3J4TVFvcXJ1Q0R6dTh2RDVSb2hy?=
 =?utf-8?B?T0JGeFhyR1NvTEFaMjFBTWltSTZlZ0J2MFByVmVRK29wTkpFdG1wMzFBMWg3?=
 =?utf-8?B?Um9FNEw5OUNtRTRZK3lUVEExZ0p4dndZTHFkYUxDdUN1QnRNbUx2TElsUnNB?=
 =?utf-8?B?UlhTc0pUT2ZNcEwzczFRbm5lckpELzRjNHljT1NHek92YkR5U2N3NUVVM0Zs?=
 =?utf-8?B?MnlPZlpCZjNLK2E1L01UVlRUb0hxSjZRRVoyRkQ4NmRMTEI3L25tMW9LdXdn?=
 =?utf-8?B?RHpsZ2pheThMWnVLU2J6UEpRb3NndFBGNmVTTzVWTzNlRFVqREs0b1ZRNzhR?=
 =?utf-8?Q?Ps068e0kBkMqCM5jE+nC84wh9eyF4oDT0q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 06:14:50.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: c37043e6-0b44-4a15-ece1-08d8a7d338a8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOLt8KzAN6cncan0cNsOSgE4IViIc25A7Ohs8dzRUCJxhnNJ+0w/4me3QQj+yGbKzC3v6mOKidY4JiVVwUDyJq6Fjzya/xUgP2UMksLbH4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Michael Roth <michael.roth@amd.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

24.12.2020 01:11, Eric Blake wrote:
> Similar to the existing QAPI_LIST_PREPEND, but designed for use where
> we want to preserve insertion order.  Callers will be added in
> upcoming patches.  Note the difference in signature: PREPEND takes
> List*, APPEND takes List**.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   include/qapi/util.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 6178e98e97a5..8b4967990c0d 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
>       (list) = _tmp; \
>   } while (0)
> 
> +/*
> + * For any pointer to a GenericList @tail, insert @element at the back and
> + * update the tail.

Would be more obvious for me, if directly mention that tail is a pointer to 'next' field in the last element of the list.

> + *
> + * Note that this macro evaluates @element exactly once, so it is safe
> + * to have side-effects with that argument.
> + */
> +#define QAPI_LIST_APPEND(tail, element) do { \
> +    *(tail) = g_malloc0(sizeof(**(tail))); \
> +    (*(tail))->value = (element); \
> +    (tail) = &(*tail)->next; \
> +} while (0)
> +
>   #endif
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

