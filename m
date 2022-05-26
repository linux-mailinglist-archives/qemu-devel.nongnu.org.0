Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38BC534F05
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:19:16 +0200 (CEST)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCSR-0007de-P3
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCOc-0004Ze-So
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCOa-0000lS-8Y
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhrZ11HeZm0nrWO04SIinTgxuKQ74PuT9AIz/FEx9tQ=;
 b=Hs/wcgo7hwIQIeZZgevN95/LAGv39u9c2YFG7B3BPlYSbnqT/hF9ZYSlDd+VVGauG4H2NU
 JKopSekf1qEjNuKSs1kJKvdbAH7bE2annOhnA0odIjW95ue12w1IL1IvReVETeXecPBPdD
 CESOWyjntlSQfEaZ6hF6HOIfvKOqkLI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-jlJq5jAwPkKp2W6oWUuXYg-1; Thu, 26 May 2022 08:15:12 -0400
X-MC-Unique: jlJq5jAwPkKp2W6oWUuXYg-1
Received: by mail-ej1-f72.google.com with SMTP id
 i7-20020a170906850700b006fec53a78c3so781143ejx.1
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fhrZ11HeZm0nrWO04SIinTgxuKQ74PuT9AIz/FEx9tQ=;
 b=7XA/cNTgjZAAsrOBUHRzHF0H++h1Cg79sg0ll8ALZjR9M1NKI18rpQcbhuHVVSGFM9
 FSjxr5WXwJCP8o6NO8p4+U++UCOb2OLvSsCuCjpa//CxA5hhuXtgEoSdhsqS0Bu4Km00
 W7aws7AzkhOo93GZL/tLOwui/r5jBSkE2s/+jBhhZhBRjZzukso/Y7GrmVAToNW8rV8d
 n54s3st22TqlXY+lQMhloBbCH4cBQf+0TrdoZ6QQ+rWa/CXxmTwU6Hj/2+j7/j/zEMCd
 68250Jw2Rs2XKxdAfDwv1wVqKO7yFqumOLWfi9dI0qDVIAKUsNhPFr5GceMaOFEri5RX
 aZvQ==
X-Gm-Message-State: AOAM531/H+PfLU08Tn8eipMqv66GCjtZ1xjmjKwPKNxHiYkm8CBg0vvk
 P3LwM6NutCD8BUQhNFaxrzuDx4MtZjgV4NZE3R/0Zi640af50p/kLi4yAF/6hBiklTAgfwlImw+
 x9hD7Rat9QQ6uuD4=
X-Received: by 2002:a05:6402:705:b0:42b:dbc7:1b97 with SMTP id
 w5-20020a056402070500b0042bdbc71b97mr2648350edx.48.1653567311217; 
 Thu, 26 May 2022 05:15:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk50ihxAV6sPHdGb609XrTlByMAfCMGTo8wvk8pWTnQQwr1eCLmN43Qu7eZxXqZ37p3ieMUg==
X-Received: by 2002:a05:6402:705:b0:42b:dbc7:1b97 with SMTP id
 w5-20020a056402070500b0042bdbc71b97mr2648326edx.48.1653567310969; 
 Thu, 26 May 2022 05:15:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 a1-20020a50f0c1000000b0042be30c95fbsm89868edm.39.2022.05.26.05.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:15:10 -0700 (PDT)
Message-ID: <fdba616b-227a-8b75-dcb8-a7d168b806e1@redhat.com>
Date: Thu, 26 May 2022 14:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/9] tests: install "qemu" namespace package into venv
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-7-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> This patch adds the "qemu" namespace package to the $build/tests/venv
> directory. It does so in "editable" mode, which means that changes to
> the source python directory will actively be reflected by the venv.
> 
> This patch also then removes any sys.path hacking from the avocado test
> scripts directly. By doing this, the environment of where to find these
> packages is managed entirely by the virtual environment and not by the
> scripts themselves.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/Makefile.include                 |  1 +
>   tests/avocado/avocado_qemu/__init__.py | 11 +++++------
>   tests/avocado/virtio_check_params.py   |  1 -
>   tests/avocado/virtio_version.py        |  1 -
>   tests/requirements.txt                 |  1 +
>   5 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 052d7f56e9a..d13a3403e9f 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -110,6 +110,7 @@ quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
>   
>   $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>   	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
> +	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
>   	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>   	$(call quiet-command, touch $@)
>   
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 39f15c1d518..b656a70c55b 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -21,6 +21,11 @@
>   from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
>   from avocado.utils.path import find_command
>   
> +from qemu.machine import QEMUMachine
> +from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
> +                        tcg_available)
> +
> +
>   #: The QEMU build root directory.  It may also be the source directory
>   #: if building from the source dir, but it's safer to use BUILD_DIR for
>   #: that purpose.  Be aware that if this code is moved outside of a source
> @@ -35,12 +40,6 @@
>   else:
>       SOURCE_DIR = BUILD_DIR
>   
> -sys.path.append(os.path.join(SOURCE_DIR, 'python'))
> -
> -from qemu.machine import QEMUMachine
> -from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
> -                        tcg_available)
> -
>   
>   def has_cmd(name, args=None):
>       """
> diff --git a/tests/avocado/virtio_check_params.py b/tests/avocado/virtio_check_params.py
> index e869690473a..4093da8a674 100644
> --- a/tests/avocado/virtio_check_params.py
> +++ b/tests/avocado/virtio_check_params.py
> @@ -22,7 +22,6 @@
>   import re
>   import logging
>   
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>   from qemu.machine import QEMUMachine
>   from avocado_qemu import QemuSystemTest
>   from avocado import skip
> diff --git a/tests/avocado/virtio_version.py b/tests/avocado/virtio_version.py
> index 208910bb844..c84e48813a1 100644
> --- a/tests/avocado/virtio_version.py
> +++ b/tests/avocado/virtio_version.py
> @@ -11,7 +11,6 @@
>   import sys
>   import os
>   
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>   from qemu.machine import QEMUMachine
>   from avocado_qemu import QemuSystemTest
>   
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index a21b59b4439..0ba561b6bdf 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,6 @@
>   # Add Python module requirements, one per line, to be installed
>   # in the tests/venv Python virtual environment. For more info,
>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> +# Note that qemu.git/python/ is always implicitly installed.
>   avocado-framework==88.1
>   pycdlib==1.11.0

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


