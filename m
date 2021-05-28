Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C90394639
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:10:41 +0200 (CEST)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmg0P-0005l7-0V
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfz4-0004ns-Kb; Fri, 28 May 2021 13:09:18 -0400
Received: from mail-am6eur05on2114.outbound.protection.outlook.com
 ([40.107.22.114]:3041 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfz2-0008Kp-LV; Fri, 28 May 2021 13:09:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvUtvitaq/TXL3Ir4C/qDA9TuZdC3a6eRO7QvyhmLYAZVsTr/N246SN0DsMedrGBNE2Dq4ocxqWFIY4DHInHunocx6ccs3f54moy1+PNjpeRKcY6GEUp7gE5pzGjLgmA2jCKKzYfAUr5pD/sMljBzeBfe7MEQsgTFRN/5zs6CNGDicfTwQHz7sUzKG8mwfpzOTprzuO2igOAsK7IouS3a/2iZO8JcvfRUODvZgL3PTxJyiCYi957TKI6JKYAIWz8IFEk6KxCl3dmqq7FrJreIHTBefoa8STDF3OE7gGyUkeEQjJ8BjT4kfQIj7e8v4mC88aRI4UQXvY1O9XRGuxPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCEn9Mcge6olJ0TM2zri4wgnKstx7AfsykIje7Mothk=;
 b=BIIjRu22ug5RcRZnV/W3zjVNDMvE816fZ4BruOQ0/MXhGfQmxv1b+ae0c7d2fv0IX3XqqXJjT+Dk8yGiHlH/PtNe7RYKURgOiybybghz20LNQ+kA5HZTlC/tDQ3ZrJ43lF3t4/lr8aaH/ef6USpTvCnaWu+UrduvTfkCGVyohJ1vDE3Vdv4WKE95xD9iTjux1EH7vOK56Wy2JLzLDtqTIZFSWwZFHn560JDDmluIdv5Ag2tFT5+bt4LN8Zzoe++Aw4iNzRq+DoxcVK9frOxfD43/EXciVUNdjfTf4hiEwJMe/HaSo79wP6vtWyxgSCOyKLoXWnnTtNOLCSRLNHiStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCEn9Mcge6olJ0TM2zri4wgnKstx7AfsykIje7Mothk=;
 b=Tbs08JnENqQ1RU6cHDRHmUXFW9t30kSglP/EhR9TCtML00mOHW7BbZOoBMBmmqj1k1rmz1jbHJvZxuFLs8LevZWsSVsvhXGJogrGPy5rcAEuxkIG+OJYGxnk/NYn2QtC6vVZYHpcgnL0NgMcUaidVkbGVOGjEt76fkbG/bMNbnk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 17:09:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:09:13 +0000
Subject: Re: [PATCH v4 07/15] qemu-iotests: add gdbserver option to script
 tests too
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-8-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20024abb-fe04-a995-f498-4d4bd6bc18b9@virtuozzo.com>
Date: Fri, 28 May 2021 20:09:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-8-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 17:09:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83a2fd92-03e6-4c1d-f745-08d921fb50e9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-Microsoft-Antispam-PRVS: <AM6PR08MB37175FE92A626C22CBBDE2ABC1229@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFAfyWwxC0y24EreMMKc0sq7WCm3qbZyTAazyq8TF/EMpxQKKCinYp9HEmhdnWLhxr7oZzAoGZS/RnKBE6PCiyJZLMycC1yBwDIHfrPjvBg1rj67nleG6BdAgNAF0s8ydGaZg1BfneYYr2tBOxW0J8L6uD5KchQoeMausrh0K/Wvf0Iug0vrdHQBO/RaO6T1EybwdlwlXdGei6zR2bV4HRYAMLuNxtOuRL+DAlxcf+wwtjVpQl5FkOe/W5I9ADfno7T/n94CbiCAS9kU8pY0C3rcGClMagOEYgmXs6beuhd7O2BsSRcboWbsK9XD4aEJgD5c5qhqT/faKra4eEajxU+GFCFpaUwyMvvZz8ssKXL1VPsjfgCAUm7oLNah6TdI1Z1mtssnkKLmC57FxWQlbR16AVtXTdj1Patu2ctbLrhpZQo9jl9sMpYySsnYq0rpC1ls5xkGcaSEcB+BhHP9mX9Z5iGyunBG0e69BasA//nL+d0dGfCarbuGf/AZNGGcy2SiIEBTZuIcAq/r86GNRP/Y+dQpAxnhSRKsM8PfjWIBsYAGqjwFyueCFxHNpJ41haKywyR0dP/8HfdzH7t2HIkels0lIIqjpTAfhdK0HGfv9BkMHxcXlTW1puFCA9VQSg3ijG6XQ8rlQfHaFzhGYbP2mxACTXUfPZpB23t8+hk7L0LmurwvhJdopsJMPzH8yTwFb5cTuhyBrC1lQ21QxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(376002)(396003)(8676002)(52116002)(36756003)(66946007)(8936002)(956004)(186003)(38100700002)(66476007)(16526019)(66556008)(26005)(478600001)(16576012)(2616005)(6486002)(31686004)(54906003)(2906002)(86362001)(38350700002)(83380400001)(4744005)(31696002)(316002)(4326008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHhSUDR6eVlndzdMTndCekVvMUVDZjEzZGcyVSs1U21JcG5SaEw3OHdUMUFZ?=
 =?utf-8?B?OXA5UmJtVTNwMFNlNEprNWpNUlRqY0VuOE5Qb1hUM0EwNlB6VjRoMVhmc2Ex?=
 =?utf-8?B?NTAzbU1Wc2VFY1owR3U5Zk56SE5BNktkYXlvMDFVRjBNbm1oT1E3L3lYWUFz?=
 =?utf-8?B?NUVWODkrK1hDcVRSZVBQQk9McFFrcHFSbW83a1UzVzI0b3U3L290bXlWVHpT?=
 =?utf-8?B?bzBFSFBXYnpQYVQwTmQ3bUVoWDFxWGVjbkNwQlJGNEZHS0lHZmRFQW4vWDBz?=
 =?utf-8?B?SW1TN2IyaXJuUm51K0lwQTdqYUwvaDFPQUg4eXdpUWFzM0xhMm9vQUJpMUJr?=
 =?utf-8?B?UkFQa1pVeGdvUXIxTUJVdzlaTG5jRnFkb3JYbjNTSEVlcmYrQjNTaEV2Nisw?=
 =?utf-8?B?Y0U0WVNud05VajViN2RmamdMemliV3NGQlB3cG56dWpYTjZFOFF6aE45TDRG?=
 =?utf-8?B?Sm93K1lOK3g2ZVI4bTlTc3o4aWR4a29lTGVUclhNdS9PNTdnUUJYcWx2RzFF?=
 =?utf-8?B?ZVhWTHdvaDA5ay9hS0VLdG5zQlU5dWtFa2ZBVGpxZlh2Q3VsMWhkbzNXb3Ry?=
 =?utf-8?B?SzJuK1A0enJ0Q25wSnpKOWRJQXhkWmw0L01XTkd6bXl4dmFtUXYwSXlGR3F0?=
 =?utf-8?B?WFcwMWpMOFpqOFFYdW9OaDFXdzFNNVVTcTVZMG8rRnBidTg3blRVdEVJZFhE?=
 =?utf-8?B?K3UyZzQyZlJaRW5oTkNWdjNwUVgwRlRSckRJTWgvdFV1bm5idHRrdVlHZyt5?=
 =?utf-8?B?RVYwSFAxRkdSOEwyVEtoRkc1V1hPMnRJTzl6cVhaTy9xZG5aeWI1WTFOejlH?=
 =?utf-8?B?N05nayt0aHFVclBiZ2h0YTgrL2o2Nm1xWlFLTW16a0h2bjBqWkRtT0phYjhK?=
 =?utf-8?B?VkorSnBzaitoS2xMVjhsRnZPWlh0eER5a003enJ5Zy9TN1dVbGtsYUozaUJX?=
 =?utf-8?B?eE9wTk4rRGpoeTBiS1VZMHBWdFVwU3d4TTdnSngxRXZJbWNhb3pJMUpkcDVV?=
 =?utf-8?B?eWpwYnQ1c0ZjV0ZtRkpmaE9oZi9hK2R6Umo4VXJ4eWRvMW1KbStGSnBiNEZO?=
 =?utf-8?B?a3I1VEhhaGxuV1B6VkIzQnN3Mis0K0QzZWtjV1d0dURuMkhqcU1ZSnpJWFZF?=
 =?utf-8?B?ZDVkSjZaaE1JM0VjV0xacmlFMDBFK3FJV0dncTFtclRrdDRlMjJjWm5rWk8r?=
 =?utf-8?B?YlpOcHY5dU96eFRCOHJCaWYzY3MvZG1oUVFEbEdHVTVMb0crWUZvWmMvZjg2?=
 =?utf-8?B?SnlKa1pqenl1MG9Kd1hRSWhuVmVuNW5UVDNGMDZxL2FDSmF4L2Y4b3JPQmhz?=
 =?utf-8?B?ZTFkTDhrdWlmRTBvblZyaG5zd09obWk1eW5lVGtaUmNYTEM3V2dVMjFwMVk1?=
 =?utf-8?B?SWNCU3R4RVJHSWh5OHNxL2xHSmpkcE1YdUdUZy9SQzNBZWZJcW12eG5HVy9a?=
 =?utf-8?B?bTQ1TkRVcUQ0MitQcmd6Z3hZeURSVllrV3ppMnFLeVRLb1pUaE8xamFXR1Rh?=
 =?utf-8?B?a1ZoLy81Nm5IOEd3YzJ0ZzlMS0hDRSs1ZGYzeUUzMVZZMmZ1T040c0hkZ1BO?=
 =?utf-8?B?K1hYcUYydkRSU0ZnUk5ncmZzSWk0NHd2elNQRGlnQzFLanpJUGc3bmZiRWla?=
 =?utf-8?B?ZlpZRzZoancvNjhYRldaR1BlRWxyY1lKdytLNmw0Mm56aHBiT2FQZ3kreWJB?=
 =?utf-8?B?a2QrMWdqNDdtdDVMRlAwNWxKS0xDSnpBZ2dlSGZPaVJibFVQa0hlSFdyVXFL?=
 =?utf-8?Q?RF0mI69875f6Kp0SwbCR1jx9Q0VaHysOKx2X4MX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a2fd92-03e6-4c1d-f745-08d921fb50e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:09:12.9137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEcf26DNg3lE0FoDhpL3nKlKucF7m8tnQWFCXOCbY1AWS591GBjfc0ykJvmVpCHp0SYgO+5YSmFgXH0hADvq419pCDXaPpUawQmH49SSWHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.22.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
> The only limitation here is that running a script with gdbserver
> will make the test output mismatch with the expected
> results, making the test fail.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

