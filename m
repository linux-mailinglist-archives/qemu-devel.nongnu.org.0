Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADC50796F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:51:47 +0200 (CEST)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsx0-0000jv-76
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsrr-0004nV-4a
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:46:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsrp-00033n-Jf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:46:26 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so1934509pje.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OzJYSn+3wzy68RaaCtc+Ycev/9oseUfTlvIuZ6v8gSw=;
 b=vK3N2iMsK4FOZKxJUEDIA2Erie674ClB3PurbncVUFxvk6UxMdiNGbWkkgxv6IXvNW
 e+mtV6V6WBZT4uH+ljS9qA4IJTlg9zh0jaBP7y8P1+yE7SMEl2gyZyLq/wjM5kMePXwZ
 o3BKMCfPiJx5iRTCLowPb1ZprNKLPCzaK7mS7bFZ0IuwZA1wMpxfx6nk4Yl9JkChpelT
 y1+Fb/OLJ8eDHQZhUGDvedTuQ6+m1FvOeDokZzcJvjTws8PhJU63zznNWDI1kQOeksrn
 22ZkVVlkOUKa3fCiK90YTVc6DungRLal23+eHWxi8onilrwu9Esld3QQt5ZbGRE3Ex85
 bIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OzJYSn+3wzy68RaaCtc+Ycev/9oseUfTlvIuZ6v8gSw=;
 b=wxHn9luTkkEuY7Tp36BtKR98S9Cy34k6VhJaaRDwZvIU4qWTgLrYpTSDKsMZd6HgJI
 dZfp21wHkZQsaToQcAAWTMinOY5eDIVdnvvJD+6P5a3dFEriifW6EGZ1DNGh4Y5RclHj
 7FKLMMJ7MdWhUye3ABiQ+x+Fw9lhtug/yKA0v8KVXNcfbg8/Bi1utvzoswO2EBe/+ODa
 bKM+zDJLfOq9y2OWPxqbyOhma3ya7GxCqfcd3m2sJo+vmUzAJmkTZvUHwO28gwpJ7VbG
 Jgq902YIi9CZ+3f6guwe9q5P3B26Vc8WUkyy4XsIZouM+FhX6f0XJppZFtIFx605gNrh
 E/cw==
X-Gm-Message-State: AOAM533LasvMBC+OfPEw15/Y/LUZGE5G4b/Ise7FkuwPV/9HXG3E0qv9
 qtnhXRj3Hb3Zk3c5h4BEfQH7eA==
X-Google-Smtp-Source: ABdhPJxbOJqwVba2AgmQKzeOyct42fBQ15yHKGddE3z441c6PdpAGT2shtZBl0iAS4ScVNMWTxZu7w==
X-Received: by 2002:a17:903:2283:b0:158:e7f4:7056 with SMTP id
 b3-20020a170903228300b00158e7f47056mr16932869plh.24.1650393980352; 
 Tue, 19 Apr 2022 11:46:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a65580e000000b0039ce0873289sm17019060pgr.84.2022.04.19.11.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:46:19 -0700 (PDT)
Message-ID: <00f92191-5e6b-078c-24a3-32ab52f2a56f@linaro.org>
Date: Tue, 19 Apr 2022 11:46:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 10/25] tests/docker: simplify docker-TEST@IMAGE targets
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> No need to go through the shell when we already have the test and images at
> the point where the targets are declared.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-8-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

