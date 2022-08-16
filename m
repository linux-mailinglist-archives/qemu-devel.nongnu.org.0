Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4B5961F4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:07:31 +0200 (CEST)
Received: from localhost ([::1]:54030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0yR-0004ei-15
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO0dV-0001Ce-LC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:45:53 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO0dT-0003zs-VW
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:45:53 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10e615a36b0so12451055fac.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=A2t35N+kmK/1syT9408j3VWsqFIZjA5jCgJo6PNgJY0=;
 b=jAiBggifW/kFNZxKNVNpfvRoP8S4qScRw6k0eqE9WpBxalwlLjJtjfVbkCXkDiHa5V
 z0RMxvvsDc1y45r5oonn0h6VVULqUMe46CeaI0pDA4zyWsNiZ+LDroo5eJojLVdfAY9k
 9f17kw7691lTy7SPly533LHXQV+SWFedJYSDwe3x8hSQu3jVh98DsHzDFGZR/GTsLJfh
 d1PiuPD154bSr1tJEmu3tN57/EEVFAEIlRSy2P2OtoUl0uMi8eT1HqiNg/t7VaKFfRtB
 4w3wOi1/ZF07T4INuWQiA18vo1i0At7nr+tx7HmY+REpk/AJUwHisLnHPpSUbKFE0oQ8
 zVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=A2t35N+kmK/1syT9408j3VWsqFIZjA5jCgJo6PNgJY0=;
 b=gYtg/F7JFCGrywgLb0ugRPV18C/xSIMU7fIhZrk0/mZifT6obZpbamo2eAPLPBcFm3
 hjbgm8EuuvqRzz/Xy4YdCsdaMdnpJl+UHTIcAua8Mq19DCpiV39D7Wka2gUGKUsFltUn
 rInH8Ps+zZeoeTmebR0wYiJg8g7MsWuTXgFJTYrwJvIn0QNyQ0Y4EhATkKO4+VJ/5fta
 9nNVkOYTWFFXlIw6fryq/BrMIiyFPBLNYHESUii8v2Nn0/4if93OatJJniomMzP2RBkL
 z3YkrPGSP1V48uBWT4LpegRQ3Q0L3XbK09c2Mu4/CAHitSniBBIQZh8BkzbISZO474AK
 tOxA==
X-Gm-Message-State: ACgBeo3+rUka+fxMIyCNXZSP9lDhc0wbmY9YNUeJnzqS60ESYgTKkR+P
 soc16ul5ueGETCyrI1Qi0CFjfA==
X-Google-Smtp-Source: AA6agR6L8RRFT5FYtafH5j1Ker4Guxvzz5Wp3gtFxj6vzLKtel6K7jj19nMJUF9y27olkTK3zhPhxA==
X-Received: by 2002:a05:6870:5b84:b0:10c:d1fa:2f52 with SMTP id
 em4-20020a0568705b8400b0010cd1fa2f52mr9587028oab.92.1660671950518; 
 Tue, 16 Aug 2022 10:45:50 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f1:2110:a4dd:9176:6d98:8dab?
 ([2605:ef80:80f1:2110:a4dd:9176:6d98:8dab])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a056808048200b003437e4f2510sm2158428oid.11.2022.08.16.10.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 10:45:49 -0700 (PDT)
Message-ID: <620cfa81-0868-1a85-7161-d58f88e6690d@linaro.org>
Date: Tue, 16 Aug 2022 12:45:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] tests/avocado: push default timeout to QemuBaseTest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220816133831.2166761-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220816133831.2166761-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/22 08:38, Alex Bennée wrote:
> All of the QEMU tests eventually end up derrived from this class. Move
> the default timeout from LinuxTest to ensure we catch them all.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index ed4853c805..9d17a287cf 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
>       _console_interaction(test, success_message, failure_message, command + '\r')
>   
>   class QemuBaseTest(avocado.Test):
> +
> +    # default timeout for all tests, can be overridden
> +    timeout = 900
> +
>       def _get_unique_tag_val(self, tag_name):
>           """
>           Gets a tag value, if unique for a key
> @@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
>       to start with than the more vanilla `QemuSystemTest` class.
>       """
>   
> -    timeout = 900

Is 15 minutes really a reasonable default?


r~

>       distro = None
>       username = 'root'
>       password = 'password'


