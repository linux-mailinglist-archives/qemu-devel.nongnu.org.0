Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DA6D09C2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 17:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phuHo-00052F-4F; Thu, 30 Mar 2023 11:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phuHk-00051k-EX
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:33:56 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phuHh-00077G-SN
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:33:55 -0400
Received: by mail-ed1-x529.google.com with SMTP id eh3so78007904edb.11
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680190432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W8m7oclv/JhwdLC1DGzuajS89S1N824EvTtuAlnQc54=;
 b=C3ldsXkm5T1Hij6A6lNFOCBkfVbKzfYFnP13YZHVSNHVxEnE61UHw6NHkXjaw+S4UX
 xTVPV0euvyTaRStKXo7e7i3yo7eLv2KwmMsGy2jNG3ocpgF02clp7wuowLlZrp2+ANEu
 b1mSdp7ERNwDXbm1QCQAWJMty1qGev0bRKq6nI2JWl8Pvks84xJ7UzAzqAo40sunY87q
 4FTfuAS5qUUVbIUl+T1QEbpGtjFYKL5eJPlUHSwxsPR8b9Hr4VYSSbWS4lVca6cHUDUc
 qB1S+tO2EunVKWgxAOu/0bu5sKesvszbBJxtPDqKU/ghPLyFbAr/WrzgVaK1UFP6/tLI
 FOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680190432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W8m7oclv/JhwdLC1DGzuajS89S1N824EvTtuAlnQc54=;
 b=SGVaqanYiqSupYwKpZ8oq679QaQBPjGr7pIZm+TCZ84TblO+QHtGFxmnacFMfb0CAU
 usu1LuGuWK5XKIkZCKb0aNk10OVlsz/qUTnSYC3P7Dw18ZU/DEd3zDTc3b4H0UrztL2I
 ao8B/BCJhRaW163vbxkO2MQXWbqHSddE5FADrYJfJFox0UKerJs6LcTGIU8X2+hdVc9S
 7xd9ZzBozYA7p5pgFb1owk1gibSAOjtdSIntuWDwAwxTRYLh0AYtbljru5DkLM7V5NYf
 3aiDrEMOOASyG0xfqLKKpRC6rAk+bruULjXG5Z0TcJrqKTsTHRo+f/inXe9VRMsIAExR
 rh3Q==
X-Gm-Message-State: AAQBX9exIoU0N8cd0+ZBNhCut0p9sftr4TithmK8ZTmmmAvPDrwU22d8
 ae4MBFtrmywoOc7f5MGv/y6KDyzmibV53FAL3tSCFA==
X-Google-Smtp-Source: AKy350ZYuaFQ7nRmmqZLSIu5DVbHe3rj6Vfvstz65lTSlXpNV710HJ16rcRu+lbaZFV5x+l/iGp5l7GORhd06ZEOKBk=
X-Received: by 2002:a50:bae1:0:b0:4fb:3549:a708 with SMTP id
 x88-20020a50bae1000000b004fb3549a708mr11584509ede.6.1680190432137; Thu, 30
 Mar 2023 08:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230330152613.232082-1-thuth@redhat.com>
In-Reply-To: <20230330152613.232082-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 16:33:41 +0100
Message-ID: <CAFEAcA_2H9rMG6uu8JY8VDY96UjmvPuXBYzoQmy8adM+sqUF+Q@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/malta: Fix the malta machine on big endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-stable@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 30 Mar 2023 at 16:27, Thomas Huth <thuth@redhat.com> wrote:
>
> Booting a Linux kernel with the malta machine is currently broken
> on big endian hosts. The cpu_to_gt32 macro wants to byteswap a value
> for little endian targets only, but uses the wrong way to do this:
> cpu_to_[lb]e32 works the other way round on big endian hosts! Fix
> it by using the same ways on both, big and little endian hosts.
>
> Fixes: 0c8427baf0 ("hw/mips/malta: Use bootloader helper to set BAR registers")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I've checked that both, the kernel from
>  https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mipsel.tgz
>  and the kernel from
>  https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz
>  now boot fine on both, a little endian (x86) and a big endian (s390x) host.
>
>  hw/mips/malta.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index af9021316d..b26ed1fc9a 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -629,9 +629,9 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
>
>      /* Bus endianess is always reversed */
>  #if TARGET_BIG_ENDIAN
> -#define cpu_to_gt32 cpu_to_le32
> +#define cpu_to_gt32(x) (x)
>  #else
> -#define cpu_to_gt32 cpu_to_be32
> +#define cpu_to_gt32(x) bswap32(x)
>  #endif

So if we:
 * do nothing to the value on a BE host
 * swap the value on an LE host

isn't that the same as cpu_to_be32() in both cases?

thanks
-- PMM

