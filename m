Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C84343D7C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:09:05 +0100 (CET)
Received: from localhost ([::1]:52008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHUe-0007By-DE
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHP0-0004Fv-R2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:03:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHOx-00081u-0O
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:03:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k8so15973124wrc.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7PyeiwA8kiODSBKKGR62jKcCbWFN7NiYGeO8owTtiMw=;
 b=hy/q+aoXsXgVQ5KzXPWXv/imCAGzW1LXdTPMo2rUFr/YDhw9wbpYJWd1AMbF6ZxqPQ
 Ysj3a3q0PaIJRVsu159n6jvTlOyEa7Lzb3Cm3NVbM9+P8taCHFbV3ow8T4koV2RJ6gMG
 5sGmeqbZ/UDPSuPkESMfc5CgcInaER26IbLeYkoclGzg7i5nsPP40Qe2Jnc5GbLJlRGY
 LLnNloN6NmfiCM/wzfnviUE6F197AyPyncEjxogUQ5yhAQySCE3F2ZhYwBILStXCT1Sj
 Ntz/RN+m91eSyQhb3PWO53j54cOmijIu13mq7173/fH3uO3etDzV/MnrS70c8MWlGUC3
 yX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PyeiwA8kiODSBKKGR62jKcCbWFN7NiYGeO8owTtiMw=;
 b=bxnLRYis+iyho/BSwcYaopfqHsIwWvoPNme1DMbJHM0QQaDBgo6Qr7ZbRC0+9l8u12
 N94AeXA3vhGEDhi/zF1gWapY9ae/VygZTCqUsqnNz9KHwlyfsz/N4WpbDHgueDeHg+dD
 gUggMXpjCxnYwgEzM0NHn5+10BY7rDsTUIQ/dHAFXJo00rZXk0Kqbt0fcsYbdnHAb2GP
 VFcC+NInKtmKEGdeqGQ5kPb5HmUr/5Ha8HuE+twf6+AASdm11Y9LSH6e3SSAN2okG3w8
 maRWCU7935gmyPMVc2/UViBR2MhYx5za/LXnTohvyw7Iuy0g0hpH77ScNJG4x0bOll8G
 QFtg==
X-Gm-Message-State: AOAM533G6KzwIKjQVF0/d+cxHzxZPrTmaoJ72bWa7W5hj4792s+/MyPB
 R59Gb8vK/mvBvalYqKmaNJ0=
X-Google-Smtp-Source: ABdhPJwel2ZgUXldIdeTnU88w04+YApW0KILfae7ER09aP6mGxYl7tZ31/XuSnEocR5lrah7VaqbxA==
X-Received: by 2002:adf:ec0b:: with SMTP id x11mr16926946wrn.175.1616407387505; 
 Mon, 22 Mar 2021 03:03:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a14sm18815352wrn.5.2021.03.22.03.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:03:06 -0700 (PDT)
Subject: Re: [PATCH v3 for-6.0 2/2] tcg: Workaround macOS 11.2 mprotect bug
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
 <20210320165720.1813545-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6155888a-e1af-0a47-a669-1bc12c4478fa@amsat.org>
Date: Mon, 22 Mar 2021 11:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210320165720.1813545-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 5:57 PM, Richard Henderson wrote:
> There's a change in mprotect() behaviour [1] in the latest macOS
> on M1 and it's not yet clear if it's going to be fixed by Apple.
> 
> As a short-term fix, ignore failures setting up the guard pages.
> 
> [1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 88c9e6f8a4..1fbe0b686d 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -864,11 +864,15 @@ void tcg_region_init(void)
>       */
>      for (i = 0; i < region.n; i++) {
>          void *start, *end;
> -        int rc;
>  
>          tcg_region_bounds(i, &start, &end);
> -        rc = qemu_mprotect_none(end, page_size);

What about:

#ifdef CONFIG_DARWIN

           /* ... */
           (void)rc;
#else

> -        g_assert(!rc);

#endif

> +
> +        /*
> +         * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
> +         * rejects a permission change from RWX -> NONE.  Guard pages are
> +         * nice for bug detection but are not essential; ignore any failure.
> +         */
> +        (void)qemu_mprotect_none(end, page_size);
>      }
>  
>      tcg_region_trees_init();
> 


