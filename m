Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2800225EC62
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Sep 2020 05:59:43 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kElqA-0007xf-7x
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 23:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElpP-0006um-8M
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 23:58:55 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElpN-0004wi-Ob
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 23:58:54 -0400
Received: by mail-pf1-x442.google.com with SMTP id 17so6788608pfw.9
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2bYMEGomk8hFaxqfnpouoTbsg/xQOjjaCJvBHSA7k0=;
 b=Zk3iZdvBP/jhMTZhyOl8NROR0TjohTsPb7ZUme9041tL1oZbCi9N+9KpL3EjSe61yn
 z7/ZQZEDySrZjWQ0/MC0GJ16vrAUWJufpJmRbd4SRNNX7/mKi5rbqVuzmTGofz9azexA
 K0v4Xv6HjA8OVNlB57hvqsYHA1Dikbo4W3vNIiByVPrmvcymPU9jEoF1gzh1HvYWaK3H
 nnlaOBnFK5zdkx3Hn1SQcfv0j1CdfDFfyLaoqEWmutx+GDl55GR6nH2EiAzv80ZJnSO2
 uyQzepBPviTWK/ZPEnnT6QpGhHcyDEcOxbqw+2jwZkeqLuVgWE2YdTeW5EY4r2auNC2s
 QGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2bYMEGomk8hFaxqfnpouoTbsg/xQOjjaCJvBHSA7k0=;
 b=GM/T79CMksac8JlYVMqtS/Zjo88h3ikqZ14zEp1zUF5DpBnWc5Dk3HtTD6BF7Oc890
 /kZUc46SMcf1ziap5Ll2UrlCpEVHklPqKLYZQsfj/rh4mA5M70RFWEGT5f/0h0dEBMKH
 BHWKkhX8tsZx6jnC4kulc5C0yL2OGaQVZP/Jn7mVaKTYLVXKzjZFa84JTksYwB/C3pln
 L4U+9LGK0IiMH5zaJU2+R6LO3iaj2xmg+lhd3RXvtJ0FOMJhMg8Li8vwS5/7MHuKlDL2
 zhfeuV3pCaKZCrx0ATpFLqxwRboPRbhjP5KqSiX+ihtMkFSMQ+3XexMK3eykMDELFrVH
 XzAQ==
X-Gm-Message-State: AOAM530mFTbA9j7CZ8CsWeBbfjsAHyfHHOylNq41oDGheNaE6SrcjU3U
 w9E/z6sX7aiIr38dNFbR509ghg==
X-Google-Smtp-Source: ABdhPJw8TsyWgf/eJXu58/vIHNUv4OF87SrEJxupqB9QKv6vScQFeqaato3gTno0BaJlEh3rKbKSZQ==
X-Received: by 2002:a63:6d0d:: with SMTP id i13mr12798785pgc.372.1599364732557; 
 Sat, 05 Sep 2020 20:58:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g192sm3490029pfb.168.2020.09.05.20.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:58:51 -0700 (PDT)
Subject: Re: [PATCH 07/13] dma: Let dma_memory_write() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ccd69c0-79b0-d6ec-9dcb-a0df245fa9d9@linaro.org>
Date: Sat, 5 Sep 2020 20:58:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> dma_memory_rw_relaxed() returns a MemTxResult type.
> Do not discard it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


