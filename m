Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00255166A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:59:04 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3F7X-00009o-B7
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1o3F3V-0007Wk-QZ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:54:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1o3F3S-0005Yf-PD
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:54:52 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 96FCE40A38;
 Mon, 20 Jun 2022 13:54:36 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D229813A;
 Mon, 20 Jun 2022 13:54:35 +0300 (MSK)
Message-ID: <0b98e946-3f1b-0e2c-8beb-9cc878190c06@msgid.tls.msk.ru>
Date: Mon, 20 Jun 2022 13:54:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Building tools on unsupported cpu/arch
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
 <beb38967-f089-c0f2-eb41-f33277e38d44@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <beb38967-f089-c0f2-eb41-f33277e38d44@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

20.06.2022 13:31, Thomas Huth write:
> On 30/04/2022 16.11, Michael Tokarev wrote:
>> Hello!
>>
>> Previously, it was possible to build qemu tools (such as qemu-img, or qemu-ga)
>> on an unsupported cpu/architecture.  In a hackish way, by specifying
>> --enable-tcg-interpreter on the ./configure line.
>>
>> Today (with 7.0), it does not work anymore, with the following error
>> during configure:
>>
>>   common-user/meson.build:1:0: ERROR: Include dir host/unknown does not exist.
> 
> Did you ever send a patch for this? I something like this should do the job:
> 
> diff a/common-user/meson.build b/common-user/meson.build
> --- a/common-user/meson.build
> +++ b/common-user/meson.build
> @@ -1,3 +1,7 @@
> +if not have_user
> +   subdir_done()
> +endif
> +

https://salsa.debian.org/qemu-team/qemu/-/blob/master/debian/patches/common-user-no-user.patch

I dunno which one is right - "have_user" or "have_linux_user & have_bsd_user".

>   common_user_inc += include_directories('host/' / host_arch)
> 
>   user_ss.add(files(
> 
> 
>> This is with --disable-system --disable-linux-user --disable-user.
>>
>> And without --enable-tcg-interpreter, it gives:
>>
>>   meson.build:390:6: ERROR: Problem encountered: Unsupported CPU m68k, try --enable-tcg-interpreter
>>
>> What's the way to build tools on an unsupported architecture these days?
> 
> You could try to use --disable-tcg instead of --enable-tcg-interpreter ... but I guess we should improve the logic in configure / meson.build a little 
> bit to do that automatically...

It fails down the line when building trace files, I don't remember where exactly.
It's trivial to reproduce and the failure is at the beginning of the build procedure.

> I guess Philippe's patch from February should do the job:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00894.html

Lemme give it a try...

Thanks,

/mjt

