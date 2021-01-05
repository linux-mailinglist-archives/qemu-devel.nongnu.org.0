Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94102EA81E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 11:02:29 +0100 (CET)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwjAa-0000hp-Tm
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 05:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwj5P-00074V-JH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwj4S-0004Ml-9I
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609840566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94+B/IXc1qCmShDi1KGzCzSHd6OtPeOdYr3akAs4FmI=;
 b=P0l6saaLDIK0BJaPWgcLQs7jdlwXMqaHSdLvh9De3PuKlvsDm6qz4hkONWXEiRKQm9v72l
 haPR0fM9+GgDF6yykD94p4B15YDtKPs0lQdBQYAyMiCwxV9sjMEDtiJzAEScOhlP+xObvu
 xIkY3DFA/BPE4HkorRMf71uFmrtVG4I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-9UoPsH6kO0G_1Cnf9DdRKg-1; Tue, 05 Jan 2021 04:56:05 -0500
X-MC-Unique: 9UoPsH6kO0G_1Cnf9DdRKg-1
Received: by mail-wr1-f70.google.com with SMTP id n11so14543809wro.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=94+B/IXc1qCmShDi1KGzCzSHd6OtPeOdYr3akAs4FmI=;
 b=bolBtqxxhz6CC2ZWAi8F2bDoIhamBULzE+QWU82N6c4OelFsnWI01PGEp54d0QUsDD
 kocx6hJlGgu01WJL/SzKm6aiAhRgfRvhcKpbKIQFybvjHJ6rCkW6WSJjYIUZsUVXzNdP
 ywFxpZ90TVqSWdBkAW5kK0ipT+UaiHCTJsgv3w02BoIixX1eLzrdazdWztAMFcnwbqTi
 85ZdwHqRe3RsjBKMUyHSb/ynYMfF+09BesDfNQM+V/b8fC2u6xb3G2HjwQKj2eCHCBWW
 3J1nGg/YJmBNW5STjjGkadnfu7FwdUc/Ko4eXnhBuqIscY2dxx2TN9OON8hOyMiv1yCN
 pQPg==
X-Gm-Message-State: AOAM5324szOHHygZwU4z42ysBMnwxu777/gIqszy9u5rUxrNYv0FCGQS
 ABXlv1mb5HrfksoRvf+RBelnvcc6Nyn6M5RF+VJky3rP8jgqbhUNWNZZwai+HPv2xBCY8//sSRq
 QMjbBJPfnKkw/nLc=
X-Received: by 2002:a05:6000:1624:: with SMTP id
 v4mr70411206wrb.210.1609840563982; 
 Tue, 05 Jan 2021 01:56:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx6MV9YVmJg/YlnnHLkdOOAzS4eOfLzI6wzM0BqAMl/FmysH9mLgkDtKOOx6xR5OYXwmHvkQ==
X-Received: by 2002:a05:6000:1624:: with SMTP id
 v4mr70411191wrb.210.1609840563830; 
 Tue, 05 Jan 2021 01:56:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x13sm98636640wrp.80.2021.01.05.01.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 01:56:03 -0800 (PST)
Subject: Re: [PATCH v5 0/2] util/oslib: qemu_try_memalign() improvements
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201021173803.2619054-1-philmd@redhat.com>
 <606cf522-d23e-10aa-2bb5-61c5ba1dcdcb@linaro.org>
 <8d2d61a4-5102-bd93-b057-870eb6e805ef@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <522044f0-04a9-0298-5e48-308765e30a1a@redhat.com>
Date: Tue, 5 Jan 2021 10:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8d2d61a4-5102-bd93-b057-870eb6e805ef@linaro.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/21 01:06, Richard Henderson wrote:
> On 12/16/20 9:24 AM, Richard Henderson wrote:
>> On 10/21/20 12:38 PM, Philippe Mathieu-Daudé wrote:
>>> - Use _aligned_malloc for qemu_try_memalign on win32
>>> - Assert qemu_try_memalign() alignment is a power of 2
>>>
>>> Since v4:
>>> - Drop superfluous assert (Richard)
>>>
>>> Philippe Mathieu-Daudé (1):
>>>    util/oslib: Assert qemu_try_memalign() alignment is a power of 2
>>>
>>> Richard Henderson (1):
>>>    util/oslib-win32: Use _aligned_malloc for qemu_try_memalign
>>>
>>>   util/oslib-posix.c |  2 ++
>>>   util/oslib-win32.c | 12 +++++-------
>>>   2 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>
>> Ping.
> 
> Ping2.  Shall I just queue this to tcg-next?

Yes, just go ahead.  util/ is everybody's land, maintainers are supposed 
to know what they're doing. :)

Paolo


