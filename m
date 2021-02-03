Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75A30DB0C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:24:42 +0100 (CET)
Received: from localhost ([::1]:48432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7I9B-00009p-N2
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7I82-00085s-IF; Wed, 03 Feb 2021 08:23:30 -0500
Received: from mail-am6eur05on2108.outbound.protection.outlook.com
 ([40.107.22.108]:24289 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7I7z-0006MW-2k; Wed, 03 Feb 2021 08:23:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUbDH3lxOhArJ1wwRBTXsHmu4lxKDmQxPzNuX7r/0URgVpJ3yv4EfTTJajCBRaYPmtr0v1/Qg38ARUlKjjTzXHzVmXT5/5VEWK7xP/8fWHqbGtkboXZhJkOhhlR6BoKiUic+JmhrFg99WjaV1mJQSL0GPTtb6hAQMKsos8qPGUO1frIHXtBZTja+lyr87Pm9BUKeKl0zdm5EJvVZl2fxqqC0eG/WgWZsqm8LtQT76P/ZVqOVk+vmaN+gmiJTSMQF9cBrpSZRUsyP4evwCyJeGMWLpG/VNkYP+SGZENxKlbs/RMuV7/ahK+2X4Vxj9gjyXLENPkc9T3OeccyvsY1SiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xjiRTZQ8w9nKYEOA2FQzha1HmeJrVlGvcRodl/MO/w=;
 b=d1n9xMLIyn2nxwOqIA/ih4dskN7SoJep+xqRAITBC3C2mFcr5EkVFjNv5RcIBPFkzNFgcbeUFc70Ug7ITPw4fRRk+pYr0M/Eq+KcG6Nb8n/lKqlJ7EEX8tlTpVdxQtpGu9v88753DIl+Yx4oeRB+qHZjzcISIMT6JWm5EiCNLo/4QeEM4YAOVBSrTxur/9uK8eu6v7gIgBb9BykWZrplU5BJmG5YUn/ZAV4PLgbKGeDyRJL1GIwhYfFvLhg0GvZW8e37qwoNYpPEglfUCSvOWNoSsZu+ZTJW8iXH7zOk3ufs3feOfU1TufKO1n+pZx+yRaglr7wumwpv+PmLDR5BSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xjiRTZQ8w9nKYEOA2FQzha1HmeJrVlGvcRodl/MO/w=;
 b=k2K6SMJn46zMNTuPrjq9m1BoVv4nDYSHtyCNhSbfbH93vk+PS62TycHWbmW1xf8u+j6U9ueNnz9xaoN2F7ZhStH19XODqpZXFHL3vZ8YiTCsajtdKErNfAj7emsgA/Q37OSv33aHg4/Aev+J5FDqviKK6eSSf7fOuQTCSUq3xwc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Wed, 3 Feb
 2021 13:23:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 13:23:23 +0000
Subject: Re: [PATCH 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1612356810.git.pkrempa@redhat.com>
 <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a519d6af-7f24-e9bc-894b-070738008e01@virtuozzo.com>
Date: Wed, 3 Feb 2021 16:23:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM8P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM8P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Wed, 3 Feb 2021 13:23:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62765bad-8535-49a5-0afb-08d8c846e1b5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6551AF33DA4CA26470A41F8AC1B49@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ptrIfu3MKElQ4e6kUxwMt39l/ilM9pbE8jv8AVuoaJLbPLL84i9DN7gaSUNv2I2F5Dqr/KaT80v2Ehr2jUqBm52HLGKl+/GvDGLBywCwXOtQSzP+/EShCrXHWmbHhYwNsyPFCszapcei2hpBNjlnlW3O80tLx67EU/SrhQaGHTc3BcvUyfOmhR6N5gW1gjMDnOGXzdVQySvItezVchXtW53Y1p6m4l/2MydQcBu7jd/XiZrkbm1sPSXhWnQNJjD4c5P5a1RwyDw1uuF8G749RCKQeKJXMmBubm0CDFjYJr8wKE5a01J4hXOLC+IOHQ6qwVIcW1dBVwKDjH3kEFUlIOTpN4ieqc5Z6Ef15MvRSwkFVTMXN9VzRHi2DQIYXidS2sQXKq+UuFUM5KZ1sduSwWPu8L8gUX+jbFYu073rRjWLGX96zy36DUuF7+UGBsSn0sXrEqED1pZ4C38AbBb7eJzyyEpdWkWEQldUFBj7pFtLZq8sGSbRAMh05zpeXUEtZMSPsd2vbuCGouUhe637RAZszyzhtRqWwhOml+XPtpmFc1kF+eENUSesgP63v9uNeAfMk9eA6K6ELH6x3Tcn9RJcgv36azTnr3+iPlnzg5tWmqmF8ZUlRPfRl9nmZ9PK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(8936002)(31696002)(6486002)(2616005)(52116002)(31686004)(36756003)(16576012)(66946007)(316002)(86362001)(54906003)(4744005)(66476007)(5660300002)(66556008)(478600001)(26005)(186003)(83380400001)(16526019)(8676002)(956004)(2906002)(4326008)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGl2cXhoNUtWd3hZUjg2L2xnbFBGZHEyL042MGZOSVB0MllFTTArbVAvME1u?=
 =?utf-8?B?YUMvQ2I3aDNkZ0k2MWdQSHdPYUlmbFI1WC9VTzVZRE1DWEhKUFhUTDdiQk05?=
 =?utf-8?B?YTRjd1p4WnhUMU9CbFZHYmpXSWh3T1hiTHV0STl2WlVHZmF4NGl3Y1A0S3Zu?=
 =?utf-8?B?TFU2UTZZMEduMzM5L0xEZmhOU2p6ZjRsY2s4Z0hGYkJuTXgrdkhINTNJR0d0?=
 =?utf-8?B?Vy9EZm91UEdlTmpYdlNMNklFNnR0T1VsRWpUSmk2WVhuODNsWHdpSUwrTWYz?=
 =?utf-8?B?V3Z5RmNwTCt4NmJUNmVQbHFQOFhEM3N6ZTh4QjJLdmkvYXBaVjFYYXVvdFVu?=
 =?utf-8?B?NnlLQ3BBVm9SQlZrYzYyY1lGcmV4QUZBb0ZobkZMeUpjTUdpM2dzbEN5TE9v?=
 =?utf-8?B?QThYN09VMlA4ZmlCbXg3R2NJdUJhbjZ2STZ6a01GOE82cnoyQmZYeWZjVG9n?=
 =?utf-8?B?Tkd3WlhwejExaHFlbi9nQ2pkWFRwOFdJSDJOTFo2dC9sY2dreGdMNjB6NUkw?=
 =?utf-8?B?SWJyZ2pCd3UvbWx5N3lKMlAyZmZVMnlqTGdqMmdReG1nVnlhVEpWM1RrUlhN?=
 =?utf-8?B?MTNkUG9yaGtxWCtGbnEvUGxQdkpUV3JCMzU1bExEdGY3TVM5WHRGOXV0aEJn?=
 =?utf-8?B?YXBHYmdLREVlWFN4ai9jYkpObTFITDBZeHA5TnZhYXZoeDRKQWdqMXNMYmdI?=
 =?utf-8?B?eXI4ZVRNZDIrTytTQldBSkNSNi9LRkppRDFUTWdoTXZMYWxaRWhLZ3J6T1V0?=
 =?utf-8?B?R2ZMcnozTFA4N1phMlNDOVFoYnR4Yi9HdWpOT3JRWDZRNGVGN0tYMTZRajBL?=
 =?utf-8?B?Nk0wUlIxSGt4VHQxcm9XejVDZjBYUWU4cnRYak5hcytvUzNhZkI3MTdibzJ0?=
 =?utf-8?B?bWwrMGZVOEJGaW5kTnRscTQzNjB5ZS90YlR5WGhidk95OE1SUFFGM3phTHFO?=
 =?utf-8?B?TnBONGorNFlRTlp1Mks2U3VLb1A3VGpTVVhHcjJMVWxpWjF3QlRaWGM4WXli?=
 =?utf-8?B?MVlRNTB5S3FPbHNYMXZSUUIwb2Vob3FkK1JJcEdFcnBSQmRxR25PM0V6QUk2?=
 =?utf-8?B?Tko4WDBOd3lzWTJNQzQxZUVuR2JNYXRzZlpjVjV1aHB5SHlWVSs3MmpBY1Fo?=
 =?utf-8?B?SExuTGZhZ2FEYisvbGkvZHVDTjNsYzhzWXpWRld6T2FlVkE5ZkcyWEhmVGV2?=
 =?utf-8?B?WTFCRmEvazZCYVVwbDhWMi9TMjNkMWFFVmxRQWwra1pKTWZnVVgzNjZLbDVT?=
 =?utf-8?B?bG8zZ013TUlEaTlmVkMxMklEdnk1LzdYQjZpTXRRamJJaXlLbG1Penl6ZERI?=
 =?utf-8?B?R0VnOWVtVFFkenlHTkxiYWVKTjY5N3VOTWdPZVdZcDZyanZwL29CYlZ5UkJQ?=
 =?utf-8?B?WUZwdVN5L0tlRDJZb0k4Yk9wdTR2V2hjelNrQTlNUlJjS0Q2ZXZ5Q2pranAr?=
 =?utf-8?B?dStXNSthWWVidnhWVE9tWFFFYy95ekNEbWFiOGdnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62765bad-8535-49a5-0afb-08d8c846e1b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 13:23:23.4084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlaUd5m1XyuLma+YASlD/pOYd8IA4PDqp4WaUvZA7xIB2L0+Q6ONH6erthyiBuf985OAToXQHd2FgtxcIC8/NWYTMJa1aaHEN9Gz092fwgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.22.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.02.2021 16:00, Peter Krempa wrote:
> Bitmap's source persistence is transported over the migration stream and
> the destination mirrors it. In some cases the destination might want to
> persist bitmaps which are not persistent on the source (e.g. the result
> of merge of bitmaps from a number of layers on the source when migrating
> into a squashed image)

Why not make merge target on source be persistent itself? Then it will be persistent on migration destination.

> but currently it would need to create another set
> of persistent bitmaps and merge them.
> 
> This adds 'dest-persistent' optional property to
> 'BitmapMigrationBitmapAlias' which when present overrides the bitmap
> presence state from the source.

It's seems simpler to make a separate qmp command block-dirty-bitmap-make-persistent.. Didn't you consider this way?



-- 
Best regards,
Vladimir

