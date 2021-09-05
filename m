Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2106B400F00
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:11:28 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMp7X-0000Uv-7S
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp2m-0004Fa-2F
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:06:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp2k-0006UI-E3
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:06:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso2725320wms.3
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kpHy8pFbED6Q2fbSev5Junz8h0pXQ3bHCVIdCk2Igkw=;
 b=Wd9iA4M8nUtg0R4scvhNWynJps3z5223DrVjbT3Q/iCrOcxT15+AshZWlzggOY1Gnd
 2UY/bC+clI3oIbuLsekuaMqbuQUEh4gbwKH64d0e3rGx08T9AjgUyI5R3d7UpcKqQdcm
 pSAapLR6uUxMrJHkJ3W92ZQHamT2mbkwHqgR0hiivVAHHjjm8+669OXqBCwUC9cg/agA
 Iq8m51OEEUZS+grtO9haEPKnKXBCa1pSS94J4p9t4T6Mr5xEV7qM94mpGGk9+2IzyiQA
 TkRBw+gQeton5jD7ZTjREOoJxOerAh81XfGUWALI0FvNOfMLo78KKTnwia2xDKtwS/jD
 Dczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kpHy8pFbED6Q2fbSev5Junz8h0pXQ3bHCVIdCk2Igkw=;
 b=FIgjjf1pVaKJshs75wmEy5G9dRf8XIJUCNKH54yGNlQvGKnlx7+ap1dT63ZlGsacXL
 ly8QRkskROWZS8EzqLs4pMkhGyyvGBKjtfHxQuaDekg4xHdyKIzYd+31BYNjhmcrLaSD
 wyGd3VO+dCik62WPX7NW3FPZnDf+DPOtoWgkYxLMFtZBzJX/uVECK2A0YRFMsYdlu7Jl
 yHK7vVKnQwVVa82zxCbQqXjbX+0nei5M0yMmgpQ9B8//4rdKSKDpr6bXBLsK7lzEiJ4P
 s9KfwrOSRKMbCyPM4rxV6pNRt//1zC22V/gGm9z/9t4vPBqLSEAib+pQBMvccvuYMzsc
 pfUg==
X-Gm-Message-State: AOAM5312Cv8He5qBfiV+Z8n1IhaZdAD46+lH7f6sgUvJnwO3TlMoRdD/
 8j/cG3QG9+ekTeUPM4AR94LDrA==
X-Google-Smtp-Source: ABdhPJwHyhhAJmHw4tdEwuDTQ78g8QT5lAb56zO04OiYHXqxDr5YIkFC+4nEbwPkkb4V+OVzVZy9Ow==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr6443083wmj.169.1630836388912; 
 Sun, 05 Sep 2021 03:06:28 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id w29sm4466283wra.88.2021.09.05.03.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:06:28 -0700 (PDT)
Subject: Re: [PATCH v4 20/21] target/loongarch: 'make check-tcg' support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-21-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1cef7a5-e5ea-3ab6-5a55-258cdd60c8b1@linaro.org>
Date: Sun, 5 Sep 2021 12:06:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-21-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:41 PM, Song Gao wrote:
> This patch support 'make check-tcg' after install cross-tools.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   tests/tcg/configure.sh | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

