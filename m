Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5443C27CA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:52:04 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tjP-0001aZ-BX
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ti7-0008OY-UN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:50:43 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ti5-00038Z-Eg
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:50:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id 37so10576779pgq.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rqI1Sz9qv8YiV0bVYOHVgBN17hNVhXxarxWGSK8gauI=;
 b=N5ixZMR9UxCvuMGGt3jK5GlYdKHIbDzrdlQ3UcfXExJ80E8RHl9z9x8EQVo4dsWQfS
 E5RYsbB40hZf2gBx+BYW6NLLk/yEEiHAi+Op5AnbP3fOHVVFB2Wb3x3z7lzcO8lA9WOF
 +t9DC7+vatAoCRqhCxb3PrE0uFtmufADkjoaMWuo4+7l7/ZxG49W/XD8tLLz8SDCQoUe
 kNZ4Uk4dSoQzZTv0CnoHTzPNqOMuqvAItv2mV1uXF42J4PT+DsOY/Ylqm9ykh1NXFxVu
 q/EQjS25bgNYx+5UzS4raEsjhVG4de6/CkgieYwyE36eqKkzd0/QsDTQc918XHbOiw2f
 GEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rqI1Sz9qv8YiV0bVYOHVgBN17hNVhXxarxWGSK8gauI=;
 b=Y5R3uNXBw2NAgKd7jvH7zJfwR9HD8cg+SX7l8I9DZuPod+rdXgoO4GA3vT9esdNGSz
 1FPa4EkPvTerIR+J2qnvz3aSPn+NtWeyb5VK33O3ZgmO7GCEoxqR4lEm6VzHF//AWVmi
 9waYWg9GG2wApVVVBs/SrIWBQk+G21cuIhRYp3d5+9DEeK7ZIlg6NyghuInhyRIwtEOF
 26igtOXteDf7dMtdP8S3xuqQD6rknmJJzZdFbPPctXeOcuQZVn6TNvabwucNKMphNqMM
 X6ettVXgRMvHAqhIqwH0aw4R/yZrG2IE4MbWr/4PYlrju4UMSNCxKrlTM3oqp8AqSOu5
 Fw3g==
X-Gm-Message-State: AOAM532SpgxZvCCNppGkCTOL9cIZUwy5P4jpfRMTc4+isaztNRwg1Zvb
 c6uscVfzDfFT4bTC3TM2Xs0fFQ==
X-Google-Smtp-Source: ABdhPJzpapIqvpoHikCt9MFnaj7rcqricHTCWmx+NfiRZeSD13nGTX0xs5ciSmEqTq68Q96U5fNA5g==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr6015970pgq.81.1625849439839;
 Fri, 09 Jul 2021 09:50:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c14sm7791287pgv.86.2021.07.09.09.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:50:39 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
References: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210709160459.4962-2-jonathan.albrecht@linux.vnet.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a401699-06bc-d937-d41b-111e2098a6ec@linaro.org>
Date: Fri, 9 Jul 2021 09:50:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709160459.4962-2-jonathan.albrecht@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 9:04 AM, Jonathan Albrecht wrote:
> Currently when a compare-and-trap instruction is executed, qemu will
> always raise a SIGILL signal. On real hardware, a SIGFPE is raised.
> 
> Change the PGM_DATA case in cpu_loop to follow the behavior in
> linux kernel /arch/s390/kernel/traps.c.
>   * Only raise SIGILL if DXC == 0
>   * If DXC matches a non-simulated IEEE exception, raise SIGFPE with
>     correct si_code
>   * Raise SIGFPE with si_code == 0 for everything else
> 
> When applied on20210705210434.45824-2-iii@linux.ibm.com, this fixes
> crashes in the java jdk such as the linked bug.
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1920913
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/319
> Signed-off-by: Jonathan Albrecht<jonathan.albrecht@linux.vnet.ibm.com>
> ---
>   linux-user/s390x/cpu_loop.c | 54 +++++++++++++++++++++++--------------
>   1 file changed, 34 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

