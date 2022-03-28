Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3C4EA34E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:53:35 +0200 (CEST)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyEw-0003Xy-FN
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:53:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYy89-00028F-It
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:46:33 -0400
Received: from [2001:4860:4864:20::2a] (port=34082
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYy88-0008Uc-22
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:46:33 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-df088cb155so3501886fac.1
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Pzmq90fhGoXCePGhRj8xEHTF2oBrNX2n9H1nCZqzIFE=;
 b=cd3DT1OsDouE2iBmnGyp3ZS4MxGHGAxJGfoL/2KuyGz/DNHQvvkVMGB1SphczymNSV
 3eP8359tHo4psB5dfRrt/GsQXiXTMDpGaPooTJns+AYqVj+bu31PW5muT3M4Vl+mQI96
 7S8sFJLSXrCjmIW2jHydK9f8ztX0bUjEyO6fne8FUxydHmkBB9oGqwf4udWEsnmt7tAP
 ZoeMvpCoUolbg3bgvatoR1y+aaSMizgnXFx8dv5IXp8j2rgRIvlZovJJ9I4plV5UesYh
 2g/bocpGMspFT/NedLJp/pir2nuUv7zaKEB3V0U2wbYHl0xqnjx3XsXNZzeexzW9ymGq
 7u4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pzmq90fhGoXCePGhRj8xEHTF2oBrNX2n9H1nCZqzIFE=;
 b=mO6yKbcsS0kyJreCn8ws5w3XUyc2Ok9sBYkwYPmrtmN5/fOr4IXtW1m3Y6AdeoNPKt
 p64np5iO29lzdOdsssYGGynaPkzUAA/j3Dw2Gc4Q6QTcFW2/n7jdC22Bo/ytWQzopSA6
 WMbzD/9Up2rKzwGj9rOgJVnB7S4bd3d3gc+0Qd763KHLFvJblPWB4uy+wxKNwQ3HgR3f
 jx+Zo5Gszr4fvpCyTwf3fRrjwKACgCARNAWjXqShZ2KRVL/UFADN+Hp6olSCnv79fKxr
 FvQaX1JI8t56doVbBAq0Nin7ul3F/UhNdxnYhsTbUvolfAD2p49NRFwrhjji43OkF04E
 TYfA==
X-Gm-Message-State: AOAM532RQkWyGB0d2idSNSOgoO/dT0Ki64lC4W4r1wM71NIBykm4E6MT
 YdeCP6au3BSqNkN4HvC3nH+dJewbsgl2z+GV9bs=
X-Google-Smtp-Source: ABdhPJwq6CJeDBlbICraMq44KDfuHIlL7I5lGQMT/s2N1m3Z7YMiN0AEt76EmeHDs86T0pN9JG1k8A==
X-Received: by 2002:a05:6870:a70e:b0:da:31c6:1d20 with SMTP id
 g14-20020a056870a70e00b000da31c61d20mr691233oam.86.1648507590529; 
 Mon, 28 Mar 2022 15:46:30 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 e81-20020a9d01d7000000b005cdbabcbab0sm6536510ote.22.2022.03.28.15.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:46:30 -0700 (PDT)
Message-ID: <ee2833b5-7ec8-adca-f407-d5f788d791bf@linaro.org>
Date: Mon, 28 Mar 2022 16:46:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 19/29] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-20-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-20-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +static uint64_t extioi_ipmap_enable_read(void *opaque, hwaddr addr,
> +                                         unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    uint8_t ret;
> +
> +    switch (addr) {
> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
> +        ret = s->ipmap[addr];
> +        break;
> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
> +        addr -= EXTIOI_ENABLE_START;
> +        ret = s->enable[addr];
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongarch_extioi_ipmap_enable_read((uint8_t)addr, ret);
> +    return ret;
> +}

There are at least 4 instances of uninitialized use of 'ret' in this file, and this is 
one.  Are you compiling with --disable-werror?  You must not do that.


r~

