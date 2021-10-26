Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97743B7F2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:13:04 +0200 (CEST)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQ0V-0004jZ-AQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfPyM-0003gS-6u
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:10:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfPyK-0000CR-ER
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:10:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id f5so92166pgc.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RsM/A/Kry7lOIJ35S9LGGIoO2IqR1MbaSrp02DaWk7o=;
 b=AXGHEwaH1v95zhXpokovigcRZOUlRAc35EzVLFkzLsBuXEY1BlM/RvhTdYyFOnqClp
 ZIKnFCnF2gxjJ54HYwcnnohTpLfwi9fOLLHxfKmWQimexeFb9bJO+N+cCCCsFoiT86wU
 DSfrOmb3z8xfr9+IV8RheLK68hbEomry818jex9lDGAG1QBs19j8lrmxsf64AyQpRldF
 UevYP+N23cXfXHp6QpNjSRxs6P4ZkfhB5e2YRzIUk7jAlXiZRtbCy1wY/tLMHkmBIzLJ
 U0Lhj0JP/DB9O2iP/vwai0f5QLq2R3JnT3/rmAlb5Otw3tD3x555t31N0IfPDfDa+lH3
 yyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RsM/A/Kry7lOIJ35S9LGGIoO2IqR1MbaSrp02DaWk7o=;
 b=sgGsCsYauV/CVDcPNyvp29K/06bLBluXOOtHdBM6D0tWgsOAhVvMCIGSJA2fNMyeoT
 kfqdICxNgzn6AVCnutiKEjpHFH/9HKqej8XlGpCSdlccfqMKbKWzZ3vljM1xa5LbLZcn
 DnUXm/3YyQRdvH1SVFz9Y3DgT/StcW2CT2mM4JzBw+0YKPVQcDs8QVeB/2+r2G6RnRIR
 lXPPles0RRetuOFXiwav4a2Nl8Vk/HR23TUF6sPyk6jXAzGcY3IqD37oYmenTLcUzn/A
 ZvTVpj4EpMW1UbGUOIun/w8Ls4Z37ZMW7YkB/NGQjTcO0esHA1+gjXZs8+sZVYIpwVNL
 iX+g==
X-Gm-Message-State: AOAM533lq7e941ouPKrI80pPpUvozl7vcLOujy1r/LbleKczUuMNsxGd
 gZs4sUlRA6qoFE2sq1CJVCM1aA==
X-Google-Smtp-Source: ABdhPJzFDPODDfF0PUCSvRehsX6LUpv6eC8wRLcHuABNPBGMzg4xBX+YkOVBRr1Vv0kbM5dmTaExtA==
X-Received: by 2002:a63:e64a:: with SMTP id p10mr20012419pgj.263.1635268246762; 
 Tue, 26 Oct 2021 10:10:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h35sm7741799pgh.71.2021.10.26.10.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:10:46 -0700 (PDT)
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
 <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
 <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
Date: Tue, 26 Oct 2021 10:10:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:34 AM, Stefan Hajnoczi wrote:
> On Tue, Oct 26, 2021 at 08:10:16AM -0700, Richard Henderson wrote:
>> On 10/26/21 6:22 AM, Stefan Hajnoczi wrote:
>>> If "safe" TLS variables are opt-in then we'll likely have obscure bugs
>>> when code changes to access a TLS variable that was previously never
>>> accessed from a coroutine. There is no compiler error and no way to
>>> detect this. When it happens debugging it is painful.
>>
>> Co-routines are never used in user-only builds.
> 
> If developers have the choice of using __thread then bugs can slip
> through.

Huh?  How.  No, really.

> Are you concerned about performance, the awkwardness of calling
> getters/setters, or something else for qemu-user?

Awkwardness first, performance second.

I'll also note that coroutines never run on vcpu threads, only io threads.  So I'll resist 
any use of these interfaces in TCG as well.


r~

