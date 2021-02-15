Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E431BAD1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:14:56 +0100 (CET)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeeN-0005Ho-Eg
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBeck-0004on-Ue
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBecf-00047W-B0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y94o4QfOrAnlGT9icCH156puQRsnvoX1yxYoDR8/eTw=;
 b=WII5Ryv3oqVXPBfO81BHXn3OgT7LXwteEBLmRUXMD4J/1Uz8d7TLstbjxfyqM/siz2kLWA
 QoEvb73BKQopxBI6a//AERhq4UjYmdGzAL4S1hj5c5Ls6WkAa7Svgof959Jww8hhgnf3hJ
 tZI00/oCgKrVscnJgBybatFZwtUGT2M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-BzEXrFPrNzWtffwdUKkSqg-1; Mon, 15 Feb 2021 09:13:06 -0500
X-MC-Unique: BzEXrFPrNzWtffwdUKkSqg-1
Received: by mail-wr1-f69.google.com with SMTP id d7so9975532wri.23
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 06:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y94o4QfOrAnlGT9icCH156puQRsnvoX1yxYoDR8/eTw=;
 b=hlwVGI+pugLAAlCIwzI7kd52zwnJ2Iyom3QmWKgaR8I9Ev4bxt6pH4XQ+BaKlmgulK
 QHrOWFBXkoFkHzVCrBX06I5OdsK0Rmc9K68GtkJR07EX29JzmdxGCEOdlE0jwz+SEGih
 i49qvrZ92K9OgMu+oSYZvpx/ZtrT0dDXzyBe1YsuNRBWnmaQjQyRSLV3iA/P/cq9/Gtz
 9qi+z8L5dGh5M2dYu12C4aog0c25Y12LrHdEStwy8jmJ9sttZA/lcZK9/9Rd0D01S6LF
 b1v7urABOm78HDMDq4/mKJ+RKZ2iX6EMntVsGBspDGeEBdwetWXhzwWP0vh44yrWdzK+
 KvLw==
X-Gm-Message-State: AOAM530ohFAPyK+dMVtGgzryssk9Wg6yBY9P0w89/jBm64MclxA/3TPm
 7a0CBWwF/NZ5PihcKld/PV3M/g9w4nZ8iTliNLJaJwkxEflvrVDiK6pAdk6aMK2p3jmbuElqBzU
 SujYYJcT+xgMpN5rXIN8LLQVbwweRbm8HzEdqM97cVzgd9wZa45XgspZPsoaaT3oY2eA=
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr14656727wmj.182.1613398384981; 
 Mon, 15 Feb 2021 06:13:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwafqqbHEvvz/y3YXOfMxG6w7JRbuXSBph/EYICLe9pEJSxn1cRhQI+1Lu15J03J8weLN8uqg==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr14656707wmj.182.1613398384716; 
 Mon, 15 Feb 2021 06:13:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k11sm23414864wrv.51.2021.02.15.06.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 06:13:04 -0800 (PST)
Subject: Re: [RFC v18 08/15] i386: split smm helper (softmmu)
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-9-cfontana@suse.de>
 <b6b053ef-998e-08ef-4354-27cdcfb331e9@suse.de> <87y2fptss2.fsf@linaro.org>
 <2a001d15-9b17-d356-aa2b-578f58fe63c4@suse.de>
 <0cc5d1ab-088f-1b49-23cd-ecb3703329f0@redhat.com>
 <5ad012e6-4b28-fdbc-c17c-9ec2dedb377f@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a706bec6-59af-0596-48c1-efa062fe846c@redhat.com>
Date: Mon, 15 Feb 2021 15:13:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5ad012e6-4b28-fdbc-c17c-9ec2dedb377f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/21 15:05, Claudio Fontana wrote:
> On 2/15/21 2:30 PM, Paolo Bonzini wrote:
>> On 15/02/21 13:59, Claudio Fontana wrote:
>>> Yes. The difference between before the patch and after the patch 
>>> is that before we were still going through all the code in
>>> tcg_gen_callN, via the call to gen_helper_rsm macro, only to call
>>> finally an empty function for CONFIG_USER_ONLY (helper_rsm()
>>> {}),
>>> 
>>> while now we do not generate anything, we do not call the
>>> gen_helper_rsm macro at all, so we don't go through
>>> tcg_gen_callN.
>>> 
>> 
>> Can we even have an abort() for such cases?
>> 
>> Paolo
>> 
> 
> Hi Paolo,
> 
> where are you suggesting to have an abort()?
> 
> You mean that we should abort() QEMU as soon as we detect in
> translate.c an RSM instruction in user-mode?

Translating it is okay (it's just a guaranteed SIGILL), but I'm thinking
of aborting if s->flags & HF_SMM_MASK is true.  Likewise if we see
CPU_INTERRUPT_SMI.

Paolo

> 
>     case 0x1aa: /* rsm */
>         gen_svm_check_intercept(s, pc_start, SVM_EXIT_RSM);
>         if (!(s->flags & HF_SMM_MASK))
>             goto illegal_op;
>         gen_update_cc_op(s);
>         gen_jmp_im(s, s->pc - s->cs_base);
> #ifndef CONFIG_USER_ONLY
>         gen_helper_rsm(cpu_env);
> #endif /* CONFIG_USER_ONLY */
>         gen_eob(s);
>         break;


