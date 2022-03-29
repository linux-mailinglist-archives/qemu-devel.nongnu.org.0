Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10EE4EAFD9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:08:01 +0200 (CEST)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDRw-0001Lf-OV
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:08:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZDK9-0007AP-El
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:57 -0400
Received: from [2607:f8b0:4864:20::235] (port=44812
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZDK8-0003F5-11
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:57 -0400
Received: by mail-oi1-x235.google.com with SMTP id t21so14403930oie.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dE5tLLBVFgZbThwadIZIcSS2yUL3LPYAA/dTI3BpbO8=;
 b=mgugJ74jUveyyMd51hIW9qOEwRlMH78+maKJnNcrpFGsNaeLW8+a8cW0e27dh71deA
 ETyyYMJAlYJrNCXbgRnSBK6nfI8O+SF65CiFJvOqwD6NdyC9+pnhiIYTbExWsK7i9czu
 AzGUDm02D4vwaiHtoDzo3TsQloOvxIGwgkD4PhvpbVTdtFhXnTeNh6qcFy/K4qj11zlG
 oeC5GBoXxvuJy7DPsXTl3L573COn7tgyRv0h46A6ejM1VpT8iG0vUC3Kh+wd9dDl1ofP
 JjHGucN6goj00dr0kU4sLa6qT8n0QGW8i/6svuJJGEafJeg6JCs438v1BLoiPHxyzhEN
 KJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dE5tLLBVFgZbThwadIZIcSS2yUL3LPYAA/dTI3BpbO8=;
 b=fBFjdKEc8vIur1E5oXokieKAHl/Bk7/m9a6Jj0b4cv8YwGcdUttm3vhEFe53a1qHSJ
 Z1fetAJifgSaE3b4JEFR7ms6yV3VOOS5tcrcbBOjgmssbcz0cJnXQFkyjZSEjW1kYShF
 BBIOKG/Li4QB4+ksr5faEbBaKpnAaRP8XS4QFH6SFcknxlPn2v6LLsbxgM2nQcAs6jy6
 8bvqAcbEODzmZ+hNucL69cE8PXUmQ/cvWptwN5vHjTK26l2DRjcd9jLiRoh8wdUwUtnH
 B8HavFXn/3MN0+saxEXe8cvKS6q/V05wbwcEdcMbH+ty3jwP4hW8gggAttY9vfR4RR0F
 D/mQ==
X-Gm-Message-State: AOAM5303VkV6kb3Kh1URP2LAMSBs2kjGITm+JU7M0ixkBnlECSUj04TZ
 t9CheAqBZBmZeCVLsWdHo+CqYPqHhN47SxK8ex4=
X-Google-Smtp-Source: ABdhPJwu5Qf97JzY50cfdmWmCkfb6jj451fcmRehVSfK/uTdjLJL0S15GMaVASFHAXcd7DAX1c0x9Q==
X-Received: by 2002:aca:d0e:0:b0:2ef:4a47:63b9 with SMTP id
 14-20020aca0d0e000000b002ef4a4763b9mr11025oin.135.1648565994939; 
 Tue, 29 Mar 2022 07:59:54 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a056820150500b00320f8a179d0sm7439712oob.30.2022.03.29.07.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 07:59:54 -0700 (PDT)
Message-ID: <853eae1f-a1d1-8c25-9c5b-477a57b2df8e@linaro.org>
Date: Tue, 29 Mar 2022 08:59:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-2-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220327093427.1548629-2-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/22 03:34, Idan Horowitz wrote:
> As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when the
> PA space of the IPA is non secure, the output PA space is secure if and only
> if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.
> 
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

