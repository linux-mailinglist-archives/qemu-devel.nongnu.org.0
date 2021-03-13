Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E633A029
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:04:46 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL9Z6-0000tn-QU
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Xy-0000F4-6O
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:03:34 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Xv-0001dP-Ft
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:03:33 -0500
Received: by mail-qt1-x831.google.com with SMTP id x9so6451313qto.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BtrUSNey5yYk32ASsnH8jpLrBGqw39LoEt+S5CSmbuE=;
 b=XQaMXc9U1SxHWTYgMxms02j8GHmUnSj18UDOtGwcbCBvQAlBxYn0nmi7skV7FilGMd
 fnchIE2kuekx8uWAI8S8MA25Hp7kKH+oNObraY0WslfLEzQo4eb2nxYp7rEzNw2BzfTv
 T5WP09WWmDssN6CRC9IWi++5E8tjexIzYaIApSr/2dW+fb0gkuvWuxIi60/XAioUj0mH
 9JKkgTM90wBroNQvtl5XuxWAk4zcXP7y5HdW7BgFb+Ms5tZwH3A1/Tb2EFcgK1nUiRuU
 AWUUallAT5qKDV65qdgDkJRpZf/r8aVNRKfm3IJFhluYfYZODl9I9weW7agepWmO8I09
 rlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BtrUSNey5yYk32ASsnH8jpLrBGqw39LoEt+S5CSmbuE=;
 b=QegGFVqqixC0R37R2Ld6S9WwGuAtTFUgLcElDUJOHFvgGpYeaRWmAVvLQxzL1GZ2fb
 VdO/fXOqt7kOSO1Jvu0jrOF0FJRG0k2a5OcnFcY9HDCyiOL7+VPFknbUT9gu6xIlTxRC
 e8PCCJpmUNE989foYOaG/efjbfw3ujnuxM6hupUPmGimD1uiBeErHKby3GIDtMRL44zZ
 wl/+MA9sYIwNjJ8d9u6f3g03HS2OcHC1YOS5QB3xtoL98xMHGbi4DBKakvkiWUkrMSxn
 /q9dbUwL9qOOA69THWtYE8WbT+Qs0xwJwum9fF7HD2s2+x04sBQ6QLHJVlIYKhiqF65C
 /eAQ==
X-Gm-Message-State: AOAM530vmAdMjvqd+LKfYkRAXcd9KG3DZKVAMQAXIlVyQQHwNBLcviMR
 KNHqdK8N1e8ayD5QLBl5D0GLJA==
X-Google-Smtp-Source: ABdhPJyVgjETPmV40ezDlP40QMALnUcnYkCxTqXiHm2FZRC8Q5Q7JIDM5+FWooMw8rL+GpL2uTcutw==
X-Received: by 2002:ac8:6b85:: with SMTP id z5mr15521280qts.296.1615662210395; 
 Sat, 13 Mar 2021 11:03:30 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e2sm6526486qto.50.2021.03.13.11.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:03:29 -0800 (PST)
Subject: Re: [PATCH for-6.0 2/2] target/arm: Make M-profile VTOR loads on
 reset handle memory aliasing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <20210312172939.695-3-peter.maydell@linaro.org>
 <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92fc3ab0-5897-0c96-eebd-8b27951265c7@linaro.org>
Date: Sat, 13 Mar 2021 13:03:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 2:17 PM, Philippe Mathieu-Daudé wrote:
>> +static int find_rom_cb(Int128 start, Int128 len, const MemoryRegion *mr,
>> +                       hwaddr offset_in_region, void *opaque)
> Return bool maybe?
> 

Yes, it might be worth changing with the first patch, while we're changing all 
(one) user of flatview_for_each_range().

But he can't simply change it here -- must match flatview_cb type.


r~

