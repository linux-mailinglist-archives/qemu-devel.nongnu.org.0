Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDC6E5A27
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:12:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofVa-0003v3-Mw; Tue, 18 Apr 2023 03:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pofVY-0003up-TU
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pofVX-00016S-DK
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681801926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1GpnM616yx4lGRhZQg2um50odqu2LVJAKgisLf2pIA=;
 b=I1vIelY1jdOjZB0A/aclIj+GU0BAJTO0Ns2P6Kiad2d4hTqWoZlAK/IWGnbTGJyQCle7v5
 OwxZ7JRROiNcPYPqw1TfXPc561SI8PqXGlAaS+wy92MzJFQdLQekmsMk6E5tyVCOMAwYTZ
 XCJi4DfJRy1eysiTbddbnofMnoggP3I=
Received: from mail-wm1-f72.google.com (209.85.128.72 [209.85.128.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-IyidO4plP62bXblGmm6n4w-1; Tue,
 18 Apr 2023 03:10:39 -0400
X-MC-Unique: IyidO4plP62bXblGmm6n4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 q19-20020a05600c46d300b003ef69894934so12644306wmo.6
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 00:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681801817; x=1684393817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S1GpnM616yx4lGRhZQg2um50odqu2LVJAKgisLf2pIA=;
 b=H6dM7UhQszgSk41wTPZq1CLJD1/5MQ53GNhvXbtbxQgKo6nj9edG35v/YJpCa93A/0
 /ZnFkihQvCL8iceKh8KoVM9qthyWPS8TxaizvrSF0I/QClp+pHkWTIC24BgLucWcLtEv
 R7286hXk+PCYlUj4drlHuI/q5cdh0rYFNtpGZ1obpxv4p2Wou42yqMeFjCSjbXqye9zz
 xweq9XKc+2emIsy4jUde4igGC9wMiLpjxkkAF/tUN/VKrWKD3ITeoQzuW2TkthKDZj6N
 UVdbMnF1OcNdWekMZfHlt4gp7f90vpm/FrRy/qOJGYLIY/nVHGp2heYgKeMnnBwSSpw5
 r9Lg==
X-Gm-Message-State: AAQBX9dBRFUlshg5/c2BcrgkdosYibqSkw73/WBjvXNfFOSYXZ0OHH7M
 sqkIaB0yNQMv/TrBnFqDeTl7VZjOqdFnf+ulrp1PrZrIop8Pnw6ZJqcqNhky1/x7Fdp5dtfFvo9
 gq7ecdBekVPmIHUw=
X-Received: by 2002:a05:600c:22c4:b0:3ed:88f5:160a with SMTP id
 4-20020a05600c22c400b003ed88f5160amr12990495wmg.11.1681801816931; 
 Tue, 18 Apr 2023 00:10:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350aq/0jXDkdKFsnsaPruyu+w/xmeuNrTbtzHR/bfrDN2UhyKMi1Mg1iM4UsfUqWCxer144/diA==
X-Received: by 2002:a05:600c:22c4:b0:3ed:88f5:160a with SMTP id
 4-20020a05600c22c400b003ed88f5160amr12990457wmg.11.1681801816551; 
 Tue, 18 Apr 2023 00:10:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b003f173a2b2f6sm4942331wms.12.2023.04.18.00.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:10:15 -0700 (PDT)
Message-ID: <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
Date: Tue, 18 Apr 2023 09:10:14 +0200
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We might need to revisit this --failfast logic, too. If I've got that right, 
failfast is now the default with the new system? So we might want to disable 
it by default again if GITLAB_CI is not set?

  Thomas


