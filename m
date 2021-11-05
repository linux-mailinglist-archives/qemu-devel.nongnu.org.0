Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEF446252
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 11:42:17 +0100 (CET)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miwfn-0006Vb-Bx
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 06:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1miwaQ-0004xS-1M
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 06:36:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1miwaN-0004rT-TH
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 06:36:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 16F6640022;
 Fri,  5 Nov 2021 13:36:28 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 299B95B;
 Fri,  5 Nov 2021 13:36:28 +0300 (MSK)
Subject: Re: [PATCH] configure: Support modules for Windows
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20211105032002.83792-1-zhiwei_liu@c-sky.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <c082bdc1-f2d7-1943-31dd-629f28bb3b11@msgid.tls.msk.ru>
Date: Fri, 5 Nov 2021 13:36:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105032002.83792-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -89
X-Spam_score: -9.0
X-Spam_bar: ---------
X-Spam_report: (-9.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

05.11.2021 06:20, LIU Zhiwei wrote:
...
> diff --git a/meson.build b/meson.build
> index 47df10afc2..26195cb24f 100644
...
> @@ -2800,14 +2800,15 @@ common_ss.add(hwcore)
>   ###########
>   # Targets #
>   ###########
> -
> -foreach m : block_mods + softmmu_mods
> -  shared_module(m.name(),
> -                name_prefix: '',
> -                link_whole: m,
> -                install: true,
> -                install_dir: qemu_moddir)
> -endforeach
> +if targetos != 'windows'
> +  foreach m : block_mods + softmmu_mods
> +    shared_module(m.name(),
> +                  name_prefix: '',
> +                  link_whole: m,
> +                  install: true,
> +                  install_dir: qemu_moddir)
> +  endforeach
> +endif
>   
>   softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
>   common_ss.add(qom, qemuutil)
> @@ -2826,6 +2827,7 @@ common_all = static_library('common',
>   feature_to_c = find_program('scripts/feature_to_c.sh')
>   
>   emulators = {}
> +emulator = 0

mm...
...
> @@ -3023,6 +3026,17 @@ foreach target : target_dirs
>       endif
>     endforeach
>   endforeach
> +if (targetos == 'windows')
> +  foreach m : block_mods + softmmu_mods
> +    shared_module(m.name(),
> +	    name_prefix: '',
> +	    link_whole: m,
> +	    install: true,
> +	    dependencies: glib,
> +	    link_with: emulator,
> +	    install_dir: qemu_moddir)
> +  endforeach
> +endif

Now we have two almost-identical blocks in different places.
Can we either move them closer to each other or combine them into one?

Thanks!

/mjt

