Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79D35FBCA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:44:43 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlRK-0001zl-9E
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlPr-0001Ob-IF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:43:11 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlPo-00013G-N1
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:43:11 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso11377264pjh.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eNA2Ob+heu1g2KPcoi5xolm6BDBRd/FEA1b2k9xu/jM=;
 b=zJqkzJ3KfU+TUbsjdcmrTfuZHi2yFkhRen4DlKZvh7fq92D7ycSzyxSGrsY+0aeTcG
 +/XvKOUrhM8jz0wr/CHIft1sjlOr+Xxxs7hxqMXc5B4HixVtD/ofjUcqnYIEQPfb1QOq
 gt/keos83cIzI2s0kUDWnIyO9Y9oY1HzlyLP7k6NStpEO3bo+LHVwbN4eJLpLFQme0/9
 8vmjSa5hZ9KWPnBeRlZUF0iQS1GEmQQ+eirlvCiKxG0fGcI+dY9CQ48uahrO4faW6TFX
 TopRNtSMB7CeDMhFkN6plxDGM5NvX9bR8QPgC4U6MehzjcCmCReU/trQLdYxdHonIwYy
 fFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eNA2Ob+heu1g2KPcoi5xolm6BDBRd/FEA1b2k9xu/jM=;
 b=l/KKQsrCDYvOGqnGhaYXKULnSG4rxF0jtAdo7BSRj4pn5K/gW6XgkiHGI8hmtN7qM1
 A+Pq15Aw0FHU5yusRwHCUuNbn9w0dwIc7iiio+VGexvA3Slr5+7AQnLZhK5c+SNrZtjO
 NeKRg7gU0hpUZYmqRRDMHILGjIia/jZJchIsuH4GF+ExWaPDn7iW6iDj7nInCWTfMcjw
 aSHw9hDUZox3RX+LF0iXewsCmTPpzqkhPXD3VEyIboBab62Z80e6t68ot/rpJIxgGABR
 7YukA0v3OzRqVGXOR6NCxgZTeMOwWJQBewzisQDEgr198zIa9WrTQOLQmRF5mgzit8a+
 GuJQ==
X-Gm-Message-State: AOAM530nw2UwfTtlciCKU4UUFUHk833Cs7R8HnboLCO9KXmpNT+xtEFY
 jxaxqURiuZ8WwfWnsbHYhRLUjPNfaUy2BQ==
X-Google-Smtp-Source: ABdhPJzaFSY6RvtlxoPe2DLd5XAY8SmB1IMaQgwdVfHaKk7I15e1Ra2qQ5BwX2jAi+WcmSy0nBAx2A==
X-Received: by 2002:a17:90a:ec03:: with SMTP id
 l3mr3341927pjy.61.1618429387138; 
 Wed, 14 Apr 2021 12:43:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b14sm194491pft.211.2021.04.14.12.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 12:43:06 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Max Filippov <jcmvbkbc@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
Date: Wed, 14 Apr 2021 12:43:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 11:03 AM, Max Filippov wrote:
> On Wed, Apr 14, 2021 at 9:51 AM Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>> On Wed, 2021-04-14 at 16:48 +0200, David Hildenbrand wrote:
>>> Did you double-check the xtensa issue?
>>
>> Oh, I'm sorry, I completely forgot about that one. I just ran the
>> test locally, and apparently it fails because of this new assert, so
>> I'll have to write the 4th patch now. Thanks!
> 
> Just curious, what xtensa issue?

Returning from xtensa_tr_translate_insn with tb->size == 0.

Basically, dc->base.pc_next needs to be incremented even for illegal 
instructions, preferably by the number of bytes consumed while determining that 
the insn is illegal.


r~

