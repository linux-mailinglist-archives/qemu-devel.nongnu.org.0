Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894DD462EA3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:38:46 +0100 (CET)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mryez-0003DM-Cl
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:38:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrye8-0002YU-DE
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:37:52 -0500
Received: from [2a00:1450:4864:20::32e] (port=41961
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrye6-0002UB-HG
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:37:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so14210695wmb.0
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 00:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+hovv3rA1pBvjOFwEazudHQx/039wAx5293TPsxZvYo=;
 b=Q+vZGsI22K9sfGrnkOOPd8Ow+EiMoMWbDa64gtFaTW/D0I1loMveFdPymQf5w2pHDV
 ObZlgWa+vYmq1f37FB37tOWTFoHMAB9S/F1rc1z6APKlI9Rky3ENhCd85BQVEleF9viU
 ZSsU0HwxfI0YbodrnsTYZfpvxzQ5KhlaxO7710ItSonupqARFkKvZgofI1Bn9UYjl3yL
 Ciu2OYZnRCBm4SzTu4RIQLXVzZc7gL3GXGqJBwqN2pd+nnW9xHDlgt3iMOtMpKFIq+8r
 2oJa+KMk0QfVZT4py0MvQBpKLfPoA/iMFHfL1A9R0c6Dxyd8xiBj78ZcRVNgIf2Uf0mg
 NmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+hovv3rA1pBvjOFwEazudHQx/039wAx5293TPsxZvYo=;
 b=ScBo1ojFmt8tQJV9KbdVuGKAIKBwrqQmJFDmmdwL0OZ9VQKudLza8x4YAWvTYBxcay
 7ree/yxHo8Q10ZEV6RN+bkiZq/9IouHygjc3ZSrLCsekBydmI5V392rGEtO1sx+PkS0o
 ovSCpQC611IPDbojGsQ3PMWGDvTg2AR8b4T9JGkUAJNXh0aRTBHvK8jpoot8Pf8nmddh
 No1lO4LzqDNhvcEEqvY6CJiLRi1LxqOO40gJGBaNwm+JAeUaJfd4GxJx7YVfgUrGMZAr
 AoMokbtMTN/MjU5vUgH4OvAo6eWp7nrTlwsJtUKt77kuj8SROi+8bBaHSReeTta+LSp6
 ZGgA==
X-Gm-Message-State: AOAM530Dsu5H/oIj3+7geTpWHE/57nGJxjl+M4W5qSCDWs+MbIXoRD5A
 LOucXcyrx/1gdmRYLQL00EA97w==
X-Google-Smtp-Source: ABdhPJzQqC0nVrQvR/N3p9K/YZjTeIrN3Jrb+kzfOzy5bBJEWau3oYnloQHlWIuKj+wUAkjP92ZUrA==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr3311505wmi.35.1638261468371;
 Tue, 30 Nov 2021 00:37:48 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id x1sm15991559wru.40.2021.11.30.00.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:37:47 -0800 (PST)
Subject: Re: [PATCH v11 11/26] target/loongarch: Add floating point comparison
 instruction translation
To: gaosong <gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-12-git-send-email-gaosong@loongson.cn>
 <c9c08d6d-e193-969c-f82a-fc36ecff196a@linaro.org>
 <58f22862-7fad-d9bb-e712-2d915d944a7f@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97db0ee8-6f0e-1855-8182-e0fe37f2b022@linaro.org>
Date: Tue, 30 Nov 2021 09:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <58f22862-7fad-d9bb-e712-2d915d944a7f@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 9:22 AM, gaosong wrote:
> On 2021/11/20 下午5:02, Richard Henderson wrote:
>>
>>> +#define FCMP_LT 0x0001  /* fp0 < fp1 */
>>> +#define FCMP_EQ   0x0010  /* fp0 = fp1 */
>>> +#define FCMP_UN   0x0100  /* unordered */
>>> +#define FCMP_GT   0x1000  /* fp0 > fp1 */
>>
>> Any reason why these bits are not sequential? 
...
> We should like:
> 
> #define FCMP_LT    0x1  /* fp0 < fp1 */
> #define FCMP_EQ   0x2  /* fp0 = fp1 */
> #define FCMP_UN   0x3  /* unordered */
> #define FCMP_GT   0x4  /* fp0 > fp1 */
> 
> static uint32_t get_fcmp_flags(int cond)
> {
>      uint32_t flags = 0;
> 
>      if (cond & 0x1) {
>          flags |= FCMP_LT;
>      }
>      if (cond & 0x2) {
>          flags |= FCMP_EQ;
>      }
>      if (cond & 0x3) {
>          flags |= FCMP_UN;
>      }
>      if (cond & 0x4) {
>          flags |= FCMP_GT;
>      }
>      return flags;
> }
> 
> Is this right?

No.  You're not converting anything here.

I think you should simply replace "0x" with "0b" so that the bits of FCMP are more 
compact.  I assume that's what you were originally thinking.

#define FCMP_LT   0b0001  /* fp0 < fp1 */
#define FCMP_EQ   0b0010  /* fp0 = fp1 */
#define FCMP_UN   0b0100  /* unordered */
#define FCMP_GT   0b1000  /* fp0 > fp1 */

or identically with the form (1 << 0), (1 << 1), etc.


r~

