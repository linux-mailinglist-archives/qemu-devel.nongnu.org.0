Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EE8525D56
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:29:00 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQfT-0003ow-Co
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQaL-0001X1-Vr; Fri, 13 May 2022 04:23:42 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQaK-0000iT-Bp; Fri, 13 May 2022 04:23:41 -0400
Received: by mail-ed1-x536.google.com with SMTP id d6so9084523ede.8;
 Fri, 13 May 2022 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=42AVf7fDem9auvjZmh5JZp6rpEVesHHUQ+TrNVFPu/A=;
 b=N6g6n8ked9f43eVKHOv3XAwSwYhhMzJ3TdIDFTCOh4x3dB5fsknTM2ooUSm+dTPHJT
 QYe8yX8d93NQvOQyCzXB+IndFaI/yFwkuXCuXMUHc8c0/l0m3DvaJAlOtdawt8AydLze
 iS9Vsdz5vvb8NxXYUxnoUIqbE+1IqBGsfJemYOHVIISMoivsQ2+vbxqlQQK0j5VtylX/
 YFGKRcRuF9YjrapWbqx9PNymOPKhtuCONNA8yiFRt2Iouy1pgwqScRgbTdw8z1pvsWsL
 i5aJBJBQzQ1DKFcn2JBTVwpSwlFS1EjB8sja34sM6F+IYsMHCUoKb1vPAcZaO9RaQtKJ
 1IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=42AVf7fDem9auvjZmh5JZp6rpEVesHHUQ+TrNVFPu/A=;
 b=kWee5E8FGqUyQ1CBux/RLDvP7ElXKnKIPjXTvcGfMfnDM+dXPFtemlgWi3BTOoEXcT
 1q3YUrinESLaKp/yFtrRQzibIpFZ400aYvJn2VZ5jcXy5xdtMqlQGXz2dutz5ASvhFyg
 17aVgkXHkn64ji8ghHG8kS7wGY4utZRI3sodRIwbecA5606pANnPkvPxRagvAqZsMrVD
 SXVdgsrwDpD80JP3lZLSmbh8sTcTYUS71M5Xx/hlnH8k+xYolB9ZnM1456lm2L1V0R2h
 li0TwvHivdu8ULuSZzrJI0InxXotpP3bbLOpKBHHwe2uUu9AVQmmFiO25O5tTa6BsLvn
 wtHQ==
X-Gm-Message-State: AOAM531uLOL8LsVpAnLaC27TlFQzzGSR75n7UDMJwp4/B5TtcqHDD27E
 ++X194J9U+ZRPpLk/cZoHHc=
X-Google-Smtp-Source: ABdhPJxVmMXFBIwLdb/HaHKsDOzNXDroT8OxLG0OmJd5GoxSctStJHACoQcO/ytmQVxQaMVzxCvFGA==
X-Received: by 2002:aa7:c1d0:0:b0:428:b439:99f5 with SMTP id
 d16-20020aa7c1d0000000b00428b43999f5mr19793723edp.316.1652430218267; 
 Fri, 13 May 2022 01:23:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 m29-20020a17090677dd00b006f3ef214ddbsm532776ejn.65.2022.05.13.01.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:23:37 -0700 (PDT)
Message-ID: <914fa697-2f24-fbd2-84cf-41661170ea8f@redhat.com>
Date: Fri, 13 May 2022 10:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 2/9] tests: add "TESTS_PYTHON" variable to Makefile
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-3-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/13/22 02:06, John Snow wrote:
> This is a convenience feature: $(PYTHON) points to the Python executable
> we were instructed to use by the configure script. We use that Python to
> create a virtual environment with the "check-venv" target in
> tests/Makefile.include.
> 
> $(TESTS_PYTHON) points to the Python executable belonging to the virtual
> environment tied to the build. This Python executable is a symlink to
> the binary used to create the venv, which will be the version provided
> at configure time.
> 
> Using $(TESTS_PYTHON) therefore uses the $(PYTHON) executable, but with
> paths modified to use packages installed to the venv.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/Makefile.include | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index ec84b2ebc04..146aaa96a00 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -89,6 +89,7 @@ TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
>   TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>   TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
>   TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
> +TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python
>   ifndef AVOCADO_TESTS
>   	AVOCADO_TESTS=tests/avocado
>   endif
> @@ -108,7 +109,7 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>               $(PYTHON) -m venv $@, \
>               VENV, $@)
>   	$(call quiet-command, \
> -            $(TESTS_VENV_DIR)/bin/python -m pip -q install -r $(TESTS_VENV_REQ), \
> +            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
>               PIP, $(TESTS_VENV_REQ))
>   	$(call quiet-command, touch $@)
>   
> @@ -126,7 +127,7 @@ FEDORA_31_DOWNLOAD=$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDIDATES))
>   # download one specific Fedora 31 image
>   get-vm-image-fedora-31-%: check-venv
>   	$(call quiet-command, \
> -             $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
> +             $(TESTS_PYTHON) -m avocado vmimage get \
>                --distro=fedora --distro-version=31 --arch=$*, \
>   	"AVOCADO", "Downloading avocado tests VM image for $*")
>   
> @@ -135,7 +136,7 @@ get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOW
>   
>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>   	$(call quiet-command, \
> -            $(TESTS_VENV_DIR)/bin/python -m avocado \
> +            $(TESTS_PYTHON) -m avocado \
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>               $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>   			--filter-by-tags-include-empty-key) \

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

