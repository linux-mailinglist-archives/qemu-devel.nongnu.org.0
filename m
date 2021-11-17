Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D30454E19
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:41:24 +0100 (CET)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQo7-0001MJ-Fn
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mnQmL-0000T9-Q3
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:39:33 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:56416
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mnQmD-00080o-Nj
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:39:31 -0500
Received: from [192.168.178.28] (p57b42bf1.dip0.t-ipconnect.de [87.180.43.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 9CB58DA04AC;
 Wed, 17 Nov 2021 20:39:15 +0100 (CET)
Message-ID: <168b6cd9-d4c6-612e-f479-98592de09a63@weilnetz.de>
Date: Wed, 17 Nov 2021 20:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211117111924.179776-1-alex.bennee@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] plugins/meson.build: fix linker issue with weird
 paths (for v6.2?)
In-Reply-To: <20211117111924.179776-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.11.21 um 12:19 schrieb Alex Bennée:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/712
> ---
>   plugins/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thank you. The fix works for me and looks fine. 
meson.project_build_root() was only used there, so hopefully no other 
code was affected.

I tested builds on Debian GNU Linux x86_64 bullseye and latest MacOS and 
would appreciate if the fix could be applied for release 6.2.

Tested-by: Stefan Weil <sw@weilnetz.de>


>
> diff --git a/plugins/meson.build b/plugins/meson.build
> index aeb386ebae..b3de57853b 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -2,9 +2,9 @@ plugin_ldflags = []
>   # Modules need more symbols than just those in plugins/qemu-plugins.symbols
>   if not enable_modules
>     if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
> -    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.project_build_root() / 'qemu-plugins-ld.symbols')]
> +    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
>     elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
> -    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
> +    plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
>     endif
>   endif
>   

