Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79A38F9B2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 06:52:29 +0200 (CEST)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llP3M-0006Tk-Bz
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 00:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llOyW-0004XM-VN; Tue, 25 May 2021 00:47:29 -0400
Received: from mail-eopbgr130091.outbound.protection.outlook.com
 ([40.107.13.91]:3637 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llOyU-00042j-4i; Tue, 25 May 2021 00:47:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDJa+AYQ3ObveZ+WiUmBxYny7FpHBenXZqZIjdQGN2IXQVPtFsrtV5YK0N8Aksc5onS3N2NCjD4j2mP0PKYaFedCzU3PBmXr1PUUke/iQCpZDPqJ6Unu2n20ifur8LX+vxQDzghcpoJXsUH2aMPcQm4hbfeHWW1FEqmpABfVOd87BZLP587Yo6ICrpyopJWzrVMkhvdloze07J4KgYvi0AX60QhbAEcyhJUEvVz20XmVcer+ruAqMX7nKqu8McY2KJ7AHk/oG6+EWNIGU4IheGJl7uG+35SM4Tc6J8hbQbjYxM1RstLuD0ilxxFeUom4ZoEgUHPo1tk9b2cDHoALhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBNl4cs90x7n4MiT8rOAKTOJSKAZnvJgWmzgFNbKxPk=;
 b=KRTe1nB8ZUctupBq79zmsSrd8r0Un//QHH8Bn27wYpT7DryGfjrNjRTJS5tG5cLrwxYvqNiDWh/nVLyMS0aJRbUeUHIiV0teqO9Y/TaQTk9KKgsphi1Fr+RbJNVVotf3h7CfQLyj8/1H8YYkF7EiSouBVkgjk4/i5RJsPLrGl/m9F5p3KGc4cuyCBOtlwllwLc266M8pBKw33iaA6fmTpe92eOabOcQXseeBkswqymEHET+fHFz6otmgW4/UyPpi4qCWWuIVtHxzLUINTC7DGp7vnrWkl+4OJncEPlwXd0Qi6Yfz1S7iVN5Qo1K9GTyd9KGQy2QxciLDVckY1/9DAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBNl4cs90x7n4MiT8rOAKTOJSKAZnvJgWmzgFNbKxPk=;
 b=OUIdd8Hhsj4jPArJl3bbglEYgAtEbdZ/Q27ofTQDDUJ6T2rRX0Ka5xn8G2/JMGga+GH6rUF7CtQbdpLGue6yA4MhQqNtV0icBZPF7QosOSCI8eBMD4QSrYteG57iiFgvtoe+gXnn4vau2IDtpdwyhNEmJ4+cvPePv4akka7DR+E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.31; Tue, 25 May
 2021 04:47:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 04:47:21 +0000
Subject: Re: [PATCH v3 01/33] block/nbd: fix channel object leak
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-2-vsementsov@virtuozzo.com>
 <20210524213101.72hdv7mlvklfk4gm@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4a0c8155-5c4c-cb62-3fcf-fb3a7b91d8e4@virtuozzo.com>
Date: Tue, 25 May 2021 07:47:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210524213101.72hdv7mlvklfk4gm@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 04:47:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b380b829-9e2d-4145-b3d2-08d91f382e7a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5447DA76984701BB1953E60AC1259@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cshyvCyzq/nlmEtt/U0qh4Gla4pEqqroMpS8k3fhvqr7rtZyB9jd+tYJH6E+FS0VZRemSBGDvX86Pczhdmx4ZHflqYo3oQ5e2dt527s3vHmypf6Xqx+5/mWQVPB6syID2izFk94Bvyj4OlRiLEhBU1XjpSUCaIwYKXDFAEnFMwaNLQ+kQkP1zo+45ffQUZ0XA9XoLNv8p6b1TBAbYwD7uw9xZW51hlC8qKkEV7SrS21lwl1lOzgnyNzkzXe8hMqEnp+ez99H9j0Z8UihALdDHewirbjaJyOoeBEM0j/1Uz3y3vUgRLGpzjPgcsvLA/5MaCxuSynQwWx+oapcWjtBCVEawXBF2QNt5ly8wzFR6G6QhxA1+q/s0D3faQ9skzjcdoR90gI/Qmq2MkkpF+bzpCbgFvFzKyWirFjyeGPORag50NUV5lKVhi+3ysk9Da5vLZxhUjYtN9d/7ce6MfTOc/FmVOxy1LWxy1I7HghB/4PRcMJDTpjQ7QDF07JgU6i74vIisZ2DPmP9apGwI/R2phuJ7UH/7u0GNcYBdpIgKd6zcYUmI6uQvfe+cS7guGRbhFcUTDjOzS0JvtNNgB1qNK65VU2qp2fOUGHO5GFHDMdgpuCGdUxstNAz03i+5LOMBbixlmR7hJJ8jic4Cf+eFnrQa/0fOfNQvc4YEhfaDiAa/NnpipI7onHW+/efv17Jd8tHS1yrsIIiM459BuHEqbYTxiq6Tl68qoJl3AYcERI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(396003)(136003)(346002)(31696002)(107886003)(8676002)(316002)(8936002)(6916009)(52116002)(38350700002)(478600001)(4326008)(83380400001)(6486002)(38100700002)(86362001)(66556008)(66946007)(66476007)(26005)(16576012)(4744005)(5660300002)(956004)(36756003)(186003)(16526019)(2616005)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWdHbUxiTGtPQ20xV241Um1hQzg2bDBIVVB1UEZTZVBHU2lKU2ZGZDZINDNG?=
 =?utf-8?B?dW9JOWRzNFMvbzd0d043aGtvMkxiS3FUL05aWWRhM1lZU1krZXpaenpTdTQw?=
 =?utf-8?B?VXFGNmxGQW5rcXU4bnRGOEpxS0ZhOGg5YjczSTQ1ZXU5LzFDVyt6UHAzTEJ6?=
 =?utf-8?B?SWt2SVVDaFduNlZiak9WZzhua25QeCtOdm50RFNpbVc0ZjZNajVheDNadVJu?=
 =?utf-8?B?NTh0dW1lZFJnbWYvejZ5YyswTG9kcEVIQXY1RzVlTzVYbkJIUEkzdjQ1REVD?=
 =?utf-8?B?cWhwVlpYdUdPZDVkZ0g2WFU1b0RZS0lweCswMlBIcWN5QUFiYXE5b0FaSTFK?=
 =?utf-8?B?Q1oyOEVGNmJGL1pkL3RSMFFYRGRZYlJLTVVtZHc3KzdQbjFMMzc0dzJ2ak9S?=
 =?utf-8?B?alorbmNzTHZWU0UxOU1RY05xaUt3eVBPMHFvL0ZJUUFlbVJwSmdYak1uMkdu?=
 =?utf-8?B?Y3lBRGhoeHJGUTJLR2ZrVitKM0h4OTBQcE12YTZrUnRQMkdMZEt0RXBsTUFk?=
 =?utf-8?B?UEhQY0k2T0VSM296OHlDdFNOZnVTeWl6NCtMcDNHT0FvRDB2K1JoUHVsYUhn?=
 =?utf-8?B?Q0Vib3ZDS0Q0Zm9ZRFIydGhram9mU2paZHFjZmRVajdqRHJucDNJTUREMFdo?=
 =?utf-8?B?M1F1bHlKbjhuc2lrQUliTldSYkRCdVFDSEJxMERiaEpCeTEyalhmUGdqRlBz?=
 =?utf-8?B?ZUoyMlVML0I2cDZDNXFBZnVrTTZTSjlITi9JZ3BVNGNOR0FKcGsyWElrS3JY?=
 =?utf-8?B?aE1USHJkSzc1RmxQYlFGK2Y0aEowNmpSN1l1ZXA5TU9EZnlxZUpSWFdibVZn?=
 =?utf-8?B?TGlPQ1FqcElZcE0zaUUvZjRCelZ1ZkEySE5lcVc3RUo2TC9tUXJhY21lWjI2?=
 =?utf-8?B?KzZtdXRrTXdId0NieXd1clFEekRndTUwWktYbFpZSWFEQzF6VXl3OGZtaWxG?=
 =?utf-8?B?aHowL2lnbU9WUEY2cnNqdXh3VXFwclVqQ1dGMWd1cVI1Z2lrVGVteWQwQmEz?=
 =?utf-8?B?WjhrdHU3Z3lwL0NHT2R6VnU2QmQ2ZGxTTGhBOVYwdzNGYnFTR2NPTFJqM2di?=
 =?utf-8?B?eFk0OUpzcGpqS29uUG5UTnhFbithdm5GazVoQ3RJQkJhQjRrOTFOMHlvVWty?=
 =?utf-8?B?OU85NmpESDQ2dThHaThQekNhTWdRcFd4TU8reEZhUktGSHNKYVcrY1R5bHZh?=
 =?utf-8?B?cFBmSThjbENXb1lKQUFRK1BPRUtUZFpCdk1BWUlnMUdTMFRveVlPWDFUemlD?=
 =?utf-8?B?d1A0OURRZE9QTWpsNVpHNmRTU0F4aDlOc3pCdmJJQUF6cGVDT00vY3JXUlVD?=
 =?utf-8?B?STBvVFhPU3JjK0F2QVRaRkZaeEkvcGNhd1JMY3cxWVhWb0xBWGJhZ3A4Q2NN?=
 =?utf-8?B?a0tIY1pYMG1RQTlwTk5OQ3lsTzRIVi8vVDVsMTFUZDZSYTVhMW54a1d1M2hv?=
 =?utf-8?B?cXROcm1wNEl3eGZJTm9Dd2FlOXdGYWRweHJaVEkrak0rYW5ocVpFVGozTm8v?=
 =?utf-8?B?S1hoQVY5SFZFRUFlWkZwOWllT2d2bEorUk1SY3gzaEdhVEJCQ1JtZzlpVGdw?=
 =?utf-8?B?WFBkUkNyQnBvM1NoVlZ4YWJKb3hpdjRLZmNGYkRxK21Eb3dCL0lrQkt5OUdO?=
 =?utf-8?B?N0ZvTTBIWm9YUDVvb0kyMWVJNTUxWDQ1c0p0cDdIV2dTQ0xnTFA4cDF1ZEVt?=
 =?utf-8?B?VzBNYzVHZStPd2psazJwaTZoY0xuK1lvVm52TW1rRSsveENvOXJFMUlhaW1S?=
 =?utf-8?Q?cQDFL1A4eXCDTmZj+IsNTX5R42aK28yNn1CHi3e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b380b829-9e2d-4145-b3d2-08d91f382e7a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 04:47:21.1314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbx8IgJDARg8bi2AbfODPju4rxYvA4EC1JK0KrN/zmxwOMiuCfQgAnDjx+leo1Xqtk2z0YmzSZmqZfaHRl0IsLDZfrz7gfwvadCbV/EJjQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.13.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

25.05.2021 00:31, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:08:39AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> From: Roman Kagan <rvkagan@yandex-team.ru>
>>
>> nbd_free_connect_thread leaks the channel object if it hasn't been
>> stolen.
>>
>> Unref it and fix the leak.
>>
>> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
>> ---
>>   block/nbd.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Does nbd_yank() have a similar problem?

No, I think not. nbd_yank() just shutdown the socket to cancel in-flight requests. I doesn't release the state.

> 
> At any rate, this makes sense to me.
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

