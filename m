Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00EA40C1A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:23:23 +0200 (CEST)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQCQ-0001c3-Uh
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQQ9h-0003M6-IO; Wed, 15 Sep 2021 04:20:33 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com
 ([40.107.22.116]:11229 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQQ9d-0001GF-AY; Wed, 15 Sep 2021 04:20:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=na3UCU8jQL/xI3nRWWNWsnSUfMMqkrt5Ch+iTtPSVaN1M+RuZrG6d02lAMEN2AVDE6kWZ3UwvstALNLLVDHlB2RsqAzNF3pRjeOcC9NZFqZjcHFIuwpqN4fcRIyuxPfbd8fe2AX4C00UcSP2IZBGZxXT5CcnJt8ys9ihqLk0bRmb5sCOGuQ+xDcn2v8ieO8dih67+FJH+iDYeXVLkEtv5vMpszFlOs+pTF89HDfduIijK6YkH69EPrkCtjuc43NVM2oTGCjI0TVsEC57EzXXLhtQijuiFbz/mjLYZwTWF5NdF4wxs8ZxorfwzpQD95OYcsHIpvLQyca/pnWVJCVV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=y4gSAGsRoGt0bwxBkAWpzUcBD8iD5MHCWoXZdcWOyV0=;
 b=KD0LR+ZoBfeZLDHGiDmgFNx/dOxnM7Y1iZqBxkM5vmQ7sa6fL7SGVJ/bgYjYDMkSNicKcDsZPDkznOsKwJBDUAJU64NkMPPHjZ6PJWGOdsY8/nP9HhktsHKML9pR0r80koVf6aoIwdY/vw1FV9aysCFJluYBhvo0MM5Z5B5PaASNO8i7DWE8SMJ44nfxfgJatYNgZEO9yCz1Fd0gS59dKlJjDph5j1v2WuDcZgBghFGHG2SLjk34tpvDgBUD9aW9LH0NV7Kd8LWTkfABuzzFzZv01hj+z05vtd9qrJdSkmPX97kPDe3znk1+/wm4XvogHof/8+/764o6IabWee9Kkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4gSAGsRoGt0bwxBkAWpzUcBD8iD5MHCWoXZdcWOyV0=;
 b=R+z9CSva9fA6tQCYxLE0TTnop0a2cpUOEGv8Zongv80or6vGWF+ha/R1fyrLMjkVGAVivlC1hRaSWGy1TGhvy7+F6Czh/X01SujcwtDRkHUeTZoUJdH8npV4oZOcYplaBiQvEBjGQLXt5ezya/aZfPH/6PPqOwlFVT5geGFGsAk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 08:20:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:20:23 +0000
Subject: Re: [PATCH] qemu-img: Add -F shorthand to convert
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org
References: <20210913131735.1948339-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <521c8ce6-1f9e-41b9-e671-47c714df45c7@virtuozzo.com>
Date: Wed, 15 Sep 2021 11:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210913131735.1948339-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Wed, 15 Sep 2021 08:20:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca68f16a-7104-44f8-3082-08d97821a9ed
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1843:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18433CD1F80B9E74671EC92AC1DB9@AM5PR0801MB1843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OX8rrfpZU4xdw3gO9kqn41Qqj20MpdKVgVHS2Zo6jSsmhmymX1jN/2hzh+clmUaAsRhWRx/HmPBVcozEcNBtXXScQtbPto7q1qCvTcYVMIt5cVLtRhJW4FPFh8EFyFCQo8kHRDfk9v+DcTBX1JmagVHut4ObQjOKr0gLPwGHkDPgpBUZhrX1z0bHIvRmJ/jPVbNc7N4DQoR/ovP7mfkBe+zLgAmu6Br/V9R1YZ+hqV10H5hvpJTGK8wv6LBWN0DJPIyFPjN+F3ASoLPg/dQr/SvWIJEi2q6Ar/GimLnLCaY9p/kOiOJ7iVdKVLjbMyi0IauAgVP/eMc62F2/uMmQ6XwsHPL36L5cihIagxdmPunfchCP0Y76SOq8lCDdCRGCyVEFcY/vq6fEQoNGq1cK54CXiVWLj9Dz845uQCLCA75RR5RGWSXfS1SNdQWoVOhM3jxbNpssQTSqHyON0Vq3ulSg7A7YPK1NAxmPD2Tf140AA1c/epCgIlKRnRcSo63IXOhpowva9t+Of0Qu3FQMxgnUsWpMaO7SpSrZaB7geopRe3g/nOJhdIPJihlAqzgGVQoCLB2UpedH2neU0h7sJhyrbR2TsXLo6fkXqTSHYl4TXIgktfJVoEXGVVAp2XFCrJknfvQRg3FWNcKlSC+ysfqcwvNI23pAW98FAIeq7d/vX0nkNxiVmo5c15+GJD0TK/1QuRzFdqhs/uNSuNDNxC4MmFy0qQtaW6jn+y05TS7EuTvNUfWNqkqOD45Isw4k/KUt7/pvfOaqnqKOPrOKug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4744005)(26005)(186003)(86362001)(54906003)(5660300002)(508600001)(8676002)(83380400001)(31686004)(2906002)(66556008)(956004)(16576012)(66476007)(52116002)(38100700002)(66946007)(38350700002)(316002)(36756003)(6666004)(6486002)(31696002)(2616005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allOaTYxTzd4cE9YWERTeEpWYXFMRTVCcTJONWZlZnlqOVpkU0FuaWU3WnE0?=
 =?utf-8?B?RjNZMEcyOFk1UDJvWUdhNFpsd0I5UjE0ZE00OUNsd0xNV2hwUWtLVitqTUVR?=
 =?utf-8?B?MTg5WnJkK3Y2azVQZmsxSzZkQ0tSWXNCMWp6cm8zemVRbW1ERUlZS1dFSklw?=
 =?utf-8?B?ZTVtc2FwY2RiWENZN2p4RWlXU3g1QmVPQ3RTMng5UW9zendPalprM3IxUDBZ?=
 =?utf-8?B?bk9XVENwZXVRMEdsZVdRdkphV3c5N3puRkRjYzIxMk56MFhBYXFCU0hreEVk?=
 =?utf-8?B?MDRtakt2VVNtQ1FIYnhodjdSVXpIb2o2Q2dPRWM1VWt6cksrNkt2QUE3SDJP?=
 =?utf-8?B?eTM1U2JMUm44MkZ6RjM3QVJ0bEl2dUV0WmZNa0I5KzJ3YmorRDBxOTNZb1p3?=
 =?utf-8?B?NnBLZVU3VEszazUrU1QweVJPYSt6SXhqZGZVRWFoSkJ3K2hpby9ZcXdlVFll?=
 =?utf-8?B?OWpBeDVnM2UrYTBvbmtHZWpDZmFWYk9HcGE1cWtTVGRLUWxPTFR1V2JEYVc5?=
 =?utf-8?B?T2Q2T3hFa29aTUlpK09ONkFlU1FPVUVESzBhWFlsS3dhWUtIUGZwMmtTY2JZ?=
 =?utf-8?B?TlUwdmlLR2tCVTR4czBoTlR0ZGs0L25Od09yVG92SnFUcTRRWFA2ZFJTdkoz?=
 =?utf-8?B?UlV6S1o0bmphdXh0ZkVZYndxWUhQZkxnTXlpbkhtaFFLZHBld2FDaTk0WHJQ?=
 =?utf-8?B?RjEwNVhJMmpGOHNrY1YvNlZ3eFBXaDFOSjdVQ1I3Ly9rVDFxZE82blV3dFlW?=
 =?utf-8?B?Zkw5SnNpTXJhcGwwMndCQzFDd09lK3NrYlExVzN5Vm9BMStDV1JDZVF6UnNB?=
 =?utf-8?B?RkZkS29UQlJrcWtUSlcvMjExTnUrSDVPUUozTEwzMHk2c0txeWVvVVJkbVhR?=
 =?utf-8?B?L0FUMEtxUHk2dkdldzcwb0pWS2VmRjN4cUdrNENMYTdHdnVpN0JNRzVLR3h4?=
 =?utf-8?B?cXk2RWFMdkNSV2VNaDBpNDNyZGpiQ05FejZoV1RWaCtsTWRxK2xKTzUvTThn?=
 =?utf-8?B?YWY5eUsxZDZTa3JZL0E1T3ZXUCtVR3IzOG1PY0RaVDE2LzNnVHFGUUpieTBS?=
 =?utf-8?B?bkxic0tnMTlPQTVpYzZ0RzdwMDlNYkxta0RBMzJrbW5meHdPQUo4NlUwTjZw?=
 =?utf-8?B?Vk5IdlUycXB1dnpyUWUrdXVjYk0xbjRKVkRiTW1nejc1VHd0anplNlJPc3hI?=
 =?utf-8?B?UXRwbTE1WGdUM2V0b0Z5WHFXTHVWTDkvUDBNMzlyaTUxamRkMWhaTU9XYWhB?=
 =?utf-8?B?WWlYeXpCTzlTOVVFcmdZNlpDYWNheVFlODhDc05zaU8rd0U3Uy9ZRXVETFVp?=
 =?utf-8?B?T215dEZiOFVHM1VEaFZzZ1N3T0dWRVhTKzRwSVV4enJYRnk2ZElCZ1BEaWhH?=
 =?utf-8?B?a2VXcVBycHJ3YzNwZWx4MnpGcHlFcm1YR3l6SU95V3ZsSmszL1JTS0xsTi96?=
 =?utf-8?B?U295RUlWaHo3NkJjRDgrTzdPd2pSMDdTdEpvSE1xcnE3dkJwL3ZBR2VEMGds?=
 =?utf-8?B?ZHhWRkFtaHhFUUhkb1FsK0M3QmZVSFYwckdwellGYWpteDFMakFvQnJyd0ZV?=
 =?utf-8?B?cUlxeXg2M2dSUGlBY2xUR2RocUhVVW1Vb3VkdmpFUUYrSC83SWtpUEJaYUJ0?=
 =?utf-8?B?S2Yyc1dFTDFUajlEYkNBbnpmNzFkM0krZVhET1RHQ1VoQTZZRnNuRGFsUnFN?=
 =?utf-8?B?SGtNZStwS0c0dGVLSHJhY1ZFNnhOeVp2SkVQdUpEaEYzSWtzeUt6Z3lXV0wz?=
 =?utf-8?Q?xQLvXLYMJPO+cKfFyI0mF5WbTJ0Sg/OQ62tAD0O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca68f16a-7104-44f8-3082-08d97821a9ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:20:23.1909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FtSMdeNDhQEAwBqGAycYGplcKpj1c4r1mkLqSU5XWSW3PqkMvORRUPYtpz2VyGpg413yWmn9JnOK5OtRwG/t1QmRCl0fdSKXtWqho0eu58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
Received-SPF: pass client-ip=40.107.22.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.09.2021 16:17, Eric Blake wrote:
> Although we have long supported 'qemu-img convert -o
> backing_file=foo,backing_fmt=bar', the fact that we have a shortcut -B
> for backing_file but none for backing_fmt has made it more likely that
> users accidentally run into:
> 
> qemu-img: warning: Deprecated use of backing file without explicit backing format
> 
> when using -B instead of -o.  For similarity with other qemu-img
> commands, such as create and compare, add '-F $fmt' as the shorthand
> for '-o backing_fmt=$fmt'.  Update iotest 122 for coverage of both
> spellings.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

