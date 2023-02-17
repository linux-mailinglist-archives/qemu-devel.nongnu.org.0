Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B769B1F5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:44:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4lu-00013w-EX; Fri, 17 Feb 2023 12:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT4lr-00013R-FG
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:43:43 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT4lp-0005xX-QT
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:43:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m21-20020a05600c3b1500b003e1f5f2a29cso1536342wms.4
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwIpN4I2jUyFOv7sgsjRSye+phBiMmBzwPA/wuVZglc=;
 b=b9WZ/p0vMDzWW0/slrhd5AiQoI/x+Y/7CowHHXpWU756wtK0b5FVz+y0FOUU/K/GR4
 XyPTsbNEnoVHqZkgse3hlD3w/FakOkqfkim6Z22cx+Xqi4kDeaFxYmG4pYNJtuoLYy+u
 r6weiZJCEMlIpNK6uxQcVMOqwmAWqc83K2zhLWLzRzyz3Bo24F4aUqiOEYyxc68Lveiu
 ATtQL6b9TjRhfIod5ENCWfeDoi3OOlSgqyKjUff6VT5E+M2jHpeNOwP3TTmuFka7omhz
 VPnRMI2ikCMIlvH8z7DrL3l8TphgHPTV9q9t2omtwrx7w4rFbuhaRbdiLxGyv/5BplOJ
 3ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SwIpN4I2jUyFOv7sgsjRSye+phBiMmBzwPA/wuVZglc=;
 b=5XmlEW5mm4d5DXmUedifquKMSKr+owSJ9/1H0YaWJk/Qxp2GpB2L3lCy1XIyimBa0f
 8nSxLBdRWAcT4CbW6BgOmsg0DQNjLDzRL9xLekDLQsp/eIFgJ9fZEfeR3nBWWxtxy8P7
 vBbStu9eXxSUQgLV2NYoKalyYIYLsTKuFWElHpywsf0FYQSCEe43qXdbHH/oyg7YCGrZ
 9dyNVR3QGKkn0qyozkU8AU3NYEs1x/uz+6sqzPBuXIyEyUZj5cWu9wYq80OWzyNtrikL
 7eItG/Jo+ktR3Tyw2lV/BookO34Gf1F3a5lfAooFU/LVKVqTKwA8pzzkDB130seIvjkU
 9V7A==
X-Gm-Message-State: AO0yUKVnb+kMO/KVvawFpoE484g5SGp4VacZuSq1+OfP+eZE3X87eHeX
 MwkkQ+3MsQ/zGLCeHU8KZ2jowg==
X-Google-Smtp-Source: AK7set/NJE+wmFhLqsLbfY75jVkxaeD6qLO/6a0OB4dRUvOLGF1a51oxtzdh8erfrVxVdW/mhAO0nQ==
X-Received: by 2002:a05:600c:747:b0:3dc:5823:d6c0 with SMTP id
 j7-20020a05600c074700b003dc5823d6c0mr1539823wmn.6.1676655819917; 
 Fri, 17 Feb 2023 09:43:39 -0800 (PST)
Received: from [192.168.129.175] (217.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.217]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b003e214803343sm5536482wmk.46.2023.02.17.09.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:43:39 -0800 (PST)
Message-ID: <72bd7694-9d37-1f9b-db4e-6d5818f7c55c@linaro.org>
Date: Fri, 17 Feb 2023 18:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

(Cc'ing Huacai & Jiaxun).

On 17/2/23 17:38, Paolo Bonzini wrote:
> On 2/17/23 11:47, Daniel P. Berrangé wrote:
>> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>>> I feel the discussion petered out without a conclusion.
>>>
>>> I don't think letting the status quo win by inertia is a good outcome
>>> here.
>>>
>>> Which 32-bit hosts are still useful, and why?
>>
>> Which 32-bit hosts does Linux still provide KVM  support for.
> 
> All except ARM: MIPS, x86, PPC and RISC-V.
> 
> I would like to remove x86, but encountered some objections.
> 
> MIPS, nobody is really using it I think.

32-bit was added in 2014, commit 222e7d11e7 ("target-mips: Enable KVM
support in build system"). I'm not aware of anybody using it (even
testing it). I don't have hardware to test it (neither time).
We are still cross-compiling it although.

64-bit support was added recently (see commit aa2953fd16 "configure:
Add KVM target support for MIPS64") and is used (see commit fbc5884ce2
"meson.build: Re-enable KVM support for MIPS" from 2020), however I
tend to see it more as hobbyist use than production one. Besides it
is listed as 'Odd Fixes' in MAINTAINERS (still 2020, commit 134f7f7da1
"MAINTAINERS: Reactivate MIPS KVM CPUs").

> So that leaves PPC and RISC-V.
> 
>> If any, is there an EOL date for Linux 32-bit KVM support ?
> 
> No, and I don't think there's going to be one.
> 
> Paolo
> 


