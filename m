Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98D6BBBB7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:11:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVZC-0003w6-LN; Wed, 15 Mar 2023 14:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcVZ9-0003vG-0F
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcVZ7-0005vS-Gt
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678903771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1E7cLUwA+wQBkum39jdkU6rvwx6CoJ0lJK5KE9p9R78=;
 b=Jr0HirDF0Kb79n1kBTHAHLlT6skQ48p51a84F7noN8BoDJZVrKAO4i+pNmFMKx7DfL8hsi
 q0CWCdi9iAp0l3nojkDYypzZEc/45bSpQIcKyac6BMsdSUODHqqpWxN/5AdCEywFLOIRmb
 p/ImyLln+YLIiBb/HQXNoCMwu4H0gcQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-pGY29K9DOOeim35p4DQRkQ-1; Wed, 15 Mar 2023 14:09:30 -0400
X-MC-Unique: pGY29K9DOOeim35p4DQRkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m30-20020a05600c3b1e00b003ed31d151ecso1061421wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 11:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1E7cLUwA+wQBkum39jdkU6rvwx6CoJ0lJK5KE9p9R78=;
 b=QFxnt3cl/MuODHU9KYXpHuQB5yoerCd4UWHaswGMPDQkSRtL384uuG5pkzPFdDOyB6
 KzMCe1cvMzfuI2fvxqR1X/w9DokwmZ2TlCIV4tZ+kifX024+icr13gOf9AdyOjisZVn8
 su3LJuTgCEws58ZsCt4Gnn7Z63e4DcTzYdO158pu94ttyAyUC56sMuT87pHYVccuxPDd
 WzBWFVPPjq7qmhWIlaeE6rpw0crYu7bZQx3uButu1cpYTErBj143AM7Ynox2NWhRYKPJ
 0HehqSOgRrXXqi7LyBky62hs6dMCG+f2uTkecC5VRaNw8VPaWr2RDB/bgoulxLxCXuIL
 HSRw==
X-Gm-Message-State: AO0yUKUqCj6nYpyA++o60WYFzWBB8qF2jUaJMhsu76djxpS0vSJq2r2P
 eo/sc999EpO0cqMPwxgrdOh+zNxoSIrE0FpGH68A6g7T+Ku1KBbT3yzrHVyvLjW+lgihZSxaJG9
 ldnnS0qaUc+xtNbY=
X-Received: by 2002:a05:600c:4686:b0:3e2:201a:5bce with SMTP id
 p6-20020a05600c468600b003e2201a5bcemr18077443wmo.40.1678903769029; 
 Wed, 15 Mar 2023 11:09:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set8mIOaxh2OHgzJAk8ltBSF4jlM0odpuHhEKQYJgrOQbtXJTday5Ak5d9sJP4WzvYc4BNwOtiQ==
X-Received: by 2002:a05:600c:4686:b0:3e2:201a:5bce with SMTP id
 p6-20020a05600c468600b003e2201a5bcemr18077427wmo.40.1678903768746; 
 Wed, 15 Mar 2023 11:09:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 b10-20020a5d45ca000000b002ca864b807csm5359859wrs.0.2023.03.15.11.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 11:09:28 -0700 (PDT)
Message-ID: <ef02ec32-cee8-6d89-4cdf-b8934ec9b1a4@redhat.com>
Date: Wed, 15 Mar 2023 19:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 12/12] tests/tcg/s390x: Test unaligned accesses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230313153844.9231-1-iii@linux.ibm.com>
 <20230313153844.9231-13-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313153844.9231-13-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/03/2023 16.38, Ilya Leoshkevich wrote:
> Add a number of small test that check whether accessing unaligned
> addresses in various ways leads to a specification exception.
> 
> Run these test both in softmmu and user configurations; expect a PGM
> in one case and SIGILL in the other.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
...
> diff --git a/tests/tcg/s390x/ex-odd.S b/tests/tcg/s390x/ex-odd.S
> new file mode 100644
> index 00000000000..0427c79d8a4
> --- /dev/null
> +++ b/tests/tcg/s390x/ex-odd.S
> @@ -0,0 +1,17 @@
> +/*
> + * Test EXECUTEing a non-mapped odd address.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "asm-const.h"
> +
> +#define CODE                                                                   \
> +    stringify_in_c(    lgrl %r1,odd_addr;)                                     \
> +    stringify_in_c(expected_old_pswa:;)                                        \
> +    stringify_in_c(    ex 0,%r1;)

This fails to compile with Clang 15:

$ make check-tcg
   BUILD   s390x-softmmu guest-tests
tests/tcg/s390x/pgm-specification.inc:21:49: error: unknown token in expression
     lgrl %r1,odd_addr; expected_old_pswa:; ex 0,%r1;
                                                 ^
  Thomas


