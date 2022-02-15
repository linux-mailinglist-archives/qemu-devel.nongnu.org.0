Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C864B74C5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:45:33 +0100 (CET)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3lS-0000Rl-7o
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:45:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK3Zd-0005R7-FO; Tue, 15 Feb 2022 14:33:17 -0500
Received: from [2a01:111:f400:fe1e::711] (port=60645
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK3Za-00077m-Cr; Tue, 15 Feb 2022 14:33:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFhYo2/LOA/8iZkrq7somAaHjMYTE1Ahs3UlOXgGcol/HeRlYgZkAL3ruxYGOq9UfcFSPG0uxGM4ULN1D+Cb2CgqFwzr71toy8+Iaxx9sy7mI35lAz45Yz/r49AFvsS5Y3G1rTgvJbqN+S1SdnjO+6bRACEniJfFJ6wlH5Ei69xLw15Ubjp2G8ZfWAflSiFNAQCQ+0SYd3TyKGstw7G68rNKPUwJLuUbmOTenP30+2apRyD48op4dmx2lyVB16FsKjLrDsakSjLEQU2BhH1QP/0fJslCVUcP38kvoI0yZKoLxV0Xd/i95dguC+NMan7JaR2+kPNldKZ1cLS3PvFZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACLER0fgdOV2SxuuUiPs59GETJaJod5kvFgGyeA1JLo=;
 b=jbTJLHAaYV6CIWyorqjgots7BnFxm93gwtuVkQBSgbMh5UHYsnM0zorir5xr+0IVAQ3uN6u5e5dUqVlCYqAQXKq7VjBVVwWJSUaUyEmyKD4WRAkVf1/p+zMOsf740MEz7WkO9mle5LZHdVevaHdAaLXdIhoUABC3ChVrAI+oozsjsgq/Er2iR8qLOUIxB9ZkciF0ApoTc1pTMAfVIiJNfshh8ShSdRylFCuWNpOvuLBKAVuCy39TwqIzjKWgnP707YzHRE/Kb7juYbEzTeb14/qMKM+y7+Qoi/CXnKpyVTb7pZ808X7WaF+7awLXn42MHPC++6JHBfsYOxNJ87h7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACLER0fgdOV2SxuuUiPs59GETJaJod5kvFgGyeA1JLo=;
 b=otbUEmn3VdcOVTp6QkNJN0z2IlnaadcFjlks5M9YujGJHViRyH36U6dn6Bec81H+niug5yvNgrtucFq7AsfYsAoL9xy+cCX1PfZE1OnYHt5uWD1UjsOFMkbAAQTzjGK/XGfK+56Bcmc1hSwXg3JhlhHOiUWKkmpUhmHfKu/ERhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB6201.eurprd08.prod.outlook.com (2603:10a6:10:20a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 19:33:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 19:33:09 +0000
Message-ID: <e1d3fb0e-f47f-5037-0d65-9836c13b4066@virtuozzo.com>
Date: Tue, 15 Feb 2022 22:33:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: rjones@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220215171838.2651387-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99979154-2a20-44d9-f10c-08d9f0b9ff32
X-MS-TrafficTypeDiagnostic: DBBPR08MB6201:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB6201FDE6777EE0DEB368034FC1349@DBBPR08MB6201.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78nXfJbNlAQOkShFlbbPMH9uOfw+RSQOYPqgcMZWB1UxXNq0UdgEO/JuRbKbP4JQfj3Zd2wzRPOWg1iuq1YTxu3RhYwH95bjpKRcRDlnDreVj4b7LP+c8C8h2DE3k8sbwcU/7YrLX9MsFi0XBTO9y4Eo9D2JHbU9vQ7n9xWmuI+wlaGCGV6/2/u7SfjawdoqaC+ZSF+VN/qjVxFfUkxlW4mqjA6U7FAgs5PZ+6B7GEi/0hVKtbcxjKXB5TNfGH6Og4WKZCAQSSJrMzR54QQjbhrMv18tsgSroysS0T0Q+v4eMQ25MgfikJVyW4n+7Ip6avTftId0JKYl4gKBODsfhqDqwdEK8cc3x2ZL2jHIrYprjvnR+g4NsPA4o0ytXTq9I/51ozOC4mxVoJwUpQWChAexU6o477u/k9TBjgj47kmCYJ/zNtL6KGsSiMvs4xPy/Bij6Ih1m7WHRTZVnqd6kirr3LtxdUE2Vqdxbld1/g0V7WHIIAdSmWW0y+7KLG3+LLL+VxAzvq+AkSm1orZVTSHluXyhn8xXhbr+mepEs+roa+DhRWj1OZyHceGjBl6iMRqHnavGjV3OPa+cgj/wjBNJIY+oMqmHHqgT6Tb6Al9abC/njxPGcPu/ebKgilszLWxI57ULQ1Y4GDGQhP8QWH99RKpjk2gzktzFK/V9BxlmjQCtpAk3qNfyKb4XlQpK61LYjDUymKappkExmjoGabLKVD5JUfBotK5BpuSxrC2RbK/nlDBsP6oLAw71H4nzlJJIrcdM3WFafMpcbXL+8MOYEsgRlxn4cqNjh/0ar2Njt/jcsxLjLKi415VEz6iPD2Zs0i3b8f6coxDggRHtESyNVbwFSBtBH9xjby/a9Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(2906002)(52116002)(6506007)(186003)(38100700002)(6512007)(38350700002)(2616005)(83380400001)(316002)(31696002)(54906003)(966005)(6486002)(86362001)(36756003)(6666004)(5660300002)(8936002)(508600001)(66476007)(66556008)(66946007)(31686004)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vyt5YUFpZ05YN1EvZEdYWEdEQkZ5Tnk4VlFUTVdGYUE2Zi8rQ2pQaFZiR3FC?=
 =?utf-8?B?Qk5OZU5VenpXZnI2SWVQNHhGcTZaM2hxaG9MMWdXOHVYOGRjdWxvZXBSM21z?=
 =?utf-8?B?U1FKWW9OZWM3OXZyNEdIY00vd012Qkh4MDVEeEFzTXdXb3FJbEdiMDRJRGh3?=
 =?utf-8?B?dnNTbzZIZUJBUldteGgrbW1MZlhsNzJwdDFSRm15WFdrS0JoajJHWTZqOE5V?=
 =?utf-8?B?Z1lDeGgraGFkYVRYY29hazludS9YZXpTWTZkNjBZNng2S3hLV0hrNGpVWW1n?=
 =?utf-8?B?TmVWQUo5ZkI2a0QyQXhid3NFc3MrWmRDWit4ZTFRM3ZiSWtCek8ySVNYU21m?=
 =?utf-8?B?RS9YUENTSlpJY1dyaVV5dXBTRGk5cXhzVGo2a2FVSXpvbjNlZEkvd3J1Rko4?=
 =?utf-8?B?NDg5YWpnU2c0aFBuQUMrTTNvZE9KbDlqWjRZTkxJZ1lXVnZ0TFNyRE02N1Nj?=
 =?utf-8?B?ZDhjUnpTNEZQNzhySGg2VVJIektYdFhRTmpWNVhTanBmSFZmUHN5ZG5uTkRO?=
 =?utf-8?B?UnZoWWRiK3hwYm5pcDZTS1RuMkN1ektjWUdIVTlyY3VrQ0FSZWRzbVZJTnJY?=
 =?utf-8?B?bFZkSnk0eWdXZkVRaFpNNHBXRE5OUDUzelBwUHJtbHZWM1VQbmlrS2k0TW1V?=
 =?utf-8?B?TzhvcTdocUI2cjNqMHF0RkRSVUxFRmZONHZabHNQdXpiYnhvU2NkWS9aMnFL?=
 =?utf-8?B?aFVZOUpFUFlBSUQwb1hBbnRJRkYwL1V2NG1vTDdES3pLb1k4bTBvM01FWnpL?=
 =?utf-8?B?YkZ0UFZOcGhvd3JnRk0wd1BEZDYrRmNPdHlhWXJaVTJIU1grSC8rYTdaai83?=
 =?utf-8?B?bEN6ZlhTZHpkQ1ZyQXN1MHNiZzZ1SUpuZUJxWExMdHkxclgweDRTeVUvQnVS?=
 =?utf-8?B?VGFIZjdzejUrak9wL0R6U2hReFBxdHhpTUIvSVUyYTJpSVRRYVpkbXpiRk1x?=
 =?utf-8?B?SW1PejlKTmkrRHAxN0s1ZUNUSnRtZGJQUmxBNzM3YStBV3QrVXJTRFljcWt3?=
 =?utf-8?B?WS91ZU1nc3I3RUpjNHh6dW5wM0RHTnd0NTdFL011WWNiOHBZa3FHYmZrU1FH?=
 =?utf-8?B?NXh1OEJ3VnBFVXo1YkhRbnBJa280SkRWcWZpbUluUkZ5NDJuNDVFMEc4L25G?=
 =?utf-8?B?ODFwZDJUV3pOd2J1YmlybGtTaHZSSGFacU04c2JWY1E0R3pTa2E3cmI4RE54?=
 =?utf-8?B?SGtiYlg1Qk9GQjVuU1RHWkZhRGVkSzF6S083MDJUbnpobzd4NzU4Q2lnR004?=
 =?utf-8?B?U2luSkZib25MSDFBMG9Kczh5UGdDeGF1RkFIMzVLWmZMUTlhdWVCNFZVVTNz?=
 =?utf-8?B?SFovWk1zYTMxQ2FxQXRqSUdpbTV0ZUxCNzBGNjNycUtHN0xDSVdTYml0TjFE?=
 =?utf-8?B?QzRRcHpyVlo5ZktJK1FLSktaTnBOMUoxbWcvTWRPWDZIa1pnUGRBSXFqTVds?=
 =?utf-8?B?dlE0dGErU1JGd010UzlyZEROcDlKM3duOWVreUdsaVk0TG0zc3NoTVJ0dVQ2?=
 =?utf-8?B?UzVkdEZKVGhZRm1jWG1xTG5GV1U2K01GT21XbEl2MWJFVkFxTitmR0JpNkhW?=
 =?utf-8?B?ZEQ5aXZieCtEQVNDKzI5emdhMWRsREFUemZUaXlySkJvbmZFZ3AyeHBFY0Iz?=
 =?utf-8?B?UlRZMjR5TDhpWnlHOGN3enlQM2pUNWdqV29lNmpkR05sZmZ3b3czYVV2ajZs?=
 =?utf-8?B?VUhvVmF3M3dVUk5wdUJuUlB4M2U4MFNvUitYb2VIRm1XYkhlSHAzUEw2NHZa?=
 =?utf-8?B?UysyUUM3Z09SR3pQZFNCNzMxaVZwSUdaZTFBbWtBZS90c2FYdC80Y3RlWnVS?=
 =?utf-8?B?THNPVzBXdjYweUlWcUVLbnZ4ajJxdlVYR0JzdGlhcW8xZXRMciswM0Y3bEVR?=
 =?utf-8?B?eFRzdWpSdU1JT3M0dnFFVVVvMXphTmx3bjh1SDlpcy9SMEkxUUNBMGlTMmtK?=
 =?utf-8?B?MTE0MlpGM2llU3FyKytVVWxsbWZzc1hIdWc2dFJzOEdhUHZJMnlJUzFEQnZJ?=
 =?utf-8?B?SFY2aUgwU0ljOWZFbnpOa0h6cVQzZE55TE5SQXEwQm5TNFM2ZWVsbGdIaWR3?=
 =?utf-8?B?QXVTb0t4cUtEKzQ2QzUrMmM4bjQybTFvZEFab3BHbkdZcW9VWDhnb202Tkl1?=
 =?utf-8?B?MVJKbkhScEppSHIvN1FtaUNvUy9xMHhyTDc0NmNnbUFqcXF1UTFNMFBQMENO?=
 =?utf-8?B?eEUxaDhaUkdneWNjOHZYUmFFV1lOWmFkYVBBdjJ2RWw0dDRHeXlSZTlKQ3J0?=
 =?utf-8?B?dGVwaVhhb0VHMFdJbi9RTG5VUEx3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99979154-2a20-44d9-f10c-08d9f0b9ff32
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:33:09.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRVxquhs+Gc9CDZ6qRQkY2fl+AjmOa0nXhJstgHmDKQC9v4SjDkM4iXOcADYP4cWQQVwlcFlrL4XOI7Pauf+AgtwM9y6FJwBAM4RzeUa8MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6201
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::711
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::711;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

15.02.2022 20:18, Eric Blake wrote:
> According to the NBD spec, a server advertising
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu when our block layer is backed by the local
> filesystem (by virtue of the semantics of fdatasync(), and the fact
> that qemu itself is not buffering writes beyond flushes).  It is
> harder to state whether we satisfy these conditions for network-based
> protocols, so the safest course of action is to allow users to opt-in
> to advertising multi-conn.  We may later tweak defaults to advertise
> by default when the block layer can confirm that the underlying
> protocol driver is cache consistent between multiple writers, but for
> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
> advertisement in a known-safe setup where the client end can then
> benefit from parallel clients.
> 
> Note, however, that we don't want to advertise MULTI_CONN when we know

Here we change existing default behavior. Pre-patch MULTI_CONN is still advertised for readonly export even when connections number is limited to 1.

Still may be it's a good change? Let's then note it here.. Could it break some existing clients? Hard to imagine.

Otherwise patch looks good to me, nonsignificant notes below.

> that a second client cannot connect (for historical reasons, qemu-nbd
> defaults to a single connection while nbd-server-add and QMP commands
> default to unlimited connections; but we already have existing means
> to let either style of NBD server creation alter those defaults).  The
> harder part of this patch is setting up an iotest to demonstrate
> behavior of multiple NBD clients to a single server.  It might be
> possible with parallel qemu-io processes, but concisely managing that
> in shell is painful.  I found it easier to do by relying on the libnbd
> project's nbdsh, which means this test will be skipped on platforms
> where that is not available.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Fixes: https://bugzilla.redhat.com/1708300
> ---
> 

[..]

> +##
> +# @NbdExportMultiConn:
> +#
> +# Possible settings for advertising NBD multiple client support.
> +#
> +# @off: Do not advertise multiple clients.
> +#
> +# @on: Allow multiple clients (for writable clients, this is only safe
> +#      if the underlying BDS is cache-consistent, such as when backed
> +#      by the raw file driver); ignored if the NBD server was set up
> +#      with max-connections of 1.
> +#
> +# @auto: Behaves like @off if the export is writable, and @on if the
> +#        export is read-only.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'NbdExportMultiConn',
> +  'data': ['off', 'on', 'auto'] }

Probably we should use generic OnOffAuto type that we already have.. But in your way documentation looks better.

> +
>   ##
>   # @BlockExportOptionsNbd:
>   #

[..]

> +
> +_make_test_img 4M
> +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
> +_launch_qemu 2> >(_filter_nbd)
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
> +  "arguments":{"driver":"qcow2", "node-name":"n",
> +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
> +export nbd_unix_socket
> +

[..]

> +nbdsh -c '
> +import os
> +sock = os.getenv("nbd_unix_socket")

Just interested why you pass it through environment and no simply do '... sock = "'"$nbd_unix_socket"'"... '

> +h = []
> +
> +for i in range(3):
> +  h.append(nbd.NBD())

Looks like Python:) And if something looks like Python, it's Python, we know. Should I say about PEP8 that recommends 4 whitespaces?)

> +  h[i].connect_unix(sock)
> +  assert h[i].can_multi_conn()
> +
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 != b"\x01" * 1024 * 1024:
> +  print("Unexpected initial read")
> +buf2 = b"\x03" * 1024 * 1024
> +h[1].pwrite(buf2, 0)
> +h[2].flush()
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 == buf2:
> +  print("Flush appears to be consistent across connections")
> +
> +for i in range(3):
> +  h[i].shutdown()
> +'

-- 
Best regards,
Vladimir

