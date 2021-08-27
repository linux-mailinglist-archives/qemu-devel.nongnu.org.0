Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11913F95D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 10:15:04 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJX0s-000471-7w
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 04:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJWZW-0006n2-Ou
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJWZU-00041a-Pt
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630050400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1+766IKlosmDMPa4Iwd38qCNWBmRrgY8zeAhM+NeC8=;
 b=FiVUYv+cdos/CHjXJF9EvqfVivHZ1PYQr4gDU8rasCKstCpSD8Dm4Lls3eWFj0Tg6l/AnC
 QnchtHtm2TK1gQWT6wbEbePrM1zPSqQYtJHJzmlwAZKcyP2dDE49X/Xu2Hhk/BAd6alnCZ
 yX4bnlKZ/3Qjg189E+x2Lo59aTnR60A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-bk8C09llOFW19GuDpOsDYQ-1; Fri, 27 Aug 2021 03:46:38 -0400
X-MC-Unique: bk8C09llOFW19GuDpOsDYQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n10-20020a5d660a0000b02901551ef5616eso1586934wru.20
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 00:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1+766IKlosmDMPa4Iwd38qCNWBmRrgY8zeAhM+NeC8=;
 b=bbKmep+Dl6X9/9sOtnV962C5fu7sTdM/0q/R7TveQiFrtCFp/zu/WPOg+8XPzb2n4T
 Q7imIP/VqYHIgt5VOrRgsyE4fHkRyzJQoU5T7iNfCp0cfY+97tRfmUuR1sbZryxYnmz3
 bzzwtmLKkq3fFElWRiee2y5UpHmyrIctf/avjl5SkY4ezJdysevlYdrrjCchGSd23fy4
 9HucL63UQTJJZtACXV5lAThwsvFrkd2rbmhoy669D4VtGwmcEESoiJdmrHvIwXRswoWr
 mkbcCtEdzhsONGIICybG3l6sIcC4qx4q/HVQodBL4NTH1ps3x9KC1iLKwULrEjwd9/4q
 e5iw==
X-Gm-Message-State: AOAM532RReiBc/FsYB2VnJflpEXfwu5R8TcSJkWgrICbE3b+Us8hWvz5
 LY5zZdSM+uenoE4pOvqPUjDF61cb2fIz2D9K4CmcG727zXjntmCOj0PgO4NuoGxBWCm6KFdAi5h
 BSDHidJL/4HfmFIo=
X-Received: by 2002:adf:a29c:: with SMTP id s28mr8396826wra.318.1630050396903; 
 Fri, 27 Aug 2021 00:46:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqWisUnNr5Ys/DX/wG/tHaeA6M1zqMbEDQT2/9Hmi9r3kDEcanJNWfNbj7iEJzzKvhXiBy/w==
X-Received: by 2002:adf:a29c:: with SMTP id s28mr8396810wra.318.1630050396710; 
 Fri, 27 Aug 2021 00:46:36 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-148-182.46.114.pool.telefonica.de. [46.114.148.182])
 by smtp.gmail.com with ESMTPSA id r4sm4204225wmq.10.2021.08.27.00.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 00:46:36 -0700 (PDT)
Subject: Re: [PATCH v3] tests/acceptance: allow control over tags during
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, f4bug@amsat.org,
 philmd@redhat.com, crosa@redhat.com, alex.bennee@linaro.org,
 qemu-devel@nongnu.org, wainersm@redhat.com
References: <20210713210111.173349-1-willianr@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0a55ff1b-122d-3cbb-0070-942cac8bd7e0@redhat.com>
Date: Fri, 27 Aug 2021 09:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713210111.173349-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/07/2021 23.01, Willian Rampazzo wrote:
> Although it is possible to run a specific test using the avocado
> command-line, a user may want to use a specific tag while running the
> ``make check-acceptance`` during the development or debugging.
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
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   docs/devel/testing.rst | 14 ++++++++++++++
>   tests/Makefile.include | 12 +++++++++---
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4e42392810..a81b44cf18 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -760,6 +760,20 @@ in the current directory, tagged as "quick", run:
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
> +Note that tags separated with commas have an AND behavior, while tags
> +separated by spaces have an OR behavior. For more information on Avocado
> +tags, see:
> +
> + https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
> +
>   The ``avocado_qemu.Test`` base test class
>   -----------------------------------------
>   
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index e4dcb17329..0ce331f9a9 100644
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
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


