Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E13CA1BF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:56:58 +0200 (CEST)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43jN-0003p0-Af
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43hN-00012k-Ql
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:54:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43hL-0004H8-7l
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:54:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id n11so3614828plc.2
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GGmI+Zw1aXEB8/cRYJbilKahVX3Bw9TFiAFUFDF6nPE=;
 b=z7lOmw/R60eo44u2L1r8jaxOgUWJx/8Fs1M2vFQhtDNiBko0G3eYRSKMWcepxDArrN
 7OlgWBboQL9VJj1nayb3Y3S08YLypjDLZlcJPGjoLh4PMiFHbefPNOXs+CNm/FUfVyj4
 y21oW8IEUwibZDdBkDonpBvaeB/eimziYMynDYv5l24krlh1s73ntyLDWWR7m1B9NRAR
 GdznSSCFAQR+V+/x4zMhz0OWgwqT/cLJM1QoZC1H1TQt2hqR6jBmoYRfOowpM472BCWK
 XoeDnyMrHQwIooWB9JbltKq31Do9JUhDoWD3P9wTVNMd+JWkGHJA5gM8EekaOZV2Vq/9
 44Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GGmI+Zw1aXEB8/cRYJbilKahVX3Bw9TFiAFUFDF6nPE=;
 b=Ew1uyjSFa4uISdPlr6odQW2Fu2ES1srdkDvhi+Cql9X4fZt6MhGIClG72X+RWHUStR
 E6DTQFiZP+86M5XDtOGSDoNRXDhEYo16nMFIX8R0q4+/QhfZ13dEKVQGdcupuEUVxjE+
 xeiEY3r21V1LMaa/DEY4o8FKsAJnd++y6boU99+N82+IGU8ssm70yQW/9RHNXwMqgKjx
 G09e1thR0ucVVeukSlJ51BA6iW/3I6T6YXjyi80qHICi/Mm92FfWAALHTOhAtxMXt9r2
 jXsbABEBW6vlpdqoB9Wt9IZuvRCpthBMKwGsM8pwDTiVV1SkvBn0jhct8rUoohUECTSk
 c1Kw==
X-Gm-Message-State: AOAM532EaUQQd4f3TLNpSQXYP6jR4rc2qkUql82HmkYmaPEmgRIYjDSB
 OkLQyroHgFE1arBOM0mruWhcrw==
X-Google-Smtp-Source: ABdhPJz4J3oTMsJX1T+huz8UrvjOz2rFQgjJwbHpDmMqa8V8eUBHYuEveorCC5YvxkGssQp+qnJ53A==
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr5149893pjn.212.1626364489919; 
 Thu, 15 Jul 2021 08:54:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n4sm7164799pff.51.2021.07.15.08.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:54:49 -0700 (PDT)
Subject: Re: [PATCH] hw/net/vmxnet3: Do not abort if the guest is trying to
 use an invalid TX queue
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20210715103755.1035566-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07d133e2-6986-cd6f-0fa6-23041b180dde@linaro.org>
Date: Thu, 15 Jul 2021 08:54:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715103755.1035566-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 3:37 AM, Thomas Huth wrote:
> QEMU should never abort just because the guest is doing something odd.
> Let's simply log the error and ignore the bad transmit queue instead.
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1926111
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   hw/net/vmxnet3.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

