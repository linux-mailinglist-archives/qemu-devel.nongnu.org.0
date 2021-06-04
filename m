Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DBA39B526
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:47:57 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5Ui-00056K-Bm
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp5T0-0003mm-Sn; Fri, 04 Jun 2021 04:46:10 -0400
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:40837 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp5Su-0006Vs-Ta; Fri, 04 Jun 2021 04:46:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjvPyhx0BJxQPuWuA8PTQYOxwzNHKtbBaVDYwq4svXOI7KNj4TW9zWppaxrs9SnpXjEYGwK48o16M2zlBAofzDHoRxmxmCXZ5UI2JQHX8cyOqGzLf3lQkeknYjdm/Vl/VG6Pfz9+FOidF+BYcFpeNlgONiqPJx/NpuPgh9fmA0p2u7LhLOn424hhM1GBZQDUiL86HRDurNY/eHc3KlRNJlEgoxA1GKXscsb9D7F6F4wEynB7K4v8mNwJjtXvhOJnb0otDvazZuujpwhvncx8q3Mt4+hA2ED1eIe6mY4phWQ8ualE0y840XGX3No7IYVvFSn79mSPwl0Td9Yg7VtzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MC2tz3chu+4AmckyPhOXCmgd+uDUS0H3nwPWjCWd30=;
 b=FAe68Mw0zG7Z9OiIcr75WYaDFNe997Jfzo+fXdQ2Ov0R19xHa3Bvzd+zkTJb/zkQOKq1d+avPrGWglOshgPdJ9+I018NL2ChWIVk1lb1NiesoITj4owZWHFOUnYemTkGI9PfSqltxukue3ngqCU2TjQ/uf5Z8eTM1WZ2WErusZ50OenA80zXuK/G2jrk7+f13nUVpsqJfUh9eHX2AYLR8H/EPus4l8HjUiCO2KqOW5ERnNfIqBfwJgFbr6PTFFUNiTnQ7lsQt20zxBWTKRtjPpC2KEAz+jnTxY+geTe5YG0BO21BQ8BH/iE8e5SBW96fczLNxYopR6i+CboM2Vtl7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MC2tz3chu+4AmckyPhOXCmgd+uDUS0H3nwPWjCWd30=;
 b=va6MY6v9Htzu7qdi34QTK8/Avci+LSFqgVT/8DT0Kqv6cgpktFFOPeEP8wUIHzp1XU/+846eBOF531szT7DYPw00M9hRcwjjgVZuvcxDakqifH4kZgb/XrWBl10Tfwn6R25DIDQ8EFBhQ5QzGZEmmHIhq9jpYx2GNApgQMyRrS0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4721.eurprd08.prod.outlook.com (2603:10a6:20b:c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 4 Jun
 2021 08:46:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 08:46:01 +0000
Subject: Re: [PATCH 1/2] meson: allow optional dependencies for block modules
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org
References: <20210603130732.208065-1-pbonzini@redhat.com>
 <20210603130732.208065-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1383383d-5ce8-7e70-c88c-392257ef7eeb@virtuozzo.com>
Date: Fri, 4 Jun 2021 11:45:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603130732.208065-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: PR0P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 PR0P264CA0079.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Fri, 4 Jun 2021 08:46:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197e3c19-5df0-4587-b759-08d927352df4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4721:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4721956F7A1AD26A9E3F4C7CC13B9@AM6PR08MB4721.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8nTfWloIVF/NCIGfEUP2oLIqoQRhZ5BiDfU4wbyoFs6zJAMkxY6dW3ghO7Ub6gckJjPRdOuACIdSNDX/B/xyjCwhNs6AiN2d49DGbvZ6LQvQ8O8YQkHxv9ngmDVd71I70b6GogCA1ZqXWmYnoXwuBSDv7v9u5hfYavKdS55H8zNq9KTBc/2XFQJ9bCH1fxj5mp7/0FA0T284cCtvIVb8Hdq4MiRCDrOMwX22gPZSxU23XIEjCO+dHaHY4zPu1VlkC6LcypYNkOYmqh29H2B0mVNUmXj8fsJFR7DsLQii9uuvO1JPIrhbxCNyl6ctYm6hWHQcvCMdoF+zZxrJGiome0xhyVo4lbYpsmer9w8QDBq/+0gfoNDKi05qOEcY2C7O5sPZ9ABM4VlsVTKUcEo+I+PVt9U9TFv91zZX6wmI3VApEIwqCxjSiszXPp/4hsoXiOQsnlpthyjXsVqML7II/mMfYGIfBaJEO2PBzaHD3A4gkRpM1my3m5yHRidwjGp78OepkQlDn5W8QXm8LfQazjMSSman6pFc8ekipuOPW55GvhkJiq1wlGgDNZssFYi4Hr5FLJ31U9AlDupoUBd1pvK30MWBxN8+22tj2E/Ds3v2jMdAcAqltIUFC1ueN5tI8iospCiH5LSGlf9WVqaPu0iG31XfIXHDH51BDgGw2YDgskwPQnHeWOTjyeJ/L+CfJsq6pHMRzrfnz2v0Z1DCgK5RoU5GFAGxnSijUA3q5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(6486002)(31686004)(86362001)(16526019)(5660300002)(26005)(2616005)(45080400002)(186003)(956004)(66556008)(38350700002)(8676002)(66476007)(16576012)(83380400001)(8936002)(52116002)(38100700002)(4326008)(31696002)(66946007)(36756003)(2906002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3RyVmhqYk02ZVVXTmpOOXNhME9DN1d6YVRWS0VHN3ZIa0FYamlkdnBuenlW?=
 =?utf-8?B?dkFkV0EzbnNCSjMvT2xmQmN2L2JPTzhvdFJDMURWVXFVdFFhQ1F5M3pvK2Rl?=
 =?utf-8?B?S1JtQUhISjZOdEZYaitQUC9QSzBFRU9mN2pvU1c4bXh0eXprUVVuZStoblFS?=
 =?utf-8?B?SjBuaVRsZy82WU5ndy8zQkEwbGVOak1wS3NFVlFlZi9aMTVlNTNHWEdaRmxw?=
 =?utf-8?B?b1N2N2JrTjBDTVhvNkQzTkdsS3NkNEprS2VkVmlIS1EwRnF5ZjZuYkRTNTVy?=
 =?utf-8?B?OUMrc3BUb29lSldKY1dKSTZzMUFTVi9hbDR5bzlzYTdqeFQyTUQ0Q1NYbXgr?=
 =?utf-8?B?SXpidENYbmhLZldhbXdqSGp2aHRVSjEyMlFRdnlOZExyaEVXVkxyVmYzVysy?=
 =?utf-8?B?b01iSnQyUEdHVUp5TWxsVVpTTzZRcjhvQlZtUTFHOWZZdmRzRmN1N3RsU2F3?=
 =?utf-8?B?RThSRTY0M055R0Vvdm9xbjgrYWp0QTE4d01mMmNReGRHWjdKNmFiOUNvUk9P?=
 =?utf-8?B?bnk1NGdtT0hBYzhTQkVDV2hlZFAvTko5NDZxcXNxU3VIazFQWWNWK293d3Ux?=
 =?utf-8?B?UEFTbUVHWkc0TGZISzhWM3pDRGtvRTF5SmFkejV3STFvaEZjS3BtNndod3pM?=
 =?utf-8?B?TVJDVWl5YWozRERlWGIxTGorUVhqSTN4OUtqQitWbWVmQ0J2R3VKU3F3WUoz?=
 =?utf-8?B?SlkwcDNyNEVQV0JhMnI4a2xxMGZNcXpTcWFPK0lmaWRreDA0S2pGMHVBV3Rw?=
 =?utf-8?B?WUVkWmF5VG5yUVFseGZaUDZuS21pVTM0b0RnUlpDT3VXaEhoUmNvNjVaa0tW?=
 =?utf-8?B?L0kzUFJ4WFArNlc3RUIvV09uRW5aM25ES0I5Ry8zWjNHWXhrUXRkM1Uyb0hJ?=
 =?utf-8?B?QkNRemNDZlZwOWN2dnlDMHJ5UnZNTmd1MnpqMGx6M3ZqUWNzdEhia0IzS29t?=
 =?utf-8?B?MUhZVFFiMGZENlB0akVrK2xhWlVDcHJwaW1TQ3ZUc2o5VzdIVUpqM1o2d2c3?=
 =?utf-8?B?VTlrb1lFWDFFRE51Z1VtMng1WG9oU3NlQkRzMEZjZUg3YjFudzF4MGxuSTFI?=
 =?utf-8?B?QXdwNWNtRVVpZGJ2Tkl1YW55bUJLZDQ0OTRDeldSeThibWRpbzhteUQwR0Z0?=
 =?utf-8?B?NW5lV3MrZ3FhbDJTOVBaNkZhWGlrb3lDLzJNU2JLSmNObUFEVC9aWFhMTGJU?=
 =?utf-8?B?RldwNEI1MUcvOVZIaXN3aGp2SDd1NjlnMTlkZGFuZnBpTTJUdnFaeVRncVFz?=
 =?utf-8?B?V0cyZmRjM2FQNEsyL1VOOHdzL1oyNWg2UkRGRjlBTThzUWNVNklic05QSjlj?=
 =?utf-8?B?b0owTkdjZG5ma3JHVTRQL1J5ZngvdFMrUzRxMXdHTXpDMm9jTzhGQUNMSkdq?=
 =?utf-8?B?VEo2S0xQc01aTDdvaUcyRlllL2J3R2dtZlkrTDZWQXhRN2tyTEJpd0NCZFZ4?=
 =?utf-8?B?ejRZU2M5K1N5VG82YU9FaGJPcTBEb3l2YTJ4Y1ZpQ0VzU3JvcHQ3TUxMaUYz?=
 =?utf-8?B?Mkp6TzN4V0l4WVZRZWovWHJjbXdVWVN1ZHZtY3VsVTQ3L3UwWlBkZXdpK3cx?=
 =?utf-8?B?YWJiL3d2bGdVc0QyS3NOWC8wZkJ3blYrL0hNSmVORXBoWHd2c1Nad1lrZFpF?=
 =?utf-8?B?ZVV0MkZqQkNYU0d4SEhFVDB4Rk1pbXgrTnlsSklIQ0Nxc2lmYWJ6RFMvWXU0?=
 =?utf-8?B?Wm1uUzAveENRelY5c2VFcHRObXdsU2cyb2lrQWpydi9NemNhKzZoVVgyU2VH?=
 =?utf-8?Q?pq0mr2P11H+7UwznHSPsrN4Tx+BLClE5C782w8g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197e3c19-5df0-4587-b759-08d927352df4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 08:46:00.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAvm/8DqSctGFfV66Sy0BXH7ID6+39oZtOY+kfymmuomhi4sucQorlmJge5tw9WMDFQCf68EWLeC8HZea3fbgV81rNnZ7m3f+54FlAyN5d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4721
Received-SPF: pass client-ip=40.107.6.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7,
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

03.06.2021 16:07, Paolo Bonzini wrote:
> Right now all dependencies for block modules are passed to
> module_ss.add(when: ...), so they are mandatory.  In the next patch we
> will need to add a libm dependency to a module, but libm does not exist
> on all systems.  So, modify the creation of module_ss and modsrc so that
> dependencies can also be passed to module_ss.add(if_true: ...).
> 
> While touching the array, remove the useless dependency of the curl
> module on glib.  glib is always linked in QEMU and in fact all other
> block modules also need it, but they don't have to specify it.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

