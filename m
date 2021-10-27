Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A1643BF72
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 04:16:05 +0200 (CEST)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfYU0-00012d-OH
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 22:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYS4-0008Ct-Me
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:14:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYS2-0000UY-TW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:14:04 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso927451pjb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 19:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t7Z9xtJFCYbRv3Y0wHZpGBDtLcFWAn4Icv/dZjmS28c=;
 b=FGV/AJ33EIUyPvv6XmycNyHHsVk6ScPj0daT/yJ/H2fKoVvJ4c4FqSmz0ZXFRkdUaz
 QGXLww99xOCquJR3594nXY9uBeZs+gGczTa/jnHV8mURHG5Hy9OEbf8HvIxx4pOEz591
 a7nxCnRRwmv1WzCM+e3bEiBtrLyG09FfqWaG6QhRqzexgHVfy9eaK9SqReOGN2w+E4fE
 uZ98tNqTs11aS0l+ZqOdwK7o41p8zSQ9XKtBeQGPvQmEQzpom7snAM7Dk3m30/4u73VZ
 W33a8PQGZyBgZd8/wAE7AgrdHyzkTE7onwMC36PgxtBLI8uDtrbY6FBK4GSURQJcAm54
 AL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t7Z9xtJFCYbRv3Y0wHZpGBDtLcFWAn4Icv/dZjmS28c=;
 b=PFjwXQLCC/higYl8382hfDZmFotY1BiesgzK6iNn0ENOUIOj23HqEj6Gyv1OI6Ve3H
 itUbU+S1rg4DkBFOIDhLGXsmU7LVuMeLH8Lnxjf6+dTy4kR2A3fjL1v5QsGqYC4BjIwF
 KA5Fip8tEw54jlmGJ1b185asZ67qijQTY0Pzhz7MHhSQ03JGtO29aBELYqLqk/sa6eAY
 7JlcgzlxQ7qIP/ZHtb7lDRjQVG6yc90jJcQxtEcyyZ3OsdsP/GDU+aSzZpopyCeVu8hJ
 P75Wv82BFCsE8hYdm6NRVaK/OGg1/6Y0H1QS7MCermpQvMPRjN3fUvEajZ4duIN/u4CF
 O8HA==
X-Gm-Message-State: AOAM5303juGoqauxvzW/m6gwX4AosILTvTugNel1f9mjHmo/SKQNPsEh
 +QC8RLcVL756O9IIvJlg6bRb7A==
X-Google-Smtp-Source: ABdhPJxEhexiFCciCFXJ6QWyAx1FODXeFHnCyW0rZz3YlPpIkDizJ/QwYB2slfcCCBq/dmEhza4Drg==
X-Received: by 2002:a17:90b:1bce:: with SMTP id
 oa14mr2674463pjb.225.1635300841456; 
 Tue, 26 Oct 2021 19:14:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t11sm8770769pgi.73.2021.10.26.19.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 19:14:00 -0700 (PDT)
Subject: Re: [PATCH 3/6] hw/sh4: Change debug printfs to traces
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635298341.git.balaton@eik.bme.hu>
 <031a5111bb1ef1e66fd8f05fbe4a5ecbbcb25396.1635298341.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f595e837-4245-1492-8abd-16dabdb06571@linaro.org>
Date: Tue, 26 Oct 2021 19:13:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <031a5111bb1ef1e66fd8f05fbe4a5ecbbcb25396.1635298341.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 6:32 PM, BALATON Zoltan wrote:
> +    trace_sh_serial("write", size, offs, val);
>       switch (offs) {
>       case 0x00: /* SMR */
>           s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
> @@ -302,10 +298,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
>               break;
>           }
>       }
> -#ifdef DEBUG_SERIAL
> -    printf("sh_serial: read offs=0x%02x val=0x%x\n",
> -           offs, ret);
> -#endif
> +    trace_sh_serial("read ", size, offs, ret);

I suggest two separate sh_serial_{read,write} tracepoints.

r~

