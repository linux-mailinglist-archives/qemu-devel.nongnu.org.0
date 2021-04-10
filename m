Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7835ABBD
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 09:44:36 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV8IE-0003Os-Qj
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 03:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lV8HG-0002uc-Jk; Sat, 10 Apr 2021 03:43:34 -0400
Received: from mail-db8eur05on2100.outbound.protection.outlook.com
 ([40.107.20.100]:53632 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lV8HD-0006r7-T8; Sat, 10 Apr 2021 03:43:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Igg1WvQ07rZ6TjAOGwFyyAUc25FdtwHaz4DI1fihbgw54TcBCxnR2wFahAE6iXc0P6NoKs7kc68rifVPoAOd+pnhMn9sjdzLtT0g/nCgC513+wBAGkNvSpdb2wg1+dxKK2Ky6SoeQQHO/2Z1nF7drnwtN106APblhbcvhAT+pgLIj6fjgrHonbylTfPczdlwgzhUzqTvT91Adg7SFLB3OcA6LsvA3n1LpqDtpfzxwLBbY/a2/izq8V3JznN4p1slvrGpQc5oXJfY0ymj6F9bmWCriKjePT8euvf1nGxBqTotiSD+xVPlGLgouUbE5viYQgatNMq37KmcV5emaznLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iszu08HormNiSh8fjTblZO/EDiK0MRs0v11p5ZmaPio=;
 b=HuKqY4VV7sliHy0tRQnV6zzz5bfgxjr5Sz77ASVadNF1UNrcgV2cnXWkclt7g4SeohF+PaYM1gHelM5/YNQ3o2uCSSCNdkRd6WtbNotWwnRirQ7wJUuAosh8Gd/gQV7DOXHJ/OaC4b31hP0qEZejSuFl+Bdr4sqZlIUrieBBnKMLnKQcF5qcQPu8LkY9BpwYxtKSMUZys1aIzSyJjpTrkA+SddwYNgbNwXg8K6iLYkWtkgYnlMhD25lEdr+W+dFwUw+ySOxF0e6C2ONFBN0aZCrM3MdzFYeF/fERQS+kyzsq2ubCPIGISF3f43xejGg4P+NGzNWxdY1GVVSknGRNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iszu08HormNiSh8fjTblZO/EDiK0MRs0v11p5ZmaPio=;
 b=mNxmiF8KOvgGwqNEafaahOAhTZ6vaTJIMIN1du0BQgObfMH9bM8oSWS/P0WbRUPDdfQmKoliIOdovp3ELHOyW5ODRsT33njtAUcD/Qq53yeIEX6Ip1xVl1NHL6XpMR4LxqIoNVbHC7uZlib0eJgi3fKb2ejAm2zh9+asXC5jcl4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Sat, 10 Apr
 2021 07:43:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Sat, 10 Apr 2021
 07:43:27 +0000
Subject: Re: [PATCH for-6.0 1/2] block/nbd: fix channel object leak
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
 <20210409160406.1800272-2-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8cebb4ce-7add-18a4-52f1-d5d6d2920a8f@virtuozzo.com>
Date: Sat, 10 Apr 2021 10:43:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210409160406.1800272-2-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.198]
X-ClientProxiedBy: AM0PR01CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.198) by
 AM0PR01CA0094.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Sat, 10 Apr 2021 07:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a0b95ea-2c73-4a3d-d42c-08d8fbf453d0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB178039B4A882374FCBD1D72DC1729@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:188;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQTxokb6tJ1GPSuBC86s36sPoDCz27/fLaHpkPPwWvR/XfGA/V9iLIsDrh3+5EDWp6rHjfwtAy8+xhBUzx8wbuVjp+LuQJNGmrBGSKXQbM7/1dTwSxAUFb3anHrO/i/IsG3sfULjUOMHYTE0UzcNUvumQ3u+CWpu8ODKIlesu2R2Hklk09ZNUMG0NOjqacE2K1daeyX2GZLjBf5dLXyX4PR73AOLlTrz6wonGeChjPEIO31GHh8OPVzNMwddjjpZxFLOV6RQX7cDe3mZkHH/+5K9SImLYYthp7f3nzZRwfAN3geNrZeUxe7NaSa/5KpSkrEAuN6nC9gMHmGzcLrCyxqGiSh8pykz3mX8FpYYnvc5ixyRh+Swmv1MI+Z+uAYP3A9tWbI1Jl03WzLtPk3HB4J1++VvTvF+tQ7ckqBDU00aSC/TRKHbCP7ns7FRQW3NtoK+wp/LK0ulnjIdwLwvOrvoeW9joKIo1alPly4ah9IM6/QiWPHwu4gyQTBiPMpVPRw7A7sXM47XdRWOygxncbHgM6VGCabaUcGcKVw/7nV4ZzTImkDbE6zNui07dVuqG/FiqX3RsPXgaTAFHeMXqRuj+L+uFm0sj7HZ5Z7TBc6NRXHlk/AWb8d907vLUvFaOHgnV9p14KU6Mk4FSkTeZJC+VyGg+09V6+Yv1e4Z8XS+MnJG5aAQRg7zgt6Zz5y6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39830400003)(396003)(366004)(136003)(31696002)(558084003)(2616005)(956004)(5660300002)(8936002)(52116002)(36756003)(86362001)(4326008)(16526019)(478600001)(316002)(16576012)(8676002)(31686004)(66556008)(66476007)(26005)(2906002)(186003)(54906003)(6486002)(38350700002)(38100700002)(66946007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDFiMm15S0VWK2JLZDREV1ZJalFNYlBMVCtzNU1qdGZrRElpc3Q4WGVZTTR1?=
 =?utf-8?B?VjZKT2xuVGRMOU1BVjdIK2N4TmxwTllSeTJNUXc3Qm5rME8wdDhIb0xVQ0dC?=
 =?utf-8?B?czZRUVdLTGlvNEY2b2dycTBBSXMwSkkwaUxpYWpKeFFHUFp4ZkhqOXE4RUhU?=
 =?utf-8?B?MnRhdFZlYlQzQ3BJQTVqellaV3ZOOXdueWlzRkx0VC8xbndBMTJBL0JTQ0FG?=
 =?utf-8?B?aFVRVXpKZG4vUHJPL1plUk80RXJwZ2E2NWtmbFF1WjFRUlFpdnp0VjNOT1VR?=
 =?utf-8?B?SmNUOHZyZjAwKzAvU2E2K2Rwd3ZsK0RwbkM5ZWhMcTFhb0I2cjVQK09PcXcw?=
 =?utf-8?B?QUQyd1Vsc2ZKRjFHdmE3WUM3Y1NrU3MzT3AwMnFDKzJIc21uOUFmSVhWS0Vv?=
 =?utf-8?B?aWtCMk1wcnFKKzhjdHNhUW1DcGQyRFpReW5FVHUrWGlPUkI1OUgzMjFKUXdW?=
 =?utf-8?B?S09rZk15dWhBK1pqNXBDOVVJODl1aXVjOHJaMWRiZ1VLMlhGN2diY2ZTa2kx?=
 =?utf-8?B?K2lja3pYRVdtajdYak0xWDlta3FVYnNxYjNHREpqb1ZNT3RDOS9adUF6ckw4?=
 =?utf-8?B?WExaZFZyeHhUQ2RMNFprb1FaQUdNVXR6Ylhrd0JpVDc1SFhhTHk5enc4aGM4?=
 =?utf-8?B?S0xqaU5BMjVNYkhQc1ViTTdYSDJBbUp4eUovWDh0a0VHM0p0dXU3Z2pYMnpu?=
 =?utf-8?B?bUxuVFc3elEwWHVvUzZUemNUMUlDRzBxSGRPeFRtL0FBeTllelcvRmRFUmc2?=
 =?utf-8?B?V2pCc3hlQnN6UUEvODc2SlZKbVl5amVONzEvODA1N21FMWhQekxBeURvc2h3?=
 =?utf-8?B?QWtzbXd3VjUwclhvOVNGbFJEZmh6c3R3M0J0NG9vZVFPME15SDFrM0NrQWlB?=
 =?utf-8?B?b3NPM1JHYW9NSmp2ZXltQnhqZkxVdERoanJ5RDRoaEcyNCtTQ0pOL0dHQ2tj?=
 =?utf-8?B?MHpkNlJDaS91QTZUa3o1aWlSTk9hUnRvTjVISmhXTk1SOGgzUENCUkFUWm1B?=
 =?utf-8?B?L0RMWFk2a3VObXdSMktOZDNWQ01CSXJkUWk1bzVpOGtOWS9RaWkrT25IeHla?=
 =?utf-8?B?ZEdoWEYrNjdmb0ZBcVNtZk9XeHMyZjRYM1YvalZUK0ltUUNJZ1VOd0JiUDhR?=
 =?utf-8?B?NmoxTE51b1VxVkI1Y2VmbGpFc0s0cGUwUTlFUktVRGtKdjBaSE1ndEZTek0z?=
 =?utf-8?B?VkhVWW40Wm55c3BZSG1iUENXU1RJcFdIc1kwL3o5eUZpTjhIcDF4WjFodzNS?=
 =?utf-8?B?TC9sN29kUkVpQ1ZpTkdZbUxBSFhzdjdRVThzMFBFYWpLZXU4ejdvVm1FZHB6?=
 =?utf-8?B?ekhYanlmenVXNHBwWW5nZG5aL3RlcFI0d0p0azkvKzF6eWEwU250Y0d6eUZH?=
 =?utf-8?B?cmlVMm4xVGJKcU1ORzF0TStuZTBBRTlBbFd1Q0ZJNHZiK29VblhUTGV2M2pM?=
 =?utf-8?B?Sk9oT1dhNnJ6Ymh1S3Vkam9rWFpkQWtiVzdvdityaVFuOWFuTUtiOElaOU8y?=
 =?utf-8?B?d3l4cEdiZ3p5elg5OGNLcTAyaXp4MmhRT2Z1T3A5RnExMGkxT2QzaUxDTnY2?=
 =?utf-8?B?bzlJQnhVSWR6YzB0Z083dGFpWUJQQ1hEVjhkUTRHRTlQWGtUNE5MKytVczM2?=
 =?utf-8?B?QUVnRlJNOXNxQUYxeEtMUVYxcVNqTSs0N3hwcFpHNTlmY3dCSEdjYzRCU28r?=
 =?utf-8?B?U1ZGQ1JnTlpyZkxvSE4yenBycXpFdWdUMmJjQmVCalRGbm1WWElEdHRjQ0FQ?=
 =?utf-8?Q?DgsObifXxXUThDZ7cJa3up/1zABOF+ttxA0faeH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0b95ea-2c73-4a3d-d42c-08d8fbf453d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 07:43:27.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmsCGGd4M/TJ4wSMGpTqhpqA8FWtDUSkZN+gVTHYx7YvlFfKwgBmoKI1TW9924pK4k67gGcgqVl0AWb35OBX+SSX1gn9Nb811RFSL7CG1nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.20.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

09.04.2021 19:04, Roman Kagan wrote:
> nbd_free_connect_thread leaks the channel object if it hasn't been
> stolen.
> 
> Unref it and fix the leak.
> 
> Signed-off-by: Roman Kagan<rvkagan@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

