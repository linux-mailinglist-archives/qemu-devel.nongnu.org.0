Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23B4DA135
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:31:07 +0100 (CET)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUB0k-0007K8-5r
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:31:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUAxm-0005mO-KK; Tue, 15 Mar 2022 13:28:02 -0400
Received: from [2a00:1450:4864:20::632] (port=36441
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUAxl-0002V1-34; Tue, 15 Mar 2022 13:28:02 -0400
Received: by mail-ej1-x632.google.com with SMTP id bi12so43083014ejb.3;
 Tue, 15 Mar 2022 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6604oOWdII6uxRwmAu1+sci4vZeRLoQTilKUioaCIsw=;
 b=HABkbAdTsuBLlwqsItEGAT1RuvpHClV4c1ba7EDKGUvPDzDmlh+uYh0Hd2J2XmWho1
 31QG/nSKK6U1HiI04PPH7byxla9T6fLaNxRzgBCbmgM3WuzXvY7GO3RZuRfrNxdXTUzd
 YfdUK4XitQXFsCi4WpIElid3ZmYnSOkiTdEIpWSHcoX5XVR1qzUNsOIZABnrVvWziQSG
 3RBaw01pR7NLBdw8qmI6gcTu27wjgg7uq7EfWYVjdPWQ7R1FWIijQiZr37VdkHD47EjI
 5FURmYJf4aTesOT+iH8q4uZ9WnEDWcbXjHxkralghqQGVzhVjuBsWHRlXKzwmplRt6Q8
 Ydxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6604oOWdII6uxRwmAu1+sci4vZeRLoQTilKUioaCIsw=;
 b=O9EDw2ald/IGE39u4hnGlYkmPeFN1HoyyoZ+19o1yZFVgiBTkAk1euJ0t1K+fQNgeg
 fV01VA08MOtc+wYcj8Xd2zMFq7kSC6U+H1bDjXE2za7eDCJyafv4uuEAB8Y0kuswRoJx
 9vzrUzKooRReEQpT9PBuhyDg96o0iede7zIylYhiCFiMplc9XtTLOwKFF0mjaz6tZyMA
 5ek1VuKUX1UiJ0K+5EbrMeavscjCHeCvMIgyDxf5q27zrAy5+SBJj0FWByp5TTXToZJE
 xGXnEcsWfAvUSHKNRXVyiB97PgsC7aOWKm9PvQLjQDw2OmeOZvDp7cW13xzPR5c6uKZ/
 QRmA==
X-Gm-Message-State: AOAM532mZABgbCE+4Aio6RxhEz2O3AsR7zWO6pVy2kShPatQklodoZ0s
 o1HexKYCDA0+3kBi2JOrZ3Y=
X-Google-Smtp-Source: ABdhPJzCXm+Ox8Bv97BkTRuustGLshy/JmMIeqbg5pp4YfWv8M4XuD50kjKWIT/tJDo7bS8K3p6ZNw==
X-Received: by 2002:a17:907:da9:b0:6da:beb8:fdac with SMTP id
 go41-20020a1709070da900b006dabeb8fdacmr24230340ejc.364.1647365279115; 
 Tue, 15 Mar 2022 10:27:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a17090609a900b006cd30a3c4f0sm8485445eje.147.2022.03.15.10.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:27:58 -0700 (PDT)
Message-ID: <14e1f954-8db9-6309-f423-c9f4fbca4f71@redhat.com>
Date: Tue, 15 Mar 2022 18:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9y0xQ2O00y1uJ5@redhat.com>
 <32b0d8eb-e00f-8468-135b-d508b82978ca@redhat.com>
 <YjBdIA7ZecVr7C+f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjBdIA7ZecVr7C+f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 10:32, Daniel P. Berrangé wrote:
>>> So NetBSD is our biggest constraint on requiring GCC 10
>>
>> Do we care about the BSDs since they have newer compilers (including gcc10)
>> available in pkgsrc?  If you go by the base system, then RHEL8 has 8.5.0 and
>> newer version are only available with packages such as gcc-toolset-10 and
>> gcc-toolset-11.
>
> I mention NetBSD because we had an explicit request to support
> 7.4 GCC from there, as it was the current system compiler.

Thanks, do you have a reference?  I would like to understand the reason 
for that (adding Werner too).

For RHEL8, considering that the switch would be several months away 
anyway, I don't think it would be an issue to require AppStream toolset 
packages.  It's unlikely that RHEL8 would rebase QEMU in 2023 and beyond.

Paolo

