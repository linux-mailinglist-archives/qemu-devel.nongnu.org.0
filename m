Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3056FC8F8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:27:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOJZ-0003Q4-Q7; Tue, 09 May 2023 10:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOJX-0003Ha-92
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:27:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOJT-0005bM-3R
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:27:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso59685115e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642452; x=1686234452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDw842N9IVAzvk5WKvAz0t27656eTx36pLXrPoti6vI=;
 b=r9820mfHh+U5PuapOy8GaZ3lAAIP+Q4Ms2U9isosentJcF5qAhSE+jMaSDz5RbDEsK
 8bn04eHb4B7anRwaqSht96YBwMFJuYbj9Jo21lnEsbLowen1r10JIzRbQWpMGVb/qpQB
 Tk0GWJgdTkGwGFIpmTwFDHoPb9pm4J1Qx0+spNlQFqhbAoVu9bAQBr11gg/LRX+7b/Hw
 3ikp+2vUQGIRti2L98hJLxnEpXaXsSnHfg+UgbV8Tg5n9TOHp/4TcwziWXDQMqBmA0eO
 xN9/HGYjfn6ILO/nagQjid0sZD6ZK9JH8Cv+cWadihYSFZu2tvoyNLwJI3FnvEqODeld
 HPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642452; x=1686234452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDw842N9IVAzvk5WKvAz0t27656eTx36pLXrPoti6vI=;
 b=YNhwXJS8qeEiUFbWllRnF370ljpxTYNqTeaEF38k7mu6Z36KUl3i1BPywaKXEJhKRo
 Xs87CXs7q8ROZa72hyXYjQWSJxlSZsLToRmWQHsPVTToDkUOCdVKRdeB3BjI41fcgPY3
 6QXa+MsSiHBARkE+budtDPN8LSxioz2MdNCJt/fov0gIUb+ORQF6d28dSC8J9IWGlxCX
 kTnZgvnk2g0SjVf9Z3dyvSREdEYVyweVYHOvac5sofHzeDfmMCZtvZ+bX/GOG1Rx6+Ap
 XUCsNulaD4dzKcvlhe+uI3dqTigMenI/k6Sjc1tt17KUHckd4qIqBjxXCggUeDcFD11t
 7bUw==
X-Gm-Message-State: AC+VfDxZ0ePne+dv94ZV6WMzRsAlrrKDamqj4Wkx3jJ+Ed8Vy5Ceq07z
 mIX434XUmkiJzjt5EJLaCy1isg==
X-Google-Smtp-Source: ACHHUZ797yAlaUnBpbNovTMI6Aqo/5pgzJOrwspnErR74LVYVmpkmwwMDOA7b8pkoGUcNtoy10SWVg==
X-Received: by 2002:a7b:cd89:0:b0:3f4:2610:5cc7 with SMTP id
 y9-20020a7bcd89000000b003f426105cc7mr4271874wmj.9.1683642452046; 
 Tue, 09 May 2023 07:27:32 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b003f4283f5c1bsm3570673wms.2.2023.05.09.07.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:27:31 -0700 (PDT)
Message-ID: <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
Date: Tue, 9 May 2023 15:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
 <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/9/23 13:04, Peter Maydell wrote:
>> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
>> (separately) atomic, and we return MO_64.
> 
> So there's an implicit "at most 2 atomic sub-operations
> inside a WITHIN16 load" restriction? i.e. you can't
> use WITHIN16 to say "do this 8 byte load atomically but
> if it's not in a 16-byte region do it with 4 2-byte loads",
> even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
> would describe that ?

Correct on both counts.  While you're right that this is a valid generalization, it's not 
something for which I've found a use case.


r~

