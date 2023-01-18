Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCE672280
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:07:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAx5-0001wz-K9; Wed, 18 Jan 2023 11:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIAx3-0001wb-Gu
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:06:13 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIAx1-0001ti-FK
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:06:13 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-15b9c93848dso27671732fac.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 08:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oF9Vq6ENYrb4IMpLM2k0GAj1eHiSjnd90PTtRLmtFn0=;
 b=YdTRwXFPyYLY2K3GHYtzyR7B2m0PmKV+bIeuJ0mlsq2DdathnMCiSpPkF2ZV2p7e1Y
 tQkHTvZDBfVZCM5ydpUbIYPG91Do9JmkxdSYHfkyfoYcMVBzGmFF5jwpGogNn6Mp50ig
 TBQrGGld/jzHma1G8zXD0I9iNFfOuYOlfwSdtRmH/0wKzuVX3SNwVx2KLY3PztiAaRNl
 inb6qvkpqB6V8lHnkYhWDTy3Hub7ED1hmCxaBj/C5/7bud3HzmB8P+rtXGkvRPEhAxkX
 M+yA3M6sowe3DIfDHAXE0XA7+vssiOMmC5WUdQZ9hKeCHOfRE112mlpbKANxYbYsur9r
 ah4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oF9Vq6ENYrb4IMpLM2k0GAj1eHiSjnd90PTtRLmtFn0=;
 b=KojLpQuyRGelnDNZpTa9eHcjquaQ5ks8QfnmC0m1jBhlwev3c6SsRrWfqQgiX12jeh
 0Nc7iHf/zYZauTFG4nQtv1qasLEzizEUCIyXLwgtIeUtqrPG+VJEowxSeHdw9krUjCYT
 peyIJo58GqGqw4kduUONDyKOkiPfWR/yrR2lSFoIm+x9TVCDHUDFzLvsc2M4s229kD8n
 g9Csln5SKdnRkpLMLk5ATMbQiDh0A/XcJ8sgMmJqonlRzOb7xWSgTQRjGi338PTCjfYE
 kwjVh6f+VC2MLl8WUbsGQMKzkngiEAJo4aEc4ERXnOd2oA1L8oFkmN0wwRG6xQNronUi
 Nblw==
X-Gm-Message-State: AFqh2kojCR8Pw19Zp1rtOpknNJT0Jl11gR8SNx6gLbmXjK51ZXokiCH/
 e/7d3HY6mKO0PXG4zgwtzT+QyA==
X-Google-Smtp-Source: AMrXdXsLiIbyd0002Fvk2T/Kf+w+1B0ZGHVsoTsOJqM3++6Nei3oeBfZ15ONQA2Suh/YZDVq7mCH+A==
X-Received: by 2002:a05:6870:ed95:b0:13b:1f84:b7d7 with SMTP id
 fz21-20020a056870ed9500b0013b1f84b7d7mr4411000oab.13.1674057968267; 
 Wed, 18 Jan 2023 08:06:08 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056871071200b0014f81d27ce3sm18599096oap.55.2023.01.18.08.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 08:06:07 -0800 (PST)
Message-ID: <af2cce98-8135-c36a-f938-79b024285cfb@ventanamicro.com>
Date: Wed, 18 Jan 2023 13:06:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] avocado_qemu: add AVOCADO_DEFAULT_ARCH for cross-arch
 tests
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
 <20230118124348.364771-3-dbarboza@ventanamicro.com> <87bkmvdfy5.fsf@suse.de>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <87bkmvdfy5.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 1/18/23 12:23, Fabiano Rosas wrote:
> Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:
>
>> All avocado tests that are arch agnostic (i.e. does not set an 'arch'
>> tag) are run with arch=None in pick_default_qemu_bin(), and then 'arch'
>> is set to os.uname()[4], meaning that it will take the arch of the
>> running host.
>>
>> This means that if one compiles QEMU binaries for non-x86 targets on an
>> x86 machine, and then run 'make check-avocado', all arch agnostic tests
>> will be cancelled because there's no qemu-system-x86_64 to be found.
>>
>> There is no particular reason to not allow these tests to be run with
>> other arch binaries in a x86_64 host. Allow the developer to do it by
>> adding a a new env variable called AVOCADO_DEFAULT_ARCH. Any 'arch' that
>> is set by this variable will take precedence of setting it via
>> os.uname()[4]. We can then run non-x86 binaries tests in a x86_64 host
>> as follows:
>>
>> $ AVOCADO_DEFAULT_ARCH=riscv64 make check-avocado
>> (...)
>> RESULTS: PASS 11 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0
> I don't understand why tags don't solve the problem. We
> are already passing a tag for each target:
>
> ifndef AVOCADO_TAGS
> 	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
> 						 $(filter %-softmmu,$(TARGETS)))
> else
> 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
> endif
>
> I then tried to tag migration.py with:
>
>      :avocado: tags=arch:x86_64
>      :avocado: tags=arch:aarch64
>
> On an x86_64 machine with target-list=x86_64-softmmu,aarch64-softmmu,
> only the x86_64 test runs. Even if I remove the x86_64 tag from the
> avocado line. Possibly due to the --filter-by-tags-include-empty
> options. But I would expect a second run with aarch64, even if it
> failed.

I can give some light in this bit. tests/avocado/avocado_qemu/__init__.py,
setUp() from  "class QemuBaseTest":


     def setUp(self, bin_prefix):
         self.arch = self.params.get('arch',
default=self._get_unique_tag_val('arch'))


So what you did there:

:avocado: tags=arch:x86_64
:avocado: tags=arch:aarch64

Will result in "self.arch = None"  because 'arch' is not an unique tag. This has the
same effect as giving no 'arch' tags at all.

In fact, all avocado tags fetched from the test files works the same way. If the tag
isn't unique it's considered None.

It is worth mentioning that the docs mentions that the 'arch' tag must be unique:

=====
The ``arch`` attribute will be set to the test parameter of the same
name.  If one is not given explicitly, it will either be set to
``None``, or, if the test is tagged with one (and only one)
``:avocado: tags=arch:VALUE`` tag, it will be set to ``VALUE``.
=====

But it doesn't mention that having multiple 'arch' tags will have the same effect
as having no 'arch' tag though.


>
> If I use only:
>
>      :avocado: tags=arch:riscv
>
> and run:
>
> python3 -m avocado --show=app run -t arch:riscv -t arch:x86_64 --failfast ../tests/avocado/migration.py
>
> Then it complains about the binary, but the x86_64 binary is present! So
> it looked at the tag after all:
>
> CANCEL: No QEMU binary defined or found in the build tree for arch riscv
>                                                                     ^^^^^

Yeah, in this case it looked at the 'arch:riscv' tag in the tes,t because it was the only 'arch' tag,
and complained that you didn't have RISC-V binaries because it actually tried to find them.

Also, what you did there with the "-t arch:riscv -t arch:x86_64" is "run this avocado
test if the test tags matches these". There is no way of "assigning" a different
arch/machine/etc via these command line tags. Probably this wasn't your intention
at all but I'd rather mention it to be safe.


Thanks,

Daniel



>
> I don't know how to make this work, but I feel there should be a way to
> have the framework select the correct test AND pass the correct arch
> parameter along.


