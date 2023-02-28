Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF596A5DD7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3Im-0002s9-2t; Tue, 28 Feb 2023 11:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX3Ij-0002rl-H4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:58:05 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX3Ih-0001Eh-RU
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:58:05 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i5so9422029pla.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
 b=RWN+ArmRSoF3RqaIc/bG5HKYN8GqQFbTlJqpD8J7s/9B6QN61aZgGGWKFMc6a2g79w
 KJqn9iLRtx+zn11WIASPZu5yBM5TdDjbaGjTnL1SFAIEOHskGnjEjZeXpqPpy9V6n5p2
 r7+V8NqjySksekWlWPSSL7e6ScTvYON2coS2z4TIxMT/XzGJFNARBJobI3wyA54tVTJy
 4+NykP3xVNVLQ+bDSVh3IUKsGnLoIgjlbOtIeADpDK6klqd94TPH5PVodAtoJKkYqURo
 xk1ltaWPWxaGr1uf1su5Zt5E/T+lOxcnPBFwf8rxZx0hHx+VXAOHZ8qcAB7CIbnNZX91
 1vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
 b=UGFT3Qdo33SrfYUrLk5J1SCQovWZbkpt2HlCVjTyDV2tvy129HzULXCviv0+TyTeaS
 mC0e3jUkwKtsQX7zec0BTMr0IbVV1pweRuL85xQHaJ2MW4SnQ/iaGaZgXd253mo02sgg
 pGktj0+uQtQVGy19sQBxdCX9Ut6gV+FRyirmWjpV5DnpxUlwlrQPOiBNxdNiaLnbo+/X
 VVfyC78XkwtWn1XbJNzYLm736cGIpjZ1xHIJpmNDfxPa+9wLmsk6m+IzpGU/5a6ClYCT
 nwlCSxPHx6pQQGkO4IrltRQlSFAPMivUFxvO/vWqPSa4ws+OUXwO3ZRtJIdqosdgF0Xj
 0kbA==
X-Gm-Message-State: AO0yUKXvmy/nnUIgPG7qgrNQr0Dg4Y3A8O/qS9QXEoSzf8LsoPVAnK/f
 9S0JpOOOIWl1CXQGN4wjMAgvAg==
X-Google-Smtp-Source: AK7set90WOEr4dwJPaDBIlNSyAUO8ngoVSxZiL6FRqc82zyAHJhoPcIuRFbTPM4j0T9hhlTBR6YUKg==
X-Received: by 2002:a17:902:b08a:b0:19d:c9f:44f0 with SMTP id
 p10-20020a170902b08a00b0019d0c9f44f0mr2708127plr.32.1677603482070; 
 Tue, 28 Feb 2023 08:58:02 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v24-20020a1709028d9800b0019a8597788csm6869085plo.0.2023.02.28.08.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 08:58:01 -0800 (PST)
Message-ID: <ca5f7fba-7d48-2a35-2378-188d86ef2002@linaro.org>
Date: Tue, 28 Feb 2023 06:57:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
 <20230228035958-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228035958-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/27/23 23:00, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
>>> Removing support for building on 32 bit systems seems like a pity - it's
>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>> and the maintainance overhead is quite small.
>>
>> It's not that small.
> 
> Meaning there are lots of ways to run 64 bit binaries on 32 bit systems?

No, meaning the maint overhead is large.


r~


