Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18164401F6C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 20:05:48 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNJ06-0003W0-9n
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 14:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mNIur-0002XP-Kx
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 14:00:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mNIup-0007ez-Ol
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 14:00:21 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B28484011E;
 Mon,  6 Sep 2021 21:00:15 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 93C1B4C;
 Mon,  6 Sep 2021 21:00:15 +0300 (MSK)
Received: (nullmailer pid 2031189 invoked by uid 1000);
 Mon, 06 Sep 2021 18:00:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20210222105004.1642234-1-laurent@vivier.eu>
References: <20210222105004.1642234-1-laurent@vivier.eu>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
Date: Mon, 06 Sep 2021 21:00:15 +0300
Message-Id: <1630951215.539408.2031188.nullmailer@msgid.tls.msk.ru>
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

> Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
> flag.
...
> diff --git a/linux-user/main.c b/linux-user/main.c
> @@ -697,6 +707,20 @@ int main(int argc, char **argv, char **envp)
>          }
>      }
>  
> +    /*
> +     * get binfmt_misc flags
> +     */
> +    preserve_argv0 = !!(qemu_getauxval(AT_FLAGS) & AT_FLAGS_PRESERVE_ARGV0);
> +
> +    /*
> +     * Manage binfmt-misc preserve-arg[0] flag
> +     *    argv[optind]     full path to the binary
> +     *    argv[optind + 1] original argv[0]
> +     */
> +    if (optind + 1 < argc && preserve_argv0) {
> +        optind++;
> +    }

Please note: this code is executed after parse_args() which is called
way up. And parse_args were able to mess up with the options & optind.

This is sort of a corner case really, but we rely on argv[1][0] being
!= '-'.  I think it is better to explicitly omit a call to parse_args()
for the AT_FLAGS_PRESERVE_ARGV0 case.  But parse_args() apparently is
a misnomer, since it also parses $ENVironment variables - this part
apparently should be run either way.

I noticed this because this interferes with my change in this area that
enables similar functionality (detecting the binfmt usage) but without
requiring any kernel changes and working with any version of kernel (it
has been discussed previously) - with both my code and this code in place
and the patched kernel, we update optind TWICE, one in parse_args() and
second here.  This caused someone filesystem to be wiped out already due
to wrong options being used.

Thanks,

/mjt

