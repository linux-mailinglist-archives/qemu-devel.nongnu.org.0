Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00466A7F2
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 02:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGUzh-0003kU-NH; Fri, 13 Jan 2023 20:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGUzg-0003k0-41
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 20:06:00 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGUze-0002Ha-J1
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 20:05:59 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso28672257pjt.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 17:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNKXqhNb4uqDL8kIUxX3XdwmCx2sJsOVEn1NBQHhQNw=;
 b=gSglRhm6VZXZwNbNbLKr1ZiPlVctj63kCtxgu6r/svIrUF83LAJEaH+sujGf7uceSw
 EEjXnevCMniBihrX03I3M81NUe0mLRXy5zOhXU2jpZnye8RJ6ra4q0ZOX1p+1aOcm1oo
 QUdIkpE4M8YcnQymhKOcUZ+Ln5lm0BtuVWZBeA+F7p5kWoLUAxcKEDvXv366BPHCQsd+
 VtZpzMXWTFoba579HvPZTCIysHUa+DpLPybigS2OGiHebWm27QNFlMmUs3pVMzN66pMm
 5UfxjSSUAGGdiOCUJJzr5yJpIx68KF0R/6zjWjHKWb3pZLoiDH1mkX6hidPG8zmX4Y2d
 S1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNKXqhNb4uqDL8kIUxX3XdwmCx2sJsOVEn1NBQHhQNw=;
 b=V4E1ig4STTH1qp5endsNqw6UZTK6yZZ5RVTQk5k49ydfGtqF4QJX0PIZ2J7My3juzl
 0YQbDsFbOt1ngiJ7OFVrdmiZJExQz/t3Tt8DsWDdzTPdeH0gsaFXQbIfJvOmmkyCvIop
 wdXcv7W348axc/k/8vaqVYkkAXRgjJC7szg66+rJo3a1/vX7MkOgy3av5yDvDeoO95Nn
 PV0pflI10OE3iI/fWbuX+5pA8DZdv18GSuPYWKN4FVESyOBFNJHPU/rLEhV2TviqApHt
 bhHl76fpxeUJ1r1SSEf1GDbiiTdU5V6+cfErKK8LRE0ux5xsUslqVlni5U/Vtwo+vfB/
 6ADQ==
X-Gm-Message-State: AFqh2kr7qFpUidPp2Ofl+o2UgMkj/SeA7uwLSqQQU2lPR47X16QdTyL5
 iPIIQo3LQDeGGsYglB2KPz0P/g==
X-Google-Smtp-Source: AMrXdXvGJ0ITd3DOW5/dxlfuBiruU4xwO/lytjO6gR+NjvbGE+8gC6Aylw/DTI1sxVZId52ZU7osgg==
X-Received: by 2002:a17:90a:7503:b0:228:d614:3b79 with SMTP id
 q3-20020a17090a750300b00228d6143b79mr14373026pjk.15.1673658356393; 
 Fri, 13 Jan 2023 17:05:56 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 nk6-20020a17090b194600b00223f0592e81sm1541356pjb.4.2023.01.13.17.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 17:05:55 -0800 (PST)
Message-ID: <555f828e-52b4-0ce3-c1b0-33489a6e7dc1@linaro.org>
Date: Fri, 13 Jan 2023 15:05:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/3] tcg: add perfmap and jitdump
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230112152013.125680-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230112152013.125680-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 1/12/23 07:20, Ilya Leoshkevich wrote:
> v3 -> v4:
> * s/unsigned long long/uint64_t/g (Richard).
> * Fix address resolution with TARGET_TB_PCREL again.
>    * Open question: do we need something like get_pc_from_opc()?
>      See FIXME in patch 3.

Looks good.  I'll queue this to tcg-next.

Ideally, we'd update the dockerfiles so that libdw is present during CI, mostly ensuring 
that the code builds everywhere.  However, my attempts to do so failed.  I suspect that 
we'd need some sort of update to lcitool to make that happen.

Alex or Thomas, any ideas there?


r~

