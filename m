Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26D417608
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:37:53 +0200 (CEST)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlOi-0007te-Rt
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlMZ-00067F-5H; Fri, 24 Sep 2021 09:35:39 -0400
Received: from mail-eopbgr130103.outbound.protection.outlook.com
 ([40.107.13.103]:4359 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlMX-0007cg-7k; Fri, 24 Sep 2021 09:35:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uou1L23xomEPtoKXmiJkT+XayAecmSMa1sPtJtLinv/05DwRtSQJBeD+SjJyLTihVZ6XnEzSF+xL5M4YF42qgr2VjJ6fWlT/d6zV9dZDpUj26P4fg4fIOIwf+Vrs6cttqJcZojTtW31kKFcVXJlte0UES45xj4gdh/R6uuVT4rlcnhw6wuaH7hWSDRNU+pygHI+p2FqcRURvnxBYQlRwxLu8vFKKwgVQsEvFBI6ZyLZUQvGdZCiB1CrP3NhCdCdgqyeM6wowOWpgYNGRlkafzZK4cTYsBd5hBD7oVydjRQy+sFa0vxg6n4E2kKNTneDhWFV9enC4iewFL8B19gMP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tLZjbkHl2yHerKEtsyq0wyXIhGqBhb7lh2QKnnRB3hQ=;
 b=I4HrZOJeTSoGtNB7V7OUnKAmrOKpyMV43wutdhkxVC7KKCOwpFZ2STat3N0AvrKZ5kssUouWZ7X5nFnoupWCU+zMixkQ8UMPpcWiE64YZLWI3uzrLewjt4M8PluM8UpZ3VpX7rpWFzCkQginlGzJOKHrobnoA6p/uO9y5zvJCCRs0moZwiWM+50diPg+ZsV+J5Gstkm11ukMR1Yp4fau+uTLWFDd97ItdIdNEaXG5xAkg1st1rrZ03N4geeZt7RD8FzSBNgV7rMsBkQFxpnE1h7pViuVwCxxkJJ2r/bY1mv0DqeV+ozv3MCQJ+uzizvWYhcbgRIySVPHgrYz1H9gqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLZjbkHl2yHerKEtsyq0wyXIhGqBhb7lh2QKnnRB3hQ=;
 b=L4RsywCp9p0xlhY0SymBKuu0KTOAOCVf/pmEBVahru/HFyAjcAH0lEfjLzzXrDjut5Hd0erThoR8e2PTzwwYFBLl7sGmxWTu9Yy8mxupeOTiDKUXN1eb7agJp2+st7g7jehhF30hU+8hSR4s9ZyACp3gdkY7GwEL1MJ/tSTz55U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 13:35:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 13:35:27 +0000
Subject: Re: [PATCH 03/11] iotests/051: Fix typo
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-4-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <288acce9-58fa-5251-734c-3d5f2b922503@virtuozzo.com>
Date: Fri, 24 Sep 2021 16:35:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924090427.9218-4-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:102:b7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 13:35:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0b55550-433c-40cc-770e-08d97f602b37
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622D0D22DE852F781468E95C1A49@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISP/aw0nCrAerilyKAGIZ+sYPeLs7RmgHYzB6BF3um59meK8Rgyz2adXukBG3tQ8GH5jrhHYsGtAFQC0fNhWEg9awGPss0DVnfifpP5CtRL2s2y9EESqB8tb9pCp26KcQIp5W3YSUndNbvCYVEemCZAjjt/1EYmSFaV5qHgXJYnMwFhbyVbv1Avxg/5LJMxMkhr1ZVNL5yiWF0n/1jzaRGW8PUg7Xv/+blrXXsWxBvR7o7blxeIVLbTvBtXYTAOSPT5WROSoCkiWKHCFQItPIXRiqaczRdLLe65XtSXtBpLDv452isAqLCfzqq6dGfS9U4VgeR1XhG1Dr0eviNovL6VknAaaV+lkWe7Juh6gNOP2FWtZ3GDXcdebVNiQkDun3TFy9hUzCVRdIu2GQ0RoBIZXCg5yyOa7++gI1NBYEPYzh6lNR/cGdlImXc1qqSDEcpY7ApQOkXQgJ7A1k7vQI6rsYzNwMm7NyoF/H/s7os4Z6M7u/vmvBJ0rPSzIez6eGT1QyVZcCaMH7saSSFuIdpNreAyIjTWa3b2OE/7EdLhf78dNYYTYBVYPdzIAaBUp2By6CBFgJqTBAttW9e5U5WzigzD17sCnQ2BvvT+VEV5gUBnYlboiT12rQ43wp2+R9CPbloRvvR4cInkzHNLBu/RvXfG2t6ZW9LDtkPDJshIAl7qRijf0XxTG/iNh1gp/UeNj29VaKLDGpGqfAPd+xO90XHjnvU3QJf3rgKY3l0G+uvl2eTZwuzGY7t13a2+M44ZqHq5cG7o2rxGneCQVQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(86362001)(31696002)(6486002)(2616005)(956004)(38100700002)(8936002)(38350700002)(508600001)(2906002)(83380400001)(4326008)(66946007)(26005)(36756003)(66556008)(7416002)(5660300002)(316002)(52116002)(186003)(66476007)(4744005)(31686004)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjNTN3h4bjNsaUdMRHlDemplNFZkcWpBOExHSnZrNnROSmoxakJ3eWhEc0dH?=
 =?utf-8?B?MC9tc1dUOFd2MEZ2RXFuWll0Sm1Ua3d3eXNBS3cxbXFxdEpwZkVFcU5qRVMw?=
 =?utf-8?B?d1J4S0YySSs3WWxIL0xRd0hZaDVmQ3VHeTNlSEsya0xnV3EwV3U2MXZqSjFT?=
 =?utf-8?B?ZUJ1L2tnL3d3UXNxZGpKVys1eFJ5VjBhZ0ZJbEJjWFZtbVNjRkxrSFZlc1pO?=
 =?utf-8?B?dkNYNlF6dXpRR1VsM2pTc3U5ajYySVlsVDV1QzNCMjNlSUdsLysvdkRJY3B1?=
 =?utf-8?B?V1BWUjZhTjBYK0hiSTZvcTg3NEIwWitJaGluSkQxODNRQ1ZNTHdlczhHK0tG?=
 =?utf-8?B?UE90WXNoa1lYaE5NMjhCVzBuWXU1Y0JnQ05mU1Q0SlBlQW5uN2JVdm9EMytq?=
 =?utf-8?B?dGpnNzhPdVgrb1FKN052TWFNQjZ6ODltbkRrMUxqaSsyVE1lZXJzMHptU3I3?=
 =?utf-8?B?QzEyeEtCei91dUtTNUdCUXV3WTNiR3dhZWs0Rm8rM1hMNWthU0VmVm8wd2Zy?=
 =?utf-8?B?OERlbmtma29yYVpMWW1TakN5cHpiaUY0dWVybjBTRk92SmROSktxNjVESE10?=
 =?utf-8?B?VUlUUFYrSG5SWEVEOGk1UFRRck1ld3Z2cFhPVVlHU0ZXVEZ5M3ZUSXNJRXN3?=
 =?utf-8?B?eHB3N2c3L2Zwa0pWaDJ5TERDN1VVYzNYZC9aQzA4d2JMOU5IbzFHSkF5UUhL?=
 =?utf-8?B?bFl6VW54NU5NMEN5ZXdmUDg3dzhMNmk1RlcrVUlrcVF2WEhPcXdhZXVaU0VX?=
 =?utf-8?B?dG5VU0JiSVVMckxWYmJZSGhVRjFpeERjMlkzZGJlbWQ3aDhuQVpzMmZLdE9p?=
 =?utf-8?B?VlN1UWFkSHJoNDNFMDFtRzAxUFRLWjR4TnZTWWhKL2lxejVFWG9BRDVpeFl5?=
 =?utf-8?B?WjRiU3JTVkNiZ2pDMDdMTllHWDdJVnAyUjlQeE41RWNUcHkveThVSUtTTzE4?=
 =?utf-8?B?cHhkWW5DRlRMbXp6VHNob21HYmNPdm9FNnRzcHRhcHZaLzBLblpLSlZwcVFS?=
 =?utf-8?B?a2o2dUhMU3A1UWNiQ3hCTTUzLyt4cUZ2QTF5Sk5LRENDbGRVWk9EY1J4d0FF?=
 =?utf-8?B?WWY4M2VUbjExdDMvaUFoVEI3MkEwSFM3amMySncweTBtZWNYWmkwL2gzWUky?=
 =?utf-8?B?RXF6c2JYa1MvTjVaZjRTekw2cG1QVGRxblphdlY3QkZqd3VSN1FmRlhLd0JU?=
 =?utf-8?B?a20rU1VWRDlQZ01mNW1wUkZCMEttSjJLU3hNSGc0TW50K0R2VnRSaVQwamZT?=
 =?utf-8?B?WkF0S1ZPamd6ekZVYyt4Ni9kazNaYzkrSDRYNDhMamNtREh1Zkk5WjB0QUdz?=
 =?utf-8?B?cTZpdVZ4MGJLRVZONXNYQ21saXBEMkhiSWlHY2l2N3FuSHlMT2ZDN3VmdFJZ?=
 =?utf-8?B?dncxTEtIdkYwV3R3azV1VEg2M1FCZThiMmJvNWV4Y0lXUUhZUENpODRVTnRv?=
 =?utf-8?B?WDA1MXpHczVSbkFxZFJXRVM0eGJoMEt4MzR5T3F1T2FROWNWYkIyR3lmNkQz?=
 =?utf-8?B?SE9jT2RCL0FWZWRvbjZyeWtsUGlyQzZSdU51NUZ4T0hBcUd6NFU4aGhraTFK?=
 =?utf-8?B?SFZtZEwrb2lodWJZQVF2NXpiVExnSlFtcTV1MVlMamE3cGRvMyszU0gyVENo?=
 =?utf-8?B?YlErdTc4ZjVtaHZEd3AyS0gzdnVkTFF4YnZkbjR4TmV5NGQzRWVWZStJSnk2?=
 =?utf-8?B?cXVwNVErbFcrbjBYMzhiZVNtajk3aStwaDd1a296enFsWkdvbm1LVWJ6THhQ?=
 =?utf-8?Q?wIc/G+B59R0d/x+JX7CRpbeRRHmGECBv7cbvdCl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b55550-433c-40cc-770e-08d97f602b37
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:35:26.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JCXSiro+0mRVGeBAMc4A50n3YGwJ+hlMNbkRph1+d2vKUnMgl+xpexM5vsx4vI9kmCgrh5cyoxRdJUKUUyeHx/XfwtQ3ZbWeGOCZnwgrl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.13.103;
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

24.09.2021 12:04, Kevin Wolf wrote:
> The iothread isn't called 'iothread0', but 'thread0'. Depending on the
> order that properties are parsed, the error message may change from the
> expected one to another one saying that the iothread doesn't exist.
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

