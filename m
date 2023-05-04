Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43D16F7184
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpV-0001J3-0X; Thu, 04 May 2023 13:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pucad-0003YL-4H
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pucab-0002v1-2V
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683220675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4xbHJm1ERjpqIqutCi0zmoiu/WRR60yK7nPPAyz55o=;
 b=JIn5Xn5PALnRCunP52zykZCJ6AFYhkINo3Nb+pGCv6tUtkpMLiuquJuYuDejsvUnC08xbK
 Cj3yLEQdtlOzhMUXRIm4iM0Q5wAn6L2c1q5PBL9GyoyhH+rLqUBgKBSOzlPlOLhfPH3AzI
 TkqnjQf2So6u+TQ1UJsYS34mYO0q6x4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-M52A0ul6PDe-qz8e80SYtA-1; Thu, 04 May 2023 13:17:54 -0400
X-MC-Unique: M52A0ul6PDe-qz8e80SYtA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f321e60feaso3492325e9.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683220673; x=1685812673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4xbHJm1ERjpqIqutCi0zmoiu/WRR60yK7nPPAyz55o=;
 b=VSDR/yWIxK/1ykTvtHAhDizpuCmGNY3req8OieJZQE3dfNh9GmBJjCvR75rLx7/Emr
 8eUSupXS5dpv6eMM2eGGyfkDbKa6wMjWs9KNBk+4P3AwTPXv11xRruC/eDyKTzabvRUt
 R69NxrutnEfoSF5zzu89ok+JlxEzF55VkVkzAyENGFl/HcXf1oZ2YW3sR8RQahqYHq1M
 6xvPoWl4eQAojtVzbPvdb5hiHJYa8McIsqXw/Nf6N66K9kijgq6j3Pe+ioXmiwO+AU+8
 8S+sfTp24sn64G8P8mSuzIw+2C7mZqWmbDcqADQuDMHdn2CEnUEMMpO3MEMhgjCpmmPo
 juRw==
X-Gm-Message-State: AC+VfDycyn1IkZ9E283CpjFL8va4Zm9vJswGlmeuIViNQgNwLvP2fOI9
 Y+l6pIzknFjNQT37CTPcHL8F6lxL8YnYDDRf8P5Be8ENRqH52sYQAFSPUK/MFYOIAvdJM3anfsL
 C/VN0tj1sNce6I3U=
X-Received: by 2002:a7b:c419:0:b0:3f1:8c5f:dfc5 with SMTP id
 k25-20020a7bc419000000b003f18c5fdfc5mr231057wmi.39.1683220673619; 
 Thu, 04 May 2023 10:17:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hTmbdvXUH+4iYxWkwcldc7JFek98wNcsVuMfj8f5hdW9WHlWylmN/krRXgvQ37Unkui06ZQ==
X-Received: by 2002:a7b:c419:0:b0:3f1:8c5f:dfc5 with SMTP id
 k25-20020a7bc419000000b003f18c5fdfc5mr231043wmi.39.1683220673314; 
 Thu, 04 May 2023 10:17:53 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-139.customers.d1-online.com.
 [80.187.98.139]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003f4069417absm2529021wmz.24.2023.05.04.10.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 10:17:52 -0700 (PDT)
Message-ID: <c4e92b29-89a7-1d87-6277-06ac6270318c@redhat.com>
Date: Thu, 4 May 2023 19:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] tests: libvirt-ci: Update to commit 'c8971e90ac'
 to pull in mformat and xorriso
Content-Language: en-US
To: Ani Sinha <anisinha@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, berrange@redhat.com
References: <20230504154611.85854-1-anisinha@redhat.com>
 <20230504154611.85854-2-anisinha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230504154611.85854-2-anisinha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 04/05/2023 17.46, Ani Sinha wrote:
> Pull in the following changes from lcitool:
> 
> * tests/lcitool/libvirt-ci 85487e1...c8971e9 (18):
>    > mappings: add new package mappings for mformat and xorriso
>    > docs: testing: Update contents with tox
>    > .gitlab-ci.yml: Always test against installed lcitool
>    > gitlab-ci.yml: Start using tox for testing
>    > tox: Allow running with custom pytest options with {posargs}
>    > gitignore: Add the default .tox directory
>    > dev-requirements: Reference VM requirements
>    > requirements: Add tox to dev-requirements.txt and drop pytest and flake
>    > test-requirements: Rename to dev-requirements.txt
>    > Add tox.ini configuration file
>    > tests: commands: Consolidate the installed package/run from git tests
>    > Add a pytest.ini
>    > facts: targets: Drop Fedora 36 target
>    > gitlab-ci.yml: Add Fedora 38 target
>    > facts: targets: Add Fedora 38
>    > facts: mappings: Drop 'zstd' mapping
>    > facts: projects: nbdkit: Replace zstd mapping with libzstd
>    > docs: mappings: Add a section on the preferred mapping naming scheme
> 
> CC: mst@redhat.com
> CC: berrange@redhat.com
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> ---
>   tests/lcitool/libvirt-ci | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
> index 85487e1404..c8971e90ac 160000
> --- a/tests/lcitool/libvirt-ci
> +++ b/tests/lcitool/libvirt-ci
> @@ -1 +1 @@
> -Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
> +Subproject commit c8971e90ac169ee2b539c747f74d96c876debdf9

Reviewed-by: Thomas Huth <thuth@redhat.com>


