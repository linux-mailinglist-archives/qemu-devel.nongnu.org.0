Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4323261FD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:27:10 +0100 (CET)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbH3-0007Mh-7a
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFbFt-0006tr-Pn
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFbFq-0006xD-D5
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614338752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCckYqUlSH1ljhgmB4RaLEUY9Cnhi6C7qhl976OYY/E=;
 b=gK9a0J8Xt6yw8fTlR4zFZWoZA8ZQhGMBOobb8x3VELrA+FFNVhM/IRK0wHg2ZLH0E8GeRR
 48eOpcXVGD2syKgmTUnDUz6EVWSVFK9gOIjGI4zKj15SS4A97s16eaav0tnvwN8Xc2U6jd
 R98I1xbX7Z59tKj8/wjCUDhvqWD2WhU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-bN1Gc9m-OQe440uVPrO4Ag-1; Fri, 26 Feb 2021 06:25:50 -0500
X-MC-Unique: bN1Gc9m-OQe440uVPrO4Ag-1
Received: by mail-wm1-f69.google.com with SMTP id r21so1635680wmq.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 03:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lCckYqUlSH1ljhgmB4RaLEUY9Cnhi6C7qhl976OYY/E=;
 b=FoR3hXIxwrLQsQDFiAq8yACOroXlp4d6/TNfVchggl2TI318hVnjkXSsEeGVj1QbiN
 H7RXz2qLCys9hGC39WvmvRcAQjxzEa3Hx1Y1l+G3BUsxqVmFhL8Yv55s31+9EOliEdwe
 BjtMifDd6eUnmilgMgwY6NhaqV2CFk6zci5szK6rL7oyQ4b8Z3AE1SWb3Y06RrmuA12S
 TobYlr7/eK1VD9BaNbUR8Sgl4vnj08dA27WZeQo/5FJFR+h1t5y3cNui7+3vACOamqzS
 J1JHqGsQOVYmlyqj64x9MYUh0MIPJgjnuTvDDRgGModAwaHoJenN0GEQTnB7AaP+3l8p
 1ERw==
X-Gm-Message-State: AOAM532mG6Sdc9xphBmOR5u7Vj6tgQQN9hIDzHT7UV+rsiOcmKqX9I5G
 LbnTkc403icqPePAJkA1AS5vqGCBxqAt/2awZFqhbBjPq5xWyxjffkML8uDHCy7AyXC1XyRiDQw
 bcap4AI89ywwJAEQ=
X-Received: by 2002:a5d:6b45:: with SMTP id x5mr2590433wrw.415.1614338749565; 
 Fri, 26 Feb 2021 03:25:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZuqEwX1r9nrMA5gPoZgI1hATCaqAcLmrVMgoPGYc0WNUXUf9l4fv9YmadIQX2mc/M9+x6cA==
X-Received: by 2002:a5d:6b45:: with SMTP id x5mr2590426wrw.415.1614338749382; 
 Fri, 26 Feb 2021 03:25:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n5sm10762272wmq.7.2021.02.26.03.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 03:25:48 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-9-pbonzini@redhat.com>
 <87zh0xo0fw.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/25] hmp: replace "O" parser with keyval
Message-ID: <5473a3ec-8c9a-07f2-f822-87a0a0f25351@redhat.com>
Date: Fri, 26 Feb 2021 12:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zh0xo0fw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 10:00, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> HMP is using QemuOpts to parse free-form commands device_add,
>> netdev_add and object_add.  However, none of these need QemuOpts
>> for validation (these three QemuOptsLists are all of the catch-all
>> kind), and keyval is already able to parse into QDict.  So use
>> keyval directly, avoiding the detour from
>> string to QemuOpts to QDict.
>>
>> The args_type now stores the implied key.  This arguably makes more
>> sense than storing the QemuOptsList name; at least, it _is_ a key
>> that might end up in the arguments QDict.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Switching from QemuOpts to keyval changes the accepted language.  We may
> change it, because HMP is not a stable interface.  The commit message
> should point out the change, though.  Maybe even release notes, not
> sure.
> 
> Let's recap the differences briefly:
> 
> * Boolean sugar: deprecated in QemuOpts, nonexistent in keyval
> 
> * QemuOpts accepts a number of more or less crazy corner cases keyval
>    rejects: invalid key, long key (silently truncated), first rather than
>    last id= wins (unlike other keys), implied key with empty value.
> 
> * QemuOpts rejects anti-social ID such as id=666, keyval leaves this to
>    the caller, because key "id" is not special in keyval.
> 
>    Are these still rejected with your patch?

Back here... No, and that's a feature.  There's no reason to reject 
those ids.  However, this shows that Kevin's series to move --object to 
keyval propagates a bug from qemu-storage-daemon to QEMU:

$ storage-daemon/qemu-storage-daemon --object 
authz-simple,id=123/546,identity=abc --chardev stdio,id=foo --monitor 
chardev=foo
 > {'execute':'qmp_capabilities'}
 > {'execute':'qom-list', 'arguments': {'path':'/objects'}}
< {"return": [{"name": "type", "type": "string"}, {"name": "123/546", 
"type": "child<authz-simple>"}]}

Good luck using that object anywhere. :)

> * device_add help,e1000
> 
>      {
>          "e1000": "on",
>          "driver": "help"
>      }
> 
>    Afterwards:
>    upstream-qemu: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

I cannot reproduce it:

$ ./qemu-system-x86_64 -M none -monitor stdio -display none
QEMU 5.2.50 monitor - type 'help' for more information
(qemu) device_add help,e1000
Error: Parameter 'driver' is missing

Paolo


