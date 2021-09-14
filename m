Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71A40AEE9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:30:08 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8Vj-0003IZ-Ky
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8Nd-0003eL-6z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:21:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8Nb-0004DG-LK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:21:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id bg1so8157058plb.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G5NUpSAYht/GKU7RRg9sehG7UQyG+gEz5V054c4TTss=;
 b=ENl1j0iee9mIQNY/BWCK4aoDX3rwUQhXwMc+Ae3yZ0LD6ORv+ppOyg7N9RAiCE0jFu
 6gDBOyWhMKzPVM7WA5LS5ZaEZAnEnt+GhCsxWWSfA4W/BCK7GL1Cn8fNGwae/WCJ2gXm
 1+oqCwv7J7uXM2VPwPVkk7yCtGDvSy5Xtc+MjQ+hSLoLhjhv1hyGLEUXtZGFk0nq3lcw
 PCPetOn9jy6oOGM4DNwQUIvLHmX8TnNtbZGTzb9fd86QziRhOZJaqbhLfBbWcKCTAup7
 uYQRJaV8A8XILebESIu8JSwFxFmVow0BCSmEhElKoFmd7euOWEVhkyVe4TcLLlBTpHOe
 Uc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G5NUpSAYht/GKU7RRg9sehG7UQyG+gEz5V054c4TTss=;
 b=D0hO6AjXw+/8g4t04GE76LWvkNxPLyr01vmpmRYlCqS0jDxtkCR7ay6DFk8XzmPS4s
 bo1c/5uqi/sZRvIaUtHpwfEFNZxnM/GgPoCwllMtpu9yEvn1u5WoWoAYF7qUd9EYwR+K
 SjyfSxdsPmtjHWFgI2RCJdKiXtbxD6MRIFQlooIAg7UnvqlYuN2FK+EpGh8WLPOQaXCN
 XWJKgSFo10FGzJ2CWqESH72goPStWp+lOWUu2GgU4lMrXnG+xI1OSPYwelZptDRH4zKs
 thy0lFOXnbEF9T/RMKjnZfYTgCMxw8dHdmNJlSO3Jx/ryVmKZ4c9leXaqvIU5PM3Gc6w
 MnUQ==
X-Gm-Message-State: AOAM531Qzh/V0pUqwLBwbZwNpqngmtT8ZcJPWPCghQa0Uw3Wm+vWPKEg
 qLUiz2cCmcW0saAwFdpayxjf7A==
X-Google-Smtp-Source: ABdhPJwneOYnUzHqiwE8mltESTnxCsFKFvl1oUudSIKD5lXIRsecSOM1Kk6AqIHz3F0ZbtWuB1GVYw==
X-Received: by 2002:a17:90b:23d1:: with SMTP id
 md17mr2078622pjb.105.1631625701983; 
 Tue, 14 Sep 2021 06:21:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d3sm11824579pga.7.2021.09.14.06.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:21:41 -0700 (PDT)
Subject: Re: [PATCH v2] target/ppc: Fix 64-bit decrementer
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210914085404.3889441-1-clg@kaod.org>
 <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
 <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <516bb260-3837-5692-b31b-5990f5c5106e@linaro.org>
Date: Tue, 14 Sep 2021 06:21:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 2:47 AM, Cédric Le Goater wrote:
> On 9/14/21 11:19 AM, Peter Maydell wrote:
>>>       /* Truncate value to decr_width and sign extend for simplicity */
>>> -    value &= ((1ULL << nr_bits) - 1);
>>> +    value = sextract64(value, 0, nr_bits);
>>>       negative = !!(value & (1ULL << (nr_bits - 1)));
>>>       if (negative) {
>>>           value |= (0xFFFFFFFFULL << nr_bits);
>>
>> I think these lines that say "if negative then force all the
>> high bits to one" are also no longer required. That is, this
>> entire section of code:
>>      value &= ((1ULL << nr_bits) - 1);
>>      negative = !!(value & (1ULL << (nr_bits - 1)));
>>      if (negative) {
>>          value |= (0xFFFFFFFFULL << nr_bits);
>>      }
>>
>> is an open-coded sign-extension, which can all be replaced with
>> the single line
>>      value = sextract64(value, 0, nr_bits);
> 
> 'negative' is used for more tests afterwards but you are right. I will respin
> with more changes.

After the sign-extension, negative needs no complicated expression.

   value = sextract64(value, 0, nr_bits);
   negative = (target_long)value < 0;


r~

