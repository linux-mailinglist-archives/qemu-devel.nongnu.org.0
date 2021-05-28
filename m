Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F763946AD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:46:51 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgZO-0002Md-J0
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgV7-0003gs-OZ; Fri, 28 May 2021 13:42:25 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:18631 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgV5-0004EU-Nw; Fri, 28 May 2021 13:42:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir0HHXx16297BTnMnZer1akoSqbmFAt8eEehaL5gjlWIW1inyc+mGMyshmnnIjWc5Mfpk1I5dHLs3nieZHMw89vJ3bUWeVq6jxT/JJKcw3ERbGRgq552oSkQksWnED4MP4TJMnopgKM/GO69bxrduBxNWog8Aej6+ShJ/ysxiWi36ySqAfPhv78JNpV4TmIjtcqkWm6y9icz47MIQ0pvmYQQJeNihvgE87C3sm/msaLSryjR4YImZ6biQcm8JxFxo86bgM7Ma2H6WrMRcK90IRVTG6jYgqRN01euHwbBXCpgwpWdAaAjwOzUxvO3i68Us//LWccIshZuGONHACUUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS4tMP1nqfqKPwxBzvhhOBaKdWUuCRb4dX+zrtaZ9Ec=;
 b=UV6xGXUcU4XZaSdIXH3ZxzwFJx2StNIM/p3VTzZH6JfJBP5zadgzxAZFD5oPTlD3HZp36aNZVhY5Q4y64Z+yh/voMbOqdjfsT8BQnw1VupVtxxN/9UJJxoMdaWRjR1JkAPLnRdgj/Cvngxbq7/I9Yb1eGkUrdp9PnWs9ctZUu4G8WgZeud9G8/ELjqN622DWy3RrgsL5hdUXdJW7N86arGyhRWlzXboJLYLeqyI+IUzAlzqPdnGkmb35b/dKLqAvt6IKSoIecIAf/a5QPE09ZHbVIKzqBFB67zn71Sx2gQhfj9IxD+xC8dNMWN37ur3bwlf377SOkhilyt1SzDqUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS4tMP1nqfqKPwxBzvhhOBaKdWUuCRb4dX+zrtaZ9Ec=;
 b=cMEW8MWCglkgoF+pK7fByIhSTDquoKDMFWwYedH+r5cY7YNXZhfqTbVtI72ZTPV1cJburPcUnPMYLeM1Y00B3pnx2K4TmTKPD13GCPRU/+jkYNTpwg6bp66D8rl8Z5dEOI5d32dENSw0jBrIN8lxPeq22qdYJDDQn0dD+Mz6eSk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 17:42:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:42:18 +0000
Subject: Re: [PATCH v4 13/15] docs/devel/testing: add -valgrind option to the
 debug section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bcde6c0f-57c5-f0ae-d2d2-e24138e8113b@virtuozzo.com>
Date: Fri, 28 May 2021 20:42:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-14-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.10 via Frontend Transport; Fri, 28 May 2021 17:42:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3565965b-3593-4abd-fd41-08d921fff03c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-Microsoft-Antispam-PRVS: <AM6PR08MB472487F51771942B080F35B8C1229@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LI+cjiSr8euWHnQh604zi7taQBvC4A50+YrJeij+CNzRa/luKnhOv9ec3c3GnTssaX0vczm3mzSeQJy+nuRH/TAEYhNtT4x4A7rV6OpKvD3xZLTt9K2pA2AXEG7SzWd0b6iJm6ulyW4TwIkdf76cyTgZeXx1Skvjg5JvBldPCSwExyw7vzef25vEEdSWfUN5U+s5zI2jp2oD5V3Cf2Z5hR4Jay+Z2+LRFOA06VjE5cfGf5DXmHM7X/Mek+3i+gKF5/4w920AkhbrEVZWxZngD5vPZBHepwHAmPqAFpyuSARnj0jXoZfqMgJ8zmfEQOXL/LLYMAwse+ZgG9NGPqwZCtTiixgxm1RWvMpgVLzKTXW+QvTUir5UCW6N9LXWnQb8rufKOMxN/IEq02K41aMKVPJoCR4hEbOAj35y0+bWGUjMsfWHLVadmagUv3tmE3udklNlJiK+kmAezSTR7QBW8XmfeYr9pLsWGLYgj1bwrUxT++6MIXxFDSu5AhcmSXrmClGkKL8b1B5copb781gTfj00/jM2wsuIlos5+2z4Wp8KkSbWuJVuW0loCR3zfFvc7IAPvX7yHZ2seEG4++mqKGojPwaNDGfumZ+Livf8sICYQM82TnZuGx/EMOXH0YUVnVHfFXMJL2PjJXx+ks8hMYPcfNnkIHTsGOhOmismRclBc6X0XBDbY35Tk1e51LUPv03cxaP/Yz2mf2uJow/Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(376002)(136003)(346002)(26005)(52116002)(478600001)(86362001)(6486002)(186003)(16526019)(558084003)(2906002)(31686004)(36756003)(54906003)(316002)(4326008)(16576012)(956004)(8676002)(2616005)(8936002)(31696002)(5660300002)(66946007)(38100700002)(66476007)(38350700002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjV0WGRPQ3ptTGZVMllkellvMEFIZ0xxcnd1OFA5UlFmbDgrdlFOM29XMzl5?=
 =?utf-8?B?OUtFR2xWRzZtN2JSTUViUCsrb2xYT2hBV3k5MXFjb0VZVnZ3R1ZnS2V2TzJv?=
 =?utf-8?B?K1JWTUo1SDBpQkpUcS81NVU4NmN0OHJBdE54MTQzTTJRTVN6L3NRQlpGalVs?=
 =?utf-8?B?U25kNHpiL0swaGIyT0lKbFFhMHltZEhGVWRIb0FZR3Y0KzlpNFRHSllJY1JW?=
 =?utf-8?B?WHVxbDZTQU5Tb2swcUxGMWFUMjBuQkpIL3RaUFVtTXVjSU45OElDdzdaT05B?=
 =?utf-8?B?cTQzRkF6alVqanpDRUdXcEIzUHBMVGNVNThiU0JDU3phUGFDVnlITmtSQ2lZ?=
 =?utf-8?B?dFB3WElCSHBlbmIyRmtwbHZnUGNucDJwSm5VeGV1SExlMUZZbXlWZ25ydC9O?=
 =?utf-8?B?NDVmRTZubzc3SU0yOGdVWUI1SFhHMWpxT1VNTDJPRmhBNDduRTVnVk5lK1BJ?=
 =?utf-8?B?Ukw5SFZNa2lsZ2s5SFVFUm5jK2d2U3ZDV1YvekF4dHFYTmdvaTh6cmpGeFhI?=
 =?utf-8?B?ckRaVUdYM0UreGNnQy9tWDE2T1RFWXpiK2VxSmhSTWM4bFVTeXBOS0tJcHNG?=
 =?utf-8?B?bW55YStZTml3MzRCeVd1SWFNdytTNXp1SVBxTERrYmliQ3NRSGFvZlZQZURY?=
 =?utf-8?B?MTdPenB6NHZkeUdnU09uakRTbHBVMGpyZHJLTGtFUnJlTkZvd1Q3N096L0pC?=
 =?utf-8?B?L2xIc01VYjd1cGlsNm1RVTFYbkVJVy9FM0JsMXcxaWtjbk8yaFFnejdqcmhR?=
 =?utf-8?B?R2hDeTB6K2ppNWhYTGxqUEZJSGJiWTlxR0tGMnZacEtqSld3NXJlbENnSEdr?=
 =?utf-8?B?UzlBQ1ZmK2xQOGR2WDcrb0l1T1ZySFJFY05IY2NkK3lqS0hBMlFhajdHZjJE?=
 =?utf-8?B?ZmFGeWhrSDFPeHhmclJHZm13QVVXZCtLZlR4akpHM2x3S2JrZHJleE1Bc2M5?=
 =?utf-8?B?UmxkVGlyQVhPTm5EQ2JzZHdvZlU1U3dwNHZaSWVJWG1xNk5QcXllMlV2MFdy?=
 =?utf-8?B?Mk9OdmpGQkJSa2FXVEVoZjZySEhoTSsrU052Z3JTQTVXQ1BwSVZScDBYN3pO?=
 =?utf-8?B?QkpXZVJvTHhmQzJPTldsYlAwRit5aWJWdGVVOGlCNVlYNUd5amE3M2FKQ2tY?=
 =?utf-8?B?NVJLc05XcFJWSFBZREVvZXo3aS9kdmxwOC9uU01QaC9QRit5U2VXK2RWVjhW?=
 =?utf-8?B?TE5qbmdIajdVS1dYUmY2UDhBa0JwR1JkZmlzbm8wbUg1ZU5IZXJFeHB5a1pU?=
 =?utf-8?B?MytNYmFlZXlYQVhOenFpRmJrWU9UVUNocW5COVorcU1aZ25YTTdSOFBSZjBE?=
 =?utf-8?B?S0FTUVBpcGRzNzhXSW1zZllVSEZ0SDlIY0t2aCsyL1ZBOGZORGFKcGhxNGVh?=
 =?utf-8?B?VG5GYnR0WjZNNHh5dkJab3F4ckNPRDFlNUVIRDlFMXpzVVFDZUVEUjFpb2dV?=
 =?utf-8?B?aitkSVc3T1g4VEhCSnVNMWZ5Z3FjRW5qSXlLd25hSW1PZm51UVA4VG9HWmho?=
 =?utf-8?B?ZjVWcmZ3UHNMMTJnMXUxVm5JdG5UQzBlWVJJT1lqSzN1ZWxDNU1uVEcwcUk1?=
 =?utf-8?B?aDVMMHRDaTdIMEpWTitCZFhDUWlxdUUyQytDUVZkMHdXWnIzN0NtT3J4RXQz?=
 =?utf-8?B?bWE5dlVkaE4wZ3p6bzEzV3I4OFA2eWZjeGVMNGhRd0VFay93dEZKa0Fidk9C?=
 =?utf-8?B?UG85b2lCUlBxR1lXRGNXV2tvYjhYM3EwVzhFQ1VyVERDaTlEd01kYUJyVXR2?=
 =?utf-8?Q?g5dlOTNSGuN+BKiNUyVkp5Lvg+KHViY/V3rKADg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3565965b-3593-4abd-fd41-08d921fff03c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:42:18.1915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvcnX3t0VNdViPQvIw1MjDrnI6iyrhG14et9iOvlJCdZXTcIvd4xNwWTf9YkXYm704g7twRipOr440StJMrSecl+07niCprjFYhH/s1y+kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Reviewed-by: Max Reitz<mreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

