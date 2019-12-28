Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2412BFAC
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 00:41:49 +0100 (CET)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilLiO-0001N2-CN
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 18:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLhd-0000w7-Fw
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLhc-00081N-Aa
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:41:01 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41278)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilLhc-0007uT-2r
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:41:00 -0500
Received: by mail-pf1-x444.google.com with SMTP id w62so16550005pfw.8
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oVZu6/SN+5SZK+7c5AowIxQOLLbP2Ox8wv1xHYQdAb4=;
 b=Kd1kdjjiRtB+9k4j6+9ZTTgBsougA1tiqGuRuePV0UrkTP84N7CMcBccOUOEZATDVn
 4LsZ6eQxS0RE6bAw2bk9LJHeZhSzwogzjNVrN0Irci2CFoRbEx3ah+34QbSQq7V3rOq4
 PnKycHMKaog4Lb7MnGfaRZm5ehlCSTGg6d0w3oo035zbhS6gewzhB/mf6D+EM9f6pcPt
 fh+yN10VGvXoG6vyU2xE47T6SCHP0mAFPB1NrSJhQfOdceWXBNt6Xg4Q0hIMAAeE9THn
 7B75nm5xh7EVXT3jFqwqvz6pobnUYLM2X8CSY7qRmy7jgb08DDFdXj297eW5SERC9/Sr
 9LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oVZu6/SN+5SZK+7c5AowIxQOLLbP2Ox8wv1xHYQdAb4=;
 b=cv+U14ZXmkl4YfGke5qwjiy+gHf9ZFqqLWPjRc9nK59HP59W8ZP5FVT5n+AYWha7VZ
 y7WE8Q967h+md9gbXM2Vbi9gH/stKelG/tAoe7th1HN1l0htADeFL97V+gEbSarNAF3h
 Fra2+Y4Ig9kHoIwH95Qdx0WjCRTtgn3SZntDit6xyyBvnE0BdP81mO6Y68oWLhU4TALK
 gdA/kqV9bV/i5VOgb/FiVWtTZnEDoOqHYyBL/iJWofiBBjfDE6DLoZ9d113+P+0n66E7
 kuNSKeRa1t5+IzZEoYmbruToS2pfoIsKK0amb/Rk8J+r8afA2o7NF35yuX2LBrUqTJpQ
 24Eg==
X-Gm-Message-State: APjAAAVhYb69h+hB3wAaKNcyssZljR+VSXyISRbb+B1UlZ+K+u/9lWMQ
 wZijhwCRxatkjwB9Iapg83iwJQ==
X-Google-Smtp-Source: APXvYqwa2jI9kowDnmL/rqWB7eSO3IaAAlTxnd2+35mKAMDNB9ECO/FPIUKPC8hU1vHsTTv7xd1BAQ==
X-Received: by 2002:a65:621a:: with SMTP id d26mr61172846pgv.151.1577576458723; 
 Sat, 28 Dec 2019 15:40:58 -0800 (PST)
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id e6sm45589258pfh.32.2019.12.28.15.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Dec 2019 15:40:57 -0800 (PST)
Subject: Re: [PATCH v6 03/11] hw/core: create Resettable QOM interface
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191220115035.709876-1-damien.hedde@greensocs.com>
 <20191220115035.709876-4-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40d11096-b1ea-d78c-e7b8-b5d41d450a60@linaro.org>
Date: Sun, 29 Dec 2019 10:40:50 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220115035.709876-4-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
> +typedef void (*ResettableEnterPhase)(Object *obj, ResetType type);
> +typedef void (*ResettableHoldPhase)(Object *obj);
> +typedef void (*ResettableExitPhase)(Object *obj);
> +typedef ResettableState * (*ResettableGetState)(Object *obj);
> +typedef void (*ResettableTrFunction)(Object *obj);
> +typedef ResettableTrFunction (*ResettableGetTrFunction)(Object *obj);
> +typedef void (*ResettableChildCallback)(Object *, void *opaque,
> +                                        ResetType type);
> +typedef void (*ResettableChildForeach)(Object *obj,
> +                                       ResettableChildCallback cb,
> +                                       void *opaque, ResetType type);
> +typedef struct ResettableClass {
> +    InterfaceClass parent_class;
> +
> +    /* Phase methods */
> +    struct ResettablePhases {
> +        ResettableEnterPhase enter;
> +        ResettableHoldPhase hold;
> +        ResettableExitPhase exit;
> +    } phases;
> +
> +    /* State access method */
> +    ResettableGetState get_state;
> +
> +    /* Transitional method for legacy reset compatibility */
> +    ResettableGetTrFunction get_transitional_function;
> +
> +    /* Hierarchy handling method */
> +    ResettableChildForeach child_foreach;
> +} ResettableClass;
> +typedef struct ResettablePhases ResettablePhases;

Since you use ResettablePhases independently of ResettableClass, I think you
should un-nest the struct definition and define the typedef as per normal.

Within the ResettableClass definition, just have "ResettablePhases phases;".


> +    return (s->count > 0);

IIRC, you should have gotten a checkpatch warning for the parenthesis here.
They are unnecessary.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

