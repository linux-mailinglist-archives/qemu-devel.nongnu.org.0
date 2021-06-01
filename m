Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92916396BE6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:31:37 +0200 (CEST)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnv7w-0004ck-Me
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnv6A-0003Yi-Mn
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:29:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnv69-000386-3D
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:29:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id v23so10317605wrd.10
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 20:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mY04Vb1U/rpXyaSud6umB2RGOyxfAdjIzVeTtBckDDA=;
 b=NGOg2+ILvhR3XeA+UhR+Iq/cRpZm+i4IaVHXXzf9o03fVENz0lWwnS+Ak8zNZm1O+P
 F9vy+tJrulY0Y2wMPYOEMBMfv+mClUVVB5x94Gb6+/5nGHiGa6muhQlYJM9IvYl6q4N7
 v0Ys6OkDBLoOEpit5gevXRt6YCFsiVc/VTAb/xYEnNv6YFbminkboOB5398X0lEufBq2
 BxsTQ5tzkWFqI1x6i/wolY9poZkxfXwa7OufrjJsGcdhDrz6UXw0GEXqIjW8wMR2zPvO
 osdL6ELGUJk7hTDQ5Uohdo/lniqwgbx0EKkpowR1Iq920xa96rEr6nowJ6gpJnYizMZA
 DCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mY04Vb1U/rpXyaSud6umB2RGOyxfAdjIzVeTtBckDDA=;
 b=MRSCoozFiwd2xaw8l7lsJ/F6cvdXodN6v1lWNPPxRFnPNG8XvD/N13A4s/D9KTA01w
 eKiUapxDe4N4v6EQEFzfnpyL/K1uL0ZD0UK3aVrwBeZIcaOBgT/JxisoNh7UTgx1i+0Z
 WtL4ZaUfsp7ZIajTE7UqHtthOjVWMhnW253d18xhRmZu08ngig+qy4uy9Dz41+P2d+4k
 20FLljYxwk8RfutNCHUQXOx2Aj7d9InpKAPTjBT4mj3JBj6XtyxVPadsTpE6e6HBSgTw
 K3qxN7Rg2tMcYVoneZXqB0ijJLmmMTfeS3isL15yzvVC3nDTQJKu2vnPN5OXvocqr5n0
 y3kg==
X-Gm-Message-State: AOAM532xJZK6sJVGSOKj6wblYKlDFIyKcoQ/3k/bZPONwTO7w9l5qY8z
 fGdhK6K0oDunZJh9UuBY/FU/JIw0bTAGTw==
X-Google-Smtp-Source: ABdhPJxEfVXCvHRWItaIyJBc3MmkpoliUqMPWmjoowdxa9hPEqgijWlBE84Zndciog9uISJdpor8wQ==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr9639259wrm.403.1622518183686; 
 Mon, 31 May 2021 20:29:43 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id d8sm1096639wro.16.2021.05.31.20.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 20:29:43 -0700 (PDT)
Subject: Re: [PATCH 11/11] target/mips: Drop denormal operand to update_msacsr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c2bc8157-e3cb-0e9b-2f65-9d4baedf605a@amsat.org>
Date: Tue, 1 Jun 2021 05:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Cc: Yongbok Kim <yongbok.kim@mips.com>, alex.bennee@linaro.org,
 mmorrell@tachyum.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:14 AM, Richard Henderson wrote:
> The comment about not signaling all underflow cases is
> almost certainly incorrect.  It has been there since the
> initial commit of the file.
> 
> There is a bit of code below that sets underflow with
> float_flag_oflush_denormal, which is probably the fix
> for whatever the original case may have been.
> 
> Cc: Yongbok Kim <yongbok.kim@mips.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/msa_helper.c | 32 ++++++++++----------------------
>  1 file changed, 10 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

