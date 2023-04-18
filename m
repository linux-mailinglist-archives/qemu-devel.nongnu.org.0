Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9646E65D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:27:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polMB-0002ck-NF; Tue, 18 Apr 2023 09:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1polMA-0002cZ-5d
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1polM8-0000C2-8b
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681824406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EqnKP7h6YrDLoTxmXi4Nebj6aTZbZjaG7DD0BDg0GCM=;
 b=XNX0P+on3+insfw0D1PR4aQFT/Q0qwaxAN8dODbzzThbW6kc37A5BUYo8ZFVFo+EOjWwCq
 swNeEHGiXC5PFzLGvazFvrmnJr731V4jxG7J0sqYoqXQLZJViJsGmYTgR0h51IY6nPUlIQ
 nXyOAk9/cNM94pvQvQyOddCG6F3P+Eo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-q0B8XuikNIOcBx9N8_cXwA-1; Tue, 18 Apr 2023 09:26:45 -0400
X-MC-Unique: q0B8XuikNIOcBx9N8_cXwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 e10-20020adfa44a000000b002f6c0c4884fso1810955wra.11
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681824404; x=1684416404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EqnKP7h6YrDLoTxmXi4Nebj6aTZbZjaG7DD0BDg0GCM=;
 b=DpxZU71kuzOdFZxJy+jjM32myBhyk2vNzgKnh684xN0hOmJe8T3CQLIjiSMvBerwP+
 msLk45YhYNOFH3UDS4zt150CGATeNpzmY3WfMlkHKJ3QX5ai3L3SE8FRjN52/WvQJBbV
 vh5UKBOnkL/iKvgTPkyNDQTAy0Gjx8kWizMW+QBDmHbqNoAFoHMoVnhIqQCRG++ImOkK
 /h58sac/KBGifqgqFfExtIPmtk5LzBnZUkF4ov1pluN8kZgL/+TKTnj4sRx/6iOaKvNY
 BrVaK0h4zwTx9R3sdIGfL/H9zaoTJ0I+pLrhe83KNA1MXJ4fLGOrIKh4IRQcUHjf9awr
 7dZA==
X-Gm-Message-State: AAQBX9dyMrayvi/qSim86GSElLvbNeEL4bV618Jigykdt2t/jb/8mkkE
 5sJ2kvTnUHwSGUhkIMdpOn7otrfuaPwRTe4C/e6p8eOaOtBIx7vMt5ONcjyM4axwK4r+4HeKQgl
 UTJhIx+RMXbGuVyA=
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id
 x21-20020a1c7c15000000b003f0b09515d9mr10382369wmc.40.1681824404072; 
 Tue, 18 Apr 2023 06:26:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350bg1gBMQL6cymDynq0Oj0GKaYifOMCO6/dTXXZ97kH/YldSDcmatOaSKc1PIXmMv0+H7VH6Nw==
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id
 x21-20020a1c7c15000000b003f0b09515d9mr10382357wmc.40.1681824403796; 
 Tue, 18 Apr 2023 06:26:43 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 e6-20020adff346000000b002efac42ff35sm13127029wrp.37.2023.04.18.06.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 06:26:43 -0700 (PDT)
Message-ID: <48500c8a-17c7-56e4-a4da-65af6f03388e@redhat.com>
Date: Tue, 18 Apr 2023 15:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
 <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
 <874jpd2z7s.fsf@secure.mitica>
 <44abaed4-465b-38c7-8d98-ed774b1dc478@redhat.com>
 <87r0sh1g62.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87r0sh1g62.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 15.19, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
>> On 18/04/2023 13.42, Juan Quintela wrote:
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>> On 12/04/2023 16.19, Juan Quintela wrote:
>>>>> Since commit:
>>>>> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
>>>>> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>> Date:   Mon Mar 6 15:26:12 2023 +0000
>>>>>        tests/migration: Tweek auto converge limits check
>>>>>        Thomas found an autoconverge test failure where the
>>>>>        migration completed before the autoconverge had kicked in.
>>>>>        [...]
>>>>> migration-test has become very slow.
>>>>> On my laptop, before that commit migration-test takes 2min10seconds
>>>>> After that commit, it takes around 11minutes
>>>>> We can't revert it because it fixes a real problem when the host
>>>>> machine is overloaded.  See the comment on test_migrate_auto_converge().
>>>>
>>>> Thanks, your patches decrease the time to run the migration-test from
>>>> 16 minutes down to 5 minutes on my system, that's a great improvement,
>>>> indeed!
>>>>
>>>> Tested-by: Thomas Huth <thuth@redhat.com>
>>> Thanks
>>>
>>>> (though 5 minutes are still quite a lot for qtests ... maybe some
>>>> other parts could be moved to only run with g_test_slow() ?)
>>> Hi
>>> Could you gime the output of:
>>> time for i in $(./tests/qtest/migration-test -l | grep "^/"); do
>>> echo $i; time ./tests/qtest/migration-test -p $i; done
>>> To see what tests are taking so long on your system?
>>> On my system (i9900K processor, i.e. not the latest) and
>>> auto_converge
>>> moved to slow the total of the tests take a bit more than 1 minute.
>>
>> This is with both of your patches applied:
...
>> real	5m32,733s
>> user	7m24,380s
>> sys	1m50,801s
> 
> Ouch.
> 
> Can I ask:
> - what is your machine?  It is specially slow?

It's a 4 year old T480s ThinkPad laptop.

>    Otherwise I want to know why it is happening.
> 
> - as what is going slow to you is postcopy, can you told me what is this
>    setting?
> 
> # we want postcopy to work for normal users
> vm.unprivileged_userfaultfd = 1

$ sysctl vm.unprivileged_userfaultfd
sysctl: cannot stat /proc/sys/vm/unprivileged_userfaultfd: No such file or 
directory

> And if it is not set, just change it and retest.

Seems like it is not available on RHEL 8 yet :-(

Shall we maybe disable the postcopy tests if unprivileged_userfaultfd is not 
available?

  Thomas



