Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8D3915D0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 13:19:59 +0200 (CEST)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llrZu-0007Fk-MY
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 07:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrYs-0006R2-M1; Wed, 26 May 2021 07:18:54 -0400
Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136]:37693 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrYq-0000BU-PT; Wed, 26 May 2021 07:18:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgqsCNAuvFVGj8nVDfmpQ8JOGqa05RU6GlNobekjOeDV8y6TcIcEyRSfCNeZrrxytz6wK5kgxrRo0UzyUaBZbwY0mQqh3QCXeCtyM1xRte1k7xQJoYnybech9lLGgRuYQseSLxG1sK9tnKIA0WYDaYabnpjaAlh5MvyL1Pn14ZEoZOKu6p4mn8qkyD43C9JO5x/HTn0e9EqXq8OeeAl3rLmVkGNfLbcBTvgj1JQ6ef6CcRt6OinQ61adS6BLBtwK4AuiLVlUgTrWtXMQYG3NOurx9e3X5I5uGQwC2TrdIyzVSEPtVLuk5m1nMPV7mDmMVYECKzl/rFRxto4Zfgzy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qxpgkxyd7UcfHXxSj26WP90H7ZQwjD6xXTK8fNMwh4=;
 b=IqZAn0H0O/rr+nO5uAsEU3AE5lgq55l7dWNXYZjjv7OnS9c8vB+12KaPwx8pogAihqHqp5e4tRlyVh0s4rYGUF3rGprCML3reERILZ0m4OwbpA/C4Fkxu2e1AwleNnQLFyxLf7XVv4nq8lr4cOtRt8oAO7Zes5hQjVpw6f1fGBy84DS5fNUWh2uH+IhHv4mFQ5g5h64IGcl8bsso+OlzLYlfOSNzXRCoF2Tm5lSU3/sD1XFHTmxXmH5drS+/JTYp1RHoxwQjDY2KknNvDTpShydoRbl/vF3x4zhz/ctKTKa7sm95r2dWa9/oyeiGGLe/vJYnqL4MrnFkha5DQu7L1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qxpgkxyd7UcfHXxSj26WP90H7ZQwjD6xXTK8fNMwh4=;
 b=UBFOLUg12smcVM/RNQwbZMOvlrgct2ZZ568WfujQCSYxX0MzICF7vmCw6cqKbnf7kf0nWgTUG7LnumgDwDX6O1Fe+rpe5I40ZePw8uHrjhTpdpmg9RwTmVQ+PkkB9iX3Q94lTRdFw0Cv/k/axKhrrGxyA975QGdW/V8YyaFAJsk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7011.eurprd08.prod.outlook.com (2603:10a6:20b:34e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 11:18:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:18:48 +0000
Subject: Re: [PATCH v4 03/15] docs/devel/testing: add debug section to the
 QEMU iotests chapter
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e7a1da20-8a41-0dd0-fa62-2df12272dfcb@virtuozzo.com>
Date: Wed, 26 May 2021 14:18:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Wed, 26 May 2021 11:18:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d3b6115-36b1-49e6-914c-08d9203808a9
X-MS-TrafficTypeDiagnostic: AS8PR08MB7011:
X-Microsoft-Antispam-PRVS: <AS8PR08MB70110608B78AC6907A6BC266C1249@AS8PR08MB7011.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a3I7Hejh2/LocFa6AIbo3ax9uLq+/tp5bMZk9LjaB+INcUMQh7mYbtTl4X6GdB9s5RHCJ0xZAvCg6i1zcG15vKRUKPBFwD12wtNqzzv7ymFYUgtQdzaZ1Q1EkkkHJMaJq8OloZsopxWT3g3y4iyIwGM9deNcGsruUsTG+FatwIXW7Wk0zWsvYzvHihmLpsMnaa+t2BI/pncr64OUCd4PcwsH/b61CZqXqQ4w2FZsw+u+fAkbWK37TbxDj3ge6aLrZ49+izQyTg8SktH5YCyXbb9+/VFkcCNL4wIBKROus+6cMu3CbSQ3RS4EJY1GV/9CaR9mA0nHd6MrrkkM6C9GiK/f/4/qjZpZX430nYruIM5Djz0tsQPwdKfb0uK1bAZliogsuSC8XVCPdtQN7YEwoBhosYJXrGNU8Uwc3p+UGwsmHY3hTyJiCkWS4VlxQRJyDyhyl2RrKSaaJmt+yH11r4nbNZz77l4O6Iei/wbVQvxiXT0QlDWRvhLpZxb8xbNiQgIQ4vQO8W2xEKQKRaVXlJe/gO1H2MAb6JTFyOr9qU6p+yYluZqJqjIaU5fK92aDkvpBZ3PaWiLfK8zn+r3hyxQB32TUn54ixO+aB2ZLkH1bYGvH9n7OyTrgvan81KOPN+4XUG/smJXDzytU1BTVkkSWi+6Gk/m6TV4mL9/aEcDrk3RqVSVNvBgSViuzWGj9UbE5DBPGpc0LWwQlzohSkpOUagbIz2amBffTiuQk6M4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(4326008)(31696002)(956004)(8676002)(66476007)(86362001)(66556008)(2906002)(316002)(38100700002)(66946007)(16576012)(4744005)(5660300002)(54906003)(38350700002)(6486002)(52116002)(186003)(478600001)(26005)(16526019)(31686004)(36756003)(2616005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVdUdHJ6TzF0Ry84bHNraVFhY3JNYUh5SkZOUWtMZHhub3UzN0lGUjVVdGFy?=
 =?utf-8?B?V00veE1VbUxKUmlPWWNsV2MrM3Q0V2k1OTlEMkQ3Q1NOZlUyRGdFamwrdU54?=
 =?utf-8?B?UGVHcEpEQmxqdlRVUytxVyt4ZnBwNkFXeHVJS0VDZHFraGZKOXpOVm1uUld5?=
 =?utf-8?B?Tkk5VUV2MHJkUmhOQU1jZVpvQkhyUU50a243elZaK0l2ajhuNUhBbzZpVkgz?=
 =?utf-8?B?MTdGQ25UK3NydVdoS0dJcTJtMUo1VmNPR1JQbEQ4ODY5d3VYUTNpVTFWVzFB?=
 =?utf-8?B?WDRjRFNpdUZxdEJLaFpxdThHWFNlcXJnM2t0T3RzZjhjcDVPRWk4eWdpV2F3?=
 =?utf-8?B?d0YxS3djNFJXczdCOHpsOG1Rd0g5L2dFV1NCOUhNdnhEczhmZS9rWUpIdXU4?=
 =?utf-8?B?WDd0bmdyM0xVQnEwdDIwL1pCK1Jyb3prelF0cGNOd2tCcERSWUtKc0FSRjF4?=
 =?utf-8?B?NmZWOTBReUw4TkE2NlZNM2hiUnZUM2ZpK1RFQkx4QUlNS0diN25GeVllWlh3?=
 =?utf-8?B?NjZvQUlhMjgvVE1NK1FtTUorbTdYMXl4NVQxTHFMTUJZM2d6N21ZeFhqT2dk?=
 =?utf-8?B?bUJZMVlBN21qQ0RNdjRMNTF0VmkzU3JOV2ZNOXRzcDhCODdUQ2E1dnhwZmpu?=
 =?utf-8?B?OUhZd203MUlaNk1xT0gzOXE1Zzc2RVV2bjVNYy9JYitGMS9ScUJqdVdmeWFp?=
 =?utf-8?B?U2grUWNRbWVSSU1TemoxN1pZUjlCSWpZTnZwSjVBYlM2VzBNM2pXQWhySDNo?=
 =?utf-8?B?TWVQUlNJcldDdUFOdjRuZVBaRHFHMGlmUWRDaWhLOGozYUs4cjhzUUU4ajR3?=
 =?utf-8?B?czloOExXZENhaXExOFR3bUdmV2tOblp2TERJdEFVYk5wZ3B0Q2RuZ3NqT3Ro?=
 =?utf-8?B?YmdQdnZnNzlLOVgwUy9iNjJWOGRtV1JuOUZhbThkbGJpM1BFcUFLejdlZXI3?=
 =?utf-8?B?emJra25NdHczOWI4NXVxUm0rUTRrZkJPQnc4TjFqMFk4eTFjVHo0UWNCdk1F?=
 =?utf-8?B?ZXhlT2hhMXByMEZEeHNPeUxIUm0yb0hnOVR4Y1laVXlyZWw3U0tUelZSMEpM?=
 =?utf-8?B?MXVPUzN2WE9GVUY3SWo4WE5lUmZkTWVOV3FUTkQ2VERXbUYxRitwWUNPWGVv?=
 =?utf-8?B?YkMvZUx0Y3BPV1dtWlh1aU14eS9qbkNNdWxmVXRZeExHaklPUm1YTFpYWWRE?=
 =?utf-8?B?M0xZZldQTmtMQzJORUhEL2Q5K0VmNU1uNitST0pRdlpKV3d5MnYxQXhreDJO?=
 =?utf-8?B?Y05PQjJYeENiQXh4QlJYU1BxT2dOWjBZUnRic0R3TVhhLzkyYTQxZTlNYlJz?=
 =?utf-8?B?UHZuK3ZTckU2WTZFY0FCS25TM0s3NlpjbktZRmFLeE5RTnZwU3RKaVVyditu?=
 =?utf-8?B?YS9ScExvcDlWQlpkUmdWYzNwaU5KQXhHYTdHc2V3VmxTNXRoamFWMGx0d0Q2?=
 =?utf-8?B?MzhablF5RGhBYkRUa1VNSERyM2JvRFo5Tmg0SXBlbm5KNnczUXo2MDBRQlBU?=
 =?utf-8?B?NFZSWDlBRmJ3VUxxR2htOXZvQXNXVzBWYzRlVFNiOW0rczhQZmRvejc3ZEtT?=
 =?utf-8?B?S0xpSXFSNVFFelc3MHpoNGIzekc3RDNGT2xFdHlLUmJySkd6V3d3bjhocHhG?=
 =?utf-8?B?cUh2VkdyNWlVbVJqTzExTzNDYjRrRU5vcTJkNXM1dUFqbFo3MUpVMTdrZG82?=
 =?utf-8?B?VzRvcmFVZU5uRU5nR0pEWVNJWGVpZXBucHk1aDNxZGxZcXk5QTgybDBNbnZM?=
 =?utf-8?Q?stE61CEl8dsw0NTYHSDvWPEH0/q7SzTn0kDC8wx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3b6115-36b1-49e6-914c-08d9203808a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:18:48.6657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLWO6IP9HQLML/8DskroISSQx/qSy17V4QICdcKs8HZDNFVKOk6R9wHfU8p6yfCG+6ILsc8viye3WZegDG13wo41J9gQLAos3PeH4mABr5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7011
Received-SPF: pass client-ip=40.107.1.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
> Introduce the "Debugging a test case" section, in preparation
> to the additional flags that will be added in the next patches.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

