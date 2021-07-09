Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D894D3C29BC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 21:33:38 +0200 (CEST)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1wFk-0002YI-V0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 15:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m1wEu-0001qd-EM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 15:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m1wEq-0006Kp-K2
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 15:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625859158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UiE2nL7t53iBqQXPgaFnWRFaHuFM7Ro9tJ0rYSnJXtc=;
 b=h+o+700eYH0WzX3M9JAPbaPV1zzK3PDE5kstQEqzXFXpZ5fJmDONqegOyTaV0MutzYDpYQ
 cgN4EI1u/LALug2rFwwrlQ183rcCoFyaeSjinWxYB8vMn/Db6tvaqqkkFOflFWUBLRfdud
 E0TJ0qIgqzT7bCjjNs9wnSyLS7sQH0M=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-5WIjCLj2ODmD-60RSNirLA-1; Fri, 09 Jul 2021 15:32:36 -0400
X-MC-Unique: 5WIjCLj2ODmD-60RSNirLA-1
Received: by mail-pl1-f198.google.com with SMTP id
 x15-20020a170902e04fb02900f5295925dbso3867104plx.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 12:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UiE2nL7t53iBqQXPgaFnWRFaHuFM7Ro9tJ0rYSnJXtc=;
 b=bMYCFhHJhUmj45+AQ29FkJZQZWE5vq68RFB2EiIlJP3/ueUlbyAXsYUeKvIPInsBos
 uL1ZlSlGjKItk25sFMMr2eRnl1AxMqKhgzQusYPe0fWzVLOPtQcZ/VUMaoK/inA6sF5g
 WP4yRAdGI5wvcym4URdRlvPMUys5DDNDPKjn/rWLQThG/lj8RNdN8AM0hNPUqjIsIYRv
 mSXImlUSAzR+6kVEV5BdIf5NVwocsku+SZBprCzhUGo/rMUS6AP6T+HZLZFFDfxRRzbs
 JVV3AG7jKU6WQycePOD78sqpCWccupq58FwGTUzqVgifBXpiiS8DXKwERbKDQBr5bluc
 oRIw==
X-Gm-Message-State: AOAM530bPDY+bNP0hm0hajYtdL7PGS1F4G7lYnV6HfxEfnqZP+CFTtYT
 +Doa5XcYQ5X6miHcr8y5OXMAVfWzJO74hChWXmxfwSsXCXwzWIYiCftj957ww++k13gMzA2Ko/1
 MHWjryHkn4N9n3Vg=
X-Received: by 2002:a63:c147:: with SMTP id p7mr15474814pgi.415.1625859155277; 
 Fri, 09 Jul 2021 12:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrWWuhF54XbrzpsUlPmLIVdZv6Arf7E5LcTyhTxMNUXSwQT/dnnzt0J+rhYmGrUKVyS8JDYw==
X-Received: by 2002:a63:c147:: with SMTP id p7mr15474795pgi.415.1625859155050; 
 Fri, 09 Jul 2021 12:32:35 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id e24sm7094399pfn.127.2021.07.09.12.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 12:32:34 -0700 (PDT)
Subject: Re: [PATCH v2] tests/acceptance: allow control over tags during
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com, crosa@redhat.com,
 philmd@redhat.com, f4bug@amsat.org
References: <20210707152454.246519-1-willianr@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a10abbac-4ea1-d2fc-daae-da8a8e0f151c@redhat.com>
Date: Fri, 9 Jul 2021 16:32:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210707152454.246519-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Reply-To: wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 7/7/21 12:24 PM, Willian Rampazzo wrote:
> Although it is possible to run a specific test using the avocado
> command-line, a user may want to use a specific tag while running the
> ``make check-acceptance`` during the development or debugging.
I always wanted that feature, thanks for implementing it!
>
> This allows using the AVOCADO_TAGS environment variable where the user
> takes total control of which tests should run based on the tags defined.
>
> This also makes the check-acceptance command flexible to restrict tests
> based on tags while running on CI.
>
> e.g.:
>
> AVOCADO_TAGS="foo bar baz" make check-acceptance

If I run `AVOCADO_TAGS="machine:malta arch:mips" make check-acceptance` 
it is going to get the tests with 'machine:malta' *or* 'arch:mips' tags, 
whereas with AVOCADO_TAGS="machine:malta,arch:mips" it gets those with 
'machine:malta' *and* 'arch:mips', i.e., the semantic is different. I 
think it deserves a mention in the docs/devel/testing.rst, maybe linking 
to Avocado's doc [1] as well.

[1] 
https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html

>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/devel/testing.rst |  8 ++++++++
>   tests/Makefile.include | 12 +++++++++---
>   2 files changed, 17 insertions(+), 3 deletions(-)

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4e42392810..f6e4fc08a7 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -760,6 +760,14 @@ in the current directory, tagged as "quick", run:
>   
>     avocado run -t quick .
>   
> +It is also possible to run tests based on tags using the
> +``make check-acceptance`` command and the ``AVOCADO_TAGS`` environment
> +variable:
> +
> +.. code::
> +
> +   AVOCADO_TAGS=quick make check-acceptance
> +
>   The ``avocado_qemu.Test`` base test class
>   -----------------------------------------
>   
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8f220e15d1..d464f06e4a 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -92,7 +92,12 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>   # Any number of command separated loggers are accepted.  For more
>   # information please refer to "avocado --help".
>   AVOCADO_SHOW=app
> -AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
> +ifndef AVOCADO_TAGS
> +	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
> +						 $(filter %-softmmu,$(TARGETS)))
> +else
> +	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
> +endif
>   
>   $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>   	$(call quiet-command, \
> @@ -128,8 +133,9 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>   	$(call quiet-command, \
>               $(TESTS_VENV_DIR)/bin/python -m avocado \
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> -            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> -            $(AVOCADO_TAGS) \
> +            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> +			--filter-by-tags-include-empty-key) \
> +            $(AVOCADO_CMDLINE_TAGS) \
>               $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>               "AVOCADO", "tests/acceptance")
>   


