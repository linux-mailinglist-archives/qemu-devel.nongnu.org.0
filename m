Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11FEBE5A0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 21:27:29 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDCwi-0000bl-Gp
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 15:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCjx-0005m8-0R
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 15:14:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCjv-00067F-R2
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 15:14:16 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDCjv-00065X-J0
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 15:14:15 -0400
Received: by mail-pf1-x441.google.com with SMTP id 205so4228693pfw.2
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SXgANV8iGO6M+NLVO8hLUtq/ZmNYi7/i8Hb8/SzUw5E=;
 b=CMeOmUafC3SmsMBHZ/jf+QVf7isIAp+FxwMt2j8LFwC87SHdKHbRpCf8MyVJDctQHh
 zYfFrrot4E3yL7H67Fs8epPDwnYMhVirbRZDvddect9i4BmC8Q71Vrt3eAYAF9XyeH8F
 8KgBI89FrRME2GqPHHUD7C4cOtAUczEZQHOPXrvgmdcKdTFNTVkxYVkm99nBXA+MlMGU
 7IoRIRLLCOqdIMSILuSbQmLxconiE4f5kXmAQ/3hqBBVmp7iwpB90HvIQ/WSu4/Y0diV
 JHBik8SlOr1MfOUcMdDFfJLS6apsP1rpTu2o1DAX55VpcMFG/KRyaRaV2RRmqL78nAWb
 mI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SXgANV8iGO6M+NLVO8hLUtq/ZmNYi7/i8Hb8/SzUw5E=;
 b=H13kYaVCYj54M892pSgmCHPg8tXBodFPVb0XcfdEYOhDUNwgUVdTcjyh6rn/ZyiI7Q
 DbDEFe4VeIfuBeW42sVHdiMAuJ903cj2JuBwIDdG7tg+N78056OoJNey9cmEPrXAAZYz
 TemhttHuetb24QTGBZ1CLhgGFLPT34SSN5jVlZ2U4KdK0vSlvz8tucgS7BmRIIgXLEjB
 U35AcYgJYscrhPEiZBN8AoLN2SKHwzxFtoW3bpQcnoOZDjnkMJtb89hBBzWiVzlUl+FS
 EGdE8tX2qStFPOegIScqz+lE3hRJd1Pz+6/omBF7PjB4+qHPX3hwVsVl/jkz1ZgbSuv5
 Ypfw==
X-Gm-Message-State: APjAAAU7LcBnbrc7KHsX2IFsBD35PDIcloUXn2V5slnMFXjCEmExsrI7
 iKeiz588I+uL8LQSJqZ0VtMU1w==
X-Google-Smtp-Source: APXvYqy3FE2DPUnQcdqgwdxxwN9kxHAUp5MNHLqOaY5BZtWBlr4ot1wPvYWPGKoxRzIy+e5VNZEG3A==
X-Received: by 2002:a62:7911:: with SMTP id u17mr137933pfc.162.1569438854350; 
 Wed, 25 Sep 2019 12:14:14 -0700 (PDT)
Received: from [172.20.32.216] ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id j10sm8617958pfn.128.2019.09.25.12.14.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 12:14:13 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] s390x/mmu: Move DAT protection handling out of
 mmu_translate_asce()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190925125236.4043-1-david@redhat.com>
 <20190925125236.4043-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <661a6d25-a2c7-443c-36ab-22102f5cbc6f@linaro.org>
Date: Wed, 25 Sep 2019 12:14:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925125236.4043-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/19 5:52 AM, David Hildenbrand wrote:
> We'll reuse the ilen and tec definitions in mmu_translate
> soon also for all other DAT exceptions we inject. Move it to the caller,
> where we can later pair it up with other protection checks, like IEP.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mmu_helper.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


