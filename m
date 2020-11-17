Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4A2B5DF2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:07:58 +0100 (CET)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keyq5-0002uy-CF
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keyp0-0002SW-0u
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keyou-0002PS-61
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605611201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjfCUF2hRNzOFbk5q3I5QZ7cTKvd2haC7aBusd3doUM=;
 b=YRsEO2LpGG1lCSfj05MFgZxOLtuTvUzRkRirVJcniwYLqGUCktrMlpnpMAVPqFx5QVz/C1
 wTRX3MFCfYHVdJqgTSFXTHQrFLvIwVNZ0DAvw9wDWMHsNDtMYZEnaW69R6RFg4zoXNVhOw
 PXcgNPbet8OEj9wkgU6JmoSOMiYLmPc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-C8qyFgGRPKCpIdnt6SmE4A-1; Tue, 17 Nov 2020 06:06:39 -0500
X-MC-Unique: C8qyFgGRPKCpIdnt6SmE4A-1
Received: by mail-wr1-f69.google.com with SMTP id d8so12819594wrr.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hjfCUF2hRNzOFbk5q3I5QZ7cTKvd2haC7aBusd3doUM=;
 b=AGi/gW5B85nibBhrjHrrrK9Bs2HSZC/og6YKhFR+CudndwvJUcc0S+O3kzxMCMFi5J
 lxK9Vs0FuIXf3cOipqhFC3m24L7+oqelbZec0hJ48XPODsQvSinMpF8HbqqLkbjqCYDd
 EBUxHOrxlcq2pIg/G8vBo+bRfekyy2AQvuz4cTxcotP2mnBmpAV2OyYmOEvQj8JWYeBY
 0pUpb6uzqeaTHjHDUY4YbaYAyqnY25Q+JvtpnKs4DUZvgmGPWKe78IltQlgg33nLBrie
 IU5uneMIxvp9p95SjAzgyXQUPMuifGUehMf5xnlL+zR26k9b/50bO1K6ZEJmdGjStND1
 HrAg==
X-Gm-Message-State: AOAM532+HHY1VejrGh+NlGvO3f37IxAUNZGBW58xG2CnjpeQARo86uNM
 kwCeJg5sNkbt5V8nPXaU+V+t1FOyrRF7by9TeqGh+nWWDZakhSfj4uDXDC2A6D8Two/+ri91TyE
 7AIPA40Zn05DRTZU=
X-Received: by 2002:a1c:1d51:: with SMTP id d78mr3714203wmd.60.1605611198172; 
 Tue, 17 Nov 2020 03:06:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzLYK0VkF724HDUvRxo/X4D1BNZWLGellm5QplRldqfSAabuDvB+F2srLlblKxInNmyqHvjw==
X-Received: by 2002:a1c:1d51:: with SMTP id d78mr3714182wmd.60.1605611197934; 
 Tue, 17 Nov 2020 03:06:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 34sm27820352wrq.27.2020.11.17.03.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 03:06:37 -0800 (PST)
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Bin Meng <bmeng.cn@gmail.com>
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
 <CAEUhbmWDXFExcYGy6SZzz9t+TwHRD3LCuPAvg_S9_5tHRHF6-A@mail.gmail.com>
 <a29cdbe7-12f0-839e-4296-7bf4b846bcef@redhat.com>
 <CAEUhbmWPi=4u8y0U0Py7rxyFVkD5gqkDQsze39XjPaXsADnJtg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <17dc8a7c-d72d-09b0-51df-ff907c1dcce2@redhat.com>
Date: Tue, 17 Nov 2020 12:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWPi=4u8y0U0Py7rxyFVkD5gqkDQsze39XjPaXsADnJtg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 11:08, Bin Meng wrote:
>> I see.  Is there any chance you could write a testcase for
>> kvm-unit-tests?  Or just explain how to write such a test, and then I
>> can write it myself; it's not clear to me how the guest can observe the
>> base and limit of a non-present segment.
>
> I am not familiar with kvm-unit-test. The original issue cannot be
> reproduced with a KVM enabled QEMU as the codes-in-flaw is in the
> emulation path.

kvm-unit-tests, despite the name, is a set generic tests for CPU 
behavior; it works with other accelerators that QEMU supports including 
the emulation path.  You can find it at 
https://gitlab.com/kvm-unit-tests/kvm-unit-tests.

If you explain in enough detail how VxWorks triggers the bug, I can take 
care of writing the test.

Paolo


