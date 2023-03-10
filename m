Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1726B4F49
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagn9-0002W4-4c; Fri, 10 Mar 2023 12:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pagmo-0002OM-LK
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:44:10 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pagmm-0008Gj-VZ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:44:10 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h31so3504909pgl.6
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678470247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tuiZ9a/hiVQeQ2ApwACp7vp+tO3Kq9zcHFaznjM4hZM=;
 b=WtmnzrB/6NPKmeSOvsh5H+YOnGmthqOy41Lzhg4FU0P6R4lR8YhzHxGvnPiD9Rbodh
 qFhkl6dwbaVOX2cmOM9QBAu0EK5KRWfwvmRh0X1sGtPzUsyQOTn1nAkaHcBwo+W5phcC
 1EBnfTzwGXUWBz74fgMJKjKWJ9BuCi5po71XQWxGnoqkZMxmeEwI4DmysQ5kFIpBaLzv
 sQl7nvZd1UWpOVKFngezMHSDpKjk+04fw8fUVof7AxDxZjZz9gkzzN2OMAHC63TQdUDy
 C5UyI4Eh2WLUYLXtA68XZ+xyjhLTWqKMGzjb52XM86/1mqxpZs88v+q8AIOIjMKeWBUA
 irqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678470247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tuiZ9a/hiVQeQ2ApwACp7vp+tO3Kq9zcHFaznjM4hZM=;
 b=04EFEstIZa/6muY0N1pDLskW931k1B2TRUg7TylTciTR8am/UEify0H52kQkjlo5gX
 Qxhcy7E7/cWXRCa4mt3IsPl0IJAinncD0HOXrD5co9pMsu2b5xzMvhjS2gOJPEcW5NSI
 WZ0D4Z+fzODd+T97LItYyWJy/J8gOr+ck/5pcoQu83WSNnBF/SUzBHo4yHMLoq+lSEkX
 xoBaQzZHpxJC9k6w6AWv/Vv4Jiq7f01ni8laDua6dHgyq+JSlyYA3UjJHiZ9JlFSiCLH
 qLSAKjVeTvwd17KPHQqTDdE1OfxI4weIkObDBgGsJMlh967OGVIVe9sJoTOyj2Li+8oP
 7jmg==
X-Gm-Message-State: AO0yUKVgjYWmgezzSNU0UQXKQgE/thLPp+WeQc1pu5DFMWaZASOU3wyX
 Wz8kALVyUqNya+SXwMFzHbQKjg==
X-Google-Smtp-Source: AK7set8MBn5nQNQ614WDNWoo8iSCmywBaGJphcvecesaLxN4Hju68G1x5ZI+6XzgIp4QCgcJrE5RxQ==
X-Received: by 2002:a62:63c2:0:b0:5de:3c49:b06 with SMTP id
 x185-20020a6263c2000000b005de3c490b06mr5360858pfb.3.1678470247266; 
 Fri, 10 Mar 2023 09:44:07 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79219000000b005825b8e0540sm76177pfo.204.2023.03.10.09.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 09:44:06 -0800 (PST)
Message-ID: <133f7c48-8b10-8b41-2b33-d593e46eea70@linaro.org>
Date: Fri, 10 Mar 2023 09:44:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310103123.2118519-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 3/10/23 02:31, Alex Bennée wrote:
> You need a very new gdb to be able to run with pauth support otherwise
> your likely to hit asserts and aborts. Disable pauth for now until we
> can properly probe support in gdb.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 9e91a20b0d..8ffde3b0ed 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -84,6 +84,8 @@ TESTS += sha512-vector
>   ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
>   GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
>   
> +run-gdbstub-%: QEMU_OPTS=-cpu max,pauth=off
> +
>   run-gdbstub-sysregs: sysregs
>   	$(call run-test, $@, $(GDB_SCRIPT) \
>   		--gdb $(HAVE_GDB_BIN) \


