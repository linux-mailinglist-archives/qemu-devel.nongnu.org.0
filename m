Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAAF4C11F1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:53:09 +0100 (CET)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqCh-0002fj-Jz
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMq9d-0001Qy-IV
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMq9a-0005ZY-LA
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645616993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XmNASTnRslCn5tUx2+rHIzIpNTGKd2t/Vfe83bLd3s=;
 b=bf6YBv5WEnMQ2LBCeUOwm7SBGSZ+a/x2pTkprs3HK6KMGrntlRZKObrLgoiiUY8iXkou4j
 q+dMvSrDy5bQR8sW+vzpGAMrxK3UPyL4lrzpAdmH1kuk4yzjJWoX9rqRgM8F51d6hxx/wQ
 4uRdpHK3ikRpP0b2AF0b/GmjHJczMwk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-9P212hwJNu6yNOuiQfmfBQ-1; Wed, 23 Feb 2022 06:49:50 -0500
X-MC-Unique: 9P212hwJNu6yNOuiQfmfBQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 m2-20020adff382000000b001edbdae0527so270283wro.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 03:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9XmNASTnRslCn5tUx2+rHIzIpNTGKd2t/Vfe83bLd3s=;
 b=1LLbYFt4akKjbg/OM94y3kd0s4sGTmpex9dmQEX7idl1GlVk4/nEQBdIxXVSekS/TN
 HyVDFnyKYZuwgkIr5dIUZKa0cnwl3djstVGgCR1yVQJkEVKBVvJjyiql0TBfBPoWO33B
 a1nK/Ep0oUpxZnisuh/7EgEtU5rehGbE6AdMY9oRNq5XhQyf78nHyUwPy0lj7NUVQ8Hr
 7DCa9D8lmnt8Gn635d0c3u2gBHcwSGNHMAScYitA4vLNowFJDVUsSBwFRXfEfTaPAXXM
 E10+xhb6+anJu4v02znbfqSv+vFAH2WlLKaSWmuU8xiW+U8Ye2cKoNOfCmcFSuxz1S78
 7jnA==
X-Gm-Message-State: AOAM533MMcjs0bcTXob6j6x1QLw41LNIJA6IdqibnTiYAmxrPSOb5s/A
 9Jyx1f9ElAac7IEloxfzOjaARYWpMwt3QW+cQxbNtskvfcJG3umgkwWW4pugl/6kv7h0Y59nltl
 ooCY0N8+XCns2kgw=
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr7214376wma.75.1645616989714; 
 Wed, 23 Feb 2022 03:49:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoAzkrbAJws/P/g+U0ptBKl0+vFtG0ttuDlXrMdXl4uYuPXVof0SDDbYy+ZoqJHqkOG59LFQ==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr7214344wma.75.1645616989406; 
 Wed, 23 Feb 2022 03:49:49 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m62-20020a1c2641000000b00380d0cff5f3sm5023554wmm.8.2022.02.23.03.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 03:49:48 -0800 (PST)
Message-ID: <14eaf7fe-78f7-438e-1502-c646965c024d@redhat.com>
Date: Wed, 23 Feb 2022 12:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
To: David Hildenbrand <david@redhat.com>, David Miller
 <dmiller423@gmail.com>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-5-dmiller423@gmail.com>
 <e0b1e009-6684-6a4a-a8f3-1fd6048a89ad@redhat.com>
 <12e026c0-1c27-db38-2404-85d572ae2bd9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <12e026c0-1c27-db38-2404-85d572ae2bd9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 23/02/2022 11.54, David Hildenbrand wrote:
> On 23.02.22 11:44, Thomas Huth wrote:
>> On 18/02/2022 00.17, David Miller wrote:
>>> Signed-off-by: David Miller <dmiller423@gmail.com>
>>> ---
>>>    tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
>>>    tests/tcg/s390x/mie3-mvcrl.c |  2 +-
>>>    tests/tcg/s390x/mie3-sel.c   |  6 +++---
>>>    3 files changed, 15 insertions(+), 14 deletions(-)
...
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> ... maybe best to squash this into the previous patch, though (I can do that
>> when picking up the patch if you agree - no need to resend for this).
>>
> 
> Do we need this with my debian11 container change?

I just tried without, but this breaks on s390x hosts with older compilers, 
where the TCG tests are run without a container:

https://app.travis-ci.com/github/huth/qemu/jobs/560854945#L12875

Since Ubuntu 20.04 is still a supported s390x build system for QEMU, I 
assume it's best if we squash the .insn patch?

  Thomas


