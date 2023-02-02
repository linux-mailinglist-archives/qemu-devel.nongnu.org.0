Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499C687CDD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:07:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYMf-0006tE-0s; Thu, 02 Feb 2023 07:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNYLS-0005uH-Bj
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:48 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNYLP-0006jw-4w
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:37 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 14-20020a9d010e000000b0068bdddfa263so402111otu.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qjwgNSv7qB0ZYqU1kQjb6mrC/HbvbtVtPu3pyV0E3+E=;
 b=m91WHQsB/rDWFmJEqRm20Q38oMLTCjtbS4tiQqyEQaLQ2XpKVkdgdjFJSN0OlcZu+4
 JAVEMnBOTqRyfwibLACPgtcNADsRJd5HFbkZji/uA7Jen2+crGwt9Dm+b9TFSJh9H6VG
 6DnVHXCg35ILwDL3NLPfeKPJdrJAL3qh3pBzDeGKVdc3ksjdf2Ec9QdB3bp+9ilAT46L
 DXC8+ZfB6OIMhBFMFe8YsJwR5LfGKBiYA6FFmC79Tpcp+kz/+KuXG6PXsHNwvaCGKynI
 vc4Z3sraJOzpYYbOKvIfECGy5prvhlKd0r7FiMJDnhvG/7Wvq9dYSwfyLywJrl70YcbW
 5Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qjwgNSv7qB0ZYqU1kQjb6mrC/HbvbtVtPu3pyV0E3+E=;
 b=4ax+EXCl+LH3ycHFZcwuYJzyOaLHJ2iDoUiuZjnLycMxNrV6jsvL6fvBQ6qIunWCf1
 JXF/P5meacvHDoOZWbBwGTmfGQXHcgS3AEI74LNB7+jgay+obkHSQsnt9tzNScx6CgkW
 vpWFjXxAwo2iK1KDCsJCd4U9ll0GT7B/24j/oJ/DJloPn7jSyGZPv+GETOUpvUR+7Ryh
 03FAVVtOxORzvDKmcJQ+HOIVSlHOlajcZnrzzfn/UrSYjLEYA4kKXpoLjANHLprsPVtg
 0uru9pJViyAiG2wp4hSsaWijhWLT3SH1NxlGI38GQ4k5+aF2HW55OlPPOr4cRsvhp9ts
 qEOA==
X-Gm-Message-State: AO0yUKWgvlVEWzbskMTnrXZ2MGfNaczcDRQUG36ULi3i5Pn4yLaR6Rvl
 tVboPVXIMzF/RnAkERJy3Yupvg==
X-Google-Smtp-Source: AK7set9Ih3XEFg+q9b/7J83KlWcsDdNlSi0ftZoP8dZs2m772kaLQ3sJSm+Tvxbqn0jQh50Rmq6A7w==
X-Received: by 2002:a05:6830:14cc:b0:68b:d583:dd with SMTP id
 t12-20020a05683014cc00b0068bd58300ddmr3373708otq.30.1675339533801; 
 Thu, 02 Feb 2023 04:05:33 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a9d58ca000000b006865223e532sm2951359oth.51.2023.02.02.04.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 04:05:33 -0800 (PST)
Message-ID: <43db0a17-b347-7eac-89b1-522ec07059ea@ventanamicro.com>
Date: Thu, 2 Feb 2023 09:05:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] tests/avocado: Allow passing command line parameters
 via Makefile
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20230120221500.4194-1-farosas@suse.de>
 <20230120221500.4194-3-farosas@suse.de>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230120221500.4194-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 1/20/23 19:15, Fabiano Rosas wrote:
> Add support for the 'avocado run' "-p" option, which allows us to pass
> parameters in the form key=value to be applied to all tests selected
> for a given run. This is useful to force generic tests to use a
> specific machine, cpu or qemu-binary where otherwise the defaults
> would be used.
> 
> E.g.:
>   $ make check-avocado AVOCADO_PARAMS="machine=virt arch=riscv64"
> 
>   <runs all tests replacing machine and arch in those that do not have
>    these parameters already set via tags>
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tests/Makefile.include | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9422ddaece..f92e730aa0 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -107,6 +107,10 @@ else
>   	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
>   endif
>   
> +ifdef AVOCADO_PARAMS
> +	AVOCADO_CMDLINE_PARAMS=$(addprefix -p , $(AVOCADO_PARAMS))
> +endif
> +
>   quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
>       $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
>       "VENVPIP","$1")
> @@ -144,7 +148,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>               $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>   			--filter-by-tags-include-empty-key) \
> -            $(AVOCADO_CMDLINE_TAGS) \
> +            $(AVOCADO_CMDLINE_TAGS) $(AVOCADO_CMDLINE_PARAMS) \
>               $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>               "AVOCADO", "tests/avocado")
>   

