Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCFA4B84C3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:49:06 +0100 (CET)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGvp-0005gy-Qj
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKGR5-0006EM-6w
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKGR1-0007Uv-13
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645003028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOMMKhRmr0WZqt/h2Tv35d2Gx0AbDb4x7jAVCHHSuDM=;
 b=JCR0T2z+eLpQnkXhjOvj8cpDOxrpYYSkNr8cYOrt6JmkBT64zngxw0WWKzXiYjRgBf/AQx
 rQ5U53AsM/soxWmIos3YBnB8D2Z3XzEIIxxP4QmAPR6RFaDBlqc4xprzFK3G0d0ZRSfX1H
 aHH+Iqp77rhmoyK5iexWVN5EetLknaw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-X095tUV4OtGa8QYwfFx2pw-1; Wed, 16 Feb 2022 04:17:06 -0500
X-MC-Unique: X095tUV4OtGa8QYwfFx2pw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b17-20020a05600c4e1100b0037cc0d56524so2673408wmq.2
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GOMMKhRmr0WZqt/h2Tv35d2Gx0AbDb4x7jAVCHHSuDM=;
 b=lHeLUemn4wN3oJah8azvn3+zXjLfnAhckFODqgLI68WzstWqjyAsmD2hE0xNqpVmSq
 EnNUuyl0xupA+MVI+oPVd6uHkvOH/z/4U3Jb4LOJtnaZ235rHUPuXGZDqFtHHpucYdRh
 QysVPcYHgtWlxsJu0j2fmdGc7xEVGndwuctIYGsaELjUdvB4M+fc31B2yBVf4xbAoX1H
 1sZLqZ/hlQz8sgoNPpye/Lzc0Q4zFHgXjzxvb9CZJ+Vvr29SU7c0ayYxSRnwRkq5vGxp
 DrGKVAWASZnRBuSKaMSkVxiAfzJeLuiAaJQsJoTfpdkJa0GdtkZrj9ZPyWEgRr6wWwvZ
 +cvg==
X-Gm-Message-State: AOAM531RU7TlD7U4yOscYZOn5l477SkK5XOTqWTRig1FXbm46CURBJht
 z1Wwl5U6pryPUbzXN2ND6XlQPKUFg++VP6mpWGpDB+nSI1YxUkOhVAgJoKF83g0Cyx5wTDjGxde
 j/r7Hh0hlW0sdPOo=
X-Received: by 2002:adf:fd48:0:b0:1e4:99d8:48bd with SMTP id
 h8-20020adffd48000000b001e499d848bdmr1458699wrs.497.1645003025720; 
 Wed, 16 Feb 2022 01:17:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCGZmrOvFoShkVKCiEe0NlBsdbPWAJiiHm34M5T2wAAuqZWxku/1GHWGQ9pujmjthWNTd/uw==
X-Received: by 2002:adf:fd48:0:b0:1e4:99d8:48bd with SMTP id
 h8-20020adffd48000000b001e499d848bdmr1458682wrs.497.1645003025404; 
 Wed, 16 Feb 2022 01:17:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id r12sm12857560wmq.33.2022.02.16.01.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:17:05 -0800 (PST)
Message-ID: <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
Date: Wed, 16 Feb 2022 10:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, thuth@redhat.com
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 21:27, David Miller wrote:
> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>   tests/tcg/s390x/Makefile.target |  2 +-
>   tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
>   tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
>   tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
>   4 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/s390x/mie3-compl.c
>   create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
>   create mode 100644 tests/tcg/s390x/mie3-sel.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target 
> b/tests/tcg/s390x/Makefile.target
> index 1a7238b4eb..16b9d45307 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,6 +1,6 @@
>   S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>   VPATH+=$(S390X_SRC)
> -CFLAGS+=-march=zEC12 -m64
> +CFLAGS+=-march=z15 -m64

Unfortunately, this makes our docker builds unhappy -- fail. I assume the
compiler in the container is outdated.

$ make run-tcg-tests-s390x-linux-user 
changing dir to build for make "run-tcg-tests-s390x-linux-user"...
make[1]: Entering directory '/home/dhildenb/git/qemu/build'
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
  BUILD   debian10
  BUILD   debian-s390x-cross
  BUILD   TCG tests for s390x-linux-user
  CHECK   debian10
  CHECK   debian-s390x-cross
  BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
s390x-linux-gnu-gcc: note: valid arguments to '-march=' are: arch10 arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13 z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?

Maybe debian11 could, work.

@Thomas do you have any idea if we could get this to work with
'-march=z15' or should we work around that by manually encoding
the relevant instructions instead?

-- 
Thanks,

David / dhildenb


