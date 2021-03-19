Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DA34185B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:32:10 +0100 (CET)
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBUH-0005Mg-8u
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNBRM-0004BD-UK
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNBRL-00082G-AG
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxsKiHADN9kxnmmcipdXrl8H6VpswSuOa49n+a3d4g8=;
 b=cfrmi0p2KQPqeKHN8CEfw1ntuXOfiv5Frbw2YCPEOCyowRNA+pMe9lvwVEQrAdwrJZXm3/
 eWG1woVnnCGkPAGtZvyTkUlPk+IPeX4kgEBaU61YgpnikS2SwARVgLJRyxx2E/jXWXqdm+
 jSf1XAtZC1U0mVK5gs0E5XwelyVTdgk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-csfWC2WfM4GtISNU9QgC2g-1; Fri, 19 Mar 2021 05:29:04 -0400
X-MC-Unique: csfWC2WfM4GtISNU9QgC2g-1
Received: by mail-ed1-f71.google.com with SMTP id t27so22505437edi.2
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 02:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kxsKiHADN9kxnmmcipdXrl8H6VpswSuOa49n+a3d4g8=;
 b=TKsIlTSa2g5O8wIzV3mbTQyX/ewx4PpwdUMrOb1V5ZjwXoAhRpo6JqtapyPFJ79Co/
 EpSQjviEugCsv7b3AJA/TQJMx1jT8M1bGeQ+6BQ0XpVyMyolBYCrUTYwSXPWj3hogZNQ
 KnRByG7i2kZhtpTMlqfsNxM2YSu9luMGcMwGVAtReW3e11FNttz76OLoFHRnkdLQKOrF
 bpcX4ABg8pp5FejY8cnT1xwBNr8WURhXmy50li2OUvqG+YAtGv2jWv7V+y1lI2aM0Ku7
 GoJBjNN3doK02+6bo0L6XbTIRjoACOhVlXlM0mAJLCRfBr56OuUupBWZbBUgJLxCKnoN
 TcYQ==
X-Gm-Message-State: AOAM5305W/6oAJshSzFuTpb998yxAzhOUYvmY6wzsDkeIqCUMdp/n7z6
 TAVX1bVW4L+9uTc6yaVLHr+lErKSXjSovtDGHbtTMmtKev34kw0frOPjZlup3KWJRQIU/UatM7T
 aD8m7QDeUX+YQW54=
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr3245587ejb.53.1616146143260; 
 Fri, 19 Mar 2021 02:29:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2iXGh2Id3dpsTbQSMZAwaWFQPJkHEqYBaTNQBH98WdqxSJjhVzdJhKbb+CGyNbqbBMOcD9A==
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr3245571ejb.53.1616146143107; 
 Fri, 19 Mar 2021 02:29:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u59sm3899506edc.73.2021.03.19.02.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 02:29:02 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Max Reitz <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
 <27c791b2-dcc0-6c98-d765-ac1b60b7af3d@vivier.eu>
 <0d55cabf-0fa0-f9fd-6436-de2e03422329@vivier.eu>
 <0b3cedb8-f40a-18fd-5030-a596afb9298d@redhat.com>
 <82f6dc3e-18bf-f90a-7e43-5568b319767c@redhat.com>
 <3bcc22b2-eb25-b0a0-f47b-72c747ca6f0a@redhat.com>
 <1a2a91a4-0425-0da9-482b-f46a6e17b6b0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f69095dc-7021-4f3a-ef59-debcf3df2784@redhat.com>
Date: Fri, 19 Mar 2021 10:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1a2a91a4-0425-0da9-482b-f46a6e17b6b0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 10:20, Max Reitz wrote:
> On 19.03.21 07:32, Thomas Huth wrote:
>> On 18/03/2021 18.28, Max Reitz wrote:
>> [...]
>>>  From that it follows that I don’t see much use in testing specific 
>>> devices either.  Say there’s a platform that provides both virtio-pci 
>>> and virtio-mmio, the default (say virtio-pci) is fine for the 
>>> iotests. I see little value in testing virtio-mmio as well.  (Perhaps 
>>> I’m short-sighted, though.)
>>
>> That's a fair point. But still, if someone compiled QEMU only with a 
>> target that only provided virtio-mmio, the iotests should not fail 
>> when running "make check".
>> To avoid that we continue playing whack-a-mole here in the future, 
>> maybe it would be better to restrict the iotests to the "main" targets 
>> only, e.g. modify check-block.sh so that the tests only run with x86, 
>> aarch64, s390x and ppc64 ?
> 
> Right, that would certainly be the simplest solution.

It would also make the patches that Laurent sent this morning 
unnecessary, and avoid the use of aliases in the tests (so that it's 
clear what is tested).

Paolo


