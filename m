Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2393B5EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:27:55 +0200 (CEST)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrIo-0001ga-F7
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxrHy-0000L2-F1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:27:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxrHt-0007Uk-K4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:27:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso10437759pjp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YEowzxFpnNZibU4QdOGdCfflBSnTI8T7eglrFBOYNqk=;
 b=nDYi1Un/H3kOOZv7bvb3m8x9JQaHVWI70tbg+LPzwv3lDiJ8OghLf1IhLhXX4I4wsK
 dgoreJcPx7CpekZZccMC97Ii99E4TsbJXWnHmUXrBbQTvNaKaCYJ5ORiDrYjMuDrjlnR
 kyDqh8mKqrMNICUmLCWuF6q3halqIs8+VobQ7idUPqe89IZOMdxzaVZM3QJS9Ty8/gcG
 vEUWTQOzHObA3czuAIpIcXuD8kSzCE3bZfS/1ASLUeHzEETl3C4kKT+UQ4cTks5ijGFr
 9N0+YeCJq8krktz6GpV0mlTD+3GnDfSvroGJwI8bTNBvDovHLJRavTzA1rJwiO2dXg5q
 sKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YEowzxFpnNZibU4QdOGdCfflBSnTI8T7eglrFBOYNqk=;
 b=g7BowPWbU4PTu4qGInz+8AkqLXh3/elhKrWJGk3zq0ZdlUdasiS8ZFZZuHHWIoZ1Wj
 TtmngOmdIAK32MoD2H4pjFnEpX528N4G3X+XD2FDLZ7G3iWKvZ3G4hn+yZ4/TvFd0qxj
 34ZxvgVTbPMy8uZc7cT1UFue16azC/xGZQb9alJfe6CuNaUajAjGrPOpCKd2EViihMpU
 Ul9eikOpKrxM9Yp+eHF0hf2/AwZgiaVBYu3mWGOdAoXEW5BG+huHiIJ17z47PcN2lgKB
 WO0YugQpkRFL3Svgi44jl/sdrOSemKl32hyNUYQMQ0AZax6X1n0HE7bI+EHn6cuBqJ+C
 WhQA==
X-Gm-Message-State: AOAM530t3bbC4gO8WfleMX++k3QHlY8nEn/UTmRFfit7Fq7rkgCtQSDH
 1rBG7j2VGRAi5/D6UrmQPJYv5p+EHtqJFw==
X-Google-Smtp-Source: ABdhPJzhxrXtEVfoWhnnzCnfgnli30wo5AG9Thav1udrK8HWp2AWH7DoOKyY8BEBKT96jP+eTI2CEQ==
X-Received: by 2002:a17:90a:a101:: with SMTP id
 s1mr36113085pjp.31.1624886815058; 
 Mon, 28 Jun 2021 06:26:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v1sm14948146pjg.19.2021.06.28.06.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 06:26:54 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
To: Ulrich Weigand <uweigand@de.ibm.com>
References: <20210623145020.GA30585@oc3748833570.ibm.com>
 <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
 <20210628125803.GA29264@oc3748833570.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c9a00df-aa43-d721-912c-eeb9eda839a4@linaro.org>
Date: Mon, 28 Jun 2021 06:26:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628125803.GA29264@oc3748833570.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 5:58 AM, Ulrich Weigand wrote:
>>> helper.h:DEF_HELPER_FLAGS_3(clgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
>>
>> This won't work reliably.  You're writing to a tcg global inside of
>> a function that says that it won't.
> 
> I missed that, sorry.  That problem can be fixed by changing the above
> line to something like:
> DEF_HELPER_3(clgdb, i64, env, i64, i32)
> right?

Yes.

> In any case, the current implementation already has two helpers, and
> I initially tried to keep that, by using a different second part to
> correctly compute CC.  But this ran into the problem that I didn't
> see any way to detect the fact that the conversion operation had run
> into one of the special cases in the second helper, without re-doing
> the whole conversion a second time.  Is there any way to pass
> information between the two helpers (without running again into the
> same qemu global state updating problem)?

Don't clear out env->fpu_status.float_exception_flags in handle_exceptions.  Wait until 
we're actually done with the data.


r~


