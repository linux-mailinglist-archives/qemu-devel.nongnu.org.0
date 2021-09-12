Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87154081E8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:41:51 +0200 (CEST)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPXEU-0000wR-Vw
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXDJ-0008Ua-FD
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:40:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXDI-00042E-1X
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:40:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id e16so7011718pfc.6
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gs/rr619HA/mLlpz+21h2yiWM58yXjlYbARG0zCdf0Q=;
 b=zKWZe0EVP7wra+rbqFVUwO5cSNMFDjnjtdnTRQDL4psF66ZWo/y1feq7pnZea8dbdh
 haOpUNAhkFAL+r8pQtyPmBLmCCYEwT39uizMHM0EE8TBKGnD1TIlcDJYiG+hfqb0vJjL
 3FMalbZCgTVI0aRn3lJkDh/FeVS1wXByIm3kYgGWhOIEPaySWCRoHtwoYi2kv7xnLOVI
 P3EjMSoiX0Gal1/QnTCRn3rM7UW7I0WNPBg14iqiaFFdKD2a1+QCBqPz0Miw58rHRUXN
 7kv3vtWhzq33yCXUrqeDaMsV9fISveG6dl7duhbPCbfAgjiRh94WihDgCydQOtTRy+XQ
 RJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gs/rr619HA/mLlpz+21h2yiWM58yXjlYbARG0zCdf0Q=;
 b=5V4VoecPxHyDpGfw8TdyTU2U4HCgJf6ShnoagKTxUMSJfiet5WXkJ3czjnJrc18f7f
 UfoHiyCfv2puUQJwqiqKalbpnUwVQ4V669Vnn5SKrNILLKlpf7uhv8sKFQQOrKXQ0sfw
 xRkR/rhZiRybKQYmL5ZATA2MeAPFtJ7A3aOyXlz2Do5D1ib0Ba9XcQjSnRjvc2W7m8oL
 r/QogF9Zpemuv6GgzpFb0QO9Kp/s1rNTRThYWKs06PUXmsRkpmZg2TeEZavkXPgj9DW1
 AD+5kDKaqbR/0aqF2idjY4PakH4wjPHKJp3B4fPqFp9BxdLt8vtbCn+5kbYrznkFkjDW
 +ZwA==
X-Gm-Message-State: AOAM5324v0L13agsiNnw0QIDwUgMzuTuZMxngeVSX1rgHF6ZXFnTNDfd
 XAF4XD7NdqM1gMATh41yJ2HQQA==
X-Google-Smtp-Source: ABdhPJwwBAVxQClEBAoAFh/nBtW42aQ/s5pDwvZ3Z0B0IHHzd9DTMCR/1LnNiFk8O1eVBmqRWXxwCg==
X-Received: by 2002:aa7:8014:0:b029:3cd:b6f3:5dd6 with SMTP id
 j20-20020aa780140000b02903cdb6f35dd6mr8231971pfi.39.1631482833839; 
 Sun, 12 Sep 2021 14:40:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h13sm5344626pgf.14.2021.09.12.14.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:40:33 -0700 (PDT)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
 <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
 <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e0879b6-23c0-8f14-fd96-4d72f1d640c1@linaro.org>
Date: Sun, 12 Sep 2021 14:40:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 2:37 PM, Alexander Graf wrote:
> 
> On 12.09.21 23:20, Richard Henderson wrote:
>> On 9/12/21 1:36 PM, Alexander Graf wrote:
>>>> I think the callsites would be clearer if you made the function
>>>> return true for "PSCI call handled", false for "not recognised,
>>>> give the guest an UNDEF". Code like
>>>>            if (hvf_handle_psci_call(cpu)) {
>>>>                stuff;
>>>>            }
>>>>
>>>> looks like the 'stuff' is for the "psci call handled" case,
>>>> which at the moment it isn't.
>>>
>>>
>>> This function merely follows standard C semantics along the lines of "0
>>> means success, !0 is error". Isn't that what you would usually expect?
>>
>> No, not really.  I expect stuff that returns error codes to return
>> negative integers on failure.  I expect stuff that returns a boolean
>> success/failure to return true on success.
> 
> 
> Fair, I'll change it to return -1 then. Thanks!

Not quite the point I was making.  If the only two return values are -1/0, then bool 
false/true is in fact more appropriate.


r~

