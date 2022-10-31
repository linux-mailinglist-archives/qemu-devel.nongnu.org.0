Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C32613A65
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:42:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWuF-00039n-7a; Mon, 31 Oct 2022 11:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWuC-00038r-UB
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:40:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWuB-0004Kc-CS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:40:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so11076526wms.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5KpIot+WqYjAlFVst/bq2DukmYABIfZNjIOEKvV9Rxw=;
 b=OkVEWL64wpRk3cdWpX3iSUYQLUjVIJOpI5SfcbqWYTNeI+y0zIS5FEbIJMNnhfYlZD
 AWSMvXKTD4bLeVE7uRjWLA/I7cBJS+1OWOkp6/fexrwkv/n2C7AoQVtZqrGPD3axA1Iq
 CI+n9j+DK1Ok8rDKlP9rKmBLa/RyoZvpcqNV4ZK3tsAk46ge3lrqxTUkG/EzTGj9crRO
 3ewrNS7Imitgzq2TjKcjGzRELD0sghL/zbywHpxyW4d95+DjVRltUCQYvZPLu3xesQeB
 G9H72Gk4dbDN3lGCvS4QCmwNu+Hj9Cq5iDjQuq/+gGr6jiyzu+ESJTZFqVa1m+Kz8NiZ
 Bh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5KpIot+WqYjAlFVst/bq2DukmYABIfZNjIOEKvV9Rxw=;
 b=kTjHmTSql1oajaUrYiav5/eiwkHzL3xy4wnsZZ0Sx5aRzdUqH9xCAEV7L4Vh3H2whK
 xomgri/7kfi+HOuRibZphywheG+tG0ogEn4di0QsereSdXE8ZDvWrVBEtxRSx/2k2aFE
 e+1nYYQYtQDjP0Ry41QZVy3YtMxJIU2WKtQI6AY6+8aEzVhvqESG0agGqkmmoHYKK6rN
 uTlofcHRSUUeLdynRJC49RFAE13ZRtone69SuEuQW0U4YBwOSUR//dMNqdwxzh6MfvR4
 brro0GH8KeOyVVIWB3r83QGV4TjPvHys02HIyVxe+JSXSJxPrWJWBbb9S40NBJG6cGgM
 cMpg==
X-Gm-Message-State: ACrzQf2Ubwyf5p74plb1SLQQgcUV/rJqMUdic9DGwta7AmbG8825Akfx
 0NNPD7SErT/GdhvTfM///CqF5w==
X-Google-Smtp-Source: AMsMyM5lpTSqu8QxQQLrqfPjzgfoYB5QPLUXneLDNKH1QJZ73v/c4R3wi1CLTzYzz4W6znGA0J94Aw==
X-Received: by 2002:a05:600c:1987:b0:3c6:fd37:7776 with SMTP id
 t7-20020a05600c198700b003c6fd377776mr19161179wmq.72.1667230849615; 
 Mon, 31 Oct 2022 08:40:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d420f000000b0022da3977ec5sm7336950wrq.113.2022.10.31.08.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 08:40:49 -0700 (PDT)
Message-ID: <8b60c05a-c687-30ec-160b-52a4993c65fd@linaro.org>
Date: Mon, 31 Oct 2022 16:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH] Add new build target 'check-spelling'
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221031074317.377366-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031074317.377366-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 08:43, Stefan Weil via wrote:
> `make check-spelling` can now be used to get a list of spelling errors.
> It uses the latest version of codespell, a spell checker implemented in Python.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This RFC can already be used for manual tests, but still reports false
> positives, mostly because some variable names are interpreted as words.
> These words can either be ignored in the check, or in some cases the code
> might be changed to use different variable names.
> 
> The check currently only skips a few directories and files, so for example
> checked out submodules are also checked.
> 
> The rule can be extended to allow user provided ignore and skip lists,
> for example by introducing Makefile variables CODESPELL_SKIP=userfile
> or CODESPELL_IGNORE=userfile. A limited check could be implemented by
> providing a base directory CODESPELL_START=basedirectory, for example
> CODESPELL_START=docs.
> 
> Regards,
> Stefan
> 
>   tests/Makefile.include       | 10 ++++++++++
>   tests/codespell/README.rst   | 18 ++++++++++++++++++
>   tests/codespell/exclude-file |  3 +++
>   tests/codespell/ignore-words | 19 +++++++++++++++++++
>   tests/requirements.txt       |  1 +
>   5 files changed, 51 insertions(+)
>   create mode 100644 tests/codespell/README.rst
>   create mode 100644 tests/codespell/exclude-file
>   create mode 100644 tests/codespell/ignore-words

Just wondering about this list...

> +++ b/tests/codespell/ignore-words
> @@ -0,0 +1,19 @@
> +buid

What is 'buid'? PPC-specific apparently.

> +busses
> +dout
> +falt
> +fpr
> +hace
> +hax
> +hda
> +nd

Apparently 'NIC info'...

> +ot

Is 'ot' MemOp?

> +pard
> +parm
> +ptd
> +ser
> +som
> +synopsys
> +te

Is that 'target endianness'?

> +toke

Where is 'toke'?

> +ue
Where is 'ue'?


