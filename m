Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD853C6DB5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:48:11 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3F1O-00042b-So
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3Ezd-0002jg-5V; Tue, 13 Jul 2021 05:46:21 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:34468 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3Ezb-0003N8-Gj; Tue, 13 Jul 2021 05:46:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsZXnn0SF9MI9mWoz/8upEAOYyu961cdiY6+gzFECtPUbPcpxrObfJzM+rAjS9C2Sfab5vl9lxKyl3kFSSLg9r6dUTuQOODM0xYtnUGTFaI1WF7bEPvcPrk7momIskNfsPMHbEvYLdVhhlPoXLTGwNUNpkLvs4sGUtV/hDMEqFhFbVvIfJiJIVYXs+FVoYNdgojBbdmykDw8/+AKLp39vGMEOqh6LTN8i9E9ZcI2g/MUZ6jVRrTidujxdxQu4KwkR9AZhqqlKFnT9I/6tRt4pl83hKKnWWFvo4sLMKWAy219XkYWAjhZzDlhlEmbQ/t51HOmrXpwr8bkYGz62YVdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K95wtLgsPeysOJtH9kHGj/SSZiSCH+rXEpHYrSshMmA=;
 b=U45sHfwHYBKPdiXpq4GvJ8I8NXSsIst0B4WAYIeUUYooXIaSYx4rj6vyKPipMRdexPZX4Se/4A4lgiNeC9VzuiuRsp3hXbwhXoB+qTwB7k7k9sYoJgYzq8HiQtYMFzuhS50Vw45eEMOwiUA5gToYlZwQCYw5IZC53rMQbB8cN7dI3ccUKreArT1UkKPAuY9ZPAeP1fiPJeX6IbRUtnYvwYsxgC8BBuSBZMJfdma93gveYQDQkCfhoC22WOIe6sNKrzMnHmJrRhBwXzTfnSDalZvXg+nvsOEIAs34u21JHidv9bWgAgKX2lkDdDO1qbn7LyjcXvwoDKvxq4cFDVfa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K95wtLgsPeysOJtH9kHGj/SSZiSCH+rXEpHYrSshMmA=;
 b=bTLmWoJn+OrOmCxUpetKqStpChNh6wLWrsVGmkUH9VA86ZJbvfdf8VoOzRB3LEBNjUND8/LAa8iW67SLw8WlMx+LJw7HRKSjKcezXkjtLBqeXjqOQI6JwPih3EkMoV0OYs2RTF0OmBjsZJkTNSaqCsLFQauLZxPgADx5hQj73rs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 09:46:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:46:17 +0000
Subject: Re: [PATCH 08/10] iotests/297: split linters.py off from 297
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-9-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d486f584-2f68-b6b2-ede5-4d454366afec@virtuozzo.com>
Date: Tue, 13 Jul 2021 12:46:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-9-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0311.eurprd05.prod.outlook.com
 (2603:10a6:7:93::42) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1PR05CA0311.eurprd05.prod.outlook.com (2603:10a6:7:93::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 09:46:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe627b7-a72b-4342-f27a-08d945e30f73
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6946E65078F9E1255515B12FC1149@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5BViVBDA+1aVHlIglvUinaJIola0SLykuXJwaIU7IlKEQuP5LIlIS5bcCvpmwMl9QHIPQoq9ZJ00Y9b3rIsb6EJid6BXu/BxF4Qwlu8eJa955DhL29Kl6SH7Fh7m+GVKs8OVOoJd4tmbrQh0ESn/FHBkz5Q/i4nmA4De7wfJzYhgn65TvXAPDqwKUjX5MUqnZV5/N0rUWnTepaH0y2v6g8y84+jJSUozfKo+A3uu8NQ0YAxSgo57rSef4f/OhidLf19O2lsVmF8gdyk6wnV5Y3I86eyV6GyAhZpO5Y3a1ppt6L718ILVFiMhF8y8SOrUzhLwJf3v9hVWItinPGzKg0C7K/P4tkG5rKTbVEZe8gz53H1PsV1q7p6AwtafJx/KK15zAKiP4UbTXllaC7TSz8Eyr+BgbHxlj/iMcYn24bbdfKdqhoDOXBcdrftCcNwxlmxXOPdtVLsVstFiZs1KpY8UjZ+uk7TbrgG9z+GPahTKWu5mceCpOhV5JS5+UAh/rCLvqbjHaDNdI+fNS5VfvCQw3D4guvMY2tprNYao1bAf+S+KDa8Pm13oxbhwm4X8BdlgwCeHV7CCmUXwHSreqy+YNji5BmSJZ/sTSTVZl1BW2GponQfTDvd7l2f9qd0pDj61HIl+9DThCCF/iY5lfoLU0nFd8RHJInUBSVcVZ8c2bZW8SMXivexOFMPGAR4BeNz2ElEKP91wU77aWPBZhnHhQXu46MPTvJ2PznmmJSTXZeq3PtF/+17ZMJAv2dxYDjWyb6VayS/xhj+50kLlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(346002)(136003)(376002)(36756003)(186003)(316002)(26005)(31696002)(4326008)(86362001)(6486002)(16576012)(66946007)(54906003)(66476007)(66556008)(6666004)(4744005)(8676002)(5660300002)(31686004)(2906002)(52116002)(2616005)(38350700002)(38100700002)(8936002)(956004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVUNXNnTlVIOW5CRjRJNzk5N2MyV29vR01IUzF4aDVHSzJMeVJlWTVOajN5?=
 =?utf-8?B?Uktwajl1YUxzQ0xrcjJ4OEwwOTRWTWovdDVlOUNiNGpBOXpPME4xTEo2cjJ5?=
 =?utf-8?B?NStLOVBqc3pvQVBUanRRenZFd3JWR1NIOVc2SlVGeHJQZWJ3WXlyZ3lQdEFL?=
 =?utf-8?B?N1ZyNjFEdVdjdElQSHN5UWNxNmo0eDNBWmJOTkxXVGJiQ29BS3haUWNNMEg2?=
 =?utf-8?B?QVlheU9kS3EzWTBzNGFyMlZLZVl6MnAvWGVOVTY1Zi9VZk1XU2xrSmllM2Nk?=
 =?utf-8?B?dlBoU1djZmdJSXdLWWhXSFJwQnN2UWY1eDJ5SXJXOXY0M2NpMWtYY3hNZ0g2?=
 =?utf-8?B?SGdvZS8ySW5zRktJWVFKUFlNM1RYSWp1clBoNDhCTlRRSmtDVGN1TDdYSXp5?=
 =?utf-8?B?MVRxVEdUb1JUK2hxWTNnRm5YUE94c2kzTmtUV0twVjd0R3hyb1grK2x4Rldp?=
 =?utf-8?B?aHpJWmdUWGRXQTIvUWpzcmVBZkdxQUs3YTlJZzFmYmx3QWhNWVVaYzM4K2Zp?=
 =?utf-8?B?WFZMWWU3ZXJuemh4aHJoNW4ySzZWRjVlM0s1bjlTY0xpUWFOVHN6Z1Myc3o5?=
 =?utf-8?B?ZHRtLzdaQVhBdlVYdUoyaFFHMmcwdGpscXdqcjRibDRUR2I2VzFiUk1LbE9R?=
 =?utf-8?B?UzY1aG5GME1XTTA4TmFPK052ckZza1JtUEpmUTZkYlZOSlpLUzFOa25YQ0wy?=
 =?utf-8?B?aDZ2K0Y0WTVSVXJhc2l2U3BsNWpVODdGTmJUaFRHSzlzNGt0KzUwdUNVdlFP?=
 =?utf-8?B?N092ekppNWQvbWtxbnA4VXlCSVNmbGxEcS8zUWJEUGdUMDJ2KzVNMWZ6NXNt?=
 =?utf-8?B?T3VqcmxyUzlvSit6ZGlTOEFzM25RVWxTWGVRSFRYQ0FKYmI1eE9oQUZHNGg4?=
 =?utf-8?B?c0Y0bVZxVXBaNlJFQ25CNzhnU2lqWnZrS2EvbHFYRXFpdVVYQlB6WFhjL09X?=
 =?utf-8?B?SFFVbmx3VmVsd3ZaQXpMNlBqR3JJMDJKci9wUkxrSHF6dU1SQ05URFVWMXZV?=
 =?utf-8?B?dmUzZm1FTnVrQy8xTmZPb1NNSUhoNERhVS9JN0dlUjdTaFRKb3dXWWhXT2lN?=
 =?utf-8?B?L04vWEI0RVFUQzd0MmE5M0dFR0JQY092UC82ZGNoemtwY1AwYlduQ3VvRjFy?=
 =?utf-8?B?eCtEU0NnUmZnb1JIVEZyd2JVLzd0WmlIZG9LZ2F4NFJPb2ZLSkp3dkg2VGtz?=
 =?utf-8?B?MkNNdUd4UWZ4Y3diRVFtMG9wUDJyOVBGRkJBam1Jai9YbkhHUFBTQ01NeXVj?=
 =?utf-8?B?RTc0emlyWElQNVBKT1A2Rmg5UE5xcjBNbXpUYVJZV1lZVVJGQXkvOXlhTjhV?=
 =?utf-8?B?QUZqMGNQVmpjVUpSV1RpaXBiV2F5YVBxaWMwVUViWVdvUlU4MGc1eVZWMTNE?=
 =?utf-8?B?MXFWQlg4b0N2MU9IM3JlUytJdTcvQjVQOXY0N0dyY0Jpc21rT2NEWjBQL201?=
 =?utf-8?B?dE9NM0FZZ2tnTGhGNHJJTmtjNEJZWERRcHJ6VDNXWTJjOFRuTEJDS0RzREtX?=
 =?utf-8?B?ZzdQU2p3ZENEZXZ2UlJqRnR5aXV2aTdQcDVFN09pOWtGbFBlc0JobmdqSk1o?=
 =?utf-8?B?aGgzN0o0QVlJR1JaTDdnVTFlUE40dytobEdRa1VwbHB3R2l2R3B6aXhsUzJD?=
 =?utf-8?B?UE1ZOFlPWjkrK2FMV3ZJcXZEL25TendNUmNPdkZPa3VyZ1NYc1lwRWpxR1pD?=
 =?utf-8?B?RDhxMEJsRUxWNmFZUE95UUV6RWFyNHE1UjRoVjg0Q1hSZmFUM0xxKzdTWXZq?=
 =?utf-8?Q?4kno96IW1xgI/l0SA6r3XgBtFhok4QhEZLUyS6M?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe627b7-a72b-4342-f27a-08d945e30f73
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:46:16.9601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N8zZfscLV3/UlJzODe4MrSbnvNLS6Wn5hSQscuUs/m+4hBSEAuqOipw2bGrXC1EQqfHtrPiB0Jj5ppQp38ZTJz1cV+zgMxE9kLuojHpGMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.06.2021 21:20, John Snow wrote:
> Split the linter execution itself out from 297, leaving just environment
> setup in 297. This is done so that non-iotest code can invoke the
> linters without needing to worry about imports of unpackaged iotest
> code.
> 
> Eventually, it should be possible to replace linters.py with mypy.ini
> and pylintrc files that instruct these tools how to run properly in this
> directory, but ... not yet, and not in this series.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

