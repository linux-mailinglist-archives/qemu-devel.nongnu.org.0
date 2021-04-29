Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B736E617
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:35:00 +0200 (CEST)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1CN-0004ia-I4
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc19k-0001fO-3b
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc19i-0006AR-6r
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619681529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFCUXY5XvH9EHMtvpQXmNltoGuoxvE1YU6uqXDoQpdg=;
 b=EULCCaJHecBydPVgtzkliYVNMsh9HBjPP3gyU+EZFNi+QQJVFi0dbp632gygMbgGRAIuFZ
 AXG1HE70rbN6ilWe2zhW3l/hdhGvxcd0dC9U4xeeUj0pFAIN3FHRs4ZtmDxf2RyxvtLFmi
 LBwtMUrqprLwoRWom2BZRCVaLCB9b2g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-CR87ySQYO2CatFMj1GtVxA-1; Thu, 29 Apr 2021 03:32:07 -0400
X-MC-Unique: CR87ySQYO2CatFMj1GtVxA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so20977231wrb.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jFCUXY5XvH9EHMtvpQXmNltoGuoxvE1YU6uqXDoQpdg=;
 b=DcT6vjjJmmdIBXMtl8YUAvi9yoiMEN9hvYERYzoC7lmYUUeXp0Ge/b89HuDvxCSTLe
 oTXGyengrLtdd9xdplPM6LdPdDm7H7pVUpsNkBkWssSsbr8m7ytKqqg8RsLXY8qErYX9
 Ap/m5jWPGkbNbT7YA7aLUIvAuwiIo2S7Rkum9oNGiZfCvXmP9n/W+D+xSw9vlQyYDdJa
 ZbitWStPrggAaZRZAMBQLYL3pwI5iQyDeyjLZSYbl+gBQE5NWFGPsYXKu76Ue90fSqh4
 G0FrscKlGnSJwEt8+I4Ouu87wbuMBZyxp8aNVmo6Tw2QmdxBgHUw169HrKLraVYgcfWt
 4XgQ==
X-Gm-Message-State: AOAM532EwYB6h9L8t/Tj8+gmvOeTtsnKsd4KSlna+q75+2S785y60BOW
 TP6o77JS95nu6iEe+pjEC1kfBrDSmy0z+yH0d7eodvz09WR3KdkmmmmA4DQwx8n5kKv2I6sSuAo
 ngiVUHrEYgLx8VI0=
X-Received: by 2002:a7b:cbc7:: with SMTP id n7mr34319991wmi.56.1619681525972; 
 Thu, 29 Apr 2021 00:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg4y9V6b4lU1hZuJrPiAq0XDfEHhpIOjjb691UuITZLdNX0rBE+wUOMScWqg6UTZ2Tt2k5WA==
X-Received: by 2002:a7b:cbc7:: with SMTP id n7mr34319969wmi.56.1619681525761; 
 Thu, 29 Apr 2021 00:32:05 -0700 (PDT)
Received: from [192.168.43.238] (202.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.202])
 by smtp.gmail.com with ESMTPSA id n5sm3312049wrx.92.2021.04.29.00.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:32:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if
 virtiofsd is enabled
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-2-philmd@redhat.com>
 <15dbfc38-f0ba-65f1-382c-3ce5b961f108@linaro.org>
 <e2f18183-2b7d-f7c1-b1a2-e624950c7627@redhat.com>
Message-ID: <148855f5-05ef-3586-d291-96229d960f2c@redhat.com>
Date: Thu, 29 Apr 2021 09:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e2f18183-2b7d-f7c1-b1a2-e624950c7627@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 8:00 PM, Philippe Mathieu-Daudé wrote:
> On 4/28/21 6:34 PM, Richard Henderson wrote:
>> On 4/28/21 7:48 AM, Philippe Mathieu-Daudé wrote:
>>>   seccomp = not_found
>>> -if not get_option('seccomp').auto() or have_system or have_tools
>>> +if not get_option('seccomp').auto() or have_system or have_tools or
>>> not get_option('virtiofsd').auto()
>>>     seccomp = dependency('libseccomp', version: '>=2.3.0',
>>>                          required: get_option('seccomp'),
>>>                          method: 'pkg-config', kwargs: static_kwargs)
>>
>> This construct is wrong, both before and after, as I read it.
>>
>> not get_option(foo).auto() is true for both enabled and disabled.  If
>> disabled, why are we examining the dependency?  If auto, if we have all
>> of the dependencies we want to enable the feature -- if we don't probe
>> for the dependency, how can we enable it?
>>
>> This error seems to be offset by the OR have_* tests, for which the
>> logic also seems off.
>>
>> I think the test should have been
>>
>>   if (have_system or have_tools) and
> 
> Yes but virtiofsd is not a tool... It is a standalone binary.
> Maybe have_system is the culprit here:
> 
>   have_system = have_system or target.endswith('-softmmu')
> 
> We should somewhere add:
> 
>   have_system = have_system or something('virtiofsd')

So this hunk does fix the issue ...:

-- >8 --
--- a/meson.build
+++ b/meson.build
@@ -52,4 +52,5 @@
 endforeach
 have_tools = 'CONFIG_TOOLS' in config_host
+# virtiofsd depends on sysemu
+have_system = have_system or not get_option('virtiofsd').disabled()
 have_block = have_system or have_tools

---

> However I wonder if we aren't going to build many objects
> that are irrelevant for virtiofsd.

Based on top of
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799069.html
to remove libsoftfloat, 216 objects are required to build virtiofsd:

[216/216] Linking target tools/virtiofsd/virtiofsd

This one-line fix seems good enough (to keep virtiofsd as a 'tool').


