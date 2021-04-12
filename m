Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2535C4A1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 13:03:40 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVuLy-0004G8-EI
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 07:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVuJY-0002x8-6p; Mon, 12 Apr 2021 07:01:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVuJU-0001HE-8F; Mon, 12 Apr 2021 07:01:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id x7so12434785wrw.10;
 Mon, 12 Apr 2021 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wd4xSXZt4ityhDmpgVcznZH1zP1rH264pLPrWxUQnpw=;
 b=totZhbLKEnzIXxBWGodrpPOSX+vrGiSLby0dzTNDYOYDpJGGc+bgsHyZNF5nC/ogxJ
 aNS8M+o0A4fTvi3DHJ7m8uaEq8Kj4HG+fEm/Y5CQeDSMPHtIYNgZ+Y6duNAWT9zJ0U/W
 hiD8Iw5FcdYTdTvspkkFVAjx46sUvZQSrtpFm9oKdIrb8Wvgl5r0TJ1IHLp3qQUGvABp
 R6w5Bw2N5iYz//f32n91Wts5MYnjRBxgejw/DuiLRgiE7lYprSqf5iVNUJMRwBi+Zq63
 olE/4vjRw7pdrqF7egauWUssTkJV4y8+EkWFHH9F5rFg39WCBLtEyG0TqqFLVFCBoqX6
 8/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wd4xSXZt4ityhDmpgVcznZH1zP1rH264pLPrWxUQnpw=;
 b=VyYaf/Mc4Mt2xAp+aLwOZMq+AaALrLkhXMDWXe5Rp2IWj9nwCz349vuigEcq/bDukz
 VqGdWhKfBdVRnkVb9gVybBY8m3R17IL+4UuF2o+52pmEhPZyFS+YSKHo7GWQntl9kOZW
 Ptpz/cs2inaGfrqZ/Sb/sVRyVvzRbqMFnNIgJn/Of1fXGp2BRjmAu3zjpSxhpJ7ui7dy
 dNm134pcofyJY4lqgtTCQiWC5hse1BKsHBcKI82uX/GPE2FDj5IZva2fzl0PlC0Bvn3+
 fYpr8S27MP/RXLw1C7rWLMq0mIgZ6oiCkt+9lA6AfH8gda3PGVlcg6SPSsIEWOsWeCIy
 rUlw==
X-Gm-Message-State: AOAM531sWI5xdHAQBwQkhp1E8jFYx5Fcq4RU4qLCuYLD6s9K9BWnMRdV
 EW85m8uC+WnvRiWxRWFSKm4=
X-Google-Smtp-Source: ABdhPJyVOQmrboUM2fQCeES+qG2rxZSJXdEjIR+cIUULMROI0pBXSyeSCRMLxIixDTCFmnyrmImDDw==
X-Received: by 2002:a05:6000:cd:: with SMTP id
 q13mr31087907wrx.346.1618225261474; 
 Mon, 12 Apr 2021 04:01:01 -0700 (PDT)
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net.
 [83.51.208.63])
 by smtp.gmail.com with ESMTPSA id g3sm7703668wrp.46.2021.04.12.04.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 04:01:00 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
 <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
 <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a11d7a59-2533-0a59-c557-4cd3007bc32c@amsat.org>
Date: Mon, 12 Apr 2021 13:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/21 12:44 PM, Peter Maydell wrote:
> On Mon, 12 Apr 2021 at 11:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> TIL MachineClass::reset().
>>
>> - hw/hppa/machine.c
>> - hw/i386/pc.c
>>
>>   Used to reset CPUs manually because CPUs aren't sysbus-reset.
> 
> pc_machine_reset() is not resetting the CPUs -- it is
> re-resetting the APIC devices, which looks like it is a
> workaround for a reset-ordering or other problem. I'm not
> sure where the CPUs are being reset...

Ah, I got confused by the CPU_FOREACH(cs) macro.

