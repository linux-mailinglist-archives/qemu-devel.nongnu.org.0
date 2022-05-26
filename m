Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B61534F80
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:43:11 +0200 (CEST)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCpa-0006dQ-8B
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCO9-0004Ao-F9
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCO6-0000O3-OX
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h48iXr/gim/tB6eJkmx01g/AGPpVEukJ5QtBByW3d7s=;
 b=FzRNplr09PICEZV7xvaC/hUasMcEmmCms/WQMF7IXxk078z+H3GvT+g+sLyl18SzUFsrwe
 Zjue/y7SKZTSbgbWsU/BCiIZScVSu3Czrps/ilLr1tPQ9VP0BggLzafm+Wz5dPczNPBfZn
 wlvzUjMrSlON+n7A1X/my1WaOJMZ9N0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-Wp3XmGQ0NTm-7wopOQ0oPA-1; Thu, 26 May 2022 08:14:43 -0400
X-MC-Unique: Wp3XmGQ0NTm-7wopOQ0oPA-1
Received: by mail-ed1-f72.google.com with SMTP id
 j7-20020a056402238700b0042b9c2e9c64so936063eda.19
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h48iXr/gim/tB6eJkmx01g/AGPpVEukJ5QtBByW3d7s=;
 b=0wxA2g12DSHYwU7gUiK8UxVEExiyqJOwFVUZgHasKA10t2WhAIoTIw1g+sekjmQDtD
 Nu/YaKH13YmldyZwS4uPg8Qb6x55mdJ09ukcAXIp4LGhnV/9NifGYLJAisKbtkhSa/dz
 ljmb31MKYvDuxYf/zTx7wC+JG6wgpff2I2j+fAvaHBK0ia5aQNMWOT1+eQLMkomR5pD9
 WDRlUEfVwmC+fPSkSr37ZErVVLmGLzs9yGmfKKXIGQnnd8kU+cgOj0le3W/rsk8/kOss
 i2UGw+M/PRCyJ80hucAIya1OMuX0HetgsNRufo3wD22YrrVQ4RKK6olTtICgp1jGz4fj
 N0OA==
X-Gm-Message-State: AOAM530Oti23KNnnfRDuAGHr3Q/9/oTVqboFwgcMidEVOyL4cnMxX6l3
 dAhQ1eunXPVSp5uatg002Du2Sr+DfauU7tn0UWifv7J+0quvbOKYqu4c9rNDExuXNu1W3r7u8xg
 cz1W0lXyM9w9MhWs=
X-Received: by 2002:a05:6402:88d:b0:42b:d663:a05 with SMTP id
 e13-20020a056402088d00b0042bd6630a05mr4326004edy.254.1653567282548; 
 Thu, 26 May 2022 05:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV2zeW+tLzVCItp9LeoUk1vqEFflZ/vikgn9bziLQhE5giI4PYykZsAxu/ueQRnU7iapRJow==
X-Received: by 2002:a05:6402:88d:b0:42b:d663:a05 with SMTP id
 e13-20020a056402088d00b0042bd6630a05mr4325997edy.254.1653567282342; 
 Thu, 26 May 2022 05:14:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 d4-20020a50e404000000b0042617ba63c4sm724525edm.78.2022.05.26.05.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:14:41 -0700 (PDT)
Message-ID: <319df99e-42d8-64dd-fbe8-a6f9311f3630@redhat.com>
Date: Thu, 26 May 2022 14:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 9/9] tests: run 'device-crash-test' from tests/venv
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-10-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220526000921.1581503-10-jsnow@redhat.com>
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
> Remove the sys.path hacking from device-crash-test, and add in a little
> user-friendly message for anyone who was used to running this script
> directly from the source tree.
> 
> Modify the GitLab job recipes to create the tests/venv first, then run
> device-crash-test from that venv.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml |  8 +++++---
>   scripts/device-crash-test  | 14 +++++++++++---
>   2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index e9620c30748..fde29c35aa3 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -110,7 +110,8 @@ crash-test-debian:
>       IMAGE: debian-amd64
>     script:
>       - cd build
> -    - scripts/device-crash-test -q ./qemu-system-i386
> +    - make check-venv
> +    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
>   
>   build-system-fedora:
>     extends: .native_build_job_template
> @@ -155,8 +156,9 @@ crash-test-fedora:
>       IMAGE: fedora
>     script:
>       - cd build
> -    - scripts/device-crash-test -q ./qemu-system-ppc
> -    - scripts/device-crash-test -q ./qemu-system-riscv32
> +    - make check-venv
> +    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
> +    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
>   
>   build-system-centos:
>     extends: .native_build_job_template
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index a203b3fdea2..73bcb986937 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -33,10 +33,18 @@ import re
>   import random
>   import argparse
>   from itertools import chain
> +from pathlib import Path
>   
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
> -from qemu.machine import QEMUMachine
> -from qemu.qmp import ConnectError
> +try:
> +    from qemu.machine import QEMUMachine
> +    from qemu.qmp import ConnectError
> +except ModuleNotFoundError as exc:
> +    path = Path(__file__).resolve()
> +    print(f"Module '{exc.name}' not found.")
> +    print("  Try 'make check-venv' from your build directory,")
> +    print("  and then one way to run this script is like so:")
> +    print(f'  > $builddir/tests/venv/bin/python3 "{path}"')
> +    sys.exit(1)
>   
>   logger = logging.getLogger('device-crash-test')
>   dbg = logger.debug

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Even though I'd still prefer the venv to be setup early (so the 
check-venv change in buildtest.yml and the friendly message in the 
script will go away), this is a step in the right direction.

Paolo


