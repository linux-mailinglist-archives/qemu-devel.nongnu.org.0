Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC239921D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:02:12 +0200 (CEST)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVBz-0000bz-H8
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loV9m-0007W3-Dy
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:59:54 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loV9k-00066R-OO
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:59:54 -0400
Received: by mail-ej1-x630.google.com with SMTP id l1so5154596ejb.6
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0/zc7eOLpgmvab+duY1XFE64+SVSO5UGuSmToRlCjQI=;
 b=a/1Ns9JY61mLfKC2pfpToeByxz6JPOm5jy5wftG+BTDWReiXq2WvIXyoFoQNbclyzZ
 KTB0gv7RWeuWWnZcdTh2UliKmAN7jcKPFViWWMLdFmKeK2ppnOLFGHnvj1jvsM1ip2+p
 +qc54WlKcCTGmTpMeiICMaSSEiNt1h30Dkj1F+Xh2QOUzOW1yzzjai78OmWp9rTj3/lg
 2CO0yOzTOWzU3mWUu7hnCrDW4Bv5PGXTx+dGQp2MEAv0+E0kkwApSHk9XyQj7l8O2ewo
 DBBnjxb/ZNY9IpHYMH0e2zsLIB7WoMHb7zb8NTKjDnnZ4tut7koLaXsfHeQD1cVDiyRD
 lMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0/zc7eOLpgmvab+duY1XFE64+SVSO5UGuSmToRlCjQI=;
 b=G3BK4St/vIDWyi9naqlUmg1EJKsmg5A7YnvSSOcOc9EnUSvgVMupcznB86ep18A4vT
 azEg/xUEgM7c0YFOXnr9yN+WuqrUuRmdA3bzVZWbYvXkxxItxf7E0kqFxt2Uz7jYbBE5
 hvIqSwnGHtUJXtU4EqAZHJSaQAS3vdgB9qcWhFP64fHIglmmyfqZwG/X/6nUkpyHTwuC
 yKdoOnPGZZmb8sIIHC29AXtB3y0GDSkQxcxLlbG3PqUEaRPshbUVRVgwZk5FwhGUJeZB
 PVz0pUAsiYWODgDf1YQ8En24MGF7I/wGDVzivjbnZk4r8ztPGp3F7yEAyc4PaJRlzQAI
 kcwA==
X-Gm-Message-State: AOAM530afyvn+u0dga1MrSvbg65ILjREWQtVzwG8DHy+uNjP3FeMTrut
 G0AhXEfZ1nLQHhumBQ1F3ePnkNGzGtVKfA==
X-Google-Smtp-Source: ABdhPJxzUaQaGrSj6NN0OJYmlgjwdCzAlE52wfcHa3PRzbHy53XqJ43YlFF5aMnwlkWRvkPXjjcZug==
X-Received: by 2002:a17:906:3016:: with SMTP id
 22mr35028634ejz.28.1622656790567; 
 Wed, 02 Jun 2021 10:59:50 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id p25sm346548eja.35.2021.06.02.10.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 10:59:49 -0700 (PDT)
Subject: Re: [PATCH v7 09/27] tcg/tci: Improve tcg_target_call_clobber_regs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb630b53-7dc7-fa18-66c2-526338af17ba@amsat.org>
Date: Wed, 2 Jun 2021 19:59:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/1/21 5:00 PM, Richard Henderson wrote:
> The current setting is much too pessimistic.  Indicating only
> the one or two registers that are actually assigned after a
> call should avoid unnecessary movement between the register
> array and the stack array.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

