Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E060C1E1DD7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 11:07:15 +0200 (CEST)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdVYI-0000Ij-VM
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 05:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdVWn-0007EF-HP
 for qemu-devel@nongnu.org; Tue, 26 May 2020 05:05:41 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdVWm-0006IK-SQ
 for qemu-devel@nongnu.org; Tue, 26 May 2020 05:05:41 -0400
Received: by mail-ej1-x641.google.com with SMTP id l27so858975ejc.1
 for <qemu-devel@nongnu.org>; Tue, 26 May 2020 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AaGpGWJIxRyf8KvgXf1g5vnImU0jWseT1eVif382Tus=;
 b=USVB0tDNuDrHzhIreWLHqUtpB532HuBkwo//INkeoRCXEQh7eOKerKk1R2qiOJIO/V
 XINyvTAQgNYjkBx8RqOW0AqBV+nLX4+1KdSYV4oMPhU+IUcBKeUcYl4GGYSomuXuaaHZ
 YJKDcA1OjVWJBs74xhk5C4LmH/5Y53rWD44SpzJGwLmew50ajUCN+lBqVI5OGdO2m7dJ
 ShI9i14XZGPGAnfJzEi9EbuJdyS4RgmeMNS/e6o8jPG0mw/kZpILg/Dcxrulp8y0U1Jm
 bOIJGsg2M0tXYWs2IstTFq0mfyEkEJ268p4WiN+AODl3NmGckxsXaQm671X8SRWS3oUC
 Sm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AaGpGWJIxRyf8KvgXf1g5vnImU0jWseT1eVif382Tus=;
 b=mEAUQ7zmGZcMAf+9lP5g4X4WIbEiZ707V7Ope9Zyj4F+qpaUBHzBy7hlJl5T4/wvK5
 pv/ggUsOJJktQevOH15WpVhobTq0Gl5Zihlj5smG7HOtPGPFepPOPXZ9ZJwbtkJb/j5g
 BSdzo9mzQvx8Qp5A0FxqnsOfAg2pNgWrAzEOY4bgyXnd3lbBblqVOjGJbCcOhJi0hzSA
 osn+QpVycwYi5AgXRKZcMVHFshctf9px2ukrywRx5avuS9Z3+JWe0U+JWTbWeCT9aSrp
 wuVT9p1tMfWzK/8/+dOz44IyoGshkhTJ5eZc6qf/pDe9NJI4aFf0JfX24U7vxO/q+seR
 cKfg==
X-Gm-Message-State: AOAM530Xqu/+ynAopB9Ws6oHa/z/JqP2DY8TkpSnquptToORxCi+HEYS
 O3LMTlFMk0/8ajLvfq2Xf3k=
X-Google-Smtp-Source: ABdhPJxpmldVjdB1yKOwYB06dSsb0MfoISpIV5fCAm5/u8GejvDw+DllAQ9zLaNsn1U99XLH73KIUg==
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr216795ejr.269.1590483939227; 
 Tue, 26 May 2020 02:05:39 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id s19sm15630242edx.92.2020.05.26.02.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 02:05:38 -0700 (PDT)
Subject: Re: [PATCH 0/2] tests/qtest/fuzz: Avoid QTest serialization
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20200526055820.12999-1-f4bug@amsat.org>
 <20200526085609.GA766304@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0e3f6528-b26e-6b5b-be23-f7cf79c216f5@amsat.org>
Date: Tue, 26 May 2020 11:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200526085609.GA766304@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/20 10:56 AM, Stefan Hajnoczi wrote:
> On Tue, May 26, 2020 at 07:58:18AM +0200, Philippe Mathieu-Daud� wrote:
>> Hi Alexander,
>>
>> I forgot to share these 2 patches wrote before
>> the direct MemoryRegion fuzzer sent yesterday.
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daud� (2):
>>   tests/qtest/fuzz: Avoid QTest ioport serialization
>>   tests/qtest/fuzz: Avoid QTest mmio serialization
>>
>>  tests/qtest/fuzz/i440fx_fuzz.c      | 19 +++++++++++++------
>>  tests/qtest/fuzz/virtio_net_fuzz.c  |  6 ++++--
>>  tests/qtest/fuzz/virtio_scsi_fuzz.c |  6 +++++-
>>  3 files changed, 22 insertions(+), 9 deletions(-)
> 
> Will it still be possible to print qtest reproducer commands when a
> crash is found?

Yes, there is no change in the corpus format.

> 
> Other than this concern, higher fuzzing rates would be great.

Thanks,

Phil.

