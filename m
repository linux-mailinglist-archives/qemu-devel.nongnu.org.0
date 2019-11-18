Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2431004DE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 12:58:51 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWfgA-0007Ji-3C
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 06:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWffK-0006rG-Hy
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWffJ-00079q-Ib
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:57:58 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44433)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWffJ-00079c-CS
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:57:57 -0500
Received: by mail-wr1-x442.google.com with SMTP id f2so19114786wrs.11
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 03:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Z6FmaBHsOU1C2p8TiRbTym8gKX11NopGl60nqnD0C8=;
 b=mKYColvKQ0w7WwBzciK1Pk60bSiDF36hzZMbSg2CETvjL3XeM4dkhpldIfuz2u9ENm
 /VDIqziOOuNgagaVQIt41gGJHb3O4gCMJbTucrvH4HQ50ih3ldGNjRdR2e2QZQXb+ucA
 PqYyVp16AyKiUil5Cj7ZhqgCsMYIrUKhXvdvGmbGdmRmnCKO3wBwruofw7fD2zhERvLb
 kJHO0u0K3RlhniHBHR8h0L/6VgqJgg7cSO7IrSZ5RgTq1zEx8tgOQGVrbyGMUwZUe+7v
 2MErm8gA6dOsQZOgiZING3Tzpl94g83CTvYk5C6TYbMlDZtdb1OqsbxddXVkGurj9Z0H
 PMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Z6FmaBHsOU1C2p8TiRbTym8gKX11NopGl60nqnD0C8=;
 b=g0htBca1GQDUTiO+Aks8MhkXVZoyP4SjxlwTWlfHVT0bcuBb+PggoQ7fpMFpXjmzZs
 SNE+r2GigP5s5qGQg6m2w9vwGdOIFHdPyP/HN83oi9tX9HGh9USETvbESZEzJc65gvuB
 1FgLx/o3zAy0FLqg4jhA3+EYT7hNaLVVLhs0G8OENTjB1mouG68b6Md9wDbhjzRJYWOQ
 AMeCoE5dKxibBWgGuizMTOP9Y+pSxlBt6VWrmD+avWXJmHZQ+i0aLG7DtHEm3BQLBE3D
 AlbjyASy+Cnq+FpEfbYIoRZEglY22PObdlTDAnRprvPbXVfdiiCE2zdOYRU43OILlA1m
 4OVA==
X-Gm-Message-State: APjAAAU7NTZYWskJQVdv2Qgku8O6tWr50IZxWq2neyxXa3do6sZ7Iw8G
 daBKG1fWIsPTljspb/p4X5outg==
X-Google-Smtp-Source: APXvYqyRzjf/X/Wmx26jujkvL3tSU8ks2HGk27KV6L5qeLsahUQtEkqgUda76vYON6KHq3Tt62vD7A==
X-Received: by 2002:adf:f490:: with SMTP id l16mr19098979wro.77.1574078276289; 
 Mon, 18 Nov 2019 03:57:56 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id e16sm12119992wrj.80.2019.11.18.03.57.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 03:57:55 -0800 (PST)
Subject: Re: [RFC PATCH 02/11] gdbstub: stop passing GDBState * around
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-3-alex.bennee@linaro.org>
 <9c06e53f-3efe-d2e4-1a76-5fc84d8cb6ea@linaro.org> <87lfsdh05t.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <21a15877-d46e-7e39-d83e-a68b698ca25b@linaro.org>
Date: Mon, 18 Nov 2019 12:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87lfsdh05t.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: damien.hedde@greensocs.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 luis.machado@linaro.org, qemu-devel@nongnu.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/19 12:52 PM, Alex Bennée wrote:
>> Modulo my question about why not use a non-pointer variable,
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Sure - we might as well go for static assignment. My main worry was
> overly long lines but we could shorten the global to compensate or wrap
> a helper around.

You could use a shorter variable name, I suppose,
though a good name is not immediately leaping to mind...

r~

