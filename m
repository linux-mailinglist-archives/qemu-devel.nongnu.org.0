Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910012BFC0
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 01:05:19 +0100 (CET)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilM58-0008QL-C6
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 19:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilM4D-0007zJ-IX
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 19:04:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilM4C-0006up-FF
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 19:04:21 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45381)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilM4C-0006kz-4T
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 19:04:20 -0500
Received: by mail-pl1-x641.google.com with SMTP id b22so13226691pls.12
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 16:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mLEr5sYBpVbmKdMkiS0l1ARDJr2IuFXAOn2DHHwAmNg=;
 b=Pzxt4h/fpowC/zD8syYGckIXLteumwYklcRA7XTQDi6YbKc2Bs9lKYtf0JIDpVY+fk
 cAdBmuu8+qzhHVw2ku0eVabcJNRtQLZ4C+942etTY3Jf9kmYuh5MDqQtvxL8nRnNFVEK
 nNU25L0cqtOL291gqkin2R3073HFe0150/L/vN9qFooq82wuDFidlpfMsqU2izP8STbO
 gwB3lgwlQqRgi9oVwgeoloZXQb+muySUg5t8Lage3Uch0MXTWe22zRL2mjydDdnZHW0n
 d/BEpuYam9BcW9K5neCewzfwqHK/LJD1Uwpkgq4m/BsGOE1yyKHdZ0ZcGmKUUD0LQQk0
 yKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mLEr5sYBpVbmKdMkiS0l1ARDJr2IuFXAOn2DHHwAmNg=;
 b=DnzB12ItAd4sRbS1mZOr9KmSn5XCqPbRJK+hhwaXwE3rKmd8d5gf0S2uON7KhdHu5c
 0U1DPVs46+BI8OOHVHIC+L7H3V68J3D/8qKu7WNsut5LAdoRkVhdI2a600W06++0Z5Or
 UXg3vcS7D25DkZsCf9gmYKaN50M2wl9G6pk9AEh5H+7n/ASZNKswj9VNLVArGY0S4rhQ
 pYXaBpCRbBinGj53gKxbUDhaXQhr4h3HujGIWWIVT75Sd2l0Np1RV8ucj2tR4TnQ4T1s
 x+DN3pCktCUETFmYty7tVeezQbs1/z+6pCIy7258+kZlKYUWHnPJwiE36XvlzK945X9v
 Efyg==
X-Gm-Message-State: APjAAAUYs/hMlrXtdrdSrKf6KRtFAIgdetRcJVmCBhFJN+yuhAZ6FSCT
 stHfcV7Qpl3zR6lEjSISfDySsA==
X-Google-Smtp-Source: APXvYqxp65BT5y+lOx9FfNsoMFafl+hj+u5Z+uSA8OOJdc0QiyJBjqOqLNje1rPqmCQ5LufvQg28JA==
X-Received: by 2002:a17:902:47:: with SMTP id
 65mr18609013pla.130.1577577858533; 
 Sat, 28 Dec 2019 16:04:18 -0800 (PST)
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id z29sm44694493pge.21.2019.12.28.16.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Dec 2019 16:04:17 -0800 (PST)
Subject: Re: [PATCH v6 10/11] vl: replace deprecated qbus_reset_all
 registration
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191220115035.709876-1-damien.hedde@greensocs.com>
 <20191220115035.709876-11-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c31c5f39-6998-2d2c-d7b5-6a1bd4104661@linaro.org>
Date: Sun, 29 Dec 2019 11:04:10 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220115035.709876-11-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, edgari@xilinx.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/19 10:50 PM, Damien Hedde wrote:
> Replace deprecated qbus_reset_all by resettable_cold_reset_fn for
> the sysbus reset registration.
> 
> Apart for the raspi machines, this does not impact the behavior
> because:
> + at this point resettable just calls the old reset methods of devices
>   and buses in the same order as qdev/qbus.
> + resettable handlers registered with qemu_register_reset are
>   serialized; there is no interleaving.
> + eventual explicit calls to legacy reset API (device_reset or
>   qdev/qbus_reset) inside this reset handler will not be masked out
>   by resettable mechanism; they do not go through resettable api.
> 
> For the raspi machines, during the sysbus reset the sd-card is not
> reset twice anymore but only once. This is a consequence of switching
> both sysbus reset and changing parent to resettable; it detects the
> second reset is not needed. This has no impact on the state after
> reset; the sd-card reset method only reset local state and query
> information from the block backend.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

