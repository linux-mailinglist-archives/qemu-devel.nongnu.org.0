Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295684D68D4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:59:12 +0100 (CET)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkTn-0005mn-9c
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSkSK-0004TE-OA
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSkSH-0002Ob-VJ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647025057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LZR/U1nuLr0OcJ9Kz9RAV02fyZgOVcQV1wMgzLfOVk=;
 b=Jj6MZZ1OF3PpxrZ7xDfU+mlqTinjil6pi3Z9ETlGOwp0Y/OebEmBNxubt8w+yoxK7j28Iy
 ZmSY87fXgWdzAQSGMDKTD/J/Tbx4UbWLDDqy/tJ5R9+QHKZSSmPfi1V6zo+2KHsXILQv/V
 jmB5pZaAvJnLWumEmSwINWjIwa5ZGIc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-LbGk72kWObSDWjEt6PD7tQ-1; Fri, 11 Mar 2022 13:57:36 -0500
X-MC-Unique: LbGk72kWObSDWjEt6PD7tQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q14-20020adfea0e000000b002036c16c6daso3122289wrm.8
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 10:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3LZR/U1nuLr0OcJ9Kz9RAV02fyZgOVcQV1wMgzLfOVk=;
 b=lCmdZ3E54+9nPWT8ZrxIoaZ9SgJMDc44QRQGm2Yy7zTdeRIEA4Gm2D0y0EGHCBiKL9
 vA9V397to9xMxCyRpL9ShGBMsn5yqGw4mhtS4hXMq+eyLKLv1QYB7Vo8rwOTJl0N7B6G
 iHssZ9nTanmxfwIw3jBDFyruW14JOzVwhzktf6cvTTXUcKxGoQ9qfSUq3AnXb0m+2SIh
 jFp9iimIKUP3WwTLZGP3gXtOPeuhak4S5BU0ZKQjzae5GIiPk1jMWnds7fGblAKnid2Q
 tyGIUxthbramT7DC4XtKgV2PW9054oa5Tb03kqQz5x3mwLdgWhQkECZlpPK/Y8z8VNIB
 /EXA==
X-Gm-Message-State: AOAM532V/5NGQjKVC13pQl+1YomDoJe90jZxW+xMAed9lukTYc/dVwG+
 4Dk2EDF/kk7i6zGI6vRI+he/jdgXw1bUYvxAgDsNLnri8uuplzjMIRYB5M9l3mRCNNgP51PG6yP
 IPXttgcamidXQOFw=
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id
 c14-20020adffb4e000000b001e33e66d5f6mr8615149wrs.615.1647025054952; 
 Fri, 11 Mar 2022 10:57:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ9dRQUOs6IPpOgg75BOIBnCvpfHdl6B0tsnROvYlB/JJ9onmtkO7GGpwn2aURH0Wf/PU1SA==
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id
 c14-20020adffb4e000000b001e33e66d5f6mr8615138wrs.615.1647025054748; 
 Fri, 11 Mar 2022 10:57:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm7594284wro.80.2022.03.11.10.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 10:57:34 -0800 (PST)
Message-ID: <9bdc726e-fbf9-3507-39f0-0b3c2d73ef07@redhat.com>
Date: Fri, 11 Mar 2022 19:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-4-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220311184911.557245-4-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.22 19:49, Ilya Leoshkevich wrote:
> Add a small test in order to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/Makefile.target        |  1 +
>  tests/tcg/s390x/branch-relative-long.c | 29 ++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 tests/tcg/s390x/branch-relative-long.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 257c568c58..fd34b130f7 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -15,6 +15,7 @@ TESTS+=mvc
>  TESTS+=shift
>  TESTS+=trap
>  TESTS+=signals-s390x
> +TESTS+=branch-relative-long
>  
>  ifneq ($(HAVE_GDB_BIN),)
>  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
> new file mode 100644
> index 0000000000..b9fcee9873
> --- /dev/null
> +++ b/tests/tcg/s390x/branch-relative-long.c
> @@ -0,0 +1,29 @@
> +#include <assert.h>
> +#include <stddef.h>
> +#include <sys/mman.h>
> +
> +int main(void)
> +{
> +    const unsigned short opcodes[] = {
> +        0xc005,  /* brasl %r0 */
> +        0xc0f4,  /* brcl 0xf */
> +    };
> +    size_t length = 0x100000006;
> +    unsigned char *buf;
> +    int i;
> +
> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    assert(buf != MAP_FAILED);
> +
> +    *(unsigned short *)&buf[0] = 0x07fe;  /* br %r14 */
> +    *(unsigned int *)&buf[0x100000002] = 0x80000000;
> +    for (i = 0; i < sizeof(opcodes) / sizeof(opcodes[0]); i++) {
> +        *(unsigned short *)&buf[0x100000000] = opcodes[i];
> +        ((void (*)(void))&buf[0x100000000])();
> +    }

Hmmm, can't we write some "nice" inline asm instead?


-- 
Thanks,

David / dhildenb


