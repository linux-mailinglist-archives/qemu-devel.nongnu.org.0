Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB8345A01
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 09:45:24 +0100 (CET)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOcfD-0005Rf-V2
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 04:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOcdv-00050T-Fq
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:44:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOcdt-0002Qp-Uu
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:44:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id j7so19880201wrd.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TRJwqkDM+7N5us8jhk/gQEaEManjMc6HzNEZ67aJWfo=;
 b=su0F+gBHvjv8EyxMzUXLwD/gm/68PdKDjfHjbRsbGT4iPPs9+nCJstmAyfIDilW855
 1keXiAFvYSoa1iukjnovXDTfl6T7cjgc6NqzBBBwWeJy4XPlw18NPajX59olVE52yO3x
 8cEuWPyn7VHg4QXHuuTDSxV9F9rDczGj8KqTcVcZGw2ByLX6hKV0Dq86aIzTy+wYhOWV
 JBXHPZlDtj/KkPv2Q8yAXi4VfL8SKqXIoNme60KDEboeqpODnzJMhnfhwe/OKuvqD71S
 JsAHXDf61ixQXXqKBHnnhVNaf7NUtMucs/L3ajuQ3+CBQm4+hzmnF+5eyxHfLQfm2HXI
 d8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TRJwqkDM+7N5us8jhk/gQEaEManjMc6HzNEZ67aJWfo=;
 b=XU5ENkpb2IHgDJp4b5nqxlzKtsvy0ZlWLDZGLLBQ6M/6aESZ3ugarYJOypJsBaTNYb
 pqgjVARKDSch35bfFRRgn2LDyIDDcGskzLk6wqBm69IYNrBLB4ZsB/gS1tdfCOuDtwDB
 6JpFYyV68Ze7dChbAzH+aTbeOV0cyjMLPGsvuRtJtWP4kTtb7KyCAc8MTLHlITG9KnQe
 sPP0QFA7UC8LuZ9y66AF47jfO9LRFvDusrmuH1TZ4XA4nxt0Fwp3bfJbZ84qqgLYvBHI
 jYSIx6jfB6EBmZRTF1OUd4Gt9gCEjn7Djx0XmUn2r8elVNIRq9kXVGahW9AzQB9r6OjA
 E32g==
X-Gm-Message-State: AOAM5308DbXzsxLaq5He0bSwwDTdkR2caJmps+SO6vabgay4HOsmyVyb
 QcoaVSwq0NglXoFR26/e2/lTLC+d6Lmbcw==
X-Google-Smtp-Source: ABdhPJx01a+FFCS28I+SyL8o+ebpTqFWXajb2OCw8BWSMx9ZwNjXoZkL7uG1/LZBwuH7avbmSocPAg==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr2744004wrv.186.1616489039989; 
 Tue, 23 Mar 2021 01:43:59 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w6sm22160281wrl.49.2021.03.23.01.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 01:43:58 -0700 (PDT)
Subject: Re: [RFC] accel: add cpu_reset
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-2-cfontana@suse.de>
 <e7e0cfe6-d9c8-8cd4-39bc-65374771824a@amsat.org>
 <a387d69e-f202-d4e4-476e-9452072fd238@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5969c241-4f1f-7013-3765-0a3ee0a054cf@amsat.org>
Date: Tue, 23 Mar 2021 09:43:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a387d69e-f202-d4e4-476e-9452072fd238@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 2:54 PM, Claudio Fontana wrote:
> On 3/22/21 2:42 PM, Philippe Mathieu-Daudé wrote:
>> On 3/22/21 2:27 PM, Claudio Fontana wrote:
>>> XXX
>>> ---
>>>  accel/accel-common.c        | 9 +++++++++
>>>  hw/core/cpu.c               | 3 ++-
>>>  include/hw/core/accel-cpu.h | 2 ++
>>>  include/qemu/accel.h        | 6 ++++++
>>>  target/i386/cpu.c           | 4 ----
>>>  target/i386/kvm/kvm-cpu.c   | 6 ++++++
>>>  6 files changed, 25 insertions(+), 5 deletions(-)
>>>
>>>
>>> This surprisingly works without moving cpu_reset() to a
>>> specific_ss module, even though
>>>
>>> accel-common.c is specific_ss,
>>> hw/core/cpu.c  is common_ss.
>>>
>>> How come the call to accel_reset_cpu works?
>>
>> Each CPU optionally calls cpu_reset() manually?
> 
> Hi Philippe, are you concerned about these calls?
> Or what are you highlighting here?
> 
> They in turn call cpu_reset() so we should be good right?

I guess I simply misunderstood your question :)

