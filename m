Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266EA439826
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:09:43 +0200 (CEST)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0fV-0006io-Tv
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0d8-0003hm-N4
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0d2-0003aY-24
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KO+Plb/8NUfGvbclsrErOlSEb2MH4gIXxdqzH/ARO1o=;
 b=IqBF73ZkxAj6pRVSyTXDjZtegIVhG+PkodD9/wqWjYJSbGF04fr9XXDb/Bw2k9NgpR1kv/
 O07wSEljugWVgRKtlrfisaDTQHXsAfI0vPp6uzzV96E+TzxScQrXnvCQL3SfJUCW+5z8XM
 CJc4hoony2qSRRDC4VMjEeSqJ0R6kbU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-ZxAZavhsMveuORMnGpeXoQ-1; Mon, 25 Oct 2021 10:06:53 -0400
X-MC-Unique: ZxAZavhsMveuORMnGpeXoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so3270951wri.11
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KO+Plb/8NUfGvbclsrErOlSEb2MH4gIXxdqzH/ARO1o=;
 b=cHkhPRMIag/kIb/inlNVLXNwwDNJSBabKPpGUpjzMXrW9L1znJj3fow9+IAuVZlSMf
 xeKmreaCdWM0ZqPFMGOzTFojMW17aNvnLBRHevAg+Uvm2beJGblA6XRwtHXdfu4Ltcj7
 bEwiTjZTuWLEhBZET2eKmR8xrvdP/ZPY5EwmqrPkVOlH5k0iEapqn1pR/bMble3vBn1x
 Dy5COTA/nlkm6gO9YuCjLN3NU+e5M+HLmvLuy2AjCcXHw7bD2XsiUgScdTkzlUcDTUY8
 xF4JQeNq7uIpAFEW0PFVANAPWcmGboNNHzNJ6YMjPa2wRZseeABrowx06ppWIABcXaBB
 sG8g==
X-Gm-Message-State: AOAM531PaburxlaIt3VzgXgjfRe0iGrvLLTLvFhhisRdaqlWjcr9f6XD
 rIOtce5hS4VanXcAwBhYXeOLAq47ysZL8aJrec7zMiH6KXcbp82Mqcxz90evOXz+q1eIFs4CmSN
 FEQl6U7ZcjFWxCoo=
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr31443526wmb.69.1635170811710; 
 Mon, 25 Oct 2021 07:06:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7S9u5S8uFr1+QxXuOW2ywT8C75AESCu/YeWJ1g7jhnw3lWn3XHA2pX/X8GILC2T9SkUIcAQ==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr31443460wmb.69.1635170811334; 
 Mon, 25 Oct 2021 07:06:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k17sm21186923wmj.0.2021.10.25.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:06:50 -0700 (PDT)
Message-ID: <6498c6ec-2b41-f10c-a993-c1d52bd9bf92@redhat.com>
Date: Mon, 25 Oct 2021 16:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH-for-5.2? 4/5] tests/acceptance: Only run tests tagged
 'gating-ci' on GitLab CI
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-5-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20201102144245.2134077-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/20 15:42, Philippe Mathieu-Daudé wrote:
> To avoid breaking our CI each time a test is added, switch from the
> "run all but disable some" to "only run the tagged tests on CI".
> This way we can add a test to the repository, and promote it to
> 'gating-ci' once it is proven stable enough.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> 
> TODO: where to add documentation?
> 
> - docs/devel/testing.rst (too big, split?)
> - tests/acceptance/README.rst
> 
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 3a0524ce740..f39ba760c17 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -126,7 +126,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>              $(TESTS_VENV_DIR)/bin/python -m avocado \
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>              --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> -            $(AVOCADO_TAGS) \
> +            $(AVOCADO_TAGS) -t gating-ci \
>              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>              "AVOCADO", "tests/acceptance")

self-NAck, this has to be added in acceptance_test_job_template
in .gitlab-ci.d/buildtest-template.yml, not in tests/Makefile.include.


