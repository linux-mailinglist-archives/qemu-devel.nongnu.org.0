Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC901658C02
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 11:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqcB-0004y2-5x; Thu, 29 Dec 2022 05:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAqc9-0004xm-Hd
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:58:21 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAqc7-0005RI-Kb
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:58:21 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-14ffd3c5b15so9806728fac.3
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 02:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1mM8I1fdpLNXx+WXNI0FIERqWo4jgyBYr8e0WfZxeg=;
 b=I8Jax1BMhQ0R4IOhsez7JEM+QFnb6ZPNlGbXaWQ5+QhMdq0xo5rBbLjR6HU/zb0zb7
 m3mWHhmajVG1uG2tx3e3TsDID7xoxAPZ/g52syajhvVu4+JZAzvLgyBFdfcMJPcLrEwR
 UeieKTOrFFprRitkmNYtv52GDmI1JhHLf/BkV9QZEPtQX4w3IlBKFvRE/Fb5iwdqF/Di
 hU/UjgtTovB1BsBvolxlSQVRa21bQfcdX8tojQ3nn9tNwajC0HOyJPnyHaY4WkXFNcbP
 HXoMyyv0q974oWoOihrMMNQ9SY+tnL8HLNittidufm6qSFc+WtfBL/6wGI6XkvfjbJD/
 KyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1mM8I1fdpLNXx+WXNI0FIERqWo4jgyBYr8e0WfZxeg=;
 b=wgkMWsvkNoDmoh+ULgv6TpTyp2vqCItNQ9BNVEyqGudxY0y80VW/JnGoZhZxRPVKKi
 UdgBreOKqPMnHwBHlNpSWmWqDJ3fvzJsHgQ+SwsJ1tHgXXpEd+iKG1tIz5AZPbSGEgiW
 9pliGM3+ZvYO1ao72N5Mz+ugtTzkDvGHVqtXkn3WAb+EtbdXcdi/LhEm/54dxl0wo9d1
 JP7/EM/wN7QyMvMBfSSEPhebCrsR6/2j/3cL1FyJA/7zdzRFoq3upJttX1HU7XDlpGpE
 kpKub3pg65VlNHNXPKWdbALqquz9Ch+NpSgtoDSJ5ScXP5fuO04bFJ6aVW3DVJ8M9wya
 2BQw==
X-Gm-Message-State: AFqh2krlPYYM59LGtZWBmCG/3B8Kxa1YafZHqvDhUSgR5HVFC1MpWEb0
 j7zlBKFgxDxIkugQu7du7Vpuvg==
X-Google-Smtp-Source: AMrXdXuX7tfS5su7zr60H287fJLlL10gDg+kVMdHc7wJrufq+OjE0S4CLS939FzMIGKhZ8qSXRFuMg==
X-Received: by 2002:a05:6870:814:b0:143:9967:7e8f with SMTP id
 fw20-20020a056870081400b0014399677e8fmr14309180oab.53.1672311497913; 
 Thu, 29 Dec 2022 02:58:17 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a056870b01900b00144a3c526d9sm8490667oae.52.2022.12.29.02.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 02:58:17 -0800 (PST)
Message-ID: <d2a42da7-429b-2d82-2030-0b4b112ca614@ventanamicro.com>
Date: Thu, 29 Dec 2022 07:58:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221229091828.1945072-1-bmeng@tinylab.org>
 <ca5bb1de-652c-8074-5b49-867e40d0a818@ventanamicro.com>
 <CAEUhbmVs4-WCByerzqDK2G1FTaQVJ5RuzB_qaJ4yCeMeDqrKUA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmVs4-WCByerzqDK2G1FTaQVJ5RuzB_qaJ4yCeMeDqrKUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/29/22 07:38, Bin Meng wrote:
> Hi Daniel,
>
> On Thu, Dec 29, 2022 at 6:25 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> Bin,
>>
>> Not sure if it's a problem on my side but I can't find patch 12/12. I didn't
>> received in my mailbox. I tried patchwork but didn't find in there:
>>
>> https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352
>>
>>
>> And it's not in the ML archives as well:
>>
>> https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04581.html
>>
> Thanks for reporting this!
>
> I just examined the "git send-email" log, and indeed the "git
> send-email" aborted at the last patch for some unknown reason.
>
> I just resent the 12th patch using "git send-email" using the correct
> Message-Id, and hopefully it will be correctly chained into the v2
> patch thread.

That worked for me!

Good to know that there's a workaround to send missing patches in a
series - historically I would just resend the series all over again when
that happens,


Daniel

>
> Regards,
> Bin


