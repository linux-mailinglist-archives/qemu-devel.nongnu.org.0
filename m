Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86136C5B5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:02:28 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMQ7-00035C-2e
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbMNh-00025U-AW; Tue, 27 Apr 2021 07:59:57 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:60960 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbMNc-0001DJ-5K; Tue, 27 Apr 2021 07:59:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYr1BAhgbtS7BnxUZSu18yUPfNEugPWMOpr+BAMSObLsvVKt5e774ubIElrNnYUUbLSiTHyb4enS0WIor9tkfhXgLsGIyZC/8bRgdHXo43TZaUGJdwUDhely6yRmBNSV8uh+m1QX5b+pAaklDVtwJ7g7MEdMi0oti1ZuqK1Dq3ytGgE4SgNc1Q9QJ1f9Pdtssu7/66dOsz9J7LfgvNZO1/o4xVwWegJFPpks4CkqmDl1vOP62RfcvzkOYNoc9JPLcjOsQtlhC7YSoHyaiE33HSPC4cI/V0+YIwCGOgwUDWYXJ6BUP6uraEc52eMDoYmaTdEhGxwSzu8vHHen7O8Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhMLhD0PfC4wOxbLP665F/rw4rNeUI2dDYD0J6THQKk=;
 b=ZoN0oFx+Y5r6D6eGJm00oUh+lI0CyZj9JFFN29uecrNjKVnFnd0kWU4qJamvXq5w9J0itYaHyDJ7Lmj3tsD7GgS5YVtRL73WsNRGQIOWpGyf/yXF+Ka/PCGZ+V4azdbOR6qW05oSP+sU6CDRXhmGD0Xh1pY3gNK5ZfwoLoCN7YliSNSbQvo2FwGytgP+PGjFOXXN+JcmnRCrohv0rmJeAD5Mv4RExcb4wQhBsVi0L+wqHo8a7aOWcIbEbnVpNhxjJM+YkblYN2mOZ9YAB7hauNT4sTCTh4tDfzB/BKP8obuQXfpIvkwWac3wVSwSHEyFCSBvqkhWP4vG0GmW/x+e1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhMLhD0PfC4wOxbLP665F/rw4rNeUI2dDYD0J6THQKk=;
 b=gGDMFaLheNC24BLXnH9+FEqfcsKhVWN3PEzByO09Wh1ynwb945A+Cb+qKGc4u9+yEV5g8CrtHLhHLjzUk9QONf0q940oS+k3PylyUcaV5Nmp/VJ4KEufh0pr4ylYR0EHhOTYQeB1qd637VvnMoZGYDpEufbPGSPIEu7mw8tyuQ0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3767.eurprd08.prod.outlook.com (2603:10a6:20b:84::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 11:59:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:59:48 +0000
Subject: Re: [PATCH 1/2] qapi: block-dirty-bitmap-merge: support allocation
 maps
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com, pkrempa@redhat.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
 <20210427111126.84307-2-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f11ccb8e-751e-1fea-b7f6-d2349b65bdcd@virtuozzo.com>
Date: Tue, 27 Apr 2021 14:59:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210427111126.84307-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM0PR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM0PR01CA0090.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Tue, 27 Apr 2021 11:59:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d609b338-b6df-4d8d-e701-08d90973f499
X-MS-TrafficTypeDiagnostic: AM6PR08MB3767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB376731B5C456481313D2499AC1419@AM6PR08MB3767.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+CRJWXRdKk7iohS5QFzkTnZOwTIWKfthkInr0NdPUeHndjrMtnMmjWyBUHh21oTYV5wuj+hAIYWxhL0ELF+n0dsZZGHVCL5dBrDnsCP7qFIB1pN2boG7f/5iraKvN38KHBNZnXA/rzwn/7cWJMNGj2cPiucUKYI8qppmSxTo8GxDG1SBKF1sDaIIG3UTU7Dzjezw1onPqi3uZG9FiVe5+6TqqGuIjLnWMD8GF1eTfPbo4nej6gADQkmUt9fOYBBy9m0JelXhs8gnvpB0MLL4VV/yC3joM2VEoC4RoNIeZoNumBQulnxN8RsilKD2rZLPWkXiQMNIs37WVkGMseCmQpIgKbpZSsseosSTD+LmEJkmqnPmzdcIC5UGLcYXrlbv+8MWbVV5E0eEk4+giTgbwwtQDEFCrfhQkWQrBehQbxe9/cgKfBd0kOaYgcxYsPvJywOWypkve81C8N4b3eDkKV4y79Ut4pBaga86FKrNyO+mNF/6trI8PnXivJtsbGDEv8V9ZmFDPtkzT+hmKYgaqRMRZTV+8JrRE5UahopES3Rd5UWxVSE4Dy5BJCoPpPnywPtxfOjmTvr0neLcAR8cwbD+p9HSTvBqONh0VJJ2SB2PuM9pHXJnzIxXzbmX8x9mzsbuHAl25/dvBaD4yVzpra2SEtyX5gwwOkd5JEatfZ5YCXxf+uKoY7AmVAT2OXDd+1k/vaJTqZErbJjiX9D5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39840400004)(107886003)(38100700002)(16576012)(86362001)(6916009)(2906002)(6486002)(4326008)(52116002)(36756003)(38350700002)(316002)(26005)(2616005)(186003)(66476007)(66946007)(66556008)(5660300002)(956004)(31696002)(31686004)(8676002)(8936002)(478600001)(83380400001)(16526019)(14143004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VnZsV1JONWZPb3VGajNCRFBKQXJBUGZNblFWbzZUa1UzTGw1elJUYnVwZ0VS?=
 =?utf-8?B?MlFodjVwZnNTRzI0dWlGUDlyclBlUTRVMndxSVhPc2F5RUhjTFNhc09VMFFU?=
 =?utf-8?B?c0ZWSWtoRS9DV1M0ME5reW9paVp5bnM5dFY2UGd6SVh3Q1YrcnlzSk5qMzJr?=
 =?utf-8?B?Z2J2RXNTc3lLQmppMU02OVEvVDlXMVNCcjhlUndtcEFOVU9JYStaWk1lMElF?=
 =?utf-8?B?SEVXaCt2ZHJJY3VjenBSenJ1TUlCK1N6aElhT3AyWWplUHNESWJiTitzUnVh?=
 =?utf-8?B?S1VWLzREanBIRVR1RTc1SkJmNkhaTC9EdVJGL1EwZ0szczhnYzBXOGxvaXBB?=
 =?utf-8?B?THBMUnlnQzkzSHc4SkVDcmpBSWp3b09UbEppTU5XUHVJTWNaZ1FiY3p5aGht?=
 =?utf-8?B?MWUyYTN3VkV3R0pIUUJvUkJzUTQ3ZmtiVjZvVGd1QWdGTGxYLzJwVDhKU1JG?=
 =?utf-8?B?S05xd2hPTzJ6akNOeE8vY1haUmlERXJRN2g4YjFBR0Y1Rm5FeFJwMDgvMEkw?=
 =?utf-8?B?anBZdG91eFQyc1ZWU1FFbDYxbkdkRXh1WmpzN0Y0eCtndWh2d1kyWjFJd1RE?=
 =?utf-8?B?clJtU3dyVzBrUXM1T3lyOVVPOXNyb3lsNzErc2dHdlgxcy9YM1JYUEsrSWhU?=
 =?utf-8?B?S1cxSVc5WGRuY0NETXF1Umg0TWphQkk5UWRSZFd5VHp6SVNzcHhPNmFrdldO?=
 =?utf-8?B?dGhGcS9LenJ3TTlTN2FkZFgrdTZBYXBBNCtWaG5XUUhlbEcybDcxV3hsWDV0?=
 =?utf-8?B?RUdXdkhmREM3a09LVDdtZFpwNEhLRkVTeEU2SXhIZityOUdIdVRzWTZqcnpu?=
 =?utf-8?B?a3RSdy9WOWFhb3YxdG9sc0ZXcy9jc3gzSFZDTm5Ddzlua0dtWDNIeVpyTlN0?=
 =?utf-8?B?ejZUWEErbWZEeURFeGZyMHJ1K3l6QkplQTRteDQyelhwZm9uQm0yaHEwTm10?=
 =?utf-8?B?OHdWNkErSE5yTlZDY0MrdEFxVmZSb3VYcU92a3A5SGJhakNIbDdZZ0svV0FM?=
 =?utf-8?B?MFA3MDNhMVExVDcvYWxJSFM2amxlSDg5UkRISlBGY05PaXBWekpYVERCZllB?=
 =?utf-8?B?QjBuYUpkaWJDcEs2VFZORllHOWhQQ1IyTnJyRFY3MmVNNVI1YjlZK1psQnhE?=
 =?utf-8?B?UlpnZkw1ajAwV0tneWM0NlVKaWt2TkszNzJ1d0MyWmNqaGlBNnZrNmRhL2pj?=
 =?utf-8?B?YlF3a2JnalNXVXN3ZkxpM1dDdi9VV2ZPK0FyS1MyZnJGYmtjK1NIaVhmZHc4?=
 =?utf-8?B?aGowUG9uQUlXVGErQzJSWVd0VENMSHR0SEVrZ0o5aURRYVdITWMzSXMrT3Rl?=
 =?utf-8?B?Q3E1T05Yb1BWQ2VRZmpMWmFDcC94OGthUVJ1Yjh2YXBLWGFnWGhUUGRYZGRJ?=
 =?utf-8?B?QlpnU2NlalUza2ZDT040MnFYb1NOQ1VlajZyN3VyREJmTHQ1WjZJb2xnY2JL?=
 =?utf-8?B?eG9VYnJXcVY3WHZyWXlTVUE3M0FiU1F3S3A2ZGxBeGpSUUlCbjNOdXdScnMy?=
 =?utf-8?B?ZEpXOEdUUDdCNjhucXpLM2M3WHBRVlJ6K1JOeXNLdUl6UzFJVERpYkU3OHFr?=
 =?utf-8?B?bGFuUXZUNFBvZ3gzZ3hFQUJVQnVxMWxnNG14M3pqamNVTmZTZFpjaC9PeGto?=
 =?utf-8?B?RFdoVmc5dkRqMng5dUdRaC9HU1p0V2RhOUlZakIxdS92RGs0ZkxBUklwSHg0?=
 =?utf-8?B?N2tFWngzajYrMmhFaG5ESnp4YlFsT1dQdWRRMWpoenQxd2p1b2t2MGNIU0pR?=
 =?utf-8?Q?1sL3gGGrbobkD2bJi+dlpPwfLXCMB1B3wbfN3u3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d609b338-b6df-4d8d-e701-08d90973f499
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:59:48.0531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciyACFSz+4GXtDUToTuWbZ3xGAp2Zb7ff+RvyBVlTtkAcq78o00fCDYiiK/zUZdqgjUk9J7ikAFzmnWLwBOFHg41xhi69AC4Akgab+sxYRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3767
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

27.04.2021 14:11, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to merge allocation map of specified node into target
> bitmap.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json            | 31 +++++++++++++++++--
>   include/block/block_int.h       |  4 +++
>   block/dirty-bitmap.c            | 42 +++++++++++++++++++++++++
>   block/monitor/bitmap-qmp-cmds.c | 55 ++++++++++++++++++++++++++++-----
>   4 files changed, 122 insertions(+), 10 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d227924d0..0fafb043bc 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2006,6 +2006,32 @@
>     'data': { 'node': 'str', 'name': 'str', '*granularity': 'uint32',
>               '*persistent': 'bool', '*disabled': 'bool' } }
>   
> +##
> +# @AllocationMapMode:
> +#
> +# An enumeration of possible allocation maps that could be merged into target
> +# bitmap.
> +#
> +# @top: The allocation status of the top layer of the attached storage node.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'AllocationMapMode',
> +  'data': ['top'] }
> +
> +##
> +# @BlockDirtyBitmapMergeExternalSource:
> +#
> +# @node: name of device/node which the bitmap is tracking
> +#
> +# @name: name of the dirty bitmap
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'BlockDirtyBitmapMergeExternalSource',
> +  'data': { 'node': 'str', '*name': 'str',
> +            '*allocation-map': 'AllocationMapMode' } }
> +
>   ##
>   # @BlockDirtyBitmapMergeSource:
>   #
> @@ -2017,7 +2043,7 @@
>   ##
>   { 'alternate': 'BlockDirtyBitmapMergeSource',
>     'data': { 'local': 'str',
> -            'external': 'BlockDirtyBitmap' } }
> +            'external': 'BlockDirtyBitmapMergeExternalSource' } }
>   
>   ##
>   # @BlockDirtyBitmapMerge:
> @@ -2176,7 +2202,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-merge',
> -  'data': 'BlockDirtyBitmapMerge' }
> +  'data': 'BlockDirtyBitmapMerge',
> +  'coroutine': true }
>   
>   ##


So, what I propose makes possible to issue the following command:

block-dirty-bitmap-merge
   bitmaps: [{"allocation-map": "top", "node": "drive0"}]
   node: target-node-name
   target: target-bitmap-name


I've discussed it with Nikolay, and he requested a possibility of querying allocation status of base..top sub-chain (assume several snapshots was done without creating bitmaps, and we want to restore the bitmap for backup).

So, we actually want something like

block-dirty-bitmap-merge
   bitmaps: [{top: "tpp-node-name", bottom: "bottom-node-name"}]
   node: target-node-name
   target: target-bitmap-name


-- 
Best regards,
Vladimir

