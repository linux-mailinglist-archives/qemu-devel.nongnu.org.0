Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED822FD228
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:01:33 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2E3A-0005iT-Hv
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2E01-0003h2-7V
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Dzz-0005DT-4t
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611151094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/SP4qWt31pePve99D/KUe0lL6o6BgJRYYa9kYV2RC0=;
 b=C5fnlvuFf8aUCUiVg2+KbY+mAbZxsDLM5o93UIe4Ig2JSRowS4vfa/K2JghGAqimUP201F
 EaARDvBih52XCk90vCIelq1tB3KUXsh7jAw7bCrW9M4Tvrc1leBj+6cnDt38Nn2siG/jYp
 psbNWZLmNDf1X7MNZDgw+0hnmYj00XA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-nxCNKGo3MRqj-g7AN313Cw-1; Wed, 20 Jan 2021 08:58:12 -0500
X-MC-Unique: nxCNKGo3MRqj-g7AN313Cw-1
Received: by mail-ed1-f72.google.com with SMTP id k5so11072863edk.15
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 05:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/SP4qWt31pePve99D/KUe0lL6o6BgJRYYa9kYV2RC0=;
 b=bNXmJQfAc5c40qH9Hrk7vBSpGXhIN81atnZc7TJA9lallb6LGnBvV+cUDynKl9BmHO
 QyXt95ukQE0+3C5sOZssV8yNzly38+EK/Nddi03vQJR0W8zDX/xjyLrKpuXnMZnz+ll1
 dtGMEem285QFePxegkV+zAKlB+wR+X54X715rD/gVXg0kDZ13z8S8nv1RPnZiIwaXaNk
 8wVmnzfc0zYhgRbPM+j14yJJrON+b4aXtV5+cMTUbWX80mQYSESS5rj8TgpvR8xzx7e5
 qZcYRPYTVzrfjZJOx+NqXasipwNAD/fzgTEB+rNPOvJAICZgciE6YSvYhC2K8/SUuyYq
 SZUg==
X-Gm-Message-State: AOAM533T7qliKsGVQTuM5cgESIIyukbDfoCm0zYsXYcCRf/5H9xwf3zf
 raQu1ZFU80DPE4ecXyoSm6sZJ54T6PMcbbC3f40cW8mXwSDuaUtvWpbTqLbahzofonGVylklC77
 pLk3lghKDQU5itUkcXt4VoHW2G0Vlfalqx3/vYqwOed4vltXKnMKCq8QFawO0czhe
X-Received: by 2002:a17:906:4348:: with SMTP id
 z8mr6272625ejm.371.1611151090754; 
 Wed, 20 Jan 2021 05:58:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwPO38VVs+LtnjxsiWRX3c99LHGOSH2PzA/AiVWiiD3DYVeu82HWIHZvNFgdrZmODkPFnDJg==
X-Received: by 2002:a17:906:4348:: with SMTP id
 z8mr6272608ejm.371.1611151090477; 
 Wed, 20 Jan 2021 05:58:10 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bl13sm939537ejb.64.2021.01.20.05.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 05:58:09 -0800 (PST)
Subject: Re: How to run crypto benchmarks tests?
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <c72a38ac-d164-9357-4eda-2334c496c555@redhat.com>
 <20210120130624.GI3015589@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5a7feef9-fc27-c72f-ea59-5f45ddfc5c83@redhat.com>
Date: Wed, 20 Jan 2021 14:58:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120130624.GI3015589@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 2:06 PM, Daniel P. Berrangé wrote:
> On Wed, Jan 20, 2021 at 01:50:48PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Using the following "build tools and doc" config:
>>
>> ../configure --disable-system --disable-user
>>                                  ...
>>                      TLS priority: "NORMAL"
>>                    GNUTLS support: YES
>>                         libgcrypt: NO
>>                            nettle: YES
>>                               XTS: YES
>>                          libtasn1: YES
>>                               PAM: YES
>>                                  ...
>>
>> $ make check-help
>> ...
>>  make check-speed          Run qobject speed tests
>> ...
>> Test targets:
>>   check                          - Run all tests (check-help for details)
>>   bench                          - Run all benchmarks
>>   docker                         - Help about targets running tests
>> inside containers
>>
>> $ make check-speed
>> make: *** No rule to make target 'bench-speed', needed by 'check-speed'.
>>  Stop.
>> $ make bench-speed
>> make: *** No rule to make target 'bench-speed'.  Stop.
>> $ make check-bench
>> make: *** No rule to make target 'check-bench'.  Stop.
>> $ make bench
>> make: Nothing to be done for 'bench'.
>>
>> I want to run these tests:
>>
>> $ ls -1 tests/test-crypto-*c
>> tests/test-crypto-afsplit.c
>> tests/test-crypto-block.c
>> tests/test-crypto-cipher.c
>> tests/test-crypto-hash.c
>> tests/test-crypto-hmac.c
>> tests/test-crypto-ivgen.c
>> tests/test-crypto-pbkdf.c
>> tests/test-crypto-secret.c
>> tests/test-crypto-tlscredsx509.c
>> tests/test-crypto-tlssession.c
>> tests/test-crypto-xts.c
> 
> These aren't benchmarks - they're regular unit tests - eg make check-unit 
> 
> The benchmarks are tests/benchmark-crypto*.c

Oops indeed. I want to run both to be sure.

> Either way, all of this is surrounded by 'if have_block' in tests/meson.build
> which should apply if you have tools enabled or system emulators enabled.

That helped:

                      block layer: NO

I'll see why the tools are not automatically selected.

Thanks,

Phil.


