Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750974DA155
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:33:12 +0100 (CET)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUB2l-0000vJ-Ik
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:33:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUAze-0007gv-07; Tue, 15 Mar 2022 13:30:01 -0400
Received: from [2a00:1450:4864:20::630] (port=40488
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUAzb-0002j4-9v; Tue, 15 Mar 2022 13:29:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id p15so43058229ejc.7;
 Tue, 15 Mar 2022 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GQEyw8EKgjRPNHoOyf+QB+28jSOj5sxLvwhSBq9SEZ4=;
 b=E9sKCH7PpgHP+C2JGjtIa0U5AfC+VA0Jx1SrERPzeQpOWvV0J7+HcDzj1FTJ4sbrbz
 TgVxcYaq+e7ZJdon5U/fNa1GU3OlPIv/6ho8ntwbJc35gEnXcvwwOI6h2Q6s5NV852Kb
 YUW4Si1wpfqzCmqx/YmTTAuqGASamAU8d5pKuWi1levTKPtAB8W/fNNbZKChqh3O8dtL
 jAjT2ABBOPgn6woEoVOb/uwXUraJ6cwLE2c7VsTu6pNOHoN/oGj3YbdODcgyQolR11/1
 vW9bNvHpiZLPkdr2zMT9EOd/5P37M5n1vbkkgFE5L+Ps47s9rlx7BhaK3r8EyIOC4kFU
 54zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GQEyw8EKgjRPNHoOyf+QB+28jSOj5sxLvwhSBq9SEZ4=;
 b=BQHKE7DWDNUYKgXQLCGTqs/NOr997JmdSm1mU/Y1nRWe9ki8tItMnMQfb+NNMPe9CP
 07gbKrnL8uAdkfYFpz098ssbWgo6iSUqb2DSyB3D/GS3TpG3gz+c8yqNS/LMKtrRIbwU
 FUPJIjLWIZLAd04LrWMln+7ljXoMKL6Tn9nF+8MeBM+MKY3JMtmhei6K6cvIh3S0cwKI
 CiLxB90M7EGEveNR+Vg00G3MsZ0EBuiRj4D4aHAwcvfsA50CRkXgu/Q/RPdl+fhc2Fti
 Yw8ODH5I20dk6c3AI9I8YeutSNTnajU/4xa6dbvSRIWcGlHeQVnnY/D5K8c8AL4yrgxk
 Iz0Q==
X-Gm-Message-State: AOAM532IOytihkKuDlRYkWnBP0OYzUNZpbqEN9YX7kRY/LkRg1EkPygt
 zfbnOOAki7rhgiStePgxzoaHbEz31wA=
X-Google-Smtp-Source: ABdhPJz1H2Dyha4dqZaUulpolI5nONPxSQmM0GYGzDoOy3hqyzLIC9dXkFI6kLS/b7gcoN0Fu7oTQg==
X-Received: by 2002:a17:906:a152:b0:6cd:3098:18c9 with SMTP id
 bu18-20020a170906a15200b006cd309818c9mr23663563ejb.422.1647365392425; 
 Tue, 15 Mar 2022 10:29:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 h21-20020a170906829500b006cef3dcd067sm8458024ejx.174.2022.03.15.10.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:29:51 -0700 (PDT)
Message-ID: <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
Date: Tue, 15 Mar 2022 18:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 15:24, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 14:09, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> Also, once C++ is available people will
>> start submitting C++ patches simply because they are more comfortable
>> with C++ (especially one-time/infrequent contributors).
> 
> This to my mind is the major argument against using C++
> for coroutines...

I agree on the need for a policy, but _what_ C++ are they going to be 
contributing that we should be scared of?  We're talking about:

* major features contributed by one-time/infrequent participants (which 
is already a once-in-a-year thing or so, at least for me)

* ... in an area where there are no examples of using C++ in the tree 
(or presumably the maintainer would be comfortable reviewing it)

* ... but yet C++ offer killer features (right now there's only C++ 
coroutines and fpu/)

* ... and where the one-time contributor has put enough investment in 
using these killer C++ features, that telling them to remove the 
features would amount to a rewrite.

That does not seem to be a common situation, and not even a problematic 
one if it were to happen.

Paolo

