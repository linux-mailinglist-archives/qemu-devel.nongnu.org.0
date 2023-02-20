Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353669CF13
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6sW-0002z1-SB; Mon, 20 Feb 2023 09:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU2Gs-00079Z-Jz
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:43 -0500
Received: from mail-dm6nam12on20602.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::602]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU2Gq-0004HZ-PU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zbwkn4hOo/JFMdqRWat3IASdtT3iKzyaaKyFi0z6h/2ALPxL/NGRHmVGSqvZ2k9HOuNPv7xjaRjptbr89VZZGA7PYQduTTycZAllzLTqP/Juttyb1H0ydNHNmzklffI7xQrOwf0fZDkza6TYORXiKQs5CnB7i4Fpb4adEoUVOWy2fGoqpB1f4iu7TJg6v9msNkQ3DduTVCo2xDckS5RJA5ogBvxyVAinn2O8I1pNWPU8Ih5Vbe92z7vJjFoO0Sloj8d7cv7mVHCh20Gu2jSq/R8tgHBQ8sfbL91imnJ2efxoZ3sHiJS9G5b0gAEjFBlvuKU9AP2vEyw+XowBiSUgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lytDufZGgHgq+hpMxhlqu8PBoGwlc+lzZOFWvV57Egg=;
 b=beTK2ApOUTjdJKlBcjgXkHnXo/dCLTfdEembZOFG1GImGvigdv5GUEfBYsqS8oUWFvOCm1G4WAbHbWOQCuDqUP/UgtXK0/ZcmTSssVN9V9ojdFXuTmndFSrRbnjhpdkJJ0xJfYM5WpE3ErtbZVajc0DBAS1WQ4hFx1FN2YyCm9GdSlZJk/FRoPrfbDL8DQrDMT6VU2ukNFnz1Ii5y0gv+Kk0zieuinfxYtbToSc+zU67KuQj2rDVU6ivGULWkb9WKkUyeSWh+J9vuFql1GvPvnSbHaUGjuI72DjC9vRxgrC1P/2Pac3dMFYQdvY3v5aVXD63mD3wV9Q7YojCQ7WTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lytDufZGgHgq+hpMxhlqu8PBoGwlc+lzZOFWvV57Egg=;
 b=AjG9KqQbnIjg6BrRwCtlMGTlrTypSk8B86sllFbDy31cMeQFBf9Sq4Crbei/uZ2hZfISa43lvRwF1lOS8Adr30zzfq5gvkfY5MG9m8qGs9akuqOrv6WvZbmIZZ4Yq+9vwfOfZQZS7/Spp7kfYhNGWYDzn/lzAppjitodz5cih0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 09:15:34 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 09:15:34 +0000
Message-ID: <42d96ab1-b720-93c7-ae6d-d4c8344f5215@silabs.com>
Date: Mon, 20 Feb 2023 10:15:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 4/4] linux-user: handle netlink flag NLA_F_NESTED
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-5-Mathis.Marion@silabs.com>
From: Mathis MARION <mamarion1@silabs.com>
In-Reply-To: <20230220085822.626798-5-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 2460d3b4-dbb8-4017-7973-08db13230577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKYE1U5pYY9QcYFzwXr+w7D+FJhKrQPoSuIsp/AM2ahP3VTfa7OWKq36wnSRsGhrGEJp1pTMJNiPnskFdOKtrrxzlulGInD/+27IGfFoYh0AP5Qqu25HQWVJFponjsjSE99SEmPTOc0iNcKEW/DrZtB/vdRGB86/ZGwToDswAWI8b7tIe9Y1DBs9XpdnyO48b40XWFWBI+xLmsCwDpahisfHP3TQRBDsO0RYcqhTUsrQbG6syxdvZsidGuIamqW+xd0ZrNyYNCGXwKu+Qplq1uxqOZwtwczv6ed1Q3+9q/KbANE4/PVDHbofRIkwmBLDA5ptjEXc8KJmN2E0oant3qRr4mcGkO14VVR+Fz2Ig0lNUDu3w1HVq+IjlxaNbwhHCzh6WGSGKv6e0xAvMFB7AXF74wYIf0IcGEXITx6SjzSXQ84uxGSW/p14sxK1ydQ5KoUbj3FwVof/FL9Uxj5RBNdOJEDpb5QOysZomzwoxMRHgyZAUFqJS0uUOgK+GNPZUuNtfJXeAbk7RAl9H7iDBd/ttPgnLzmNhNeJJR2Zdo5lekzqk3LaGQDeLD9prD13LlaQEjA1KbO1UOb4xIfqFs+UGUvR8teOy/fmMmTGtl/Gs0OV7FIZLXYFmKcuc2mWw5h4gB46zgc1lQlcj7U0IzwZ9C4LuX8dT1e8RDCginsdiE7/ofKWyOjfcm1lWrjmdB3EC0e45PxXmunQPIpmWxrGszU0o4au7S5Qjvw8C7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39850400004)(346002)(376002)(136003)(396003)(366004)(451199018)(31686004)(6512007)(26005)(186003)(6486002)(53546011)(66476007)(4326008)(66556008)(8676002)(5660300002)(36756003)(8936002)(83380400001)(66946007)(2616005)(6506007)(107886003)(6666004)(478600001)(110136005)(316002)(41300700001)(38100700002)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amEvY3RrcFZ3TlcxUllJZi92akYxL2prbWQvQ3VMOVQ0SVdCRVk4ZldVLysy?=
 =?utf-8?B?UVZ6Q1F3Um9id2lwUUhlN1JQKzNseEttcUVxUjFjZWZwQkJiWlp6V09aS0pO?=
 =?utf-8?B?SHVQZ0t3Q1NUb1lzLzYwUTMrdk1SdFlXak1DYzV1YmVranU1YlBpV1k5bDhm?=
 =?utf-8?B?cCs0MVdLeWEranMrN0kzZkVvWEpmV0xNNWtPWjVIbmV6S05qNFk1ekc4VXRK?=
 =?utf-8?B?TGVFQzJsUThTQ1FMUjVaaWlvOGFiM0szNnh1OGJqUThSemg3eXFNL1h1Snhj?=
 =?utf-8?B?ZEtSdjF2WWE5aDB5U01yTENEUzVvd0lPMnZmeVgwL3RXTmFLMWtWd2hYcUw5?=
 =?utf-8?B?eW9OUFBRUVp1dElaMHAwTk1TWHNZMFI4T0J6c3VzcUNHZDgyZUpHM3ZnTVor?=
 =?utf-8?B?T0ZKSG5aQ2tGMWdkbFk1dG13aFM0ZUFGeW95SmoyQ2Z4ZExHWUltUjk0VFhQ?=
 =?utf-8?B?WC9WVEpPb1NlYjhhMXBQQ1EyY0wrbktud3NxdVNjcnJxUkxnYVpzVWM1Mmdr?=
 =?utf-8?B?bjJZaTA2WWx2UkdGcHNncjRxZmUycjZPeHg5c0pPanAxeUtCTEJZejRnb2Fa?=
 =?utf-8?B?N1EyWXZmNmZBdlZ5dDFsZ2F0akRJZGJDdzdXczdQVmRTV3l4S01LR1dPNmt5?=
 =?utf-8?B?S0RqNjlJanpzQXpLTnRSTmNHL2lKUUx4bWlmT2NIYnlBcnBrcFBJTjY1Qk1W?=
 =?utf-8?B?dFdWRno4aHYzTU1YbDIwRkxDZHZnKzRlR1BoaDRTZnZrM2ZpZ212TkxDYVNa?=
 =?utf-8?B?MmJZTmM4a0lNRGl6OUEzWTIzZnFZeHZXMUw4Yy9DK2p2MmhhMmFTd0RxeHlr?=
 =?utf-8?B?WGtGZk1xeFBwZGlveVpzSWRlUnIvSjIwcEt4d29hOWFmVzdtd2F2Yi9yL2Rn?=
 =?utf-8?B?ZmhLNU55UVZUZFo3bUpoTUc2VlRMeVg4RG9wZkZCbmVucEZEWU1mQ2JQSFFG?=
 =?utf-8?B?YnduNkwxU2c1UjBpcDZOV2xNT1N2QWt0SDlkMFJsbXlFaGx6T2lKdnU4dUxU?=
 =?utf-8?B?ZzkwOHpZVm02RzFubThZM1dJc1BWaytlSVljT1lqYkNyblI4SjNDOXhIamZu?=
 =?utf-8?B?NWVpcWtVN0JCSzR6ZFdMMGpTY1padlZMTXpuTmpmWVdoRUhDL2dzenZHVlNB?=
 =?utf-8?B?OU9hKzBoRXlNRXo5VjREZW5mVmJ1TEludFlDSnZLNnV3STN5UTRzbmRCcDNn?=
 =?utf-8?B?Z2lvNVlMQ3JZc3kxV3liWlZjYTNUWGtZTnBZa29OY1lBRkg3VFkzbmlpeUc0?=
 =?utf-8?B?SzQxaFl0dlp6V1NiSk5TdGFmL2FrUE5vdmtzbEVHRmV1Z3dpVVNnaE9ST3J6?=
 =?utf-8?B?anEveXRUd01nV2lyRlcvOGMwcHBXT3BsYkR3NDVVeVhYYzJxbzM4RkQyOEF6?=
 =?utf-8?B?T25RNDV1V00xOXYvb05tMjhHYzNzQzFQVThLby9wYU5MdEh2REVVK1VuREhv?=
 =?utf-8?B?YSs2RHVpVWZ2aVZGMTBmdjZlaHMvVHA3Tm9XUzJRcDcvU3Z5RDlLMFhCells?=
 =?utf-8?B?REFuRitQbkY4RStPWU8wQmV4ZHBjOUxNMDRyRTgwWlZRaGNJTXpjTll2V3lG?=
 =?utf-8?B?Uzc2ckFhdER2MFQvMG96blMvVitTbFVGSVpZaVlIOW5zWjBZZkQwSUFJT0hh?=
 =?utf-8?B?R1VkK1c4LzBrVjh3Nnh3YmhGVWE5YWxQRFFjZzJyelZOUSt0UGhUQUl2b3hP?=
 =?utf-8?B?clgydlM3Rnd6THhFUFpyUmRHYUs0NUJoeWFLM0J6ZmxZSW5MU3g1OEdpbDQz?=
 =?utf-8?B?K1Zzc0E1RUNQc2FXNEVldWw1VGJtUGE5b01lc3Vlc01NWkR0cFdobXNnZlhF?=
 =?utf-8?B?bEdINnVwY2V3bXdjRlQ5OXcwREpJUTdLVHBjTWo2cUhJc2o0Y3FDTkYrQzgv?=
 =?utf-8?B?MkVWSzNNd21HZi81S2EySVZaVFcwV24xaDhjenlCYTkwbS90cjlmbGtZTllV?=
 =?utf-8?B?Q0NKeENIc2FrcHhhbDlHeGRPYm4zcDJzbHc2KzZadW12blhIS3dUeUlmcnRX?=
 =?utf-8?B?aUZGWnhoOWN3alZyMW5vRkFXSjlZUXRwZGNORzBiZTBrWENzdnVjVG5TSlND?=
 =?utf-8?B?eU5TSFdUd051V3lFRzAyNVc0Z2kzaDdpNmZtTERrNU1tbGlXY0VOSm1ncnQ1?=
 =?utf-8?Q?FcGQa32XPBQaMzs0az+vq1YZ0?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2460d3b4-dbb8-4017-7973-08db13230577
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 09:15:34.1274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSGbGMDf1BJQs0qpffeC3LC9kJVvu3ldWlcq817RyGoxFRElAcv9u3r0kMkyYarlniHBw8JLVkfn9i4jPUNUvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
Received-SPF: permerror client-ip=2a01:111:f400:fe59::602;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=0.756, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 09:10:28 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/02/2023 09:58, Mathis Marion wrote:
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> Newer kernel versions require this flag to be present contrary to older
> ones. Depending on the libnl version it is added or not.
> 
> Typically when using rtnl_link_inet6_set_addr_gen_mode, the netlink
> packet generated may contain the following attribute:
> 
> with libnl 3.4
> 
>    {nla_len=16, nla_type=IFLA_AF_SPEC},
>    [
>      {nla_len=12, nla_type=AF_INET6},
>      [{nla_len=5, nla_type=IFLA_INET6_ADDR_GEN_MODE}, IN6_ADDR_GEN_MODE_NONE]
>    ]
> 
> with libnl 3.7
> 
>    {nla_len=16, nla_type=NLA_F_NESTED|IFLA_AF_SPEC},
>    [
>      {nla_len=12, nla_type=NLA_F_NESTED|AF_INET6},
>      [{nla_len=5, nla_type=IFLA_INET6_ADDR_GEN_MODE}, IN6_ADDR_GEN_MODE_NONE]]
>    ]
> > Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/fd-trans.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 4852a75d9d..1fb8ef9d4e 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1359,7 +1359,7 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
>   
>   static abi_long target_to_host_data_spec_nlattr(struct nlattr *nlattr)
>   {
> -    switch (nlattr->nla_type) {
> +    switch (nlattr->nla_type & ~NLA_F_NESTED) {

After looking a bit more into it, linux/netlink.h defines:

/*
  * nla_type (16 bits)
  * +---+---+-------------------------------+
  * | N | O | Attribute Type                |
  * +---+---+-------------------------------+
  * N := Carries nested attributes
  * O := Payload stored in network byte order
  *
  * Note: The N and O flag are mutually exclusive.
  */
#define NLA_F_NESTED		(1 << 15)
#define NLA_F_NET_BYTEORDER	(1 << 14)
#define NLA_TYPE_MASK		~(NLA_F_NESTED | NLA_F_NET_BYTEORDER)

So maybe I should use NLA_TYPE_MASK.

However since NLA_F_NET_BYTEORDER is not supported it may make more
sense to return an error.

>       case AF_INET6:
>           return target_to_host_for_each_nlattr(NLA_DATA(nlattr), nlattr->nla_len,
>                                                 target_to_host_data_inet6_nlattr);
> @@ -1375,7 +1375,7 @@ static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
>   {
>       uint32_t *u32;
>   
> -    switch (rtattr->rta_type) {
> +    switch (rtattr->rta_type & ~NLA_F_NESTED) {
>       /* uint32_t */
>       case QEMU_IFLA_MTU:
>       case QEMU_IFLA_TXQLEN:

