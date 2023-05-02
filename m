Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3286F4A3F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:20:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvXO-0004bM-RH; Tue, 02 May 2023 15:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptvXN-0004a9-DU
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:19:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptvXK-0005cx-DQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:19:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so43766475e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683055180; x=1685647180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7usn756S/TuIOQBrdWdBXYCsofXslEW4cXCpMHZzuEo=;
 b=tyXk5/g+MnwQCMyQ377Dxl0aON80yhPVAb+alOCmQLcxAycEeSCSGy7tf1rEi2tMKE
 22ZjBeF+gUWnrgLSK/vcBrRaHELLDMmckthRwWEblDhHtbrkd4FQWfLUGC5URBphGctw
 OZaHqqdRX2K8DVerneaT8mNja+PV0deGmbX40nJQ0vfMwBO43A+s5FGyKun5fFG1NKn2
 IBHY9Ezq7qM7KPDkaCqWwbEZDPrTDuIkMdcZGTFbyaaybusQAsaC9zeJKhML8E4MtRVh
 Pt/FzuMO9l4dh5zX761KE4Tt6tkyN73zjccAfzS5Bq/oW7Ry39gja0vkCzOzhUbQwA3N
 EM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683055180; x=1685647180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7usn756S/TuIOQBrdWdBXYCsofXslEW4cXCpMHZzuEo=;
 b=afuknBJHeimpEI4BAqIwKfq4S8OjGfv94RWSzvnD8dvHsIACKdfrgqPhJs7vbtlMfT
 SiO4IOxyQ56P0m/Opms/yNbDX9nssnG5QQtaA481pIs5p8D3Z0Jp0e/GUTcvyAa4Jw1b
 3dPCaSM/BFP38aTaANEBQXvoxQ8fsqoGnVTq6Nicgv8Cjk2dWzwioSqNHDmgcLdpAR6K
 lQ/h5azuRoNm/vZdOS3rRczjI6ag5owoX+wi2r/nqXeC4dmu63d1QlvEs/BbEOi6ydn+
 zS+GRcfC92JbqcRXbOPWhSzUg8vSsiBK/udEIhVGCbRl/i+4DGiSSUBl7p4inHzOKjDc
 k6Aw==
X-Gm-Message-State: AC+VfDy6ydRWwGPCb8kG3/6XW501M731uCtUN1qpJRYRBdHYVdNzEm7K
 fV+bZwnogeicH7OmFXHe2Vk3pw==
X-Google-Smtp-Source: ACHHUZ4YDT8nSReAWxIC01gs0IFYG9vvNCyXed1HSJRNNmUdGuGdKFApTw0xYyNr3LE/5auzecLw2A==
X-Received: by 2002:a7b:c8cb:0:b0:3f1:6ec5:bc6e with SMTP id
 f11-20020a7bc8cb000000b003f16ec5bc6emr14407890wml.3.1683055180420; 
 Tue, 02 May 2023 12:19:40 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a1c7c18000000b003f183127434sm36428174wmc.30.2023.05.02.12.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 12:19:39 -0700 (PDT)
Message-ID: <abc64290-89f3-bde3-de68-3b620e6a3c6f@linaro.org>
Date: Tue, 2 May 2023 20:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 00/57] tcg: Improve atomicity support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name,
 jiaxun.yang@flygoat.com, philmd@linaro.org
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
 <CAFEAcA-R5uNg19c7VfvJ5bzZWLhkcUUwmucHwe8ZeJYMQ-vCeg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-R5uNg19c7VfvJ5bzZWLhkcUUwmucHwe8ZeJYMQ-vCeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 17:11, Peter Maydell wrote:
> On Tue, 25 Apr 2023 at 20:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> v1: https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/
>> v2: https://lore.kernel.org/qemu-devel/20230216025739.1211680-1-richard.henderson@linaro.org/
>>
>> Based-on: 20230424054105.1579315-1-richard.henderson@linaro.org
>> ("[PATCH v3 00/57] tcg: Simplify calls to load/store helpers")
>>
>> The main objective here is to support Arm FEAT_LSE2, which says that any
>> single memory access that does not cross a 16-byte boundary is atomic.
>> This is the MO_ATOM_WITHIN16 control.
>>
>> While I'm touching all of this, a secondary objective is to handle the
>> atomicity of the IBM machines.  Both Power and s390x treat misaligned
>> accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
>> access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
>> ptr % 4 == 2 will appear as four 3-byte accesses.
> 
> I hope you mean "four 2-byte accesses", although I'm never
> quite sure how odd s390x can get :-)

Heh.  Yes, of course.


r~


