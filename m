Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDEE3296BB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:01:07 +0100 (CET)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzxq-00047b-RK
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGzw3-0002sD-T6; Tue, 02 Mar 2021 02:59:15 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGzw2-0000Hi-Ab; Tue, 02 Mar 2021 02:59:15 -0500
Received: by mail-ej1-x629.google.com with SMTP id c10so6916852ejx.9;
 Mon, 01 Mar 2021 23:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xzAlio/kE6zk7ZS2LsQAKCOZGJ5EHPCNaBD5AbsreGA=;
 b=vN0NqxQ5K+vlP6mehP8YfAqzTf8ZZW4RvnDWTLRdSJBeZe1rCQ1eQmu3vh+5jHcBrS
 JUww8Xh6vC3LkavJmJxXSmGw/7WuYW3rpAcK6ZNA12DT7kRnCHPTVELGKNNxJhWwtJ18
 5o1bhkHKdwLqEsS+t9soKsDTraXZkPYjTO85T951tlw20/1/NZSuDaaCRLNXPrHq8bMQ
 p05cAzC1BNzkBNce6ySnFUb78qHkmwXzdS0iGljdTVj+oYl46wNpizIG4aPtVVhIXp8w
 pyL8qiLc6g9q0kk8y34/G0fnOT+qQrqv/Hx9cwSqpPlFRbpATuzQo2rL+70Sh+aG/tXi
 If4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xzAlio/kE6zk7ZS2LsQAKCOZGJ5EHPCNaBD5AbsreGA=;
 b=ElqQ6iAowjspDPrUno4OhiS4hrXd3t4Tf72TmBG++l/Vvinuxa1wK3Lf/DvqD1H/8+
 MepiH8Zx53w2Vw2aN8cGX/oCgyQB87Y3TvQyg/r6clYFPKW7RzprvCXc8YvO7hSuByD5
 hzrEeGIGh3YvTpcxHAgVQEtkx6VXGeNM9dr3lFlFE0iu4mz3JyvwYDaCP/lahyDMU33R
 R9VN9B+B5I3VDXBV1MI4obuvajTJY/NypkzIo6DEmOqnm0U0rLUn2BfssLAIIIgf3YnU
 ByfH3YHlcMDPlkxcn8JmgkF/LdR6v3VWeurkq1Adb4Ug713PIoIu26d0Xy9c1pnSqCMG
 19AA==
X-Gm-Message-State: AOAM532fjHRsCanAjMz2EDdroaXydMIlxd59m0rXeTmUdefxO6BfSN+4
 BVJyLpG/W466Vd3mUlqZkrw=
X-Google-Smtp-Source: ABdhPJxzVJo4sde85YhgCHQ/XerfCg1ZRWlQhtc1tZMn1Db1dluDZM5G0aQ/OSs5ZZMz3J23uU7eog==
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr4656229ejr.525.1614671952494; 
 Mon, 01 Mar 2021 23:59:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s2sm8946673ejn.112.2021.03.01.23.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:59:11 -0800 (PST)
Subject: Re: [PATCH v4 5/6] hw/pci-host: Add emulation of Marvell MV64361 PPC
 system controller
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <bdcd7aaf18dfe93267d7a02ac4fa451cb5749dbd.1614282456.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8b46f28a-f08c-28fd-d323-604ab1e231bb@amsat.org>
Date: Tue, 2 Mar 2021 08:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bdcd7aaf18dfe93267d7a02ac4fa451cb5749dbd.1614282456.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 8:47 PM, BALATON Zoltan wrote:
> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
> chip that is used on the pegasos2 PPC board. This adds emulation of it
> that models the device enough to boot guests on this board. The
> mv643xx.h header with register definitions is taken from Linux 4.15.10
> only fixing end of line white space errors and removing not needed
> parts, it's otherwise keeps Linux formatting.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/pci-host/Kconfig           |   3 +
>  hw/pci-host/meson.build       |   2 +
>  hw/pci-host/mv64361.c         | 966 ++++++++++++++++++++++++++++++++++
>  hw/pci-host/mv643xx.h         | 919 ++++++++++++++++++++++++++++++++

Maybe name this one mv643xx_regs.h?

>  hw/pci-host/trace-events      |   6 +
>  include/hw/pci-host/mv64361.h |   8 +
>  include/hw/pci/pci_ids.h      |   1 +
>  7 files changed, 1905 insertions(+)
>  create mode 100644 hw/pci-host/mv64361.c
>  create mode 100644 hw/pci-host/mv643xx.h
>  create mode 100644 include/hw/pci-host/mv64361.h

> 
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 8b8c763c28..65a983d6fd 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -68,3 +68,6 @@ config PCI_POWERNV
>  
>  config REMOTE_PCIHOST
>      bool
> +
> +config MV64361
> +    bool

Missing:

       select PCI

