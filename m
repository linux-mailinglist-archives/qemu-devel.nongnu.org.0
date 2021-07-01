Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2B3B9012
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:55:56 +0200 (CEST)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lytQJ-0007Wf-2n
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lytPG-0006b8-TQ; Thu, 01 Jul 2021 05:54:50 -0400
Received: from mail-eopbgr20106.outbound.protection.outlook.com
 ([40.107.2.106]:17998 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lytPD-0000ZZ-JZ; Thu, 01 Jul 2021 05:54:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBkmPXg39+gOArpBkCj5e//gNSNeP4EdLX2KS4PX/mstCI+WptZcBvs/0KzCB1dc8+b1bn8BnlUC7jRqFDuN4o5qVuio9M21IepY0Bf2W8IvnE3pTsiZMqBxI1HScsX26tDzMtkGlDCCZiQhMc2jfnpi2qD2/XZ7fsNIUomfrPkYxhYm3aURPgLvBPBjCUU9voxaXPVzYi5MYZkeM6AeLwh++0fQIMs+X49vBKmtXS69jrcUTJ85mtvIPHK0jgF8tncXYkETJjSDt9y/cpaFWhmxBeRJVqbNdU4IVILWqwgFy+CmIahfOR5afFY6/DYxSUGzY8mvkBsfl4Vk8ienPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4j4nQsAYonNAIf6FlTeXSArBh1/7FuozehOT82P//c=;
 b=FFlww7fUGsxJ6GEq9xNnw2XA+mcR3amqwbD5pyI8/dCI59mAVvP1ku428QK7wWM7souwna13ZPANGwKAM5OwOissmcyMd1tqsWchqV6yloefSEAfZ5L/Ltq+5Chi+233Ujh1aCt6AwrnkBJtv1LC+wMEgCtSxSWFoYsBvqIstIT8Fc2UjoWYpDCF4CW98Yjk5tMKP1SB8bQMcHx5y0ls2uJxrOOR06Q5ag1LRVdVVokMFglMIug5iPa3Lg+SHuNe4ZiERIGNwnzoB+3R8g46m/hH5XpGfi02ntiSYcR11Ij6ivS6lqhbqCSo/7L4IYrSVk33xHGtVUI8g1rCX8+Q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4j4nQsAYonNAIf6FlTeXSArBh1/7FuozehOT82P//c=;
 b=gRWL1qIWfwxFzHOLd6/gBkxX/3mcJO1n2HXYUP7owX5wJoTx9yjs95Xi8pQGN9S1IdTuxUF3IyROr41X1BD80DCzSIB4xAhL2aEfBE5aLXlu+RZD/d1dUnCvP+HqJA/QxNCzT4TF+TA3dHV2aBqRttyrhA/h0OJvW6LY2nPQBUk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 09:54:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 09:54:42 +0000
Subject: Re: [PATCH RFC] meson: add option to use zstd for qcow2 compression
 by default
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210617195128.66675-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fffa5d52-7d55-8893-01c6-e85cc0fecad0@virtuozzo.com>
Date: Thu, 1 Jul 2021 12:54:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617195128.66675-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: PR0P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 PR0P264CA0124.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Thu, 1 Jul 2021 09:54:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ed37dd-a79b-47a5-1217-08d93c763fff
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713CE2B3CB7B262AB09A3DBC1009@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jd1rfa2SQIuXFa5+dI58mXt6h7Yy87DyTX3flCdCS3Db2QtnPdaGIIE6nr2ho0rYnIzgkW0aZ03isvsdm21WtiTa6SbVwYzOvlA7EK3DnSKWKaYPv2h8Do60GP85uiq2446YLroB+XUf4V555NinrBV6C9RxjHeyjCN/4z+VCK+hMbkIU7vG+f7+zwU+Lr8cswcxpRz2q07LHKzbQ7lov5kMpowHGFKRWCmOEmU7c536osOkO/mE3hb/P4M8+kts/V+o66Ge3AB+dWbr1MAlEdyD2kwjas28B4UxKQq65m1KPEQCt6mrpMwCPc9fhlcVaxP4IZMNpKfrAaqraTgVr6jbi1/iXCXkwbqRkPsCw8CQAVg08jOeM537+RTNFnaZKODxH59+PxY6nilSlNkYs8u4AxQWP3Y8mu8cGm+jrpv5+B2GlrmdliJG11yNWlA3vVb0no1DH250vVpG4ukabubppbBKkNhfW1vIV7xKCkIHDcYoVH8PCLldgaNcmEcBHohjP8zFFNet7tUtw57BvFdMnWmbtQHzmBItTV2CZg8j0qCi8WwN+5M1JWP5hBV6SNGsfxs1+qMiw3Vg03iRbWZ43M6CMl1QD+ASHH82BebjBlCO6Mq+uRdGEtd3CrdXFtYWnN+AV++SmlpVcJdaKTbypD92o7MlHFTxV6PGxwdszR7PCbZ6qWZYDV9JboLDpNFTdMMMny4fxwbr2XqEI4N+N41mglk1bGe0auY8qzXc0WcQFLgq4PtP99mmvhuCqK3epw7JjMUI2I+rbKRtjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(366004)(376002)(136003)(346002)(4326008)(5660300002)(31686004)(107886003)(26005)(6916009)(2906002)(86362001)(16526019)(38100700002)(186003)(956004)(8676002)(6486002)(38350700002)(83380400001)(16576012)(36756003)(66946007)(316002)(2616005)(52116002)(31696002)(66476007)(66556008)(8936002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVma3lDd0ZTTlNVR0hpZitmc2hqTHMzNm92bExOYTZrZlQ5RVBBUmJmemha?=
 =?utf-8?B?R2JNVzNsMnEvRUtIUC9DdENwdzB5MEdsYjk1R3lDUEh0cXRnbXRDV3JMclQz?=
 =?utf-8?B?aERaTHRySDZmNEJCVTBIWVlJM3Z5SG01MnczcnEvdU4rSnRkaHI1ZFNmMTFj?=
 =?utf-8?B?QVllS2V3Y3lEK2NPN0kxVnhWeWltUG5vNDBFeXovOFBpL3lVZG0xNktaODFt?=
 =?utf-8?B?YStHVTc3OTZTM1V1Z0JLSjFOUHBEK2tPVHlhR2VkTmRjYmI0MFh1OXBDak9M?=
 =?utf-8?B?bEZsUGZ4UGNLcVFyNWJDZFhtTFhmRXpmR0hBYVIybDZQdFVtdnVxKzJTblN4?=
 =?utf-8?B?dkVlN2ZCMWM5Y09EQlhNN3VucFB2RUlhYk50c1VzbXhBdFMrUVJvUm5TWVpx?=
 =?utf-8?B?Uzl2WnI5V2RUT3YyMytNaGI5TTNLbEdjLzhnRFcxZjhkUlluVDJJN29SK1V6?=
 =?utf-8?B?V3MyWG5IV1N3bTEvNk5QeFhQVkIzL1NGaFpjYXVjK1ZFZ282MnpSVWswaFRQ?=
 =?utf-8?B?Nmt2LzBUamtBWUgydzM1T1prVG13MTNDY3dGL0d0b3ExTVRHNHQrc3dMdWhC?=
 =?utf-8?B?c2JlMVNqcnM4MlBCZUQ1cDR5VmlGenZ0c3p0NXFndi8xbDhnRUNVLytWMjdp?=
 =?utf-8?B?T0NpWUVWZlRqV3BPVXhzUStxaHJveGJwYjJKZ3FOZVgzM2R5b0hlR0dvTDhr?=
 =?utf-8?B?dTRRMDJKQTd6b1FqNDFMc2FhQXViaUtGSVN3bW5qSWdLd2dKK255TVZPd2w5?=
 =?utf-8?B?OEE2Z0tXNFladUs1by8zclcxeDBRdjJWL1JDSnNzQ2F6VERReFdjWmd1dVVF?=
 =?utf-8?B?RFpUZlBIYWFFYmhsekhjVHJHSUh0aVd6MDFvR0dQZlBoNlpUMkloaU1JSk1S?=
 =?utf-8?B?OWgxV3JORGxNSFpOUnJqdDlQSFZZdnhydVhTSnN6VDBnT2VJT3p3YnNSOE5o?=
 =?utf-8?B?alZsYlYzWU5naEh5SnNOYmdNSU1zQkZ5U0FPbDVlQTRzQ0xNUzhqNHN2WVVk?=
 =?utf-8?B?WGZabERZejZpNTdsZzAxMktabTVqRWFMS3BDNEtzaVg0RG53eGN0cEdxN2FB?=
 =?utf-8?B?dEVZSU5Kakd3STBsSUJIVzExTVFPdER1TjUxcUwxR0Z0OWtRVFArUnZQdkRR?=
 =?utf-8?B?bnZLaUtIMzFrQjNnak9zblMwVFQwN3M1SGJxelk0QmJTRkdTRER1TTlyRWl5?=
 =?utf-8?B?UGZ2Y3I2T3BvekJnOWNuZG5SRnBQUHNFS29zcHY0azQ0Vm51cUtkcHZlVHZC?=
 =?utf-8?B?SWNOSE9qaHcrQVlFYUZ0MlBCclhtSVdtV3FGV1BrN09vS1Ewc0V2YlRYcW4z?=
 =?utf-8?B?Q2g2aE5DaXB5bkJ3Q1JwQjVKR21KaWJ1WW4zS0djNUhueEkwSlNjWmxIeHpS?=
 =?utf-8?B?amVaYkFPK1pjajdJMkhMYURSMFlHMXlZbkZ4ZTA1cHMySVpnM0tnZ01sZndS?=
 =?utf-8?B?V3pzRWc5NEQyMHU4amxxeDlRd3IyTnFnV3poMC9qc3dlUTN6Uys1YVc1NHlx?=
 =?utf-8?B?QVZtZk5CRUtrRDJaVDYxMWNiakhDY0tLNmxxRDNGU3VtR2IwSEJXMnJFK1N6?=
 =?utf-8?B?K1BTUjBjMTMxMHYranJSZTBhNyt2Nnl3dFRNelNkemk3TGE2NEw0TUFBbGxX?=
 =?utf-8?B?VHkycDFyTnpXVzZsUW1xMXlFZmtESk9Ub2ZvZEdaRGtjRlFkZjUyam9EYVBs?=
 =?utf-8?B?dk9BdWlTRHZENEhQbDMwRUIwRkEwUDAwcENKUGxMM0M2c2xGYStQejk5TUw3?=
 =?utf-8?Q?k0zX2Yjk0WVs+mlbVT8v47qcip1YNlLj1VQTq+6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ed37dd-a79b-47a5-1217-08d93c763fff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 09:54:42.8557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2RipYzO318nO9VmjgghTVuvI4soy+KEPIwq56q44KB9OUhgNzjyZO+POzcennbMI2OJGnlGg2SQr5BAyDWRYNN4pm/TQ9zLYyo3Juag+w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.2.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

17.06.2021 22:51, Vladimir Sementsov-Ogievskiy wrote:
> Recently we added support of zstd to qcow2 format, as zstd seems to be
> better than zlib in general, and which is important (as qcow2
> compression used mostly for backups) compressed writes are faster with
> zstd.
> 
> Let's add a build option to use zstd by default.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! We want to use zstd as a default compression type for newly
> created qcow2 images in upcoming Virtuozzo 8.
> 
> I am not sure, how much the community interested in such option,
> probably I should just keep a downstream-only patch changing the
> default.
> 
> But if you like it, I'd be happy to only set new config option in our
> qemu build instead of maintaining extra downstream-only patch :)
> 
> So, it's an RFC. I also can split the patch so that refactoring of
> qcow2_co_create() go in a separate preparation patch.
> 
> Another RFC question, shouldn't we move to zstd by default in upstream
> too?
> 


First: the biggest difficulty with zstd as default is updating all iotests to work in such conditions. I'm working on this now and hope to post series soon, which just improves iotests to support IMGOPTS='compression_type=zstd'. That's a first step which is good anyway and don't change any default.

Next: I have a doubt now. Maybe, better way of having alternative default in downstream project is introcuducing a kind of configuration file for Qemu? Qemu will parse it if exist, and we can ship such a file in rpm package. Something like /etc/qemu.conf. Any thoughts? Did something like this ever considered?

Benefit of configuration file vs build options is obvious: you can change a default without recompiling.


-- 
Best regards,
Vladimir

