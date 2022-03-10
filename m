Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9254D50F6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:54:30 +0100 (CET)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMzd-0003R0-Ni
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:54:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSMxg-0002Op-3j
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:52:28 -0500
Received: from [2607:f8b0:4864:20::42f] (port=41719
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSMxe-0000M5-Aj
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:52:27 -0500
Received: by mail-pf1-x42f.google.com with SMTP id p8so5751690pfh.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kKWHX1aQvKJg/6PiFGoGBJIAW3L0iHcnzUS+SYsQaO0=;
 b=hhln+ERFoRBHECAqlmItbH6a497Wd8Y/sDTZWbtxkI8CT1kJaTvVIFXUNakJzQgNzm
 OPiZjNYZPxDUsXrR5CLb29FrD0IooIsJuTztcZSPAF7HxQVQngLsM0OGeaJ+MiO8Jx0Q
 Y5zPuYLK+3RFVNSsqJDYiLmof76hnOKc209gF8HH+2WfTg4S8h3WuUIqxeedvhDJGw7C
 Xel4nWiSzgqpdIjaLeSSesKWAXhLI0t9gVRDLjympZolfzz2RUlRVIKkU1kYdLRUu9Bq
 yI4ttoBZthFmTrZ/05yMaDsatXQ1bi4hwSsLLwOJuygjZpfFeEwQpxv2DqVBufCtHUHf
 J46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kKWHX1aQvKJg/6PiFGoGBJIAW3L0iHcnzUS+SYsQaO0=;
 b=Ba6qQ1uNfKK4vuBUwjHXTg0xLYxS/QXyDnreRJHUVxPrfm0106rr3AE9JjyYzmJ4Q5
 LHwCvH5e/ryZIuYNYMpMBzSQqHh6TUE5Zo59umkrBvsezf+HJjELRZX9Lqkdx1VtCVj9
 q7dyE+txdsCDRZKHQdcj6W7zPBpb13/m1wBrmcBjqnXDTIqL8mY0HLon2CvNKtYEZ8RG
 1EXJEvxhbxpI4H/sxC2SdqaLzbUeBWA87HaO5eUQLhVOThGgoCvh4ZTryv2xbwlnuFhU
 acxcdA/J8BRJYLj2PkzsTEzXR7rMB1ow3iEllp+VSTTbxpHMnFwdDXPjCeCcDgur+j7y
 5v+w==
X-Gm-Message-State: AOAM532FxboE6m8+w7heg4NmdulM9h54gPdDJSI6bQXyhmnBJh4hTHGU
 sVmoUgU2dlHTN922uG9WFA6cgA==
X-Google-Smtp-Source: ABdhPJz/r9OgoG8T5ScqeCZ75q0fbdxwC3XvSLR1NzfBF/xPyg847rjps82ELXTuoCktpsGY3ImUDg==
X-Received: by 2002:a05:6a00:1894:b0:4f7:4514:8710 with SMTP id
 x20-20020a056a00189400b004f745148710mr5904261pfh.28.1646934744796; 
 Thu, 10 Mar 2022 09:52:24 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a056a000c8200b004f7203ae8dasm7957564pfv.29.2022.03.10.09.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 09:52:24 -0800 (PST)
Message-ID: <9440dd22-cd9c-7bb5-4eae-3b5499c31309@linaro.org>
Date: Thu, 10 Mar 2022 09:52:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 14/48] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-15-richard.henderson@linaro.org>
 <CAFEAcA9ruD4OFW+S0_4kjXFQ8zgenui5=uOpygnjsH=dm=eCPA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9ruD4OFW+S0_4kjXFQ8zgenui5=uOpygnjsH=dm=eCPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 04:26, Peter Maydell wrote:
>> +FIELD(CR_EXCEPTION, CAUSE, 2, 5)
>> +FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
>> +
> 
> Is this definitely the right bit for ECCFTL? The copy of
> the manual I have has "ECCFTL" as an extra bit to the left of
> bit 31 (!). I'm guessing that's a docs formatting error, though...

I assumed the same thing, obviously.  I could perhaps have left this out, since it seems 
unlikely that anyone will care about the ECC feature with qemu...


r~

