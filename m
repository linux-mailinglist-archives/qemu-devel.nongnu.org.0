Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AA534F0F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:26:00 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCYx-0006yQ-MG
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPV-00055c-Fa
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCPT-0000wi-QE
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Mk0SQYFx5Ql00nl+livy0QK/LmHtEjfQjmk02bhFWY=;
 b=OYCoiEM8x64VS2OR4rKCMVG4e9cgy9DJbn0PWU8IBKGD+ZFh3DR55AHUvvxoT4mFtnW9yZ
 6otXINEkWwe2HkjcxCHeyVlrKGvwde8Holjo5QH4a/5sww2iwexQ6BFsqmKt5X730WxPjv
 V+a/VBOmN4WoJrkGva0NeVL0FSZu6o8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-CtCDtL5wO7Goub2FaNnskA-1; Thu, 26 May 2022 08:16:09 -0400
X-MC-Unique: CtCDtL5wO7Goub2FaNnskA-1
Received: by mail-ej1-f69.google.com with SMTP id
 b17-20020a170906491100b006feec47b64bso778070ejq.5
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Mk0SQYFx5Ql00nl+livy0QK/LmHtEjfQjmk02bhFWY=;
 b=KpG8b0YXRrhOCx+ItiV5LsWPB8wQIqWCI2JtnVIChL4JEGODfyWlIgDjDhJTuybXyd
 yEO3WIyuDcim2Vi/8XXWlrKL88C/DQJITasBEi6UV2QYHKkwMQigOh1/5Of1pl+KtBAO
 7ft4hwTOT03cxtuU945inXlLQOhDUCb23EGQOlKMDUY/Ud06nP5nSRd+ddP7wCYWd+K9
 F5yh2fiOrEiKGcw0vDdgOZqLvBRFknHAfaeIWsFZD+WPqA3BL2h7ZcFpLz1mgQpwdoS6
 0Xkg/rxh1wGHYZuyzWetT0sTleEA11BxoRKkXprWRga+fmcpPkhmycUqR3ueC+h/pzTL
 WP9A==
X-Gm-Message-State: AOAM530cEEs23RcGJI+dqvyXcmocx3HUod5he3jreGgwx4uC/lBG8ZfV
 OegWt2sUv8QkUqGQpTDbzxU6geMRpPjdEifhuVXsTUuaOvaajgG+7eq7zGxdiCcmox2Z+VdhM00
 I2jz2xLjwX0oUyLo=
X-Received: by 2002:a05:6402:1007:b0:428:beb6:f483 with SMTP id
 c7-20020a056402100700b00428beb6f483mr39635719edu.391.1653567368735; 
 Thu, 26 May 2022 05:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR5JtgEY2Xppc+C7PaR6OJpY2QGka/wortFtQL6LfJhnaMu6SkhTC4PSbd3Pd4hJ/NDb37Tg==
X-Received: by 2002:a05:6402:1007:b0:428:beb6:f483 with SMTP id
 c7-20020a056402100700b00428beb6f483mr39635679edu.391.1653567368448; 
 Thu, 26 May 2022 05:16:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 c23-20020a50f617000000b0042b765c2448sm715934edn.80.2022.05.26.05.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:16:07 -0700 (PDT)
Message-ID: <54d84d4a-2c90-7211-3baa-6333c88a24f1@redhat.com>
Date: Thu, 26 May 2022 14:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/9] tests: add quiet-venv-pip macro
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-6-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/26/22 02:09, John Snow wrote:
> Factor out the "test venv pip" macro; rewrite the "check-venv" rule to
> be a little more compact. Replace the "PIP" pseudo-command output with
> "VENVPIP" to make it 1% more clear that we are talking about using pip
> to install something into a venv.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/Makefile.include | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 839ffde876a..052d7f56e9a 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -104,13 +104,13 @@ else
>   	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
>   endif
>   
> +quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
> +    $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
> +    "VENVPIP","$1")
> +
>   $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
> -	$(call quiet-command, \
> -            $(PYTHON) -m venv $@, \
> -            VENV, $@)
> -	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
> -            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
> +	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
> +	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>   	$(call quiet-command, touch $@)
>   
>   $(TESTS_RESULTS_DIR):

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


