Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D13A9BA2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:52 +0200 (CEST)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVGp-0003Nn-LT
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltVDy-0007Ps-Or
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltVDs-00014b-6B
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623848686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5X7Mz2mpP2DNAABUhBSNYWUp6JApZwYa0f6E/NyCwg=;
 b=RxUeBHy14uCi7p0ca3foOglUHdMhrmETMxxEgxsYqUfPyd3+RI7x68SNLhKx36B3YQ0CP+
 1eMfgcURnJzXObJnLxaiGx99o1u8b8qKUk9Z03nhcPcIk7qdrLOfYrEZqmNilRcJM8RgE6
 PcnqOeGKaE2ofyZWImi2ActjhMTM5u4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-ODF8_0VTM46nAK_85Dxweg-1; Wed, 16 Jun 2021 09:04:43 -0400
X-MC-Unique: ODF8_0VTM46nAK_85Dxweg-1
Received: by mail-ed1-f69.google.com with SMTP id
 x8-20020aa7d3880000b029038fe468f5f4so971370edq.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i5X7Mz2mpP2DNAABUhBSNYWUp6JApZwYa0f6E/NyCwg=;
 b=HtNdt7zxLbrxVB/vVEKwIw/tJfPgNAKyrECZfuCNONpvXnP8qiaOSIAaOhqBLZHM7Y
 /ahI0p56cMu9mX/vmYS5jaby2RumN4oWjrSThj4XbIAvgHtcNh85dIbrKJeNmzjGyvDC
 KOUgzCH5/FNAa4ALNptSr5ILyGjxufPt5Wi2TsAp2f9bURrq6utwto/cs/Hcfk5FEIiG
 /DWh2pz8Al7FZUwNHmC4dG/Kv8lBRP9Pr2s1H3sXAb609stEVpNZ7F/eObfT26y+TNsl
 HP14hpb4grPM/FJwbQJvtKpEPi7j80B22wZK+qkDAezkF97zr0tzcwyeG0DB3PL1Z4rH
 V8TA==
X-Gm-Message-State: AOAM533e3VoGqhaAq9Pqpq5YkxXV4+V6+w9FFefNGVG1/DtMVGkEp1kc
 zChXR0t4vFQ/O9aWutwlUkhHJuxgEmnjCJzHc1xaWBTSoqaYWtrK3kBEIQg8e/RnzSv97HqcxQx
 BIHW/72pq15FYug4=
X-Received: by 2002:a17:906:d297:: with SMTP id
 ay23mr5195301ejb.418.1623848682457; 
 Wed, 16 Jun 2021 06:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWyCzrum335izJuMMdRcCgAD6t7FPWr+StKwn7VLVjDJOA4yizZpyNGNAhYPEnspNafrhvXQ==
X-Received: by 2002:a17:906:d297:: with SMTP id
 ay23mr5195289ejb.418.1623848682292; 
 Wed, 16 Jun 2021 06:04:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gz12sm1151625ejc.36.2021.06.16.06.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:04:41 -0700 (PDT)
Subject: Re: [PATCH v2 0/8] configure: Change to -std=gnu11
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6f2f7e2-f0fc-4a14-4718-849d1d54b4a8@redhat.com>
Date: Wed, 16 Jun 2021 15:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/21 01:31, Richard Henderson wrote:
> Now that we assume gcc 7.5 as a minimum, we have the option of
> changing to a newer C standard.  The two major new features that
> I think apply are _Generic and _Static_assert.
> 
> While Paolo created a remarkably functional replacement for _Generic
> using builtins, the error messages that you get out of the keyword
> are *vastly* more intelligable, and the syntax is easier to read.
> 
> While I'd like to prefer _Static_assert over QEMU_BUILD_BUG_ON
> going forward, and would like to convert existing uses, that is
> a much bigger job.  Especially since the test condition is inverted.
> In the meantime, can drop the configure detection.
> 
> Changes for v2:
>    * Remove QEMU_LOCK_FUNC and QEMU_UNLOCK_FUNC as unused.
> 
> 
> r~
> 
> 
> Richard Henderson (8):
>    configure: Use -std=gnu11
>    softfloat: Use _Generic instead of QEMU_GENERIC
>    util: Use real functions for thread-posix QemuRecMutex
>    util: Pass file+line to qemu_rec_mutex_unlock_impl
>    util: Use unique type for QemuRecMutex in thread-posix.h
>    include/qemu/lockable: Use _Generic instead of QEMU_GENERIC
>    qemu/compiler: Remove QEMU_GENERIC
>    configure: Remove probe for _Static_assert
> 
>   configure                   | 22 +--------
>   meson.build                 |  2 +-
>   include/qemu/compiler.h     | 51 ---------------------
>   include/qemu/lockable.h     | 90 +++++++++++++++++--------------------
>   include/qemu/thread-posix.h | 14 +++---
>   include/qemu/thread-win32.h |  6 ---
>   include/qemu/thread.h       | 15 ++++++-
>   fpu/softfloat.c             | 16 ++++---
>   util/qemu-thread-posix.c    | 24 +++++++++-
>   util/qemu-thread-win32.c    |  2 +-
>   10 files changed, 98 insertions(+), 144 deletions(-)
> 

Queued, thanks.

Paolo


