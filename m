Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62C44B1FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:26:23 +0100 (CET)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUt4-0000LL-5T
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:26:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1mkUqZ-00067i-2S; Tue, 09 Nov 2021 12:23:47 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:58932
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1mkUqW-0001Ze-JD; Tue, 09 Nov 2021 12:23:46 -0500
Received: from macbook02.fritz.box (p57b42bf1.dip0.t-ipconnect.de
 [87.180.43.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 93648DA106C;
 Tue,  9 Nov 2021 18:23:42 +0100 (CET)
Subject: Re: [PATCH] configure: Symlink binaries using .exe suffix with MinGW
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211109144504.1541206-1-philmd@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <81daf35f-da64-9d7b-cbf5-d99dc199f676@weilnetz.de>
Date: Tue, 9 Nov 2021 18:23:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211109144504.1541206-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.11.21 um 15:45 schrieb Philippe Mathieu-Daudé:

> When using the MinGW toolchain, we use the .exe suffix for the
> executable name. We also need to use it for the symlinks in the
> build directory.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 48c21775f3a..31e8f586dc7 100755
> --- a/configure
> +++ b/configure
> @@ -3786,7 +3786,7 @@ fi
>   
>   for target in $target_list; do
>       target_dir="$target"
> -    target_name=$(echo $target | cut -d '-' -f 1)
> +    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
>       mkdir -p $target_dir
>       case $target in
>           *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;


I never missed those links, and so I did not notice that they were 
broken. But fixing them is reasonable of course, thank you.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



