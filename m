Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA02B3E7D8C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:33:53 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUhM-0008PC-QG
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUgC-0007g0-0q
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:32:40 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUg8-0005Wm-Ng
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:32:39 -0400
Received: by mail-pl1-x635.google.com with SMTP id f3so11229224plg.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yp4PmJzSKjdsLzpAGGOaI6QmzJLRo/B01PDw3cL+2Cg=;
 b=ux4ukMeVnAAUNu/yY/5siBHUuz1J9O89aOVNXohbMaJ88nzqEFzWWDrXozlQo9pOMp
 UnkhO5zZa8RFZmFQpeUgsIJhmxXisnjZzeOBQSbujDZT7Wpxvzjz6JWHhj8Dt7kzaeHw
 HVYFi3AdhiI9XIFDIMsY3JYt4eace6nTM/8cQ1mBZRz2EHWaSRmir54/V+7/6u/HTNbm
 wtWcNOAgxu7BELo15KqwrgPp0dT0if4ztVmFTky7ZrFE+stJ7VngdvfhUNI6M5EyE1t1
 HyjLv16xBYIS4QLUykmNvoj/jSjd3E6+GjsB4YjdCDgHouwpIr2oYhVEl0E77HIiY8JJ
 4q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yp4PmJzSKjdsLzpAGGOaI6QmzJLRo/B01PDw3cL+2Cg=;
 b=o3CVSY4cYEknyuewEQ+a4geQRKRcb5qMdiFd8c+/rGhkNgqsjnp8SMoEF0iSsCWVBo
 FK5FreTy4Gj703mM9qZTzWohdjv6KtcrlexN3iC+hGifzPSH1qm3nJ29C6jTXiy3R5D5
 thV/f/PDG1NYyiQR/D/v5+ziHOEGvayNMz7KR/15sjb9KT5Ah7rj2BS0IZqQLzVke7l0
 OBTpGDmgIQdGKFgFRep7B5HLrHJhfo0rPm6uYqHX4dqNaTeuBv0iUn9ELh1DBNYfdDay
 rt/ICftx4UeGoGx60u58PYXkHJ/xvVEP77Ad9goacar8IP0qLDgDfo1HNlG1spXRiDNw
 OXWQ==
X-Gm-Message-State: AOAM5316FOycW+UdLJiGHBuntVCY4jwuXwHl4fPYv7A4H0et/uqSeYhC
 QYM+MDt5CoWlvkDd85jWC4ffr5e8y5GnJw==
X-Google-Smtp-Source: ABdhPJwaEJsjB0wk72gslo3J/y4B3aklw5RP/BsyCWbeNisY26Mwp2TI+cIbaXW09OYTFX72v/96mA==
X-Received: by 2002:a17:90a:c7cc:: with SMTP id
 gf12mr13899260pjb.152.1628613155346; 
 Tue, 10 Aug 2021 09:32:35 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id w11sm29133560pgk.34.2021.08.10.09.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:32:34 -0700 (PDT)
Subject: Re: [PATCH for 6.2 39/49] bsd-user: Need to reset CPU after creation.
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-40-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4614b70d-4950-6689-82cc-66b743329889@linaro.org>
Date: Tue, 10 Aug 2021 06:32:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-40-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Slightly amusing that the line was removed in patch 1, because it was ifdefed.


r~

