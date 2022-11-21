Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A555632FF1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:43:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFUf-0004Yk-VS; Mon, 21 Nov 2022 17:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfehlig@suse.com>)
 id 1oxFUb-0004Ue-SU; Mon, 21 Nov 2022 17:42:21 -0500
Received: from mail-vi1eur04on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::614]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfehlig@suse.com>)
 id 1oxFUZ-0004Jq-9B; Mon, 21 Nov 2022 17:42:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRCOBwXypiNfPgJLKaQfnUldzTR+cSNGmHjToEApbM5oAQ+0/5N12LTu/LcOMagXzxbsVNCohAPU2Tp7qLbqYMt/UxQOxYJEwzLOi+L+N7FGlrkt5zK9Zxp1+T1/ch1BDWvH77GpW+ondjWQ3OIohQCQG8odRnHAmI1tGFUBcj9KCwvJH9D7ySWj0ufbaZYDokAx49wy9hs/UFCBBok6QikzaKVRaLUO7azcT+8tJXF23zMEFcCaw6lT03SEZBMoxX1/kG2ECA2DgiEFsPTntzNSH8KoXqidiv8tM43cgVNCWECi4OD0V9ExUTPiKSLBD4FD8Z47jdMnOTDK1mBmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0igOpH/kGSnsbPmrn+BCiRJ1FULEBc1O8xI41MffRag=;
 b=KZTSG9Zk9fDLvKlCJvpEk2DL4RWwQZk+hAglgsvAXU/O6m3os6FEJukor/Z8aB4QZphDgJXoyEPdSuD4J/oV7+NbO0OtPXKRjINeJMVSTeZf4ywTBAuKg98hLH2R981HJO+I7VzVcaFFIkBFRPftaTVktQdwgS0AUZBq8rlejaMU73mgCii4e6XqT6rWN1b0OXjHfsI8qwwVONYmCMLlmiDWoi4Q9By/9WsmTpj6VqPyLZcZHRDiwSQhPDCr/mS2tv1Z2HPw+rpCGu5bKg+coBghmsTU6XcBY1qNZa0eFgfF8pEgReu0xEWgrJy4zjMDI9xDCem0kXp6oqGDmwPJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0igOpH/kGSnsbPmrn+BCiRJ1FULEBc1O8xI41MffRag=;
 b=ZsM4xAh7kFIxLiQsBXps5im9Oc2hhJxaoU5C/p3wUhhnW9BeV8xQJNcxlUFi3dZtAZ9BDohBzhNPwB2oB12HYjeDGLHJHB5At1nr+olr6jeOG6DaT3NsIClkG77HA1qdhQtZ2j30djjWLrMIKbGDZE8REWPGsrptaqe/fWHC1bfHxHK65a4bE8Tl/ElBksiw/5NPVNnvM0b4DmqjmeFX3nf6yHqRbTnm6CyACynZj+QdwcyMfYtaG457qpKA2nNt4PBa1srMb488NMSX+aJVG5evQxSFfTKfcofwECh44UcSk3qzEZ53LYkvfeOYlrpCcUmBUq0SPcVVuvqickKg+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com (2603:10a6:208:c5::16)
 by DBAPR04MB7318.eurprd04.prod.outlook.com (2603:10a6:10:1ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 22:42:14 +0000
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::c5dc:fe50:9918:744f]) by AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::c5dc:fe50:9918:744f%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 22:42:14 +0000
Message-ID: <90e45b45-3550-078b-c05d-5ca676b083df@suse.com>
Date: Mon, 21 Nov 2022 15:42:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] gtk: disable GTK Clipboard with a new meson option
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
References: <20221121135538.14625-1-cfontana@suse.de>
From: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <20221121135538.14625-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To AM0PR04MB4899.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4899:EE_|DBAPR04MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 435c5ba7-cffa-4c02-fcac-08dacc11a213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gL+xK3XywJZKpbd8yNqJ1/PXAQHj4blYhQj9dmMB+P089ftPwxo1bN4fj14HoEFNv7biEvLCNIib5GZ2MT/AUZBcT7qb8mZGciBQNwV+3tzYMsExYgjNR/44gLn1shr/yUAdaay5mFXCyayc346Wk4KLOZ/eEsBmt32AgQsbK0cu3KpxKU15lFgCmAjWIR/Ylz3nXIUEb4bw6br0eBHPxbkQH0EB/8iQRBXklGdoZDGlzPUbKMBoT+azKSDb5wLj0+0xUqNNw2MX/w/5XT0fZNgBPEegwMZn6cfmR7GWMfH33Q2bN9zwQ7McMM91AxcuysBrYZ3+IdchOel3oaNnsH0keA/pakAOJrQHvGoof0kbWBWPkmF2GxGUWFQl3mycKq18q4j9jyAJd2VLt+AHVMlfXfnD1Wvrwn4c/En+1pzX6jA/84LS0DD9mNbbiKBfF5O3UHUgpDoFqXj5PE2jHrGz6mSrvjPGhZec8mK68ohTsUKP0LLzG1IJQ1Lrc4Z+jQyaBccwd+6iCU6bc8NnqIZiD0SpkzS4qlK3mvbH+OF3ozi3f2bMV6ddzEAT6a1J6Zh+1uDlf6zBmdgCt7L3TmIDlSfHgImHLWpxswxnKyTJpI5fSI2/qqvNvC56YVRhbU8HCDCmcyWdTKgIvdhjsFEBrEiYWlXW7omy2d7kcZtp0IDwMPh5IfyFb7ozXtceHTIM3p+MNNv2t9ojPWITgWuIAcGhmwPq8VLUU4ALXUUpHtpVs6C09cxLYIjo00zM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4899.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(66556008)(66946007)(66476007)(36756003)(53546011)(8676002)(4326008)(5660300002)(8936002)(31696002)(41300700001)(6512007)(86362001)(6666004)(26005)(6506007)(83380400001)(186003)(2616005)(110136005)(6486002)(316002)(966005)(38100700002)(478600001)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRYZjlrVFJPOTVGbjFSbXB6UVlUM25wUSttVEg2YkNtY1VMeU42c0tSUjY1?=
 =?utf-8?B?YlNJcmdHM2RTVm10ckEzSWY1UmZwZVl3eDBsVVVBT08xYmdBblhGSjloeHlN?=
 =?utf-8?B?aWVySzJLVGt6WjdzR2lkSHFWamoyS2FuSS9ZYldOd2ZHTlVFem1CMTl1U0NW?=
 =?utf-8?B?cWUvVytRbStmdzBUc2hELzFYUVJsd0UwKzkzYU5iK3hUdDFPMFV4Y2grMFk2?=
 =?utf-8?B?Y0E4dWNKYVJGWmlmNlg5Y0VNeERKdFkya3AvY0lPczk5UDRBaldHeDhnZXI1?=
 =?utf-8?B?dHcxbEV2TUo3SUNPaHQwQ0V3WDh4MnlEbkVmNXk4ZWFkcjR1eEJXbGI5ZFA0?=
 =?utf-8?B?Z3dXWmdrUzhEd0EwRksyajYzZldlUVlhUkc4L2szYThUdEhNOGNMMElYWlRm?=
 =?utf-8?B?STkrMWt0dEFwalNWZllhSkVsMlhzQWtJL1dtZVlicjltaUo3ck5hRGM4cmlK?=
 =?utf-8?B?WnNMZGxpV1ZCNzNzS0tKaEVldHg0VkRiU2JTU29aM2JoWGxnaC9kcWxTTjFy?=
 =?utf-8?B?ZGxhQlk0aHBLY0xDeEhZczVBZFR0cjJLaHZSOEV5dm5OajU0T0J5T3paczMw?=
 =?utf-8?B?R2w2MmZ0QnpRbHVuRFBVa25FRDBVUFdNVUw2OG9mZDdnRW1pTHVLSTFreDRk?=
 =?utf-8?B?ZjdNSnBrVkY2R01aUHEwSlhVeXl2SUdXYTdTNXFzVFh0N2VhcjdFRi83OENx?=
 =?utf-8?B?Kyt0RXBnemUzL3lxVlVIOHNBbnBMQU51azhqMDlYc0QwSjlYMDVJVkVHV3ZS?=
 =?utf-8?B?c3hzRVRxcGZTTDBHejZyWUR3alBHaHIwc1VrV05MN1VpckVkUWpyYXBscEUv?=
 =?utf-8?B?L3p1VURHYkdGc01keU04ejJTOXRNYVJObmhyOTYxWmhJYitGM1VXYXpHTUoz?=
 =?utf-8?B?ZmpCT1dpTHpmZU9mYmtXZ0pRVkNaUlVCNkRma3FHTUZLdkZKT3UrbUswQ0pn?=
 =?utf-8?B?UExnNlNJeHFZYThLUXJNeW1DZFRBQStuUGlNb05sWVNqZUR3RXFNZ2NsM0ZG?=
 =?utf-8?B?Q216SmxiY25YVVRpU09OMlFabjJMRktIalZmL21XRElxN1IyLzFZZmZyZVNv?=
 =?utf-8?B?c2pFZHQrbUdrTVduK2QrYy9GeGlndU8xZ3NzMU4xNmNUTFdVS3gzd3pnZzVp?=
 =?utf-8?B?SkNaREtRZFd1UDIwcHkrSVp6aG9JdWdpSVhaNGJpSDlLdTc5eFhlTGhqZjFL?=
 =?utf-8?B?NUdJNFlrY1FZN0V3WHhJS2QxTmFGODNVU2hVUjVzQWRKYVVXNGRNUGlRS055?=
 =?utf-8?B?Z1N0OUZmQklwSUw2ZDJHZEovbmwvcDIzUTk4d21oRHBCbXl6SUMweEZvMWRR?=
 =?utf-8?B?Uy85bnhZaThxMExUNmlMdTJpWUlDR0Y4S3J4SFFRem0rWDlaQ3NVVHJuYnRt?=
 =?utf-8?B?Z1p2MnNpamp6eDBrdjRzVUpvYW1aOUgwUVlQSzQ2S1pkVk1nUC9NczVZYTcz?=
 =?utf-8?B?REhKNzJmeVlieEt3MFdibUFyOE1FNnhPcDBkQzhBbFBrTzVxS3c4Q3JkUUd0?=
 =?utf-8?B?NTZVVHRRRWZaTHQ4bDAyTjJSNElaNCtrT09kemxqZkppWXIwTnNoQ2lQaldC?=
 =?utf-8?B?dTcyM2RBTGg1Y0JvK0lhNGh3aDJHUVR1SWo2c2dBeXZ6WFZmenE2M052ZXR5?=
 =?utf-8?B?QVB3eDJsa3dWQ24rRElCNkluTjZZNmk3dkQrQUJzM1U5YnpsZy9OTzBkOGMr?=
 =?utf-8?B?cHRMUTM1MzFjR1NYRy9uMjBjZGRZZDBzeWZQK1JJb012ZjIwaEpndnY3Zm5J?=
 =?utf-8?B?dXVwejRhcDZxUit4TTlRb3FrcTlMeU9ncTdPRzhFN1FSY2FIbEtBMXpWYkFT?=
 =?utf-8?B?dnNLMmRKZzZNRENua2ZPNUdHclVHWlpUc3BYK3JSTUJDZFZVOXM3OEtkS01U?=
 =?utf-8?B?aktXSFR3dmZUZ1l4Y1Q5MEZIeUJjUmJzQUtzUFRYQnhsMFR3dElVNFJVQ01W?=
 =?utf-8?B?YjdIZDBZV2xVYk92TEduVGtGazFlU2dDTnUzYjBvUnNBR2E0dlpMcjRjeEtN?=
 =?utf-8?B?OHljQmhYelZsL3R6ZjNwamFNRWpVdllPZmRCZWxPYTgwek5zelJCWnJZTDZt?=
 =?utf-8?B?NDBtWTdOTkdDZkdtWmdSWFNCam1xMGRQUXZTZ2p4bDFmMllVbDBwSDh6ckxR?=
 =?utf-8?Q?PwC8LfON4hNKkQO26NNhDM0oo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435c5ba7-cffa-4c02-fcac-08dacc11a213
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4899.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 22:42:14.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0/a5dgbe4Yvk3a/rgF8UsFhWNuUgFAnvmxcJQe4+vS4qVOyAmqtHMAcVlJjZGirmSYfrT2qNfYQ+lMLIykiiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7318
Received-SPF: pass client-ip=2a01:111:f400:fe0e::614;
 envelope-from=jfehlig@suse.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/21/22 06:55, Claudio Fontana wrote:
> The GTK Clipboard implementation may cause guest hangs.
> 
> Therefore implement new configure switch: --enable-gtk-clipboard,
> 
> as a meson option disabled by default, which warns in the help
> text about the experimental nature of the feature.
> Regenerate the meson build options to include it.
> 
> The initialization of the clipboard is gtk.c, as well as the
> compilation of gtk-clipboard.c are now conditional on this new
> option to be set.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1150
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   meson.build                   | 5 +++++
>   meson_options.txt             | 7 +++++++
>   scripts/meson-buildoptions.sh | 3 +++
>   ui/gtk.c                      | 2 ++
>   ui/meson.build                | 5 ++++-
>   5 files changed, 21 insertions(+), 1 deletion(-)

Compile-tested only. Oh, and ensured './configure --help' contained your text :-).

Reviewed-by: Jim Fehlig <jfehlig@suse.com>

> 
> v1 -> v2:
> 
> * fixed a too long line in scripts/meson-buildoptions.sh (checkpatch)
> 
> * meson.build: set have_gtk_clipboard variable once, avoid duplication (Jim)
> 
> * mention the warnings about experimental nature of the feature in commit
> 
> diff --git a/meson.build b/meson.build
> index cf3e517e56..5c6b5a1c75 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1246,6 +1246,8 @@ endif
>   gtk = not_found
>   gtkx11 = not_found
>   vte = not_found
> +have_gtk_clipboard = get_option('gtk_clipboard').enabled()
> +
>   if not get_option('gtk').auto() or have_system
>     gtk = dependency('gtk+-3.0', version: '>=3.22.0',
>                      method: 'pkg-config',
> @@ -1264,6 +1266,8 @@ if not get_option('gtk').auto() or have_system
>                          required: get_option('vte'),
>                          kwargs: static_kwargs)
>       endif
> +  elif have_gtk_clipboard
> +    error('GTK clipboard requested, but GTK not found')
>     endif
>   endif
>   
> @@ -1842,6 +1846,7 @@ if glusterfs.found()
>   endif
>   config_host_data.set('CONFIG_GTK', gtk.found())
>   config_host_data.set('CONFIG_VTE', vte.found())
> +config_host_data.set('CONFIG_GTK_CLIPBOARD', have_gtk_clipboard)
>   config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
>   config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>   config_host_data.set('CONFIG_EBPF', libbpf.found())
> diff --git a/meson_options.txt b/meson_options.txt
> index 66128178bf..4b749ca549 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -219,6 +219,13 @@ option('vnc_sasl', type : 'feature', value : 'auto',
>          description: 'SASL authentication for VNC server')
>   option('vte', type : 'feature', value : 'auto',
>          description: 'vte support for the gtk UI')
> +
> +# GTK Clipboard implementation is disabled by default, since it may cause hangs
> +# of the guest VCPUs. See gitlab issue 1150:
> +# https://gitlab.com/qemu-project/qemu/-/issues/1150
> +
> +option('gtk_clipboard', type: 'feature', value : 'disabled',
> +       description: 'clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)')
>   option('xkbcommon', type : 'feature', value : 'auto',
>          description: 'xkbcommon support')
>   option('zstd', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 2cb0de5601..aa6e30ea91 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -93,6 +93,7 @@ meson_options_help() {
>     printf "%s\n" '  glusterfs       Glusterfs block device driver'
>     printf "%s\n" '  gnutls          GNUTLS cryptography support'
>     printf "%s\n" '  gtk             GTK+ user interface'
> +  printf "%s\n" '  gtk-clipboard   clipboard support for GTK (EXPERIMENTAL, MAY HANG)'
>     printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
>     printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
>     printf "%s\n" '  hax             HAX acceleration support'
> @@ -274,6 +275,8 @@ _meson_option_parse() {
>       --disable-gprof) printf "%s" -Dgprof=false ;;
>       --enable-gtk) printf "%s" -Dgtk=enabled ;;
>       --disable-gtk) printf "%s" -Dgtk=disabled ;;
> +    --enable-gtk-clipboard) printf "%s" -Dgtk_clipboard=enabled ;;
> +    --disable-gtk-clipboard) printf "%s" -Dgtk_clipboard=disabled ;;
>       --enable-guest-agent) printf "%s" -Dguest_agent=enabled ;;
>       --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
>       --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 7ec21f7798..4817623c8f 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2403,7 +2403,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>           opts->u.gtk.show_tabs) {
>           gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
>       }
> +#ifdef CONFIG_GTK_CLIPBOARD
>       gd_clipboard_init(s);
> +#endif /* CONFIG_GTK_CLIPBOARD */
>   }
>   
>   static void early_gtk_display_init(DisplayOptions *opts)
> diff --git a/ui/meson.build b/ui/meson.build
> index ec13949776..c1b137bf33 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -97,7 +97,10 @@ if gtk.found()
>     softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
>   
>     gtk_ss = ss.source_set()
> -  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
> +  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
> +  if have_gtk_clipboard
> +    gtk_ss.add(files('gtk-clipboard.c'))
> +  endif
>     gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
>     gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
>     gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))


