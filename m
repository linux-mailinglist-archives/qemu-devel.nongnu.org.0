Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D043BBB41
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:32:47 +0200 (CEST)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LuA-0001Xa-2C
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0Lsc-00080K-Ki
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:31:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0LsZ-0004f1-T1
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625481067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQ2WvwtwOV/F9rZ7ffcdatXj1e1elsfGnwXF7f5QRNI=;
 b=Z6gDZq5PQ2vVk+ak2GLVeSCtGX+y8Z5kicAszvReskjxJBQDAKr8KGSVMQPNJwWT597nFy
 DBq4E6MC4+RDTqimcwl6WADJPGZqRAEVKEvMsrCsaaQ6KvMjeinmXXAhGmKIytSDNpbsV3
 bDMPtktcchUbU1rxh4oozdxHM3YewlM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-xUQVlqbAPsGu27j2JlPbtA-1; Mon, 05 Jul 2021 06:31:04 -0400
X-MC-Unique: xUQVlqbAPsGu27j2JlPbtA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020a0560001242b029012c82df4dbbso5186240wrx.23
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PQ2WvwtwOV/F9rZ7ffcdatXj1e1elsfGnwXF7f5QRNI=;
 b=nmGiLTAOMkw2b0v5ZlkcMly7cR66ntjTb+3Ye9ztalAs25RuU5HSvols4wk9h0U/Er
 /0KkqLbNDo+bxphY6E3+Sx8vaSmJQLSwHTjUMvVd4JvA4BAFD975XKGx60Zi6D18ZkSR
 bdhV6qbfpjd2Q0Q5jT1H20hCP4LKOJD1brgnzqpssVvwiX7kNzKqtHxl74/YMiTn2JpK
 hiSfyU37QcVaJhYpZnUpPiyPH8QYr+Z6MKauCNRpJb6iPxUGbY3cgA178BMbXh1IxgZ0
 5W76Tj7CHSTon/mcMPljfB/wQ5Aszcf2o9/So7dNYFa+et4OYXJUVFluCnLePQ+pQ1m5
 JjyA==
X-Gm-Message-State: AOAM531zXAShyNABEVxSzl1QsTCDmAFYV/Ab5aeuh5bvEQPkg1UCya+5
 pQbzuAcCjaNcG8LCoeCWm/0h33cingMb/cQbe0AH13Efipe3GDWDnqO5jTk5S08uUyCOnm/oRWQ
 8+MXiHSd/cX9c7pU=
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr4079186wms.28.1625481063147; 
 Mon, 05 Jul 2021 03:31:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw7AG/dc+2hFhcXykt8cmhU/PTpbjkpIIZdh4rIlZslgqd3pf19hPHU9ZXZFkES7nYG+HbyA==
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr4079168wms.28.1625481062955; 
 Mon, 05 Jul 2021 03:31:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w8sm12644599wre.70.2021.07.05.03.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 03:31:02 -0700 (PDT)
Subject: Re: [PULL 0/2] Libslirp patches
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
 <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
 <CAJ+F1C+H7aw+_2+FspPv0nLtfbM=anBrhCaBWVYVhP6o8nqSDg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4b3021c2-ac50-d763-4113-10a200bdc9ac@redhat.com>
Date: Mon, 5 Jul 2021 12:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+H7aw+_2+FspPv0nLtfbM=anBrhCaBWVYVhP6o8nqSDg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard/Stefan for "atomic" error.

On 6/8/21 10:35 PM, Marc-André Lureau wrote:

> Per subproject `default_library` was added in 0.54, and we require
> 0.55.3. Why is it trying to build libslirp.so?
> 
> I tried to make vm-build-ubuntu.i386 with the following changes:
> 
>  diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
> index 47681b6f87..21d0b64eb1 100755
> --- a/tests/vm/ubuntu.i386
> +++ b/tests/vm/ubuntu.i386
> @@ -18,7 +18,7 @@ import ubuntuvm
>  DEFAULT_CONFIG = {
>      'install_cmds' : "apt-get update,"\
>                       "apt-get build-dep -y qemu,"\
> -                     "apt-get install -y libfdt-dev language-pack-en
> ninja-build",
> +                     "apt-get install -y libfdt-dev language-pack-en
> ninja-build clang",
>  }
>  
>  class UbuntuX86VM(ubuntuvm.UbuntuVM):
> @@ -32,7 +32,7 @@ class UbuntuX86VM(ubuntuvm.UbuntuVM):
>          cd $(mktemp -d);
>          sudo chmod a+r /dev/vdb;
>          tar -xf /dev/vdb;
> -        ./configure {configure_opts};
> +        ./configure {configure_opts} --cc=clang --cxx=clang++
> --host-cc=clang --extra-cflags='-fsanitize=undefined
>  -fno-sanitize=shift-base -Werror';
>          make --output-sync {target} -j{jobs} {verbose};
>      """
> 
> (or with EXTRA_CONFIGURE_OPTS)
> 
> And it failed with:
> 
> [2363/9207] Linking target qemu-system-aarch64
> FAILED: qemu-system-aarch64
> clang++ @qemu-system-aarch64.rsp
> libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> `helper_atomic_cmpxchgq_le_mmu':
> /tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:86: undefined
> reference to `__atomic_compare_exchange_8'
> libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> `helper_atomic_xchgq_le_mmu':
> /tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:134: undefined
> reference to `__atomic_exchange_8'
> libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> `helper_atomic_fetch_addq_le_mmu':
> 
> Any idea what I am missing?
> 
> thanks
> 
> -- 
> Marc-André Lureau


