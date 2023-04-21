Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA06EA3CD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:25:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkC0-0001sz-9Y; Fri, 21 Apr 2023 02:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppkBt-0001r5-DP
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppkBq-00036u-WE
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682058254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkgaPyJpN8gdRqhrI5pRo7nJc6v2E2P70vuPYgvrJ3I=;
 b=ae5v1DUChqjgjWiHS47gXYO6rY7NqtGKuDnH1VDhbVmXhFEuIyMtZlppjIjmcN893mT+EK
 vQfOZHtbtTr9DqFbBC3SltMRLYlO8Gffb2o6wsAO17YPCEkPA9h1BwVfy6LtNFRRyi+1HM
 CTjPI+ODzFfdlVPY557PGCCUHEHBYhw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-OuO1O145PQKc0LLI4mXu1Q-1; Fri, 21 Apr 2023 02:24:13 -0400
X-MC-Unique: OuO1O145PQKc0LLI4mXu1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5069f2ae8eeso6183485a12.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682058252; x=1684650252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkgaPyJpN8gdRqhrI5pRo7nJc6v2E2P70vuPYgvrJ3I=;
 b=Fe6rjZCGgHRlk02MDyhEPP3PtfGq5prarzMkv/e0/8PoFYRqNQGZEERbXT4V2R3oke
 Z/i8/tA0CQ06o30j0bb5xogqGhjdDzQ/T8aYyoWA7fhR2h4TEER8IFoPu0N4FpGlVLsX
 g2UafgeY0BoBHJVrWIJhuygRYhkb0fdU1BEo8vgPK4CdTxaIUJBQ1Y1t58Ig9WaJFmEs
 /H6t/b6t/WbfMiW56iq+Hpn9Cnxtx/R4eCXbXzBsC0efpgzc+IBdyw9cy4FTLYA11xRj
 vD6uG02wxBXEMWuiyMA1+0Bo4T1bWOAStLguQQ8VLdTSqdyZ8NdSHUvtOZfNL/isC95N
 owsQ==
X-Gm-Message-State: AAQBX9da6gBP2R1XUJk4So3KAe3czw3p9vHb4suO1MUSAbKHc8jf+oOk
 LQQj8+vuaQ7XryeSU/ISu74bja6l09H/def8V8A3qrrMemM2WMgrRxGNfGWslsnirwo26DfPBqo
 f7b9mHZ+EdtvlZig=
X-Received: by 2002:a17:907:7851:b0:94e:f9ad:5775 with SMTP id
 lb17-20020a170907785100b0094ef9ad5775mr1392176ejc.12.1682058252064; 
 Thu, 20 Apr 2023 23:24:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z2/ypc2gCWoZ0ZZaIEGLi6oFW06peLT4rcFXbMDB12atsN82zyaTsV9ZKhFGohytOLw0El9A==
X-Received: by 2002:a17:907:7851:b0:94e:f9ad:5775 with SMTP id
 lb17-20020a170907785100b0094ef9ad5775mr1392149ejc.12.1682058251704; 
 Thu, 20 Apr 2023 23:24:11 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 15-20020a170906058f00b0095708428cdcsm720924ejn.6.2023.04.20.23.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:24:11 -0700 (PDT)
Message-ID: <8724e7f9-92f9-cc38-cd37-be416286b65c@redhat.com>
Date: Fri, 21 Apr 2023 08:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230417134321.3627231-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/04/2023 15.43, Alex Bennée wrote:
> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> 
> Avocado version 101.0 has a fix to re-compute the checksum
> of an asset file if the algorithm used in the *-CHECKSUM
> file isn't the same as the one being passed to it by the
> avocado user (i.e. the avocado_qemu python module).
> In the earlier avocado versions this fix wasn't there due
> to which if the checksum wouldn't match the earlier
> checksum (calculated by a different algorithm), the avocado
> code would start downloading a fresh image from the internet
> URL thus making the test-cases take longer to execute.
> 
> Bump up the avocado-framework version to 101.0.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
> 
> ---
> v2
>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
> ---
>   tests/Makefile.include | 18 +++++++++++-------
>   tests/requirements.txt |  2 +-
>   2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9422ddaece..a4de0ad5a2 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>   # download all vm images, according to defined targets
>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>   
> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
> +
>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> -	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m avocado \
> -            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> -			--filter-by-tags-include-empty-key) \
> -            $(AVOCADO_CMDLINE_TAGS) \
> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
> +	$(call quiet-command, 							\
> +            $(TESTS_PYTHON) -m avocado 						\
> +            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) 	\
> +            $(if $(AVOCADO_TAGS),, 						\
> +			--filter-by-tags-include-empty 				\
> +			--filter-by-tags-include-empty-key) 			\
> +		--max-parallel-tasks $(JOBS_OPTION:-j%=%) 			\
> +            $(AVOCADO_CMDLINE_TAGS) 						\
> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 			\
>               "AVOCADO", "tests/avocado")
>   
>   check-acceptance-deprecated-warning:
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..a6f73da681 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,5 +2,5 @@
>   # in the tests/venv Python virtual environment. For more info,
>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>   # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework==88.1
> +avocado-framework==101.0
>   pycdlib==1.11.0

Reviewed-by: Thomas Huth <thuth@redhat.com>


