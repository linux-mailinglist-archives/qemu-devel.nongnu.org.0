Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D40439B5D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 18:19:24 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf2h1-0000a3-Co
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 12:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf2e1-0005rI-K7
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 12:16:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf2dx-0007GS-KN
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 12:16:17 -0400
Received: by mail-pf1-x430.google.com with SMTP id a26so391355pfr.11
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PefzXUuyeDcCYSvPWV97RCpk8z3Iv5hBRZVNJUSuQ9g=;
 b=OFBn4WuZpV0Xo5zOf3i0oFCCEmolB9msFnjPBK3W/XQ/tMmXySCLHO6pNPtgKz/NtA
 an7YDax9LBr9PBobNUIHI/2aTZkPBZqa/ZcFOzQ51In4wIRQoV6iVTJpvcuDJrtx4C2e
 APwaPnnflaHG2UkoEvNvMwBCYceApM4JnhBfcFCDOkq0O3L4BnhhEtShEn/DJklYYmH/
 jNKAj3PXL0cmekr2hyUhRkVE6fUZhOFvz9DKmYSXWA79/oxEr2Rpz9Xp5o+uAIVqhsYN
 oIsCNt3gwjYF4kYNJeoUYV4HCXURynlHyafaGtMXKXyw0oWO7ROOvXGlElr3cOCzqMOS
 ZxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PefzXUuyeDcCYSvPWV97RCpk8z3Iv5hBRZVNJUSuQ9g=;
 b=3CdMaOJAn0ewgb36s0NNIzOCWZPpiLamOpAeaDG3ufCIC1/DHbOn9mmC74P26jPk1e
 k4YDkrsk5mbpaRneh68pIijT0LhGKMAHWOzu4Oyhd7F+E9MOjj3DE64avVDcBtOO6gTz
 UWJ9wt/i5bEJSTE22d3vJ6bL24Z9ySsrvxzych22b10E/+hM7Vq4qBOikAwl07LNU9Zs
 yPn6IlNZ/yviQgWcRuP1X74yPSvmuKG38C0xI3uC+V04409FDmjaVmDYQfiDFuDoNFAY
 DpE+FmIC9MckGcVVEvt+JzSlUrXNWKUpaAh7LI60OKksV9KvvlpvMYLWQ+5hxvITWIja
 tSIQ==
X-Gm-Message-State: AOAM530e5SnKtvTKYsEsiDH0HMYVJf/nGQfWdbSFd/lCsaAKtzUdH9Wv
 Q4rkrsrElaYwIW0uuxFZeh0XMQ==
X-Google-Smtp-Source: ABdhPJzgRtEKRV6Csle9EDRcE02ZnJ2fzLwKEp5BYuWrQMTS9jzi5MHi2zv9c2UIvWq0DHDlZDvhWg==
X-Received: by 2002:a63:b911:: with SMTP id z17mr14461049pge.175.1635178569509; 
 Mon, 25 Oct 2021 09:16:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w5sm16456137pgp.79.2021.10.25.09.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 09:16:08 -0700 (PDT)
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211025140716.166971-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
Date: Mon, 25 Oct 2021 09:16:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025140716.166971-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
> This is a preview of how we can solve the coroutines TLS problem. Coroutines
> re-entered from another thread sometimes see stale TLS values. This happens
> because compilers may cache values across yield points, so a value from the
> previous thread will be used when the coroutine is re-entered in another
> thread.

I'm not thrilled by this, but I guess it does work.

It could be worthwhile to add some inline asm instead for specific hosts -- one 
instruction instead of an out-of-line call.


> Serge Guelton developed this technique, see the first patch for details. I'm
> submitting it for discussion before I go ahead with a full conversion of the
> source tree.
> 
> Todo:
> - Convert all uses of __thread
> - Extend checkpatch.pl to reject code that uses __thread

Absolutely not.  *Perhaps* one or two tls variables which are accessible by coroutines, 
but there are plenty that have absolutely no relation.  Especially everything related to 
user-only execution.


r~

