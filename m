Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E2363F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:52:06 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQZZ-0002gW-Gl
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQWS-0007bA-9q; Mon, 19 Apr 2021 05:48:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQWQ-0006Nq-DH; Mon, 19 Apr 2021 05:48:51 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so7667852wma.0; 
 Mon, 19 Apr 2021 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ltdduyi06UYpag5Qd0ZbNYw2kWupUj3hOUuJIADuauI=;
 b=lM9eNwuO3xztVh4YhJBMujcAAxcUX8pnxRU5ibfuUjTP2D2xEQpAZlPNjNMQyJKi9l
 lLfk7JIqBqG3C5bYVe97ITDV/17Bh1OEGbHVtuoA/Y79U09kDJniYyGmM+DPpQakstWo
 2nWkTKbsniW1O7CPpyUd3YE3MfvWO+us1JvA5kFeUDim0PoyDtbOk8kdKTYeYEhhlpI9
 XP/JDL2eb4m+erxMZgtcs3ErrdX0rQ1UcTsgtbtvXUGPlCoDVDC/kE3moPeNigNvoZVh
 WhKdZ1OR2owP8XKQpo7+xGHGkGbcUsCWAWFHBlK+D0XjDof9UOHgreqk67pvnPSe+WXI
 DHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ltdduyi06UYpag5Qd0ZbNYw2kWupUj3hOUuJIADuauI=;
 b=ZVGdpUdvE+Bs7JbGxw0Kk05bcU9XdJ33rbPuEkCEJiKKhDwd6Dp+4iUK6JIYyHhhpK
 ueBZQHZ0kVmKWW8qT+qCRi4jw9oPVFrneuhCBMnrqmhgY3iU84GXDefVAd+SF/8Bt0Qo
 ypG/N35PfIz35bF4528DmxKwMCMPcbcFWv1NGnHcUrz6lW/IZV+h/x7FUxvHRPNNGMbM
 o48O22o5xRpmoWFhIg+8D8nfQtjuyuxAye5Se9X7ojMMSFD8+TA2vHl8pPIdWftomhhW
 HLCYX2/neVr4fw0UYtZ/Q3c5TGM6VEGkE1fct35GVna9YsK3xiCkb0pEtICckOoKjg0j
 jcaA==
X-Gm-Message-State: AOAM531AwPVRaKNA0QZvxDc3vt00QwbfwAuf+uhTECf+ehldPbinRpqv
 2LnIdod4GEeAhQpJIB1A8aE=
X-Google-Smtp-Source: ABdhPJykT7xTZFZVZ7fuvRbXqPUkHqrBSsfP1z36gNpXOS9Er5AAoRf8ZD3D0ReOvyYm4CyZ6zVdog==
X-Received: by 2002:a05:600c:b4b:: with SMTP id
 k11mr21272019wmr.129.1618825727926; 
 Mon, 19 Apr 2021 02:48:47 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id w7sm18907872wrt.74.2021.04.19.02.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:48:47 -0700 (PDT)
Subject: Re: [PATCH v2 00/11] memory: Forbid mapping AddressSpace root
 MemoryRegion
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210417103028.601124-1-f4bug@amsat.org>
 <e5e7bf9a-690f-d728-4415-97cba5bd0fe3@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0759ff5c-8def-ef79-4571-85e081dd6944@amsat.org>
Date: Mon, 19 Apr 2021 11:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e5e7bf9a-690f-d728-4415-97cba5bd0fe3@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 9:17 AM, Cédric Le Goater wrote:
> On 4/17/21 12:30 PM, Philippe Mathieu-Daudé wrote:
>> This series is the result of a long thread with Peter:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg788366.html
>> and IRC chats...
>>
>> AddressSpace are physical address view and shouldn't be using
>> non-zero base address. The correct way to map a MR used as AS
>> root is to use a MR alias.
>>
>> Fix the current incorrect uses, then forbid further use.

>>
>> Note, the Aspeed patches are already queued in Cédric tree. I had
>> to cherry-pick them from his tree to have the series pass CI.
> 
> So I will wait for this patchset to be merged before sending the 
> aspeed queue. Are there any blocking aspects to it ? 

I think it is easier for both of us the other way around ;) Your
aspeed queue being merged first. Nothing from mine blocks yours,
and mine depends of a maintainer willing to take it, which has yet
to happen :)

Regards,

Phil.

