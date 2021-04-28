Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63C36DCB0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmkl-0007dN-6Y
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbmCZ-0002eG-SH
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:34:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbmCX-0000rv-H6
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:34:11 -0400
Received: by mail-pf1-x430.google.com with SMTP id e15so7206826pfv.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/J0IW8P9vEV2Z37yQrgJjI41QgkAJfufdXlBjdgpZ4I=;
 b=CnygDZUmkopfTxyrX/UREBagEJc34FH22BNyldc/L4hEeEsn8T8gw3Lky1Z3Gpiu8I
 FuvteXG+qDmt/XbJxUoOCaLTUGKe/GuXOgWuV21iAFWWaqvp+DYzIeYYssRgkkfi5EkD
 DHYRgdWoAaRmaFnobzqV70Q7AoinfFcJZVmfYomvK047+05G1yfetL4QKv3Yb4NclBSv
 cLpoLjXcxQRDZzOHiO2z7aQuzHMg+ZKN50fOMQozv8KHl0/LGN4VBXG97hIgVl7FCh8b
 X6MXS4WC9RjAyiKMf8Y4BE5JRuQpAeZ+8b08d2iY3f1ieSwRAgbR5C9/QyHO0Pg98CUM
 7xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/J0IW8P9vEV2Z37yQrgJjI41QgkAJfufdXlBjdgpZ4I=;
 b=a43LJu2bSw6Mq9uAyp+fisj/dl6cm4JOdBApvex1XyyO1XR7BE2KabZoKZQ8rPO7av
 A6B5zZx0CW45GJ48ft/ZecAm9LZeE5y/Kqbgwp3uV7t0PUxVTWXs+j/MgZThc+Me98le
 S0VeHmdvzddTb/MHx0OLwWjIuYc/Na2F/417wVbhitkya8mgF5LrtyrGVku+q06k6cRR
 5Em6dzfo3Z18Ui89OzC5QQAnk/yI/Gg95EPJMzd0PkLxFotKid/bZUwimFABfVyeq1uZ
 RjtrnDjJPwFLZueXvDnSmE9N+khYEHOWIjELSz8lTuIdjsvF5j8/Emv9hgUdU1HBHV02
 ABvw==
X-Gm-Message-State: AOAM533q/xSRRshmO9O+Qd26wKDHFqAbogl+cRHNriVIFq2kTGxaYXr8
 B7jkPb0abuhizVKFdO7VGatU4w==
X-Google-Smtp-Source: ABdhPJxNvleArfZZfEVL2IyuymNSq0vOXWcvTvJ6V7HbKPn6ksLVaCM6TV61KdYH8CYHUuvtx3sYwg==
X-Received: by 2002:a62:dd41:0:b029:24c:27a4:48f1 with SMTP id
 w62-20020a62dd410000b029024c27a448f1mr28346758pff.42.1619624047778; 
 Wed, 28 Apr 2021 08:34:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q8sm105650pfk.137.2021.04.28.08.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 08:34:07 -0700 (PDT)
Subject: Re: [PATCH v2 11/15] target/ppc: Move D/DS/X-form integer loads to
 decodetree
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-12-luis.pires@eldorado.org.br>
 <756a8039-02a8-2cfd-a7ad-d73df9d50438@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcc18978-8145-d388-1753-64d82b36d001@linaro.org>
Date: Wed, 28 Apr 2021 08:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <756a8039-02a8-2cfd-a7ad-d73df9d50438@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, f4bug@amsat.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 6:31 AM, Matheus K. Ferst wrote:
> This is a bit problematic, the instruction form isn't enough to decide its
> fields. Eg. setb is X-form, but the fields are rt:5 bfa:3, setbc is also X-form
> and the fields are rt:5 ba:5. In fact, for the X-form, there is a whole page of
> field designations in PowerISA v3.1.
> 
> I would break this into three cases:
>   - Some forms have single field designations. Eg. B, XLS, XX4;
>   - Others have multiple designations but are just alternative names for the
>     fields. Eg. DQ, DS, M;
>   - And there are forms with multiple designations, with a variable number of
>     fields that may overlap each other. Eg. X, XFX, XX2.
> 
> The first is a non-issue, just use the form name as done here. The second seems
> tractable, we could pick one field name for each part of the insn and still use
> the form name as the identifier for args_def/fmt_def. The last case will likely
> require multiple fmt_defs for each form, in which case we would need to come up
> with a pattern to name them.

Yep.

> 
> Looking at what Binutils did when they added Power10 support, it seems that the
> insn form is just a hint for opcode positions, and fields are specified for each
> insn. The sad part of this kind of approach is that it would leave us with, eg.
> arg_LBZX and arg_LBZUX instead of a single arg_X, making it harder to put
> multiple insns under the same implementation.

You'll just make up names for those that are used by more than one instruction. 
  E.g. X, X_rc, X_l, X_wc_pl, etc.


r~

