Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966F5F0D8B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:29:47 +0200 (CEST)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeH1O-0002kh-Fb
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGiH-0005OZ-Ac
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:10:01 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGiF-0004E3-2r
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:10:00 -0400
Received: by mail-pl1-x630.google.com with SMTP id f23so4083549plr.6
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=B7FR6/SANsHiFqOk63H637XSZLvd2rBAOsSMWlUxaHk=;
 b=NBPwK0GHEiT3OTxM+W0fg+oqxaEHURfu5htz6JdT4b0yRtQNy6XU2kGtOPmRkOyjZj
 qQOzx8UDDta7hQZePXCBbGAgeYCrjMWmbcdkcYCLXpsHCbxRWeQTT9y3fVzMs6WY06ti
 1KkFUTJbuDi8kQqnvhI3G2Xf3tz5BOsOtKVeptTicWeOG3tt/8rjRZdLvp11Hftb/Ycp
 g2BZx2BbcLDrHdCU+kUTfMVeTEvYjOfWxCuefGqo7gUbCOz2YnyzO6XZcDiI9DdqAWXl
 xOXhW7HpQ8Rt6FwLqU1Vr+2uvG70H8hfeRLwBZdhLS7wi6BymvD5M3IChJ61Bocru0Iw
 IF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=B7FR6/SANsHiFqOk63H637XSZLvd2rBAOsSMWlUxaHk=;
 b=KsVUm9PFHjCwW8hTVNVLxO1FAzkcbgFIQH5F0PJ8kq9m+pyX5igkuo1VrHlvQT+VFT
 x159isPgXGMELw5TinOPlJkho3+Vgj28F6WnGprn3svaFHrwmARzcZE40zCyqC8UWI7c
 IY4jne2ITl50iqqXe2ocItzML9PcLubauRgV4morx2qB0UNq0lYS+w8IsEb+1eceQ6kG
 /A0MTOMQqpN607CalDVgUNN4fwmU9AvKZRoNBNs9BjiIedjMDkqwhjeb3T7E/BnF6xBH
 /u5xFo4ulyzU3dxeTQp/3KxQkD5tDEIvO/J26NfMEw2Ww+70H3ENMRAx8trvibSqgirc
 kb3A==
X-Gm-Message-State: ACrzQf1XJhpysdNrVTNHBSoVTrgxAzFB71DN0aGBGUpv7wJFQh9mpKVG
 XQ4XICQCwI8GGXtlXpeFTwLWsw==
X-Google-Smtp-Source: AMsMyM6TF9iqu/kfHwlJ3bDYdo1byTSRMsreqm1SU6oJtCjYSCqhan3/lsiwqsTvrN+aQBuQ54+J/w==
X-Received: by 2002:a17:902:d4d2:b0:17a:a33:e334 with SMTP id
 o18-20020a170902d4d200b0017a0a33e334mr9119191plg.17.1664546997568; 
 Fri, 30 Sep 2022 07:09:57 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b00176dee43e0dsm1841226plb.285.2022.09.30.07.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:09:57 -0700 (PDT)
Message-ID: <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
Date: Fri, 30 Sep 2022 07:09:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] win32: set threads name
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: bin.meng@windriver.com, Stefan Weil <sw@weilnetz.de>
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/22 07:03, marcandre.lureau@redhat.com wrote:
> +static bool
> +set_thread_description(HANDLE h, const char *name)
> +{
> +  HRESULT hr;
> +  g_autofree wchar_t *namew = NULL;
> +
> +  if (!load_set_thread_description()) {
> +      return false;
> +  }

I don't understand why you're retaining this.
What is your logic?


r~

