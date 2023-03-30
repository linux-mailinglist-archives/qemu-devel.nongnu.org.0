Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1486D0815
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:22:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pht9W-0007YP-EA; Thu, 30 Mar 2023 10:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pht9L-0007Wp-8N
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:21:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pht9G-0002Wt-9Z
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:21:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id e18so19266502wra.9
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680186064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PY6GgfCIY0lka5OceEwru+P5DU/Fybz2QqaOhdCYWBY=;
 b=miHMgR11Y4uLLUTBsb/8P3pKzgSOjPKP+hfwABEcD08C3SmUK8QJIo3o30rmTQAGKK
 dhHuFJBVpopp+T6gnaJmUFyMIdITtTh73Yy/o7mIQU7RF4wB7hqqORm+oLStJTJKqiQs
 0zUjo3FWNGEg1sOTt9J5qaGAO9AIFUHlYKr2G2j0fZWTObr8NN5SJ699zAND+5opx8mO
 Q4/pIdvd4cVHIL5PS21rLEFJI1cvgesPkXHlk9nGePjkH1jw+tBTV/y1ynTjTxY4DLE0
 vIKtX8LqJ5mamNK4XbwiF/RSCFdZFyV5T+YRR9Aqy1PCPGJv7shMJR3e5b1m4g24t0Yk
 xuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PY6GgfCIY0lka5OceEwru+P5DU/Fybz2QqaOhdCYWBY=;
 b=g9FAvBeJCCa7oEOdLLYs+MJ7h41E06+lbb4t2ZYGZt18jeqs9PSPOmj8NszO0MtXFe
 I9E6iPUDqmWD9IK/+vyw4R+TH9CIdKTtM11/cMT2/IY3qhGIhROQq4bnxienuo16ELgz
 7zGGVhQIZAzzYJA8Hw/RiOYDQ2KXWXKSbmX1vNIXmBTTGYhQMEzgT/OuPeeQ6LJ8ohwY
 NRsrQBBqFtLueCI2K7k/RjIL40T4lRfEgLDdRRKmsFlwO4eKd7UOJyfQKy3wNecq2LZ3
 cpQ/w1LrPYw3g6s3nRLwAV0Efdg4R988UnwW7O19EGTNRlB61AsKNUG0xYrhfxc5ywuU
 LN4A==
X-Gm-Message-State: AAQBX9dtBzq5T61QdLpYtvXzfOH25zU4vkcMo5ZgNL0EyY+MLyi/JOH9
 lE9Tijo1JCcK7oGU9YzqvNeymDjD4Z8NSNb+cAI=
X-Google-Smtp-Source: AKy350Y3VgMmG76n5w/Y6mCh7t3btD1gIgt2ZqNsNNIRT2EgXQP9Vb6YPSq42owdgqnNSN7/x14S5Q==
X-Received: by 2002:a5d:4688:0:b0:2c8:b9cb:885e with SMTP id
 u8-20020a5d4688000000b002c8b9cb885emr17533141wrq.24.1680186064030; 
 Thu, 30 Mar 2023 07:21:04 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y21-20020a7bcd95000000b003edc11c2ecbsm6125997wmj.4.2023.03.30.07.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:21:03 -0700 (PDT)
Message-ID: <03d01d52-0f6a-efb8-7ee3-6368140c743d@linaro.org>
Date: Thu, 30 Mar 2023 16:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] linux-user/mips: Use P5600 as default CPU to run
 NaN2008 ELF binaries
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: YunQiang Su <yunqiang.su@cipunited.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jue Wang
 <jue.wang@oss.cipunited.com>, Laurent Vivier <laurent@vivier.eu>
References: <20230327162444.388-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230327162444.388-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/3/23 18:24, Philippe Mathieu-Daudé wrote:
> Per the release 6.06 revision history:
> 
>   5.03 August 21, 2013
> 
>   • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
>     Descriptions” were optional in release 3 and could be R/W,
>     but as of release 5 are required, read-only, and preset by
>     hardware.
> 
> The P5600 core implements the release 5, and has the ABS2008
> and NAN2008 bits set in CP1_fcr31. Therefore it is able to run
> ELF binaries compiled with EF_MIPS_NAN2008, such the CIP United
> Debian NaN2008 distribution:
> http://repo.oss.cipunited.com/mipsel-nan2008/README.txt
> 
> In order to run such compiled binaries, select by default the
> P5600 core when the ELF 'MIPS_NAN2008' flag is set.
> 
> Reported-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/mips/target_elf.h | 3 +++
>   1 file changed, 3 insertions(+)

Patch queued.


