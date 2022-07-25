Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3C580194
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:19:56 +0200 (CEST)
Received: from localhost ([::1]:42788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzsB-0006RF-KT
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oFzpe-0004x1-Fm
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oFzpc-0003hh-0y
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658762234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wxoGkCYT48U9Ch3PpTdzzSYd7BWavA6oYpxXLlcALI=;
 b=ZmcZtV9fS/wth5jF+CHJ0M6paWrSrw7myZUSLfIN0T2+dTP813oBw1dwpAT6FsuwU7mccK
 AtMdBvW8WQQg/6qyoKaUybbwVcd8qsPpoqL+axkD1VzdVhF0Q+XKy9ukIdWLTjfK5+0lAU
 ifmvEFqHYuLPU2z1aEuhmpk+UGILd7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-_NaTvdA1MG6YY3o8421-ow-1; Mon, 25 Jul 2022 11:17:13 -0400
X-MC-Unique: _NaTvdA1MG6YY3o8421-ow-1
Received: by mail-wm1-f72.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso4193630wmm.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2wxoGkCYT48U9Ch3PpTdzzSYd7BWavA6oYpxXLlcALI=;
 b=b+yClTf20QdVrpHokWJNWnbReGz4x6PKF6DFRPl+9s4jLIwoFd556pzwbmm4tEr891
 IjB2AGR243gV0eupvJg499OYnL0T39uEnsJs/wS3KZrbusFHjSTMG+8bs9C7LYy8woYB
 DXXU8ChIC4TRPUZBaGdmiz6Sptm7k632G7w/C4Q5oMlVAQg20j/2Rqy+6R9Zv7gzOjt0
 KoNuGeojpehNYqOrefE1bCw4IIrsRrzfCuJF3RNcspS77mcDCI/xpAIr6iWWFRtXmZbJ
 BgHkrkZtNbT4gSy6gA7Hy6jNm9xgeb9f12zhEWK0slbSx5Oi8qucZk45tKeGziLsFZxP
 Tx/Q==
X-Gm-Message-State: AJIora8TYo/p9ptJsGdt2sqRfhjbC8vIJXsrwnRAYGsPxmazLxM7z4oU
 pVEtPxXmEm+pNiuPIqNwa0o5aON/W18ADu7r/rVe/mFAZqgxZY/qDZgrYQw/pZ7NMoqjqTixHcO
 KksNtKsiP71P2sos=
X-Received: by 2002:adf:d1e2:0:b0:21d:c7ae:3b1a with SMTP id
 g2-20020adfd1e2000000b0021dc7ae3b1amr7763872wrd.700.1658762232497; 
 Mon, 25 Jul 2022 08:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vuwtcBAtWQNCp7kGPzNrLHsOV+EDxMByzwU80sfH6ST8HQ1tBxvpkAt6NEbhiLnSHOpHc8vw==
X-Received: by 2002:adf:d1e2:0:b0:21d:c7ae:3b1a with SMTP id
 g2-20020adfd1e2000000b0021dc7ae3b1amr7763858wrd.700.1658762232307; 
 Mon, 25 Jul 2022 08:17:12 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b0021e4f595590sm12348795wrm.28.2022.07.25.08.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:17:12 -0700 (PDT)
Message-ID: <e46d8c14-db18-e7cc-460a-2f8a80024653@redhat.com>
Date: Mon, 25 Jul 2022 17:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 11/13] tests/tcg/s390x: Test unaligned accesses to
 lowcore
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, peter.maydell@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
 <20220725140520.515340-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220725140520.515340-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/07/2022 16.05, Alex Bennée wrote:
> From: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> Add a small test to avoid regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220722233614.7254-3-iii@linux.ibm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/s390x/Makefile.softmmu-target |  9 +++++++++
>   tests/tcg/s390x/unaligned-lowcore.S     | 19 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
>   create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
>   create mode 100644 tests/tcg/s390x/unaligned-lowcore.S
> 
> diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
> new file mode 100644
> index 0000000000..a34fa68473
> --- /dev/null
> +++ b/tests/tcg/s390x/Makefile.softmmu-target
> @@ -0,0 +1,9 @@
> +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> +VPATH+=$(S390X_SRC)
> +QEMU_OPTS=-action panic=exit-failure -kernel
> +
> +%: %.S
> +	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
> +		-Wl,--build-id=none $< -o $@
> +
> +TESTS += unaligned-lowcore
> diff --git a/tests/tcg/s390x/unaligned-lowcore.S b/tests/tcg/s390x/unaligned-lowcore.S
> new file mode 100644
> index 0000000000..246b517f11
> --- /dev/null
> +++ b/tests/tcg/s390x/unaligned-lowcore.S
> @@ -0,0 +1,19 @@
> +    .org 0x1D0                         /* program new PSW */
> +    .quad 0x2000000000000, 0           /* disabled wait */
> +    .org 0x200                         /* lowcore padding */
> +
> +    .globl _start
> +_start:
> +    lctlg %c0,%c0,_c0
> +    vst %v0,_unaligned
> +    lpswe quiesce_psw
> +
> +    .align 8
> +quiesce_psw:
> +    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
> +_c0:
> +    .quad 0x10060000                   /* lowcore protection, AFP, VX */
> +
> +    .byte 0
> +_unaligned:
> +    .octa 0

Acked-by: Thomas Huth <thuth@redhat.com>


