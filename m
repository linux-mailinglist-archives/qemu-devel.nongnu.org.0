Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF019416283
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:53:59 +0200 (CEST)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTR2s-0005Z8-7O
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTR0r-0003XT-Ff; Thu, 23 Sep 2021 11:51:53 -0400
Received: from mail-eopbgr70133.outbound.protection.outlook.com
 ([40.107.7.133]:56745 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTR0o-000695-1w; Thu, 23 Sep 2021 11:51:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtoNxCjuEzp/k1SyrNz0NCm1jOf23QXFaC18M4qnvc9j+xRUDDwwr/YNRzmbW/y4Yvpc31Lm729YyjGTE7rZSrzZu72X1v6zWKrRvaaLR8TZ9kmCMvFKPwyDBJdjKagoH1LwCezBoZPkUUPKCcw/cM+tcwv0u7dYmIIy2QWuIgofVn9/2oeLTyk3ILhu3CjUXr/peF2SZJXV8oRAo92KcSY/2osBuKtgEqonuAdFwLhkY9xkKCwlHqPgQfpmPfbw87qNWV8DKXcoVdbXkX6E9XxkmNmyEZvVoL5ZVsCbpxzFA6THzTSXy8KAYkJl6UYR+VizeVZ6EI7sU01Qki6L9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gpoMjKGOGLaUfkalKr9kfIQnwJpehTJkSLMx/hC1t38=;
 b=SQYdL9Rb0y/1YyikwQgv/+eGS50uSHMGUf85HcLWhkupYsC5F00P4ywi/9mMRblrHy2iTRf4iofA2Z671aU3uvoeIqoL+3PsuTaP52jYaZqeqn0wunUVGYVWtj3UAnLWrukaOEPtiJIAuT5g/CTaLW30n4rsioB488gGUqBk5LGVQ7pKF4lNkiUo+tzTHTCMIcVmkpqB3rGsFwsKdB2BuVMEWcP+f0sjjfpaPBsvEgad5jTiidE60QSoHOk29bVeaYihwG4lzoo7N75CByFBoxoZwafyFmRPu7dHz1Gsjtr8uVpdZBq8wliHgwt4VGmKjcpVfxRrvnuSRJAKZTA7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpoMjKGOGLaUfkalKr9kfIQnwJpehTJkSLMx/hC1t38=;
 b=iO0cV8Lcxha5Z+QKGwEKZwoGK3aKD3VeFXAihuKOarQSEcLflLOUcwOESp5UoI6h9DzSj1jzQx1QX277sLpbnn4XSSx/DqjIuMBLVjnuRTdKGCA06r3ZE9+H5iLGt0WpnM6ZUQHTr6Kg6QvZXAXljqIaguYJscTrZIglB5Nqe4A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 15:51:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:51:46 +0000
Subject: Re: [PATCH 6/6] iotests: Update for pylint 2.11.1
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-7-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a78149a1-79fc-9bb5-3a44-af571092e8b1@virtuozzo.com>
Date: Thu, 23 Sep 2021 18:51:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923001625.3996451-7-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:51:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9601ed0-c232-4a6c-88e6-08d97eaa0c4c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-Microsoft-Antispam-PRVS: <AS8PR08MB67906208A91614049702336EC1A39@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QyRhwLyZehYLL7jgd0GmXnvKJDN+c7SI5SlHLDYvuppT6MneMYAh/I0vVZInq/YOBuGRYv9pU79F3lSGfOeSZyezior5YBY3PK4WRS6zp3DisqMJvRb5L/PZ1/qfH2Rn4nF+iFd269Z/sC0N8AnF6ExYoV4ToUUeUtJ3zKSk9Wva0KqLsg1TlLjWGQ6xEgz0nzMLGE6Lac6WUvdlb8bR11ZzfzWD1ePAdQHX/NbO7Q3OSejkF44PoToR5F5MR9VCpv0p0+68tU61/G4zKgfg7V1AvkYaWq5k2V/cPN8nbFM2svNXQoWY6iVtAz13/Qf03RzNb/a6P2fcCR8n0x0Z7ae4UQtF5naKkNK8kNrIcaYDp9RT77lCljmxWPV8QDPHTKGcz2jk3tnD7CnrRezSjAOAv8T9msa/rxpkxdhn0Oel8p4vI35s6kPkLeluyXEtkBtO7sQdhmf7askqgnBndFDfnt2PUyKUsgssCZAKGgfFGInO/U4aKr7626w2R8JzUJGBRH4PEE+M6o9kq802vQNRWZXRifau8J3aaGcBG2/X/aZzReH5uSV9vfHHnoyIRQbKtBX5Ui2phVOO0TCL4NkpBBaEZQchHFCE+7YzVpISvb9qYob4rUKK0kP7fZvPGe+Bs7foqIZHpyvqY2H+P3noyh1ze7KZQi8rCWJfc+AyCJcejFFPBxCvT28ukVjB65/3+3lPGpol3L12Nq5FIbn46W5V1IqhB5W3kVPWYBsYrJ9GGGznkTlk7vwRqPGVq5qYcwtwxXn4LYOPdQXXuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(8676002)(66476007)(66556008)(66946007)(186003)(956004)(8936002)(38350700002)(4326008)(2906002)(2616005)(6486002)(38100700002)(31686004)(52116002)(83380400001)(316002)(54906003)(4744005)(5660300002)(36756003)(16576012)(31696002)(508600001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0d6UjlDNXJNQ25XQm56b01PL055a3kyZjZMM0RXNjlScFAwR09wU29WMnk4?=
 =?utf-8?B?ZVVOZG5MTmJQck45NzBMdG9td2V1cncyUVZxTjU3TzEzS0NjNm5LbU00M3U3?=
 =?utf-8?B?a0l4RHcrRkpIOHhTSGE3TmIzVHBRUTA4UTVUdEJYd3Vra2xGbVBiSStoMWtL?=
 =?utf-8?B?V1J5Vk9BY1ZZOFd2V3ExVWxRdVVxSUUrSkRDZk42OXF0bHI0OHJEQnFqMnps?=
 =?utf-8?B?bVc4SE9hODhHT2owVlAyWTRneVBtc2duVWZqVFdnMG9XWENyTWZnZkIwWWRP?=
 =?utf-8?B?cHRzYWdOdkdJekFJZnpIcWdGaEYvbU1zRjBla240N0E1b0FreXV5QVVYK2Zw?=
 =?utf-8?B?dExOUDNjVVBPVlNXdGptSmlNMmxrV0JyV0lLOHhOdVE2eWN5bHZyMUlCL3d1?=
 =?utf-8?B?b0J0b2R6Y0k3Y0pqei9oU1lHMkE4aHJ5YTJscTVOWFAxcmZCeUNET1g1SnBm?=
 =?utf-8?B?TTRYaUFwQWorWEh4NmpsZU9RK0g1TGdBS2p5cjJxT0ZGRUtMZXYyaEx6MHBi?=
 =?utf-8?B?R2Q2WW01cG44ZjgxbmtyZDRRM0QxODd0RWY5TEFWTGJUOWdNcXRzS0sxeDN0?=
 =?utf-8?B?M3lMbkF1cGx0eDZOQW4zQkV1NXJmZ21rREUvZFVNb3gzK3RQdkVCWStSc1lk?=
 =?utf-8?B?SnA1N2pPeUdUSytXRG5laUZ0UmNtcy8wdmI0R09la3RIckRmUEwvMllwTFYx?=
 =?utf-8?B?dDEwdmkyYmFyb1FBNldWSUdrQ1JKbm1tY2o4dGx3K3IranE3MzQ1VVBtWFlQ?=
 =?utf-8?B?OHFuMWhMUE84Z05USFlZeTFGVDlRZVo3b2EyRVR0VFZ2VmNUSmVKNE0xNWJJ?=
 =?utf-8?B?TkZ6VzdDcWhidzQ0REJiOWhzN25acXN0R3NOdzhraVM5V3BNNUlFeGRNRzVy?=
 =?utf-8?B?M2dWdmNYOS9JZ05ZaExiTjh1YThpcTc5RWIySXJFa0tEOUM2N0lBRG1uUndn?=
 =?utf-8?B?enFlek5nOW1qMHBjMk92cmJGUmZVSlRmODZCdlA4QmZYNUVCVTM3c1FZdTI5?=
 =?utf-8?B?dmNDMTNINmdUa2pkSzU3V0lZNkZSYkNGYlpXd3diK1NSRDAwbmkzS3FxQnpp?=
 =?utf-8?B?MXFMckF4Ym5XRC9CSlI0NUYxTkVyU0o5M0tjdm9BVmNXNHI4U1hIODhsUDgx?=
 =?utf-8?B?WWtrUXRPbnovRjA1YjR3V0JKR3RVMllUSkFFM25PZFFPSXN1U0d1dEE0MnZq?=
 =?utf-8?B?c1hlZytSMDliaFk1cHVuQ1Z3dFFPUDNrb2dUWWxIQ1laOUh6cXBSamVyaUVy?=
 =?utf-8?B?aXRlc0RWS0lLYVRuWndsOVF3ajMwc3ZVWU9kUTNETDg2QTJGbGFWdHdtcmJn?=
 =?utf-8?B?TExPbWJ3Q3E2d3BscVZRSnJENjNORURyM1JjYjZCQlNtRWJUZ0dlLzRLUXN0?=
 =?utf-8?B?U01UbWZmL0NYUzRIWnpLSzNJMFh5SUFBc0pxYXpFZDhSVjBlVjcxUzdPMjhK?=
 =?utf-8?B?TFl3V1BLOXkvd2FreklyTnhRdTlwYmRQenFSaDFuUzdqb2l4ak5TaEE1bk82?=
 =?utf-8?B?TkNmRVJLRlRrdmlqSU1MMmZpS3V0WEV6VkhvaGFOYUNSN2Zxb3BxZVlJOEQ5?=
 =?utf-8?B?ODIvQWNaNjIxUEo1L1NoN0k4Vm1NL2UwbGsrTkdiQjNDa20rSTZsQzM2VzBa?=
 =?utf-8?B?Y2MvTUtiNXZGTVZSdDBQd0Jya2Jhb0lYZS9KVlJpdDRESkhtZEVrQ2s1UFNL?=
 =?utf-8?B?eHNVcXJSQWRjODhwVFQ2RUxta3lLd1M4WFY4WXd5OGI4NC9BOE5qODlqM21o?=
 =?utf-8?Q?mN5il/jcPaN7RMWTYYLrUljGiHIhC+0o6fSKhIh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9601ed0-c232-4a6c-88e6-08d97eaa0c4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:51:46.6583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Sy2lMc+4L6RLO5nJ1eFdLJ+/IIL+jnzvW9zcQvUM45L2uMm/S++skB6crZkB91HvBA3tsJZe38a2xiJTzWuCUcx+q4lcDBN/oMiy85QgNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.7.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

23.09.2021 03:16, John Snow wrote:
> 1. Ignore the new f-strings warning, we're not interested in doing a
>     full conversion at this time.
> 
> 2. Just mute the unbalanced-tuple-unpacking warning, it's not a real
>     error in this case and muting the dozens of callsites is just not
>     worth it.
> 
> 3. Add encodings to read_text().
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

