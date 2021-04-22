Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D7368733
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:29:34 +0200 (CEST)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZf13-0004I0-TE
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZexp-0003GS-Bc
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:26:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZexn-0005MX-Qf
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:26:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso3718215wmq.4
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PwFqWisTYPCECIOrFCZHDQCf9GCkQHt/awohzOh+f9Y=;
 b=IJVFpRyr434qrCKfMi9SadKHDixmJ481fT5+3U7TLf3+6+HwaN1qK5Zs5RPLD/UAQk
 yChfBDXo9Pq7m2VuEj/dwt7Lq3E8O6N/SuZJJFaazrOVoH+79cSb3EP2Odiv5t+HjDBY
 Edl3FpeTn/RaIz3xtEB79/FqpiWg0c+g2PYSSXgWVpVao+czHiOQBVBcb4d5fEmUVa4p
 dFxpoQ9xgJ+tliL9gleKuI0RunfuemrJGf7j++yUCreTSXpTRj2cSQx/OEYnhNjGLlhe
 MYPd8ERH9gl4WM0k1dCyKPNAKWKM8m2OErAgapazIBfwefiYlzaV/Fed5qdSRRGF+qG3
 Pt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PwFqWisTYPCECIOrFCZHDQCf9GCkQHt/awohzOh+f9Y=;
 b=J5VnMuAJvaUGxuFFAuvsCX5sfGCOBxAcLRkuiX9R+zuzbooSKxm0o14coc1+k4qoEB
 DxU6sJVVGqe/Uz9jJZDT9CuXaT2uk2kNFoVcQ9EBheucnR8U2BJIR4iC6DnW080wvCaO
 5G94hR7+dUzaJrit2rVNIQ8SIK0PHJMZmugoAtnRlFRiTRZia8x0NH6cwfRPhXblSkI4
 1eqXKhUaXnbrR3aKFBM+cfvjOdWe+R+XaGVFAPf+kjj1ONAmyLq2BeeigD2a7sjLryA4
 nBk4B9cQBHQgCcRv1Rs68fK/CKi9KFkl774a/NihrNod2dQXyOI2NEhy8qTNH5r6s8Rl
 CLkw==
X-Gm-Message-State: AOAM533/HLmfZ2pW6YqH6DvxWmKcNSAi3XqdNdZzunOx2rU3xPjQoFRa
 ZB2+/jGQXtldysdSdvBEg50=
X-Google-Smtp-Source: ABdhPJypnyPd8FWyH7186pirhH8sWnC533nKYc1MUBMOO9Pa2ZGUKl1wSCwsO/iLcKmOkiex0vylgw==
X-Received: by 2002:a1c:6887:: with SMTP id d129mr340880wmc.114.1619119570323; 
 Thu, 22 Apr 2021 12:26:10 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u3sm4604400wmg.48.2021.04.22.12.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 12:26:09 -0700 (PDT)
Subject: Re: [PATCH 1/2] linux-user/alpha: Fix rt sigframe return
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210422180819.252121-1-richard.henderson@linaro.org>
 <20210422180819.252121-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <35914b25-f800-b298-2480-d694dbc36b28@amsat.org>
Date: Thu, 22 Apr 2021 21:26:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422180819.252121-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 8:08 PM, Richard Henderson wrote:
> We incorrectly used the offset of the non-rt sigframe.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/alpha/signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


