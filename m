Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C8322D81
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:29:22 +0100 (CET)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZcn-0005Fo-NA
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEZbw-0004gJ-Pd
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEZbu-0003Jr-P6
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614094104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qn0g1xF9CfHJ6alQ2F+tAo6uL92uDOv0mlgAYYn1E7I=;
 b=bSBFB5QnKVMgOQSZKL4HkF41vsDQz880HXTWaPOFMCqdrAiYHVz+lnvs+Av3ior4tJPsTx
 yG1Ddznn7RynwHryIAs7tJSSG5J9dHcLR0T8vCPDkLNL9BWZI5xPVPb3GRfl8xl0/r4MDy
 j32Ke5JPDyeHMrgGk6G/qjmXWky4lDk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-r3ciXEHwO_eMNpdcYkM6Wg-1; Tue, 23 Feb 2021 10:27:22 -0500
X-MC-Unique: r3ciXEHwO_eMNpdcYkM6Wg-1
Received: by mail-ej1-f70.google.com with SMTP id ia14so5512599ejc.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qn0g1xF9CfHJ6alQ2F+tAo6uL92uDOv0mlgAYYn1E7I=;
 b=Inaz6lfm7n1Gn31jd6fYNVNtpspq87KpJ0GBfGIu6IDaB7QeD0sQSPY2TJZxShxwQ8
 rfEmfbWu4AF4MfTTYarlfzucmT43aE42WECpvfnBA7mpYc96x+R683ps4vGnd3gx5+IR
 SiuO9ZA7eR0g0n5trSrPRVBMnq07c+UQ+0su8xrt/jnPYxMK9zuC3J6H3CFgXyW9DG4a
 tQrRJXGGEdoZhoFbeBhA3ojLRfe2legCIJAQHIipmIeEAxt2YfOhJsxHNA0Yhlfr+PAT
 BzCBOQhAEQ2FMrl3kzeosZRGC58So9oOpv8ow/8iOGxrfwetYAEglxq1fPiapJL0xGs1
 xlZw==
X-Gm-Message-State: AOAM531k69KlIOg1R06ByEyw1aDldkqGX26IbVSvyTtKGedIfYXMorCM
 eCqdv4dlnSNHXg9mglBEVLkn9fR9Zvykj1SV1Po1Njc/pMmzyYZpJUElChY8/0FoNsuNoc+iW1Y
 8tjXi0bdAfp9kbrE=
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr28956905edt.130.1614094040631; 
 Tue, 23 Feb 2021 07:27:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV0/D8UiYkaGPXwlA4gE9WLi6K1zFbQMYd2kQ6PdwjH+LA4sEHvbD+QcUFjW6W2xH9Q+J4hw==
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr28956878edt.130.1614094040414; 
 Tue, 23 Feb 2021 07:27:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm15090321edk.11.2021.02.23.07.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:27:20 -0800 (PST)
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1fc95a8d-e1f6-ef77-99c6-6b6876af0637@redhat.com>
Date: Tue, 23 Feb 2021 16:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 10:58 PM, Cleber Rosa wrote:
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.  This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 204 ++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 3004da2bda..a9166c82a2 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -12,3 +12,207 @@
>  # strategy.
>  variables:
>    GIT_SUBMODULE_STRATEGY: recursive
> +
> +# All ubuntu-18.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-18.04-s390x-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'

Maybe this is too restrictive, we might want to test /master too.

> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc` check-tcg V=1


