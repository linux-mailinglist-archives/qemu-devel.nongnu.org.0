Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D64936F4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:13:29 +0100 (CET)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA71z-00037V-TS
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:13:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6ep-0005zd-0g; Wed, 19 Jan 2022 03:49:31 -0500
Received: from [2a00:1450:4864:20::32e] (port=39861
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6en-0003IX-F1; Wed, 19 Jan 2022 03:49:30 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 h206-20020a1c21d7000000b0034d95625e1fso4614694wmh.4; 
 Wed, 19 Jan 2022 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eImK0eXsWep8SpuRUiznEtMz07rDvyn1SkHBOd5KUVA=;
 b=PU7AWWPte34slZtiC061n/SbMgRDFJLtrEUBMa54T11pWhMYrtdUzSDm6EiAqb83Rt
 uH/jUjC7Nyrg/gc3OLVDQ9D4CWARUELgOsxSpgus39SlXena9lenNODW5Bnhc40o5yaK
 YWFUC0ZQ7BYfZXYfuGAmAp+kCUgy05nRhw22hjS3QNBdZWSuBXlJqF/PSEgzpabq+RZ6
 Bx/syZId5tQH9rjMrNXXkuDAHNFPt65P5ta7XQZA47YGauuOBzn8HYtWX1yH9qZN9nus
 gU3XPNT9i7Su7zWRHVfgLtpptBxe1/2I3ONv+zyiqxiuNFVyonOutePWd5Qy04N0Sxli
 coDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eImK0eXsWep8SpuRUiznEtMz07rDvyn1SkHBOd5KUVA=;
 b=WN8e9FR4oR3DaU+X33jVGfCDwDhW+/t+BIrC4/YRLPKwuqk3SqxzkxklGWoYjmdoz3
 10XC92OY2OjL2nJt/Uy0iF9Dxg2YH8s23sKNNUSF6qya6FG9TmsbxUczZoB6K2On0OWN
 gapIf4fiSPmG1B8I/zqMLVab/ENCtwVrESVhBd+uhnlVTv18h1XbGmgF2G8RTtDUSv3p
 tbFJH0Srd+LBWP1H4PvrR3+p4rSiH0nVJpai00Mn9cNJEAlgRhRDp9djQMROPvYiaTO/
 pvoJQi1YuPQFpL7NnwN+sTUxs5Jw5CfGUwL5+Qw/uE21Mswm7j+CH4e8FxKXB19++EZR
 jtiQ==
X-Gm-Message-State: AOAM531bQhmTyqJ9VdFIALiymHBYG6aU76wOa2nFvdmAW/G9W79y13rc
 bus19V+CfQSozg9eKBB7SBVXMd9dVUQ=
X-Google-Smtp-Source: ABdhPJxYu8I2K1ph/NhCqFKtHazZFnprjcH82ewUapdpB8B+l89tdJic1V8ota1rx58uhFS0zFodtA==
X-Received: by 2002:adf:e948:: with SMTP id m8mr4112121wrn.556.1642582167926; 
 Wed, 19 Jan 2022 00:49:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 1sm11638611wry.81.2022.01.19.00.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:49:27 -0800 (PST)
Message-ID: <1fb12907-943e-1039-3916-5e5e1ec80075@redhat.com>
Date: Wed, 19 Jan 2022 09:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] meson.build: Use a function from libfdt 1.5.1 for the
 library check
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20220118170548.97288-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118170548.97288-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 18:05, Thomas Huth wrote:
> The fdt version test in meson.build uses a function from libfdt v1.4.7,
> but we require version 1.5.1 nowadays. Thus use a function that has
> been introduced in that version instead.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/822
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 762d7cee85..d1cc04c7a2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2276,7 +2276,7 @@ if have_system
>       if fdt.found() and cc.links('''
>          #include <libfdt.h>
>          #include <libfdt_env.h>
> -       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
> +       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
>            dependencies: fdt)
>         fdt_opt = 'system'
>       elif fdt_opt == 'system'

Queued, thanks.

Paolo

