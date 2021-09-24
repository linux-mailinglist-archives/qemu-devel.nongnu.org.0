Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D24417E6F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 01:52:44 +0200 (CEST)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTuzj-0005GK-Fm
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 19:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTuyR-0004Ho-CB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 19:51:23 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:38853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTuyP-0001TF-Pu
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 19:51:23 -0400
Received: by mail-qt1-x831.google.com with SMTP id d8so11054217qtd.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 16:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dg5SXXLrwTzeV3NJjnZ05C1K1nupn7pTxNZ1otxDmGY=;
 b=dhW4nyUIWzpSslEoXYHcKcZzqUt4BHKRn5Z6FbA4ElFdJYPt17VCRT7cqlL7SONluG
 ZnBZTQ5QLHkGyQUfDyhgOGwPIXFc8pu1KDewWmifKPb+aBxaPC98um9APw76tXdM9zyi
 si8qWbdQ/Beto3tJVlNeP0E5kwy/e61zLYyKE5QEy8+yuTDU0swGQJbj4w85ChQKjrUf
 SJhyBeqNcZdudMPUzDfg0T/0U3zMykf31mXf1tcNXcLM0Vaz2mQwb2lzUqar0Va8iOQT
 +282Ic9v4NTyfqoSVv+tFCKqhixYhJxl1DbySxdFVfWDkuEFggpFxML+fPUKMkwM4Bqo
 tGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dg5SXXLrwTzeV3NJjnZ05C1K1nupn7pTxNZ1otxDmGY=;
 b=WvFYtHKBIKPSmvPWZXi4ajQxjmzSI5QFgeSBc/IlxOSywGGf2L+tNCIIMf31EZVIEL
 lHPG1bRTMtqrnpF18WonjFlAN7CRxEVfz79SrBAV4c0j4mITWNfSPCQGhB28WkcG/oM1
 VVA8kl+5WnwzcF6Xrs+z2nasCPnO5Ag2WaEQHvG3AQ/qEopl53Z6UG8wv424lovwk2bt
 JZyifRqyGNXR55jBTPXE7/ulg7p0FCDwad7k+yyhFFFyh6aGODnZQHSd82JmrkihiJec
 Xrt3J00Kat0uD+gKT28OEcMNUARldN5O2zn3KZ+Ac9cQX74lgkxL6ZeO0T8ySFeLYKVL
 MW0g==
X-Gm-Message-State: AOAM533PRkQt2BfSgSAzBXoJNzvdKaF/DI0OUOKjfvWuSu8TpmlvaIyC
 cb/xSTEgXUfACqIUVY9nKxfdPw==
X-Google-Smtp-Source: ABdhPJzexTLijOY013jTY7O4Po61QXIij17T3bYbQihmj7DoWPluoVPvBiLVtVFZ9Gy0JM5YhWuWEQ==
X-Received: by 2002:ac8:5290:: with SMTP id s16mr6976507qtn.412.1632527480308; 
 Fri, 24 Sep 2021 16:51:20 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id p15sm6496213qti.70.2021.09.24.16.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 16:51:19 -0700 (PDT)
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
 <CANCZdfpNFhFQk0inNhtb6Ft4vdKtar3jBBjpL6_KfTpf9yj4dA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afaf4bfc-1fe6-e771-5f3b-7e637f21bcb9@linaro.org>
Date: Fri, 24 Sep 2021 19:51:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfpNFhFQk0inNhtb6Ft4vdKtar3jBBjpL6_KfTpf9yj4dA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 4:11 PM, Warner Losh wrote:
> It brings to mind something else... There's times it might be easier
> to refactor between bsd-user and linux-user rather than upstream
> something that's largely copied from linux-user. Is there a good
> way to do that and talk about the design before I sink a ton of time
> into something that's the wrong direction?

I certainly wouldn't mind a top-level user-only/ or posix-only/ in which we could share 
code between {linux,bsd}-user/, but I don't have a good idea of what that would look like.

Already you have code for MAP_EXCL that doesn't exist for linux (though there is a new, 
related, MAP_FIXED_NOREPLACE, which linux-user/ does not yet support).  So even with 
"obvious" routines I'm not sure how much real sharing we can get away with.

All I can say is: patches welcome, and we'll bike-shed them as they come.


r~

