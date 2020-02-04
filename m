Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75192151BC1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 14:59:58 +0100 (CET)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyyk9-0002ki-8Y
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 08:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iyyiY-00018u-Bc
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 08:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iyyiX-0004f6-00
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 08:58:17 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iyyiW-0004WG-2R
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 08:58:16 -0500
Received: by mail-wm1-x341.google.com with SMTP id f129so3789351wmf.2
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 05:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h1CAwFSWTiURsKG+DQ9OqWdnrBu/P/v2HU+Vd8NFnjY=;
 b=Esj64aAsrTxKNIvWjoJsUp3j4HDn0+UHZ4taH+JNrJbTHjWStzyDrmwBx4duPgJl6q
 bD3cAJs6Xwri4MVLWwDugMZduUQbeYsPCJIHvdiRl8KMKzT4tZ+AaRVnHysgMSY2b96b
 QmBStVvU9f8qHKxtlNYmjOe8pPFi4IsAoBUvtMHQju3Wj+AQQ10GxRy/tqMRqzRVzTjM
 fHm6BlhJUffCMBRjBzAxLknQW+m2FYWAP9c6Xiaj9YgDGqkDLMIu38BF6c/fVthF3lYa
 H0SwrtBIzTgKTCtni+Xrka/AdgClk2CN5K957a54H3c5+jzn4hrwqMg8jaMgDOQ9Zqp9
 Az0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h1CAwFSWTiURsKG+DQ9OqWdnrBu/P/v2HU+Vd8NFnjY=;
 b=PLKSca1kwErHCJ1reIdrbs/JJm9O3lZYc6SEX6jtTj936Jrbrsd7m54NDM0boCAV7k
 284WNNVhS//DRd+Rh5YSdgyLuMFZYHAv7YD7lob7Cu8fsmyumjkPW0A3E1kJhM2Ubtvn
 rjKwFPJziL+gYIJMTboIj/Cq+JUEe+ZaERnkNZ61pTsccg80RHflbaiyyFW428F3x8aH
 BqczPQtwetTLnXznGveJvjXzGVImixTjHVZ/2+zGtXg6pXiC5Hczyw8UIqwauYSus8uv
 EJaSW0P/m3QwDBMIzC79x8lE2gwRZr61dtwmIJeIC+EhAKsOnqr/fzMywR9VV7FYum/f
 +EPg==
X-Gm-Message-State: APjAAAUXKBU1dkyUeWp8j2wzQTC6riHSBW87Y+QbeZvwfyWmpjSDDTNa
 zI8EO1Iiapxs3BjVMTxsdbw78yTgs5XwZQ==
X-Google-Smtp-Source: APXvYqwVvYdfyVolF/whZAGiePYbOZVB+wGCgqznYle1JP/p0icyrfZVRWO34MItm+sPIXNjFTl+QA==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr5891766wmi.58.1580824692878; 
 Tue, 04 Feb 2020 05:58:12 -0800 (PST)
Received: from [172.27.246.116] ([212.187.182.162])
 by smtp.gmail.com with ESMTPSA id d22sm3898850wmd.39.2020.02.04.05.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 05:58:12 -0800 (PST)
Subject: Re: [PATCH v6 30/41] target/arm: Flush tlb for ASID changes in EL2&0
 translation regime
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200201192916.31796-1-richard.henderson@linaro.org>
 <20200201192916.31796-31-richard.henderson@linaro.org>
 <CAFEAcA_0at8qwiyxqwwqath9i3URBWBEKf-9nfgWikhnOfcO6A@mail.gmail.com>
 <CAFEAcA8y2Zfd=qM+U0-tQB1GfC59FOy08Rx-a5AvSaqbvCnGag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d60a4f6-3eae-3f68-97cf-dd41650b482b@linaro.org>
Date: Tue, 4 Feb 2020 13:58:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8y2Zfd=qM+U0-tQB1GfC59FOy08Rx-a5AvSaqbvCnGag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/20 11:49 AM, Peter Maydell wrote:
> On Mon, 3 Feb 2020 at 11:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Since we don't flush TLBs when HCR_EL2.E2H changes, I'm wondering
>> about this sequence:
>>
>>  * initially HCR_EL2.E2H == 1 and the E2&0 TLBs are populated
>>  * HCR_EL2.E2H is set to 0
>>  * TTBR1_EL2 is written with a different ASID from step 1,
>>    but we don't flush the TLBs because HCR_EL2.E2H is 0
>>  * HCR_EL2.E2H is set to 1
>>  * guest will pick up wrong-ASID TLB entries from step 1
>>
>> Does the architecture require that the guest did some TLB
>> maintenance ops somewhere along the line to avoid this?
>> I haven't tried to look for them, but given the different
>> ASIDs I'm not sure it does...
> 
> ...HCR_EL2.E2H documents that it "is permitted to be cached
> in a TLB", which means that the guest has to do *some*
> TLB maintenance ops if it changes it; unclear exactly which,
> though...

TLBI ALLE2 would seem to fit the bill after E2H change.


r~

