Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7A312675
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 18:41:08 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8o3W-0001xP-RT
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 12:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8o1t-0001RG-LO
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 12:39:25 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8o1q-0000gI-68
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 12:39:24 -0500
Received: by mail-pf1-x42b.google.com with SMTP id w18so8218970pfu.9
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 09:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YXWzvZITx/cPkYXYKIbwss5wwpCQtj3hYmvvQRzGmeM=;
 b=Im+oKDeoZciWtP6/Mq3lMQqLNnWODrJnzEgX5I1bhCVgAkGb/Ehb/urndazgNrfz3i
 pgUqbkCjkCsHMvxeS2zhG2eJ5PiIkvCvFolYdtIyYRiBxjqGQscxU/jG4Dx9tNZK6GSx
 eERrPBYvCItt6sH6nU2BwDCCE9e2LaYaWI91+x7fmgr6IJNdaAn65zRFIVQITA0bLjO6
 7Ege0lBT2RSnxEv5LKrtfGPkQYuOllp+Jp4/VCOaye0eW9Mrl2m4Gb6Cc9Qlo2KqTYPO
 2aTUQkZq3LQwGPHbOktNh2c3HfvWeEZufndEwSWuOW3k/ZKBslid3JW89UNs3Xkwj6at
 SvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YXWzvZITx/cPkYXYKIbwss5wwpCQtj3hYmvvQRzGmeM=;
 b=bmOO7QQjyZN4HbfnzSjGzCNIpGqHfqjcKE7Mm1Wcy/znJ9/Oc2jWd/jW0xoWJEYmnl
 gNtjaL6WjDb296p+790z7UyRiiu8A4Q7kcT8EuqwySk/Qe14qvimatwbDiPfI/SbRpEt
 /8LpT831vWeSmYVGm4y3OKh4cgVUKAog/KU5UQyjdRGHLNUtFkdgUSDQjA5mkwY+Iiyt
 SFEJWvfz9m/D83hxVYEBT28/ai5SultdYciuUNVnpqPzL+s7qWgJM/l2qUU18nxkizOY
 qOQV+ueh9+nYCTv18Dr+pDG2+uMg5d6AHm8JPOJrcFENzcJvmEqdvbiubXeWSgK36ywk
 K9og==
X-Gm-Message-State: AOAM531YavGRDALU11A7JVkllzLupXd/Il30ixHwBb1+YPrZ0O3hzPqC
 6nIvGZAiaLp6rFAkTcPeZs88oRwhmikEZg==
X-Google-Smtp-Source: ABdhPJxQ5HNzp0dXDtaKhL//jepjLY7EDzvuJP5ehGx+0YvjbFPvVuRfrnwGKaZ33y6lxu6/dwF1Ng==
X-Received: by 2002:a63:1f45:: with SMTP id q5mr13602449pgm.414.1612719560297; 
 Sun, 07 Feb 2021 09:39:20 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 h15sm12731015pfo.193.2021.02.07.09.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 09:39:19 -0800 (PST)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
Date: Sun, 7 Feb 2021 09:39:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 2/7/21 8:25 AM, Stefan Weil wrote:
>> +#include "qemu-common.h"
>> +#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
>> +#include "exec/cpu_ldst.h"
>> +#include "tcg/tcg-op.h"
>> +#include "qemu/compiler.h"
>> +#include <ffi.h>
>> +
> 
> 
> ffi.h is not found on macOS with Homebrew.
> 
> This can be fixed by using pkg-config to find the right compiler (and maybe
> also linker) flags:
> 
> % pkg-config --cflags libffi
> -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
> % pkg-config --libs libffi
> -lffi


Which is exactly what I do in the previous patch:


> +++ b/meson.build
> @@ -1901,7 +1901,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'tcg/tcg-op.c',
>    'tcg/tcg.c',
>  ))
> -specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
> +
> +if get_option('tcg_interpreter')
> +  libffi = dependency('libffi', version: '>=3.0',
> +                      static: enable_static, method: 'pkg-config',
> +                      required: true)
> +  specific_ss.add(libffi)
> +  specific_ss.add(files('tcg/tci.c'))
> +endif

Did you need a PKG_CONFIG_LIBDIR set for homebrew?


r~

