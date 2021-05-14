Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C43809E3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:51:27 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXHq-0003bC-BR
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhWqd-0002UI-VZ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:23:21 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhWqS-0000Be-1m
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:23:18 -0400
Received: by mail-qk1-x72f.google.com with SMTP id o27so28447462qkj.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UFwQ1FX+p4sz2uarUibjP1YD3UvD4a6C/tSAlna6Oe4=;
 b=eJJCx/HQMD7QyZDC7/cC1TrDI4vt1mLFjsss7/D2y8VB+86l2alULS9jOsM0xf35CW
 eH1SHkJ0exGLyBgwUeIMfeIUC2BG6jDYz8yHwvpnsst4iPgxBwMRBLV1HxpZftwENTNe
 4mfoo+7r3K3fi1aSuRyjgGhI5Jk7bu9Qmh5qTcdLSbJLBZ/0D0hNPQooxG9Cd2XPhO+R
 wwEnRqbJ9DJte0n5nBmISJDb2sX5/6JzEZZmUduUqdN06k1jmbcVZkMt2R9YchFpCKLO
 SYlLA98XOcftENRKhI7Tcc8ESnkWZqtwYtCR42rKonsVZ3lSB/P49mY2+5W5Ihe31z/5
 /ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UFwQ1FX+p4sz2uarUibjP1YD3UvD4a6C/tSAlna6Oe4=;
 b=Gf5B/lSDO1wybzw3wIuYuJGTlaD5IqLhlNAvf/9WawZrBad8o92PnH9iDvSGxDUxuT
 tnzHkjvcj8g6UxbeTCWX3Nv26TSCxzwkc9kb1GCSl+eUOeOmgFguYkoRgbz5Hux9c0cP
 HxodpH3Tu82lehMBQ9euK+7nsSOAIiEcEB9s4lhzAfPUNps+JFtUJA+ZwOozDvON+c3+
 fgRc+aUu+EoL1yjJ0Q47tKza1BkE2pWEtOQG9/EgPCFFx2lXcFr4tquW/cAGAjyaHRkN
 gnNASETo0o0gl5/bqJ5XI3voSW/2rGErjRmkS3RZriS6t4e2W6mLwJqzsAN+8I+RkkoK
 PYpg==
X-Gm-Message-State: AOAM531sK5eByBijeVOFPNSQRwP/1I2p+apeEFF+k56pkkv9Z7SzpZjy
 jHeToQZfmoXSwGAnA1LxLH9UEA==
X-Google-Smtp-Source: ABdhPJwl0drNTSRWj/Cp2/uv2jmtmXltvO+yiZ4hNh7CsqgbCD+8qZNVbh7uKxDwK+gecyXHnqql4Q==
X-Received: by 2002:a05:620a:2947:: with SMTP id
 n7mr43722224qkp.450.1620994986182; 
 Fri, 14 May 2021 05:23:06 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id g1sm4327884qtj.44.2021.05.14.05.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:23:05 -0700 (PDT)
Subject: Re: [PATCH v2] tcg: Use correct trap number for page faults on *BSD
 systems
To: Warner Losh <imp@bsdimp.com>
References: <20210506173826.72832-1-imp@bsdimp.com>
 <f8db526d-cb19-c633-1327-2282333c7fe3@linaro.org>
 <CANCZdfo3RwMYtHvH4c03Gj0+YL-QHi_Bpu5SRMB6SWrMHiQiwQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2850457-b564-2f83-9656-76a3667cf619@linaro.org>
Date: Fri, 14 May 2021 07:23:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfo3RwMYtHvH4c03Gj0+YL-QHi_Bpu5SRMB6SWrMHiQiwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>, Mark Johnston <markj@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 12:53 PM, Warner Losh wrote:
> 
> 
> On Thu, May 6, 2021 at 11:51 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 5/6/21 10:38 AM, Warner Losh wrote:
>      > The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
>      > used by Linux and represents the intel hardware trap vector. The BSD
>     kernels,
>      > however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14,
>     etc fault
>      > handlers. This is true for i386 and x86_64, though the name of the trap
>     hanlder
>      > can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
>      > define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it
>     instead to
>      > avoid uglier ifdefs.
>      >
>      > Signed-off-by: Mark Johnston<markj@FreeBSD.org>
>      > Signed-off-by: Juergen Lock<nox@FreeBSD.org>
>      > [ Rework to avoid ifdefs and expand it to i386 ]
>      > Signed-off-by: Warner Losh<imp@bsdimp.com <mailto:imp@bsdimp.com>>
>      > ---
>      >   accel/tcg/user-exec.c | 14 ++++++++++++--
>      >   1 file changed, 12 insertions(+), 2 deletions(-)
> 
>     Queued to tcg-next, thanks.
> 
>     Looks like this area could use a bit of cleanup...
> 
> 
> No arguments from me there... Thanks!

Dequeueing.

This doesn't work on our "make vm-build-{freebsd,openbsd} images, as Peter 
helpfully pointed out after I sent the pull request.  I don't know enough about 
any of the BSDs to know what's expected.


r~

