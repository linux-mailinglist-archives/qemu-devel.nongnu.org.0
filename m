Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727BB40A67C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:09:57 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1dk-0006kM-IN
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ1bx-0005yy-BL
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:08:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ1bu-0001sa-HJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:08:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g16so18287224wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eUpjq+/ex2RsWrzpCc4TECKXlgWF2HueCkTEycZhPW8=;
 b=DVOcfwHMZaCSXnHtIOe06E94KDYnSPdI+Z9rAyYhyvjV2ErBryDdn7AN2cS/F6Jsfz
 llzmSwy7iFFnhbimO9bYKt0UhrR7oHO//wqKHmhed4T6V+HEnl+dixsGKzTHaLor14hC
 rZG2QUMM21AQKh4ZRVcIoKPgH5gizrkxakJx8jcb6ZKqv3S08r0H8zsMyEAOSydDfliw
 JmL5QhSnD2/iJcM6tjcmNQR7AnOLdOcsiF6Ae9LS8WXZzFdQKsBi+Lo01o0oFWCW1iJe
 zGXSXqKvndlF0kcPb2+TgwhYSmfUfBeH6TGvy2SXzNEGdb3D1E1VnCbvTSQBfS12Nkra
 xz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eUpjq+/ex2RsWrzpCc4TECKXlgWF2HueCkTEycZhPW8=;
 b=FErd0KkFbxj+8/0RDeGnt+UgdHMPdUp8P9WP9pWnMoK9Zw54XOwpTSSgNk2O7k0z0g
 YTRZ90dzwTtC0y+ZtB14yi9bxD+ZF2yzV+MP1BQ9OwjJ1HJ9n5gS7KynkgyTa0bXw4BP
 f9T4nVawpzWHjfmU+F1YnO+Nm/sjziXoD1iAA+0o4XRY1VOFCc3/CB8o5VabUvYLsu5K
 EZZTNdsKZo7Kp/t4pVmtQ7U+ogx/r38iSgkx5F6mZbONBMwvO2VI32+BJc5pbhdRpJjL
 e9/pVt/8Gi7TGcvyZVypqcIKc86oFf9RyZei+vE3+VRbcoBwj2BcgqMdVT597X5/S0iR
 u5bw==
X-Gm-Message-State: AOAM5309qmxTwwzlo/9RtQk/D2qaLRJJJ8rXMx1ex3kc8YjTAwNaBust
 TFMt/GP/OLZwM1+0TMEq+6osP1Q/vFk=
X-Google-Smtp-Source: ABdhPJwDZ+6R2pNzf4KEZlF2u5hWQlX10b7VcNdcpE4EkR9lIAsgxRlQFaD7aDBuNsH4naCwHG+C3Q==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr16937817wru.395.1631599680047; 
 Mon, 13 Sep 2021 23:08:00 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z17sm3930448wrr.49.2021.09.13.23.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:07:59 -0700 (PDT)
Subject: Re: [RFC PATCH 2/7] accel/tcg: Split out adjust_signal_pc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b1ae7a07-343a-191d-e047-e36e56dd7419@amsat.org>
Date: Tue, 14 Sep 2021 08:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913220552.604064-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 12:05 AM, Richard Henderson wrote:
> Split out a function to adjust the raw signal pc into a
> value that could be passed to cpu_restore_state.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h |  8 +++++++
>  accel/tcg/user-exec.c   | 50 ++++++++++++++++++++++++++---------------
>  2 files changed, 40 insertions(+), 18 deletions(-)

> -/* 'pc' is the host PC at which the exception was raised. 'address' is
> -   the effective address of the memory exception. 'is_write' is 1 if a
> -   write caused the exception and otherwise 0'. 'old_set' is the
> -   signal set which should be restored */
> -static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
> -                                    int is_write, sigset_t *old_set)

> +/* 'pc' is the host PC at which the exception was raised. 'address' is
> +   the effective address of the memory exception. 'is_write' is 1 if a
> +   write caused the exception and otherwise 0'. 'old_set' is the
> +   signal set which should be restored */
Pre-existing extra "'" in "otherwise 0."

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

