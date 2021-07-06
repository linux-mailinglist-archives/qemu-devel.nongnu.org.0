Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA63BDA54
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:38:11 +0200 (CEST)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n9G-0005oK-C7
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0mpN-0002gg-7z; Tue, 06 Jul 2021 11:17:37 -0400
Received: from mail-eopbgr00104.outbound.protection.outlook.com
 ([40.107.0.104]:7792 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0mpF-0004z8-75; Tue, 06 Jul 2021 11:17:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILVzVZtoKlXxYlA9JXjMCPu1TrjBQx8A3IN8YvLATqzU9acbUomENMlgii+2sQPo7OrDySC9aX7jjZapT1j7bjTdt7cwUCmtxQR3/MJvRKP18FRg9D8TB+U2SfOfNTusCtZ4FyJWDOJ1sWh0J0AnV2zMxBZCRHNBXn3eS9xkgiD9p3QWauTdFImRMn9D6oDUzinE9e/Avb8bbkFhKzi/i1E4hp2HwxkSkOD3U+PJ+nGlOrFF7W79B/vwvANE63Xpl9FnnOhNac1EPWzG0g+mzafe56ZNUWrcxUhX+nfJX9EZUsLDFdpiUwdWaXXsfsf3qPO0uXqm5x/LTrctIBgeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuMJpkbKGOaGRavvM/0x5mwlyDBkv8Fr6ggqPoKOKs8=;
 b=Px/qV6if69rQGxtuGu61LeXDqMi/Et6CYaGpuXf72zmTczongiq5eYWcYjgfCHJzCCIihnZveCvafTsFZh/P1fT7an39v4h80tbCsQT+7miJ9Mp1/meBseFdxX/J3F+zRprio2pA56unNgggR3gzQ2rxu5WIKqzG9Ioaiy9whlYD8DXp5UHGuUXWHARgEBLBLkPyTMMFnxUYaa3lk4HnQbFIn/xQ240Oh/C4zouMxfkv6srxKxDeIIs7F0vtRNXl1T2YVts6uf4E54cZz8Z37wtbibl+g2z12XOGmOfqzNH1tMfZEkBpj2u3KUkGEHW83JS/ZGLPeAbUQzE+WvRRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuMJpkbKGOaGRavvM/0x5mwlyDBkv8Fr6ggqPoKOKs8=;
 b=JIAyRe8qoIWu1pzIGvs7nUgffdTGAf6x3SjH5M2mY3McQZauXa65YD8tlFrCXn7MmOVR6ygY2WJjDU+OcbhTFAlFnU2nf7TUtxT3IL9PbsuxPafe0JxQ0wddeSYKKUtyu0t7BfFb4+IsER1UvotLbDswC2wZdeRWUMwYLO+IKvY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 15:17:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 15:17:25 +0000
Subject: Re: [PATCH v5 3/6] block: Acquire AioContexts during
 bdrv_reopen_multiple()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-4-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0c1968ea-5a10-25c9-93ed-c0f0765c80f2@virtuozzo.com>
Date: Tue, 6 Jul 2021 18:17:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112340.223334-4-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 15:17:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc71c8b2-e20e-40e9-0c33-08d9409128e0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1908F7E03FD2777A74C5C832C11B9@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g15PJfliveGY7pal3+027/zhU3yQYqEskTkOQIB6YmcSA/XjPPns0qHZpbsa8s+xXOCDaRuSnht4d2321HgS0XoA3rPZVx+r6tEaJ6ykz16vKITD5rLuqfMMIdvkL9Tv5/Vc9c+pJlsgfEL7xIxum+dS7CqyUe02hKAzwG51D/OA6KroG8I+IYakO3mqdjVQ6Goqi6se0h4xTFTiKqpG73xPAjXN7wI3aeipdvIUQ4KA49aWRfsqCRlypCH1lbFUwxjkIVxI+6dfP+GUY1LbszPuE9Ya6hLgEg6em6VSgnXgv5SRuCgnkjdLNPC43osoxmrhOBxfyMI8+TdZqC5d1QHlLF1lYYTzEGTYen1DglICxyYbc02Z3GllJR/xSt3HhAyrVHBUeDa1onp7AvtdijNbHGj9bHJC/qMX6OQm3p9bx8L4ptz/knpw0FLprnsMRyTR/HK3AHC0g6RqIBe6YfOjX+jrH6NfOSTRCj79CCqWqjTvLG3zcpuiKvjopvOMpaJBVjjJ6AwE6klfBExnt3EcuBZYPq7xXQ7QoMDagSZPg5Z/bIC2ySNezK5X4X4dNpB5p22ovWyQjxsyOcwuKhEVaAgr08BVf6Y1JyeSQdVGTzxrSIHV03zbw2OQg6SRgdscmf+sTX4N5b2qZxKpEeiou+3WskTxaLLFZaauKw3tQILv50B7LgB9+zKIqJ4oM+5A1Ar1AhmN2vbQtAOpmUR2b8FiyvXEHZ8J6C40jF2oxsoharbe/tYPGTtciqaZLJsDSgO/fAVeyrPHXu/ZSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(39850400004)(346002)(31686004)(8676002)(4326008)(16576012)(38100700002)(8936002)(38350700002)(66476007)(316002)(956004)(83380400001)(2616005)(66556008)(36756003)(26005)(2906002)(186003)(86362001)(4744005)(52116002)(478600001)(5660300002)(31696002)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RKSkRkNVdGVzVmNmxnVjFtcEFkLzlwLytFWFhYdnRhTHh6dmpBTkxnSXNG?=
 =?utf-8?B?TnBzV3AxM0xrSUozK2VMclBaMkhSZGNJeXB5Zmp1TVNocUJGcm9VUGxkaVBQ?=
 =?utf-8?B?R0VQV2p1VEhHb3VFelcza3FuK3NhamIvdnBVaW81UFBFaVp6alY1N1VaakpB?=
 =?utf-8?B?NE0ySmF0bEFYTDhNQXFFU0N6UlRRaEFUbUQ4VW1nSmtyYVN2azRxMWJ0aXFC?=
 =?utf-8?B?cGRYOTNveTMwQUltV2lTSnFTU1lYMkI2RVFiVDhFWXg4SmlyVUxMcFRrQnZQ?=
 =?utf-8?B?cEtSZHNLWE5NN2szQzF4c01QbWFWQ0ttSnlpbmRoK0YzOTFobS9oVXNpUXNn?=
 =?utf-8?B?UXBMTGVzQkdKZmNVUldKaTFOVG8xcVYybExXSHdlVkN3L3h2dWhHamo1aHo0?=
 =?utf-8?B?UUF2YWJJQmJTNFdtdHp0K2hyN3VlaU9jQzRwbGZ5MGFtQmhBMnZ0ME9KWTE0?=
 =?utf-8?B?UCszNlRsaXRnMFkremZoM25wTTFldFQ3TFdQSGM5NVVuTVJ4TzQ4dGYwaEV2?=
 =?utf-8?B?VzBVNytTcG5YV2lLRVMwcjFSZGNPUng3VWRITmpmZ2VTcGc1WjJJSXNWb1VQ?=
 =?utf-8?B?bmVKaENCMlhPeHJpOE1NK1ZxMUZxbThYTU1URGNXdTRkU3BpTDIrWFNMRGt5?=
 =?utf-8?B?OGJ5RUNDK1UyMjFOOUVmVU14THh4NkM2MEc0OVNDVkN2bFlCM2NFZnpteU5R?=
 =?utf-8?B?Q05sNEJ4ZkMwSUVRQWxhUndWQ3RDSnJaZTBzSTByc1JHOEltSnRYY1AzRzkv?=
 =?utf-8?B?cTRiS0NzRmRhNmxROVpLOE9jcWNjSFNXVWFGUUM5Ykh2NklFeVRWM2ZtWnZH?=
 =?utf-8?B?T1lZdkgyVVlVbGpLVWhoYiszNjZxbnQrYldZU1JOM1dpTUdBc1NtaWxDZlVO?=
 =?utf-8?B?SUJsZUozcCs4L2xHUmhUV1F2VFpnZEIzTWtvS3BhYUJ2WTAzK0JmUlhJc1ZL?=
 =?utf-8?B?TitUdmJldlV0T2ZsTks4WGJrOXYwWWpSVVg5ckg1dnFGeHFhUU5qY0pyQUNB?=
 =?utf-8?B?NE1VRTNHejFqOFNrRXBYbmwwZXBKYW40TVFSdU5RTW5IZXdCTGdqODdIVWZI?=
 =?utf-8?B?YnBwbnB1R2VhMTNZd1hjT0xpSWRpWHRkZmxJaytRNUpzUFY2TWd0L2dqcHRU?=
 =?utf-8?B?RElvWEVmaDIrdG1GVkdQYVRTMXMvZjg1V24yV3RuVjRpV3VEQm5KOHBoWkwz?=
 =?utf-8?B?WHNKdEtBZThiUndrMjZLejM5QjF5WDRRQjM1ZXQ5aCtxK3BnTDFTc1dZWnJG?=
 =?utf-8?B?bjUvclhIUC9CNWtQOGZqSEo4MzBsZCtZMmVoU2lXV2VjZ2pHTXA5U1JwYjB4?=
 =?utf-8?B?YVNzSmVndENKK200cXV4Y1AvYW9LbTY0OGJLeitiS0dEODRiSmNkOXhyUUFJ?=
 =?utf-8?B?ODVjblhkRHBERDdjMWRHeVhOaTlVUGtQWHJtWUpiMjZ5bnl6UG9nQmNjbTVv?=
 =?utf-8?B?dzNmaTByNGZaSG9IeDNRRmxnamh1TjhCVDFDRmViZVAzM3RNb0pIKys4TERH?=
 =?utf-8?B?WXRuVWZEZVNPTEswYjBFbitQeHdWNHYzb2w0QzVxR2d6dGVSVGRLRmJyMWtR?=
 =?utf-8?B?WG81bDFCVTNicWxKUVp6N2JYYTY5cCtqT1BGREVwdVhJZHZueG5NL056WWsx?=
 =?utf-8?B?YjFWQU5oNDBBT1J3OUc4Nk0zUTEwdWNBN3pBa25pclZFbStoUDM1U0oxampj?=
 =?utf-8?B?enhuOEJzWm1SKzBTVkE3K3A3eDNJUXhUSjhKaFdLdEtuaFI4YzhzZVd1TEJ3?=
 =?utf-8?Q?amjjgukEiVk7cB7z2OqEz16sG4a/vMYp5mFEtCo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc71c8b2-e20e-40e9-0c33-08d9409128e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:17:25.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnO1ptjP9a9k6IGIc64XwKMqF/BSbhIvHcMyk1gg8PznFC3rrqO8SjcwiDfG9fhcV20eAY3qSgMalboa4kLNkEq/X9cQsYuEnSIbV/YZ7A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.0.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

06.07.2021 14:23, Kevin Wolf wrote:
> As the BlockReopenQueue can contain nodes in multiple AioContexts, only
> one of which may be locked when AIO_WAIT_WHILE() can be called, we can't
> let the caller lock the right contexts. Instead, individually lock the
> AioContext of a single node when iterating the queue.
> 
> Reintroduce bdrv_reopen() as a wrapper for reopening a single node that
> drains the node and temporarily drops the AioContext lock for
> bdrv_reopen_multiple().
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

I don't have the whole picture in mind. But looks clear:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

