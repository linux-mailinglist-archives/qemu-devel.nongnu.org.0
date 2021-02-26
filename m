Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C8325C70
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:15:56 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUXj-0005w1-Qr
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFU5u-0002Rg-Gg
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:47:10 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFU5s-00052M-P2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:47:10 -0500
Received: by mail-pf1-x42b.google.com with SMTP id j24so5362877pfi.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zL6A1FmIXE6QIsQRUkZrOfpSAns82Mq9zs7OFKgkwTg=;
 b=ef23qUIgmzIEte4YivydEmwYP+R5ixGRB/z8t9D4jlGYlNsM1FU4iEqon8RBH3Md9e
 oyoRXmZEHgnqa1Xze43yIZnW+380KNX9Yx2ydz2sGdiAoBrzhUmI0RskVVTG4acxLTiQ
 +bd29/zvBELN85dQnQDzqM7tI89Ht0JUHhks/V73Yr5tZy122VsMqFQd8hrMNcTOiqy8
 JKwSQ7dK3FO1LMGneJJ6S2rBNJC7eFciRmISmAmZsrcMKLaktaqRXZDYaJdGLqCufiWG
 9UO8HhyoGnUHw6HYTmAIKVWE3tFfIB07lymE8C5nGKEfSDJFLZo2aT/dUWgmqbqyMnkS
 MBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zL6A1FmIXE6QIsQRUkZrOfpSAns82Mq9zs7OFKgkwTg=;
 b=EUIWeantLpnGlkU8O6gObXTj0TVuN8YF+9pbLP2R1G+g3UeISEz3gGBjSeJmQCAxmO
 I0aBTuDGJV7/p8Zthajbw/g1t62uJEsC17uUxyWLJGlqSNcHs4tKrvM7wirKMBCyNrEK
 OXZkvW8NxC499MDU1wRXBQM1KGeAQOpNatN4QzoKsSDbRdUVR8bpPScMhRLpCIONHie7
 o0NpnY1L8LsWMaSvbaiBSxPDNJruKM3fVEg8J3hrEx8FZ/7Oxvy67rdzcGn19Z1B2oPe
 lKCjijRz5k9e6b3kDt8+MFbTN+4s/VbZcx3bKFN39pBcA3sBNGsOU2Wet0WZlGLLDA1Y
 eFnw==
X-Gm-Message-State: AOAM531r/89zGtQemTn+9yQIdDCjkGJstpGIt7tf3anWxpf8KBqG8rqG
 WWxt2hY56hyLEEbaqYFNY8b/cw==
X-Google-Smtp-Source: ABdhPJxLWuxl0c8BoVHbdEXWJaDWVD2XiTgyL/EQo4BEiFi1G7zd6x3fopjDCUxn4IJf83FqPt/6oQ==
X-Received: by 2002:a62:1608:0:b029:1ee:2afc:26aa with SMTP id
 8-20020a6216080000b02901ee2afc26aamr1151798pfw.40.1614311227019; 
 Thu, 25 Feb 2021 19:47:07 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id m18sm7883292pfd.206.2021.02.25.19.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 19:47:06 -0800 (PST)
Subject: Re: [PATCH v2 09/10] target/hexagon: call idef-parser functions
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-10-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87605056-2b5f-842f-1cf5-e0d205584f1b@linaro.org>
Date: Thu, 25 Feb 2021 19:47:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-10-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> +            elif hex_common.is_new_val(regtype, regid, tag):
> +                declared.append("%s%sN" % (regtype,regid))
> +            else:
> +                print("Bad register parse: ",regtype,regid,toss,numregs)

print, but nothing to force exit-with-failure, now or at a later date.  Just
raise a python exception?

Otherwise looks fine.


r~

