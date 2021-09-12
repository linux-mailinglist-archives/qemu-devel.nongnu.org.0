Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B5A407F11
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:50:42 +0200 (CEST)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTcm-0002Nn-QE
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTSL-0006fU-1Y
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:39:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTSJ-0003iO-Fy
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:39:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g128so526483wma.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jzt+QIWrWsgeNccWazXR7aBzxWeNd5WgukWxz7/tW00=;
 b=mRp8l4SyVYwfC+HTFTErifobdswQs/b1BOFtaqM7pagXiOxyE0AXopXw1tX1pmuXmT
 S+QmOa9cBbKsqP1TnFkUWYovCSklLUDwT2jsKVi5hHV8rsa4HCrRMSqvNdFWwK7JF/G4
 8Yc2lxpQwjR/Jp+GS3HVlRKWjvws2ZbAEGCH9aIvqUWKij2YMZ5sjCk4JdMzk8niiscd
 StOsUxO1LOvCNYDW7JFqHS7YFrj5xYxT6EUTnKRmq3utDXqp//ZFxPgTQDTzXcptTXFC
 snyZzTciYfUqpWSF8l3GGSwZWuyQb/v0+IDkO281b8Lg08hWhZAegAdgaKDAfQfqqO/U
 B9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jzt+QIWrWsgeNccWazXR7aBzxWeNd5WgukWxz7/tW00=;
 b=fBU6enlH8tqoe4MszVphACcBTh/p3F5wLBhKl9QtIxJ8enHfE7jQBsGHZLsbrCA5h6
 9KalBJ2k7bTi1EQCVwD2peKhK/mGTZVQSglJlR8jP8Kvrwwe72JAEcWlfAkTMpEDvCIy
 cT5+j/Lhz2ST86qsEgjF95umOjTDNpSlRtGAnfCn/KuvGCAhGq6p+7I1+6N1CCNKTyZT
 elkRN7OswaHlx9UTGa+NzmB4Xd0NbmwChdtSOEfl8xRXxZ34ImvQV4OfrcNkwqQWpa2w
 r95fpkuR6CtSRd7+IQspr0EpjMN8SiICCirTZDDfbyPpvi7sVSb6wyLB6M01Ia8HzkqN
 RXHA==
X-Gm-Message-State: AOAM532kIOnn8VBEcsGmansJi+uuXOAcpXU42TqykRzajtjkPCyDFcGC
 d02Jnd56iLp8vOi45ZNrsoA=
X-Google-Smtp-Source: ABdhPJxvNDNsrMCXvZray1mgf6G2tPR0yQ8lQF0OegUcZDGh6m9gw36WYpvmXZ1njTBLmhXc8ECd9w==
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr3742713wmr.103.1631468389746; 
 Sun, 12 Sep 2021 10:39:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t23sm5270452wrb.71.2021.09.12.10.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 10:39:49 -0700 (PDT)
Subject: Re: [PATCH 11/20] nubus-device: add romfile property for loading
 declaration ROMs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-12-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6134e89-962a-f4ac-8a20-30d26992b237@amsat.org>
Date: Sun, 12 Sep 2021 19:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> The declaration ROM is located at the top-most address of the standard slot
> space.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 43 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/nubus/nubus.h |  5 +++++
>  2 files changed, 47 insertions(+), 1 deletion(-)

> +    /* Declaration ROM */

> +        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {

I'd check for >= and define as (64 * KiB).

> +            error_setg(errp, "romfile \"%s\" too large (maximum size 64K)",
> +                       nd->romfile);
> +            g_free(path);
> +            return;
> +        }

> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 87a97516c7..42f4c9dbb8 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -39,12 +39,17 @@ struct NubusBus {
>      uint32_t slot_available_mask;
>  };
>  
> +#define NUBUS_DECL_ROM_MAX_SIZE    0xffff

