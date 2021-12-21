Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFBD47C97D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:09:32 +0100 (CET)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoGA-0000Np-R3
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoCn-0007dQ-NU
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:06:01 -0500
Received: from [2607:f8b0:4864:20::62d] (port=45797
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoCm-0005io-14
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:06:01 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w24so387679ply.12
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZkeqUBt4uknaJaZIEmelGB7Cm2loobJTMDGANetUOEo=;
 b=LfehHChuaRc8sMsfw2dF49YnPDYt3gvKzHyrtgA63rb/u0T8myRiT8vFU4CgGvwy4V
 GpmheG7Rg45GNrbjA4IsydkIcSymQqyzW8C2thx1obLoNTa1ooB2WLWnxINtwn150cmn
 23iPcPlG1EB0RE963i1jhD9q28LxJDJqj42i+b2Krns1ZrgLbL/cqOOp+Wh5vqyV2C3K
 aS5YEObn+M2IKzWHeQxN256hPO0gQa8yoDbxFLTcCIdWXUb55aLJDXylGj1QvpRoFjuF
 vXgBDbciDnTEcYoxLb7ggXMWEGfui0hTBLCDZ/EvCFMlCnRbiI2bGR3TxTVeFrkJ+leJ
 1o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZkeqUBt4uknaJaZIEmelGB7Cm2loobJTMDGANetUOEo=;
 b=mHdF7Ux3DQLZ+R32KPcZeynfky4kO5fkzy89pO533afZiQlHnaxuzKzn1/uZPyYjyD
 7gxIQQ2Leet3Nexc2GSGLOaX5tYIkGTvlusudDLd5ph35KiTOs3DFJF0SghyMGliiOTF
 SJ3fW/Zfrfcwzp+TB10mTHF9BVy8F+9aHKbYi/XIDje8nKJ3ICbSLD7cXvYl1mtiDq9z
 XsFt/ASfPzNj7LgcztZlhRUJ+TJwVRw0aOGsC/tIfi6cvmtpQ+JFBd2dWiR/n6V+LkyO
 ZHGn9QsUWC5IU3V6+xXR4hrZ3LqSZDb1COIvFZmmLAjwxaiU+Gn7Qaiq8FVOmbXc1xCZ
 9n3w==
X-Gm-Message-State: AOAM531s4QSoY/+qeXjgsE+MAETffsyS8TVsccstWBTrJ4qAw9GlJzcd
 3H+iHKA0g/dXTmPpQB5EhYsSUw==
X-Google-Smtp-Source: ABdhPJw5ofEjJ/jTJbD4Bbr79mS1DSJ5kafFPzmM4FyZ6iy7uCnRH8X+aa0RYxtSYHSCLGj4FBPDaQ==
X-Received: by 2002:a17:90a:9b06:: with SMTP id
 f6mr715547pjp.124.1640127958290; 
 Tue, 21 Dec 2021 15:05:58 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q28sm126940pgn.14.2021.12.21.15.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:05:57 -0800 (PST)
Subject: Re: [PATCH 1/4] dma: Let st*_dma() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12c1fba1-59f7-9b68-0363-328f545b1093@linaro.org>
Date: Tue, 21 Dec 2021 15:05:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218145111.1540114-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, David Hildenbrand <david@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 6:51 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling st*_dma().
> 
> Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/pci/pci.h       |  3 ++-
>   include/hw/ppc/spapr_vio.h | 12 ++++++++----
>   include/sysemu/dma.h       | 10 ++++++----
>   hw/nvram/fw_cfg.c          |  4 ++--
>   4 files changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

