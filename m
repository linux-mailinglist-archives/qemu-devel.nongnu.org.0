Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6566CAB8C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:10:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqKy-0003Ce-BL; Mon, 27 Mar 2023 13:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1pgqKw-0003By-AP; Mon, 27 Mar 2023 13:08:50 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1pgqKu-0005uo-50; Mon, 27 Mar 2023 13:08:50 -0400
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id AF30CDA0D67;
 Mon, 27 Mar 2023 19:08:43 +0200 (CEST)
Message-ID: <cc1f75ce-0295-cc57-1a74-71e036862bb7@weilnetz.de>
Date: Mon, 27 Mar 2023 19:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
 Julio Faracco <jcfaracco@gmail.com>
References: <20230327151349.97572-1-philmd@linaro.org>
Subject: Re: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration
 mismatch from <lzfse.h>
In-Reply-To: <20230327151349.97572-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.03.23 um 17:13 schrieb Philippe Mathieu-Daudé:

> When liblzfe (Apple LZFSE compression library) is present
> (for example installed via 'brew') on Darwin, QEMU build
> fails as:
>
>    Has header "lzfse.h" : YES
>    Library lzfse found: YES
>
>      Dependencies
>        lzo support                  : NO
>        snappy support               : NO
>        bzip2 support                : YES
>        lzfse support                : YES
>        zstd support                 : YES 1.5.2
>
>      User defined options
>        dmg                          : enabled
>        lzfse                        : enabled
>
>    [221/903] Compiling C object libblock.fa.p/block_dmg-lzfse.c.o
>    FAILED: libblock.fa.p/block_dmg-lzfse.c.o
>    /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>    LZFSE_API size_t lzfse_encode_scratch_size();
>                                              ^
>                                               void
>    /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:94:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>    LZFSE_API size_t lzfse_decode_scratch_size();
>                                              ^
>                                               void
>    2 errors generated.
>    ninja: build stopped: subcommand failed.
>
> This issue has been reported in the lzfse project in 2016:
> https://github.com/lzfse/lzfse/issues/3#issuecomment-226574719
>
> Since the project seems unmaintained, simply ignore the
> strict-prototypes warning check for the <lzfse.h> header,
> similarly to how we deal with the GtkItemFactoryCallback
> prototype from <gtk/gtkitemfactory.h>, indirectly included
> by <gtk/gtk.h>.
>
> Cc: Julio Faracco <jcfaracco@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   block/dmg-lzfse.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/block/dmg-lzfse.c b/block/dmg-lzfse.c
> index 6798cf4fbf..0abc970bf6 100644
> --- a/block/dmg-lzfse.c
> +++ b/block/dmg-lzfse.c
> @@ -23,7 +23,12 @@
>    */
>   #include "qemu/osdep.h"
>   #include "dmg.h"
> +
> +/* Work around an -Wstrict-prototypes warning in LZFSE headers */


"Work around a -Wstrict-prototypes" ("a" instead of "an")?


> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wstrict-prototypes"
>   #include <lzfse.h>
> +#pragma GCC diagnostic pop
>   
>   static int dmg_uncompress_lzfse_do(char *next_in, unsigned int avail_in,
>                                      char *next_out, unsigned int avail_out)


The warning can also be suppressed if the build uses `-isystem 
/opt/homebrew/include` instead of `-I/opt/homebrew/include` as I just 
have tested.

If we can find a solution how to implement that I thing it would look 
nicer. Technically the patch looks good.

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Thanks,

Stefan


