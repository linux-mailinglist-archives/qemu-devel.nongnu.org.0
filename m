Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B34922D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:37:16 +0100 (CET)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kvT-0008Ls-9a
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:37:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9ksr-0005iF-2O
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9ksn-0007Uy-AR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642498466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kfa/fydLVSdT7pvrtCUy+AndpHItsj06uv63X3gyCLI=;
 b=QaDc/DYb1Ll95Ji51LKRXeYCHapS2ZjZtwJ+Kckjy4M8t5wi7ggB7zGAw85cuntHPugTRN
 W+RIzQn7LPabrKgYZGTO0lEhD/1+gvhDbdduWp+XxOootwmDYKJ6c0+6iueRbYiGusXZZc
 O+JLh5xkRJGWZxpR2P5PYN0TR/9tO7A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-EI060DZVN7OCKQqvSa7juQ-1; Tue, 18 Jan 2022 04:34:20 -0500
X-MC-Unique: EI060DZVN7OCKQqvSa7juQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so973357wml.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kfa/fydLVSdT7pvrtCUy+AndpHItsj06uv63X3gyCLI=;
 b=vEmhVkzp1TlvSHX20i7U+svZLqySJi2e7P3iZH2+z10S/GVAwre0qAzXL+TiNpYsx0
 060QGViW6sCE32Xf3fM3XMion+o8FdwPVQiQmvLLeBiK3mLuOmYejVUBHmasHX47g4lJ
 1HzeQJEvLIgovCEjOj7Y0boFZBGFGC/X06MbligKLD0bbolEs1IopxDUFdM1oN2qoom1
 6p/f88Xa/H3m42Tz6zPZ+BWGS8WAVboE5x48nB5FhdfuT7Ln//CZ1RqIW9FL1qyiymEQ
 zBg3rMal+msUNFNPM+QkSznfCcZtSAa/XnZ+b0MZ/lRhVJY7GLOyk/lJPvVTRjUzKaPd
 IHlg==
X-Gm-Message-State: AOAM532/vrYGna7bb5tJtFivxJ90FiAMMqNuoAFAKf+k7+bWgNCkc89j
 +edfWpdsa2+j6lppyGTJOHv6dME563rcp3ILBgwOAFw7oxaY++xbBSpsOlCPLK1OJN6eQJ/fyYb
 yetfETaPPQbz1rGI=
X-Received: by 2002:a5d:430e:: with SMTP id h14mr23291038wrq.99.1642498459374; 
 Tue, 18 Jan 2022 01:34:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/VdMrUGbXBD4EoEqi5skb4ULt4a38h3dZfEcY7KBx6mNMyW8viiOeEQsoICpVADoRyf18rg==
X-Received: by 2002:a5d:430e:: with SMTP id h14mr23291006wrq.99.1642498459027; 
 Tue, 18 Jan 2022 01:34:19 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u13sm1835670wmq.41.2022.01.18.01.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:34:18 -0800 (PST)
Message-ID: <9605efe1-33a3-266b-3936-3d0dba84b71d@redhat.com>
Date: Tue, 18 Jan 2022 10:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 7/7] gitlab-ci: Support macOS 12 via cirrus-run
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-8-f4bug@amsat.org>
 <c3c894b5-e6a6-d203-83c6-07c15982c281@redhat.com>
 <4277f659-7514-5ec5-480a-a349699c6a6a@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4277f659-7514-5ec5-480a-a349699c6a6a@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2022 12.41, Philippe Mathieu-Daudé wrote:
> On 13/1/22 08:39, Thomas Huth wrote:
>> On 10/01/2022 14.10, Philippe Mathieu-Daudé wrote:
>>> Add support for macOS 12 build on Cirrus-CI, similarly to commit
>>> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").
>>>
>>> Update the lcitool repository to get the macos12 mappings,
>>> and generate the vars file by calling 'make lcitool-refresh'.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Pending on libvirt-ci MR #210:
>>> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
>>> ---
>>>   .gitlab-ci.d/cirrus.yml           | 15 +++++++++++++++
>>>   .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>>>   tests/lcitool/libvirt-ci          |  2 +-
>>>   tests/lcitool/refresh             |  1 +
>>>   4 files changed, 33 insertions(+), 1 deletion(-)
>>>   create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
>>>
>>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>>> index b96b22e2697..b7662959070 100644
>>> --- a/.gitlab-ci.d/cirrus.yml
>>> +++ b/.gitlab-ci.d/cirrus.yml
>>> @@ -87,6 +87,21 @@ x64-macos-11-base-build:
>>>       PKG_CONFIG_PATH: 
>>> /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig 
>>>
>>>       TEST_TARGETS: check-unit check-block check-qapi-schema 
>>> check-softfloat check-qtest-x86_64
>>> +x64-macos-12-base-build:
>>> +  extends: .cirrus_build_job
>>> +  variables:
>>> +    NAME: macos-12
>>> +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
>>> +    CIRRUS_VM_IMAGE_SELECTOR: image
>>> +    CIRRUS_VM_IMAGE_NAME: monterey-base
>>> +    CIRRUS_VM_CPUS: 12
>>> +    CIRRUS_VM_RAM: 24G
>>> +    UPDATE_COMMAND: brew update
>>> +    INSTALL_COMMAND: brew install
>>> +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
>>> +    PKG_CONFIG_PATH: 
>>> /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig 
>>>
>>> +    TEST_TARGETS: check-unit check-block check-qapi-schema 
>>> check-softfloat check-qtest-x86_64
>>
>> Since we cannot run that many Cirrus-CI jobs in parallel, I think it might 
>> make sense to limit the macos-11 job to manual mode now?
> 
> TBH I don't know, IIUC macOS seems somehow a bit tied with hardware
> (updated less often), and apparently our user base is still interested
> in having the previous Catalina version working too.
> 
> What about FreeBSD jobs? Do you also plan to set the FreeBSD 12 job to manual?

No good clue... Maybe we could also simply bump the timeout setting in 
.gitlab-ci.d/cirrus.yml to the maximum value (120 min, I think?) and hope 
that all the Cirrus-CI jobs finish within that amount of time?

  Thomas


