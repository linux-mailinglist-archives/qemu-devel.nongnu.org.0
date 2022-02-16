Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEAA4B8547
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:13:14 +0100 (CET)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHJB-0005xg-2G
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKH3k-000472-Uy
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKH3i-0007Pm-VN
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645005434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eam+P9nxiPv0edxsr070SwNVWoKl6Y5xPqwr8iRURg=;
 b=EV/Zx+1zUnSonBPsLUiGU9Ox4ZZ4vPHi3v5Ja2xxBT9BeypWRY8nsFuE6z3/fX3iXDpB6z
 I0SWG/ztSOO+7zGGkGXWu6xR7BQlSXA1kNFKbnEHJvv7++IBsskbzu8egZEiQZygA3iLv2
 jbCcrMWkOvBaMIAmA8+IjgN/qVdP4HY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-8ieKBZUNMAiHi4sPGkXPhQ-1; Wed, 16 Feb 2022 04:57:13 -0500
X-MC-Unique: 8ieKBZUNMAiHi4sPGkXPhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k36-20020a05600c1ca400b0037ddae32528so266049wms.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=5eam+P9nxiPv0edxsr070SwNVWoKl6Y5xPqwr8iRURg=;
 b=Oao89yPNtBLnc+FejsG/WQzoaKWgLkwn2dwaoLt1UcqQCVu0vBkZtM1iV7XjGjw+qG
 iggRRmH6sbAaDqrnXnDQRV8xfia7kMsKoukNsYozqlASQEjJUWYUDyVTiV3hl0rwkYmE
 UI0gy+jm60wHrCDHzjtaLRoX7PXFR1rvjuXocdw1Nc3sn9zLA/vGB/jnlRSRum9Qa/JF
 vNhjVuzrjUhQsgZaax+26T5QcInylWBB6y107u3VY+ZPJUvoENjEo3K8sKDRJphTyG0l
 SgNZ+i1W7W2dfxXfOLsXQLXFdy0Oy19blEx9VGU5LAajyAPzAowLQubLEVzrhHLnlfP3
 qpAw==
X-Gm-Message-State: AOAM533RM/1cwt89oTlZW6sW1T/JBIshQ78jyPcoCKEarV4FjtgG+n6K
 0y4oNGBUFZzEyi9Tx9nyMNtXOSaMfY4SlvkeUwAFj2YqMDylr39KrlQLjPseih376aKQKeQHY3V
 SroHyvkRvRaLjYi0=
X-Received: by 2002:adf:ee0d:0:b0:1e3:f28:487f with SMTP id
 y13-20020adfee0d000000b001e30f28487fmr1647195wrn.620.1645005432004; 
 Wed, 16 Feb 2022 01:57:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtEnQBhjn+n5iZ+AneRnsWWi2cykpgGMrlZ5wyVlEm/ZafsK1co/HIBMdw61EXOYwzyVRBow==
X-Received: by 2002:adf:ee0d:0:b0:1e3:f28:487f with SMTP id
 y13-20020adfee0d000000b001e30f28487fmr1647179wrn.620.1645005431770; 
 Wed, 16 Feb 2022 01:57:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id ay34sm12889256wmb.29.2022.02.16.01.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:57:11 -0800 (PST)
Message-ID: <24fd99ab-d2b2-1c0c-7273-0321300cc5cc@redhat.com>
Date: Wed, 16 Feb 2022 10:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
In-Reply-To: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
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
>   TESTS+=hello-s390x
>   TESTS+=csst
>   TESTS+=ipm

Your patch is missing the following hunk:

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 16b9d45307..54e67446aa 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -7,6 +7,9 @@ TESTS+=ipm
 TESTS+=exrl-trt
 TESTS+=exrl-trtr
 TESTS+=pack
+TESTS+=mie3-compl
+TESTS+=mie3-mvcrl
+TESTS+=mie3-sel
 TESTS+=mvo
 TESTS+=mvc
 TESTS+=shift


With debian11, I can build the tests. However, mie3-sel seems to have an issue:


  TEST    mie3-compl on s390x
  TEST    mie3-mvcrl on s390x
  TEST    mie3-sel on s390x
timeout: the monitored command dumped core
make[3]: *** [../Makefile.target:156: run-mie3-sel] Error 132
make[2]: *** [/home/dhildenb/git/qemu/tests/tcg/Makefile.qemu:102: run-guest-tests] Error 2
make[1]: *** [/home/dhildenb/git/qemu/tests/Makefile.include:59: run-tcg-tests-s390x-linux-user] Error 2
make[1]: Leaving directory '/home/dhildenb/git/qemu/build'
make: *** [GNUmakefile:11: run-tcg-tests-s390x-linux-user] Error 2

qemu-s390x gets killed via

"Program terminated with signal SIGILL, Illegal instruction."

-- 
Thanks,

David / dhildenb


