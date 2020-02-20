Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72181166829
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 21:14:18 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4sDB-0006dD-ES
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 15:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j4sCK-0005Ul-Is
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 15:13:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j4sCJ-0007Ia-Ea
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 15:13:24 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:36031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j4sCJ-0007IA-7K
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 15:13:23 -0500
Received: by mail-pj1-x1043.google.com with SMTP id gv17so1347938pjb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 12:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VTOYincJqrMbd3HFAYEMWINlN8h1/FnoZ53xiNyVqOk=;
 b=Cw6WaNfUuXxW1BTZaBBGP5I7BrgaJZ8/9qRaRe9YIavrksctuZzEEpNvGWb7CGYApP
 1HfOvtTQO7iFj7dn16SB83YXxSpP7b4zuOUGj5QOM2Ox8t/HHDDDIfPwLO2FU8sOXTTZ
 AH972EFTWT2TCUGFiVBI3dDL6FeOSbjSrOQRudx+pSkthwfiAxcjAwc+xCtegtWIRUNk
 5PANyFgkWumMCkVq0VhM9tTn9kjgnFneNMhpvJlKWkwiu39KuRDAOpw+Gf+ctfRXkxTR
 rtQ+C6tGuCJn8B7eslIQ2tSs94lAEiN5dopIj819rbseR0ZLewdhkvS92X0lfStQKez1
 OZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VTOYincJqrMbd3HFAYEMWINlN8h1/FnoZ53xiNyVqOk=;
 b=oHgBwLe1PunEj/1nxGXHjauHvmd96R3qtffwF/QzXawIZC5zWJAJHxoO3rGaP9lrWX
 h2UzMll6xeYGBnTJF26Y1UdVZhGnHWmXpK4t3YsqKttZOwjXdciOsic8T+evKbovcrHm
 GDcKw26hkb9YIN4SGx4UUZE/fWwjM6fV+JdHIsLp/9ZWGWJKj1DIyIcr5zguLqSgysgq
 9Z/z280Ngs7GU7bsPXju+452O6pobK1mnBEooLJkLPGwc/LFch5Li+Ued0xRVAVdIsgQ
 5Kkm2KQelvk8ONNZoqkON4PX6fcZZlnMqmXnw9KYI+Rbpym7oeTY7+bXtbeCb2YVtpfA
 zzTg==
X-Gm-Message-State: APjAAAXdWBzV8FLFRpx+jE8pM85cdxp946DNC52eUCazTRC2n019jwW7
 jl8C9WugBqWhA/y3nx8PM+EU8g==
X-Google-Smtp-Source: APXvYqxGIzm0LV5vfIWRp8X7IjGH21XTwG5uM+1h0fACzAZ66ff7qM4IUfpCvUcglMgayIJdAr/VrQ==
X-Received: by 2002:a17:902:107:: with SMTP id
 7mr31731111plb.183.1582229601933; 
 Thu, 20 Feb 2020 12:13:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 13sm170393pgo.13.2020.02.20.12.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 12:13:21 -0800 (PST)
Subject: Re: [RFC PATCH v2] target/ppc: Enable hardfloat for PPC
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20200218171702.979F074637D@zero.eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9d4fba7-2dcf-8f09-8f3a-7e0408c297b6@linaro.org>
Date: Thu, 20 Feb 2020 12:13:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218171702.979F074637D@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Arbuckle <programmingkidx@gmail.com>, qemu-ppc@nongnu.org,
 Paul Clarke <pc@us.ibm.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/20 9:10 AM, BALATON Zoltan wrote:
>  void helper_reset_fpstatus(CPUPPCState *env)
>  {
> -    set_float_exception_flags(0, &env->fp_status);
> +    set_float_exception_flags(env->default_fp_excpt_flags, &env->fp_status);
>  }

What I don't like is the forced setting of inexact.  I don't mind leaving it
set if it is already set, which corresponds to the normal accumulation of
exceptions.

In addition, if the inexact exception is unmasked, I would expect a signal to
be delivered only when an inexact exception happens.  Whereas this patch would
deliver a signal for every fp operation.

It should be just as easy to do

    flags = get_float_exception_flags(status);
    flags &= env->save_fp_exception_flags;
    set_float_exception_flags(flags, status);


> +    DEFINE_PROP_BOOL("hardfloat", PowerPCCPU, hardfloat, true),

I would also prefer a different name here -- perhaps x-no-fp-fi.


r~

