Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B16380BE5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:33:17 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYsO-0006z8-BZ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhYqA-0005co-HU
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:30:59 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhYq6-0005jQ-49
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:30:57 -0400
Received: by mail-qv1-xf31.google.com with SMTP id ez19so1134818qvb.3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HIbDkNMLVS1GP8bm35LkXGfDWBq0obnIiFAZck44pfQ=;
 b=RIgPaci5ang09qIj+95wYwO8PegghSoIvZ9jvpTnragbjelLhcT8QWcQLJRkFbS/+A
 NlU823+pNtAjR7VJDwSGD2dOfeLLu6Xosgh7sMTCY8iJ6ioQHiaH1qZ+5iQEdumz7D6m
 QeJJb+coBuXft36GBYY+LnYpwVKR+UQzusHAX8snsK619/rtINrOPuq0vrIjUN7Y66tV
 hUEiBNV+Nbyh47esiif7favwmXxGGvrJDLyCmTghPJ5O1FMfmRYo3BJkANTLlEItR1ld
 +qiHMX1Venl9cx9dmOOAJfL/n61KvVZ+qdxDZGBAzdemy2ydNNO+tjUlFmBetjMiEGo3
 MOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HIbDkNMLVS1GP8bm35LkXGfDWBq0obnIiFAZck44pfQ=;
 b=rDC8NPtwGf2i89SpRL4jmGl+pb3KGoGzRCiZgXYEom6eXuP1gzKFCbTXJM9aVFfIrA
 /V0qK2J+BeEfDNfzJi4jFO33zEm+wK8jY5MSJNgqsITmR3zHvpc8M69Or9OEbuF552cp
 7mzrAAsu6ROWNocbwkmUENugoyCA4W14iDQ5aTMdTQrgNiKgwegq403kCCca6nEXjAsc
 BwTQEhfFOf5/YTGf3RV/GyXH5YJKopursgdl6yAJJcvi3UNUmunaNRsx1KJx18Ysh6RE
 fsm+wTGyrLfGR7nwBUma8fqSSHbcD1AIVkcN68oouhT34y3xjstLOLc6e8LWqTnyF21k
 mxzQ==
X-Gm-Message-State: AOAM532pkSnBjpCXslhLx8gzrFsWTyIu6mIwRB+rJsoZFfqH2izyfceq
 fzKMj4NtMdy7O1hJDp5TpfZNBg==
X-Google-Smtp-Source: ABdhPJxIzLsjRbDp7wbKG6VS5cW5deVO9r0A6xtzRT2vKAdpsukU5elyFAjq+atDoXWftt1LJ/FRGQ==
X-Received: by 2002:a0c:f54e:: with SMTP id p14mr45724636qvm.44.1621002652991; 
 Fri, 14 May 2021 07:30:52 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id o5sm4925406qtl.85.2021.05.14.07.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:30:52 -0700 (PDT)
Subject: Re: [PATCH 2/2] tests/tcg/x86_64: add vsyscall smoke test
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210512040250.203953-1-iii@linux.ibm.com>
 <20210512040250.203953-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f29e9b80-ccb1-bcec-d3d8-8cb3de998a9a@linaro.org>
Date: Fri, 14 May 2021 09:30:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512040250.203953-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 11:02 PM, Ilya Leoshkevich wrote:
> Having a small test will prevent trivial regressions in the future.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/x86_64/Makefile.target |  6 +++++-
>   tests/tcg/x86_64/vsyscall.c      | 11 +++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/x86_64/vsyscall.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

