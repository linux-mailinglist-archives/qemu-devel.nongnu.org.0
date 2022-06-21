Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72230553991
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:34:49 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ii8-0008Hk-6v
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3idl-0005RR-Qg
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:30:19 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3idj-0003IL-Ey
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:30:16 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h34-20020a17090a29a500b001eb01527d9eso13461878pjd.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8O8c34nd5GjCzbszSrziPVyfmu6tKSMdQMnuwMx1cA8=;
 b=u9jF1t7kRTgbrNc0QtwmleUjugzjMPhbFqi89/1guXcQl+0wWmUI6JSLt0GTEs632b
 ivwEy+pA7tUgavavnhSgyy+0IaUdj0l6ZMYYzllHl7I+Dv5+RG91fnX7JVg3L3KXguV4
 GLLW6sQMCdqvHe4Dd1l6BQ3TAL2A2+/sqv8DmbD8y0VmB0ghnD7cIjdayrR1uy5TioTM
 Wvf9i/o5zLAeNVahNcQbYOFK3puY8pplaITfcxUQhYh8o3jLenD5HWPG2VrRZHbh7ess
 zVv/hbhJKystidKKAN4DlBxXMJQC6ZgRPziGhTM1zYb2NhJHKPtBFa2WLlyyUxvA9hhV
 kgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8O8c34nd5GjCzbszSrziPVyfmu6tKSMdQMnuwMx1cA8=;
 b=u7tGI59U/MVrXya5XCIPuxjNcleQZFlbmt2Ir+rgI0OR+a3UMToWNXWGKvsuyeVwwV
 6Tvm371/oZnzyutHnU5bMhX3Voj7I1o0Oy4iV+hYH1d2FFziz2W1RdMHEIGRVlgso/wN
 fU4cSBT5f7WBef6ppUfg4pGfjthCGxr9HUE6+Ho76IBCD6yjNiJZphcZGD0HOplHg+3V
 swkGjC1Y7X1wwHdr28b32A5Oh7fDEuH470BKXN2SFA6cAhpWl9zkzGiAmjDaOU00yS5h
 NstKfZ9fvUQ5VyKXs9U7UA53mJQsfyAXwnz62lvnRc5HJbRjfJMF67iFg3mV8U36ncrZ
 kczw==
X-Gm-Message-State: AJIora/GHwylyyVzjUrLM1/5ZPuBMfw1iGAjDzqlUP9j2dvGI+TKZwa0
 T9wwouwz0DA45RFYCO0fHa6G6g==
X-Google-Smtp-Source: AGRyM1tVBLJzhYdq8rQ6bwfBZpjh6eL3TcpeAYV7mHWPXzJ+V42DcKVRoQlSX1871HCJ/As1BqIP8A==
X-Received: by 2002:a17:903:204c:b0:169:9e3:6840 with SMTP id
 q12-20020a170903204c00b0016909e36840mr27334371pla.77.1655836213044; 
 Tue, 21 Jun 2022 11:30:13 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a17090a648e00b001ecd48b80a2sm875303pjj.5.2022.06.21.11.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 11:30:12 -0700 (PDT)
Message-ID: <c11648fe-7bff-41df-f11f-bdb46f8a672c@linaro.org>
Date: Tue, 21 Jun 2022 11:30:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
 <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
 <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
 <b49f2611-55f5-ba8b-df9f-13ab13bbad09@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b49f2611-55f5-ba8b-df9f-13ab13bbad09@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/22 09:58, Paolo Bonzini wrote:
> On 6/20/22 18:41, Matheus Kowalczuk Ferst wrote:
>> On 17/06/2022 07:12, Paolo Bonzini wrote:
>>> Hi Matheus,
>>>
>>> could you please test the tests-tcg-next branch at
>>> https://gitlab.com/bonzini/qemu?
>> At be6090bcac10, it works if no BE toolchain is present. Otherwise, the
>> script probes powerpc64-linux-gnu-gcc instead of the native tools for
>> ppc64le-linux-user, and then do_compiler fails because the
>> $target_cflags contains -mlittle-endian.
>>
> 
> So the problem in that case is that powerpc64-linux-gnu-gcc is _not_
> biarch and thus does not support -mlittle-endian?  (I thought PPC
> compilers were all 32/64-bit and bi-endian).

Nit: this is ppc64le-linux-gnu-gcc, built for gcc135, a power9 ppc64le host.  It *does* 
support -mbig-endian, but not -m32.

At least gcc11 as release was not biarch, with no special configure arguments.  I can try 
upgrading to the current gcc12 release to see if that changed...


r~

