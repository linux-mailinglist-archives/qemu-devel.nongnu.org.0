Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25F31FA18
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:50:48 +0100 (CET)
Received: from localhost ([::1]:44842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6BD-00031J-Cz
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD69G-0002Is-Gc
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD69D-0003go-9h
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613742521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcuYSDuHiR7LFXTFRU40q6VuxFLpvEBsNjpaeBgFNxs=;
 b=LjF8sdFGLmzqn8SzkJ7FHb5S4RUU3XnVFWlF4tapwuZOKt0D0hMGQLv1/qT4xRwoVZqhbG
 38oOjBnyiAPbhU9p1B7ikLEioyJVnD+E7PDmNV3wsTC9v+pLhagRBN81owoTej4gqSr8l6
 h9NcSSq7Hx+GfV9fhJpHyZdeRe/C6ZU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-ytJOkl-zNMq44lpnc1HT5Q-1; Fri, 19 Feb 2021 08:48:37 -0500
X-MC-Unique: ytJOkl-zNMq44lpnc1HT5Q-1
Received: by mail-wr1-f72.google.com with SMTP id e13so2474406wrg.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tcuYSDuHiR7LFXTFRU40q6VuxFLpvEBsNjpaeBgFNxs=;
 b=rR3AEIZd7+MV1IZ0pMVwlL/WPhv4H8jDmZ43CH7lzRfE7MIAGG/QJYVb7p0RAzJoOo
 PmdTtfjbFgkjpM8AMstzDmA67dzddbpHz+DfuzdFLmGYgaqn7QQp8mZYC3vojzNjqKNq
 QL0ZBJNU+05+xoVyVqVOlIDL5WaLOK29MsG7YtYw/sssP1nsayEbNj/ptSWwusgeA7XK
 yWIRgnpIoZ2vL6br9W9exICA+Dyp20i0P6OQ4uo6c8Lg3ShikjQAR+S3Fjh75Tl5sDY5
 x//HxXUbDDRpD7Nt2Ae6VRb+x0JRhfS8HGMVl9+EtaycrfCZtPQKLGXsPnqDgMPa7JMN
 iVZg==
X-Gm-Message-State: AOAM532QhBCElOEerV1uVRNtj5ubLH3guIvCHKq6EOE8x495SfJXC2cO
 RqFLtNgegYnRVcwrAkqc/N6VN1Z8VumjfuUhgF/LJnuy1mssuRWfX2pjxcg6+SXundQdy0vYL5r
 O+pNACkeMl5Be6g2+SK1BdfY45b54dahWmCFPRPpBBnEM0Yr2Mb61SzWUQuz35/Wb
X-Received: by 2002:adf:fbce:: with SMTP id d14mr8813822wrs.44.1613742516299; 
 Fri, 19 Feb 2021 05:48:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj5zFVOCK0c2xdwqKKLwXROHnYyIuXuyoJk+hhDZbAhkOD9km3GGpAkeIVDRwQwte+dMvJRA==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr8813809wrs.44.1613742516113; 
 Fri, 19 Feb 2021 05:48:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm11947789wmb.33.2021.02.19.05.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 05:48:35 -0800 (PST)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
 <008512eb-9b60-9d1f-4599-ad712574da80@redhat.com>
 <7a465ccb-a2f9-9293-d0d4-dd4cc65bfb8d@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98a91214-1058-706c-1991-fc0b6fe7fb1c@redhat.com>
Date: Fri, 19 Feb 2021 14:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7a465ccb-a2f9-9293-d0d4-dd4cc65bfb8d@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 2:17 PM, Claudio Fontana wrote:
> On 2/19/21 2:14 PM, Philippe Mathieu-Daudé wrote:
>> On 2/19/21 2:04 PM, Claudio Fontana wrote:
>>> Hi Paolo,
>>>
>>> currently we have use of CONFIG_TCG in tests/,
>>>
>>> but is that variable available at all in there?
>>>
>>> I have to adapt some qemu/tests/qtest/* to work also without tcg for ARM,
>>>
>>> but I think I am not seeing CONFIG_TCG filtering through, and I wonder whether all the checks in there are actually "wrong".
>>
>> Checking for ./configure definitions in tests is probably wrong,
>> it should be done via binary introspection (ask the binary if it
>> has the feature enabled).
>>
> 
> How are we going to launch with the correct qemu options in qtest/bios-tables-test.c and qtest/boot-serial-tests.c ?

Isn't it what was recently discussed here?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg779881.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg779868.html

> 
> I mean I agree with your sentiment, but it does not solve the problem..
> 
> Ciao,
> 
> Claudio
> 


