Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEC94D203D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:27:41 +0100 (CET)
Received: from localhost ([::1]:52976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReYe-0001NX-45
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:27:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReT6-00011O-UZ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:21:56 -0500
Received: from [2607:f8b0:4864:20::1029] (port=51823
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReT4-0003XN-7L
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:21:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id cx5so112422pjb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YNG62NJBZiXLlHb7HS+4/KUZoQdA+wY3F7HWgB7ngXE=;
 b=CSuFUDwKZXDyreqASo6z6TX63wqx6xybeAp+Rxzmqf/u9shR5X9SekGV/nB4GV3YJu
 vVaTMJ+/1u6QIVUeran3vR5dA+r8xMbEv2A6H+eKwJ5RYrf+K60sutWb7DKvDuYHsYEH
 vszX2wqD3OS0a7GszsrGJjiHJ9AatU9jRrvd6qZ42wBWg0C7VbwUq980wWFczfsk8DGT
 4FRSJMFXyyqs4JQD8Nrkg/qoJrPjqenhOlYIGBxdiyEI97KKIEBTtTJ31wQslbzq2mUk
 ny1xx78qHd+u7/KdcRxy+czL6Bgw84NaPbS6CfQRa00+fpKoEVedP/nVs+g4IYJ2s+x5
 ZuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YNG62NJBZiXLlHb7HS+4/KUZoQdA+wY3F7HWgB7ngXE=;
 b=We5/ouRMTwBGTpAL41L1pvZPmQrkwU9mJRZUxp23/R6JqhFJZT2Djyp6d9JhGnnWz/
 sMQwZlEK0reNJBMr17rSzn1me0/e5pMYz73TwJT5s1HYx5cb275kIkWikhBgUFJPUa6G
 uxs9nldmKhA7POIuhIbdX30i7FT0PAXGsQgQouo+/e3l1k6fzS4eeN/GQ3EIqefLre+/
 THMbyYWBDkMVW+QfIX5bm60apOnPKj8gtetifwB0PaM6EZnQNRVKY6kxw8VDQiR4mwWW
 rUCzg9XYx4zdaHUN3gemyER38x/UvzcCKdbX8N16KWxkxZePUD6nWj0gLX9IycEIJd13
 O5NQ==
X-Gm-Message-State: AOAM532Pmv4rcRiNU5C82TevIbd2zhy3/aFwk0iH9Wu1oHVTfI1+fMnp
 7WV1g2M1NOvxDLYmqvQ6CGQ3fPiwt/2hIg==
X-Google-Smtp-Source: ABdhPJzAoBLM49n9r0W+u7PNUYXXxx1kOD8X54wmwY9EGLH5VlePbTbMNoJmNdruNXxBEvotK+7pnw==
X-Received: by 2002:a17:90a:7082:b0:1bd:3838:3622 with SMTP id
 g2-20020a17090a708200b001bd38383622mr6043914pjk.101.1646763712720; 
 Tue, 08 Mar 2022 10:21:52 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q8-20020aa78428000000b004f7281cda23sm4067029pfn.201.2022.03.08.10.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:21:52 -0800 (PST)
Message-ID: <041a82cd-7d48-c8a8-00c2-b59ce5a3da45@linaro.org>
Date: Tue, 8 Mar 2022 08:21:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/13] hw/isa/piix4: Replace some magic IRQ constants
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-7-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307134353.1950-7-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 03:43, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> This is a follow-up on patch "malta: Move PCI interrupt handling from
> gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
> didn't want to use piix4-specific constants. Now that the interrupt
> handing resides in piix4, its constants can be used.
> 
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Acked-by: Michael S. Tsirkin<mst@redhat.com>
> Message-Id:<20220217101924.15347-7-shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/piix4.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

