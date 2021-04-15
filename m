Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8219360BED
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:36:03 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX36A-0006iI-QQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lX34I-0005he-Rw
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:34:06 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lX346-0006GL-4H
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:34:06 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y2so12163901plg.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iFHVJBO+ry13+wBzkm6FPAuC4sj/uHPx5HzixSFny3I=;
 b=myfndaSBzFmOB5cVXwXrpaAN6duWCgNo7VWQfVZ39rd12QGZmYdWgwTbT83oXltPtM
 b4z/xCoBlrx8Eqng3myFRKUA38Adq02LLF9IG4S+FY1nL3CzwegWOMekpE4ZXNCG0D/g
 jtCXQXOKJpvHQ//WrUplvZPLk2Pe+BF+wSj1vspqaZG8iSSFaE1QyWA7l2ZYaImN0xbW
 C3CWAhdNZYtVfNE090EeHUedt+dCx8rvVyiHz8CtHRXkANLg6nJtJbRk1pV4u0zXNNnC
 c5bUai4nF9bRMMZAGh9KZLa0DjvJqY1N9GqNb6D6MU/UGwDQncZbF2cStq9y0B8BGATU
 dzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iFHVJBO+ry13+wBzkm6FPAuC4sj/uHPx5HzixSFny3I=;
 b=JWCySbbwkAKXW0+krrHSUZD80//amDQXZHs4UWHPLY4FdmmTtzZrdP4kKZiBDzf+bv
 m+xC/oKvn5eUPHguw5leUUMCWTvtb72eud5qVrKLTqjeQGFHP8wwtbwUWIwkns9jCXG9
 fYS+oph5bHr+gbvg5xG3Nuei8qRywrmQI+mpTTpEdp8UrfPHA+JaWdw0fTa0lDxl458R
 kjrsxVfstApP7qvfClEytzqLk7cJMt76I3qLbcbiSKMSGLm9HWTtdme1IVfFxn4jj4YF
 ec6ES87pU1XVqXDKkxbd9Wl2mclYn296sHS44Xp7zV/ghiQ2dv0/0MyVQ7s7PyZZh/Kq
 6gPg==
X-Gm-Message-State: AOAM531bVjrqrLaRz0RCL5puRq3o11mCsq17k/aQaYg1KBdLZ0BkJlBH
 6zbW5Ff1blvX2WgyHqji3rMG3osQg+4OCQ==
X-Google-Smtp-Source: ABdhPJw3yDf510v2MIL46HSn8zsLMOlbxdcxF4duhcACxYFF428oww4v8dZ+Nuala8DG/edHKK22kA==
X-Received: by 2002:a17:90b:3118:: with SMTP id
 gc24mr4288922pjb.212.1618497230255; 
 Thu, 15 Apr 2021 07:33:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w127sm2314022pfc.51.2021.04.15.07.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 07:33:49 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
 <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
 <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <315a4dfe-fdb2-2d01-7e7a-2d413ee0d77a@linaro.org>
Date: Thu, 15 Apr 2021 07:33:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 6:23 PM, Max Filippov wrote:
> I see a few places where target/xtensa may do that. E.g. it does that on entry
> to an exception handler to allow for debugging its first instruction.
> No guest code
> is consumed to make this decision, would size 1 work in that case?
> I'll take a look.

Yes, any positive value will do.


r~

