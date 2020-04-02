Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63F19C75F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 18:51:38 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK346-0000JZ-1q
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 12:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jK33J-0008KK-KS
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jK33I-0001A3-4P
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:50:49 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jK33H-00013M-Qp
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:50:48 -0400
Received: by mail-pg1-x544.google.com with SMTP id d17so2114325pgo.0
 for <qemu-devel@nongnu.org>; Thu, 02 Apr 2020 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jonajcmlQbNIxbZxZoALCyaua1MvNdxewEy06ioKunY=;
 b=LVfyqqZ2cL2JGqajktVB1FlQ4/Oyx27aoJbzoKu4aC077hbUGHzqefObC4WQfe7gXe
 QzmVrK7VqLXkT+veTZ7Xu4AM4xzumxE1MTfBlabDOKmfNUQMla6XhkxXmw6yxu36UWxs
 JdVWxlpzFkW28m/6dTZxgAN09dVurUC0/5qQwZ8xjEsqXwY9JLt71dM+43hWvXxOb6wM
 UPSDKQXGWZOXET7argsplCARD2ry3L3e4RdLhWKnnGF7vaL/2Gc301xi/DQm/mORpeGo
 FtQIeazMrwvgZzvw15DBnKTxAH8DXN9D+rwciBHOHcYbZKOtE6WbNvMUn53LEhjr17lT
 Qrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jonajcmlQbNIxbZxZoALCyaua1MvNdxewEy06ioKunY=;
 b=qAwyUd9qwQDFFddAl2Gvbls8ZTK/M3uEOr95cj5fFtwXivkiIoEA1lphqfRC8ZmhNf
 Yi2d93rBry/AeFh8/w1GP95xrFopw0M+9qtOgdRCzD3Na+BNUeGtd9bc9fZnmjLIK/Kj
 +6fNuO3CeYio52ElOGjgPQcWFhSD7kDKJzQRy+qx3GvP8OLlPgs+Ac5698TrbBcPQ36B
 e6yV4Jco3974sTwfawRNc5fEgA3iF4vCra5KBJUKf8xiEyFt40lo2VenjgAFF9Xarvus
 jG/gpm6Tipr9Graf8UtFGq9ztwMBlg3V8EZZhEFPtXQiqVAx+AegiybIuS+qYhHyRXAR
 KY1Q==
X-Gm-Message-State: AGi0PubAF2XOlUUEAvL/xUo0N6y/tSCRyUvrtl45VsuoQTXQpnUkCXaK
 4bSaBtG6LMQOzCBUx4f34qlN/Q==
X-Google-Smtp-Source: APiQypLe1WlPT4UrTPoRpFx450Z8nkEKM/r69FUCuJjrVZkcAHHB1mzengr93fafQzOEA6uXPpETxw==
X-Received: by 2002:a63:2cd5:: with SMTP id s204mr4051325pgs.71.1585846246322; 
 Thu, 02 Apr 2020 09:50:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 71sm4126902pfv.8.2020.04.02.09.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 09:50:45 -0700 (PDT)
Subject: Re: [PATCH] hw/core: properly terminate loading .hex on EOF record
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200401193849.14017-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <509537e7-e866-04d6-0c7a-6e0c045ab56b@linaro.org>
Date: Thu, 2 Apr 2020 09:50:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200401193849.14017-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/20 12:38 PM, Alex Bennée wrote:
> The https://makecode.microbit.org/#editor generates slightly weird
> .hex files which work fine on a real microbit but causes QEMU to
> choke. The reason is extraneous data after the EOF record which causes
> the loader to attempt to write a bigger file than it should to the
> "rom". According to the HEX file spec an EOF really should be the last
> thing we process so lets do that.
> 
> Reported-by: Ursula Bennée <alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/core/loader.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

