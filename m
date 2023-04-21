Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E066EA41C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:50:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkbJ-0007lh-3c; Fri, 21 Apr 2023 02:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkbH-0007lT-0v
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:50:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkbF-00086h-Ca
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:50:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso1239984f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682059827; x=1684651827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJu4AgSh4dGR5hWnl39eAJ50huPA9v00MqihPCiW4AE=;
 b=KyMTp3xAa40tLVD6vjrXhsIp2enuHX5oIzgcveBDuu3LaTGRJmVntE6AIIlVvNmHbw
 I2JO6Nxgey28NdinmcQhot5NUycpNbUvFmaCEqMp7iPP5SKfr08hVf0p+4hcpRGL0Wtj
 n1uE+Eh1NxlN3WXrT1ErzE3UxTmB2DKeQYEGpFh0WMHtkbP/CF9jp9nKvWcpYsmx2RzO
 ap385YmKdImTMnJF3B0cKPEH8pyI3YnEQlakSY4miR0v/6xX7QfaQKwWQcO9p7MO8GdV
 drD4K1Hzc6MLmiqnq1vfP8bmFxiQ76amfa6/vCZHqpeEOMOwCa4Fre+zXA9zyQpO8YL6
 l3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682059827; x=1684651827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJu4AgSh4dGR5hWnl39eAJ50huPA9v00MqihPCiW4AE=;
 b=MaUUzcVS+ewx60c3sFxokDDssIclxsL62V/saV16gV8T5g6pe+nm4PKCIUJmCWLm0J
 zKsMiM7h+gSjvv+YFEokvcjuQ3nUapQ1kS/+bCyvIEeY+TcMLFYIyuebN0XesKRtVuWV
 hijqrWKwJMVjGgGO7UCmOY+P9z233tpOkXxvCtgr9UUHlbIIUFv6qYMzvLsiTQYKHfLc
 qmuouC0s7kNCFwKj4On1Nlo6RA+cJLuntdl4V+kO8C+tb2k3lAlM1iTO5YBykkAa+N2x
 +1KPovelWfVMIVsDjRqUXi+C7LowQuXpZeBf3dwd6VXKzbKNm6nIX46YHf04Ms6l/f10
 vg3A==
X-Gm-Message-State: AAQBX9exnBVlxxZBGb3UyAZRSUpHOisE3DrI5FTuWRpKNZi+YnLSFmn+
 x26Kx7L2xAUV/SBZQHnMcHjFTw==
X-Google-Smtp-Source: AKy350amXo+PNWHEq338aRPxTU53VM8aPcqWoW3iJH3Pp6GhVtRpOc40XAkX+SSqK9xpM8/v+0kVfA==
X-Received: by 2002:adf:dd8b:0:b0:2fe:605e:c77a with SMTP id
 x11-20020adfdd8b000000b002fe605ec77amr3591011wrl.52.1682059827391; 
 Thu, 20 Apr 2023 23:50:27 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm3679042wrz.75.2023.04.20.23.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:50:27 -0700 (PDT)
Message-ID: <e6f693ff-bb0a-838a-c76f-ef05a5ec08a8@linaro.org>
Date: Fri, 21 Apr 2023 08:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 07/10] trace: remove control-vcpu.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
 <20230420150009.1675181-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420150009.1675181-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 20/4/23 17:00, Alex Bennée wrote:
> Now we no longer have vcpu controlled trace events we can excise the
> code that allows us to query its status.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   trace/control-vcpu.h          | 47 -----------------------------------
>   trace/qmp.c                   |  2 +-
>   scripts/tracetool/format/h.py |  5 +---
>   3 files changed, 2 insertions(+), 52 deletions(-)
>   delete mode 100644 trace/control-vcpu.h


> diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
> index 285d7b03a9..ea126b07ea 100644
> --- a/scripts/tracetool/format/h.py
> +++ b/scripts/tracetool/format/h.py
> @@ -16,10 +16,7 @@
>   
>   
>   def generate(events, backend, group):
> -    if group == "root":
> -        header = "trace/control-vcpu.h"
> -    else:
> -        header = "trace/control.h"
> +    header = "trace/control.h"

Just include it in place in the template :) With that:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   
>       out('/* This file is autogenerated by tracetool, do not edit. */',
>           '',


