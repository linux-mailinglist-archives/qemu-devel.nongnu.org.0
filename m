Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781F6E6022
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:44:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojje-0004Tw-O3; Tue, 18 Apr 2023 07:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pojjc-0004Tl-Ef
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pojjY-0002Fq-Ck
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681818171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LnuuI8iOTDhB4zduZNjfMYjr0ysuSwUR/uJeZakDzzo=;
 b=RoZAyazH+eEURn/NdNzOPktz1e416VQsEYKKllK7zrFeFk4lXidQdzJVwwdloiIA5Edhwz
 ili6F3pbsp53sYkLrrrXDQH62HPw6QtaKNXgSWKj3pEOnrwkKQXPjToyMOQConTf+GXNn4
 8RkWUXkN9Cxf+cV/IhWETrwd3mCuh+k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-GKl9IETgNmuHW7VEE_bWJg-1; Tue, 18 Apr 2023 07:42:50 -0400
X-MC-Unique: GKl9IETgNmuHW7VEE_bWJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f08ed462c0so38746225e9.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818169; x=1684410169;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnuuI8iOTDhB4zduZNjfMYjr0ysuSwUR/uJeZakDzzo=;
 b=frnt5OMqcTuoVmjAMknoenys9bhEdRUcNhZMwpuvCe9Az4zPj6DXGoUVEt7XtM5eCx
 StfuDMVAcSnMQVwZQx61VpSpV/F4JKyaSROQ4RMH145tv7lX5Jh7fyV3swywKb+pSCr6
 3XyMyp3IfH3H2EN4tiP0HoRBTIAz694aNikPVvGw5I6Jy2W7MJnLJkcmhkN2OthprU0f
 Z73ADTm+wD8x4C/CAMjyoKJDr2BJg06A12I8Z5VrsnXmLH4YtgOEWt5CjpSmHje7OA0M
 O929bqJu84KvE9GV/BhDPgSYsdU5ClQjX17c+ibFaMchHsNju8Q0rS210n+hN2dW+Jsn
 Nx8A==
X-Gm-Message-State: AAQBX9f5sQwYBRNPkToBer2ZzYETdlIGYR4lVKxwfskJMRXTzuaKdr98
 M8r3pSh5YRMj/e2GdoXw56IUGopdNjAMJ2WqkoHM0wvbV4Alr4cSzpP0sddHAsHZLlntbRzuMN/
 r2L9Dtb2NAaaaP9M=
X-Received: by 2002:a5d:4e0f:0:b0:2f7:d375:5c10 with SMTP id
 p15-20020a5d4e0f000000b002f7d3755c10mr1660252wrt.11.1681818169026; 
 Tue, 18 Apr 2023 04:42:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJqJ/OAQ6ceD4cQXTM5Sc6QROxVa7oz0dGjOM1j5p5buMCMhDvCHaE+OGXsbBPgj5DW169UA==
X-Received: by 2002:a5d:4e0f:0:b0:2f7:d375:5c10 with SMTP id
 p15-20020a5d4e0f000000b002f7d3755c10mr1660240wrt.11.1681818168686; 
 Tue, 18 Apr 2023 04:42:48 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 i4-20020a5d55c4000000b002f74578f494sm10523868wrw.41.2023.04.18.04.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 04:42:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
In-Reply-To: <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com> (Thomas Huth's
 message of "Tue, 18 Apr 2023 12:59:42 +0200")
References: <20230412142001.16501-1-quintela@redhat.com>
 <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 18 Apr 2023 13:42:47 +0200
Message-ID: <874jpd2z7s.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> wrote:
> On 12/04/2023 16.19, Juan Quintela wrote:
>> Since commit:
>> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
>> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Date:   Mon Mar 6 15:26:12 2023 +0000
>>      tests/migration: Tweek auto converge limits check
>>      Thomas found an autoconverge test failure where the
>>      migration completed before the autoconverge had kicked in.
>>      [...]
>> migration-test has become very slow.
>> On my laptop, before that commit migration-test takes 2min10seconds
>> After that commit, it takes around 11minutes
>> We can't revert it because it fixes a real problem when the host
>> machine is overloaded.  See the comment on test_migrate_auto_converge().
>
> Thanks, your patches decrease the time to run the migration-test from
> 16 minutes down to 5 minutes on my system, that's a great improvement,
> indeed!
>
> Tested-by: Thomas Huth <thuth@redhat.com>

Thanks

> (though 5 minutes are still quite a lot for qtests ... maybe some
> other parts could be moved to only run with g_test_slow() ?)

Hi

Could you gime the output of:

time for i in $(./tests/qtest/migration-test -l | grep "^/"); do echo $i; time ./tests/qtest/migration-test -p $i; done

To see what tests are taking so long on your system?

On my system (i9900K processor, i.e. not the latest) and auto_converge
moved to slow the total of the tests take a bit more than 1 minute.

qemu-system-x86_64 on x86_64 host:
real	0m54.295s
user	0m47.283s
sys	0m16.969s

qemu-system-aarch64 on x86_64 host:

real	0m42.466s
user	0m42.247s
sys	0m13.747s

s390x and ppc64 refuse to run non-natively.

Later, Juan.


