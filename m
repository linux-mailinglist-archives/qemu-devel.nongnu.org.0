Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33D2D3664
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:42:20 +0100 (CET)
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlgZ-0007G0-FM
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlVb-00064h-D8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:31:00 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:40200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlVO-0003cn-T8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:30:59 -0500
Received: by mail-oo1-xc44.google.com with SMTP id 9so1734151ooy.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FtsA+SIdCVeMyfZ6t+7fEmlWWZGVJv/mo4mraUSfad0=;
 b=ecB2zr2/2QcaXiCklV9z4arwizskcfvWWnbksmfqBWUUnxSupevt2UlQzqz3TZNLZL
 diK2guz+OTJrTZUY4ORYW85xOBpqG7QlrxJFjElDELespFVbq7h4vslP7+ZQqjATs2yx
 xXxnWEa5Ov6rhLLjVy4934eqcuPOsPFWtPWzF0oDAek0q+B5jkALnkXZpBkFbR5Pdn1n
 mAp37hZY21uO4SMigIq6B4c9ExyU6Ti8x4f8fQQBSzo3wD9vnIu+6IbSywLA7j6NDYyz
 7ZUkIGcCVi7hJ94uo1f45blSqDbQj4u2kSCTnLW86Bu+kn4oZj17nprkeb4Whrea8qDb
 tkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FtsA+SIdCVeMyfZ6t+7fEmlWWZGVJv/mo4mraUSfad0=;
 b=JGMFvKAVxItx8yc+TmpdJ+AzPLkbuFXHH1OysoU43zdBacpes+vAdFLtU/1gy2T9+y
 OxfKsv3X7fydns0pBpFK8qr8DFKode5aJm5X2tfsMFp2suYeGwB1yf7hOskjSfh4rbRe
 kBzssWj4DLsxfoler5lOViOIR/I9Ymth4IlR+ieDBEcDcIyEdLR7EXBtWHszSjeLGurk
 Vmt+dd1agH1CyNjZFm2+ePvzlTASeMmOngBkvDjbis/chKjHvv8bj132oZd7yDHgcZpb
 0xZv6m16QqihY43gRuxXB0QlYeZ6pvlc0fhIWcJqshIxfaqR20V33PLm+F9UisScEW8/
 dcyQ==
X-Gm-Message-State: AOAM532ZJotai6clG4xEA3qsq9RkdbeXgIqL7EGAuMhx/hru7GfkFisp
 lcRkiEzHeHbDRboumZufNCsFeA==
X-Google-Smtp-Source: ABdhPJxDrmINjfjD2DIXWmsoz03HNiTRGgmZ+l4aex8+eeEpuTTshrCp1x7W4mMnsEYctLJOV4LJNA==
X-Received: by 2002:a05:6820:3d8:: with SMTP id
 s24mr168535ooj.52.1607466645631; 
 Tue, 08 Dec 2020 14:30:45 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p8sm36164oig.22.2020.12.08.14.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:30:45 -0800 (PST)
Subject: Re: [RFC PATCH 19/19] target/mips: Only build TCG code when
 CONFIG_TCG is set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12015101-5a06-4353-1f85-dd651e050b78@linaro.org>
Date: Tue, 8 Dec 2020 16:30:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> We are very close to build with '--enable-kvm --disable-tcg' :)
> ---
>  target/mips/meson.build | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

