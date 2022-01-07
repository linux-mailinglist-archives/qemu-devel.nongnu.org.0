Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B69487B23
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:13:17 +0100 (CET)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5snk-0004Ki-TI
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5sgs-0005jL-Ng
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:06:10 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:42010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5sgC-0004YI-Ed
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:05:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A36001F39C;
 Fri,  7 Jan 2022 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641575122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bhawqE9yaIRqpJb9lAQMA+IG6jmQtOoMtsYjzYF5Pc=;
 b=JG6xGs9c84nr9BfGFIvgqkTxis+uQvwxfp1rL+vtihjdK+vci3clyA345erbjJ6dhB30Rj
 /ZbRV2t3zacfhgt5hAcoPI9/NgeIVL6YYijKleJi2gqlTKbJeFRnfP6/i0MB9bRhM6j1kp
 YuYGqSzswBfPjzwVzdmT3GOJkLKQxbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641575122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bhawqE9yaIRqpJb9lAQMA+IG6jmQtOoMtsYjzYF5Pc=;
 b=Z6n7k9HvIulGcC3+JpO6kSVmz+Ez15CX0yGmGXC3eYGUf4zbWFz/jgcqi8ZaA9dpEW04e6
 QwEhjAhQi8bqfWAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B22513D21;
 Fri,  7 Jan 2022 17:05:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wmlXG9Jy2GH0PQAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 07 Jan 2022 17:05:22 +0000
Subject: Re: [PATCH] meson: build all modules by default
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220107120143.522834-1-pbonzini@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <d4891073-de75-98bc-c3c3-e3b5c21f2f28@suse.de>
Date: Fri, 7 Jan 2022 18:05:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220107120143.522834-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 1:01 PM, Paolo Bonzini wrote:
> With more recent versions of Meson, the build.ninja file is more selective
> as to what is built by default, and not building the modules results in test
> failures.
> 
> Mark the modules as built-by-default and, to make the dependencies more
> precise, also require them to be up-to-date before running tests.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/801
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build             | 4 +++-
>   tests/qtest/meson.build | 3 +--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 6489ff8425..703eefea13 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2866,8 +2866,10 @@ common_ss.add(hwcore)
>   # Targets #
>   ###########
>   
> +emulator_modules = []
>   foreach m : block_mods + softmmu_mods
> -  shared_module(m.name(),
> +  emulator_modules += shared_module(m.name(),
> +                build_by_default: true,
>                   name_prefix: '',
>                   link_whole: m,
>                   install: true,
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 37e1eaa449..26937deb6d 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -335,10 +335,9 @@ foreach dir : target_dirs
>           test: executable(test, src, dependencies: deps)
>         }
>       endif
> -    # FIXME: missing dependency on the emulator binary and qemu-img
>       test('qtest-@0@/@1@'.format(target_base, test),
>            qtest_executables[test],
> -         depends: [test_deps, qtest_emulator],
> +         depends: [test_deps, qtest_emulator, emulator_modules],
>            env: qtest_env,
>            args: ['--tap', '-k'],
>            protocol: 'tap',
> 

Thanks. The issue is fixed.

Tested-by: Li Zhang <lizhang@suse.de>

Thanks
Li

