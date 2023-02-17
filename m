Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7469B259
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5Nk-0007c6-Nh; Fri, 17 Feb 2023 13:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT5Ni-0007bV-U7
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:22:50 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT5Nh-0004m7-Ca
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:22:50 -0500
Received: by mail-pl1-x636.google.com with SMTP id 19so2474430plo.7
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 10:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ml4Ouv+bEVIyR1UdDZhujO9q3T5s+ftduzaDRHMtDQ4=;
 b=cK8T165K+vAiJQgk07kPRLTbGTBQuzSW3FfvvgEtKpHdlmSohDVS78KszS02rODSer
 MUDY2PWXw8LON09ishiN4DYJ91f87LM9j3jEBAX8Y8C/35cJz1/Lzrn3F7v2olNB2uUy
 +yrT4QRNS4DDFH/gnOHEJ4U8BGTeUFudHriF2/Bvt64wEd3sSpBFA8+e6SOvI9+DBnWK
 6UdPn9lh9pEzzGP7SWiLUsnRAZtVFrxmW1ItOax+Ry/njtvmLMUl2QVsk+sJkEg3lZaI
 s0/rxeBih5u0FY6P4csNWS5ktM7IWIBce00zTA9Fr8SbA5CxHPNX4vw8K3ctq0zIq9RO
 +zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ml4Ouv+bEVIyR1UdDZhujO9q3T5s+ftduzaDRHMtDQ4=;
 b=EZezMsrosM+ZmA5/V5BIc9J/tS2vbcaLJqzqTtHc+1LRid2l/+p02IH4mCCLI+T0IN
 7h7vp0V+ANnknARqRpZeaMLKxGcujGnqTzkYPENsp/676q0jgOMZYWJG45Lz131xmJKQ
 a1ctbYFpivAACMh+2VFaI1F8EmQiHuS54hxYv9DD4GYoISY/GngT9WdqxBV43GunAtKD
 zu38uNrqWg6ScSDyK4FV+pRGMOeZKjyD8y00tWOF+AJ1+2uj6j8yDLI51VkQoHdN2by8
 g0i62ILoectVc3SJgVj4AwuKW/ezuH5p2fiXBAsH5uzu8WCktPOVo6KUwMqnZkjqpCso
 BiRA==
X-Gm-Message-State: AO0yUKU/tencXGMc1eKny4VAM9J85/0gJgjE+enacMNiXwCj6BIeQ8FM
 SVaqRdsY4XYHHvnkTGwVpW+3mQ==
X-Google-Smtp-Source: AK7set/1lugWj3Fv/IU1YME0pJLnrql/SFEmtJ/gxqbv8a7/rdy6USdotgRPcyPYW6FzEVNrRs1XOQ==
X-Received: by 2002:a17:90b:4f82:b0:230:c467:1c7e with SMTP id
 qe2-20020a17090b4f8200b00230c4671c7emr1620843pjb.11.1676658167804; 
 Fri, 17 Feb 2023 10:22:47 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 2-20020a17090a0d4200b0023493354f37sm3227617pju.26.2023.02.17.10.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:22:47 -0800 (PST)
Message-ID: <ace645e6-ace0-6ecf-baef-f5ae1700fbf4@linaro.org>
Date: Fri, 17 Feb 2023 08:22:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Reinoud Zandijk <reinoud@NetBSD.org>, Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y++mEtUSmWYPTkPN@gorilla.13thmonkey.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y++mEtUSmWYPTkPN@gorilla.13thmonkey.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/17/23 06:06, Reinoud Zandijk wrote:
> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>> I feel the discussion petered out without a conclusion.
>>
>> I don't think letting the status quo win by inertia is a good outcome
>> here.
>>
>> Which 32-bit hosts are still useful, and why?
> 
> NetBSD runs on a bunch of 32 bit-only hosts (sparc32, ppc32, armv7, vax,
> mips32 etc.) that all run Qemu fine. They are all actively maintained and
> released as part of the main releases.

Are you sure about that?  TCG doesn't support sparc32 or vax.
I suppose you could be using TCI, but I can't even imagine how
slow that would be on vax.


r~

