Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE66303749
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:23:43 +0100 (CET)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IhQ-0007Pr-V2
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4IVB-0007Pe-P7
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:11:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4IVA-0008AQ-8x
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:11:01 -0500
Received: by mail-ej1-x62b.google.com with SMTP id g12so21545452ejf.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5CxHNjI+qvDhX1pmQ8M2A/vJjjpvsdh7fwQHdIQgv+0=;
 b=cTzGSWcVO5ALmh8w1ZcCG1r0gN98nAKwuIPYbGG82tUXq3KJBEMF/LiJN4X8PjvI5t
 wUUZb0rvrLOAvdy2FwAhQ2pSp8ihUo+ZvZtXkX3msWLR/rKMQuxj50xiZJUvg8Zz6SOE
 szl5fAfguaPZFXreJ3n3vo34aGRH3vbOsHrwILyS/83WIYrRa8BzHKJFOutdQyPTuzaD
 S7lPKOx0ck2gH/CfmhdPPT7gBT8EzuQkKcSeBbFybdx3Itkxg078Nc/yVSeQ2zn62WLB
 OGN/BDsjv4Ikg2gk/+G1gGzYQYVuQ5qN33+34gA0Oj8heIwsUAbKEeZs+QLjLLyqu8wt
 d4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5CxHNjI+qvDhX1pmQ8M2A/vJjjpvsdh7fwQHdIQgv+0=;
 b=Qj7du7iHNKCW0fyQEBRIJsT6jucx7kZRc51wSUXIv/w0tFB/iJBPFcfZJX9TDl9Ccn
 GFpAcFVBQ/BaIm0skCLPJ9UWvxCketOycmEaazKC1eMRF8HY4h7A9XNYZ6dmM/8viBe9
 Y3Bj69m+BAAKSgSa1xvnl3Po5+3+NFDF5vMfQeRMOMggPUoFaeXkZcItvAkOdobx8KE7
 HC7O1vl/res7LNSGp0Wfr/RXf9ZbCdRDYDapzdpvdtXLK3OvCkcG9Y73/W8tQzaSrwDh
 Y2HizikK4bSh/G6iL2Vau8OyJKtq4j08h5cT0U5rlNS621hFCy4TGPAvX9ajJQ84KurM
 2eOA==
X-Gm-Message-State: AOAM530t9G71SpJPPUgmSYfCGLn1TFMGnIYgt6S+BGIKeAFeoiU51YdK
 slaGG6+pTNjmcoAvpGZSwNU=
X-Google-Smtp-Source: ABdhPJxSjZ7AZ6e3VRT45edxeqNGBRJSnJ8o8YzymM9em8zKn5+lTr4iZbvDhK61PVTr7vMz+QjFwg==
X-Received: by 2002:a17:907:3f1f:: with SMTP id
 hq31mr2672656ejc.205.1611645058350; 
 Mon, 25 Jan 2021 23:10:58 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm1000675edv.32.2021.01.25.23.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:10:57 -0800 (PST)
Subject: Re: [PATCH v9 07/11] darwin: fix cross-compiling for Darwin
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-8-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ead75e1b-9454-adc4-45b4-c7800b47f74d@amsat.org>
Date: Tue, 26 Jan 2021 08:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126012457.39046-8-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 2:24 AM, Joelle van Dyne wrote:
> Add objc to the Meson cross file as well as detection of Darwin.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

