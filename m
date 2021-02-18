Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A8831EA8D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:48:54 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCjfp-0002hx-Rt
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lCjez-0002Gl-Fz; Thu, 18 Feb 2021 08:48:01 -0500
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:53534 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lCjev-0004P4-4L; Thu, 18 Feb 2021 08:48:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3OWMG+p1i0vXxyKIlVAfO+YXKcft1nfhB+QX50c+o1/JaHbbMBd+0q4Fl4ZgwgfJtvndtVBTmLO9kYJgBkWubnRzE7IwEXLpSatopL94fYAfhLxexFl8ZAx38oNjm73Rjw6ANThXh4JETBdiq7n5oeBjotWfNXSCk485Q/v9zzb4ek/EVHKp8tZUGWV5VhzkLu83IrXEHD+NNV1EWbriNZkHeVZs8cCU+Uo6eidonuX1zg0cPEZdjLMSwHnKNu7eX7aqEXnvbysiVobqT8DzwJWEOiM24MvzDOIRrZF0pfBAdF9lw+c/c3f5rJ/RhfQS3ExspG3cpxw2Xg2WirWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOHeh5Y3bZj9EK9RzkAqzXH3HnhceETka90nZGU9Njs=;
 b=KVg0V/QWiZVko+AhzjvgyeA1FSa3lnlUGT0CAVhVQoK12riuWJGIE+L7/vtji/mALG3Ti+ZyU8EtEVhnvKVMDi20RKl/3Z5uwYJEMy+uWyZIDXEJB80i98b6e6GFU5I9e7d/qQ+IpyJnJu1VRM1r7grv3liYPC/8TV7nFOAwZY0szkDqYj2Y4wBTirpmcDHPpjFY90Xg5HhApFZhuuOIk7jxJ8PoZiSut4AgDojSxhgdqxpxr2qd+lbaJNJulfkiQF3fFmwe1kj8xPP+slbZUxGawNNnhlldzvNaCBQqGJpqKN2KU9zKGz3pwLqsU8/uCVazSG9mLKvWSuptbo91ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOHeh5Y3bZj9EK9RzkAqzXH3HnhceETka90nZGU9Njs=;
 b=Gm13hTky9ACftuaNPSy8VMKKDBeS6sjj4nkF8KfMihzlDyDX5te0KbxnGwRVmk64pMU+afXG8qIxdFrz5Y/4m7TKOaHz1KlBrZFSy5nyJGxecXT7gRRLbvT9lZ04Zr/b7Xxg9Iml9ayJnbalx8TMlLZ2b2pGaeKKb9CdDvi0sUQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB3862.eurprd08.prod.outlook.com (2603:10a6:20b:8c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 18 Feb
 2021 13:47:52 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 13:47:52 +0000
Subject: Re: [PATCH 2/5] parallels.txt: fix bitmap L1 table description
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-3-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <c70b43a2-7aa1-ea43-9c12-9adffff03733@openvz.org>
Date: Thu, 18 Feb 2021 16:47:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210216164527.37745-3-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM4PR0302CA0012.eurprd03.prod.outlook.com
 (2603:10a6:205:2::25) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM4PR0302CA0012.eurprd03.prod.outlook.com (2603:10a6:205:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 13:47:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 368f48f2-8722-4763-43bc-08d8d413c919
X-MS-TrafficTypeDiagnostic: AM6PR08MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38625CFF6BB79D0C7FAAE3A3B6859@AM6PR08MB3862.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2wi1F88lEMxXPT52XtkGTaFKlOkJ8hdedd+T5XcYSNM65BataLsn5I78RHF0QtqKDwiHFe5XJ09O8lgj04eq/M/mHtYfZGqKgUPz5mfA3RuAez6yrLD+BJiUwX50Dof0dVTrCemZ62PVkjzizultVEeNFCk7FlMk0k1Ei7J8izhj0ENGscuRrAJz4XWS2ZpfMuS4zsCdM2oruaHyIug55Ei1I6Lp2Gg3ZuU0zUsp0HKPuTwC9PTYZdhw+bOSo+tEq2wPFSZntnOnPj6OI21sLPdb9mdY7tAgRalI9dyk33h8XGvDtX7U21NETBRy2Z/Tsa1qqNMVGpWft6P97IFzE0wXtuygiBKs6bOsQRRK2c9wLvRCkZJ5JCrY+flaVu/U8xuPjf7DJgvMSjEDM7RcTXptYX7/ovKz2PUJxLnb93oL0H97RpdCNzclH6xcyP4//0fmcea3w/SXPIlp/jTe9H1V4/rY6CjtvMfs1wWWunfz9ovcPY11gXu3cvcqE7tps8vAt2OYiLuvnJgofIXG/kiN4KEdtmUP04safIzU6UI1wZrN7PxbR1vsfic/j+iulXDH+ltkD8jIe/Fenu4DsmaFVOmX+TpN4kVydc9Wdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(346002)(396003)(136003)(376002)(42882007)(2616005)(83170400001)(186003)(5660300002)(53546011)(316002)(36756003)(8936002)(6486002)(956004)(52116002)(83380400001)(16576012)(8676002)(4326008)(16526019)(66556008)(66946007)(66476007)(31696002)(2906002)(478600001)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MG16cUVJTTdybGswSWNMZks3ZzhnYTNGLzYzOWVJQUt0ekI3MGhwTlJ2ZnVq?=
 =?utf-8?B?Q1RVa1Q5MVJhc05DNGlZYTJoYnNhTU03SFZVdmppaUpyRkY1ckI3WVM4VnRH?=
 =?utf-8?B?VlFwbUdQa2ZWR21TMlhscm02a24zTUpPSVNCK3RJczhPbnNxa1cyTCtHR3lU?=
 =?utf-8?B?RThRQm1OOTc0TGN1Ykk1ZUVoeVJ3cWpwZWFGSzFNeTRrSDVLZFFobWJPa2VI?=
 =?utf-8?B?eDkzNGg0dkhNR0tRMnBvMTNwNGFoL0Q3MjJYbEpFUVluR0dvMTlzSDYwVUlw?=
 =?utf-8?B?S3RRZnB2TlVWTmhKMytJM3hHYUREVmFXMmw3SEdHVFc3cHBZVUF2dUE4VFRH?=
 =?utf-8?B?U2xJUGdSM1kxcVU5SC9aL0tadUZjWURXME5mbmJVVDJBNHdYUkRQcjRTd3RK?=
 =?utf-8?B?YkVFV2srUFVNVEcxYUlRM3Y5TU44OHRGbmk1b2l5d29tZ05NOHlNcjI2emhp?=
 =?utf-8?B?M1JaU2hjZE9uZEtRMlRBa0JxQk95clpMMndOUUp1RDhzVUsyVFpRdWdUUWM3?=
 =?utf-8?B?ZGZPbzRwUFZYdXo0ZEFwQ0FxOHVoSFA0ektTSmlYbWswRjV6V2U1ME5DVllD?=
 =?utf-8?B?ZVNoWmQyWlRPUmVpSHNRcjF0V0NRdCtab0s1VHlzUDFkanhQUWxWOTFTcmVP?=
 =?utf-8?B?QlhObG1UQmtPNVk3SndEc1hCMU42VWpXMUhXNXBTajVlTFNKUU5wQjFrTHNs?=
 =?utf-8?B?K3NRK2t4a2hXa0J1RzhUWE42RWlhYkRZY2lydDJEQ2w3cmhCSFdsMnNJdm5Q?=
 =?utf-8?B?WFBISDBSallMNkF6cjNHb1NKdTcrL1J5Ri8vanBnWWc4bi80cWt4V1NpVmdu?=
 =?utf-8?B?dHc5M2pQSHo4YndwM2JxQVdFalU0ZU1yaHFxc2RQcTJoL0FXYnNXU2FPVEcx?=
 =?utf-8?B?NHVRRmJRcGV5SkNEZlRhVUJsREt4UktUTTlQVkxySlc1OWNQVE8zMDdzRUcv?=
 =?utf-8?B?cFR3TzAyN1QwSEtEZUYrMWhBdE90SDUvVDFHakRQT1RLV05UUDcwMTN1U1hZ?=
 =?utf-8?B?Z2pPR0NmU01lMENrRWNqbHV5YkJkWnZwUjJzMndLekw4NU9ma3ZBQVpzLzRy?=
 =?utf-8?B?RVZzNHJzaHIycVVSRDBtbDhmYWN6Wm1oUStTZEt2OWdCSjZYZHB0RXNOeXQ2?=
 =?utf-8?B?aFBELzIwWU9XSDFKQ2VtbmJ4ekV3bjc4S1pXQXV3RVRTQ2pjUW5Fbnk1L05P?=
 =?utf-8?B?RFlMTERaWm91Vzh5aHVzc0FGbXRjanFxSlRLMVp4Mk1tU3lpTmxtWEVtbVBv?=
 =?utf-8?B?QlhvUGh1bmlBVFlNUzRwRzhmTUpUT2ZEeVZROFhqdjMyUVpNZ0d0Y3IvYVZQ?=
 =?utf-8?B?LzBhMzVVWUlVQlZ3MXJUOFlDMjZUM2ZvZWtSTk91MXp6TWxIZnFLZWVjb3NB?=
 =?utf-8?B?RVV3aHAyWnloUkxDVUNlMUhjbXFPVjdFaDVCQ3RGKzRRWUxsWEFIeXJlRG9W?=
 =?utf-8?B?ckxkRm00LzlacjlVaDNqQ0xWeXdYYmJQTGQvYmZLUVgxdzBWZTJMMHhGWlRo?=
 =?utf-8?B?N3RwUW1UelYvNDJMcUlVbGVxUXF6QkNHbExGS2liTURzM2xwQUpMNkxtdWJJ?=
 =?utf-8?B?VjVENnhaaEhDOGM4RHhZdCtXQ2dJdzFQcHNvNVcyN0NFLzR3U0N5MHYxMVUv?=
 =?utf-8?B?THo5UktaZ3d4OHJjbktFMnJSMlpUMlJmTUJKOGpUbC9uQlZFaDlqNkxaS0JU?=
 =?utf-8?B?V2ttV01KdzZLaTY1amFDNzBLci9HbUV0N3VLekkxZDVrUm91MWlxZk9oVG9w?=
 =?utf-8?Q?P/htIO9+NXDvAOMEjnQo/lrVzh1tuzyjQS1wtJN?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 368f48f2-8722-4763-43bc-08d8d413c919
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 13:47:52.6402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/Z/wkfWd3YCV9rSSNCscYXlNWqisb6nnvGxAdPFe0xZIdRor+yUeY3KQCpS0WakRLop+xW1zfwMeEdxkIRg2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3862
Received-SPF: pass client-ip=40.107.6.138; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 7:45 PM, Vladimir Sementsov-Ogievskiy wrote:
> Actually L1 table entry offset is in 512 bytes sectors. Fix the spec.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/interop/parallels.txt | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
> index f15bf35bd1..ebbdd1b25b 100644
> --- a/docs/interop/parallels.txt
> +++ b/docs/interop/parallels.txt
> @@ -209,15 +209,14 @@ of its data area are:
>                The number of entries in the L1 table of the bitmap.
>  
>    variable:   l1_table (8 * l1_size bytes)
> -              L1 offset table (in bytes)
this change is unclear. First, we have specified here the size of this
table. It is (8 * l1_size bytes). Thus it would be MUCH better to say

l1_table (size: 8 * l1_size bytes)

or

L1 offset table (l1_table), size: 8 * l1_size bytes
or something like this.


>  
>  A dirty bitmap is stored using a one-level structure for the mapping to host
> -clusters - an L1 table.
> +clusters - an L1 table. Each L1 table entry is a 64bit integer described
> +below:
>  
> -Given an offset in bytes into the bitmap data, the offset in bytes into the
> -image file can be obtained as follows:
> +Given an offset in bytes into the bitmap data, corresponding L1 entry is
>  
> -    offset = l1_table[offset / cluster_size] + (offset % cluster_size)
> +    l1_table[offset / cluster_size]
Dirty bitmap is stored in the array of clusters inside Parallels Image file.
Offsets of these clusters are saved in L1 offset table here.


>  
>  If an L1 table entry is 0, the corresponding cluster of the bitmap is assumed
>  to be zero.
If L1 table entry is 0, all bits in the corresponding cluster of the bitmap
are assumed to be 0.


> @@ -225,4 +224,8 @@ to be zero.
>  If an L1 table entry is 1, the corresponding cluster of the bitmap is assumed
>  to have all bits set.
If L1 table entry is 1, all bits in the corresponding cluster of the bitmap
are assumed to be 1.


>  
> -If an L1 table entry is not 0 or 1, it allocates a cluster from the data area.
> +If an L1 table entry is not 0 or 1, it contains corresponding cluster offset
> +(in 512b sectors). Given an offset in bytes into the bitmap data the offset in
> +bytes into the image file can be obtained as follows:
> +
> +    offset = l1_table[offset / cluster_size] * 512 + (offset % cluster_size)
looks good

