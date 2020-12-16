Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7ED2DC77E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:03:04 +0100 (CET)
Received: from localhost ([::1]:35876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpd0o-0007J3-6B
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcux-0001BK-DK
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:56:59 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:34301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcuv-0005Fe-W6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:56:59 -0500
Received: by mail-ot1-x330.google.com with SMTP id a109so24368564otc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iVsgdlU49PhgitUe3lBsmw7IoIfh2xXHyqLGZvpLZTU=;
 b=daz5Uf1MbPffn8zQC6S46OIU1fNVrltJG+8s/sa/ImpPaEC90mk13Fuw8WHWqRfDcf
 9BD0/JaCUaw/AHEmFzBLKCy5yMPvzb0L7fra83eCaoHsvr2DG+0V1p28ot7LpWzP040k
 w04amT8IC2SEnB18+9yYuJKoeT4E2UUTa69UPlEtGX0hSDA89YyEQKRu3z+NaJ0N4Jjq
 aMUoI7/8mAAZibvvEhaw7yH8oXEIbbMLWZC4ZFiuyn8WmihEtgnrXXIdtPro5JVERFCG
 6x8lN7vMSOVeZ4/DPKLBMGTg2xLcdnW0XwbgVsuGG46IQPxBqUkFQU8WPTJ86vecqggD
 sI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iVsgdlU49PhgitUe3lBsmw7IoIfh2xXHyqLGZvpLZTU=;
 b=eFF1qEs0JF59i+ObZV+MtOfkOVMH63Le3qBWccj6H0pEPshkZiE0g2HurJxOQHlTzr
 6BA74RQ9x3M6Dl34y6qhalFYm1AoaK/8BhcNZ+b0YfP3d2n+2RJ2zHeMgJ35+gbAqrbp
 /I3RwVe1TJ6piagzUAgKO5p21lLQr5GRoRaDKdYUpfmXPGuaLuTzs6Zp+Mux4UlGc31k
 wDDX0dc+6yZa8hHK+g2Ncdrn3DsDHNWjtL+L6z+TdkKpBV4fp0DNinq1YvwYzCB7rSQ0
 s/rY/624cHgTbqVCc2ITHwm4T1m+SXAHWmUK+7f/Za76N4VeqPLei4kM2x/ya2GuirQO
 cR1Q==
X-Gm-Message-State: AOAM531f507IriUowsYGKzEF3mtZzXgwQ9mjNboQMj6D7jxkmYjF2TQw
 KtYUTNLgzradLn7WIGsPdh/tUQ==
X-Google-Smtp-Source: ABdhPJxX/4GN48qZQ6649uHIn12Dg9foFxOYe1CqLL/Irci4l2+u/QH/QsEix1RrjKNj2FmE2xT7CQ==
X-Received: by 2002:a9d:508:: with SMTP id 8mr27363646otw.338.1608148616903;
 Wed, 16 Dec 2020 11:56:56 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 11sm663690oty.65.2020.12.16.11.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:56:56 -0800 (PST)
Subject: Re: [PATCH v1 6/6] gdbstub: ensure we clean-up when terminated
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9d800f8-cf7b-0f98-0290-fef3f6649711@linaro.org>
Date: Wed, 16 Dec 2020 13:56:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214153012.12723-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 9:30 AM, Alex Bennée wrote:
> If you kill the inferior from GDB we end up leaving our socket lying
> around. Fix this by calling gdb_exit() first.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

