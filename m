Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE3539BBEE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:32:04 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBnn-0005A6-7i
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpBmO-0004IM-Aa
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:30:36 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpBmL-0000IK-UX
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:30:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g6so7713634pfq.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MlQHIkrSsZTfMQrTOGYSsZhtBxIQwpD9disawoMbEGM=;
 b=fUHunAxO3cPB2WUnVSs1sqxAI/xxmwBRgbkQlFtRnw4zNl9thJohoLfnx5nXdQszSc
 xPjDmMAvR02KSN6rijRDZIQyMfyUttIR5SAhO+7S9K5NHua8dmvG8MCl0MopvV2CQidj
 3MXWjQPyufln1qRQezZdqaxbZD0BZu1JUVhU8Eb3QqU4vN1R7yy3gTTD1c4g/W5CpDzQ
 rJ9LJ+jGg8h8wcvPa1+Ft3kgPLeVQ1n0NWAJ6jMqwRqO2D9Rv0wQcqL/teUspQ9eHkKW
 HxIjQX150ABBt8Q1GSEqMckH6t1J4z39L83kpKf108JzoqZD5xCtUU6JZzegbtywUqux
 /F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlQHIkrSsZTfMQrTOGYSsZhtBxIQwpD9disawoMbEGM=;
 b=jVWoQyl4ALpiRg4ZIescRU5ESeuuiLsUcRVJcno0C/4lnxvvLOyaMQd8vFX67XBKLZ
 g9nGcyW1gFJcT+KPZl+aa816dV8AoiqGIASlh1+nhtkEe/FTscuPp8qVfyDSoVK1cyPy
 cdd59wi6T+1ikoXqOXdCK+BjiPUbeiRypgCgoSO4WVjEV9njCPJ8+xBiDGd1UhrxkJFS
 8hImrG29OP/sa2CyIwlKyrmcYYNrSERf8I4ke94RuHYPPTJcaJnapDcQUa0ZlsEffjDR
 xAjoRlJA01blEYDDvQXEqtytaw0rGS+NNU2SoYCElUSzQ0VU9feKkLlkhKvGlj+bAvBI
 UpUA==
X-Gm-Message-State: AOAM532bDQwZxdTy/+6syDCT0JalFI9YVzfchnSwcI5WSAj/pB6rJp+c
 GhQ1YIHzDOyvVZv77mLqqgieZA==
X-Google-Smtp-Source: ABdhPJwviorhjXDEfExuZGjxSsyD31v39mp8Hc5JEnTHSQjgDeJRtYIkylly+QfccBGvAFj/IwXgVQ==
X-Received: by 2002:a62:cf45:0:b029:2ea:c56c:7b3e with SMTP id
 b66-20020a62cf450000b02902eac56c7b3emr727658pfg.40.1622820632201; 
 Fri, 04 Jun 2021 08:30:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x23sm5043945pje.52.2021.06.04.08.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 08:30:31 -0700 (PDT)
Subject: Re: [PATCH] linux-user/elfload: Implement ELF_HWCAP for RISC-V
To: Kito Cheng <kito.cheng@sifive.com>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com
References: <20210604063304.48501-1-kito.cheng@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8644f703-2d57-0698-01e3-bdd006d614ee@linaro.org>
Date: Fri, 4 Jun 2021 08:30:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604063304.48501-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 11:33 PM, Kito Cheng wrote:
> RISC-V define the hwcap as same as content of misa, but it only take lower
> 26-bits.

As far as I can see linux only passes IMAFDC, not all 26 bits.


r~

