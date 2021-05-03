Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66507371492
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:51:25 +0200 (CEST)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX6i-0006e8-Fv
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWzD-0008Io-Fd; Mon, 03 May 2021 07:43:39 -0400
Received: from mail-eopbgr10096.outbound.protection.outlook.com
 ([40.107.1.96]:20999 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWzB-000523-II; Mon, 03 May 2021 07:43:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ne0SN7KgY7DrT0bLENIkeXCWc+KbWyXm1DAU437+PuqtJuMwRfTRbRXAnH65Tj6dvP1a9Yt3U5cGGLEpYCbyph0XAbm3e6UZDbYQJ2m/CwBSgYhhaPuBUPzr49p4m09OLBMNgunqB80lURhTb5q92R3VvPq9NHYsbngklMfGxt+fMwK9eiBSWF0RWKyYcXGCGf/F8roo6b2/0PrU7l24pLoIhkLCYDM4Ul4bBSn/E+3Zsi8NmKyqXzWZW3Y/Yq8hkwZ4PHWgsiU+0BkDGSAUN9/fKnVB8okP6gcZJ3TwQBVqYAbTn2aKX+K5kAohnGQ3oxe18Mv4+n9MAUgWKcU+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jnYc3+ZFwC9k7pcbeEwYnKlrnhtj9gZKxYNA09qT7s=;
 b=Ed7XKZcXHspx892FyEmygKr8x6E6XFcJ61qXJjyFy/8d/1CaCSp0snooCQmyEuCBLlMU2B9DGCdZ59uVoBiXlUibsYtuCX8hsDekR5Def6hk8R7trJYe/Gc5b5H95+mofdYzSRSnW74tm3E5ISMd8RFSKl5MXHW77uFzUeWNVPvwLn58dDG5uhn6I4iC3bCi/5UZPxc0d+M1dU3tslGebfQgc9zrcOBbkDGeENU8UINqJcHNIINZsyAxyPRDf8xYEUPwKi9vT83Cqq4ErqHjXYCWlKkuPNivWzEpdP+O1nRhRIcl61W7l4619LOy6TzcQm0vN62OoN0N3AC6m0I2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jnYc3+ZFwC9k7pcbeEwYnKlrnhtj9gZKxYNA09qT7s=;
 b=VpjzMwQmdhQ8WuBs1vq24JOqPHxr8znXn8JG8f7eAisG/iK+lrS+0Jsy1K3THqIQjYy4DEbXIPAcUvmGlgNOptCLVmRqiWVmbsE1wA7bpcJt1FDJQhXjvjWukbw1JwAkx/CEuS+9/sNLxugnVUIcwivrxcfEoQDOB7S7TnmytTY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:43:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:43:33 +0000
Subject: Re: [PATCH 1/2] block: Fix Transaction leak in
 bdrv_root_attach_child()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-2-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7ad34997-50d0-1480-0e8b-154597187ff4@virtuozzo.com>
Date: Mon, 3 May 2021 14:43:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210503110555.24001-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.28 via Frontend Transport; Mon, 3 May 2021 11:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed22dedf-89a9-49b9-7f0c-08d90e28ae62
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446647DB1025D53F47719FAC15B9@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KRLqbIO2Y111k3l8w4WK4tLt9siX9apR17kOfogYOhQBK5dUdmHUy4bBnhmMZ9RNgCkVp355TRNJrDULPowpTee9JiMb04ay68cIwvJ6Pj22XbE9Q3Ucsqls5Ckv1L/2l0UmiA6wgDe0fRTp7nQrAgp2GDAxuX03RN06J+R8ChjhFrnzBItoY9plmJD6MrONRImPQKq+16DavI2rP8UeeAHAEtAIPyJRL8+ByWKuL5tCKf4g4R0F+BB3+uHIduvP25VaeDjpR+uRp6K0knAtScF5hjFl2ma0ffLotlBR3jJ6GlE5FWvKIo23VTz+XHWv6V6rGBVEWG89F6+ke+bcJM3UXsKzAI8jlF5B/QWmIBSua4cJIUovGmN8onRQ4rLbDU7OfUW7uXMyZKqkvkEhs0uq0GgGGWU9WMqw6tZt2gBsEKLNkLsQyfDhdJeaFtvBLwWOFHOAEma8vTOGPAj5DIGvXFGWY4qnde8WK9GY37D6n+bvUPSO4Oq8Q+yEAD/oMeH7k7e3pOuieU/kTNOcOSgKG3YlyAIidZg/qn61Z0PCg59hl4QmCua+bEjrpa8ESCTVw00SDSnfVNOPyqosBqfx3exRdF/cA1TmmkEYwMUELvZB6XQ2G0lx7XgBQlZseMhpaaoyBX2UliqKiJzXHRllP6Lko8J5wfycc3/H11Zebw+8CUjSWdlU8/ccrrGR/X2isiZYwPlFHuGBioS4fIl+A+Yo44El40T0gFF6330=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39830400003)(366004)(26005)(6486002)(2616005)(16526019)(36756003)(956004)(38100700002)(8676002)(5660300002)(16576012)(478600001)(38350700002)(186003)(66556008)(66476007)(316002)(31686004)(66946007)(8936002)(4326008)(83380400001)(52116002)(86362001)(2906002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SmxzRUxnMTVqWG9OUjlBcGY1MjYwSGJ5Wi9DeDEwcXNIYSsyVXVBZ3UwanpZ?=
 =?utf-8?B?b2pVVGloZjh6c3BRYnJGRnd2cXAvMzcrU281M2pSSjRKOTJsdWNDRnIwYUgx?=
 =?utf-8?B?c1VYOFBaMWpjOUx4aEhvVXBOdDNYdkhPQTZacE9KclVxOERYVHd3d29mSjFh?=
 =?utf-8?B?OGNWbkg4WnRFYkpnSDh6LysxaEFaRlh4YUd6QWhaZk9pcHpleEt6STc3Vnpt?=
 =?utf-8?B?M0NENzlvYkg5SzlLbEViajhsMXpkNGtwM2NpYk5OSnVUTzNyVkNoUTBuOUNh?=
 =?utf-8?B?U0ZFazhVU2FMaFdNWHh6K3MwajB3N1JEU1haMk9senNzZTJyR0VyUmtzcXUv?=
 =?utf-8?B?VkhMb1ZUUmpwdUtEMXJDeUFmYmJQQWFOTmI2RWIraVZwbWlOaUdiekNveEsv?=
 =?utf-8?B?UXNYQjAzQm1OUHcyZTJTMG1yOTVFZS9lR0hUM2NvN2F2Z2drbWMySXA0eDJ0?=
 =?utf-8?B?V1llT1Uyc3NJdmxidHZETGo1dUxhanNjbkJ1QzQ3eFQ3SFRiZ1BmckVOWGVU?=
 =?utf-8?B?N2lTWGJXNnd2WWVqR0pnZjJLVXdwd1ZQQW9ib2lVLzd5YStaTDVBVEZodnI5?=
 =?utf-8?B?K0d3SVZJN0RqTXJEY2lEQ3BzNlJXUjB0Tnp6ckFHVHdZZTRLaW5qeXowZWxx?=
 =?utf-8?B?a3hKWngxSlVFOGNaYmtnbWE4dDRQMkhxZEk1TEhlREZXS212dWRBZXdka0ZP?=
 =?utf-8?B?RW9CNXV1WmZEMnlhQy9rZTZwcHVtZlF5U2U1N2pXd3A2aVJGSU9YMUpxUHcr?=
 =?utf-8?B?L3V6ZURhM25OMGFkendPNXhXSjdCMy94eXZIVGN5dnhWaGdxRWEwdW5wRWFz?=
 =?utf-8?B?Rk5SUHExNmVqRkR5L0dzOG96bUFSN0doclV5Wm9sUUdFSDlKWitlWjF6MkRV?=
 =?utf-8?B?NmhXRkN0NkdTM0IrNWtnRmFXQktxUThsMUlvcGtBS0IydjVySDkrMHBGS2FT?=
 =?utf-8?B?NGtRdWRLdmNtSUxOd1I5WW5ZRGlmM21UMy9MOWJmR0dKZmpYTDlkMnJqcXVP?=
 =?utf-8?B?bmx4Rnp4ZmpCNUs4L2xtWUVuU29aM0tRRHYraUpwK2Z0ckVnWnQvZnNPRXRJ?=
 =?utf-8?B?OUt2VXZHNzlXZThaRDBNZGV3ekY0NEp5cExPWThvWGJLbG84SEFaOW5naHNK?=
 =?utf-8?B?MnViMjQxT3Fzc01xV2ZsdHNZKzh1NnVPWlNvNUVNeFlNNTd3V0dRR0ZnMWE0?=
 =?utf-8?B?Wk1iQUk4akxmRitOUG5yZEp5YW5iNnBrYVltZWNnSFV0U2lHQ2FnUzBrN1Zh?=
 =?utf-8?B?L1UzbkZtZFZUQmlYeWdhbFEwVU50QUtBQnNram1iSG84dnFRMDdBNFlJbkpN?=
 =?utf-8?B?VXp3ODFwMVczdittdGNwanhtUmRKR2JxS2hUZWl2WWM4YWpTWUtRdnFvVGlT?=
 =?utf-8?B?VUZSc0NwSFNBQksrTzNiTmhwNDdFdXpmMS9yZ3dSUGJoekgyOEIzWFVpU0JD?=
 =?utf-8?B?SlNSeWJDWDl5VEpLQUZxa3U3Rkw4TDZXM0pFSis5eTFOWm9UVDNtTWcxaG1t?=
 =?utf-8?B?U2Nwak9ZYjhFaWZkYzZlV3N6c01NZFl0UHZTdUkweDJmdFZmY1F5VGl3Z0xl?=
 =?utf-8?B?VkhlV1dVSlJaNXdHZ2FZWjBWWldlbXg5MjVSMzN2VXBuNkt4RDRHcEhRaHN4?=
 =?utf-8?B?MEt3aWpzVzFHeHQvZ1JhQVJWczFiQ1BEYUhCdGlRazhwL2FLRnR5RzZDa3p0?=
 =?utf-8?B?YTVUUU44NXZnZEZkMUxFMGxvQ0UxbkVtQjMrR3VEcVFoaTZPQXcrMUVyTFZU?=
 =?utf-8?Q?VH7MxgnQdkKsoc2Et5KimFT1rcacWF5+2HWENc3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed22dedf-89a9-49b9-7f0c-08d90e28ae62
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:43:33.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46+LPt/nihFpGYZPW9+NoqTde3HMAUsbKc9P0/BP7cGyZiB1cZopQ4JyN35sN/x12/eaTPnInEx+msj6E+q4g/Cs1wtLNlZ2tb7+yNICL1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.1.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

03.05.2021 14:05, Kevin Wolf wrote:
> The error path needs to call tran_finalize(), too.
> 
> Fixes: CID 1452773
> Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 874c22c43e..5c0ced6238 100644
> --- a/block.c
> +++ b/block.c
> @@ -2918,13 +2918,14 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>                                      child_role, perm, shared_perm, opaque,
>                                      &child, tran, errp);
>       if (ret < 0) {
> -        bdrv_unref(child_bs);
> -        return NULL;
> +        assert(child == NULL);
> +        goto out;
>       }
>   
>       ret = bdrv_refresh_perms(child_bs, errp);
> -    tran_finalize(tran, ret);
>   
> +out:
> +    tran_finalize(tran, ret);
>       bdrv_unref(child_bs);
>       return child;
>   }
> 

I like my additional comment and assertion in "[PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child", still this is OK too:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

