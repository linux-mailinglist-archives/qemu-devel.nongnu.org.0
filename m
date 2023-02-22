Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CC69F3C6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 12:56:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUnhg-0004Ib-5X; Wed, 22 Feb 2023 06:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUnhd-0004ID-QA
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUnhc-00023P-4Z
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677066864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxfLqkCTi7Fg0oiN2MFnhcL+G3NKVFdocwqcdt98rxo=;
 b=c9aNVHdKKhfP5uUlDevdVdOsHd6uZInUzzDhBuR2lJy9lmGse61193o3wJTa0EPKO7QuNx
 w4LtjSSjtq+j1xIxIqyMHkZJNsVZvfzFdkhKSUqoqBq0fRZD9is/iAHgaDbF1aXacxNFhm
 oEIidLRC7HaHIK80OOIxpMfmMq2Y7y0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-uf1rha5nMnemCqgUCTDd2A-1; Wed, 22 Feb 2023 06:54:21 -0500
X-MC-Unique: uf1rha5nMnemCqgUCTDd2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 c65-20020a1c3544000000b003e21fa6f404so3611107wma.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 03:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bxfLqkCTi7Fg0oiN2MFnhcL+G3NKVFdocwqcdt98rxo=;
 b=wYdU5ItgO0WzGJxct30XOY70d3oG7RR9EXpcw6BNE8j4B3Rq4smY42y7tH/pIsYapv
 VO+g+hzyZ970gGFf0q3w1MfD4EQ/d/PcoGltVYhFo2z0/3x5PnfChEHvRMFgDamUqgTC
 fop2A1ppDpN/+YKFscCoH3Ti5dQNKhWrJDeQDzz2PNEmeuVMTXXfEmp+xsfKGD9RG0cT
 wZhiV5LbC/+amIfyr8E95tbXxv4Y9fJvBsehEqaqcOSZHPDUauC6FOnSXrpsMdsQv3W/
 lY66IKQYbMZl2zH+mG8rHuOXuGiu2ta/X8Bw/B/+xgoFESerIyKwxebSNsdXyVt+DC+0
 22vA==
X-Gm-Message-State: AO0yUKUD4U7/2bmu4J/MAdf7x0+PNuEUfOiNnhUMC5uKYg4zd06FQrLa
 izuPlmkGNZcWflBGsBThlqcLTqvTFA3Bf411L10rQow6Rl2/BHnzTadnBN0lYCNGIFGtArH0Awn
 fjro1dF5TLfEL/ko=
X-Received: by 2002:adf:fc0e:0:b0:2c5:98f2:5b1d with SMTP id
 i14-20020adffc0e000000b002c598f25b1dmr4817743wrr.63.1677066860303; 
 Wed, 22 Feb 2023 03:54:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+WVAKjpQWYDGJ+6dF8+QHCaXY/Olqi9vLsTcH9Wjt67Za6f7I/iZgDshpBDCrlvfYPhO9XUQ==
X-Received: by 2002:adf:fc0e:0:b0:2c5:98f2:5b1d with SMTP id
 i14-20020adffc0e000000b002c598f25b1dmr4817733wrr.63.1677066859999; 
 Wed, 22 Feb 2023 03:54:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-156.web.vodafone.de.
 [109.43.177.156]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfdc8d000000b002c557f82e27sm5416098wrj.99.2023.02.22.03.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 03:54:19 -0800 (PST)
Message-ID: <748e0508-b7d3-e0ba-efc4-738f8dbb3f6a@redhat.com>
Date: Wed, 22 Feb 2023 12:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
 <f0eb7a7c-8505-ee8d-af5f-259c2627958b@redhat.com>
 <b0ed61bd-5146-c142-8ad0-2df61632b42e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b0ed61bd-5146-c142-8ad0-2df61632b42e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 22/02/2023 07.29, Richard Henderson wrote:
> On 2/21/23 18:06, Thomas Huth wrote:
>>>   int postcopy_wake_shared(struct PostCopyFD *pcfd,
>>>                            uint64_t client_addr,
>>>                            RAMBlock *rb)
>>>   {
>>> -    assert(0);
>>> -    return -1;
>>> +    g_assert_not_reached();
>>>   }
>>>   #endif
>>
>> If we ever reconsider to allow compiling with G_DISABLE_ASSERT again,
> 
> ... and we shouldn't [1] ...
> 
>> this will fail to compile since the return is missing now, so this is kind 
>> of ugly ... would it make sense to replace this with g_assert_true(0) 
>> instead? Or use abort() directly?
> 
> With g_assert_true(0), definitely not.
> That is a testing-only item which can be disabled at runtime.
> 
> With abort(), no, since g_assert_not_reached() prints file:line.
> Indeed, I was suggesting the opposite -- to replace abort() without 
> error_report() with g_assert_not_reached().

OK, fair, makes sense. I now slightly remember we also had similar 
discussions in the past already, so these hunks now sound fine to me, too.

  Thomas


