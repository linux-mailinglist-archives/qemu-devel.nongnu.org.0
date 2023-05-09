Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC876FCA14
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwP6x-0005v8-8s; Tue, 09 May 2023 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwP6u-0005ud-Qb
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:18:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwP6t-00081A-5E
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:18:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso3973215f8f.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683645516; x=1686237516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oSWcK0VCYW4tbQwNCGOEfZ3AZKfPFukyqoVA20OuVbA=;
 b=u7nJsLcsBlj9H2h7Dc8PjyMnCjqLIHV96UlXGxMmatNcuwKLSSA0MHuerqPMKt0oFN
 eNEAKE4grDghWtKyl9n9p6vwzh8/nHk9wiPMUlUH6A6BdWrmZvsxAFJlBDIlrkKzoCkx
 GyA8nS345NLo0wzRMFAYv50pH3oXiu1kg8tqpM1mmacamn6805t87aCkJtL3xMH8MsN1
 0VyFlY7GEudisFYNPSGyX0ZWSJYDC5czsZRfZIuQ8L0Q3BhDgfGZRKT19xDH4iIsSSkt
 t2kK3ODh7L4hlRmNxAxb8RXigMG21xTy37Ym0QobV3anDqe9ifo9xVufEXQolvJ8WWEr
 YK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683645516; x=1686237516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSWcK0VCYW4tbQwNCGOEfZ3AZKfPFukyqoVA20OuVbA=;
 b=OcirrzxpfWZmd9ZsB44F0ivg2+BAt9qpRYjwf6q71z7k1f+XIvasmluakzRA2QT8cC
 8ZUwepXRJW8t68tnFP6CpspLSlN2FjzS4rcANuiJbzKAkowu7fXqh9UbPxcOcRaOXAf0
 2mQzAV6QRbsah+sONISCFDGu3nbJIxy4Pfge3mF33v/yh0x7dKPdZAmtul25gfsbrNb0
 PKvDzM24YdJdKw+ladEpzZ1P+tYE78RIA+vDdedoO8IRp0esmQII3YZ8iZdbyN+n6tSL
 Wp5WDYrMWlLSjZQi8cWV3/s62YsihQNoRu78YMCVB48o2B321LZHqL7ur5n4G87iS/Wy
 hPDQ==
X-Gm-Message-State: AC+VfDzSUomsLITj57dB8G2WB7uZqDaPFZRp1B7kx+iqbauhtBNLtEun
 Hn5Sdx7IwpXiQd+BuMMx1TAyIg==
X-Google-Smtp-Source: ACHHUZ5x31lWeFxh8MpDOPrw5xFxoxRKolJjozS+hJcny8Lp4GKK9HfgC2JfDzLgWxcsFF8bQylkAw==
X-Received: by 2002:adf:ff84:0:b0:306:2aa0:ce81 with SMTP id
 j4-20020adfff84000000b003062aa0ce81mr10320668wrr.30.1683645516441; 
 Tue, 09 May 2023 08:18:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4f11000000b003079986fd71sm5560627wru.88.2023.05.09.08.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:18:36 -0700 (PDT)
Message-ID: <88b44aa5-c7b2-3cad-b3cf-e69d312c66b9@linaro.org>
Date: Tue, 9 May 2023 17:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] ui/dbus: Implement damage regions for GL
Content-Language: en-US
To: Bilal Elmoussaoui <belmouss@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, chergert@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230509115940.114033-1-belmouss@redhat.com>
 <00958ee1-4c47-20e9-bcd0-ed92179ee831@linaro.org>
 <CALz9Gza8v5XSx1fgc53ihm6bgP6UvRXJiS6YFd7FoAh2C85K9A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CALz9Gza8v5XSx1fgc53ihm6bgP6UvRXJiS6YFd7FoAh2C85K9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/5/23 17:04, Bilal Elmoussaoui wrote:
>     cairo declared as optional dep, ...
> 
> 
> I don't see where cairo is marked as an optional dependency, the `cairo 
> = not_found` part could probably be dropped to make it clearer.

I was expecting:

.require(cairo.found(), error_message: '-display dbus requires cairo')

> 
> On Tue, May 9, 2023 at 4:34 PM Philippe Mathieu-Daudé <philmd@linaro.org 
> <mailto:philmd@linaro.org>> wrote:
> 
>     Hi,
> 
>     On 9/5/23 13:59, Bilal Elmoussaoui wrote:
>      > From: Christian Hergert <chergert@redhat.com
>     <mailto:chergert@redhat.com>>


>      > diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
>      > index 911acdc529..047be5cb3a 100644
>      > --- a/ui/dbus-listener.c
>      > +++ b/ui/dbus-listener.c
>      > @@ -25,6 +25,7 @@
>      >   #include "qemu/error-report.h"
>      >   #include "sysemu/sysemu.h"
>      >   #include "dbus.h"
>      > +#include <cairo.h>
> 
>     cairo used unconditionally.
> 
>     Shouldn't we now declared it as a strict dependency in meson?
> 
>      >   #include <gio/gunixfdlist.h>
>      >
>      >   #ifdef CONFIG_OPENGL
> 


