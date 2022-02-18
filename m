Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0414BB8F5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:15:29 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL2Ab-0001nf-2T
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL29C-00013G-V1
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:14:02 -0500
Received: from [2a00:1450:4864:20::634] (port=37533
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL29B-0005LY-0S
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:14:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id bg10so14604745ejb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 04:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FR6bPctNrOzelXj4BYYHkBf3Ooi47nILZVXRjeoZFuE=;
 b=mFIfidkKkawC/x3TaleYJBRoN5dVmyCr1aP0sD7ulc1fXDOW/5bVSdwv8a/JJ7IG3q
 av4RhAUar1fMOIWUNtebiS2xixm7HLyCDbI93ovmPSDSJwXC7dtkr0CXeRtBG2iTnl9x
 0QFQPvwx5BeqOiZYWaO5IVnjOpHW4j7UacDT/biMLIAl3iY6o+8ojtB1Bn3C5pfKU9em
 Q5t0rRyvcdiCAR3+dmKiFlf6dpg8mZd1c7HuNV6LMkxli5DD+d8ZlALKQDFv0p6iuQOU
 5LO4DSx1T2kPVn38bjwzCvRIjM5xMRW5E+/iySOc4tdEyOSmLzgmn6PiL+rexs3RdyJX
 ti6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FR6bPctNrOzelXj4BYYHkBf3Ooi47nILZVXRjeoZFuE=;
 b=oJh3icjdHw72OC2LPvj2N/deilPVCnK+i5H74NLK0Hko5BMsqJByze55nb/frCPk9p
 yhl7cyAd9gIbYdCgDierpWrzwPPsym/GHQgVKPj2gIjJJvx9s6O9UILimxi2YB2f98J8
 c01NGn9ViGMS0pNz8ghOD+rYYGKnnEQMtoFMBjyI4vJ9xPZQXpG+GWlmIqV93fYqmpNK
 mHQT2lWgB1bkTV9nfTpsll1IvZfH5gX5xwNEnVVchE5PGyXz2TPaIug1SXXYIPHi5hRX
 JX+pG/Z2iE8twDTj2MjL4ILI+yxrOhYNpp7yS1KmWg5S+TlYq2NvOyvGWMFnCUOU8rlK
 LePw==
X-Gm-Message-State: AOAM531y8BuOQV4I/3tX1T+DoMxVhcDgohs7iePIw3hb9tYS9/iXhNxh
 m4yFQNBTk+m7z10O5cmXQeM=
X-Google-Smtp-Source: ABdhPJycadjhkdRn38yDm7PXllV0K5y+rjIaTfx919Sukyxnppbh6jwrxuxCHo51bH3bz+xdsO9TgA==
X-Received: by 2002:a17:906:9c02:b0:6cf:93f:f781 with SMTP id
 ff2-20020a1709069c0200b006cf093ff781mr5899830ejc.312.1645186438773; 
 Fri, 18 Feb 2022 04:13:58 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id bl12sm2183960ejb.75.2022.02.18.04.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 04:13:58 -0800 (PST)
Message-ID: <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
Date: Fri, 18 Feb 2022 13:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Content-Language: en-US
To: Jag Raman <jag.raman@oracle.com>, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/22 04:40, Jag Raman wrote:
> 
> 
>> On Feb 17, 2022, at 7:09 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Thu, 17 Feb 2022 at 07:56, Jagannathan Raman <jag.raman@oracle.com> wrote:
>>>
>>> The compiler path that cmake gets from meson is corrupted. It results in
>>> the following error:
>>> | -- The C compiler identification is unknown
>>> | CMake Error at CMakeLists.txt:35 (project):
>>> | The CMAKE_C_COMPILER:
>>> | /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
>>> | is not a full path to an existing compiler tool.
>>>
>>> Explicitly specify the C compiler for cmake to avoid this error
>>
>> This sounds like a bug in Meson. Is there a Meson bug report
>> we can reference in the commit message here ?
> 
> Hi Peter,
> 
> This issue reproduces with the latest meson [1] also.

0.60.0 or more recent versions should have a fix, which would do exactly 
what this patch does: do not define CMAKE_C_COMPILER_LAUNCHER, and place 
the whole binaries.c variable in CMAKE_C_COMPILER.  What are the 
contents of the genrated CMakeMesonToolchainFile.cmake and 
CMakeCache.txt files, without and with your patch?

> I noticed the following about the “binaries” section [2]. The manual
> says meson could pass the values in this section to find_program [3].
> As such I’m wondering if it’s OK to set compiler flags in this section
> because find_program doesn’t seem to accept any compiler flags.

The full quote of the manual is "These can be used internally by Meson, 
or by the find_program function", and the C compiler variable "c" is in 
the former category.

There is an important difference between the flags in "binaries" and 
those in "built-in options". What is in "binaries" is used when 
requesting e.g. the compiler search path, while what is in "built-in 
options" is not.  So options like "-m32" are definitely part of 
"binaries", not "built-in options":

     $ gcc --print-multi-os-directory
     ../lib64
     $ gcc -m32 --print-multi-os-directory
     ../lib

Paolo

