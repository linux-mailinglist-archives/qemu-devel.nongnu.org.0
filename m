Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354039120A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:11:09 +0200 (CEST)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llodA-0000jQ-G1
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llobe-0007ye-4A; Wed, 26 May 2021 04:09:34 -0400
Received: from mail-eopbgr50135.outbound.protection.outlook.com
 ([40.107.5.135]:45028 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llobc-0002a7-EV; Wed, 26 May 2021 04:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVcTw62E22z3zyYgYMgx18ixa7O8x6JJ1KNQjq+CE2Fb1RjHIdf88RuIu+YqjGt/tDxl48ZGGTJSnWjybe6/yFfKm2BnklAVh++edk+F2U5F6JTJYcdKYx3Mpcni4iYIdJYoYh8W3JcAwxLpdKzx+/IDqI2pI0ktqgiS3x7P0nUreGbAekhusdz737Io+QXh8lWdW1AGsHvYOtYudcARqH4SP+Ecv/ChIjZPol+nkdK4J96ZcsqnNdSbc7TeUQsy85UwMjMio6R+Qqy/fCW3/Tm2tUDpsKYD1xAInCqjPjOJulVRHgfb+HXqeBntfGhPNSYQVlyUHx2PU6ALh+0nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcX+HU8Fqwo6pqvMXvw16kmhO9X/1FSeL0qqlWUPJ4w=;
 b=Wu9JvqhnJuKs6WnwZZ6UK3DvYBalfQmgPFej46P3vKSXvoWjOuMtzOKxWb34RTkbXEA7cm8t8FpigaAEghLZcRrJbouyrZ6qb+DgmOjW9MGBawS7+/dd4dqMHoFOY86cSPdvrUmiGxHt+tpNg9p3UhpmrhD1xt4iJKRzmdrHF2LGaPMzjjYCLLax92IVTCHC33DXPECbXs+IPPW5xcEX4bjNdpa4Hvy52uMAlP4anxSNpgfPanUAcdwU032TOnC3WeikGOMvj3w2qNR7sRNERk7+UROLVuPQZfKtw6Nwxomv9wAwuDvHEdBctNt9fQdf1CjV4LSdwLDOOV/MXRB8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcX+HU8Fqwo6pqvMXvw16kmhO9X/1FSeL0qqlWUPJ4w=;
 b=PR5v5KCtxn95piRQSKylU+3vNcfDevmfMMNWKpLk1T3IkiPBms6HrFoDNbomSpsU66qey7IrR6Xzx7CfkGl4sstXtIvyb2Vo0ePQ9sHWtjnwEYd+gyFIHvi+/1eCuNSVKB4nfw/jCHJ5wWxhQzWAmUGrvt1XrU/ehwRAZ2VtLZM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 08:09:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 08:09:28 +0000
Subject: Re: [PATCH v7 07/31] python/machine: Trim line length to below 80
 chars
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-8-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e55a2310-881a-ca10-1f65-f9bd0bf60fef@virtuozzo.com>
Date: Wed, 26 May 2021 11:08:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-8-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Wed, 26 May 2021 08:09:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f4c4f7-4cf1-4a58-b34e-08d9201d9583
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951025BACFE2B7D47461935C1249@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2rdSt7hyZrwoHwygIej1tiqBY4ZoeaL0gAvX4D+V0exSY4YUDA9bZ9ESr6/DYh/wgBjzcARYVlCD2jJ2gnyb615FeVWxx7NapstdKE9MvQVpG5DAinMN0H2dwmvlJTlaMfW+0JSTGVlDJiEUaEaGysJhNCK7lV0n5sV6sSZqNKcINyXCfv8pt9VDJevISWJ3NOhP0m8misaqeBv92bEu4cbRAnhLtQAuMbNS4F4aSGeLyEssT8dGjHxTQfYpCUC54Fq+lHKxQYifrhHLvyi4mg4S8788Eiq3hCyiY44GJLB2dhauzF1PS+FTIDs1wQB95YDfh7eyddg83kUoE93dxX8d7xN8YKU06e3+K3VJvTVhmYkKdrOH/sT+WIxPO7NSpKOAXFl0LW6zp0VLh0L97jR96JpHappAygNSK++wNpi/fqBRNfwGTAWNSHMjejQV05pGCIsvQpU2W6jlrF50psq9rPeZ/T4aJUrsyrfsxiEVRSqsiiRprexyd39mIeq+gjcmDKCHKuVEzlHomZYEH0bFyJgGYyILY6sMUkQCj51VQohwCx408208NoOIzsPCL05ZKMMNCy2qhL8nG1VfmGLc5P0h3YexTbUH9kncvUAUm3kZ2QaBqgT1bIVclCfXsTyj3EPI4lHvPPZTPNLiAvqpWJFrc2TWJ/4yADpqHtB1S/Efj6QEJumtFUXmJY0n3T/xa9sZ5rxsvofdc9BMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(5660300002)(38350700002)(558084003)(6486002)(316002)(66476007)(52116002)(31696002)(8936002)(38100700002)(66946007)(2906002)(7416002)(66556008)(6666004)(26005)(4326008)(54906003)(8676002)(86362001)(36756003)(478600001)(31686004)(16576012)(16526019)(2616005)(186003)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXRRTHV1S21HbDNmYXpWeU1semF4Q3BSbVhzU1dQSW1nRzBhSjR6a0tudnY3?=
 =?utf-8?B?eGh3RG1FK0MyNEVMK3Y2aUNtUzdBYVNGeFgyMk9rOUVabktkODdzS3dOc0tT?=
 =?utf-8?B?WVNMeVlmWTNOeCtSN0lnenBnOWdFODQ0NlJwZU85OGZmU21JbWtmZUtnMDZQ?=
 =?utf-8?B?aHVoNktGbG85bDJ1ZWg4TUlXL0J4aG9pSDlKM3NGSFhST00yaGxzSnZMWHBp?=
 =?utf-8?B?RlN1RCsrVk8vSXViZ2tyUGdNVW9oREJUdzZ0NUlpS2kyUXN5cDRvVFpUeUNn?=
 =?utf-8?B?SWhpNU1BNnVETnhrb2ZuZkFCby9HakFjS1F1dDEzVEJZYjVmdG1xOGU0Ym1q?=
 =?utf-8?B?RVNlaVoycTA1ckltTHFwTG83SUo5SmdNblBBYzdvbEZQbEtoditCS3JVdThv?=
 =?utf-8?B?YytEMXJBb2VtNUpTbEFmYVczb2ZmOGVlbXQ1bGFEc2Nncjl0TzFldHF4S2tz?=
 =?utf-8?B?aWVNc3NYOFJBNFlwUGZJd1prZWh3Wm80bTE2K1N4TXppRlprOElTK3hNSGMr?=
 =?utf-8?B?aHY2bVhtaXhtY2JWRkFlaUxPdFU4MVR5LzhaM1cwOXV4NDJIYXJaYkEweStr?=
 =?utf-8?B?VjJjaGZhNURuUXVXellvNm8vdGtURVhFaVcxcklWMlY4R1poODN1TW8xZ2Qr?=
 =?utf-8?B?bFVQOXU4S01nY2x4TW1zc2dxU1B4OEFZNkdma0dGSkU3aUVlbERyb0crTlhq?=
 =?utf-8?B?ZGVmamVhTzNCdlJ5Z2JhUnBIRit4MTh4QllWODNtanN1ZGwrdFY4SDE3VlVs?=
 =?utf-8?B?MmxCSHhlcDcydEEwdXdUN1o2bmN1aEx3Z2daM2RCM2k3c2hnak1PcnI0Ymc3?=
 =?utf-8?B?cFdKVEpQclg5U0JweUpLb2p5OGFsY3o4aHJBWXVaWUNLeDRaRWF6TTJiNC9S?=
 =?utf-8?B?WHFYWktTdlhnS2p3bHJFN3B5NCtKMlU4RDcyRFlQTVdZS01jSFhjZm1aR2FL?=
 =?utf-8?B?QUR6dWlRdjl5QnVuZEp2QU0xU3RMN1hRckIrSTJlZEhCQTlhdnZmWTdvWWt2?=
 =?utf-8?B?TmIyd1BRVXhMQ05XajJtL2ZTeWt4cURTcWJKaUl0bjYzWnVJbEkrMzFHbTlF?=
 =?utf-8?B?VURVNkwxUmJydFpDQTFxWnZnZFF3eE9rMGJ4Sk8xWTgxeUp4T3pDT0ZCL2Ra?=
 =?utf-8?B?eEJMQjl4Qm9KUGNkVURjSzh4YlF0dEdEWGpmbkxhcGwrZUhIT1Y4bThRWTRK?=
 =?utf-8?B?WjRRM1VnVXhvS1E3eDFWSXBvUVpjUTFsVkRSRWJVWFU0ZHRET3J6UU9RZEts?=
 =?utf-8?B?ZlI3ZWFuVWtDVElVakpRWHNqVzNrSFNwc25Jc0twbDFxZklLaERyNmNXWk5S?=
 =?utf-8?B?aFZRbEJRU1kzNWtXazlKZlZyQ3kwdjJJK2hZNEsvajRYVUVDcmZiSWhwbHVq?=
 =?utf-8?B?S08yR2JVWnJLM2JEREZRZWFIcm54MXV1VE5WVlpCMGU1cElkREVKc003VVE0?=
 =?utf-8?B?WnFPdXowM1dxd3FCS0cyNVJnNEhERUM1aTl5UnFINDBHZ1VJZjcvYTM3dWp5?=
 =?utf-8?B?K0IyaHVPYTVUQWpsM21xVWFIM0VJRjJ1ZDV5Vk55YVdPd3ozalpQNDNnckto?=
 =?utf-8?B?TnFiNk5JRHJ5ZzVZd1Vuc3R5SkZwZlkvU3NOSm1CdFUvYmQ5OFZWaWhNaGVj?=
 =?utf-8?B?bTl3QWM4OHUyTzlRWHYzS3hGbXlYSTdQYjRNYzIrZXFsdFBucGxvV2dWcHRa?=
 =?utf-8?B?ZERIMjRMTGlyMGV6Qlp3UnN1bjZwRDhUbmpBcXd4ODlyVVc1MFA0N2F3Uk9r?=
 =?utf-8?Q?WOaBWOng/LW207iZsw2BhHeQQvK1mXRco5/UGVs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f4c4f7-4cf1-4a58-b34e-08d9201d9583
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 08:09:28.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GumDQBg5fFLyaGRlygVRRmy7c1UtciYg7rldsUyerI58UJlHPC2sjsYNawKNtkvLI8SM9YAA/37QRgwlELUr536NyMhTpgfBLEVldkG38Ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.5.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

26.05.2021 03:24, John Snow wrote:
> One more little delinting fix that snuck in.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

