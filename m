Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF563AD968
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:34:17 +0200 (CEST)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYIq-0006rk-Qq
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYH8-0005IE-23; Sat, 19 Jun 2021 06:32:30 -0400
Received: from mail-db8eur05on2137.outbound.protection.outlook.com
 ([40.107.20.137]:7073 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYH3-00048O-VT; Sat, 19 Jun 2021 06:32:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hpf9UR8dsz2hEqxYfTwnjMOiIdU0qOGsFRF7Di3nZdxCaXAXVoNIG5A5xD7cQ1LxiOC5gC5SDzyOFabpIWBsFyx7Hn9A5lkBvN95lPljc9TFbtKjZas7bjvk05n6ukgznhzMwG6Hsk6Sz5pNk/cO4a/F4BQZN2i1EQzMUaoD7Kx4/bzku8ZNOFqvD4rptTd/On0ZJNbmdUA5cmLNlNLKg2xPmkZNHpKdGZTTVfGaceG2ebO+J/cxSak5GnB1aXwjxjZeibqrt328t3sVuUm1nSGwlHgkNjG8WX5AZwelti5n4ooDHcZTVZIc6pc7gXetcpG9OZd1k07zwkTxbZpq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu9Bo7AziBO4nm7tVc6d8qJg6ZuOkDBks7I+EUMSBKw=;
 b=WxJTYF94zYsulz1ZnBzAO6ykG7sSsz8eGJi/sPgd1xAnEg0r7Z7ubJeoTi+NAoXozpIG4PcKnS4yZdscQ3dyOU5IIUoc3n1XPImtxjmelyhYKd8uFEA3f6mQeMSGdPnOQBskVJiUHT4XuWzaxfl6gIKYC9FbQmB9u1hM0zM+KuHOQ1PuiCBnv8G2vS5bGyZdHXEGMPld+tOolukWRNLqBcyaNn6a04oEAxHPWKAXlTESglfoV8EiYOxeGb7Iyz6iYGgstybuARMcxjm3vorTjHvypbwWyHs9U+/Pv/l8SeT0T/o3mSZNmL80gMgFeSnSU5YcUlxQFaNTJSVUB/zY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu9Bo7AziBO4nm7tVc6d8qJg6ZuOkDBks7I+EUMSBKw=;
 b=aTgDST+LlYc0nowa1N3GyFaxWAP8TMglTZjJwwQv/tD9bobLokpd8DcMZTQ2B3CKKo9bk6Irq5Ejc4jo+u9tRYPJkk/qwz300GodGnCABXqq319LN9P5bVwSjk7BOCIkGspxEn77FvDoBi9EUAUm9DbAE2o5BaHqEdlN4ESoee0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Sat, 19 Jun
 2021 10:32:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.022; Sat, 19 Jun 2021
 10:32:21 +0000
Subject: Re: [PATCH 3/6] block/file-posix: Do not force-cap *pnum
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8a97f367-fea2-5642-b8fb-66c7b858a6ad@virtuozzo.com>
Date: Sat, 19 Jun 2021 13:32:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617155247.442150-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR07CA0004.eurprd07.prod.outlook.com
 (2603:10a6:7:67::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:7:67::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Sat, 19 Jun 2021 10:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0cafed2-2dba-4520-6669-08d9330d8508
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190822B846768C5B7F6045C5C10C9@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrNMLkyMG4tplr53OANKHzgfrQldPJ5cmuG1PoxzM7aTRs9gqDzDlQJlt71P0aUR2lAWUO5ecsOMDRoAFm8SGHKef/7fVHbvzcjNw4Mpo/E1fFTlQBu41BwdFZKmgHpbEqEuA8AfvT0yDjFQy36lanJ2ciBaMNPi9ITY3k4VUyAD/tFHhyOmh1CP1PytO7sF/W6O7ycbOKqNP7z1054E5yf9CPjoONpiwyHJGxdYCWrkylcQgf0KFRxNoXJyTkxk+6WANHPNs37B+wp7rkj5EFUQs2DHNIW2ieyC6r8eWVOtyt6jvLg2AsQGbI3PDz9G38cuWlJeNovh8K90b+sKnCcKETOMyscRkbyRQoXtGwn8p7ZTtzIDS2QXKMhwhRisIddbPWp8RBGO5JixHW57TY9A2tLzUtCkHAzGhw6YovGlnVEan7uOzj4ywBdl48dY9F1MaJnm7hpCVXgcd+ZKRSSPwMxifJ5wDeldJ8s8Z58zWHfeTGLe/oXuzgtPs0vGld9/Brt7A/tyu6dhEHtmXJTv9Nm8KpGGwKVkPW0ErW0EVMtoz9fY0zg7lDsW4PS18j+lV8f9m8qLvY/KAZ9gLNy+V5etnZDTctwLijRHsVTJOV2gDmt/ArXYKMy9j9Wt3vhsHfOJNJ42MFKJVQ5Td1K5pIVFqKjAmV6+HaT6TcqQCQrKHgjYy2YQzmxziRWMHkTP8Ea5Pnhelj+2FeS2tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39830400003)(16526019)(8936002)(38100700002)(38350700002)(83380400001)(8676002)(31686004)(186003)(36756003)(26005)(4744005)(2906002)(52116002)(478600001)(16576012)(5660300002)(4326008)(316002)(6486002)(2616005)(956004)(66946007)(86362001)(31696002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkdvdjFWajFVaGtyREIrZm4xNDg4MkFSUlJQOVp4ZjN2cDI4N2pPb2hBemFQ?=
 =?utf-8?B?RkFlTFY2VnFSY3ViNXpFRG16bWNaUXp2VGdFWVlVdjlNRkYxM09iaTNEOGxG?=
 =?utf-8?B?Yk4zWXA1UXorZ1VtYXdMNDczYTROZlhNVm5jdjgxb2pyTUVpM29od3VtWUty?=
 =?utf-8?B?K3JMakxXSDZkUjUxOHhuOTZWQ0cySVlxVTZtdU1TSVFrRk0zZnkwTGpJN1or?=
 =?utf-8?B?MWw2R3VZTVRRSHlsaUtPSHlSN1IzVzBhTWZzQ1I4U3N1N2NFYmQydURIaU0x?=
 =?utf-8?B?ejEyMmFyaGN3SWNqNUNNYTc2K2pzeWtoVHRCbjRPSjZ3eFdvUlV1VlBZNTBX?=
 =?utf-8?B?U3JnelkrTXZiWWxTUWtVRmhNdUlKR2EwVC9hbFY5NkoyUUh2dEs1cVI4akM4?=
 =?utf-8?B?NFllSG1tZGdhdm5iTXBZOXBMNmRwc0lKMkFGWHptZGxyUXJSdFN6NXhTdmlv?=
 =?utf-8?B?MXJJQ3dDZzRIM1I5STFpcFRacXJtVkJReFVGSkZqMjk4T0xJZjVYWWE4Njl4?=
 =?utf-8?B?V1prMFF3a0EySmFvblFXSlhCWFQvUDcxczdRSDRSOWZMMitmL2RVclNlZ0hB?=
 =?utf-8?B?QStzVEpycUszL096czBvdmljSGF5S2g5QjdOTFdRMVFRdzhzRkhFNG1yayti?=
 =?utf-8?B?aDZ4cVRuYStxMlF5cllXbG1pOWZwVUlJT3YwcUhBcmtJb1VHYllrSFNFT3ZZ?=
 =?utf-8?B?OVhYM1duV1lkOEI1cWh5dzExT3g3ME03Vk9QT251cTBFMlIwaytxNHFmYVhJ?=
 =?utf-8?B?WnlJbW5sQXExTEVWa2pQdHdjMzFHZVRLaW5XUksyNDh0Nlg0ZUF0SGtxaHp4?=
 =?utf-8?B?VUFXSlFiQjdCWkFKVVpRdXRvcU94bDVJZFR5UVpXRStrVDNkWHlqSlg3MWVJ?=
 =?utf-8?B?YkUrcHJzcncrQjAvV29YMEs5Mkx4aTVyNU5ISDRLbWUrdEZBNk41VFhkNElL?=
 =?utf-8?B?T3d3dDZJL09RamJMTTV6d3ZIM0pWNjY5MUNTaTZ2Wm1rdU9DNFdXbjIzQitq?=
 =?utf-8?B?N25yR2U0K3VpMFRLTWZyTVdDS05XMmNIbWNoaUpPTU9KTU9uYXRLRmltNEQ4?=
 =?utf-8?B?dTgwdUNFbVJZOXJyczVOallUN0JZV2Y2M1A0bU5QcWcxMFExbDlabkNuTDM5?=
 =?utf-8?B?OWtmbkNYK3RvaHNlZkErZk9pZUlTK2pSZnYrcm5xa2FnT24xNFUxTFM0QTUx?=
 =?utf-8?B?b1ZTd1NPdzRJSVZ3bFZKLzRUK0RlWmUxdWJHVFdZSDFuTWlmdThDYzlFemZ0?=
 =?utf-8?B?TStJRjRNSTQvNGFka1c1L3VmVU5iT0U1Nm9DdCtKSEV4QVZZRHZpR25jbTdH?=
 =?utf-8?B?bDEvVHg5bzh2MWRuVXZ5V3FtODcyQkhVZ054b0lCelU3cnk2WFNxNVU4REFl?=
 =?utf-8?B?amlCSkp1N0kwZkp6SU1yQ0xFeTJ4eVFBUmErUlJJVkZVWkl6UDNlQXdvM094?=
 =?utf-8?B?L3A4SldrVlBNUnFnVlk1dDRZRE9hbCtHbk9DRHkrVkhYcFA3Zi94ZVVjb3lx?=
 =?utf-8?B?S3NUUWloSE8vckZuUHhXUFBQMytNOVI2M1B0M3FTTEo1eE1Gd3prSUdBU2lN?=
 =?utf-8?B?NyswdzM4bzA4ZmNyNksyUVRqdGNESkc2M3ovWkNrbXYzV09TRTlkTVZPQmpa?=
 =?utf-8?B?c3YxVFZIZm5EYldFLzNmUlBtTUNBQXRrTnpjMitpWnpJZTh1NEhJdlkzdmVx?=
 =?utf-8?B?anhCV3NwZndadndySS9TTjlCSURNU0ZaSTFmUjBiRDlwcjhhazR2eGtrK2JS?=
 =?utf-8?Q?eyvoqeiSQJQWHRA+CQYq1DBcGP10hpL4SFs1KJq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cafed2-2dba-4520-6669-08d9330d8508
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 10:32:21.0939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3he0PBfoCh88cvzwBueCjH7M93O8eIZmvEYcXzzoSNgdBWt6uEodcycdFggxRA3nfkYF86+QPxEmFUPj8BrXH+WZfFKNOat54PRj6GcVM38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.20.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

