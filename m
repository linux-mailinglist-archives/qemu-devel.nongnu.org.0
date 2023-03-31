Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB206D2BBB
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 01:36:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piOHZ-0004h4-Ms; Fri, 31 Mar 2023 19:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piOHR-0004eg-6t
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 19:35:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piOHN-0004t2-9M
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 19:35:35 -0400
Received: by mail-pl1-x635.google.com with SMTP id c18so22761789ple.11
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 16:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680305731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uf4QCLRBCGSycxbDodEKNVANfuSyvllGrI6niHnk1MQ=;
 b=lEGH5B+NTbLn28FmQ6euzW36uzzz0pGvWRCFjTdE2DrcabxT19MGGAkWGXXbzT1OHA
 a5W1BK1Ov5NWnbgQSja9CNpi0pd+LJ1lAosCiPJ+zPXIib2iYNzgweWP5icdfv5Ei5/z
 MBASYWzQ/ytvsrKsk35HL2mu2HgPuuabKfOJwzp7vaoA+chPKNC9YEDHgqX2xbLR9opC
 3IvUKecVZEJHyyQvMqwH2liXcz5DupdqVrvfReB1wh9PQYP/zj+fk3GFP5wm59qOxc/2
 RWN40DTAnNK3A9yRTlZZJpSIDBBIC9XhK8IJh0sKHyhCjOzX9i5ct3094/7iTYJO+z82
 K7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680305731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uf4QCLRBCGSycxbDodEKNVANfuSyvllGrI6niHnk1MQ=;
 b=iOhDduLiVNZlqJbVhlRl4EgQ2pSZmvGuv7TgVdnTVEKiIkSQzELuCE8F22r/B2LT55
 QVBwnZUYznP2skRsrAxDqbAFWQXYJZrtvZmQViewh0aNS/HWGiiAfVp98+qR0bjj2KMq
 N7M9kuiikdrKu5GNgElQSd1p58VVzIp76cAYmAcAh6YpEImSc8G4dtPHWaoDLoQp8Av/
 fn+zMMXvlE6Gt2Eee3Ayw/wQEeijQHA6ZW3HK0ZPGZUcPRu3XMraVhk5d31mj6Ht9q7c
 pHhnANd2g6N57AWuOSTi6XEEo4AMMnTOTgZ+22qGJHbF/sLtvTLUMTBRAaXt8aMg8F1z
 OzeQ==
X-Gm-Message-State: AO0yUKVb5gF6w0ewkWNYq2gNDCF0FYvo703vRflrrTVDzJQ2aHuarJGP
 ys1JpHh6c9DjIhYaQoion3kGuA==
X-Google-Smtp-Source: AK7set8geEnfnvHLeJ8oA2Hqv6wjgcAJWvJZ4WZOQE6M2vNBuVc8EQSxpYSPXpDjRcUoNgGz7Nrnag==
X-Received: by 2002:a05:6a20:4c17:b0:dd:f73d:17b with SMTP id
 fm23-20020a056a204c1700b000ddf73d017bmr24994943pzb.12.1680305731206; 
 Fri, 31 Mar 2023 16:35:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 u16-20020aa78390000000b006281f4a54bdsm2319146pfm.154.2023.03.31.16.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 16:35:30 -0700 (PDT)
Message-ID: <6a62d233-d063-749f-ffcb-dbb893b512d0@linaro.org>
Date: Fri, 31 Mar 2023 16:35:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] bsd-user: remove bitrotted NetBSD and OpenBSD
 bsd-user support
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
References: <20230331141833.3647-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331141833.3647-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/31/23 07:18, Warner Losh wrote:
> The NetBSD and OpenBSD support in bsd-user hasn't built since before the meson
> conversion. It's also out of sync with many of the recent changes in the
> bsd-user fork and has just been removed there. Remove it from master for the
> same reasons: it generates a number of false positives with grep and has
> increasingly gotten in the way. The bsd-user fork code is much more advanced,
> and even it doesn't compile and is out of date. Remove this from both
> branches. If others wish to bring it up to speed, I'm happy to help them.
> 
> Warner Losh (7):
>    bsd-user: Remove obsolete prototypes
>    bsd-user: Remove netbsd system call inclusion and defines
>    bsd-user: Remove netbsd system call tracing
>    bsd-user: Remove openbsd system call inclusion and defines
>    bsd-user: Remove openbsd system call tracing
>    bsd-user: Remove netbsd directory
>    bsd-user: Remove openbsd directory

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

