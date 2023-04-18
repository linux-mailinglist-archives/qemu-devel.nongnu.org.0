Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137FF6E65B7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:21:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polFG-0005Wa-UZ; Tue, 18 Apr 2023 09:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1polFF-0005WS-A8
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1polFD-0006z9-8I
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681823978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BRcwK3LGftIiRvxYtuR+hNVee3w2/XgBz/4FNtUuJWw=;
 b=Cwv8FtLFqZwzvbERAY4+NR9VR3TqcJENmdUhaPQExizO86/uV2sR03Xv4v7dbI0B49U/xL
 9yd8U16DGdK+gvFY60PbJGXoXJ3KBAad+E5EOkuyZ8UCdFBlbqAFXsl6x2wv3mp/A6lHZp
 GMnf8z/K5/1CDIYPWnOnhmyZkJH00pg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-REJfHI3JOGqNqSjaMci7XA-1; Tue, 18 Apr 2023 09:19:36 -0400
X-MC-Unique: REJfHI3JOGqNqSjaMci7XA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f08ed462c0so40188565e9.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681823975; x=1684415975;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BRcwK3LGftIiRvxYtuR+hNVee3w2/XgBz/4FNtUuJWw=;
 b=BYmKip7ftT+SJBG33xWoOOWyXiYWmzWd/u+KgHBko3faI+SkEUlvBuikJ/QQuuqfT4
 FUkfUlGjEHp3/YpI+BuSmJLBT+hv2txvopEJn0FDFIxI/b2zfbwCmhg/L/T/tp0hZOMc
 U32Ypd2Pzdw5sx4ReZ9PXMtHklYf5maNujvlbW/QmuFe3mc4c6b4AQ5FmAgMf8GIyAFx
 W3BgXeg9v3BHiZwdXXinHXflJtTubJRYlFHryWfV4dkIzfWwQ5OIb5BoKaOYJ10mFLLP
 wDQZb/mMMc90n2rbj0zhI0MW66OcpGMLBHe2c5PnR5YApdZPVr87MQYDf+jTmelQwW1/
 nMUQ==
X-Gm-Message-State: AAQBX9dOYZZVsRk8xsqzEVRwcF7SEa+heGaD+ocxdvgbw7cph5Rf3OK4
 Ao6bhWvcbSUU+8vzjinQ8NMxqvftccq5hZxqCixRE8WtBqTRij4TgKp2I9FvAXXAw9bZoK2+WJT
 OHF6921Nm0Yt7Wnw=
X-Received: by 2002:a05:6000:1188:b0:2ef:e73d:605d with SMTP id
 g8-20020a056000118800b002efe73d605dmr1844653wrx.30.1681823975408; 
 Tue, 18 Apr 2023 06:19:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZaapfqitIAycEhMWuL9iL+pdV2ifrt6iFIobdqyhg7GadS9O/5UimRmjYZgunAF9bMz5nPOQ==
X-Received: by 2002:a05:6000:1188:b0:2ef:e73d:605d with SMTP id
 g8-20020a056000118800b002efe73d605dmr1844636wrx.30.1681823975068; 
 Tue, 18 Apr 2023 06:19:35 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003f09e294d5esm18601783wmb.6.2023.04.18.06.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 06:19:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
In-Reply-To: <44abaed4-465b-38c7-8d98-ed774b1dc478@redhat.com> (Thomas Huth's
 message of "Tue, 18 Apr 2023 14:44:54 +0200")
References: <20230412142001.16501-1-quintela@redhat.com>
 <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
 <874jpd2z7s.fsf@secure.mitica>
 <44abaed4-465b-38c7-8d98-ed774b1dc478@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 18 Apr 2023 15:19:33 +0200
Message-ID: <87r0sh1g62.fsf@secure.mitica>
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
> On 18/04/2023 13.42, Juan Quintela wrote:
>> Thomas Huth <thuth@redhat.com> wrote:
>>> On 12/04/2023 16.19, Juan Quintela wrote:
>>>> Since commit:
>>>> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
>>>> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Date:   Mon Mar 6 15:26:12 2023 +0000
>>>>       tests/migration: Tweek auto converge limits check
>>>>       Thomas found an autoconverge test failure where the
>>>>       migration completed before the autoconverge had kicked in.
>>>>       [...]
>>>> migration-test has become very slow.
>>>> On my laptop, before that commit migration-test takes 2min10seconds
>>>> After that commit, it takes around 11minutes
>>>> We can't revert it because it fixes a real problem when the host
>>>> machine is overloaded.  See the comment on test_migrate_auto_converge().
>>>
>>> Thanks, your patches decrease the time to run the migration-test from
>>> 16 minutes down to 5 minutes on my system, that's a great improvement,
>>> indeed!
>>>
>>> Tested-by: Thomas Huth <thuth@redhat.com>
>> Thanks
>> 
>>> (though 5 minutes are still quite a lot for qtests ... maybe some
>>> other parts could be moved to only run with g_test_slow() ?)
>> Hi
>> Could you gime the output of:
>> time for i in $(./tests/qtest/migration-test -l | grep "^/"); do
>> echo $i; time ./tests/qtest/migration-test -p $i; done
>> To see what tests are taking so long on your system?
>> On my system (i9900K processor, i.e. not the latest) and
>> auto_converge
>> moved to slow the total of the tests take a bit more than 1 minute.
>
> This is with both of your patches applied:


> /x86_64/migration/postcopy/plain
> /x86_64/migration/postcopy/plain: OK
>
> real	0m35,446s
> user	0m47,208s
> sys	0m11,828s

This is quite slower than on mine, basically almost all the code that
does migration.

$ time ./tests/qtest/migration-test -p /x86_64/migration/postcopy/plain
# random seed: R02S42809b71f513e8524bd24df5facd5768
# Start of x86_64 tests
# Start of migration tests
# Start of postcopy tests
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-246853.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-246853.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 150M -serial file:/tmp/migration-test-1MGL31/src_serial -drive file=/tmp/migration-test-1MGL31/bootsect,format=raw    -accel qtest
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-246853.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-246853.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 150M -serial file:/tmp/migration-test-1MGL31/dest_serial -incoming unix:/tmp/migration-test-1MGL31/migsocket -drive file=/tmp/migration-test-1MGL31/bootsect,format=raw    -accel qtest
ok 1 /x86_64/migration/postcopy/plain
# End of postcopy tests
# End of migration tests
# End of x86_64 tests
1..1

real	0m1.104s
user	0m0.697s
sys	0m0.414s





> /x86_64/migration/postcopy/recovery/plain
> /x86_64/migration/postcopy/recovery/plain: OK
>
> real	0m34,707s
> user	0m46,357s
> sys	0m11,366s
> /x86_64/migration/postcopy/recovery/tls/psk
> /x86_64/migration/postcopy/recovery/tls/psk: OK
>
> real	0m33,052s
> user	0m46,539s
> sys	0m11,537s
> /x86_64/migration/postcopy/preempt/plain
> /x86_64/migration/postcopy/preempt/plain: OK
>
> real	0m35,107s
> user	0m46,556s
> sys	0m11,755s
> /x86_64/migration/postcopy/preempt/recovery/plain
> /x86_64/migration/postcopy/preempt/recovery/plain: OK
>
> real	0m35,329s
> user	0m46,951s
> sys	0m11,529s
> /x86_64/migration/postcopy/preempt/recovery/tls/psk
> /x86_64/migration/postcopy/preempt/recovery/tls/psk: OK
>
> real	0m36,237s
> user	0m51,450s
> sys	0m12,419s
> /x86_64/migration/postcopy/preempt/tls/psk
> /x86_64/migration/postcopy/preempt/tls/psk: OK
>
> real	0m35,033s
> user	0m49,244s
> sys	0m12,123s
> /x86_64/migration/postcopy/tls/psk
> /x86_64/migration/postcopy/tls/psk: OK
>
> real	0m36,097s
> user	0m50,873s
> sys	0m12,569s


> real	5m32,733s
> user	7m24,380s
> sys	1m50,801s

Ouch.

Can I ask:
- what is your machine?  It is specially slow?
  Otherwise I want to know why it is happening.

- as what is going slow to you is postcopy, can you told me what is this
  setting?

# we want postcopy to work for normal users
vm.unprivileged_userfaultfd = 1

And if it is not set, just change it and retest.

Thanks, Juan.


