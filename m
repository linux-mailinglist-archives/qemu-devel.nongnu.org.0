Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F83E523F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:34:23 +0200 (CEST)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJT4-0001Xv-LH
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDJLi-0005yl-UV
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 00:26:48 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDJLh-0000bl-Ix
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 00:26:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nt11so8101108pjb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 21:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J0TFZOn+wBe/GxwEYmaEgtQfirBHey6C8K52OuxCSeM=;
 b=rsyTaP4kvbzMtdRCmNrrFl+A7isxhyTqYXEAQPBybZTwbCYt2sqlWT/vstbb4wBHiQ
 JKMP7nRyDK6T7uxn1jLBgikz/gQTO49dXJl458qcb9KlySG90kr32/9JV16zsoxo+M5X
 1uANz7lkshB//tG1lQ/yUipRI/xQKoYYGrs1SnRN9InytDYXpw3s9+Mj6eRy3liekiBy
 VSFLU0RojV5O7+s8WX9aFgTsCBGJ+FmJyBYDST9UPgqqo+e1rNQT5saB4miq2wEbhwsa
 jIPkehNaJKtgG5RwlQelz4r6bqtdIVHmkBiNj47i8HL/YkhCKdiNwdppGVQY6UO/EWhS
 V67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J0TFZOn+wBe/GxwEYmaEgtQfirBHey6C8K52OuxCSeM=;
 b=jjYDseFIVxP9vZmjhtusyc+/MVp0jLV9inaqzMY/DgjJkQQmfTHSP7aYNljHwg2bkE
 SdcUW9uqPL5AYUUl6g7ZIFiqwtCzzIL2izY8AnxaryWPsGumV5qpyMt6vD9NP6dyP8dg
 EKp8qrZ1/x8XoiYegFPL0X8siAwdrE63c77fGiGCq6jlGf2p5SWMkeCu55e1YMaM6efP
 Oh3gDf1V5+1vdpwOCGYIiJcvTjLSP4vNxDZMtMj5Tcri23oMFOmpxjcYeS/Jyz+UMFKt
 Zol5cgnvQiiYFIfDKuQjJEBnnqtTwgMZbH7iHiDQU3kc3BQlJkBXcr7HkmGGR+eGi6ut
 +LkA==
X-Gm-Message-State: AOAM533NPzBt+pOGB9FzqtiVtIwD0VIvYaKgZA2Cxza61BUM2r/sxnY2
 4/Flktu0YtxlwGtp9rj2yvZ+oQ==
X-Google-Smtp-Source: ABdhPJyU8m2N+IVVLQ37MtunFNluiBF3eCLJZ8XkWUr/zkT9ARWwTgjZY3maUeAPYumTHtRTINQ0mg==
X-Received: by 2002:a63:4a41:: with SMTP id j1mr162853pgl.227.1628569603747;
 Mon, 09 Aug 2021 21:26:43 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 195sm211696pfw.120.2021.08.09.21.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 21:26:43 -0700 (PDT)
Subject: Re: [PATCH for 6.2 32/49] bsd-user: *BSD specific siginfo defintions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-33-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41b304c9-79ab-b8fb-4440-b744f0ee156c@linaro.org>
Date: Mon, 9 Aug 2021 18:26:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-33-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Add FreeBSD, NetBSD and OpenBSD values for the various signal info types
> and defines to decode different signals to discover more information
> about the specific signal types.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

