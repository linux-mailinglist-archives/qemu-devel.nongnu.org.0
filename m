Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B849D3F0E47
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:38:25 +0200 (CEST)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGUCW-0002bj-QX
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU9N-0007c5-Ss
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:35:09 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU9M-0001tb-IY
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:35:09 -0400
Received: by mail-pg1-x530.google.com with SMTP id y23so3876176pgi.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EXH9m0GLfDNI4MdASdhnOXSJRpOKlmUgQZrWuf5mfcw=;
 b=pflTJPMqhNEKdAJdUCylztACOo59vlGkGRXOFOs2O/0ya3FvuIM7p3juFvSsJB9SzX
 e2cGaP277qEpLQToC4M0CXF+YREEMWbkgpH/IFvA15DuxMSfBldwSYq2yabAD0nk54Ae
 ew9MUUPyhbqwhXgVwQRhUPn2/zVv03bLdl98CgKWdzrkF5qKhEnRbRUkJh3UCykjdbEX
 ZR7MsVOLAkb2UnXzPCJtgkfxEfpFmLoL/tg1TKgcKC9Ys6bHe401SZAUOFZ4/a6DwkL/
 rRSyQS/WT2cc0b/9RpVghRJlIWysfYGMLtbXrnHWZoGsVEkjueALQ6UAXailq7Vw65N3
 xl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXH9m0GLfDNI4MdASdhnOXSJRpOKlmUgQZrWuf5mfcw=;
 b=cneh5I2Q6tTa6TUk0bROztLbCsplCT6D3LGJVDoe+Tz1MGCYcX57rmgyeM3kV/RTEP
 2653md3rqVRJHf4CwlBPfU5iOZVTFXOW4yuOTc3bBENlflbRhsDahYq5SMZ4mIkt2fr+
 qZVDakfnxGFBUXKFWlwzx1Iy6ofIVFtPRcrgBICZ5CCa47qWHXnFbPXJtextjZtU9oq7
 pAWvV95q1PbRGlRXHxo4afMzk+oxMlmlIDMG4QmRJP7JNHcEZJ5Gq2LsNJeqTGLB6COF
 OnhadCicoA0KyMZMljOaU7vcsRMNcKqmVe7P6Gef+p+ln9g2DAhLn82dTcGg0BlkAclR
 VzzA==
X-Gm-Message-State: AOAM533BF0q1VMCucgt2JIUVMEFSbh8hiwGdJ9jlvDsgWEb9nRHDtb59
 GuPVKIEnS0aukTol+lUE7EOb2w==
X-Google-Smtp-Source: ABdhPJzjRyEcicJNd1ybV4u7lxoxpUTT1ZdO8Axt74x4iGa6fkmsVTeUMKc0ZgKpkOXyShXZ50/GxQ==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr10917632pgm.226.1629326107166; 
 Wed, 18 Aug 2021 15:35:07 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id d13sm794775pfn.136.2021.08.18.15.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:35:06 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] target/mips: Replace GET_LMASK() macro by
 get_lmask(32) function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818215517.2560994-1-f4bug@amsat.org>
 <20210818215517.2560994-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0046ef4f-a19a-7e6d-0b6a-ab135bb40275@linaro.org>
Date: Wed, 18 Aug 2021 12:35:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818215517.2560994-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> The target endianess information is stored in the BigEndian
> bit of the Config0 register in CP0.
> 
> Replace the GET_LMASK() macro by an inlined get_lmask() function,
> passing CPUMIPSState and the word size as argument.
> 
> We can remove one use of the TARGET_WORDS_BIGENDIAN definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/ldst_helper.c | 32 +++++++++++++++++++++-----------
>   1 file changed, 21 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

