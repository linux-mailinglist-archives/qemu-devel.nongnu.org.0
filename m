Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01237C468
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:31:10 +0200 (CEST)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqpJ-0002hL-U1
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgqkf-0005r0-Pc
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgqkb-0005Qp-CZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620833176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ls5arXauHN8UlCdaLGioLoo9oYYkOCQbS7/T1KGtY6w=;
 b=Tc7GcaTFhKDsOZAD+muLzcDurnEw9Bn4BPsqv7EgpxFK+Rsr6M9WFdJVYhTxAF0GMWUWI7
 kJfAQVKgge+5GvTX9bYf2EcALrK4WpDfisQqDk0VMCWnGF41qMVGsXMPjow0arxrtn+H1L
 4y48R8lYCmtBal8iO0bO7w4GAMdGHZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-RVLlTViPPvKpucXbsTU-6g-1; Wed, 12 May 2021 11:26:15 -0400
X-MC-Unique: RVLlTViPPvKpucXbsTU-6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 w21-20020a7bc1150000b029014a850581efso1520033wmi.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ls5arXauHN8UlCdaLGioLoo9oYYkOCQbS7/T1KGtY6w=;
 b=c9Igd1HWItPJq/HAo7pXvnx6PtNavc7UYOKlekAy/r5xLova2Y4gimz7JCdtl+Bkoo
 pZMsyXfL940hL41Ll9I2Qmffg1zI/yRnXDf/JQrWDi5HRI4Xn2eJL6PGSPR8UCYtItNR
 U4Dv3qN9PnK4EzWIdyeDy6nc9igr+pqoYM/+HRhn3NxMNFcRP0QwwELbsbuXRYdk2nso
 s7oojaYiPv/VIFuwEtf/7JZuceGxgAzMz6/WPJ+0cYO/2O/2GNRiYoCr9GYx/7qrzWo2
 TUb5p00zwX7Fbftbk1n0/LwhkT0tkG5hh6rVcV1rSlclttJNTK+DIh4YywKMxKyf5kkK
 B7Nw==
X-Gm-Message-State: AOAM530AjXHTRo8RT134zdJQTluK5rlCqSwz5WfiHizPqNVk7KB4ycKK
 d8xMBkCbLe2JE+8rf8LS9MvjJq15d1kauRHJkz/uPCuCKRKXRS9nMAWaqNgKWsgGP+OnkVuhdgL
 h9WM08kmmqkCHkfc=
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr11980747wmk.90.1620833172805; 
 Wed, 12 May 2021 08:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMUupnieIStHUBxotocuMxEJDsb7G8uMnXXc61fCCqDdrQv1jNeEoBBMA3f5cvxz4TJkOzsg==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr11980713wmk.90.1620833172532; 
 Wed, 12 May 2021 08:26:12 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q12sm6271214wmj.7.2021.05.12.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:26:11 -0700 (PDT)
Subject: Re: [PATCH] travis-ci: Use clang-10 for the [s390x] Clang
 (disable-tcg) job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512152231.3423265-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <32b21c1c-0d55-d92a-390e-f7d6059d03a9@redhat.com>
Date: Wed, 12 May 2021 17:26:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512152231.3423265-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 5:22 PM, Philippe Mathieu-Daudé wrote:
> On Ubuntu Bionic 18.04 LTS clang binary points to the 6.0 version:
> 
>   $ clang --version
>   clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> 
> However we can install clang-10 from the bionic-updates stream [*]
> and use it, to silent the following warnings:
> 
>      CC      pc-bios/s390-ccw/main.o
>   clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
>   clang: warning: argument unused during compilation: '-msoft-float' [-Wunused-command-line-argument]
>   /home/travis/build/qemu/qemu/pc-bios/s390-ccw/main.c:284:5: warning: no previous prototype for function 'main' [-Wmissing-prototypes]
>   int main(void)
>       ^
>   1 warning generated.
>   clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
> 
> [*] https://packages.ubuntu.com/bionic-updates/clang-10
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> However this doesn't resolve:
> 
>     /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:18: error: invalid operand for instruction
>         asm volatile("lghi 1,1\n\t"
>                      ^
>     <inline asm>:1:7: note: instantiated into assembly here
>             lghi 1,1
>                  ^
>     /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:29: error: invalid operand for instruction
>         asm volatile("lghi 1,1\n\t"
>                                 ^
>     <inline asm>:2:7: note: instantiated into assembly here
>             diag 1,1,0x308
>                  ^
>     2 errors generated.
>     Makefile:20: recipe for target 'jump2ipl.o' failed
>     make[1]: *** [jump2ipl.o] Error 1
> 
> (see https://travis-ci.org/github/philmd/qemu/jobs/770920106#L1803,
> https://travis-ci.org/github/philmd/qemu/jobs/770920522#L1818 for
> more errors).
> ---
>  .travis.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 4609240b5aa..9c0deea9a06 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -278,6 +278,7 @@ jobs:
>        compiler: clang
>        addons:
>          apt_packages:
> +          - clang-10
>            - libaio-dev
>            - libattr1-dev
>            - libbrlapi-dev
> @@ -303,7 +304,7 @@ jobs:
>        env:
>          - TEST_CMD="make check-unit"
>          - CONFIG="--disable-containers --disable-tcg --enable-kvm
> -                  --disable-tools --host-cc=clang --cxx=clang++"
> +                  --disable-tools --host-cc=clang-10 --cc=clang-10 --cxx=clang++-10"

I forgot to mention we were missing the --cc= flag, so s390-ccw
was built with an inconsistent $CC. I might respin this part
separately.

>          - UNRELIABLE=true
>  
>      # Release builds
> 


