Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD393AD9C4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 13:14:46 +0200 (CEST)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYw1-00088H-4h
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 07:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYuz-0006z2-Um; Sat, 19 Jun 2021 07:13:42 -0400
Received: from mail-eopbgr50090.outbound.protection.outlook.com
 ([40.107.5.90]:13953 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYux-0002Jn-0a; Sat, 19 Jun 2021 07:13:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB3OquXJ4XBZ5fwB9d5IfIX99FpedUq5iP5sWyZW+iotk5hn6TZ+mlo9DnwAF3f/jK1g6Qx02ACodGqSYMm3jRaccu9vGh4QG5orzYSZr6miLY6oqVV0sfGNIMIQcYZBwbKi13BsC7bQXNz8mY+yn9La6l+t+fMYbBuuhAEF+BauNhu02edD936d5lmkMOA9Fq0NImolDx4XhOT7b69vHhDim71D9cPI8nPVPJCfMNNRw0F6AQooKyqiWXTudLpMHZyAyZVb9mDgdtaU4KkKcGHWmIsZ+z5m5Ek2brdkN2zpeKHaGV4kGhKCB9xY31SxS+T6mnfK12NGhWM546CXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aU2KxCBoSsDlrlSNAjav0VwoiZO0CuZUbwf8ePXuwk=;
 b=odixjVGPbkhUyiSm1D4rWCNQiLHYg6AZEOcFyjLWcCBcqzgt+nCoGAY8I/On8f+c0eInua7EgY5k0MAOEMX7ftKOdQVDuT4SXKS4Va9tKJzFve/mh2dFSyLCP3tGDuUFDuOtnOIRfSEL9nOOFPu9EtwAN94zibxt4RVKmUPRGXGspbYaJ+4BjFdMs04k879f3izBOkVIGUf3hEmKao0TLa6rch6Pw2CiKDkaijesOZY4kBcfYKtWwVbPOHfAn7tP59ZDagMFLumlTdT97n2AUwsKuPtTUqdTtm6X7F17aCYCEQoDQM3rwrkgJ5OTEsOPysklQGlfbxQof3kLoSM2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aU2KxCBoSsDlrlSNAjav0VwoiZO0CuZUbwf8ePXuwk=;
 b=SdWrmSaSDevRmjQrRnpMVgxtuPO3CHPiHWX7MrrcNb9XzqipQCckkikeX6eq9fV7oJI9xFoNIt+SDJ1Hq1atJCY4wO/FddIWr/CpfQoDCs5ZZZaNw1B7YDcwBGQI6/svMORynF3oaRCEd9oqhOCfzlu8Df8tQ1SPBW88RnQ65so=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 11:13:36 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::5d2:a831:a04c:66fb]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::5d2:a831:a04c:66fb%4]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 11:13:36 +0000
Subject: Re: [PATCH 6/6] block/iscsi: Do not force-cap *pnum
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-7-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <17944634-e44d-7230-0792-275a62cac492@virtuozzo.com>
Date: Sat, 19 Jun 2021 14:13:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617155247.442150-7-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0358.eurprd05.prod.outlook.com
 (2603:10a6:7:94::17) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0358.eurprd05.prod.outlook.com (2603:10a6:7:94::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 11:13:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91e3e22e-ea6c-4615-6d9f-08d93313487d
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1854:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1854DCAD59C7BCD8186E1DA1C10C9@VI1PR0801MB1854.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SELM24iBPRaktw38UNn5ZR2SuGnDvtzmar1rDAVn1/yWrvKLNcQPsMrHUcZJJE/TNlx/kHCQ+0n8OGVKxI5rUxsWpsjyUEsDPZYT8tdIFMZSuHwTvgji5dTd69o1WZno4kV94OHult3Q9QXsyya6M6GkW2vyFew+ST40pCPM/RG+JhiCrRn7ew9ws3F9QMU9hKvdfwUS82QEXTMVj9MQcMS4Wl7LiTopYAdWWMOmFeLiTQXTEP6pXGvsB/y+iikNG7EJf9iwsXNAFnbvV00rSvoxwvJKTCF0mg4bsESnH9qihXQRXAVQ69QbBEgOMZy+R71a4cCvux+tJ3sRUXzDSSg2es5Xu/bo9h3Cv586PxUpiXzqc9U03m4/uzHZCSVv77JCT4M8HsphW6777ESIpE84mQD7ol9oELvAcWj6ENHMSgIlxURAmksnIffWzeSP7hYbf6qa1CB7DabrUPqYS3l7zBcTdjR8Ls46NPC53LbBnJwM20mC9MO9a7+FL1busIOX9lQI5GrtNk/Kono6nleCgxJPXasOt80/u4z6sVc6x1KRBzFhBIt7adF8abjiTYjFYt3OGuYwVpsvrqb6inTr/nT7Oa8KOA6aHODdKJzVAhfFpNQ2YZMSDnAJfgm9m7Bxn3abTLhpfGbGzG570HH27ifbA5V1QgkctBoP6LLCHKoG54XlaPbUYCNrdHJKX5Yg9arTCevwVkIkQ4q2zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(316002)(16576012)(4744005)(83380400001)(16526019)(52116002)(26005)(186003)(956004)(8936002)(8676002)(2616005)(478600001)(6486002)(66946007)(66476007)(38350700002)(38100700002)(2906002)(66556008)(5660300002)(4326008)(36756003)(31686004)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEk1TFkvMzNRZ2JrTFNBWm9WUEhNVUVHVjR3MnZxWjZiZXRIMkZRNGoxZzlJ?=
 =?utf-8?B?cHNVZTNNQlF0czhVdlcvSUErMHlsSzk1YXA5WkZQM2oreGttcUZQeUVLSUlK?=
 =?utf-8?B?eVBDWDJ2T3I1TEVZM21UT0ZqTkdyZUFNdEc3eXBoZmNsTWhQTFd6dmtTRFRl?=
 =?utf-8?B?K2lIUCtINEdKUGNqTDBFUzlRSUYxOGRTUFdZb29CekJjQWRlZm9kSElnVG9P?=
 =?utf-8?B?MklIT2NOSFhIYnlST0h3NVFabmJKTVA5RjNWL2h1OXlXNFBEYzc3aDlCa1hx?=
 =?utf-8?B?UDdlUTRqWld4dWxZOCs1Z2M1ZFZ5UFNQaHpQREZ2QzNiNmZPblQyOUhFUllN?=
 =?utf-8?B?ZjN6YnY0NmFvcm5GWlVHTHRDb3FKa2NIL2YxZWtCYlZIK2hHVUFrelVnSWha?=
 =?utf-8?B?TjlNOWVrYUR4bXAvTG8vS212N1duRUpqUDdvcW10czVhVmZRcUJWMFhzanBn?=
 =?utf-8?B?RlIrcWRjY1VRM1VwYVYzS25sYXNKZWJrbTRiMDRiaitPQWh1SlNrK2Jzelg4?=
 =?utf-8?B?Y0xuT29hdXdIL3NvT0EwMTkrUGRrR1orTDJxT3ppWGZuUmVxUUdyVW14bm0r?=
 =?utf-8?B?N2N6bmRwT0plNk44aE5KOVZmSnB4aHBuSCtuNTlBL0VZcTNWUnF0c3NzR0Nz?=
 =?utf-8?B?UWg2NCtzMjVIUVR5QVc1endFT1BqRkIzeks3T2xDVUNaUzg0OGpYVUMySjdt?=
 =?utf-8?B?M2wwY2k2bkwxNUcvRFBTcEhXZkJLcG5INkx0Qi9qU1E3RFpmQU5zd09Lejdl?=
 =?utf-8?B?MkwxaGRYcDFuYzVpTHZOdkUwYm15amtLUEVmbmhEbVh6YWsrT29Fc3pqT3Rx?=
 =?utf-8?B?ZFlsTGxDN21SdFhOZ0kvS3hMVExHVFlWTDdLdkYrZHRnaHh6alRHVG9Yd1Vy?=
 =?utf-8?B?cXZmNG1yNUJzcDhrUllneVNmZjd4R2ZKOE4xZ05rQ25sZGFJT01LbUJFVWFG?=
 =?utf-8?B?OTk1VXByT0JaZk5EdmxrekVpN1NyWWNsSUR4ZHQvZ1FqdFJvQkNwenMySG9M?=
 =?utf-8?B?RVdJK040d1ArSE1FV3JFNVdlZGU0RVppTHdBVUJqK0Y2cUFETE5ibGNReHRm?=
 =?utf-8?B?b05xSUVwMkFlRWQrYmFhRkxSOEZQdXRQcmRoZm5OQTFVSUdpVGN4YmdHbnNi?=
 =?utf-8?B?MGNlSkZpVkphVzhNYUcvNkF5K0xMcjNBcHFGZ082NkpENlhxTU1TbXpVeUtx?=
 =?utf-8?B?T010Z0ttakd4NHlyMWUwd21RUktaam9rOTNoemM2aHBQa0E5ZngrZ2RVdVUw?=
 =?utf-8?B?NUpoTnVYeGpjSS96SFVUMnBLL2xha29KYkVjSXQwV05IUTRlLzlGR1Z3QlY5?=
 =?utf-8?B?M2E0aFhIL29jVkNVYWwxdjl6SmF2ZFU0WDMwNVFEeHlScTdPYVBPUEtzREly?=
 =?utf-8?B?N0RIRDhadFV6d1BEYUcrZ1h4eldwbDgvRHpGY1RLSFVxdC9yaXBhemhrdk02?=
 =?utf-8?B?czR6djhYbFRiYzE1YVV5T3RyKy9EWTFGZDVqZEFJd2RoZmh3aHhXV0p0MWtZ?=
 =?utf-8?B?SlBlMHBPK2xMTEJ5V3ZoamI5cFIvNTBkMUx4ckd5WFZwa3FTK2M0VnpsY3pR?=
 =?utf-8?B?MForSVpzeGtSQUVSUGs0M3lVKzlQd1JjSTRldFgvVTR3a0xob0F1MlllWUUy?=
 =?utf-8?B?RThYanJNYy9kbHU0VTN2K2t5V0x4TjA2NXFROCt2VjlRZWZzMjhUYlNVcjlZ?=
 =?utf-8?B?Wk1qWUFseWlrRHFIVmlTSi8rNlN0ejVXd3pJOXFNUUd5K0FtUURVOTNsWE5W?=
 =?utf-8?Q?ImfiEUMMjaQsKurenXcdDUs4qiv0s8p0DtPTAk7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e3e22e-ea6c-4615-6d9f-08d93313487d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 11:13:36.4803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WIWSlVLBv2lFWq6l5ovgCypbhIXtZ+puKBtj6ry5cGX/dQcaoie8+QOsYIKMfWfFQZphm3sg1WO+JoWDnsDQvRdY2UC8IGCshac3gjQugQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
Received-SPF: pass client-ip=40.107.5.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.06.2021 18:52, Max Reitz wrote:
> bdrv_co_block_status() does it for us, we do not need to do it here.
> 
> The advantage of not capping *pnum is that bdrv_co_block_status() can
> cache larger data regions than requested by its caller.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

