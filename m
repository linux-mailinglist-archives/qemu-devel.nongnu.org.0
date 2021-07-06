Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1296D3BDE9D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 22:47:46 +0200 (CEST)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ryr-0005jN-3D
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 16:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0rxT-000544-N7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0rxQ-0002Lf-KQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625604375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8pg0bWuTIT/xc5pcxZ7ywuzrRNoiCDGNqjPyOm3Nc0=;
 b=SFMOzrI3OcV3JUcMn63MZ15ntuPKdMnX3CVyY9Jb38zW4L30cPESfhCPq3+ysgIObiQ4Vp
 tdYf3pkPUf/GM2Xzpn9NIh0TGjGHiHGTtv5H20hKH8UjIjz/Rg3ulPe/U8uTZwxEUwO6U9
 48fQ9e1XM2CN/6I0GuzcwFU1jrtK1qQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-Ctv0pGl1Noyp_Omh2fdVuQ-1; Tue, 06 Jul 2021 16:46:13 -0400
X-MC-Unique: Ctv0pGl1Noyp_Omh2fdVuQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so105832wrs.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 13:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8pg0bWuTIT/xc5pcxZ7ywuzrRNoiCDGNqjPyOm3Nc0=;
 b=NhVdF3Oprqo59qdp7PwpS8PREME7AcBexfoAU4yf3R9fXIVol3AVbNA4zCdMlyjreg
 V7pEG5NsGmYtLjvtqnFHI8Edcb/nzciJDEZvP/4XjyiVw0vPY4+fXHcQvnNa1fbC2Rd5
 IIUpAL/n+wj2KKo3921VDWhdQMZjGZgc1Ox1bYb+9QRySKo3jLB9oJO9f4PXUK4Oes5S
 yEkxBz50FYLPJTEsAhdks5vHdFTjZBQOvTU1zNKC4g1rNgJe6uOVOlM8kw3s85dfILZP
 0385w0PIpsmdppcp7G/R13/a6SwbOtUO0Dpf+X7o3WXVoa3FZhoOtTfqOwtJmojfV+pa
 KnOQ==
X-Gm-Message-State: AOAM531ZQuLLNsMiZXpij/UCa48+tdu3c4d0+8vtGL9bNkoLsHwdh9It
 zP1KQ3MYBP5cKbevwx5VLZzWkFCeqeVS92EmsNRZhD8XY/ZFT+44YTZunHV2I7TzzN1kCQ/LvFk
 WfFcKkJlJqHoEtP0=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr25089615wri.66.1625604372337; 
 Tue, 06 Jul 2021 13:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQnBhyUFYkt189gCgIRrCQUhFSGeWccTiaZNGnWofHmvkqtGyrnoSOPrXqPGMmQS1eO46+nA==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr25089596wri.66.1625604372161; 
 Tue, 06 Jul 2021 13:46:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x17sm2415798wru.6.2021.07.06.13.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 13:46:11 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: allow control over tags during
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, alex.bennee@linaro.org,
 crosa@redhat.com, thuth@redhat.com, wainersm@redhat.com,
 qemu-devel@nongnu.org, philmd@redhat.com
References: <20210706190646.209440-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2bd3a82-3347-1cb2-f3f4-14bb1f5ede7a@redhat.com>
Date: Tue, 6 Jul 2021 22:46:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706190646.209440-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 9:06 PM, Willian Rampazzo wrote:
> Although it is possible to run a specific test using the avocado
> command-line, a user may want to use a specific tag while running the
> ``make check-acceptance`` during the development or debugging.
> 
> This allows using the TAGS environment variable where the user takes
> total control of which tests should run based on the tags defined.
> 
> This also makes the check-acceptance command flexible to restrict tests
> based on tags while running on CI.
> 
> e.g.:
> 
> TAGS="foo bar baz" make check-acceptance

I'm worried 'TAGS' is a bit too generic...
Maybe rename AVOCADO_TAGS -> AVOCADO_CMDLINE_TAGS and
TAGS -> AVOCADO_TAGS?

> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/devel/testing.rst |  7 +++++++
>  tests/Makefile.include | 10 ++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4e42392810..6e03c3449b 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -760,6 +760,13 @@ in the current directory, tagged as "quick", run:
>  
>    avocado run -t quick .
>  
> +It is also possible to run tests based on tags using the
> +``make check-acceptance`` command and the ``TAGS`` environment variable:
> +
> +.. code::
> +
> +   TAGS=quick make check-acceptance
> +
>  The ``avocado_qemu.Test`` base test class
>  -----------------------------------------
>  
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8f220e15d1..5869ab8a04 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -92,7 +92,11 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>  # Any number of command separated loggers are accepted.  For more
>  # information please refer to "avocado --help".
>  AVOCADO_SHOW=app
> -AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
> +ifndef TAGS
> +	AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
> +else
> +	AVOCADO_TAGS=$(addprefix -t , $(TAGS))
> +endif
>  
>  $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>  	$(call quiet-command, \
> @@ -125,10 +129,12 @@ get-vm-image-fedora-31-%: check-venv
>  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>  
>  check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> +	@echo "AVOCADO_TAGS $(AVOCADO_TAGS)"
>  	$(call quiet-command, \
>              $(TESTS_VENV_DIR)/bin/python -m avocado \
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> -            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> +            $(if $(TAGS),, --filter-by-tags-include-empty \
> +			--filter-by-tags-include-empty-key) \
>              $(AVOCADO_TAGS) \
>              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>              "AVOCADO", "tests/acceptance")
> 


