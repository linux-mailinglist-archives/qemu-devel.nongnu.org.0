Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0F687CFB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYMV-0006Q6-HM; Thu, 02 Feb 2023 07:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNYLC-0005rg-MJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:23 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNYL9-0006Pf-M1
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:22 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so2144139fac.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 04:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D13s/WOk//jNtlm4GKZzufU8d045yx7/ryth/6v1bqE=;
 b=F1dFDg07zU5/xZuXhgoz9aDfdlRNol/gv8Igr6bzVxk5ECYQchvFu3WUItc+uhXNKA
 MtEML5vnK0cLZKPj5zIWyFKTQtcxaHMsafAg/iffx2WiSnvq7N3St9Yee+WpfWU9o7kF
 vy0UYy1lL3rjw4cyleZi+Sj281FcMEEhgG27c/OZjnPmD7EgneekF216N3NaGapDNghq
 azqvU0kSwAK/E0i/TTMjEXXR1HcTdmSjcsqesbtCwtXpPHC86Od+wNHmPKArtziNs2z9
 U6fJjpKB/lgIyf1CgeS0tub9/JcTzZW+MfpTUpAdLCR8LEeCD0IGZ0rDdo5HkdfTtcg3
 VyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D13s/WOk//jNtlm4GKZzufU8d045yx7/ryth/6v1bqE=;
 b=ugZgiXMuhpv94c1/sXXX3D5bOs/lUT0oM2cQGePPVVuyydOOrGQDysMcUJmDf6b4zG
 VNzQGHviKv+ynQ0olwULDb9wVD73qYvb1HoAj0xpM1YoSG0edd+ZUzlFuunvFeYaW0lU
 SnAfX+TePZP7K6tBuZKtPr0w+CkLtxZSXuaXGgIluKgJ6IoSk8z5CQ04/9yTfH4PK5/P
 SiJJ3HUuAIAQyNvUIT8v7gLwl1dZB/M45BVMHP2+C543qFMkew2z1nyqZotP54qK5o5z
 +v8tMzKPJ6KFOP7EfSguxQb1QuyRzXb5hnQ2hMRsF7JvnjMFDxszF42ksbNhY80w5Kun
 St4g==
X-Gm-Message-State: AO0yUKX0aqxqwwAKNmJio6ZjWma4qnGBViFqZ1IsThnyxuA8FddUUjRj
 4tDfm0XmIr88JdYb1mDpyJkfzA==
X-Google-Smtp-Source: AK7set8OJxwqM1pJFCNADemef8cr92pt11zvVs89nbTHUDzC+TyrQGNPm3j7sZxodQNE1JIY6Uo1Rg==
X-Received: by 2002:a05:6870:b008:b0:169:cbcc:25be with SMTP id
 y8-20020a056870b00800b00169cbcc25bemr810849oae.12.1675339516494; 
 Thu, 02 Feb 2023 04:05:16 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 nr9-20020a056870dc4900b00140d421445bsm8835330oab.11.2023.02.02.04.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 04:05:15 -0800 (PST)
Message-ID: <468b929f-3d2a-9f7d-4795-a27f3dea95e5@ventanamicro.com>
Date: Thu, 2 Feb 2023 09:05:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] tests/avocado: Invert parameter vs. tag precedence
 during setUp
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230120221500.4194-1-farosas@suse.de>
 <20230120221500.4194-2-farosas@suse.de>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230120221500.4194-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 1/20/23 19:14, Fabiano Rosas wrote:
> We currently never pass parameters to the avocado process via
> Makefile. To start doing so we need to invert the precedence between
> command line parameters and tags, otherwise a command line parameter
> would override values for all the tests, which is unlikely to be a
> common use-case.
> 
> A more likely use-case is to force certain values for the tests that
> have no tags. For instance, if a test has no 'arch' tags and therefore
> can run for all targets, one could possibly force it to run on a
> certain target with an arch=foo parameter.
> 
> This applies to the variables set during setUp(): arch, machine, cpu,
> distro_name, distro_version. Parameters used directly in tests or read
> via self.params.get are left unchanged.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tests/avocado/avocado_qemu/__init__.py | 32 +++++++++++++++-----------
>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 910f3ba1ea..a181cac383 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -240,12 +240,23 @@ def _get_unique_tag_val(self, tag_name):
>               return vals.pop()
>           return None
>   
> +    def _get_prop(self, name):
> +        """
> +        Infer test properties based on tags. If no tag is present,
> +        look for a command line parameter of the same name.
> +        """
> +        val = self._get_unique_tag_val(name)
> +        if not val:
> +            # If there's no tag, look for a command line
> +            # parameter. This allows the user to override any defaults
> +            # the caller of this function would choose if we were to
> +            # return None.
> +            val = self.params.get(name)
> +        return val
> +
>       def setUp(self, bin_prefix):
> -        self.arch = self.params.get('arch',
> -                                    default=self._get_unique_tag_val('arch'))
> -
> -        self.cpu = self.params.get('cpu',
> -                                   default=self._get_unique_tag_val('cpu'))
> +        self.arch = self._get_prop('arch')
> +        self.cpu = self._get_prop('cpu')
>   
>           default_qemu_bin = pick_default_qemu_bin(bin_prefix, arch=self.arch)
>           self.qemu_bin = self.params.get('qemu_bin',
> @@ -274,8 +285,7 @@ def setUp(self):
>   
>           super().setUp('qemu-system-')
>   
> -        self.machine = self.params.get('machine',
> -                                       default=self._get_unique_tag_val('machine'))
> +        self.machine = self._get_prop('machine')
>   
>       def require_accelerator(self, accelerator):
>           """
> @@ -529,15 +539,11 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
>       memory = '1024'
>   
>       def _set_distro(self):
> -        distro_name = self.params.get(
> -            'distro',
> -            default=self._get_unique_tag_val('distro'))
> +        distro_name = self._get_prop('distro')
>           if not distro_name:
>               distro_name = 'fedora'
>   
> -        distro_version = self.params.get(
> -            'distro_version',
> -            default=self._get_unique_tag_val('distro_version'))
> +        distro_version = self._get_prop('distro_version')
>           if not distro_version:
>               distro_version = '31'
>   

