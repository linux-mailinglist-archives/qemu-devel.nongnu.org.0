Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFB2F7781
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:20:49 +0100 (CET)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0N9s-0005Uc-Uj
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0N7K-0003Jm-Qr; Fri, 15 Jan 2021 06:18:10 -0500
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128]:31301 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0N7H-0006kP-2c; Fri, 15 Jan 2021 06:18:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8qW9a3jx0bsX3j9qPk4bVZ7H1UF+KlNBwPxnrryQWU5GtGjaKWhcScEgkm9koJcbE1So8GaP96gm0n3wYEDd0jYNX8ohzvoqlMmdseaxMOCEFut57Kpnvu5HXcwr80oPhR9Xf7JKhRZ1mFYYZCmMkKZCTLlUlGRYkiTJ8z26n2B4wT3W3PgdnwT5aJ9M27N69o55DT1/63AJOF2ioLpYY2iAEWI1VtsIIPwzgnDIh/w5a4/itKPvZwKC/PpDhgwx/F6PJJAgyvu6nztF2vdKiKhKc2VhdCL3Y2Dt+9F8SCrRxap1moX3aGqCaJdZoFgvNRutsoS8sqiLGB9kUMYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdCNg+xv3aoC9eMby73oHxDcIwH9nU5+3ifE91Qm16I=;
 b=LS+llLrkcOxFKbCuME38AAKoQEAQ8Cfwvsbcpm25d2RrU0QVIaPNAy/XZaXJtCExRqPrvH13EuahR3Exf1WS8NZxY2pvdUR0T7ywddhxMnMlv7dBnWNmfpeSGSR8I1bXVAvZaD3imvw1+Gnfqq3BJFO8+mNwEDkH3wCXVkHIXFngcnj+wqWH8hXc/ooMQWrUYlM71IB3TMwJ1YuB/r76sY74ZfdkipTNsWSTkVx/NOsWrweI1efH9+3UC9u0qobPD26QexNQlj6gpbW5ZgXOQrr7oKjBglwI75oSJsLvRKoLwQbvtHj3rm6B696qaVgDySmU+vZkc/AY+F6B1rr3PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdCNg+xv3aoC9eMby73oHxDcIwH9nU5+3ifE91Qm16I=;
 b=d27LBBdKoqeEjxdmW0znrxyCwBIHvIFJKcEHELFKzYkZdMe/XJRKZHVzTBPHzsft2wv0f93l0xnRCALjRfYr0D3t8ch/rvChPYyaIPXBH94oNvB/NGEh4nuRYIiU8XRWwOkYz2okmZGdfkMW3/D5BwK9ELF0B/gNSKiM3Gv96N4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 11:18:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 11:18:04 +0000
Subject: Re: [PATCH v3 09/10] iotests/129: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-10-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <01670bf8-cee1-9674-7cb5-537554b8491b@virtuozzo.com>
Date: Fri, 15 Jan 2021 14:18:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114170304.87507-10-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM8P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM8P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 11:18:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92614fd4-bab5-499a-f52e-08d8b9473a08
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32213B12A01BCA11EDAF934BC1A70@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+FNKdq1J86zCL1+XmSoJccN0zd+iUQfzfHPQWPF4Qxpg+JvFXpMTGSKEso2w2GetLm86gue8fk6cVi2bYkHs1bdbt+WAQnaqip0GZZMQs8D7TwRIzqOzMoVAPy0TaT5i0c9HRbepmB+PAhpT3eR/kwqAKEk4hXWcJRuZHcjhV/NMZuujiHybYym6Ok/ivSKJmz3beYGgXp4/gTyeotPgk84w2WlgWEY0ZwBsfMPogUhuFOhxQDHTOpf1yVzqGzHLSZaT8zJ7BY3quRMxt1ZDoEDK//W/J604WdT2v1Nc2cJ6O4m58dtDR43cBHW2A+/vkg5H4QWhRwFRSegX6lU3aTuw5CPdx+QPMnARKgcLtY9S1fGqu5Fo6t1v2fN6PS3y9HlOM9sLxgxYwlhD2WEwatWDfpcZcZqVCZcxBzb/ZaHoMQX7NLVdUoC0OrgSl2haG8PMN6q13HrvZ5zebyU4jSGua/9YcYyQSzijLOFtRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39830400003)(136003)(396003)(316002)(4326008)(5660300002)(16576012)(186003)(16526019)(31686004)(2616005)(558084003)(478600001)(86362001)(66946007)(2906002)(52116002)(54906003)(8936002)(6486002)(8676002)(956004)(31696002)(36756003)(26005)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjdOTjFwUnZWM2dFNzlKMVlUSy9IcHhicXZUaUM2UE0xZzNhNVhDVDBLVWtm?=
 =?utf-8?B?M1YvTUdEN2wyaXZ5YjJUUmRWOWxiWEc0QnRYbUxLMStEcXV2N2R1ZWZ0YWR6?=
 =?utf-8?B?MEdyaERuT1lyd3pSTGNTYXpKNS9DQ2VwcjZTaHJJL1lMSytuQm1QUVl3TjFY?=
 =?utf-8?B?U3A4aFlOK05ab0ZWbnVuNFZKaWRBSFhiaXlYRlE0c25JbkF5b2ZrSnU4VmVE?=
 =?utf-8?B?cnB5M1JLSy9aMWltQWFiRStSMTFHUVoyTEZya2t1bjFGbEp1L1pyaVpzYkdH?=
 =?utf-8?B?OGZKRmszSzJwM1BmditmOGQ0dVZKR1dWbktoMVJHaWJIZG40OXRENVpiRVRr?=
 =?utf-8?B?eHVyYjE4Vjl6SVp4bWNFUFduUUNiVktQTWViQ2ZNMkZ5TWtkQ0ZhdXczM1Zp?=
 =?utf-8?B?RzZPQW1LUGhuTnpYMm0vaWQxKzdoRmJBVEdNMGhGUTBhSEFhUTVqZXVHUEFt?=
 =?utf-8?B?L205SG1kWGZSdnNUMmFDakhCOVpwdlN2Q1YvTmtCSXhWYkdSbGIxMGJRUTgr?=
 =?utf-8?B?aWZCSEtrYUR2dXhLYnNRZ2g4VWNHYURuUm5tZGhOVWJSYnIvTHdLMGV3cW5N?=
 =?utf-8?B?VXdWZEJ6eDZtZVhPcGRqUWdMRkFXaURvMlRqZUhIRm90YU9vSmVpdVRnc2o1?=
 =?utf-8?B?TWpMU0JvdDhWb2JMVjZ4SXFsZk5kVE8vOWdXTFlkcXViY2szd2VEZzhSY3pO?=
 =?utf-8?B?M0Qyd2hCcW9GSnVvaWVkZzJoSThQTFJmVk4xRnMybTFxRTYxOVNxSk9MbCtU?=
 =?utf-8?B?SmpvODJUdzlyZnI0UGtHT1NFSXdxYnEyRXFYTGU0emtjaEZBMm82MXhBb3FM?=
 =?utf-8?B?NWdGcW03a2x6VnZGd2xGM3p0SWpjZkxsRjd5RHpFdHhOb2pSam1NMTc1Q1o1?=
 =?utf-8?B?TmhHWWQ0c3NUckhaaGN1eVNTTmxlWXVrOENrN3B0SjhmUXlQTGRjbTJtNUZW?=
 =?utf-8?B?TlExZWtYWGdoMjg5dW5sTjRRbTg5VThCNEpMZmNaQzROSE0vLy9FUkNyMlRi?=
 =?utf-8?B?ZFFRSWdoSDduVklydFlDRkVsbjZGN1Q2ZzJnbDMzdm4yVW5LLzZEdi9QUnQy?=
 =?utf-8?B?VzdPZ3E1cEJKZms4WUduV2FGcitwclp2U0ZmZDhxQWJ4YzM1L0t4T01GUzI3?=
 =?utf-8?B?MWpYTlJEa1AxWHNOS0gzdXhXY2lHS0N0QzViMXRkNllUdWV5cGxBbldlbFBF?=
 =?utf-8?B?UWVpSXZVNGRydGNGQVRjOGhWWXBMRjNGdDA4d2F6YjZuWkhLVXNBbXZ1Q3RM?=
 =?utf-8?B?ZkhqcGpWLytzb2dCVlN0K3NkT0FLTXRvMUhBMWFIK3FORndnaDVxazE5OTVy?=
 =?utf-8?Q?Oj7u5Sw4NCeOPOINVXwUNaKMZCiYrnAwhY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92614fd4-bab5-499a-f52e-08d8b9473a08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:18:04.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvm8rIRmdCibWTvacpUl4+sO/Y93iJ1D0waRnWbonHR3Tw9p4PLC/mfmNhl5/qQK9CTSFOsAv2CGfNxsXx378DWeN/N7G9wvD449vI50RPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.6.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 20:03, Max Reitz wrote:
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

