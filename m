Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB22ED65F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:07:12 +0100 (CET)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZgl-0002C5-HO
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxZev-0001JZ-J4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:05:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxZeq-0005aV-Qf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610042710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=534aklQdQv4pdi5L7+ASDXnzFzsOrNHjcTI0kOiBI+M=;
 b=S/MC1iMz6hWRXO5CvZ1haMYBLloAhXbipqDVspiw4EmTbYrIRghzL6Fvp6nHjCOBLuQLF3
 7JeMJnq0n9lRm3+A23yfgUQ8dc3YviT0MMfCx1qM2g08uPYmZfPtdhDukVG37ak0NgSS19
 73/WvzfqTlyZPy0RKnhJz91OtkZETyc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Stiq_tncPbacJzUsNakaFg-1; Thu, 07 Jan 2021 13:05:08 -0500
X-MC-Unique: Stiq_tncPbacJzUsNakaFg-1
Received: by mail-wr1-f72.google.com with SMTP id o17so2969747wra.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=534aklQdQv4pdi5L7+ASDXnzFzsOrNHjcTI0kOiBI+M=;
 b=H2nTaQyKG+Y2iDUDbt0XLzh9kGx+YKHaLWOlnvpI+tNoe/ugt7HDE7W38fGtf6vaUL
 4X8ClNG12xnK3t1VViR8pUElFhzo19oOnOG00nYgSAabslopc5Bjgkcxc8Gx9yCElmpu
 AYy6rnKgY2nWoIeWkj3JKJaEx7OHvsxRSx0cQgqUu4caX/F82p3mzrGxu7lCdNQVWU9d
 nBBHf3fuFBo6CmNtu3sfxhh+rgfLgMETZytZrdyVWm2KBIaJ8KiUxDcjmG6hvpVjsZT5
 jwxKO5ETOMm8oKeEfKv7O+spv0EopWkp6rXPzcqlUgl/SbSX+eanuMlK+U+4krHwFxhU
 6z3g==
X-Gm-Message-State: AOAM531YNQcSS00NJ/2QjTP42JK2x82lTqZUUk4iLKZrKqXjpbOEpfW+
 +saZkz70Ah6sePH+8WstewywTs036CEKiRY/8SOjavW/qtyzrfCqSl40C+XLeNZ05SJupO2ydYZ
 D9BsXxdTbjNWl0Cg=
X-Received: by 2002:a5d:5005:: with SMTP id e5mr9798966wrt.279.1610042707719; 
 Thu, 07 Jan 2021 10:05:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkphaxTjxvdLpFtKe8JYa1K6PmR+J/cvDYpknLSLxgLq3okP7ytBGD3FJA3vekw4i+cvAzOw==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr9798954wrt.279.1610042707581; 
 Thu, 07 Jan 2021 10:05:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n189sm8828899wmf.20.2021.01.07.10.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 10:05:06 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Quality of life patches for qemu coroutine
 debugging
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217155436.927320-1-mlevitsk@redhat.com>
 <2ca49172510fc5a989a222b693f3cdcee879af07.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2a1daed5-e9cf-e356-afd0-2154c787ae6c@redhat.com>
Date: Thu, 7 Jan 2021 19:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2ca49172510fc5a989a222b693f3cdcee879af07.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 11:24, Maxim Levitsky wrote:
> On Thu, 2020-12-17 at 17:54 +0200, Maxim Levitsky wrote:
>> These are two patches that improve a bit the qemu gdb scripts in regard to
>> coroutines.
>>
>> First patch fixes a bug in 'qemu coroutine' in regard to usage on non topmost
>> stack frame.
>>
>> Second patch implements 'qemu bt' as Stefan suggested.
>>
>> V2, because after hitting 'send' I noticed a few bugs:
>>     1. Switch to try/catch around bt, so that when regular bt fails, we
>>        print the same message as original bt.
>>     2. Print the correct co-routine address
>>
>> Best regards,
>>          Maxim Levitsky
>>
>> Maxim Levitsky (2):
>>    scripts/gdb: fix 'qemu coroutine' when users selects a non topmost
>>      stack frame
>>    scripts/gdb: implement 'qemu bt'
>>
>>   scripts/qemu-gdb.py          |  1 +
>>   scripts/qemugdb/coroutine.py | 35 ++++++++++++++++++++++++++++++++++-
>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.26.2
>>
>>
>>
> Any update on this?
> Best regards,
> 	Maxim Levitsky
> 
> 

I'll queue them myself, thanks.

Paolo


