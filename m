Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18A3E13F1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:35:21 +0200 (CEST)
Received: from localhost ([::1]:33862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBbei-0007Iv-3J
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mBbdN-0006dj-To
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:33:57 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mBbdK-0004aj-Eu
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:33:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hw6so8998925ejc.10
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3zUeHBvOzVCzxMP+rcC0oNmNP9/lkO1VjVZLhwAXw60=;
 b=dYPfw2Y5z54n2Un2WceTR5Jwt96fDEyWJ9AoCk0+rku9JNPvrzLmXRB6H9Jqdt/1Vq
 htHz/GdZZ8X6PnOH7lS38PSA9hTNfgClKz/ikGQ/IScAwXEDoTrIv7ZFAeoMuj9q5VR3
 dV2rAic7qxzrbYP4QnXhiFTYdgAAsReYUfCzX/ahuTnkRWoU2v/Dt+BI1BiMOmquV3z8
 ptOcWTsASsu9xrb4tbM3QOGjybgd1/KXqZ0hynIvQjZBIt21PGLW1fbMfwbLbviNzB/E
 GSxk7ZjTsOIOCnAgedDC75iCqfwjKSTozMgE8Mh5fWYpsPxFpDMT6ZQPPj7a4Xc9+pQF
 1jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3zUeHBvOzVCzxMP+rcC0oNmNP9/lkO1VjVZLhwAXw60=;
 b=jPE4xvO8e71LrvRDxRlQYNQSqPpSsD51P4fEwjiNoLEmLuY+zDs+N5TY6NXwso3FId
 pAaTEKjvfKaFlcxBF4Kd2SVWRoLPQRHrnzP4GOK0SQMKtliT8v4kS7xw6ISxhYbL9kGq
 bh9MdmYgHJbcpRMAVDhTbH26fflZWMnFZVy46WNeZ6TuUjFb4KNWiHguVMPJxOfGfDkZ
 nkpu5ZAqinbVonFU9a8muQn/C5dQ6D9NOGmqUxiK8p2kjAP2UeWwGYQqFxr60biGIEZF
 Wof0lbL2w5DlxgukcSte5SOleR/hUyVCoEl0O/z+VfWeKgIlgP6eHpYvYf0X9DLKFKKK
 q+RA==
X-Gm-Message-State: AOAM531/6E/5oK8ignosP/S0Uf75u4LvI4azsyPHCUK9Yo9fHzpOa0jt
 b67zLDn9ktHbqldU5OsNZadU7toYHm0EyA==
X-Google-Smtp-Source: ABdhPJxhY93bRu1lImn3IBAgPyXViGyH9e+D47xM0Q04L3Rm5o4jIH6g0UG7jpipWRSCjGUrXkF2nw==
X-Received: by 2002:a17:906:7e04:: with SMTP id
 e4mr4315159ejr.225.1628163231912; 
 Thu, 05 Aug 2021 04:33:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id de49sm1626448ejc.34.2021.08.05.04.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 04:33:51 -0700 (PDT)
Subject: Re: [Bug] x86 EFLAGS refresh is not happening correctly
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stevie Lavern <stevie.lavern@gmail.com>, qemu-devel@nongnu.org
References: <CADV2EAvr0Sb55TE=uffkb4Z17ZHNBCZGLm0nA94qKZrx1WM35A@mail.gmail.com>
 <0d982751-7dfe-9a45-df5b-fbe57d36ccef@redhat.com>
Message-ID: <380cef7a-fe5c-9252-e791-400c44486c2c@redhat.com>
Date: Thu, 5 Aug 2021 13:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0d982751-7dfe-9a45-df5b-fbe57d36ccef@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/21 13:24, Paolo Bonzini wrote:
> On 05/08/21 11:51, Stevie Lavern wrote:
>>
>> Shouldn't it be:
>> eflags = cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
>> as eflags is entirely reevaluated by "cpu_cc_compute_all" ?
> 
> No, both are wrong.  env->eflags contains flags other than the 
> arithmetic flags (OF/SF/ZF/AF/PF/CF) and those have to be preserved.
> 
> The right code is in helper_read_eflags.  You can move it into 
> cpu_compute_eflags, and make helper_read_eflags use it.

Ah, actually the two are really the same, the TF/VM bits do not apply to 
cpu_compute_eflags so it's correct.

What seems wrong is migration of the EFLAGS register.  There should be 
code in cpu_pre_save and cpu_post_load to special-case it and setup 
CC_DST/CC_OP as done in cpu_load_eflags.

Also, cpu_load_eflags should assert that update_mask does not include 
any of the arithmetic flags.

Paolo

