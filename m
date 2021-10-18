Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7F4313A5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:40:58 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcP8b-0000do-Bv
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcP6r-0008NY-Fk
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcP6n-00010o-58
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4ecIHs/V+KRb2GVdV6mJ3XRImqwjUT7KaFqJIoYd44=;
 b=G8Qv/hEaqSc3fWatKBeYQPTHJ+6Ig71achEfjzGYWunfaeFjVDtBjCqPa3/j9pSmmQsVlm
 3LhCPp4+9DKHF7d1wCfTymjXw33vqKUjHizg3DQi9xW0mC1ODu3wBSkjlkKjomFkB3OepU
 8s72NGJWl0kCpYHbH4NR2XF8vjxEaT8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-fvXgu7jUOsmQ-Y7XAAuIkQ-1; Mon, 18 Oct 2021 05:39:03 -0400
X-MC-Unique: fvXgu7jUOsmQ-Y7XAAuIkQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so8608118wrb.14
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=k4ecIHs/V+KRb2GVdV6mJ3XRImqwjUT7KaFqJIoYd44=;
 b=EgMlQk4Sm52aR/wzptaMpZh2687DhqDQs+wSsfmh2TMoqUzCvrOzR2vq449sx/r9An
 J+R0wAHgeSv3QPQsojABVWpKR5BTjVmw0P4dQkWQxfwMudnTtBD0ZQMw7bzgxfWRJLDl
 +sFXmQ3slpO3XEhyf8cpvetVgCFNKgydur1+pD6p6rq2k3yyTG4CjjI2shKwbC+Ts5jD
 l+VCVVZoJIJ30q843TuPY2l0/bpBlpgarj7j9MD/u/ck+ksVKL1CY+Uu5H9zdTRMSidP
 QXIAmihI58a1T/7EweOiUIxmV6d7glDBIuRV9/mLbIxz0H3xXCpdjzC6KvGHjst6G5j7
 dwIA==
X-Gm-Message-State: AOAM533/u+z1wOGL/pruhjzb4Zu6MwPzLxe2Dj6ZIer/gseaBo8Y5o7K
 zF7qiHo9nksKuHNzOjo6KQq7gflBJ90jY7gz+jWDcZLmDXQsgRsphd+z8CDeEeeDf+gD/+94oxS
 sRBC3VueFz+Ffra4Krdl42eXlzJqhIbW2s8Qn8m5cHoJ6+H36U83MnEjoN5Y3uQVi
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr30907045wrm.385.1634549942036; 
 Mon, 18 Oct 2021 02:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHwWIdnzdbj3xPuMHVhR1UF3CRBdf/l535sJtobFq1J/ijymjtlSZiYCj0eFd5Mgs5jvGOwg==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr30907012wrm.385.1634549941782; 
 Mon, 18 Oct 2021 02:39:01 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id n9sm6029672wro.68.2021.10.18.02.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:39:01 -0700 (PDT)
Message-ID: <bb135d0c-8c79-6414-35ce-6c93a710b949@redhat.com>
Date: Mon, 18 Oct 2021 11:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] roms/edk2: Only initialize required submodules
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
References: <20211018092354.2637731-1-philmd@redhat.com>
 <20211018092354.2637731-3-philmd@redhat.com>
 <ab758bac-169c-198f-1d53-be59f5a51710@redhat.com>
In-Reply-To: <ab758bac-169c-198f-1d53-be59f5a51710@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Michael, since the make-release script is not covered
in any MAINTAINERS section.

On 10/18/21 11:31, Philippe Mathieu-Daudé wrote:
> On 10/18/21 11:23, Philippe Mathieu-Daudé wrote:
>> The EDK2 firmware images built to test QEMU do not require
>> the following submodules:
>>
>>  - MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
>>  - UnitTestFrameworkPkg/Library/CmockaLib/cmocka
>>
>> The only submodules required are:
>>
>>  - ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
>>  - BaseTools/Source/C/BrotliCompress/brotli
>>  - CryptoPkg/Library/OpensslLib/openssl
>>  - MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
>>
>> Adapt the buildsys machinery to only initialize the required
>> submodules.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/edk2.yml | 4 ++++
>>  roms/Makefile.edk2    | 7 ++++++-
>>  scripts/make-release  | 7 ++++++-
>>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
>>  # See notes on the ".NOTPARALLEL" target and the "+" indicator in
>> diff --git a/scripts/make-release b/scripts/make-release
>> index a2a8cda33c0..a9ff933a4ca 100755
>> --- a/scripts/make-release
>> +++ b/scripts/make-release
>> @@ -27,7 +27,12 @@ git submodule update --init
>>  # don't necessarily have much control over how a submodule handles its
>>  # submodule dependencies, so we continue to handle these on a case-by-case
>>  # basis for now.
>> -(cd roms/edk2 && git submodule update --init)
>> +(cd roms/edk2 && \
>> +    git submodule update --init \
> 
> Hmm I forgot the '--' separator here.

BTW Michael since commit 9d03f5abede ("travis.yml: Remove the
"Release tarball" job") we don't test make-release anymore in
our CI, you might want to add some GitLab equivalent job.

Regards,

Phil.


