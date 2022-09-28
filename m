Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E245EE2C6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:13:51 +0200 (CEST)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odad4-0007HB-Ln
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZ9j-0007jg-BE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:39:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZ9g-0002hf-T8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:39:27 -0400
Received: by mail-pf1-x432.google.com with SMTP id l65so12842725pfl.8
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9HPxMrPStypfLUK51WWAsl0OZQhQEY0JZqgyIpLouM4=;
 b=BJwMBlDdHFkd0jAwecVqx+s/fGerntggdPNrI/xHlxXPqIhFngjdgaVZZ4tLTe0YzK
 5Q0E+6qUD1XfaSvcFoXOq6koqUjH6sS0MPy4uKFar91DR/Gzsggm1Hf8Jf6m3Zlw5n2L
 XSZoE5On5a1iuh+CK1Ssfy4omA1Q5wtTbBR47PUZ2UszfqQdgj9GyCd8Gi0fdy1fR/it
 /GcX33mWSKQFmPi0ivYlNLFOjDI81OmBRUZ6QV/zD9/In6yawak/NTG8iOCLu23k+MgG
 4+1vIyxi5tfMVUzdEChx7be77MgX5DD+Al/Y2Kdkl/9V0NgW0nr9Xuy5TILtbB9dFhuC
 HpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9HPxMrPStypfLUK51WWAsl0OZQhQEY0JZqgyIpLouM4=;
 b=MsYp/VCwX6/DoE01fVhcCYF6dsmN6fladalCll3LDCVKb357MmzaHhVJ0EcL9z8eXH
 JX/wKc8gNzMSZ7IFKivpjr2wKGIUhQQPOnTDDyhx4cb43sHDKyGODDDgXACvb7jpTfYD
 XUCYCnpaV+zn7OM7oAAx6b7od2Owe7X/BdHvb6wM+yp+YBrfIaPVsz6yNQE1HfEZEsXs
 j7DfGzk+a7GuowfBMAAN/LKlrjS9NCr8W/kIouaS0imq4MaSBjVTynD8l3/umem2QZtG
 OfEgRgSRNsxdr+9EI0MbeBzTCX6BzC3Dxn89+lyBkYdlbLZieriYVPXAv9TMNNhcFKe0
 b2Tw==
X-Gm-Message-State: ACrzQf0mjEhExpmTDNTrr6UlinBN+/AWmp+8jV5DSDpluB2DoOhiaPMG
 3sdUDs/pBemNEcHfYFg5fDGniw==
X-Google-Smtp-Source: AMsMyM5QCfK221DxtKxJ5qJ7h+dYqNr7LzqCvNZHfYNG+T4jxSZfHyKhgofK/MvMXWHcwENibhwlqQ==
X-Received: by 2002:a63:4143:0:b0:43a:20d4:a438 with SMTP id
 o64-20020a634143000000b0043a20d4a438mr30192956pga.452.1664379563431; 
 Wed, 28 Sep 2022 08:39:23 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 v66-20020a622f45000000b00543780ba53asm4144428pfv.124.2022.09.28.08.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:39:22 -0700 (PDT)
Message-ID: <18971815-0868-ab30-0bd0-3541b5d2df46@linaro.org>
Date: Wed, 28 Sep 2022 08:39:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 4/5] dmg: warn when opening dmg images containing
 blocks of unknown type
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220928122959.16679-1-cfontana@suse.de>
 <20220928122959.16679-5-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220928122959.16679-5-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 05:29, Claudio Fontana wrote:
> From: Kevin Wolf <kwolf@redhat.com>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   block/dmg.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)

If it's from Kevin, it should have his s-o-b as well.  With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/block/dmg.c b/block/dmg.c
> index 837f18aa20..96f8c2d14f 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -254,6 +254,25 @@ static int dmg_read_mish_block(BDRVDMGState *s, DmgHeaderState *ds,
>       for (i = s->n_chunks; i < s->n_chunks + chunk_count; i++) {
>           s->types[i] = buff_read_uint32(buffer, offset);
>           if (!dmg_is_known_block_type(s->types[i])) {
> +            switch (s->types[i]) {
> +            case UDBZ:
> +                warn_report_once("dmg-bzip2 module is missing, accessing bzip2 "
> +                                 "compressed blocks will result in I/O errors");
> +                break;
> +            case ULFO:
> +                warn_report_once("dmg-lzfse module is missing, accessing lzfse "
> +                                 "compressed blocks will result in I/O errors");
> +                break;
> +            case UDCM:
> +            case UDLE:
> +                /* Comments and last entry can be ignored without problems */
> +                break;
> +            default:
> +                warn_report_once("Image contains chunks of unknown type %x, "
> +                                 "accessing them will result in I/O errors",
> +                                 s->types[i]);
> +                break;
> +            }
>               chunk_count--;
>               i--;
>               offset += 40;


